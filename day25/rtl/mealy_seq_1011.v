`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2026 15:57:10
// Design Name: 
// Module Name: mealy_seq_1011
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


module mealy_seq_1011(
    input clk,rst,
    input d_in,
    output reg d_out
    );
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;
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
        d_out      = 1'b0;
            case(state)
                S0: begin
                if (d_in)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (d_in)
                    next_state = S1;   
                else
                    next_state = S2;   
            end

            S2: begin
                if (d_in)
                    next_state = S3;   
                else
                    next_state = S0;
            end

            S3: begin
                if (d_in) begin
                    d_out     = 1'b1; 
                    next_state = S1;   
                end else begin
                    next_state = S2;   
                end
            end

            default: begin
                next_state = S0;
                d_out     = 1'b0;
            end
            endcase
        end
endmodule
