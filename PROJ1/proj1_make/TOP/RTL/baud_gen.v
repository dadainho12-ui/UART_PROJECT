
module baud_gen #(
    parameter CLK_FREQ  = 50_000_000,
    parameter BAUD_RATE = 115200
)(
    input  wire clk,
    input  wire reset_n,
    output reg  baud_tick
);

    localparam integer CLKS_PER_BIT =
        (CLK_FREQ + BAUD_RATE / 2) / BAUD_RATE;

    localparam integer CNT_WIDTH =
        $clog2(CLKS_PER_BIT);

    reg [CNT_WIDTH-1:0] baud_cnt;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            baud_cnt  <= 0;
            baud_tick <= 0;
        end
        else if (baud_cnt == CLKS_PER_BIT - 1) begin
            baud_cnt  <= 0;
            baud_tick <= 1;
        end
        else begin
            baud_cnt  <= baud_cnt + 1'b1;
            baud_tick <= 0;
        end
    end

endmodule

