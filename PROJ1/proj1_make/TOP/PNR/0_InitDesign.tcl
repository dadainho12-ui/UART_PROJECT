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
# Actual library/site-grid legality must still be checked in Innovus.
floorPlan -site CoreSite -d 2000 2000 350 350 350 350
# All pad positions come from init.io; no unrelated padNN coordinates.
foreach side {n s w e} {
    addIoFiller -cell padIORINGFEED60 padIORINGFEED10 padIORINGFEED5 padIORINGFEED3 padIORINGFEED1 -prefix IO_FILLER -side $side
}
checkDesign -io -floorplan -outdir reports/floorplan
saveDesign -def InitDesign
if {![info exists ::pnr_batch]} { exit }
