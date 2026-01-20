`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2026 14:31:11
// Design Name: 
// Module Name: clk_div3_tb
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


module clk_div3_tb();
    reg clk,rst;
    wire clk_out;
    clk_div3 DUT(clk,rst,clk_out);
    initial clk = 0;
    always #10 clk = ~clk;
    initial
        begin
            $monitor("values of clk=%b, rst=%b, clk_out=%b",clk,rst,clk_out);
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #300 $finish;
        end
endmodule
