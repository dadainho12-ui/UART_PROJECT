# Run in a fresh Innovus session to measure the routed clock and reset delays.
source [file join [file dirname [info script]] pnr_config.tcl]
if {![file isdirectory RouteDesign.dat]} {
    error "Missing RouteDesign.dat. Run stage 4 before checking reset timing."
}
require_pnr_file $uart_sdc

set timing_dir [file join $pnr_dir reports timing postRoute_reset_check]
file mkdir $timing_dir
set routed_sdc [file join $timing_dir FUNC_routed.sdc]
set input [open $uart_sdc r]
set sdc_text [read $input]
close $input
set changed [regsub -all -line {^[ \t]*set_ideal_network[ \t]+\[get_ports[ \t]+(clk|reset_n)\][ \t]*$} $sdc_text {} sdc_text]
if {$changed != 2} {
    error "Expected two ideal-network constraints for clk and reset_n in $uart_sdc"
}
set output [open $routed_sdc w]
puts $output $sdc_text
close $output

restoreDesign RouteDesign.dat
update_constraint_mode -name FUNC -sdc_files [list $routed_sdc]
set_interactive_constraint_modes [list FUNC]
set_propagated_clock [all_clocks]
timeDesign -postRoute -outDir [file join $timing_dir setup]
timeDesign -postRoute -hold -outDir [file join $timing_dir hold]
puts "Routed reset timing reports written to $timing_dir"
