`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 15:45:40
// Design Name: 
// Module Name: dff
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


module dff(
    input clk,rst,
    input d,
    output reg q,
    output qb
    );
    always@(posedge clk)
        begin
            if(rst)
                q <= 1'b0;
            else
                q <= d;
        end
    assign qb = ~q;
endmodule
