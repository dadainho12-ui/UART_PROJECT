#!/bin/csh -f

# UART TX Functional Simulation
# Cadence Xcelium

xrun -64bit \
     +max_err_count+50 \
     +define+function_sim \
     -access +rwc \
     -gui \
     -timescale 1ns/1ps \
     ../../RTL/baud_gen.v \
     ../../RTL/uart_tx.v \
     ../../RTL/uart_rx.v \
     ../../RTL/uart_top.v \
     ../TESTBENCH/tb_uart_top.v \
     -top tb_uart_top \
     -l func_sim.log

