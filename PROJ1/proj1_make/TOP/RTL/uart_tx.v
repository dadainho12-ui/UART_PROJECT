
module uart_tx (
    input  wire       clk,
    input  wire       reset_n,
    input  wire       baud_tick,
    input  wire       tx_start,
    input  wire [7:0] tx_data,

    output reg        uart_tx,
    output reg        tx_busy,
    output reg        tx_done
);

    localparam IDLE      = 3'd0;
    localparam WAIT_TICK = 3'd1;
    localparam START     = 3'd2;
    localparam DATA      = 3'd3;
    localparam STOP      = 3'd4;

    reg [2:0] state;
    reg [2:0] bit_cnt;
    reg [7:0] tx_buffer;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state     <= IDLE;
            bit_cnt   <= 0;
            tx_buffer <= 0;
            uart_tx   <= 1'b1;
            tx_busy   <= 1'b0;
            tx_done   <= 1'b0;
        end
        else begin
            tx_done <= 1'b0;

            case (state)

                IDLE: begin
                    uart_tx <= 1'b1;
                    tx_busy <= 1'b0;

                    if (tx_start) begin
                        tx_buffer <= tx_data;
                        tx_busy   <= 1'b1;
                        state     <= WAIT_TICK;
                    end
                end

                WAIT_TICK: begin
                    if (baud_tick) begin
                        uart_tx <= 1'b0;
                        state   <= START;
                    end
                end

                START: begin
                    if (baud_tick) begin
                        uart_tx <= tx_buffer[0];
                        bit_cnt <= 0;
                        state   <= DATA;
                    end
                end

                DATA: begin
                    if (baud_tick) begin
                        if (bit_cnt == 7) begin
                            uart_tx <= 1'b1;
                            state   <= STOP;
                        end
                        else begin
                            bit_cnt <= bit_cnt + 1'b1;
                            uart_tx <= tx_buffer[bit_cnt + 1'b1];
                        end
                    end
                end

                STOP: begin
                    if (baud_tick) begin
                        uart_tx <= 1'b1;
                        tx_busy <= 1'b0;
                        tx_done <= 1'b1;
                        state   <= IDLE;
                    end
                end

                default: state <= IDLE;

            endcase
        end
    end

endmodule

