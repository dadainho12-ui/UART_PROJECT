# Shared configuration. Run in Innovus legacy command mode (not -stylus).
set pnr_dir [file dirname [file normalize [info script]]]
cd $pnr_dir
set gpdk_root /GPDK045
if {[info exists ::env(GPDK045_ROOT)]} {
    set gpdk_root [file normalize $::env(GPDK045_ROOT)]
}
set std_root [file join $gpdk_root digital gsclib045_all_v4.4]
set io_root [file join $gpdk_root digital giolib045_v3.5]
set pnr_lefs [list \
    [file join $std_root gsclib045_tech lef gsclib045_tech.lef] \
    [file join $std_root gsclib045 lef gsclib045_macro.lef] \
    [file join $io_root lef giolib045_modify.lef]]
set qrc_tech [file join $std_root gsclib045 qrc qx gpdk045.tch]
if {[info exists ::env(QRC_TECH_FILE)]} {
    set qrc_tech [file normalize $::env(QRC_TECH_FILE)]
}
proc require_pnr_file {path} {
    if {![file isfile $path] || ![file readable $path]} {
        error "Missing/unreadable PNR input: $path (see README_PNR.md)"
    }
}
foreach dir {reports/clock reports/timing/preCTS reports/timing/postCTS run1} {
    file mkdir $dir
}
