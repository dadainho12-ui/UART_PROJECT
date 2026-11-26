source [file join [file dirname [file normalize [info script]]] uart_top_config.tcl]
uart_prepare_stage PostCTSopt

uart_restrict_cells
setNanoRouteMode -routeTopRoutingLayer 11 -routeBottomRoutingLayer 1
setNanoRouteMode -routeWithTimingDriven true -routeWithSiDriven true
setNanoRouteMode -drouteFixAntenna true -routeInsertAntennaDiode false
routeDesign -globalDetail
uart_propagate_clock
setAnalysisMode -analysisType onChipVariation
extractRC
optDesign -postRoute -setup
optDesign -postRoute -hold
uart_check_sites reports/postroute_sites.rpt
uart_report_routed_timing reports/timing/postRoute
set_verify_drc_mode -report reports/route_drc.rpt
verify_drc
verifyConnectivity -type all -geomConnect -report reports/route_connectivity.rpt
saveDesign -rc -def RouteDesign
