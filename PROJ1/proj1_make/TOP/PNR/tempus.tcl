source [file join [file dirname [info script]] pnr_config.tcl]
################
### SET UP #####
################
# If you open design in GUI, just type <RouteDesign_mmmc1> in the window
# Below is for the tempus shell
read_design RouteDesign.dat asic_top ; #mmmc2 format is for -stylus
#read_design chipFinish_after_ECO.dat asic_top ; #mmmc2 format is for -stylus

check_timing ;# Warnings are skipped
report_annotated_parasitics ; # Check if real net (complete) is 100%
report_analysis_coverage ; # Determine violated spots are all 0

# Deal with DataCheckSetup and DataCheckHold :: Constant is skipped
report_analysis_coverage -check_type data_setup -verbose untested -exclude_untested const

##############################
### BELOW is ECO #############
### From FIX HOLD to CHECK ###
##############################
# If your design should be fixed, Do below FIX HOLD & CHECK sections
# If your design should not be fixed, just go to FILE OUT section

#######################
### ECO 0: FIX HOLD ###
#######################
# First, Timing SI -> Debug Timing -> Browse -> Generate (Turn on ) -> Check Type (Setup OR Hold)
# Select Point -> Click Mouse Right Button -> Show Timing Path Analyzer
# Interactive ECO/WhatIf -> Add Repeater
# Evaluation Type -> Early -> New Cells -> Select Buf Cell -> Apply -> Close

# TIP : add_repeater at the last net which is connected End Point


#######################
#### ECO 1 : CHECK ####
#######################

#report_analysis_coverage ; # Determine violated spots are all 0

# Deal with DataCheckSetup and DataCheckHold :: Constant is skipped
#report_analysis_coverage -check_type data_setup -verbose untested -exclude_untested const

#write_eco -format innovus -output innovus.eco; # Last action of ECO

##################
#### FILE OUT ####
##################
write_sdf -view FUNC_SS_WORST asic_top_post_wst.sdf
write_sdf -view FUNC_FF_BEST asic_top_post_bst.sdf


