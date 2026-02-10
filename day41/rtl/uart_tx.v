`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2026 18:20:49
// Design Name: 
// Module Name: uart_tx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_tx #(
    parameter CLKS_PER_BIT = 16
)(
    input clk, rst,
    input tx_start,
    input [7:0] tx_data,
    output reg tx,
    output reg tx_done
    );
    localparam IDLE = 2'b00,
               START = 2'b01,
               DATA = 2'b10,
               STOP = 2'b11;
    reg [1:0] state;
    reg [3:0] bit_index;
    reg [$clog2(CLKS_PER_BIT)-1:0] clk_cnt;
    reg [7:0] data;
    always@(posedge clk)
        begin
            if(rst)
                begin
                    state     <= IDLE;
                    tx        <= 1'b1;
                    tx_done   <= 1'b0;
                    bit_index <= 4'd0;
                    clk_cnt   <= 0;
                    data <= 8'd0;
                end
            else
                begin
                    case (state)
                        IDLE: begin
                            tx      <= 1'b1;
                            tx_done <= 1'b0;
                            clk_cnt <= 0;
                            if (tx_start) begin
                                data <= tx_data;
                                state     <= START;
                            end
                        end
        
                        START: begin
                            tx <= 1'b0;  // start bit
                            if (clk_cnt == CLKS_PER_BIT-1) 
                                begin
                                    clk_cnt <= 0;
                                    state   <= DATA;
                                end 
                            else 
                                begin
                                    clk_cnt <= clk_cnt + 1'b1;
                                end
                        end
        
                        DATA: begin
                            tx <= data[0];
                            if (clk_cnt == CLKS_PER_BIT-1) 
                                begin
                                    clk_cnt   <= 0;
                                    data <= data >> 1;
                                    if (bit_index == 4'd7) 
                                        begin
                                            bit_index <= 0;
                                            state     <= STOP;
                                        end 
                                    else 
                                        begin
                                            bit_index <= bit_index + 1'b1;
                                        end
                                end 
                            else 
                                begin
                                    clk_cnt <= clk_cnt + 1'b1;
                                end
                        end
        
                        STOP: begin
                            tx <= 1'b1; // stop bit
                            if (clk_cnt == CLKS_PER_BIT-1) 
                                begin
                                    clk_cnt <= 0;
                                    tx_done <= 1'b1;
                                    state   <= IDLE;
                                end 
                            else 
                                begin
                                    clk_cnt <= clk_cnt + 1'b1;
                                end
                        end
        
                        default: state <= IDLE;

                    endcase
                end
        end
endmodule
