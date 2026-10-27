################################################################################
#
# Genus(TM) Synthesis Solution setup file
# Created by Genus(TM) Synthesis Solution 22.17-s071_1
#   on 10/28/2026 03:33:50
#
# This file can only be run in Genus Common UI mode.
#
################################################################################


# This script is intended for use with Genus(TM) Synthesis Solution version 22.17-s071_1


# Remove Existing Design
################################################################################
if {[::legacy::find -design design:asic_top] ne ""} {
  puts "** A design with the same name is already loaded. It will be removed. **"
  delete_obj design:asic_top
}


# To allow user-readonly attributes
################################################################################
::legacy::set_attribute -quiet force_tui_is_remote 1 /

phys::read_script ./mapped/asic_top_mapped.root.g


# Libraries
################################################################################
::legacy::set_attribute library {/home/hah002/UART_PROJECT/PROJ1/proj1_make/TOP/SYN/../../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/timing/fast_vdd1v0_basicCells.lib /home/hah002/UART_PROJECT/PROJ1/proj1_make/TOP/SYN/../../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/timing/slow_vdd1v0_basicCells.lib /home/hah002/UART_PROJECT/PROJ1/proj1_make/TOP/SYN/../../../../../SoC/GPDK045/digital/giolib045_v3.5/timing/pads_SS_s1vg.lib} /

::legacy::set_attribute lef_library {/home/hah002/UART_PROJECT/PROJ1/proj1_make/TOP/SYN/../../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef /home/hah002/UART_PROJECT/PROJ1/proj1_make/TOP/SYN/../../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef /home/hah002/UART_PROJECT/PROJ1/proj1_make/TOP/SYN/../../../../../SoC/GPDK045/digital/giolib045_v3.5/lef/giolib045.lef} /
::legacy::set_attribute qrc_tech_file /home/hah002/UART_PROJECT/PROJ1/proj1_make/TOP/SYN/../../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/qrc/qx/gpdk045.tch /


# Design
################################################################################
read_netlist -top asic_top ./mapped/asic_top_mapped.v
read_metric -id current ./mapped/asic_top_mapped.metrics.json

phys::read_script ./mapped/asic_top_mapped.g

phys::read_lec_taf ./mapped/asic_top_mapped.lec.taf.gz
phys::read_taf ./mapped/asic_top_mapped.safety.taf.gz
puts "\n** Restoration Completed **\n"


# Data Integrity Check
################################################################################
# program version
if {"[string_representation [::legacy::get_attribute program_version /]]" != "22.17-s071_1"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-91] "golden program_version: 22.17-s071_1  current program_version: [string_representation [::legacy::get_attribute program_version /]]"
}
# license
if {"[string_representation [::legacy::get_attribute startup_license /]]" != "Genus_Synthesis"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-91] "golden license: Genus_Synthesis  current license: [string_representation [::legacy::get_attribute startup_license /]]"
}
# slack
set _slk_ [::legacy::get_attribute slack design:asic_top]
if {[regexp {^-?[0-9.]+$} $_slk_]} {
  set _slk_ [format %.1f $_slk_]
}
if {$_slk_ != "5231.8"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden slack: 5231.8,  current slack: $_slk_"
}
unset _slk_
# multi-mode slack
# tns
set _tns_ [::legacy::get_attribute tns design:asic_top]
if {[regexp {^-?[0-9.]+$} $_tns_]} {
  set _tns_ [format %.0f $_tns_]
}
if {$_tns_ != "0"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden tns: 0,  current tns: $_tns_"
}
unset _tns_
# cell area
set _cell_area_ [::legacy::get_attribute cell_area design:asic_top]
if {[regexp {^-?[0-9.]+$} $_cell_area_]} {
  set _cell_area_ [format %.0f $_cell_area_]
}
if {$_cell_area_ != "360668"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden cell area: 360668,  current cell area: $_cell_area_"
}
unset _cell_area_
# net area
set _net_area_ [::legacy::get_attribute net_area design:asic_top]
if {[regexp {^-?[0-9.]+$} $_net_area_]} {
  set _net_area_ [format %.0f $_net_area_]
}
if {$_net_area_ != "259"} {
   mesg_send [::legacy::find -message /messages/PHYS/PHYS-92] "golden net area: 259,  current net area: $_net_area_"
}
unset _net_area_
