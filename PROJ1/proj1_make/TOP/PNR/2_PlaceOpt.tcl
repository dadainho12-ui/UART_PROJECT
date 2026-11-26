source [file join [file dirname [file normalize [info script]]] uart_top_config.tcl]
uart_prepare_stage PowerPlan

uart_restrict_cells
setPlaceMode -congEffort high
place_opt_design
uart_check_sites reports/placed_sites.rpt
checkPlace reports/uart_top.checkPlace

lassign [lindex [dbGet top.fPlan.coreBox] 0] x0 y0 x1 y1
set core_area [expr {($x1 - $x0) * ($y1 - $y0)}]
set placed_cell_area 0.0
foreach inst [dbGet top.insts] {
    lassign [lindex [dbGet $inst.cell.size] 0] width height
    set placed_cell_area [expr {$placed_cell_area + $width * $height}]
}
set utilization [expr {100.0 * $placed_cell_area / $core_area}]
set summary [open reports/placed_utilization.rpt w]
puts $summary [format "Core area: %.3f um^2\nPlaced cell area: %.3f um^2\nUtilization: %.2f%%" \
    $core_area $placed_cell_area $utilization]
close $summary
if {$utilization < 60.0 || $utilization > 70.0} {
    puts [format "WARNING: Post-placement utilization %.2f%% is outside the 60-70%% target." $utilization]
}
setRouteMode -earlyGlobalMinRouteLayer 1 -earlyGlobalMaxRouteLayer 11
earlyGlobalRoute
redirect -tee reports/congestion_hotspots.rpt {reportCongestion -hotSpot}
redirect -tee reports/congestion_overflow.rpt {reportCongestion -overflow}
timeDesign -preCTS -outDir reports/timing/preCTS
saveDesign -def PlaceOpt
