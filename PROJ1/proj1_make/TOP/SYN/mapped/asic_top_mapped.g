######################################################################

# Created by Genus(TM) Synthesis Solution 22.17-s071_1 on Wed Oct 28 03:33:47 KST 2026

# This file contains the Genus script for design:asic_top

######################################################################

set_db -quiet init_lib_search_path {../../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/timing ../../../../../SoC/GPDK045/digital/giolib045_v3.5/timing ../../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef ../../../../../SoC/GPDK045/digital/giolib045_v3.5/lef ../../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/qrc/qx}
set_db -quiet operating_conditions_min PVT_1P1V_0C
set_db -quiet operating_conditions_min_library library:default_emulate_libset_max/fast_vdd1v0
set_db -quiet operating_conditions_library_given true
set_db -quiet design_mode_process 60.0
set_db -quiet phys_assume_met_fill 0.0
set_db -quiet map_placed_for_route_early_global false
set_db -quiet phys_use_invs_extraction true
set_db -quiet phys_route_time_out 120.0
set_db -quiet db_units 2000
set_db -quiet capacitance_per_unit_length_mmmc {}
set_db -quiet resistance_per_unit_length_mmmc {}
set_db -quiet runtime_by_stage {{PBS_Generic-Start 0 18 0.0 16.996407} {to_generic 2 21 2 20} {first_condense 0 22 1 21} {PBS_Generic_Opt-Post 4 23 4.757935 21.754342} {{PBS_Generic-Postgen HBO Optimizations} 0 23 0.0 21.754342} {PBS_TechMap-Start 0 25 0.0 22.744533} {{PBS_TechMap-Premap HBO Optimizations} 0 25 0.0 22.744533} {second_condense 0 25 0 23} {reify 1 26 1 25} {global_incr_map 1 27 0 25} {{PBS_Techmap-Global Mapping} 2 27 1.4237280000000005 24.168261} {{PBS_TechMap-Datapath Postmap Operations} 2 29 2.0 26.168261} {{PBS_TechMap-Postmap HBO Optimizations} 0 29 -0.0014070000000003802 26.166854} {{PBS_TechMap-Postmap Clock Gating} 0 29 0.0 26.166854} {{PBS_TechMap-Postmap Cleanup} 0 29 -0.0032570000000013977 26.163597} {PBS_Techmap-Post_MBCI 0 29 0.0 26.163597} {incr_opt 1 31 0 28} }
set_db -quiet timing_adjust_tns_of_complex_flops false
set_db -quiet hdl_array_naming_style %s_%d
set_db -quiet tinfo_tstamp_file .rs_hah002.tstamp
set_db -quiet metric_enable true
set_db -quiet auto_ungroup none
set_db -quiet max_cpus_per_server 2
set_db -quiet syn_generic_effort high
set_db -quiet use_area_from_lef true
set_db -quiet uniquify_naming_style asic_top_%s_%d
set_db -quiet optimize_merge_flops false
set_db -quiet optimize_merge_latches false
set_db -quiet phys_use_segment_parasitics true
set_db -quiet probabilistic_extraction true
set_db -quiet ple_correlation_factors {1.9000 2.0000}
set_db -quiet maximum_interval_of_vias inf
set_db -quiet layer_aware_buffer true
set_db -quiet ple_mode global
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/ANTENNA .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/HOLDX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIEHI .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIELO .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/ANTENNA .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/HOLDX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIEHI .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIELO .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATXL .avoid true
set_db -quiet operating_conditions operating_condition:default_emulate_libset_max/slow_vdd1v0/PVT_0P9V_125C
set_db -quiet wireload_selection none
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/PVT_1P1V_0C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/PVT_0P9V_125C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/slow .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/PVT_1P1V_0C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/PVT_0P9V_125C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/slow .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/_nominal_ .tree_type balanced_tree
# BEGIN MSV SECTION
# END MSV SECTION
define_clock -name MAIN_CLOCK -domain domain_1 -period 8000.0 -divide_period 1 -rise 0 -divide_rise 1 -fall 1 -divide_fall 2 -remove -design design:asic_top port:asic_top/clk
set_db -quiet clock:asic_top/MAIN_CLOCK .slew {100.0 100.0 100.0 100.0}
set_db -quiet clock:asic_top/MAIN_CLOCK .clock_network_late_latency {200.0 200.0 200.0 200.0}
set_db -quiet clock:asic_top/MAIN_CLOCK .clock_source_late_latency {200.0 200.0 200.0 200.0}
set_db -quiet clock:asic_top/MAIN_CLOCK .clock_setup_uncertainty {100.0 100.0}
define_cost_group -design design:asic_top -name MAIN_CLOCK
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name in_del port:asic_top/reset_n
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name in_del_1_1 port:asic_top/tx_start
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name in_del_2_1 {{port:asic_top/tx_data[7]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name in_del_3_1 {{port:asic_top/tx_data[6]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name in_del_4_1 {{port:asic_top/tx_data[5]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name in_del_5_1 {{port:asic_top/tx_data[4]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name in_del_6_1 {{port:asic_top/tx_data[3]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name in_del_7_1 {{port:asic_top/tx_data[2]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name in_del_8_1 {{port:asic_top/tx_data[1]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name in_del_9_1 {{port:asic_top/tx_data[0]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name in_del_10_1 port:asic_top/uart_rx
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name in_del_11_1 port:asic_top/reset_n
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name in_del_12_1 port:asic_top/tx_start
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name in_del_13_1 {{port:asic_top/tx_data[7]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name in_del_14_1 {{port:asic_top/tx_data[6]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name in_del_15_1 {{port:asic_top/tx_data[5]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name in_del_16_1 {{port:asic_top/tx_data[4]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name in_del_17_1 {{port:asic_top/tx_data[3]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name in_del_18_1 {{port:asic_top/tx_data[2]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name in_del_19_1 {{port:asic_top/tx_data[1]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name in_del_20_1 {{port:asic_top/tx_data[0]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name in_del_21_1 port:asic_top/uart_rx
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del port:asic_top/uart_tx
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_21_1 port:asic_top/tx_busy
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_22_1 port:asic_top/tx_done
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_23_1 {{port:asic_top/rx_data[7]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_24_1 {{port:asic_top/rx_data[6]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_25_1 {{port:asic_top/rx_data[5]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_26_1 {{port:asic_top/rx_data[4]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_27_1 {{port:asic_top/rx_data[3]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_28_1 {{port:asic_top/rx_data[2]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_29_1 {{port:asic_top/rx_data[1]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_30_1 {{port:asic_top/rx_data[0]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_31_1 port:asic_top/rx_valid
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:asic_top/MAIN_CLOCK -name ou_del_32_1 port:asic_top/frame_error
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_33_1 port:asic_top/uart_tx
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_34_1 port:asic_top/tx_busy
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_35_1 port:asic_top/tx_done
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_36_1 {{port:asic_top/rx_data[7]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_37_1 {{port:asic_top/rx_data[6]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_38_1 {{port:asic_top/rx_data[5]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_39_1 {{port:asic_top/rx_data[4]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_40_1 {{port:asic_top/rx_data[3]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_41_1 {{port:asic_top/rx_data[2]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_42_1 {{port:asic_top/rx_data[1]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_43_1 {{port:asic_top/rx_data[0]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_44_1 port:asic_top/rx_valid
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:asic_top/MAIN_CLOCK -name ou_del_45_1 port:asic_top/frame_error
path_group -paths [specify_paths -lenient -to clock:asic_top/MAIN_CLOCK]  -name MAIN_CLOCK -group cost_group:asic_top/MAIN_CLOCK -user_priority -1047552
# BEGIN DFT SECTION
set_db -quiet dft_scan_style muxed_scan
set_db -quiet dft_scanbit_waveform_analysis false
# END DFT SECTION
set_db -quiet design:asic_top .seq_reason_deleted_internal {}
set_db -quiet design:asic_top .qos_by_stage {{to_generic {wns -11111111} {tns -111111111} {vep -111111111} {area 361238} {cell_count 356} {utilization  0.00} {runtime 2 21 2 20} }{first_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 361156} {cell_count 326} {utilization  0.00} {runtime 0 22 1 21} }{second_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 361156} {cell_count 326} {utilization  0.00} {runtime 0 25 0 23} }{reify {wns 5232} {tns 0} {vep 0} {area 360724} {cell_count 266} {utilization  0.00} {runtime 1 26 1 25} }{global_incr_map {wns 5232} {tns 0} {vep 0} {area 360669} {cell_count 246} {utilization  0.00} {runtime 1 27 0 25} }{incr_opt {wns 214748365} {tns 0} {vep 0} {area 360667} {cell_count 239} {utilization  0.00} {runtime 1 31 0 28} }}
set_db -quiet design:asic_top .seq_mbci_coverage 0.0
set_db -quiet design:asic_top .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/asic_top.v ../RTL/baud_gen.v ../RTL/uart_rx.v ../RTL/uart_top.v ../RTL/uart_tx.v} {../RTL} {}}}
set_db -quiet design:asic_top .verification_directory fv/asic_top
set_db -quiet port:asic_top/clk .is_ideal_network true
set_db -quiet port:asic_top/clk .original_name clk
set_db -quiet port:asic_top/clk .ideal_network true
set_db -quiet port:asic_top/reset_n .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/reset_n .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/reset_n .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/reset_n .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/reset_n .is_ideal_network true
set_db -quiet port:asic_top/reset_n .original_name reset_n
set_db -quiet port:asic_top/reset_n .ideal_network true
set_db -quiet port:asic_top/tx_start .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/tx_start .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/tx_start .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/tx_start .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/tx_start .original_name tx_start
set_db -quiet {port:asic_top/tx_data[7]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[7]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[7]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[7]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[7]} .original_name {tx_data[7]}
set_db -quiet {port:asic_top/tx_data[6]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[6]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[6]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[6]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[6]} .original_name {tx_data[6]}
set_db -quiet {port:asic_top/tx_data[5]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[5]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[5]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[5]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[5]} .original_name {tx_data[5]}
set_db -quiet {port:asic_top/tx_data[4]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[4]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[4]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[4]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[4]} .original_name {tx_data[4]}
set_db -quiet {port:asic_top/tx_data[3]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[3]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[3]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[3]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[3]} .original_name {tx_data[3]}
set_db -quiet {port:asic_top/tx_data[2]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[2]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[2]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[2]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[2]} .original_name {tx_data[2]}
set_db -quiet {port:asic_top/tx_data[1]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[1]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[1]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[1]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[1]} .original_name {tx_data[1]}
set_db -quiet {port:asic_top/tx_data[0]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[0]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[0]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[0]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet {port:asic_top/tx_data[0]} .original_name {tx_data[0]}
set_db -quiet port:asic_top/uart_rx .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/uart_rx .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/uart_rx .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/uart_rx .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:asic_top/uart_rx .original_name uart_rx
set_db -quiet port:asic_top/uart_tx .external_pin_cap_min 3.0
set_db -quiet port:asic_top/uart_tx .external_capacitance_max {3.0 3.0}
set_db -quiet port:asic_top/uart_tx .external_capacitance_min 3.0
set_db -quiet port:asic_top/uart_tx .original_name uart_tx
set_db -quiet port:asic_top/uart_tx .external_pin_cap {3.0 3.0}
set_db -quiet port:asic_top/tx_busy .external_pin_cap_min 3.0
set_db -quiet port:asic_top/tx_busy .external_capacitance_max {3.0 3.0}
set_db -quiet port:asic_top/tx_busy .external_capacitance_min 3.0
set_db -quiet port:asic_top/tx_busy .original_name tx_busy
set_db -quiet port:asic_top/tx_busy .external_pin_cap {3.0 3.0}
set_db -quiet port:asic_top/tx_done .external_pin_cap_min 3.0
set_db -quiet port:asic_top/tx_done .external_capacitance_max {3.0 3.0}
set_db -quiet port:asic_top/tx_done .external_capacitance_min 3.0
set_db -quiet port:asic_top/tx_done .original_name tx_done
set_db -quiet port:asic_top/tx_done .external_pin_cap {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[7]} .external_pin_cap_min 3.0
set_db -quiet {port:asic_top/rx_data[7]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[7]} .external_capacitance_min 3.0
set_db -quiet {port:asic_top/rx_data[7]} .original_name {rx_data[7]}
set_db -quiet {port:asic_top/rx_data[7]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[6]} .external_pin_cap_min 3.0
set_db -quiet {port:asic_top/rx_data[6]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[6]} .external_capacitance_min 3.0
set_db -quiet {port:asic_top/rx_data[6]} .original_name {rx_data[6]}
set_db -quiet {port:asic_top/rx_data[6]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[5]} .external_pin_cap_min 3.0
set_db -quiet {port:asic_top/rx_data[5]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[5]} .external_capacitance_min 3.0
set_db -quiet {port:asic_top/rx_data[5]} .original_name {rx_data[5]}
set_db -quiet {port:asic_top/rx_data[5]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[4]} .external_pin_cap_min 3.0
set_db -quiet {port:asic_top/rx_data[4]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[4]} .external_capacitance_min 3.0
set_db -quiet {port:asic_top/rx_data[4]} .original_name {rx_data[4]}
set_db -quiet {port:asic_top/rx_data[4]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[3]} .external_pin_cap_min 3.0
set_db -quiet {port:asic_top/rx_data[3]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[3]} .external_capacitance_min 3.0
set_db -quiet {port:asic_top/rx_data[3]} .original_name {rx_data[3]}
set_db -quiet {port:asic_top/rx_data[3]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[2]} .external_pin_cap_min 3.0
set_db -quiet {port:asic_top/rx_data[2]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[2]} .external_capacitance_min 3.0
set_db -quiet {port:asic_top/rx_data[2]} .original_name {rx_data[2]}
set_db -quiet {port:asic_top/rx_data[2]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[1]} .external_pin_cap_min 3.0
set_db -quiet {port:asic_top/rx_data[1]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[1]} .external_capacitance_min 3.0
set_db -quiet {port:asic_top/rx_data[1]} .original_name {rx_data[1]}
set_db -quiet {port:asic_top/rx_data[1]} .external_pin_cap {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[0]} .external_pin_cap_min 3.0
set_db -quiet {port:asic_top/rx_data[0]} .external_capacitance_max {3.0 3.0}
set_db -quiet {port:asic_top/rx_data[0]} .external_capacitance_min 3.0
set_db -quiet {port:asic_top/rx_data[0]} .original_name {rx_data[0]}
set_db -quiet {port:asic_top/rx_data[0]} .external_pin_cap {3.0 3.0}
set_db -quiet port:asic_top/rx_valid .external_pin_cap_min 3.0
set_db -quiet port:asic_top/rx_valid .external_capacitance_max {3.0 3.0}
set_db -quiet port:asic_top/rx_valid .external_capacitance_min 3.0
set_db -quiet port:asic_top/rx_valid .original_name rx_valid
set_db -quiet port:asic_top/rx_valid .external_pin_cap {3.0 3.0}
set_db -quiet port:asic_top/frame_error .external_pin_cap_min 3.0
set_db -quiet port:asic_top/frame_error .external_capacitance_max {3.0 3.0}
set_db -quiet port:asic_top/frame_error .external_capacitance_min 3.0
set_db -quiet port:asic_top/frame_error .original_name frame_error
set_db -quiet port:asic_top/frame_error .external_pin_cap {3.0 3.0}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[0].u_pad_rx_data} .original_name {{GEN_RX_DATA_PAD[0].u_pad_rx_data}}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[0].u_pad_rx_data} .single_bit_orig_name {GEN_RX_DATA_PAD[0].u_pad_rx_data}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[0].u_pad_rx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[0].u_pad_rx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[0].u_pad_rx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[0].u_pad_rx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_RX_DATA_PAD[0].u_pad_rx_data/PAD} .original_name {GEN_RX_DATA_PAD[0].u_pad_rx_data/PAD}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[1].u_pad_rx_data} .original_name {{GEN_RX_DATA_PAD[1].u_pad_rx_data}}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[1].u_pad_rx_data} .single_bit_orig_name {GEN_RX_DATA_PAD[1].u_pad_rx_data}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[1].u_pad_rx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[1].u_pad_rx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[1].u_pad_rx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[1].u_pad_rx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_RX_DATA_PAD[1].u_pad_rx_data/PAD} .original_name {GEN_RX_DATA_PAD[1].u_pad_rx_data/PAD}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[2].u_pad_rx_data} .original_name {{GEN_RX_DATA_PAD[2].u_pad_rx_data}}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[2].u_pad_rx_data} .single_bit_orig_name {GEN_RX_DATA_PAD[2].u_pad_rx_data}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[2].u_pad_rx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[2].u_pad_rx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[2].u_pad_rx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[2].u_pad_rx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_RX_DATA_PAD[2].u_pad_rx_data/PAD} .original_name {GEN_RX_DATA_PAD[2].u_pad_rx_data/PAD}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[3].u_pad_rx_data} .original_name {{GEN_RX_DATA_PAD[3].u_pad_rx_data}}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[3].u_pad_rx_data} .single_bit_orig_name {GEN_RX_DATA_PAD[3].u_pad_rx_data}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[3].u_pad_rx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[3].u_pad_rx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[3].u_pad_rx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[3].u_pad_rx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_RX_DATA_PAD[3].u_pad_rx_data/PAD} .original_name {GEN_RX_DATA_PAD[3].u_pad_rx_data/PAD}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[4].u_pad_rx_data} .original_name {{GEN_RX_DATA_PAD[4].u_pad_rx_data}}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[4].u_pad_rx_data} .single_bit_orig_name {GEN_RX_DATA_PAD[4].u_pad_rx_data}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[4].u_pad_rx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[4].u_pad_rx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[4].u_pad_rx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[4].u_pad_rx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_RX_DATA_PAD[4].u_pad_rx_data/PAD} .original_name {GEN_RX_DATA_PAD[4].u_pad_rx_data/PAD}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[5].u_pad_rx_data} .original_name {{GEN_RX_DATA_PAD[5].u_pad_rx_data}}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[5].u_pad_rx_data} .single_bit_orig_name {GEN_RX_DATA_PAD[5].u_pad_rx_data}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[5].u_pad_rx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[5].u_pad_rx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[5].u_pad_rx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[5].u_pad_rx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_RX_DATA_PAD[5].u_pad_rx_data/PAD} .original_name {GEN_RX_DATA_PAD[5].u_pad_rx_data/PAD}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[6].u_pad_rx_data} .original_name {{GEN_RX_DATA_PAD[6].u_pad_rx_data}}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[6].u_pad_rx_data} .single_bit_orig_name {GEN_RX_DATA_PAD[6].u_pad_rx_data}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[6].u_pad_rx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[6].u_pad_rx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[6].u_pad_rx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[6].u_pad_rx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_RX_DATA_PAD[6].u_pad_rx_data/PAD} .original_name {GEN_RX_DATA_PAD[6].u_pad_rx_data/PAD}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[7].u_pad_rx_data} .original_name {{GEN_RX_DATA_PAD[7].u_pad_rx_data}}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[7].u_pad_rx_data} .single_bit_orig_name {GEN_RX_DATA_PAD[7].u_pad_rx_data}
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[7].u_pad_rx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[7].u_pad_rx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[7].u_pad_rx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_RX_DATA_PAD[7].u_pad_rx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_RX_DATA_PAD[7].u_pad_rx_data/PAD} .original_name {GEN_RX_DATA_PAD[7].u_pad_rx_data/PAD}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[0].u_pad_tx_data} .original_name {{GEN_TX_DATA_PAD[0].u_pad_tx_data}}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[0].u_pad_tx_data} .single_bit_orig_name {GEN_TX_DATA_PAD[0].u_pad_tx_data}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[0].u_pad_tx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[0].u_pad_tx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[0].u_pad_tx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[0].u_pad_tx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_TX_DATA_PAD[0].u_pad_tx_data/Y} .original_name {GEN_TX_DATA_PAD[0].u_pad_tx_data/Y}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[1].u_pad_tx_data} .original_name {{GEN_TX_DATA_PAD[1].u_pad_tx_data}}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[1].u_pad_tx_data} .single_bit_orig_name {GEN_TX_DATA_PAD[1].u_pad_tx_data}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[1].u_pad_tx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[1].u_pad_tx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[1].u_pad_tx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[1].u_pad_tx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_TX_DATA_PAD[1].u_pad_tx_data/Y} .original_name {GEN_TX_DATA_PAD[1].u_pad_tx_data/Y}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[2].u_pad_tx_data} .original_name {{GEN_TX_DATA_PAD[2].u_pad_tx_data}}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[2].u_pad_tx_data} .single_bit_orig_name {GEN_TX_DATA_PAD[2].u_pad_tx_data}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[2].u_pad_tx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[2].u_pad_tx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[2].u_pad_tx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[2].u_pad_tx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_TX_DATA_PAD[2].u_pad_tx_data/Y} .original_name {GEN_TX_DATA_PAD[2].u_pad_tx_data/Y}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[3].u_pad_tx_data} .original_name {{GEN_TX_DATA_PAD[3].u_pad_tx_data}}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[3].u_pad_tx_data} .single_bit_orig_name {GEN_TX_DATA_PAD[3].u_pad_tx_data}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[3].u_pad_tx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[3].u_pad_tx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[3].u_pad_tx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[3].u_pad_tx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_TX_DATA_PAD[3].u_pad_tx_data/Y} .original_name {GEN_TX_DATA_PAD[3].u_pad_tx_data/Y}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[4].u_pad_tx_data} .original_name {{GEN_TX_DATA_PAD[4].u_pad_tx_data}}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[4].u_pad_tx_data} .single_bit_orig_name {GEN_TX_DATA_PAD[4].u_pad_tx_data}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[4].u_pad_tx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[4].u_pad_tx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[4].u_pad_tx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[4].u_pad_tx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_TX_DATA_PAD[4].u_pad_tx_data/Y} .original_name {GEN_TX_DATA_PAD[4].u_pad_tx_data/Y}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[5].u_pad_tx_data} .original_name {{GEN_TX_DATA_PAD[5].u_pad_tx_data}}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[5].u_pad_tx_data} .single_bit_orig_name {GEN_TX_DATA_PAD[5].u_pad_tx_data}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[5].u_pad_tx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[5].u_pad_tx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[5].u_pad_tx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[5].u_pad_tx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_TX_DATA_PAD[5].u_pad_tx_data/Y} .original_name {GEN_TX_DATA_PAD[5].u_pad_tx_data/Y}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[6].u_pad_tx_data} .original_name {{GEN_TX_DATA_PAD[6].u_pad_tx_data}}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[6].u_pad_tx_data} .single_bit_orig_name {GEN_TX_DATA_PAD[6].u_pad_tx_data}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[6].u_pad_tx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[6].u_pad_tx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[6].u_pad_tx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[6].u_pad_tx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_TX_DATA_PAD[6].u_pad_tx_data/Y} .original_name {GEN_TX_DATA_PAD[6].u_pad_tx_data/Y}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[7].u_pad_tx_data} .original_name {{GEN_TX_DATA_PAD[7].u_pad_tx_data}}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[7].u_pad_tx_data} .single_bit_orig_name {GEN_TX_DATA_PAD[7].u_pad_tx_data}
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[7].u_pad_tx_data} .dont_touch_reason set_dont_touch
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[7].u_pad_tx_data} .dont_touch_file 0
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[7].u_pad_tx_data} .dont_touch true
set_db -quiet {inst:asic_top/GEN_TX_DATA_PAD[7].u_pad_tx_data} .preserve true
set_db -quiet {pin:asic_top/GEN_TX_DATA_PAD[7].u_pad_tx_data/Y} .original_name {GEN_TX_DATA_PAD[7].u_pad_tx_data/Y}
set_db -quiet inst:asic_top/u_pad_clk .dont_touch_reason set_dont_touch
set_db -quiet inst:asic_top/u_pad_clk .dont_touch_file 0
set_db -quiet inst:asic_top/u_pad_clk .dont_touch true
set_db -quiet inst:asic_top/u_pad_clk .preserve true
set_db -quiet inst:asic_top/u_pad_frame_error .dont_touch_reason set_dont_touch
set_db -quiet inst:asic_top/u_pad_frame_error .dont_touch_file 0
set_db -quiet inst:asic_top/u_pad_frame_error .dont_touch true
set_db -quiet inst:asic_top/u_pad_frame_error .preserve true
set_db -quiet inst:asic_top/u_pad_reset .dont_touch_reason set_dont_touch
set_db -quiet inst:asic_top/u_pad_reset .dont_touch_file 0
set_db -quiet inst:asic_top/u_pad_reset .dont_touch true
set_db -quiet inst:asic_top/u_pad_reset .preserve true
set_db -quiet inst:asic_top/u_pad_rx_valid .dont_touch_reason set_dont_touch
set_db -quiet inst:asic_top/u_pad_rx_valid .dont_touch_file 0
set_db -quiet inst:asic_top/u_pad_rx_valid .dont_touch true
set_db -quiet inst:asic_top/u_pad_rx_valid .preserve true
set_db -quiet inst:asic_top/u_pad_tx_busy .dont_touch_reason set_dont_touch
set_db -quiet inst:asic_top/u_pad_tx_busy .dont_touch_file 0
set_db -quiet inst:asic_top/u_pad_tx_busy .dont_touch true
set_db -quiet inst:asic_top/u_pad_tx_busy .preserve true
set_db -quiet inst:asic_top/u_pad_tx_done .dont_touch_reason set_dont_touch
set_db -quiet inst:asic_top/u_pad_tx_done .dont_touch_file 0
set_db -quiet inst:asic_top/u_pad_tx_done .dont_touch true
set_db -quiet inst:asic_top/u_pad_tx_done .preserve true
set_db -quiet inst:asic_top/u_pad_tx_start .dont_touch_reason set_dont_touch
set_db -quiet inst:asic_top/u_pad_tx_start .dont_touch_file 0
set_db -quiet inst:asic_top/u_pad_tx_start .dont_touch true
set_db -quiet inst:asic_top/u_pad_tx_start .preserve true
set_db -quiet inst:asic_top/u_pad_uart_rx .dont_touch_reason set_dont_touch
set_db -quiet inst:asic_top/u_pad_uart_rx .dont_touch_file 0
set_db -quiet inst:asic_top/u_pad_uart_rx .dont_touch true
set_db -quiet inst:asic_top/u_pad_uart_rx .preserve true
set_db -quiet inst:asic_top/u_pad_uart_tx .dont_touch_reason set_dont_touch
set_db -quiet inst:asic_top/u_pad_uart_tx .dont_touch_file 0
set_db -quiet inst:asic_top/u_pad_uart_tx .dont_touch true
set_db -quiet inst:asic_top/u_pad_uart_tx .preserve true
set_db -quiet module:asic_top/uart_top_CLK_FREQ50000000_BAUD_RATE115200 .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/baud_gen.v ../RTL/uart_rx.v ../RTL/uart_top.v ../RTL/uart_tx.v} {../RTL} {}}}
set_db -quiet module:asic_top/baud_gen_CLK_FREQ50000000_BAUD_RATE115200 .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/baud_gen.v} {../RTL} {}}}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_8 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_8 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_8 .original_name {{u_uart_core/u_baud_gen/baud_cnt[8]}}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_8 .single_bit_orig_name {u_uart_core/u_baud_gen/baud_cnt[8]}
set_db -quiet pin:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_8/Q .original_name {u_uart_core/u_baud_gen/baud_cnt[8]/q}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_7 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_7 .original_name {{u_uart_core/u_baud_gen/baud_cnt[7]}}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_7 .single_bit_orig_name {u_uart_core/u_baud_gen/baud_cnt[7]}
set_db -quiet pin:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_7/Q .original_name {u_uart_core/u_baud_gen/baud_cnt[7]/q}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_6 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_6 .original_name {{u_uart_core/u_baud_gen/baud_cnt[6]}}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_6 .single_bit_orig_name {u_uart_core/u_baud_gen/baud_cnt[6]}
set_db -quiet pin:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_6/Q .original_name {u_uart_core/u_baud_gen/baud_cnt[6]/q}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_5 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_5 .original_name {{u_uart_core/u_baud_gen/baud_cnt[5]}}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_5 .single_bit_orig_name {u_uart_core/u_baud_gen/baud_cnt[5]}
set_db -quiet pin:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_5/Q .original_name {u_uart_core/u_baud_gen/baud_cnt[5]/q}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_4 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_4 .original_name {{u_uart_core/u_baud_gen/baud_cnt[4]}}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_4 .single_bit_orig_name {u_uart_core/u_baud_gen/baud_cnt[4]}
set_db -quiet pin:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_4/Q .original_name {u_uart_core/u_baud_gen/baud_cnt[4]/q}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_1 .original_name {{u_uart_core/u_baud_gen/baud_cnt[1]}}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_1 .single_bit_orig_name {u_uart_core/u_baud_gen/baud_cnt[1]}
set_db -quiet pin:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_1/Q .original_name {u_uart_core/u_baud_gen/baud_cnt[1]/q}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_3 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_3 .original_name {{u_uart_core/u_baud_gen/baud_cnt[3]}}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_3 .single_bit_orig_name {u_uart_core/u_baud_gen/baud_cnt[3]}
set_db -quiet pin:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_3/Q .original_name {u_uart_core/u_baud_gen/baud_cnt[3]/q}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_tick_reg .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_tick_reg .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_tick_reg .original_name u_uart_core/u_baud_gen/baud_tick
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_tick_reg .single_bit_orig_name u_uart_core/u_baud_gen/baud_tick
set_db -quiet pin:asic_top/u_uart_core/u_baud_gen/baud_tick_reg/Q .original_name u_uart_core/u_baud_gen/baud_tick/q
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_2 .original_name {{u_uart_core/u_baud_gen/baud_cnt[2]}}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_2 .single_bit_orig_name {u_uart_core/u_baud_gen/baud_cnt[2]}
set_db -quiet pin:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_2/Q .original_name {u_uart_core/u_baud_gen/baud_cnt[2]/q}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_0 .original_name {{u_uart_core/u_baud_gen/baud_cnt[0]}}
set_db -quiet inst:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_0 .single_bit_orig_name {u_uart_core/u_baud_gen/baud_cnt[0]}
set_db -quiet pin:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_0/Q .original_name {u_uart_core/u_baud_gen/baud_cnt[0]/q}
set_db -quiet pin:asic_top/u_uart_core/u_baud_gen/baud_cnt_reg_0/QN .original_name {u_uart_core/u_baud_gen/baud_cnt[0]/q}
set_db -quiet module:asic_top/uart_rx_CLK_FREQ50000000_BAUD_RATE115200 .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/uart_rx.v} {../RTL} {}}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_valid_reg .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_valid_reg .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_valid_reg .original_name u_uart_core/u_uart_rx/rx_valid
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_valid_reg .single_bit_orig_name u_uart_core/u_uart_rx/rx_valid
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_valid_reg/Q .original_name u_uart_core/u_uart_rx/rx_valid/q
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/frame_error_reg .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/frame_error_reg .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/frame_error_reg .original_name u_uart_core/u_uart_rx/frame_error
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/frame_error_reg .single_bit_orig_name u_uart_core/u_uart_rx/frame_error
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/frame_error_reg/Q .original_name u_uart_core/u_uart_rx/frame_error/q
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_sync_reg .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_sync_reg .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_sync_reg .original_name u_uart_core/u_uart_rx/rx_sync
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_sync_reg .single_bit_orig_name u_uart_core/u_uart_rx/rx_sync
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_sync_reg/Q .original_name u_uart_core/u_uart_rx/rx_sync/q
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_sync_reg/QN .original_name u_uart_core/u_uart_rx/rx_sync/q
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_meta_reg .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_meta_reg .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_meta_reg .original_name u_uart_core/u_uart_rx/rx_meta
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_meta_reg .single_bit_orig_name u_uart_core/u_uart_rx/rx_meta
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_meta_reg/Q .original_name u_uart_core/u_uart_rx/rx_meta/q
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_meta_reg/QN .original_name u_uart_core/u_uart_rx/rx_meta/q
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_0 .original_name {{u_uart_core/u_uart_rx/bit_cnt[0]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_0 .single_bit_orig_name {u_uart_core/u_uart_rx/bit_cnt[0]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_0/Q .original_name {u_uart_core/u_uart_rx/bit_cnt[0]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_2 .original_name {{u_uart_core/u_uart_rx/bit_cnt[2]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_2 .single_bit_orig_name {u_uart_core/u_uart_rx/bit_cnt[2]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_2/Q .original_name {u_uart_core/u_uart_rx/bit_cnt[2]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_0 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_0 .original_name {{u_uart_core/u_uart_rx/rx_buffer[0]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_0 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_buffer[0]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_0/Q .original_name {u_uart_core/u_uart_rx/rx_buffer[0]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_1 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_1 .original_name {{u_uart_core/u_uart_rx/rx_buffer[1]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_1 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_buffer[1]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_1/Q .original_name {u_uart_core/u_uart_rx/rx_buffer[1]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_2 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_2 .original_name {{u_uart_core/u_uart_rx/rx_buffer[2]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_2 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_buffer[2]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_2/Q .original_name {u_uart_core/u_uart_rx/rx_buffer[2]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_3 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_3 .original_name {{u_uart_core/u_uart_rx/rx_buffer[3]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_3 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_buffer[3]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_3/Q .original_name {u_uart_core/u_uart_rx/rx_buffer[3]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_4 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_4 .original_name {{u_uart_core/u_uart_rx/rx_buffer[4]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_4 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_buffer[4]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_4/Q .original_name {u_uart_core/u_uart_rx/rx_buffer[4]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_5 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_5 .original_name {{u_uart_core/u_uart_rx/rx_buffer[5]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_5 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_buffer[5]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_5/Q .original_name {u_uart_core/u_uart_rx/rx_buffer[5]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_6 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_6 .original_name {{u_uart_core/u_uart_rx/rx_buffer[6]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_6 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_buffer[6]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_6/Q .original_name {u_uart_core/u_uart_rx/rx_buffer[6]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_7 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_7 .original_name {{u_uart_core/u_uart_rx/rx_buffer[7]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_7 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_buffer[7]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_buffer_reg_7/Q .original_name {u_uart_core/u_uart_rx/rx_buffer[7]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_0 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_0 .original_name {{u_uart_core/u_uart_rx/rx_data[0]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_0 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_data[0]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_data_reg_0/Q .original_name {u_uart_core/u_uart_rx/rx_data[0]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_1 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_1 .original_name {{u_uart_core/u_uart_rx/rx_data[1]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_1 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_data[1]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_data_reg_1/Q .original_name {u_uart_core/u_uart_rx/rx_data[1]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_2 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_2 .original_name {{u_uart_core/u_uart_rx/rx_data[2]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_2 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_data[2]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_data_reg_2/Q .original_name {u_uart_core/u_uart_rx/rx_data[2]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_3 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_3 .original_name {{u_uart_core/u_uart_rx/rx_data[3]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_3 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_data[3]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_data_reg_3/Q .original_name {u_uart_core/u_uart_rx/rx_data[3]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_4 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_4 .original_name {{u_uart_core/u_uart_rx/rx_data[4]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_4 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_data[4]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_data_reg_4/Q .original_name {u_uart_core/u_uart_rx/rx_data[4]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_5 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_5 .original_name {{u_uart_core/u_uart_rx/rx_data[5]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_5 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_data[5]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_data_reg_5/Q .original_name {u_uart_core/u_uart_rx/rx_data[5]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_6 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_6 .original_name {{u_uart_core/u_uart_rx/rx_data[6]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_6 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_data[6]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_data_reg_6/Q .original_name {u_uart_core/u_uart_rx/rx_data[6]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_7 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_7 .original_name {{u_uart_core/u_uart_rx/rx_data[7]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/rx_data_reg_7 .single_bit_orig_name {u_uart_core/u_uart_rx/rx_data[7]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/rx_data_reg_7/Q .original_name {u_uart_core/u_uart_rx/rx_data[7]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_0 .original_name {{u_uart_core/u_uart_rx/sample_cnt[0]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_0 .single_bit_orig_name {u_uart_core/u_uart_rx/sample_cnt[0]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_0/Q .original_name {u_uart_core/u_uart_rx/sample_cnt[0]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_1 .original_name {{u_uart_core/u_uart_rx/sample_cnt[1]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_1 .single_bit_orig_name {u_uart_core/u_uart_rx/sample_cnt[1]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_1/Q .original_name {u_uart_core/u_uart_rx/sample_cnt[1]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_2 .original_name {{u_uart_core/u_uart_rx/sample_cnt[2]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_2 .single_bit_orig_name {u_uart_core/u_uart_rx/sample_cnt[2]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_2/Q .original_name {u_uart_core/u_uart_rx/sample_cnt[2]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_3 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_3 .original_name {{u_uart_core/u_uart_rx/sample_cnt[3]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_3 .single_bit_orig_name {u_uart_core/u_uart_rx/sample_cnt[3]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_3/Q .original_name {u_uart_core/u_uart_rx/sample_cnt[3]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_4 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_4 .original_name {{u_uart_core/u_uart_rx/sample_cnt[4]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_4 .single_bit_orig_name {u_uart_core/u_uart_rx/sample_cnt[4]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/sample_cnt_reg_4/Q .original_name {u_uart_core/u_uart_rx/sample_cnt[4]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_0 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_0 .original_name {{u_uart_core/u_uart_rx/sample_index[0]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_0 .single_bit_orig_name {u_uart_core/u_uart_rx/sample_index[0]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/sample_index_reg_0/Q .original_name {u_uart_core/u_uart_rx/sample_index[0]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_1 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_1 .original_name {{u_uart_core/u_uart_rx/sample_index[1]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_1 .single_bit_orig_name {u_uart_core/u_uart_rx/sample_index[1]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/sample_index_reg_1/Q .original_name {u_uart_core/u_uart_rx/sample_index[1]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_2 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_2 .original_name {{u_uart_core/u_uart_rx/sample_index[2]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_2 .single_bit_orig_name {u_uart_core/u_uart_rx/sample_index[2]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/sample_index_reg_2/Q .original_name {u_uart_core/u_uart_rx/sample_index[2]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_3 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_3 .original_name {{u_uart_core/u_uart_rx/sample_index[3]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/sample_index_reg_3 .single_bit_orig_name {u_uart_core/u_uart_rx/sample_index[3]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/sample_index_reg_3/Q .original_name {u_uart_core/u_uart_rx/sample_index[3]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/state_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/state_reg_1 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/state_reg_1 .original_name {{u_uart_core/u_uart_rx/state[1]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/state_reg_1 .single_bit_orig_name {u_uart_core/u_uart_rx/state[1]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/state_reg_1/Q .original_name {u_uart_core/u_uart_rx/state[1]/q}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/state_reg_1/QN .original_name {u_uart_core/u_uart_rx/state[1]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_1 .original_name {{u_uart_core/u_uart_rx/bit_cnt[1]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_1 .single_bit_orig_name {u_uart_core/u_uart_rx/bit_cnt[1]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_1/Q .original_name {u_uart_core/u_uart_rx/bit_cnt[1]/q}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/bit_cnt_reg_1/QN .original_name {u_uart_core/u_uart_rx/bit_cnt[1]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/state_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/state_reg_0 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/state_reg_0 .original_name {{u_uart_core/u_uart_rx/state[0]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_rx/state_reg_0 .single_bit_orig_name {u_uart_core/u_uart_rx/state[0]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/state_reg_0/Q .original_name {u_uart_core/u_uart_rx/state[0]/q}
set_db -quiet pin:asic_top/u_uart_core/u_uart_rx/state_reg_0/QN .original_name {u_uart_core/u_uart_rx/state[0]/q}
set_db -quiet module:asic_top/uart_tx .is_sop_cluster true
set_db -quiet module:asic_top/uart_tx .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/uart_tx.v} {../RTL} {}}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_done_reg .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_done_reg .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_done_reg .original_name u_uart_core/u_uart_tx/tx_done
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_done_reg .single_bit_orig_name u_uart_core/u_uart_tx/tx_done
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/tx_done_reg/Q .original_name u_uart_core/u_uart_tx/tx_done/q
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/uart_tx_reg .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/uart_tx_reg .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/uart_tx_reg .original_name u_uart_core/u_uart_tx/uart_tx
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/uart_tx_reg .single_bit_orig_name u_uart_core/u_uart_tx/uart_tx
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/uart_tx_reg/Q .original_name u_uart_core/u_uart_tx/uart_tx/q
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/uart_tx_reg/QN .original_name u_uart_core/u_uart_tx/uart_tx/q
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_1 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_1 .original_name {{u_uart_core/u_uart_tx/state[1]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_1 .single_bit_orig_name {u_uart_core/u_uart_tx/state[1]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/state_reg_1/Q .original_name {u_uart_core/u_uart_tx/state[1]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_2 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_2 .original_name {{u_uart_core/u_uart_tx/state[2]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_2 .single_bit_orig_name {u_uart_core/u_uart_tx/state[2]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/state_reg_2/Q .original_name {u_uart_core/u_uart_tx/state[2]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_0 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_0 .original_name {{u_uart_core/u_uart_tx/state[0]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/state_reg_0 .single_bit_orig_name {u_uart_core/u_uart_tx/state[0]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/state_reg_0/Q .original_name {u_uart_core/u_uart_tx/state[0]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_1 .original_name {{u_uart_core/u_uart_tx/bit_cnt[1]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_1 .single_bit_orig_name {u_uart_core/u_uart_tx/bit_cnt[1]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_1/Q .original_name {u_uart_core/u_uart_tx/bit_cnt[1]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_2 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_2 .original_name {{u_uart_core/u_uart_tx/tx_buffer[2]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_2 .single_bit_orig_name {u_uart_core/u_uart_tx/tx_buffer[2]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_2/Q .original_name {u_uart_core/u_uart_tx/tx_buffer[2]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_1 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_1 .original_name {{u_uart_core/u_uart_tx/tx_buffer[1]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_1 .single_bit_orig_name {u_uart_core/u_uart_tx/tx_buffer[1]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_1/Q .original_name {u_uart_core/u_uart_tx/tx_buffer[1]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_0 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_0 .original_name {{u_uart_core/u_uart_tx/tx_buffer[0]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_0 .single_bit_orig_name {u_uart_core/u_uart_tx/tx_buffer[0]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_0/Q .original_name {u_uart_core/u_uart_tx/tx_buffer[0]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_3 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_3 .original_name {{u_uart_core/u_uart_tx/tx_buffer[3]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_3 .single_bit_orig_name {u_uart_core/u_uart_tx/tx_buffer[3]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_3/Q .original_name {u_uart_core/u_uart_tx/tx_buffer[3]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_4 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_4 .original_name {{u_uart_core/u_uart_tx/tx_buffer[4]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_4 .single_bit_orig_name {u_uart_core/u_uart_tx/tx_buffer[4]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_4/Q .original_name {u_uart_core/u_uart_tx/tx_buffer[4]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_6 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_6 .original_name {{u_uart_core/u_uart_tx/tx_buffer[6]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_6 .single_bit_orig_name {u_uart_core/u_uart_tx/tx_buffer[6]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_6/Q .original_name {u_uart_core/u_uart_tx/tx_buffer[6]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_5 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_5 .original_name {{u_uart_core/u_uart_tx/tx_buffer[5]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_5 .single_bit_orig_name {u_uart_core/u_uart_tx/tx_buffer[5]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_5/Q .original_name {u_uart_core/u_uart_tx/tx_buffer[5]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_busy_reg .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_busy_reg .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_busy_reg .original_name u_uart_core/u_uart_tx/tx_busy
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_busy_reg .single_bit_orig_name u_uart_core/u_uart_tx/tx_busy
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/tx_busy_reg/Q .original_name u_uart_core/u_uart_tx/tx_busy/q
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_7 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_7 .original_name {{u_uart_core/u_uart_tx/tx_buffer[7]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_7 .single_bit_orig_name {u_uart_core/u_uart_tx/tx_buffer[7]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/tx_buffer_reg_7/Q .original_name {u_uart_core/u_uart_tx/tx_buffer[7]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_0 .original_name {{u_uart_core/u_uart_tx/bit_cnt[0]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_0 .single_bit_orig_name {u_uart_core/u_uart_tx/bit_cnt[0]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_0/Q .original_name {u_uart_core/u_uart_tx/bit_cnt[0]/q}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_0/QN .original_name {u_uart_core/u_uart_tx/bit_cnt[0]/q}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_2 .original_name {{u_uart_core/u_uart_tx/bit_cnt[2]}}
set_db -quiet inst:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_2 .single_bit_orig_name {u_uart_core/u_uart_tx/bit_cnt[2]}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_2/Q .original_name {u_uart_core/u_uart_tx/bit_cnt[2]/q}
set_db -quiet pin:asic_top/u_uart_core/u_uart_tx/bit_cnt_reg_2/QN .original_name {u_uart_core/u_uart_tx/bit_cnt[2]/q}
# BEGIN PMBIST SECTION
# END PMBIST SECTION
# BEGIN PHYSICAL ANNOTATION SECTION
# END PHYSICAL ANNOTATION SECTION
# BEGIN GLO TBR TABLE
set_db -quiet design:asic_top .set_boundary_change_new {start restore}
set_db -quiet design:asic_top .set_boundary_change_new {finish restore}
# END GLO TBR TABLE
set_db -quiet source_verbose true
#############################################################
#####   FLOW WRITE   ########################################
##
## Written by Genus(TM) Synthesis Solution version 22.17-s071_1
## flowkit v22.15-s003_1
## Written on 03:33:48 28-Oct 2026
#############################################################
#####   Flow Definitions   ##################################

#############################################################
#####   Step Definitions   ##################################


#############################################################
#####   Attribute Definitions   #############################

if {[is_attribute flow_edit_end_steps -obj_type root]} {set_db flow_edit_end_steps {}}
if {[is_attribute flow_edit_start_steps -obj_type root]} {set_db flow_edit_start_steps {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_db flow_footer_tcl {}}
if {[is_attribute flow_header_tcl -obj_type root]} {set_db flow_header_tcl {}}
if {[is_attribute flow_metadata -obj_type root]} {set_db flow_metadata {}}
if {[is_attribute flow_setup_config -obj_type root]} {set_db flow_setup_config {HUDDLE {!!map {}}}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_db flow_step_check_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_db flow_step_end_tcl {}}
if {[is_attribute flow_step_order -obj_type root]} {set_db flow_step_order {}}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_db flow_summary_tcl {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_db flow_template_feature_definition {}}
if {[is_attribute flow_template_type -obj_type root]} {set_db flow_template_type {}}
if {[is_attribute flow_template_tools -obj_type root]} {set_db flow_template_tools {}}
if {[is_attribute flow_template_version -obj_type root]} {set_db flow_template_version {}}
if {[is_attribute flow_user_templates -obj_type root]} {set_db flow_user_templates {}}


#############################################################
#####   Flow History   ######################################

if {[is_attribute flow_user_templates -obj_type root]} {set_db flow_user_templates {}}
if {[is_attribute flow_plugin_steps -obj_type root]} {set_db flow_plugin_steps {}}
if {[is_attribute flow_template_type -obj_type root]} {set_db flow_template_type {}}
if {[is_attribute flow_template_tools -obj_type root]} {set_db flow_template_tools {}}
if {[is_attribute flow_template_version -obj_type root]} {set_db flow_template_version {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_db flow_template_feature_definition {}}
if {[is_attribute flow_remark -obj_type root]} {set_db flow_remark {}}
if {[is_attribute flow_features -obj_type root]} {set_db flow_features {}}
if {[is_attribute flow_feature_values -obj_type root]} {set_db flow_feature_values {}}
if {[is_attribute flow_write_db_args -obj_type root]} {set_db flow_write_db_args {}}
if {[is_attribute flow_write_db_sdc -obj_type root]} {set_db flow_write_db_sdc true}
if {[is_attribute flow_write_db_common -obj_type root]} {set_db flow_write_db_common false}
if {[is_attribute flow_post_db_overwrite -obj_type root]} {set_db flow_post_db_overwrite {}}
if {[is_attribute flow_step_order -obj_type root]} {set_db flow_step_order {}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_db flow_step_end_tcl {}}
if {[is_attribute flow_step_last -obj_type root]} {set_db flow_step_last {}}
if {[is_attribute flow_step_current -obj_type root]} {set_db flow_step_current {}}
if {[is_attribute flow_step_canonical_current -obj_type root]} {set_db flow_step_canonical_current {}}
if {[is_attribute flow_step_next -obj_type root]} {set_db flow_step_next {}}
if {[is_attribute flow_working_directory -obj_type root]} {set_db flow_working_directory .}
if {[is_attribute flow_branch -obj_type root]} {set_db flow_branch {}}
if {[is_attribute flow_caller_data -obj_type root]} {set_db flow_caller_data {}}
if {[is_attribute flow_metrics_snapshot_uuid -obj_type root]} {set_db flow_metrics_snapshot_uuid {}}
if {[is_attribute flow_starting_db -obj_type root]} {set_db flow_starting_db {}}
if {[is_attribute flow_db_directory -obj_type root]} {set_db flow_db_directory dbs}
if {[is_attribute flow_report_directory -obj_type root]} {set_db flow_report_directory reports}
if {[is_attribute flow_log_directory -obj_type root]} {set_db flow_log_directory logs}
if {[is_attribute flow_mail_to -obj_type root]} {set_db flow_mail_to {}}
if {[is_attribute flow_exit_when_done -obj_type root]} {set_db flow_exit_when_done false}
if {[is_attribute flow_mail_on_error -obj_type root]} {set_db flow_mail_on_error false}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_db flow_summary_tcl {}}
if {[is_attribute flow_history -obj_type root]} {set_db flow_history {}}
if {[is_attribute flow_step_last_status -obj_type root]} {set_db flow_step_last_status not_run}
if {[is_attribute flow_step_last_msg -obj_type root]} {set_db flow_step_last_msg {}}
if {[is_attribute flow_run_tag -obj_type root]} {set_db flow_run_tag {}}
if {[is_attribute flow_current_cache -obj_type root]} {set_db flow_current_cache {}}
if {[is_attribute flow_step_order_cache -obj_type root]} {set_db flow_step_order_cache {}}
if {[is_attribute flow_step_results_cache -obj_type root]} {set_db flow_step_results_cache {}}
if {[is_attribute flow_metadata -obj_type root]} {set_db flow_metadata {}}
if {[is_attribute flow_execute_in_global -obj_type root]} {set_db flow_execute_in_global true}
if {[is_attribute flow_overwrite_db -obj_type root]} {set_db flow_overwrite_db false}
if {[is_attribute flow_print_run_information -obj_type root]} {set_db flow_print_run_information false}
if {[is_attribute flow_verbose -obj_type root]} {set_db flow_verbose true}
if {[is_attribute flow_print_run_information_full -obj_type root]} {set_db flow_print_run_information_full false}
if {[is_attribute flow_header_tcl -obj_type root]} {set_db flow_header_tcl {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_db flow_footer_tcl {}}
if {[is_attribute flow_init_header_tcl -obj_type root]} {set_db flow_init_header_tcl {}}
if {[is_attribute flow_init_footer_tcl -obj_type root]} {set_db flow_init_footer_tcl {}}
if {[is_attribute flow_edit_start_steps -obj_type root]} {set_db flow_edit_start_steps {}}
if {[is_attribute flow_edit_end_steps -obj_type root]} {set_db flow_edit_end_steps {}}
if {[is_attribute flow_step_last_number -obj_type root]} {set_db flow_step_last_number 0}
if {[is_attribute flow_autoload_applets -obj_type root]} {set_db flow_autoload_applets false}
if {[is_attribute flow_autoload_dir -obj_type root]} {set_db flow_autoload_dir error}
if {[is_attribute flow_skip_auto_db_save -obj_type root]} {set_db flow_skip_auto_db_save true}
if {[is_attribute flow_skip_auto_generate_metrics -obj_type root]} {set_db flow_skip_auto_generate_metrics false}
if {[is_attribute flow_top -obj_type root]} {set_db flow_top {}}
if {[is_attribute flow_hier_path -obj_type root]} {set_db flow_hier_path {}}
if {[is_attribute flow_schedule -obj_type root]} {set_db flow_schedule {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_db flow_step_check_tcl {}}
if {[is_attribute flow_script -obj_type root]} {set_db flow_script {}}
if {[is_attribute flow_yaml_script -obj_type root]} {set_db flow_yaml_script {}}
if {[is_attribute flow_cla_enabled_features -obj_type root]} {set_db flow_cla_enabled_features {}}
if {[is_attribute flow_cla_inject_tcl -obj_type root]} {set_db flow_cla_inject_tcl {}}
if {[is_attribute flow_error_message -obj_type root]} {set_db flow_error_message {}}
if {[is_attribute flow_error_errorinfo -obj_type root]} {set_db flow_error_errorinfo {}}
if {[is_attribute flow_exclude_time_for_init_flow -obj_type root]} {set_db flow_exclude_time_for_init_flow false}
if {[is_attribute flow_error_write_db -obj_type root]} {set_db flow_error_write_db true}
if {[is_attribute flow_advanced_metric_isolation -obj_type root]} {set_db flow_advanced_metric_isolation flow}
if {[is_attribute flow_yaml_root -obj_type root]} {set_db flow_yaml_root {}}
if {[is_attribute flow_yaml_root_dir -obj_type root]} {set_db flow_yaml_root_dir {}}
if {[is_attribute flow_setup_config -obj_type root]} {set_db flow_setup_config {HUDDLE {!!map {}}}}

#############################################################
#####   User Defined Attributes   ###########################

