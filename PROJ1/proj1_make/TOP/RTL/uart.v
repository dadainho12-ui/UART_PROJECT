`timescale 1ns/1ps

module uart (
    input  wire clk,
    input  wire rst_n,
    input  wire tx_start,
    input  wire [7:0] tx_data,
    output reg  tx
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        tx <= 1'b1;
    else if (tx_start)
        tx <= tx_data[0];
    else
        tx <= 1'b1;
end

endmodule
