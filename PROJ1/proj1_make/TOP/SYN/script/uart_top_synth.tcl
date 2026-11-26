proc run_core_synthesis {script_dir} {
    set syn_dir [file dirname $script_dir]
    set top_dir [file dirname $syn_dir]
    # Resolve the same server PDK tree as the original TOP/SYN flow.
    set gpdk [file normalize [file join $syn_dir ../../../../../SoC/GPDK045]]
    if {[info exists ::env(GPDK045_ROOT)] && $::env(GPDK045_ROOT) ne ""} {
        set gpdk [file normalize $::env(GPDK045_ROOT)]
    }
    set std_dir [file join $gpdk digital gsclib045_all_v4.4]
    set slow_lib [file join $std_dir gsclib045 timing slow_vdd1v0_basicCells.lib]
    set fast_lib [file join $std_dir gsclib045 timing fast_vdd1v0_basicCells.lib]
    set lefs [list [file join $std_dir gsclib045 lef gsclib045_tech.lef] \
                   [file join $std_dir gsclib045 lef gsclib045_macro.lef]]
    set qrc [file join $std_dir gsclib045_tech qrc qx gpdk045.tch]
    set rtl {}
    foreach module {uart_top baud_gen uart_rx uart_tx} {
        lappend rtl [file join $top_dir RTL ${module}.v]
    }
    set sdc [file join $syn_dir cons uart_top.sdc]
    foreach path [concat [list $slow_lib $fast_lib $qrc $sdc] $lefs $rtl] {
        if {![file isfile $path] || ![file readable $path]} {
            error "Cannot read required file: $path (check GPDK045_ROOT)"
        }
    }

    set_db auto_ungroup none
    set_db max_cpus_per_server 2
    set_db syn_generic_effort high
    set_db syn_map_effort high
    set_db syn_opt_effort high
    read_libs [list $fast_lib $slow_lib]
    read_physical -lef $lefs
    read_qrc [list $qrc]
    read_hdl $rtl
    # uart_top RTL defaults: CLK_FREQ=50_000_000, BAUD_RATE=115200.
    elaborate uart_top
    # This UART has no DFT scan chain. Map its registers to functional flops.
    set_db / .use_scan_seqs_for_non_dft false
    check_design > report/elaborated_design.rpt
    check_design -unresolved >> report/elaborated_design.rpt

    if {[sizeof_collection [get_ports {tx_start tx_data[*]}]] != 9} {
        error "Expected tx_start and all eight tx_data bits"
    }
    read_sdc $sdc
    set_operating_conditions \
        -max_library [get_libs slow_vdd1v0_basicCells.lib:slow_vdd1v0] -max PVT_0P9V_125C \
        -min_library [get_libs fast_vdd1v0_basicCells.lib:fast_vdd1v0] -min PVT_1P1V_0C

    source [file join $script_dir core_site_cells.tcl]
    set cell_sites [read_core_cell_sites $lefs]
    set blocked_cells {}
    dict for {macro site} $cell_sites {
        if {$site ne "CoreSite"} {
            set lib_cells [get_lib_cells -quiet */$macro]
            if {[sizeof_collection $lib_cells] > 0} {
                set_dont_use $lib_cells
                lappend blocked_cells $macro
            }
        }
    }
    set out [open report/site_exclusions.rpt w]
    foreach macro [lsort $blocked_cells] {
        puts $out "$macro [dict get $cell_sites $macro]"
    }
    close $out

    check_timing_intent -verbose > report/timing_intent.rpt
    report_port -delay -driver [all_inputs] > report/ports.rpt
    report_port -delay -load [all_outputs] >> report/ports.rpt
    syn_generic
    syn_map
    syn_opt

    report_area > report/09_uart_top_SYN_area.rpt
    report_gates > report/gates.rpt
    report_clocks > report/clocks.rpt
    report_qor > report/qor.rpt
    report_constraint -all_violators > report/constraints.rpt
    report_timing -nworst 20 -net > report/setup.rpt

    set masters [lsort -unique [get_db insts .base_cell.name]]
    if {![llength $masters]} {
        error "No mapped standard cells found"
    }
    set out [open report/mapped_sites.rpt w]
    set illegal {}
    foreach master $masters {
        set site UNKNOWN
        if {[dict exists $cell_sites $master]} {
            set site [dict get $cell_sites $master]
        }
        puts $out "$master $site"
        if {$site ne "CoreSite"} {
            lappend illegal $master
        }
    }
    close $out
    if {[llength $illegal]} {
        error "Mapped masters without a compatible CoreSite: $illegal"
    }

    write_hdl > mapped/uart_top_syn_final.v
    write_sdc > mapped/uart_top_syn_final.sdc
    write_db -to_file mapped/uart_top_syn_opt.db
    set marker [open log/synthesis.ok w]
    close $marker
}

if {[catch {run_core_synthesis [file dirname [file normalize [info script]]]} message options]} {
    puts stderr [dict get $options -errorinfo]
    exit 1
}
exit 0
