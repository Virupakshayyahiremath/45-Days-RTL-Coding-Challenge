`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2026 14:49:44
// Design Name: 
// Module Name: alu
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

module alu#(
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] a,
    input  [WIDTH-1:0] b,
    input  [2:0] sel_in,
    output reg [WIDTH-1:0] result,
    output zero,
    output reg carry
    );
    always @(*) 
        begin
            carry = 0;
            case (sel_in)
                3'b000: begin  
                    {carry, result} = a + b; // ADD
                end
                3'b001: begin  
                    {carry, result} = a - b;  // SUB
                end
                3'b010: result = a & b;   // AND
                3'b011: result = a | b;   // OR
                3'b100: result = a ^ b;   // XOR
                3'b101: result = (a < b) ? 1 : 0;  // SLT(set less than)
                3'b110: result = a << 1;  // Shift left
                3'b111: result = a >> 1;  // Shift right
                default: result = 0;
            endcase
        end

    assign zero = (result == 0);
endmodule
