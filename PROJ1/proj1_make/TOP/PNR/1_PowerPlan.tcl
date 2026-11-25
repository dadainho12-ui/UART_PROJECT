source [file join [file dirname [info script]] pnr_config.tcl]

########################################
# PowerPlan
########################################

source [file join $pnr_dir validate_floorplan.tcl]
# Rebuild InitDesign after changing die dimensions; do not reuse a 4030um checkpoint.
if {![info exists ::pnr_batch]} { restoreDesign InitDesign.dat }
# PG pin names/domains must match the actual IO LEF; retained from the reference.
## Global Net Connection
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename *
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename *
globalNetConnect VDD -type tiehi -instanceBasename *
globalNetConnect VSS -type tielo -instanceBasename *
setTieHiLoMode -reset
setTieHiLoMode -cell {  TIELO TIEHI } -honorDontTouch false -createHierPort false

## Single VDD/VSS core ring: fits inside the 110um pad-to-core channel.
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }

addRing -nets {VDD VSS} -type core_rings -follow core -layer {top Metal11 bottom Metal11 left Metal10 right Metal10} -width {top 5 bottom 5 left 5 right 5} -spacing {top 5 bottom 5 left 5 right 5} -offset {top 20 bottom 20 left 20 right 20} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

## Make Vertical Stripe in Core Area
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target ring -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }

addStripe -nets {VDD VSS} -layer Metal10 -direction vertical -width 5 -spacing 5 -set_to_set_distance 100 -start_from left -start_offset 50 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None


## Make STD cells's Power Rail
setSrouteMode -viaConnectToShape { noshape }

sroute -connect { corePin } -layerChangeRange { Metal1(1) Metal11(11) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { Metal1(1) Metal11(11) } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { Metal1(1) Metal11(11) }

## Connect power pads directly to the single core ring
setSrouteMode -viaConnectToShape { noshape }

sroute -connect { padPin } -layerChangeRange { Metal1(1) Metal11(11) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -allowJogging 1 -crossoverViaLayerRange { Metal1(1) Metal11(11) } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { Metal1(1) Metal11(11) }


# Check PG nets only: signal routing has not run. Do not suppress opens/unconnected pins.
file mkdir reports/powerplan
verifyConnectivity -type special -nets {VDD VSS} -report reports/powerplan/pg_connectivity.rpt -error 1000 -warning 50

## If there is no error, Save Design
checkDesign -floorplan -powerGround -outdir reports/powerplan
saveDesign -def PowerPlan

if {![info exists ::pnr_batch]} { exit }
