# UART initialization: original synthesis output is never modified.
source [file join [file dirname [info script]] pnr_config.tcl]
source [file join $pnr_dir validate_floorplan.tcl]
# Prepare the PNR-only netlist using Innovus Tcl (no external executable).
source [file join $pnr_dir prepare_pnr.tcl]
foreach lef $pnr_lefs { require_pnr_file $lef }
require_pnr_file $qrc_tech
set init_gnd_net VSS
set init_pwr_net VDD
set init_lef_file $pnr_lefs
set init_verilog [file join $pnr_dir generated asic_top_pnr.v]
set init_mmmc_file [file join $pnr_dir asic_top.mmmc.view]
set init_io_file [file join $pnr_dir init.io]
set init_top_cell asic_top
init_design
checkDesign -io -netlist -physicalLibrary -powerGround -timingLibrary -outdir reports/init

# 2mm trial floorplan, using the reported 60x240um IO / 240x240um corner sizes.
# PlacementGrid origin=(0,0), pitch=(0.2,0.19)um, reported by the server.
# Die-relative margins avoid adding the 240um IO depth to the requested margin.
# Do not use -adjustToSite: its site-size rounding can override grid-aligned boxes.
# Keep normal grid snapping enabled and check the actual database coordinates below.
floorPlan -site CoreSite -coreMarginsBy die -fplanOrigin llcorner -d 2000 1999.94 350 349.98 350 349.98
uart_check_live_floorplan
# PADVDD/PADVSS are relocated as Area IO during floorPlan. Restore their IO slots
# from init.io using the actual IOR pad positions, BEFORE adding IO fillers.
source [file join $pnr_dir place_power_pads.tcl]
foreach side {n s w e} {
    addIoFiller -cell padIORINGFEED60 padIORINGFEED10 padIORINGFEED5 padIORINGFEED3 padIORINGFEED1 -prefix IO_FILLER -side $side
}
checkDesign -io -floorplan -outdir reports/floorplan
checkFPlan -outFile reports/floorplan/grid_check.txt
saveDesign -def InitDesign
if {![info exists ::pnr_batch]} { exit }
