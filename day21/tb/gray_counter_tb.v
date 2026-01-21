`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 17:12:21
// Design Name: 
// Module Name: gray_counter_tb
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


module gray_counter_tb;
    reg clk, rst;
    wire [3:0] gray;
    gray_counter DUT (clk, rst, gray);
    initial clk = 0;
    always #10 clk = ~clk;
    
    initial 
        begin
            $monitor("time=%0t, gray=%b", $time, gray);
            rst = 1;
            #20 rst = 0;
            repeat(20) @(posedge clk);
            #20 $finish;
        end
endmodule
