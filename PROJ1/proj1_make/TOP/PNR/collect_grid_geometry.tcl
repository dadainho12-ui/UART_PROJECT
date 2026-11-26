# Read-only Innovus data collection. Writes one TSV report; does not modify/save design.
proc uart_grid_query {args} {
    if {[catch {eval [linsert $args 0 dbGet]} value]} {return "QUERY_ERROR: $value"}
    return [string map [list "\t" " " "\n" " " "\r" " "] $value]
}
proc uart_collect_grid_geometry {} {
    set instances [dbGet top.insts]
    if {[llength $instances] == 0 || $instances eq "0x0"} {
        error "Load InitDesign.dat before collecting geometry"
    }
    set file [file normalize [format "grid_geometry_%s.tsv" [clock seconds]]]
    set out [open $file w]
    set status [catch {
        puts $out "# Innovus grid geometry; read-only collection"
        puts $out "# Units: microns unless a column ends with _DBU"
        foreach field {mfgGrid dbUnits} {puts $out [list META $field [uart_grid_query head.$field]]}
        foreach field {box coreBox} {puts $out [list FLOORPLAN $field [uart_grid_query top.fPlan.$field]]}
        foreach type {manufacturing placement inst} {
            foreach option {-origin -pitch_x -pitch_y} {
                if {[catch {get_snap_grid_info -type $type $option} value]} {set value "QUERY_ERROR: $value"}
                puts $out [list GRID $type $option $value]
            }
        }
        foreach site [dbGet head.sites] {
            puts $out [join [list SITE [uart_grid_query $site.name] [uart_grid_query $site.size] \
                [uart_grid_query -d $site.size] [uart_grid_query $site.symmetryX] \
                [uart_grid_query $site.symmetryY]] "\t"]
        }
        puts $out [join {TYPE NAME CELL BASE_CLASS SUB_CLASS STATUS ORIENT POINT BOX CELL_SIZE POINT_DBU BOX_DBU CELL_SIZE_DBU} "\t"]
        foreach ptr $instances {
            set values [list INSTANCE]
            foreach field {name cell.name cell.baseClass cell.subClass pStatus orient pt box cell.size} {
                lappend values [uart_grid_query $ptr.$field]
            }
            foreach field {pt box cell.size} {lappend values [uart_grid_query -d $ptr.$field]}
            puts $out [join $values "\t"]
        }
        puts $out [join {TYPE NAME SITE ORIENT BOX STEP_X STEP_Y NUM_X NUM_Y BOX_DBU STEP_X_DBU STEP_Y_DBU} "\t"]
        foreach row [dbGet top.fPlan.rows] {
            set values [list ROW]
            foreach field {name site.name orient box stepX stepY numX numY} {lappend values [uart_grid_query $row.$field]}
            foreach field {box stepX stepY} {lappend values [uart_grid_query -d $row.$field]}
            puts $out [join $values "\t"]
        }
    } message options]
    close $out
    if {$status} {return -options $options $message}
    puts "WROTE: $file"
    puts "Collected [llength $instances] instance records; design unchanged and not saved."
}
uart_collect_grid_geometry
