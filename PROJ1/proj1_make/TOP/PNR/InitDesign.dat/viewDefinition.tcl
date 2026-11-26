if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name FF_LIBS\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast_vdd1v0_basicCells.lib]
create_library_set -name SS_LIBS\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow_vdd1v0_basicCells.lib]
create_rc_corner -name BEST\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/BEST/gpdk045.tch
create_rc_corner -name WORST\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 125\
   -qx_tech_file ${::IMEX::libVar}/mmmc/BEST/gpdk045.tch
create_delay_corner -name FF_BEST\
   -library_set FF_LIBS\
   -rc_corner BEST
create_delay_corner -name SS_WORST\
   -library_set SS_LIBS\
   -rc_corner WORST
create_constraint_mode -name FUNC\
   -sdc_files\
    [list ${::IMEX::libVar}/mmmc/uart_top.sdc]
create_analysis_view -name FUNC_SS_WORST -constraint_mode FUNC -delay_corner SS_WORST
create_analysis_view -name FUNC_FF_BEST -constraint_mode FUNC -delay_corner FF_BEST
set_analysis_view -setup [list FUNC_SS_WORST] -hold [list FUNC_FF_BEST]
