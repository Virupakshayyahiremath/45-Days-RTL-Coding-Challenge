`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2026 17:35:04
// Design Name: 
// Module Name: fsm
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


module fsm(
    input clk, rst,
    input in,
    output reg out
    );
    parameter S0 = 2'b00,
             S1 = 2'b01,
             S2 = 2'b10;
    reg [1:0] state, next_state;
    always@(posedge clk)
        begin
            if(rst)
                state <= S0;
            else
                state <= next_state;
        end
    always@(*)
        begin
            next_state = state;
            case(state)
                S0: next_state = in ? S1 : S0;
                S1: next_state = in ? S1 : S2;
                S2: next_state = in ? S0 : S2;
                default: next_state = S0; 
            endcase
        end
    always@(*)
        begin
            out = (state == S2);
        end
endmodule
