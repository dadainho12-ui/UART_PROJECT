# Native Tcl only: usable inside Innovus or with tclsh, without Python.
proc uart_read_file {path} {
    set ch [open $path r]
    set data [read $ch]
    close $ch
    return $data
}
proc uart_prepare_pnr {dir} {
    set source_file [file join $dir ../SYN/mapped/asic_top_syn_final.v]
    set original [uart_read_file $source_file]
    if {[regexp -all {\mmodule\s+asic_top\s*\(} $original] != 1} {
        error "Expected exactly one asic_top module in $source_file"
    }
    regexp -indices {\mmodule\s+asic_top\s*\(} $original top
    set start [lindex $top 0]
    if {![regexp -indices -start $start {\mendmodule\M} $original ending]} {
        error "asic_top has no endmodule"
    }
    set insert_at [lindex $ending 0]
    set body [string range $original $start [expr {$insert_at - 1}]]
    set expected [dict create]
    set inputs 0
    set signals [regexp -all -inline {\m(PADDI|PADDO)\s+(\\\S+|[A-Za-z_]\w*)\s*\(} $body]
    foreach {match cell name} $signals {
        set name [string trimleft $name "\\"]
        if {[dict exists $expected $name]} { error "Duplicate signal pad: $name" }
        dict set expected $name $cell
        if {$cell eq "PADDI"} { incr inputs }
    }
    if {[dict size $expected] != 25 || $inputs != 12} {
        error "Expected 12 input and 13 output signal pads"
    }
    set additions [uart_read_file [file join $dir add_pad]]
    regsub -all {//[^\n]*} $additions {} declarations
    set pattern {\m(PADVDD|PADVSS|PADVDDIOR|PADVSSIOR)\s+(\w+)\s*\(\s*\)\s*;}
    set power [regexp -all -inline $pattern $declarations]
    regsub -all $pattern $declarations {} remaining
    if {[string trim $remaining] ne "" || [llength $power] != 48} {
        error "Expected 16 power pad declarations in add_pad"
    }
    foreach {match cell name} $power {
        if {[dict exists $expected $name] || [string first "${name}(" $body] >= 0} {
            error "Duplicate/already existing power pad: $name"
        }
        dict set expected $name $cell
    }
    foreach side {left right top bottom} {
        foreach {suffix cell} {vdd PADVDD vss PADVSS vddior PADVDDIOR vssior PADVSSIOR} {
            set name u_${side}_${suffix}
            if {![dict exists $expected $name] || [dict get $expected $name] ne $cell} {
                error "Missing/wrong power pad: $name"
            }
        }
    }
    foreach corner {TL TR BL BR} { dict set expected CORNER_$corner padIORINGCORNER }
    set io [uart_read_file [file join $dir init.io]]
    set actual [dict create]
    foreach {match name cell} [regexp -all -inline {\(inst\s+name="([^"]+)"\s+cell="([^"]+)"} $io] {
        if {[dict exists $actual $name]} { error "Duplicate IO pad: $name" }
        dict set actual $name $cell
    }
    if {[dict size $actual] != [dict size $expected]} { error "IO pad count mismatch" }
    dict for {name cell} $expected {
        if {![dict exists $actual $name] || [dict get $actual $name] ne $cell} {
            error "IO/netlist mapping mismatch: $name ($cell)"
        }
    }
    set result [string range $original 0 [expr {$insert_at - 1}]]
    append result "\n// PNR-only power pad additions\n" $additions "\n" [string range $original $insert_at end]
    file mkdir [file join $dir generated]
    set output [file join $dir generated asic_top_pnr.v]
    if {![file exists $output] || [uart_read_file $output] ne $result} {
        set ch [open $output w]
        puts -nonewline $ch $result
        close $ch
    }
    puts "PASS: 25 signal pads + 16 power pads + 4 physical corners; IO mapping matches"
    puts "PNR netlist: $output"
}
uart_prepare_pnr [file dirname [file normalize [info script]]]
