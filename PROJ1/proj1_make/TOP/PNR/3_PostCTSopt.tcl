source [file join [file dirname [file normalize [info script]]] uart_top_config.tcl]
uart_prepare_stage PlaceOpt

uart_restrict_cells
set cts_buffers {}
set cts_inverters {}
dict for {master site} $uart_cell_sites {
    if {$site ne "CoreSite" || [sizeof_collection [get_lib_cells -quiet */$master]] == 0} {
        continue
    }
    if {[regexp {^(CLK)?BUFX} $master]} {
        lappend cts_buffers $master
    } elseif {[regexp {^(CLK)?INVX} $master]} {
        lappend cts_inverters $master
    }
}
if {![llength $cts_buffers] || ![llength $cts_inverters]} {
    error "No compatible GPDK045 CTS buffer/inverter candidates"
}
create_ccopt_clock_tree_spec
set_ccopt_property buffer_cells $cts_buffers
set_ccopt_property inverter_cells $cts_inverters
ccopt_design
uart_propagate_clock
optDesign -postCTS
optDesign -postCTS -hold
uart_check_sites reports/postcts_sites.rpt
report_ccopt_clock_trees -file reports/clock_trees.rpt
report_ccopt_skew_groups -file reports/clock_skew_groups.rpt
timeDesign -postCTS -outDir reports/timing/postCTS/setup
timeDesign -postCTS -hold -outDir reports/timing/postCTS/hold
saveDesign -def PostCTSopt
