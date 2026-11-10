# Single-session flow; stage scripts share state and do not exit/restore here.
source [file join [file dirname [info script]] pnr_config.tcl]
set ::pnr_batch 1
set flow_status [catch {
    foreach stage {
        0_InitDesign.tcl
        1_PowerPlan.tcl
        2_PlaceOpt.tcl
        3_PostCTSopt.tcl
        4_RouteDesign_PowerAnalysis.tcl
        5_ChipFinish.tcl
    } {
        puts "UART PNR stage: $stage"
        source [file join $pnr_dir $stage]
    }
} flow_message flow_options]
unset ::pnr_batch
if {$flow_status} { return -options $flow_options $flow_message }
# Keep the session open for report/DRC review. ECO is an explicit separate step.
