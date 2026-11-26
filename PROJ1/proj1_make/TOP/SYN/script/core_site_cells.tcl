# Collect the placement site declared by each standard-cell LEF macro.
proc read_core_cell_sites {lefs} {
    set sites [dict create]
    foreach lef $lefs {
        set channel [open $lef r]
        set macro ""
        while {[gets $channel line] >= 0} {
            if {[regexp {^\s*MACRO\s+(\S+)} $line -> name]} {
                set macro $name
            } elseif {$macro ne "" && [string trim $line] eq "END $macro"} {
                set macro ""
            } elseif {$macro ne "" && [regexp {^\s*SITE\s+([^;\s]+)\s*;} $line -> site]} {
                dict set sites $macro $site
            }
        }
        close $channel
    }
    if {"CoreSite" ni [dict values $sites]} {
        error "No CoreSite masters found in the configured LEFs"
    }
    return $sites
}
