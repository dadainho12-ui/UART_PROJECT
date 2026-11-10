source [file join [file dirname [info script]] pnr_config.tcl]
#######################
#### Chip Finish ######
#######################
if {![info exists ::pnr_batch]} { restoreDesign RouteDesign.dat }
# Add Filler
getFillerMode -quiet
addFiller -cell FILL1 FILL8 FILL64 FILL4 FILL32 FILL2 FILL16 -prefix FILLER
extractRC
# If there is no error, save Design
saveDesign -rc -def ChipFinish

#####################
#### Write Out ######
#####################
# Write Out Files
# GDS file : without layermap file for GPDK045
streamOut asic_top.gds -libName DesignLib -units 2000 -mode ALL

# Write Out Constraint
writeTimingCon asic_top.sdc

# Preserve power pad instances in the physical netlist.
saveNetlist -flat asic_top.v

# SDF OUT, but I recommend to use sdf file which is from Tempus tool
# SDF version 3.0 :: RECREM included in the SDF file
write_sdf asic_top.sdf

# SDF version 2.1
write_sdf -version 2.1 asic_top.sdf_2.1


verify_drc
verifyConnectivity -type all -geomConnect -error 1000 -warning 50
