# Disposable diagnostic session ONLY.
# Start a NEW Innovus process, run: restoreDesign InitDesign.dat
# Then source this script. It NEVER restores or saves a design.
# It deletes eight power pads IN MEMORY. Close the session WITHOUT SAVING afterward.
proc uart_area_io_once {} {
    if {[info exists ::uart_area_io_once_ran]} {error "Already run: close this diagnostic session without saving"}
    if {[llength [info commands deleteInst]] == 0} {error "deleteInst is unavailable; no deletion performed"}
    set names {}
    foreach ptr [dbGet top.insts] {
        if {$ptr eq "0x0"} {error "No design loaded: start a new session and load InitDesign.dat once"}
        if {[dbGet $ptr.cell.subClass] eq "padAreaIO"} {lappend names [dbGet $ptr.name]}
    }
    set expected {u_left_vdd u_left_vss u_bottom_vdd u_bottom_vss u_right_vdd u_right_vss u_top_vdd u_top_vss}
    if {[lsort $names] ne [lsort $expected]} {error "Unexpected Area IO set; no deletion performed: $names"}
    set ::uart_area_io_once_ran 1
    puts "DIAGNOSTIC ONLY: after this test close the session WITHOUT SAVING."
    set status [catch {
        puts "===== BASELINE: eight Area IO power pads present ====="
        checkFPlan -outFile area_io_baseline.txt
        puts "===== TEMPORARY: deleting only these instances from memory: $names ====="
        foreach name $names {deleteInst $name}
        foreach ptr [dbGet top.insts] {
            if {$ptr eq "0x0"} {continue}
            if {[dbGet $ptr.cell.subClass] eq "padAreaIO"} {error "Area IO still present after deletion"}
        }
        checkFPlan -outFile area_io_removed.txt
    } message options]
    puts "DO NOT SAVE / DO NOT CONTINUE PNR in this session."
    puts "The script did not write InitDesign.dat and does not reload it."
    puts "Close this session; use a NEW process to load the original checkpoint afterward."
    if {$status} {return -options $options $message}
    puts "DONE: send the BASELINE and TEMPORARY output, then close WITHOUT SAVING."
}
uart_area_io_once
