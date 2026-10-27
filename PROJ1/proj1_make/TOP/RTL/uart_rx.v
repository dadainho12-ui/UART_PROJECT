module uart_rx #(
    parameter CLK_FREQ  = 50_000_000,
    parameter BAUD_RATE = 115200
)(
    input  wire       clk,
    input  wire       reset_n,
    input  wire       uart_rx,

    output reg  [7:0] rx_data,
    output reg        rx_valid,
    output reg        frame_error
);

    localparam integer OVERSAMPLE = 16;
    localparam integer SAMPLE_DIV =
        (CLK_FREQ + BAUD_RATE * OVERSAMPLE / 2)
        / (BAUD_RATE * OVERSAMPLE);

    localparam integer CNT_WIDTH =
        (SAMPLE_DIV > 1) ? $clog2(SAMPLE_DIV) : 1;

    localparam IDLE  = 2'd0;
    localparam START = 2'd1;
    localparam DATA  = 2'd2;
    localparam STOP  = 2'd3;

    reg [1:0] state;
    reg [CNT_WIDTH-1:0] sample_cnt;
    reg [3:0] sample_index;
    reg [2:0] bit_cnt;
    reg [7:0] rx_buffer;

    // Synchronize asynchronous RX input
    reg rx_meta;
    reg rx_sync;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            rx_meta <= 1'b1;
            rx_sync <= 1'b1;
        end
        else begin
            rx_meta <= uart_rx;
            rx_sync <= rx_meta;
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state        <= IDLE;
            sample_cnt   <= 0;
            sample_index <= 0;
            bit_cnt      <= 0;
            rx_buffer    <= 0;
            rx_data      <= 0;
            rx_valid     <= 0;
            frame_error  <= 0;
        end
        else begin
            rx_valid    <= 1'b0;
            frame_error <= 1'b0;

            case (state)

                IDLE: begin
                    sample_cnt   <= 0;
                    sample_index <= 0;
                    bit_cnt      <= 0;

                    if (rx_sync == 1'b0) begin
                        state <= START;
                    end
                end

                START: begin
                    if (sample_cnt == SAMPLE_DIV - 1) begin
                        sample_cnt <= 0;

                        if (sample_index == 7) begin
                            sample_index <= 0;

                            if (rx_sync == 1'b0)
                                state <= DATA;
                            else
                                state <= IDLE;
                        end
                        else begin
                            sample_index <= sample_index + 1'b1;
                        end
                    end
                    else begin
                        sample_cnt <= sample_cnt + 1'b1;
                    end
                end

                DATA: begin
                    if (sample_cnt == SAMPLE_DIV - 1) begin
                        sample_cnt <= 0;

                        if (sample_index == 15) begin
                            sample_index <= 0;
                            rx_buffer[bit_cnt] <= rx_sync;

                            if (bit_cnt == 7) begin
                                bit_cnt <= 0;
                                state <= STOP;
                            end
                            else begin
                                bit_cnt <= bit_cnt + 1'b1;
                            end
                        end
                        else begin
                            sample_index <= sample_index + 1'b1;
                        end
                    end
                    else begin
                        sample_cnt <= sample_cnt + 1'b1;
                    end
                end

                STOP: begin
                    if (sample_cnt == SAMPLE_DIV - 1) begin
                        sample_cnt <= 0;

                        if (sample_index == 15) begin
                            sample_index <= 0;

                            if (rx_sync == 1'b1) begin
                                rx_data  <= rx_buffer;
                                rx_valid <= 1'b1;
                            end
                            else begin
                                frame_error <= 1'b1;
                            end

                            state <= IDLE;
                        end
                        else begin
                            sample_index <= sample_index + 1'b1;
                        end
                    end
                    else begin
                        sample_cnt <= sample_cnt + 1'b1;
                    end
                end

                default: state <= IDLE;

            endcase
        end
    end

endmodule

