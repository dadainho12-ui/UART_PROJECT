# Shared configuration. Run in Innovus legacy command mode (not -stylus).
set pnr_dir [file dirname [file normalize [info script]]]
cd $pnr_dir
set gpdk_root /GPDK045
if {[info exists ::env(GPDK045_ROOT)]} {
    set gpdk_root [file normalize $::env(GPDK045_ROOT)]
}
set std_root [file join $gpdk_root digital gsclib045_all_v4.4]
set io_root [file join $gpdk_root digital giolib045_v3.5]
set pnr_lefs [list \
    [file join $std_root gsclib045_tech lef gsclib045_tech.lef] \
    [file join $std_root gsclib045 lef gsclib045_macro.lef] \
    [file join $io_root lef giolib045_modify.lef]]
set qrc_tech [file join $std_root gsclib045 qrc qx gpdk045.tch]
if {[info exists ::env(QRC_TECH_FILE)]} {
    set qrc_tech [file normalize $::env(QRC_TECH_FILE)]
}
set ff_libs [list [file join $std_root gsclib045 timing fast_vdd1v0_basicCells.lib] [file join $io_root timing pads_FF_s1vg.lib]]
set ss_libs [list [file join $std_root gsclib045 timing slow_vdd1v0_basicCells.lib] [file join $io_root timing pads_SS_s1vg.lib]]
set uart_sdc [file join $pnr_dir asic_top_50mhz.sdc]
proc require_pnr_file {path} {
    if {![file isfile $path] || ![file readable $path]} {
        error "Missing/unreadable PNR input: $path (see README_PNR.md)"
    }
}
proc uart_apply_routed_timing_constraints {source_sdc timing_dir} {
    require_pnr_file $source_sdc
    file mkdir $timing_dir
    set routed_sdc [file join $timing_dir FUNC_routed.sdc]
    set input [open $source_sdc r]
    set sdc_text [read $input]
    close $input
    set changed [regsub -all -line {^[ \t]*set_ideal_network[ \t]+\[get_ports[ \t]+(clk|reset_n)\][ \t]*$} $sdc_text {} sdc_text]
    if {$changed != 2} {
        error "Expected two ideal-network constraints for clk and reset_n in $source_sdc"
    }
    set output [open $routed_sdc w]
    puts $output $sdc_text
    close $output

    update_constraint_mode -name FUNC -sdc_files [list $routed_sdc]
    set_interactive_constraint_modes [list FUNC]
    set_propagated_clock [all_clocks]
}

foreach dir {reports/clock reports/timing/preCTS reports/timing/postCTS run1} {
    file mkdir $dir
}
