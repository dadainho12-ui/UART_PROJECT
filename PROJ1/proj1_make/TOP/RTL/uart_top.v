
module uart_top #(
    parameter CLK_FREQ  = 50_000_000,
    parameter BAUD_RATE = 115200
)(
    input  wire       clk,
    input  wire       reset_n,

    input  wire       tx_start,
    input  wire [7:0] tx_data,
    output wire       tx_busy,
    output wire       tx_done,

    output wire [7:0] rx_data,
    output wire       rx_valid,
    output wire       frame_error,

    input  wire       uart_rx,
    output wire       uart_tx
);

    wire baud_tick;

    // Baud Generator
    baud_gen #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD_RATE(BAUD_RATE)
    ) u_baud_gen (
        .clk(clk),
        .reset_n(reset_n),
        .baud_tick(baud_tick)
    );

    // UART Transmitter
    uart_tx u_uart_tx (
        .clk(clk),
        .reset_n(reset_n),
        .baud_tick(baud_tick),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .uart_tx(uart_tx),
        .tx_busy(tx_busy),
        .tx_done(tx_done)
    );

    // UART Receiver
    uart_rx #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD_RATE(BAUD_RATE)
    ) u_uart_rx (
        .clk(clk),
        .reset_n(reset_n),
        .uart_rx(uart_rx),
        .rx_data(rx_data),
        .rx_valid(rx_valid),
        .frame_error(frame_error)
    );

endmodule

