`timescale 1ns/1ps

module tb_uart;

reg clk;
reg rst_n;
reg tx_start;
reg [7:0] tx_data;

wire tx;

uart dut (
    .clk      (clk),
    .rst_n    (rst_n),
    .tx_start (tx_start),
    .tx_data  (tx_data),
    .tx       (tx)
);

always #5 clk = ~clk;

initial begin
    clk      = 1'b0;
    rst_n    = 1'b0;
    tx_start = 1'b0;
    tx_data  = 8'h00;

    #20;
    rst_n = 1'b1;

    #20;
    tx_data  = 8'hA5;
    tx_start = 1'b1;

    #10;
    tx_start = 1'b0;

    #50;

    $display("Simulation Finished");
    $finish;
end

initial begin
    $monitor("Time=%0t rst_n=%b tx_start=%b tx_data=%h tx=%b",
             $time, rst_n, tx_start, tx_data, tx);
end

endmodule
