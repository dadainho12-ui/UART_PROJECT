# Generate a local physical view for the UART's perimeter power-pad use case.
# Never edits the installed PDK. Changes are limited to the two supply-pad
# macro classes and their primary supply PORT classification for sroute.
proc uart_read_io_lef {path} {
    set ch [open $path r]
    fconfigure $ch -translation binary -encoding binary
    set value [read $ch]
    close $ch
    return $value
}
proc uart_core_supply_port {block cell pin} {
    set begin_re [format {(?m)^[ \t]*PIN[ \t]+%s[ \t]*\r?$} $pin]
    set end_re [format {(?m)^[ \t]*END[ \t]+%s[ \t]*\r?$} $pin]
    if {[regexp -all $begin_re $block] != 1} {error "Expected one $cell/$pin pin"}
    regexp -indices $begin_re $block begin
    set start [lindex $begin 0]
    if {![regexp -indices -start [expr {[lindex $begin 1]+1}] $end_re $block ending]} {
        error "Missing END for $cell/$pin"
    }
    set end [lindex $ending 1]
    set body [string range $block $start $end]
    if {[regexp -all {(?m)^[ \t]*USE[ \t]+(POWER|GROUND)[ \t]*;[ \t]*\r?$} $body] != 1} {
        error "Expected a POWER/GROUND primary supply pin: $cell/$pin"
    }
    set ports [regexp -all -inline -indices {(?m)^[ \t]*PORT[ \t]*\r?$} $body]
    if {[llength $ports] == 0} {error "No PORT found in $cell/$pin"}
    set classes [regexp -all {(?m)^[ \t]*CLASS[ \t]+} $body]
    set core_classes [regexp -all {(?m)^[ \t]*CLASS[ \t]+CORE[ \t]*;[ \t]*\r?$} $body]
    if {$classes == 0} {
        # Reverse order preserves earlier indices. Preserve LF/CRLF and every shape.
        foreach range [lreverse $ports] {
            lassign $range first last
            set line [string range $body $first $last]
            regexp {^([ \t]*)} $line ignored indent
            set cr ""
            if {[string index $line end] eq "\r"} {set cr "\r"}
            set body [string replace $body $first $last "$line\n${indent}  CLASS CORE ;$cr"]
        }
    } elseif {$classes != [llength $ports] || $core_classes != $classes} {
        error "Unexpected/mixed PORT class in $cell/$pin; inspect instead of overwriting it"
    }
    return [string replace $block $start $end $body]
}
proc uart_prepare_io_lef {source_path output_path} {
    if {[file normalize $source_path] eq [file normalize $output_path]} {
        error "Refusing to overwrite the original IO LEF"
    }
    set result [uart_read_io_lef $source_path]
    foreach cell {PADVDD PADVSS} {
        set begin_re [format {(?m)^[ \t]*MACRO[ \t]+%s[ \t]*\r?$} $cell]
        set end_re [format {(?m)^[ \t]*END[ \t]+%s[ \t]*\r?$} $cell]
        if {[regexp -all $begin_re $result] != 1} {error "Expected exactly one MACRO $cell"}
        regexp -indices $begin_re $result begin
        set start [lindex $begin 0]
        if {![regexp -indices -start [expr {[lindex $begin 1]+1}] $end_re $result ending]} {
            error "Missing END $cell"
        }
        set end [lindex $ending 1]
        set block [string range $result $start $end]
        if {[regexp -all {(?m)^[ \t]*SITE[ \t]+IOSite[ \t]*;[ \t]*\r?$} $block] != 1} {
            error "Unexpected site for $cell; inspect the installed LEF"
        }
        set area_re {(?m)^([ \t]*CLASS[ \t]+PAD[ \t]+)AREAIO([ \t]*;[ \t]*\r?$)}
        set power_re {(?m)^[ \t]*CLASS[ \t]+PAD[ \t]+POWER[ \t]*;[ \t]*\r?$}
        if {[regexp -all $area_re $block] == 1 && [regexp -all $power_re $block] == 0} {
            regsub $area_re $block {\1POWER\2} block
        } elseif {[regexp -all $power_re $block] != 1 || [regexp -all $area_re $block] != 0} {
            error "Unexpected CLASS for $cell; expected PAD AREAIO or PAD POWER"
        }
        if {$cell eq "PADVDD"} {set primary_pin VDD} else {set primary_pin VSS}
        set block [uart_core_supply_port $block $cell $primary_pin]
        set result [string replace $result $start $end $block]
    }
    file mkdir [file dirname $output_path]
    if {![file exists $output_path] || [uart_read_io_lef $output_path] ne $result} {
        set ch [open $output_path w]
        fconfigure $ch -translation binary -encoding binary
        puts -nonewline $ch $result
        close $ch
    }
    puts "PNR IO LEF: $output_path (PADVDD/PADVSS PAD POWER; VDD/VSS primary PORT CLASS CORE; source PDK unchanged)"
    return $output_path
}
