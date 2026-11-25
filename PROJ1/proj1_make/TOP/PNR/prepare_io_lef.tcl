# Generate a local physical view for the UART's perimeter power-pad use case.
# Never edits the installed PDK. Only PADVDD/PADVSS CLASS tokens may change.
proc uart_read_io_lef {path} {
    set ch [open $path r]
    fconfigure $ch -translation binary -encoding binary
    set value [read $ch]
    close $ch
    return $value
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
        set result [string replace $result $start $end $block]
    }
    file mkdir [file dirname $output_path]
    if {![file exists $output_path] || [uart_read_io_lef $output_path] ne $result} {
        set ch [open $output_path w]
        fconfigure $ch -translation binary -encoding binary
        puts -nonewline $ch $result
        close $ch
    }
    puts "PNR IO LEF: $output_path (PADVDD/PADVSS CLASS PAD POWER; source PDK unchanged)"
    return $output_path
}
