
module asic_top (
    input  wire       clk,
    input  wire       reset_n,
    input  wire       tx_start,
    input  wire [7:0] tx_data,
    input  wire       uart_rx,

    output wire       uart_tx,
    output wire       tx_busy,
    output wire       tx_done,
    output wire [7:0] rx_data,
    output wire       rx_valid,
    output wire       frame_error
);

    // Internal signals
    wire clk_core;
    wire reset_n_core;
    wire tx_start_core;
    wire [7:0] tx_data_core;
    wire uart_rx_core;

    wire uart_tx_core;
    wire tx_busy_core;
    wire tx_done_core;
    wire [7:0] rx_data_core;
    wire rx_valid_core;
    wire frame_error_core;

    // ==========================================
    // INPUT PAD
    // ==========================================

    PADDI u_pad_clk (
        .PAD(clk),
        .Y(clk_core)
    );

    PADDI u_pad_reset (
        .PAD(reset_n),
        .Y(reset_n_core)
    );

    PADDI u_pad_tx_start (
        .PAD(tx_start),
        .Y(tx_start_core)
    );

    PADDI u_pad_uart_rx (
        .PAD(uart_rx),
        .Y(uart_rx_core)
    );

    genvar i;

    generate
        for (i = 0; i < 8; i = i + 1) begin : GEN_TX_DATA_PAD
            PADDI u_pad_tx_data (
                .PAD(tx_data[i]),
                .Y(tx_data_core[i])
            );
        end
    endgenerate

    // ==========================================
    // UART CORE
    // ==========================================

    uart_top #(
        .CLK_FREQ(50_000_000),
        .BAUD_RATE(115200)
    ) u_uart_core (
        .clk(clk_core),
        .reset_n(reset_n_core),

        .tx_start(tx_start_core),
        .tx_data(tx_data_core),

        .tx_busy(tx_busy_core),
        .tx_done(tx_done_core),

        .rx_data(rx_data_core),
        .rx_valid(rx_valid_core),
        .frame_error(frame_error_core),

        .uart_rx(uart_rx_core),
        .uart_tx(uart_tx_core)
    );

    // ==========================================
    // OUTPUT PAD
    // ==========================================

    PADDO u_pad_uart_tx (
        .A(uart_tx_core),
        .PAD(uart_tx)
    );

    PADDO u_pad_tx_busy (
        .A(tx_busy_core),
        .PAD(tx_busy)
    );

    PADDO u_pad_tx_done (
        .A(tx_done_core),
        .PAD(tx_done)
    );

    PADDO u_pad_rx_valid (
        .A(rx_valid_core),
        .PAD(rx_valid)
    );

    PADDO u_pad_frame_error (
        .A(frame_error_core),
        .PAD(frame_error)
    );

    generate
        for (i = 0; i < 8; i = i + 1) begin : GEN_RX_DATA_PAD
            PADDO u_pad_rx_data (
                .A(rx_data_core[i]),
                .PAD(rx_data[i])
            );
        end
    endgenerate

endmodule

