
//input ports
add mapped point clk clk -type PI PI
add mapped point reset_n reset_n -type PI PI
add mapped point tx_start tx_start -type PI PI
add mapped point tx_data[7] tx_data[7] -type PI PI
add mapped point tx_data[6] tx_data[6] -type PI PI
add mapped point tx_data[5] tx_data[5] -type PI PI
add mapped point tx_data[4] tx_data[4] -type PI PI
add mapped point tx_data[3] tx_data[3] -type PI PI
add mapped point tx_data[2] tx_data[2] -type PI PI
add mapped point tx_data[1] tx_data[1] -type PI PI
add mapped point tx_data[0] tx_data[0] -type PI PI
add mapped point uart_rx uart_rx -type PI PI

//output ports
add mapped point uart_tx uart_tx -type PO PO
add mapped point tx_busy tx_busy -type PO PO
add mapped point tx_done tx_done -type PO PO
add mapped point rx_data[7] rx_data[7] -type PO PO
add mapped point rx_data[6] rx_data[6] -type PO PO
add mapped point rx_data[5] rx_data[5] -type PO PO
add mapped point rx_data[4] rx_data[4] -type PO PO
add mapped point rx_data[3] rx_data[3] -type PO PO
add mapped point rx_data[2] rx_data[2] -type PO PO
add mapped point rx_data[1] rx_data[1] -type PO PO
add mapped point rx_data[0] rx_data[0] -type PO PO
add mapped point rx_valid rx_valid -type PO PO
add mapped point frame_error frame_error -type PO PO

//inout ports




//Sequential Pins
add mapped point u_uart_core/u_baud_gen/baud_cnt[8]/q u_uart_core/u_baud_gen/baud_cnt_reg_8/Q -type DFF DFF
add mapped point u_uart_core/u_baud_gen/baud_cnt[7]/q u_uart_core/u_baud_gen/baud_cnt_reg_7/Q -type DFF DFF
add mapped point u_uart_core/u_baud_gen/baud_cnt[6]/q u_uart_core/u_baud_gen/baud_cnt_reg_6/Q -type DFF DFF
add mapped point u_uart_core/u_baud_gen/baud_cnt[5]/q u_uart_core/u_baud_gen/baud_cnt_reg_5/Q -type DFF DFF
add mapped point u_uart_core/u_baud_gen/baud_cnt[4]/q u_uart_core/u_baud_gen/baud_cnt_reg_4/Q -type DFF DFF
add mapped point u_uart_core/u_baud_gen/baud_cnt[1]/q u_uart_core/u_baud_gen/baud_cnt_reg_1/Q -type DFF DFF
add mapped point u_uart_core/u_baud_gen/baud_cnt[3]/q u_uart_core/u_baud_gen/baud_cnt_reg_3/Q -type DFF DFF
add mapped point u_uart_core/u_baud_gen/baud_tick/q u_uart_core/u_baud_gen/baud_tick_reg/Q -type DFF DFF
add mapped point u_uart_core/u_baud_gen/baud_cnt[2]/q u_uart_core/u_baud_gen/baud_cnt_reg_2/Q -type DFF DFF
add mapped point u_uart_core/u_baud_gen/baud_cnt[0]/q u_uart_core/u_baud_gen/baud_cnt_reg_0/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_valid/q u_uart_core/u_uart_rx/rx_valid_reg/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/frame_error/q u_uart_core/u_uart_rx/frame_error_reg/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_sync/q u_uart_core/u_uart_rx/rx_sync_reg/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_meta/q u_uart_core/u_uart_rx/rx_meta_reg/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/bit_cnt[0]/q u_uart_core/u_uart_rx/bit_cnt_reg_0/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/bit_cnt[1]/q u_uart_core/u_uart_rx/bit_cnt_reg_1/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/bit_cnt[2]/q u_uart_core/u_uart_rx/bit_cnt_reg_2/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_buffer[0]/q u_uart_core/u_uart_rx/rx_buffer_reg_0/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_buffer[1]/q u_uart_core/u_uart_rx/rx_buffer_reg_1/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_buffer[2]/q u_uart_core/u_uart_rx/rx_buffer_reg_2/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_buffer[3]/q u_uart_core/u_uart_rx/rx_buffer_reg_3/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_buffer[4]/q u_uart_core/u_uart_rx/rx_buffer_reg_4/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_buffer[5]/q u_uart_core/u_uart_rx/rx_buffer_reg_5/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_buffer[6]/q u_uart_core/u_uart_rx/rx_buffer_reg_6/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_buffer[7]/q u_uart_core/u_uart_rx/rx_buffer_reg_7/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_data[0]/q u_uart_core/u_uart_rx/rx_data_reg_0/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_data[1]/q u_uart_core/u_uart_rx/rx_data_reg_1/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_data[2]/q u_uart_core/u_uart_rx/rx_data_reg_2/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_data[3]/q u_uart_core/u_uart_rx/rx_data_reg_3/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_data[4]/q u_uart_core/u_uart_rx/rx_data_reg_4/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_data[5]/q u_uart_core/u_uart_rx/rx_data_reg_5/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_data[6]/q u_uart_core/u_uart_rx/rx_data_reg_6/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/rx_data[7]/q u_uart_core/u_uart_rx/rx_data_reg_7/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/sample_cnt[0]/q u_uart_core/u_uart_rx/sample_cnt_reg_0/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/sample_cnt[1]/q u_uart_core/u_uart_rx/sample_cnt_reg_1/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/sample_cnt[2]/q u_uart_core/u_uart_rx/sample_cnt_reg_2/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/sample_cnt[3]/q u_uart_core/u_uart_rx/sample_cnt_reg_3/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/sample_cnt[4]/q u_uart_core/u_uart_rx/sample_cnt_reg_4/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/sample_index[0]/q u_uart_core/u_uart_rx/sample_index_reg_0/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/sample_index[1]/q u_uart_core/u_uart_rx/sample_index_reg_1/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/sample_index[2]/q u_uart_core/u_uart_rx/sample_index_reg_2/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/sample_index[3]/q u_uart_core/u_uart_rx/sample_index_reg_3/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/state[0]/q u_uart_core/u_uart_rx/state_reg_0/Q -type DFF DFF
add mapped point u_uart_core/u_uart_rx/state[1]/q u_uart_core/u_uart_rx/state_reg_1/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/tx_done/q u_uart_core/u_uart_tx/tx_done_reg/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/uart_tx/q u_uart_core/u_uart_tx/uart_tx_reg/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/state[1]/q u_uart_core/u_uart_tx/state_reg_1/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/state[2]/q u_uart_core/u_uart_tx/state_reg_2/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/state[0]/q u_uart_core/u_uart_tx/state_reg_0/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/bit_cnt[1]/q u_uart_core/u_uart_tx/bit_cnt_reg_1/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/bit_cnt[2]/q u_uart_core/u_uart_tx/bit_cnt_reg_2/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/bit_cnt[0]/q u_uart_core/u_uart_tx/bit_cnt_reg_0/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/tx_buffer[2]/q u_uart_core/u_uart_tx/tx_buffer_reg_2/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/tx_buffer[1]/q u_uart_core/u_uart_tx/tx_buffer_reg_1/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/tx_buffer[0]/q u_uart_core/u_uart_tx/tx_buffer_reg_0/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/tx_buffer[3]/q u_uart_core/u_uart_tx/tx_buffer_reg_3/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/tx_buffer[4]/q u_uart_core/u_uart_tx/tx_buffer_reg_4/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/tx_buffer[6]/q u_uart_core/u_uart_tx/tx_buffer_reg_6/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/tx_buffer[5]/q u_uart_core/u_uart_tx/tx_buffer_reg_5/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/tx_busy/q u_uart_core/u_uart_tx/tx_busy_reg/Q -type DFF DFF
add mapped point u_uart_core/u_uart_tx/tx_buffer[7]/q u_uart_core/u_uart_tx/tx_buffer_reg_7/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
