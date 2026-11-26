# Diagnostic only: keep cells UNPLACED, compare checkFPlan, restore original points.
# No saveDesign, placement, routing, netlist or library edits.
proc uart_diag_numbers {value count} {
    set numbers [regexp -all -inline {[-+]?[0-9]+(?:\.[0-9]+)?} $value]
    if {[llength $numbers] != $count} {error "Unexpected coordinate format: $value"}
    return $numbers
}
proc uart_diagnose_unplaced_grid {} {
    set origin [uart_diag_numbers [get_snap_grid_info -type inst -origin] 2]
    set saved {}
    foreach ptr [dbGet top.insts.pStatus unplaced -p] {
        if {$ptr eq "0x0"} {continue}
        if {[dbGet $ptr.cell.baseClass] ne "core"} {continue}
        set status [dbGet $ptr.pStatus]
        if {$status ne "unplaced"} {error "Unexpected status before test"}
        lappend saved [list $ptr [uart_diag_numbers [dbGet $ptr.pt] 2] $status]
    }
    if {[llength $saved] == 0} {error "No unplaced core cells; comparison is not applicable"}
    puts "===== BEFORE: original points, [llength $saved] unplaced core cells ====="
    checkFPlan -outFile grid_diag_before.txt
    set test_status [catch {
        foreach record $saved {
            lassign $record ptr pt status
            dbSet $ptr.pt $origin
            dbSet $ptr.pStatus $status
            if {[dbGet $ptr.pStatus] ne "unplaced"} {error "Cannot preserve unplaced status"}
            foreach got [uart_diag_numbers [dbGet $ptr.pt] 2] want $origin {
                if {abs($got-$want)>0.000001} {error "Temporary coordinate was not applied"}
            }
        }
        puts "===== TEMPORARY: points at $origin; all cells still UNPLACED ====="
        checkFPlan -outFile grid_diag_temporary.txt
    } test_message test_options]
    # Attempt every restoration even if a test or an earlier restoration failed.
    set restore_errors {}
    foreach record $saved {
        lassign $record ptr pt status
        if {[catch {
            dbSet $ptr.pt $pt
            dbSet $ptr.pStatus $status
            foreach got [uart_diag_numbers [dbGet $ptr.pt] 2] want $pt {
                if {abs($got-$want)>0.000001} {error "Coordinate restore mismatch for $ptr"}
            }
            if {[dbGet $ptr.pStatus] ne $status} {error "Status restore mismatch for $ptr"}
        } message]} {lappend restore_errors $message}
    }
    if {[llength $restore_errors]} {
        puts "RESTORE FAILED: $restore_errors"
        error "Do not save this session; reopen InitDesign.dat in a fresh session"
    }
    puts "RESTORE OK: original coordinates/status restored; no design saved."
    if {$test_status} {return -options $test_options $test_message}
    puts "===== RESTORED: original points again ====="
    checkFPlan -outFile grid_diag_restored.txt
    puts "DONE: compare BEFORE / TEMPORARY / RESTORED console messages. This was not placement."
}
uart_diagnose_unplaced_grid
