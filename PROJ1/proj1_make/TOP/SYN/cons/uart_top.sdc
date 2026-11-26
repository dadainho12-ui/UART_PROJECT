# Time in ns, capacitance in pF.
set_units -time 1000ps
set_units -capacitance 1000fF

create_clock -name MAIN_CLOCK -period 20.0 -waveform {0.0 10.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks MAIN_CLOCK]
set_clock_uncertainty -setup 0.1 [get_clocks MAIN_CLOCK]

# Provisional block-interface budget. Validate against the parent design.
set tx_inputs [get_ports {tx_start tx_data[*]}]
set_input_delay -clock MAIN_CLOCK -max 0.1 $tx_inputs
set_input_delay -clock MAIN_CLOCK -min 0.01 $tx_inputs
set_input_transition 0.1 $tx_inputs

set_output_delay -clock MAIN_CLOCK -max 0.1 [all_outputs]
set_output_delay -clock MAIN_CLOCK -min -0.01 [all_outputs]
set_load 0.003 [all_outputs]

# uart_rx drives only the first stage of the RX synchronizer in the RTL.
set_input_transition 0.1 [get_ports uart_rx]
set_false_path -from [get_ports uart_rx]

# Model reset release relative to the parent clock for recovery/removal.
set_input_delay -clock MAIN_CLOCK -max 0.1 [get_ports reset_n]
set_input_delay -clock MAIN_CLOCK -min 0.01 [get_ports reset_n]
set_input_transition 0.1 [get_ports reset_n]
