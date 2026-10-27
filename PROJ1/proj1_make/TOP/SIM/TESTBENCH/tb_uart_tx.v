
`timescale 1ns/1ps

module tb_uart_tx;

    reg clk;
    reg reset_n;
    reg tx_start;
    reg [7:0] tx_data;

    wire baud_tick;
    wire uart_tx;
    wire tx_busy;
    wire tx_done;

    // 50 MHz Clock
    initial clk = 0;
    always #10 clk = ~clk;

    baud_gen #(
        .CLK_FREQ(50_000_000),
        .BAUD_RATE(115200)
    ) u_baud_gen (
        .clk(clk),
        .reset_n(reset_n),
        .baud_tick(baud_tick)
    );

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

    initial begin
        reset_n = 0;
        tx_start = 0;
        tx_data = 0;

        #100;
        reset_n = 1;

        #100;
        @(negedge clk);
        tx_data = 8'h41;   // ASCII 'A'
        tx_start = 1;

        @(negedge clk);
        tx_start = 0;

        wait(tx_done == 1);

        $display("UART TX Complete!");
        #1000;
        $finish;
    end

endmodule

