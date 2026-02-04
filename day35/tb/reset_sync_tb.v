`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2026 15:26:27
// Design Name: 
// Module Name: reset_sync_tb
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


module reset_sync_tb();
    reg clk;
    reg rst_async;
    wire rst_sync;
    reset_sync dut (
        .clk(clk),
        .rst_async(rst_async),
        .rst_sync(rst_sync)
    );
    initial clk = 0;
    always #10 clk = ~clk;

    initial 
        begin
            rst_async = 1;
            #15 rst_async = 0;   // Deassert async reset (not aligned to clk)
            #37 rst_async = 1;   // Assert again
            #12 rst_async = 0;  
            #100 $finish;
        end
endmodule
