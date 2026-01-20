`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2026 13:53:12
// Design Name: 
// Module Name: clk_div2_tb
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


module clk_div2_tb();
    reg clk,rst;
    wire clk_out;
    clk_div2 DUT(clk,rst,clk_out);
    initial clk = 1;
    always #10 clk = ~clk;
    initial
        begin
            $monitor("values of clk=%b, rst=%b, clk_out=%b",clk,rst,clk_out);
            rst = 1'b1;
            #20;
            rst = 1'b0;
            #100 $finish;
        end
endmodule
