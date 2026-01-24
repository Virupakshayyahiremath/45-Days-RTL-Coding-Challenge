`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2026 13:17:04
// Design Name: 
// Module Name: mealy_seq_101
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


module mealy_seq_101(
    input clk,rst,
    input data_in,
    output data_out
    );
    parameter s0 = 2'b00,
              s1 = 2'b01,
              s2 = 2'b10;
    reg [1:0] state,next_state;
    always @(posedge clk)
        begin
            if(rst)
                state <= s0;
            else
                state <= next_state;
        end
    always @(*)
        begin
            next_state = state;
            case(state)
                s0 : begin
                    if(data_in == 1'b1)
                        next_state = s1;
                    else
                        next_state = s0;
                end
                s1 : begin
                    if(data_in == 1'b0)
                        next_state = s2;
                    else
                        next_state = s1;
                end
                s2 : begin
                    if(data_in == 1'b1)
                        next_state = s1;
                    else
                        next_state = s0;
                end
                default : begin
                    next_state = s0; 
                end
            endcase
        end
    assign data_out = ((state == s2) && (data_in == 1'b1));
endmodule
