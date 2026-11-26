source [file join [file dirname [file normalize [info script]]] uart_top_config.tcl]
uart_prepare_stage

foreach path [concat $uart_lefs [list $uart_netlist $uart_sdc]] {
    uart_require_file $path
}
set init_verilog $uart_netlist
set init_top_cell uart_top
set init_lef_file $uart_lefs
set init_mmmc_file [file join $uart_pnr_dir uart_top.mmmc.view]
set init_pwr_net VDD
set init_gnd_net VSS
init_design
uart_check_sites reports/init_sites.rpt

# Inspect real leaf loads through the imported hierarchical netlist.
set reset_net [dbGet top.nets.name reset_n -p]
if {$reset_net eq "0x0"} {
    error "reset_n net is missing from the imported design"
}
set reset_loads [dbGet $reset_net.instTerms.name -e]
set reset_report [open reports/reset_connections.rpt w]
puts $reset_report [join $reset_loads "\n"]
close $reset_report
if {![llength $reset_loads]} {
    error "No leaf terminals connected to reset_n"
}

set side [expr {sqrt($uart_synth_cell_area / $uart_target_util)}]
setFPlanMode -snapDieGrid manufacturing -snapCoreGrid placement -snapIoGrid manufacturing
floorPlan -site CoreSite -coreMarginsBy die -fplanOrigin llcorner \
    -s $side $side $uart_core_margin $uart_core_margin $uart_core_margin $uart_core_margin

set west_pins {tx_start}
set east_pins {rx_valid frame_error}
for {set bit 0} {$bit < 8} {incr bit} {
    lappend west_pins [format {tx_data[%d]} $bit]
    lappend east_pins [format {rx_data[%d]} $bit]
}
lappend west_pins tx_busy tx_done
setPinAssignMode -pinEditInBatch true
editPin -pin $west_pins -side Left -layer Metal3 -spreadType SIDE -fixOverlap 1 -fixedPin 1
editPin -pin $east_pins -side Right -layer Metal3 -spreadType SIDE -fixOverlap 1 -fixedPin 1
editPin -pin {uart_rx uart_tx} -side Top -layer Metal2 -spreadType SIDE -fixOverlap 1 -fixedPin 1
editPin -pin {clk reset_n} -side Bottom -layer Metal2 -spreadType SIDE -fixOverlap 1 -fixedPin 1
setPinAssignMode -pinEditInBatch false
checkDesign -netlist -physicalLibrary -timingLibrary -floorplan -outdir reports/init
saveDesign -def InitDesign
