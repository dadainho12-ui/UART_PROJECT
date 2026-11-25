# Restore PADVDD/PADVSS edge placement after floorPlan's Area-IO relocation.
# Infer the side's direction and orientation from the two already placed IOR pads,
# rather than assuming init.io uses the same offset direction on every side.
proc uart_pad_ptr {name} {
    set ptr [dbGet top.insts.name $name -p]
    if {[llength $ptr] != 1 || $ptr eq "0x0"} {error "Missing/ambiguous pad: $name"}
    return $ptr
}
proc uart_pad_box {ptr} {
    set box [regexp -all -inline {[-+]?[0-9]+(?:\.[0-9]+)?} [dbGet $ptr.box]]
    if {[llength $box] != 4} {error "Cannot read pad box: $ptr"}
    return $box
}
proc uart_boxes_overlap {a b} {
    lassign $a ax1 ay1 ax2 ay2
    lassign $b bx1 by1 bx2 by2
    return [expr {min($ax2,$bx2)-max($ax1,$bx1)>0.000001 &&
                  min($ay2,$by2)-max($ay1,$by1)>0.000001}]
}
proc uart_place_power_pads {dir} {
    set io [uart_geometry_read [file join $dir init.io]]
    set die [regexp -all -inline {[-+]?[0-9]+(?:\.[0-9]+)?} [dbGet top.fPlan.box]]
    if {[llength $die] != 4} {error "Cannot read die box"}
    lassign $die dx1 dy1 dx2 dy2
    set moved [dict create]
    foreach side {left bottom right top} {
        set pattern [format {(?s)    \(%s\n(.*?)\n    \)} $side]
        if {![regexp $pattern $io match block]} {error "Missing IO side: $side"}
        set offsets [dict create]
        foreach {match name cell offset} [regexp -all -inline {\(inst\s+name="([^"]+)"\s+cell="([^"]+)"\s+offset=([0-9.]+)\)} $block] {
            dict set offsets $name $offset
        }
        set a u_${side}_vddior
        set b u_${side}_vssior
        set ap [uart_pad_ptr $a]
        set bp [uart_pad_ptr $b]
        set ab [uart_pad_box $ap]
        set bb [uart_pad_box $bp]
        lassign $ab ax1 ay1 ax2 ay2
        lassign $bb bx1 by1 bx2 by2
        set step [expr {[dict get $offsets $b]-[dict get $offsets $a]}]
        if {$step <= 0} {error "IOR offset order invalid on $side"}
        set vx [expr {($bx1-$ax1)/$step}]
        set vy [expr {($by1-$ay1)/$step}]
        set orient [dbGet $ap.orient]
        if {$orient ne [dbGet $bp.orient]} {error "IOR orientations differ on $side"}
        if {$side in {left right}} {
            if {abs($vx)>0.000001 || abs(abs($vy)-1)>0.000001 ||
                abs(($ax2-$ax1)-240)>0.000001 || abs(($ay2-$ay1)-60)>0.000001} {
                error "Unexpected IOR dimensions/direction on $side"
            }
            set edge [expr {$side eq "left" ? $dx1 : $dx2-240}]
            if {abs($ax1-$edge)>0.000001 || abs($bx1-$edge)>0.000001} {
                error "IOR anchors are not on the $side die edge"
            }
        } else {
            if {abs($vy)>0.000001 || abs(abs($vx)-1)>0.000001 ||
                abs(($ax2-$ax1)-60)>0.000001 || abs(($ay2-$ay1)-240)>0.000001} {
                error "Unexpected IOR dimensions/direction on $side"
            }
            set edge [expr {$side eq "bottom" ? $dy1 : $dy2-240}]
            if {abs($ay1-$edge)>0.000001 || abs($by1-$edge)>0.000001} {
                error "IOR anchors are not on the $side die edge"
            }
        }
        foreach suffix {vdd vss} {
            set name u_${side}_${suffix}
            set ptr [uart_pad_ptr $name]
            set delta [expr {[dict get $offsets $name]-[dict get $offsets $a]}]
            set x [expr {$ax1+$delta*$vx}]
            set y [expr {$ay1+$delta*$vy}]
            set target [list $x $y [expr {$ax2+$delta*$vx}] [expr {$ay2+$delta*$vy}]]
            # Coordinates are die-edge IO locations, so ManufacturingGrid applies.
            uart_require_grid $name $x $y 0.005 0.005 0 0
            placeInstance $name $x $y $orient
            dbSet $ptr.pStatus fixed
            set actual [uart_pad_box $ptr]
            foreach got $actual want $target {
                if {abs($got-$want)>0.000001} {error "Unexpected placed box for $name: $actual, expected $target"}
            }
            lassign $actual x1 y1 x2 y2
            if {$x1<$dx1-0.000001 || $y1<$dy1-0.000001 || $x2>$dx2+0.000001 || $y2>$dy2+0.000001} {
                error "$name placed outside die"
            }
            dict set moved $name $actual
            puts "Power pad placed: $name $actual $orient"
        }
    }
    # Check all eight relocated pads against every named IO and corner BEFORE fillers.
    set io_names [regexp -all -inline {\(inst\s+name="([^"]+)"} $io]
    dict for {name box} $moved {
        foreach {match other} $io_names {
            if {$other eq $name} {continue}
            if {[uart_boxes_overlap $box [uart_pad_box [uart_pad_ptr $other]]]} {
                error "Power-pad/IO overlap: $name and $other"
            }
        }
    }
    puts "PASS: eight core power pads restored to die-edge IO slots, fixed and checked for IO/corner overlap"
}
uart_place_power_pads [file dirname [file normalize [info script]]]
