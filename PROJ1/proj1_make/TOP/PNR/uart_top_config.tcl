set uart_pnr_dir [file dirname [file normalize [info script]]]
set uart_syn_dir [file normalize [file join $uart_pnr_dir ../SYN]]
set uart_gpdk [file normalize [file join $uart_syn_dir ../../../../../SoC/GPDK045]]
if {[info exists ::env(GPDK045_ROOT)] && $::env(GPDK045_ROOT) ne ""} {
    set uart_gpdk [file normalize $::env(GPDK045_ROOT)]
}
set uart_std [file join $uart_gpdk digital gsclib045_all_v4.4]
set uart_tech_lef [file join $uart_std gsclib045_tech lef gsclib045_tech.lef]
if {![file isfile $uart_tech_lef]} {
    set uart_tech_lef [file join $uart_std gsclib045 lef gsclib045_tech.lef]
}
set uart_lefs [list $uart_tech_lef [file join $uart_std gsclib045 lef gsclib045_macro.lef]]
set uart_lib_dir [file join $uart_std gsclib045 timing]
set uart_qrc [file join $uart_std gsclib045_tech qrc qx gpdk045.tch]
if {[info exists ::env(QRC_TECH_FILE)] && $::env(QRC_TECH_FILE) ne ""} {
    set uart_qrc [file normalize $::env(QRC_TECH_FILE)]
}
set uart_sdc [file join $uart_syn_dir cons uart_top.sdc]
set uart_netlist [file join $uart_syn_dir mapped uart_top_syn_final.v]

# Physical cell area from Genus report/09_uart_top_SYN_area.rpt, in square microns.
set uart_synth_cell_area 656.982
set uart_target_util 0.65
set uart_core_margin 5.0

proc uart_require_file {path} {
    if {![file isfile $path] || ![file readable $path]} {
        error "Missing or unreadable PNR input: $path"
    }
}

proc uart_prepare_stage {{previous ""}} {
    global uart_pnr_dir uart_syn_dir uart_lefs uart_cell_sites
    set run_dir $uart_pnr_dir
    if {$previous ne "" && ![file exists [file join $run_dir ${previous}.dat]]} {
        error "Missing ${previous}.dat in $run_dir. Run the preceding stage first."
    }
    foreach lef $uart_lefs {
        uart_require_file $lef
    }
    source [file join $uart_syn_dir script core_site_cells.tcl]
    set uart_cell_sites [read_core_cell_sites $uart_lefs]
    file mkdir [file join $run_dir reports timing]
    cd $run_dir
    if {$previous ne ""} {
        restoreDesign ${previous}.dat
    }
    puts "UART PNR output directory: $run_dir"
}

proc uart_restrict_cells {} {
    global uart_cell_sites
    set_interactive_constraint_modes [list FUNC]
    dict for {master site} $uart_cell_sites {
        if {$site ne "CoreSite"} {
            set lib_cells [get_lib_cells -quiet */$master]
            if {[sizeof_collection $lib_cells] > 0} {
                set_dont_use true $lib_cells
            }
        }
    }
}

proc uart_check_sites {report} {
    global uart_cell_sites
    set out [open $report w]
    set illegal {}
    foreach master [lsort -unique [dbGet top.insts.cell.name]] {
        set site UNKNOWN
        if {[dict exists $uart_cell_sites $master]} {
            set site [dict get $uart_cell_sites $master]
        }
        puts $out "$master $site"
        if {$site ne "CoreSite"} {
            lappend illegal $master
        }
    }
    close $out
    if {[llength $illegal]} {
        error "Cell masters incompatible with CoreSite: $illegal"
    }
}

proc uart_propagate_clock {} {
    set_interactive_constraint_modes [list FUNC]
    set_propagated_clock [get_clocks MAIN_CLOCK]
}

proc uart_report_routed_timing {dir} {
    uart_propagate_clock
    extractRC
    timeDesign -postRoute -outDir [file join $dir setup]
    timeDesign -postRoute -hold -outDir [file join $dir hold]
    setAnalysisMode -checkType setup
    report_timing -check_type recovery -from [get_ports reset_n] -path_type full_clock \
        -max_paths 10 > [file join $dir reset_recovery.rpt]
    setAnalysisMode -checkType hold
    report_timing -check_type removal -from [get_ports reset_n] -path_type full_clock \
        -max_paths 10 > [file join $dir reset_removal.rpt]
}
