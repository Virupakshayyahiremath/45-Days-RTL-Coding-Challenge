`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2026 13:43:45
// Design Name: 
// Module Name: clk_div2
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


module clk_div2(
    input clk,rst,
    output reg clk_out
    );
    always@(posedge clk)
        begin
            if(rst)
                clk_out <= 1'b0;
            else
                clk_out <= ~clk_out;
        end
endmodule
