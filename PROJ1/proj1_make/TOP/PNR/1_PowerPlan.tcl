source [file join [file dirname [file normalize [info script]]] uart_top_config.tcl]
uart_prepare_stage InitDesign

globalNetConnect VDD -type pgpin -pin VDD -instanceBasename *
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename *
globalNetConnect VDD -type tiehi -instanceBasename *
globalNetConnect VSS -type tielo -instanceBasename *
setTieHiLoMode -reset
setTieHiLoMode -cell {TIELO TIEHI} -honorDontTouch false -createHierPort false

# Trial grid for the ~32 um core. The 5 um margins accommodate the two rings.
# Increase the parallel VDD/VSS ring gap to address Metal10/11 PRL markers.
addRing -nets {VDD VSS} -type core_rings -follow core \
    -layer {top Metal11 bottom Metal11 left Metal10 right Metal10} \
    -width 0.8 -spacing 1.6 -offset 0.8
setAddStripeMode -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1
addStripe -nets {VDD VSS} -layer Metal10 -direction vertical \
    -width 0.8 -spacing 0.8 -set_to_set_distance 16 -start_from left -start_offset 7
foreach net {VDD VSS} {
    createPGPin -onDie -net $net -width 0.8 -length 2.0
}
sroute -connect {corePin} -corePinTarget {firstAfterRowEnd} \
    -layerChangeRange {Metal1 Metal11} -allowJogging 1 -allowLayerChange 1 -nets {VDD VSS}
verifyConnectivity -type special -nets {VDD VSS} -report reports/pg_connectivity.rpt
set_verify_drc_mode -report reports/powerplan_drc.rpt
verify_drc
saveDesign -def PowerPlan
