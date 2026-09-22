# -access : Passed to the elaborator to provide read/write/connect access
# -gui : Invoke xrun in GUI mode
# -define : Define simulation macro
# -y : Specify Verilog library search directory
# +libext+.v : Search .v files in library directories
# -l : Write simulation log file

xrun -64bit \
     +max_err_count+50 \
     +define+function_sim \
     -access +rwc \
     -profile \
     -profthread \
     -gui \
     +libext+.v \
     -incdir ../../RTL \
     -incdir ../TESTBENCH \
     -y /GPDK045/digital/giolib045_v3.5/vlog \
     -y /GPDK045/digital/gsclib045_all_v4.4/gsclib045_svt_v4.4/gsclib045/verilog \
     -y /GPDK045/digital \
     ../../RTL/uart.v \
     ../TESTBENCH/tb_uart.v \
     /GPDK045/digital/giolib045_v3.5/vlog/pads_FF_s1vg.v \
     /GPDK045/digital/gsclib045_all_v4.4/gsclib045_svt_v4.4/gsclib045/verilog/slow_vdd1v0_basicCells.v \
     -l func_sim.log
