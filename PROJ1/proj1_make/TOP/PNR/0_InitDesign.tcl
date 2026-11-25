# UART initialization: original synthesis output is never modified.
source [file join [file dirname [info script]] pnr_config.tcl]
source [file join $pnr_dir validate_floorplan.tcl]
# Prepare the PNR-only netlist using Innovus Tcl (no external executable).
source [file join $pnr_dir prepare_pnr.tcl]
foreach lef $pnr_lefs { require_pnr_file $lef }
require_pnr_file $qrc_tech
# Use a generated view for perimeter power pads; never modify the installed PDK.
source [file join $pnr_dir prepare_io_lef.tcl]
set source_io_lef [file join $io_root lef giolib045_modify.lef]
set io_lef_index [lsearch -exact $pnr_lefs $source_io_lef]
if {$io_lef_index < 0} { error "Original IO LEF missing from pnr_lefs" }
set pnr_io_lef [uart_prepare_io_lef $source_io_lef [file join $pnr_dir generated giolib045_pnr.lef]]
set pnr_lefs [lreplace $pnr_lefs $io_lef_index $io_lef_index $pnr_io_lef]
set init_gnd_net VSS
set init_pwr_net VDD
set init_lef_file $pnr_lefs
set init_verilog [file join $pnr_dir generated asic_top_pnr.v]
set init_mmmc_file [file join $pnr_dir asic_top.mmmc.view]
set init_io_file [file join $pnr_dir init.io]
set init_top_cell asic_top
init_design
foreach cell {PADVDD PADVSS} {
    set ptr [dbGet head.libCells.name $cell -p]
    if {[llength $ptr] != 1 || $ptr eq "0x0"} {error "Missing/ambiguous power-pad cell: $cell"}
    set base_class [dbGet $ptr.baseClass]
    set sub_class [dbGet $ptr.subClass]
    puts "Loaded power-pad classification: $cell $base_class / $sub_class"
    if {$base_class ne "pad" || $sub_class eq "padAreaIO"} {
        error "Power-pad physical view was not applied: $cell $base_class / $sub_class"
    }
}
checkDesign -io -netlist -physicalLibrary -powerGround -timingLibrary -outdir reports/init

# 2mm trial floorplan, using the reported 60x240um IO / 240x240um corner sizes.
# PlacementGrid origin=(0,0), pitch=(0.2,0.19)um, reported by the server.
# Die-relative margins avoid adding the 240um IO depth to the requested margin.
# Do not use -adjustToSite: its site-size rounding can override grid-aligned boxes.
# Keep normal grid snapping enabled and check the actual database coordinates below.
# The IO fillers have integer-micron widths: keep a 2000um die edge.
# Die/IO use ManufacturingGrid; the core still uses PlacementGrid.
setFPlanMode -snapDieGrid manufacturing -snapCoreGrid placement -snapIoGrid manufacturing
floorPlan -site CoreSite -coreMarginsBy die -fplanOrigin llcorner -d 2000 2000 350 349.98 350 350.04
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
