source [file join [file dirname [file normalize [info script]]] uart_top_config.tcl]
uart_prepare_stage RouteDesign

set fillers {}
foreach master {FILL64 FILL32 FILL16 FILL8 FILL4 FILL2 FILL1} {
    if {[dict exists $uart_cell_sites $master] && [dict get $uart_cell_sites $master] eq "CoreSite"} {
        lappend fillers $master
    }
}
if {![llength $fillers]} {
    error "No CoreSite fillers found"
}
addFiller -cell $fillers -prefix UART_FILL
uart_check_sites reports/final_sites.rpt
uart_report_routed_timing reports/timing/final
set_verify_drc_mode -report reports/final_drc.rpt
verify_drc
verifyConnectivity -type all -geomConnect -report reports/final_connectivity.rpt
saveDesign -rc -def ChipFinish
saveNetlist -flat uart_top_pnr.v
writeTimingCon uart_top_pnr.sdc
write_sdf uart_top.sdf

# Optional GDS export with the foundry layer map and standard-cell GDS.
if {[info exists ::env(UART_GDS_MAP)] && [info exists ::env(UART_STD_CELL_GDS)]} {
    uart_require_file $::env(UART_GDS_MAP)
    uart_require_file $::env(UART_STD_CELL_GDS)
    streamOut uart_top.gds -mapFile $::env(UART_GDS_MAP) \
        -merge [list $::env(UART_STD_CELL_GDS)] -libName DesignLib -units 2000 -mode ALL
}
