# Rectangular envelope checks only, based on user-reported LEF SIZE values.
# Does not model LEF ORIGIN, PG pins, OBS, DRC, filler rules, current or IR drop.
proc uart_geometry_read {path} {
    set ch [open $path r]
    set data [read $ch]
    close $ch
    return $data
}
proc uart_geometry_option {command option} {
    set at [lsearch -exact $command $option]
    if {$at < 0 || $at + 1 >= [llength $command]} { error "Missing option: $option" }
    return [lindex $command [expr {$at + 1}]]
}
proc uart_validate_floorplan {dir} {
    set init [uart_geometry_read [file join $dir 0_InitDesign.tcl]]
    if {![regexp -line {^floorPlan[^\n]+} $init floor]} { error "Missing floorPlan" }
    set at [lsearch -exact $floor -d]
    if {$at < 0} {error "Expected explicit die dimensions (-d)"}
    set dimensions [lrange $floor [expr {$at+1}] end]
    if {$dimensions ne {2000 2000 350 350 350 350}} {
        error "Geometry checker expects the 2000um die / 350um margin trial"
    }
    set io [uart_geometry_read [file join $dir init.io]]
    set total 0
    foreach {side count} {left 8 bottom 12 right 12 top 9} {
        set pattern [format {(?s)    \(%s\n(.*?)\n    \)} $side]
        if {![regexp $pattern $io match block]} {error "Missing IO side $side"}
        set entries [regexp -all -inline {\(inst\s+name="([^"]+)"\s+cell="([^"]+)"\s+offset=([0-9.]+)\)} $block]
        if {[llength $entries] != $count*4} { error "Wrong pad count/format on $side" }
        set previous_end -1
        foreach {match name cell offset} $entries {
            if {$cell ni {PADDI PADDO PADVDD PADVSS PADVDDIOR PADVSSIOR}} {
                error "Unknown cell size: $cell"
            }
            if {$offset < 240 || $offset + 60 > 1760} {
                error "Pad outside usable edge/corner overlap: $name"
            }
            if {$previous_end >= 0 && $offset - $previous_end < 40} {
                error "Pad overlap or gap below the trial 40um: $name"
            }
            set previous_end [expr {$offset + 60}]
            incr total
        }
        puts "PASS geometry: $side, $count pads, corner bounds and gaps"
    }
    set power [uart_geometry_read [file join $dir 1_PowerPlan.tcl]]
    set rings [regexp -all -inline -line {^addRing[^\n]+} $power]
    if {[llength $rings] != 1} {error "Expected one core ring; remove the old external ring"}
    set ring [lindex $rings 0]
    if {[uart_geometry_option $ring -nets] ne {VDD VSS}} {error "Unexpected ring nets"}
    foreach side {top bottom left right} {
        set width [dict get [uart_geometry_option $ring -width] $side]
        set spacing [dict get [uart_geometry_option $ring -spacing] $side]
        set offset [dict get [uart_geometry_option $ring -offset] $side]
        if {$width != 5 || $spacing != 5 || $offset != 20} {
            error "Unexpected ring dimensions on $side"
        }
        set clearance [expr {350 - 240 - ($offset + 2*$width + $spacing)}]
        if {$clearance < 0} {error "Ring envelope intersects pad depth on $side"}
    }
    set stripes [regexp -all -inline -line {^addStripe[^\n]+} $power]
    if {[llength $stripes] != 1} {error "Expected one core stripe array, no ring bridges"}
    set stripe [lindex $stripes 0]
    set width [uart_geometry_option $stripe -width]
    set spacing [uart_geometry_option $stripe -spacing]
    set pitch [uart_geometry_option $stripe -set_to_set_distance]
    set start [uart_geometry_option $stripe -start_offset]
    set stop [uart_geometry_option $stripe -stop_offset]
    if {$width != 5 || $spacing != 5 || $pitch != 100 || $start != 50 || $stop != 0} {
        error "Unexpected stripe dimensions"
    }
    if {[uart_geometry_option $stripe -direction] ne "vertical" ||
        [uart_geometry_option $stripe -layer] ne "Metal10"} {error "Unexpected stripe layer/direction"}
    # Full VDD/VSS pairs under an ideal 1300um core before site/track snapping.
    set pairs 0
    for {set x $start} {$x + 2*$width + $spacing <= 1300-$stop} {set x [expr {$x+$pitch}]} {
        incr pairs
    }
    if {$pairs == 0 || $pitch < 2*$width+$spacing} {error "Invalid stripe array"}
    puts "PASS geometry: $total pads; 1300um core; ring/pad clearance ${clearance}um; $pairs ideal stripe pairs"
    puts "Geometry only: Innovus IO legality, PG connectivity, DRC and IR drop remain unverified."
}
uart_validate_floorplan [file dirname [file normalize [info script]]]
