
`timescale 1ns/1ps

module tb_uart_top;

    reg clk;
    reg reset_n;
    reg tx_start;
    reg [7:0] tx_data;

    wire tx_busy;
    wire tx_done;
    wire [7:0] rx_data;
    wire rx_valid;
    wire frame_error;

    wire uart_tx;
    wire uart_rx;

    // 50 MHz Clock
    initial clk = 1'b0;
    always #10 clk = ~clk;

    // Internal Loopback
    assign uart_rx = uart_tx;

    // UART Top Module
    uart_top #(
        .CLK_FREQ(50_000_000),
        .BAUD_RATE(115200)
    ) dut (
        .clk(clk),
        .reset_n(reset_n),

        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx_busy(tx_busy),
        .tx_done(tx_done),

        .rx_data(rx_data),
        .rx_valid(rx_valid),
        .frame_error(frame_error),

        .uart_rx(uart_rx),
        .uart_tx(uart_tx)
    );

    // Send one byte and verify reception
    task send_and_check;
        input [7:0] data;
        begin
            @(negedge clk);
            tx_data  = data;
            tx_start = 1'b1;

            @(negedge clk);
            tx_start = 1'b0;

            // Wait until RX receives a byte
            @(posedge rx_valid);
            #1;

            if (rx_data === data) begin
                $display("PASS: TX=%h RX=%h",
                         data, rx_data);
            end
            else begin
                $display("FAIL: TX=%h RX=%h",
                         data, rx_data);
                $display("ERROR: UART DATA MISMATCH");
                $finish;
            end

            wait(tx_busy == 1'b0);
            repeat (5) @(negedge clk);
        end
    endtask

    // Main Test
    initial begin
        reset_n  = 1'b0;
        tx_start = 1'b0;
        tx_data  = 8'h00;

        #100;
        reset_n = 1'b1;

        #100;

        send_and_check(8'h41); // ASCII A
        send_and_check(8'h55);
        send_and_check(8'hA5);
        send_and_check(8'h00);
        send_and_check(8'hFF);

        $display("=======================");
        $display("UART LOOPBACK TEST PASS");
        $display("=======================");

        #1000;
        $finish;
    end

    // Frame Error Detection
    always @(posedge clk) begin
        if (frame_error) begin
            $display("ERROR: UART FRAME ERROR");
            $finish;
        end
    end

    // Simulation Timeout
    initial begin
        #2_000_000;
        $display("ERROR: UART SIMULATION TIMEOUT");
        $finish;
    end

endmodule


`timescale 1ns/1ps

module tb_uart_top;

    reg clk;
    reg reset_n;
    reg tx_start;
    reg [7:0] tx_data;

    wire tx_busy;
    wire tx_done;
    wire [7:0] rx_data;
    wire rx_valid;
    wire frame_error;

    wire uart_tx;
    wire uart_rx;

    // 50 MHz Clock
    initial clk = 1'b0;
    always #10 clk = ~clk;

    // Internal Loopback
    assign uart_rx = uart_tx;

    // UART Top Module
    uart_top #(
        .CLK_FREQ(50_000_000),
        .BAUD_RATE(115200)
    ) dut (
        .clk(clk),
        .reset_n(reset_n),

        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx_busy(tx_busy),
        .tx_done(tx_done),

        .rx_data(rx_data),
        .rx_valid(rx_valid),
        .frame_error(frame_error),

        .uart_rx(uart_rx),
        .uart_tx(uart_tx)
    );

    // Send one byte and verify reception
    task send_and_check;
        input [7:0] data;
        begin
            @(negedge clk);
            tx_data  = data;
            tx_start = 1'b1;

            @(negedge clk);
            tx_start = 1'b0;

            // Wait until RX receives a byte
            @(posedge rx_valid);
            #1;

            if (rx_data === data) begin
                $display("PASS: TX=%h RX=%h",
                         data, rx_data);
            end
            else begin
                $display("FAIL: TX=%h RX=%h",
                         data, rx_data);
                $display("ERROR: UART DATA MISMATCH");
                $finish;
            end

            wait(tx_busy == 1'b0);
            repeat (5) @(negedge clk);
        end
    endtask

    // Main Test
    initial begin
        reset_n  = 1'b0;
        tx_start = 1'b0;
        tx_data  = 8'h00;

        #100;
        reset_n = 1'b1;

        #100;

        send_and_check(8'h41); // ASCII A
        send_and_check(8'h55);
        send_and_check(8'hA5);
        send_and_check(8'h00);
        send_and_check(8'hFF);

        $display("=======================");
        $display("UART LOOPBACK TEST PASS");
        $display("=======================");

        #1000;
        $finish;
    end

    // Frame Error Detection
    always @(posedge clk) begin
        if (frame_error) begin
            $display("ERROR: UART FRAME ERROR");
            $finish;
        end
    end

    // Simulation Timeout
    initial begin
        #2_000_000;
        $display("ERROR: UART SIMULATION TIMEOUT");
        $finish;
    end

endmodule

