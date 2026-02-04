`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2026 15:12:43
// Design Name: 
// Module Name: synchronizer_2ff_tb
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


module synchronizer_2ff_tb();
    reg clk_dst;
    reg rst_n;
    reg signal_src;
    wire signal_dst;
    synchronizer_2ff dut (
        .clk_dst(clk_dst),
        .rst_n(rst_n),
        .signal_src(signal_src),
        .signal_dst(signal_dst)
    );
    initial clk_dst = 0;
    always #10 clk_dst = ~clk_dst;
    initial 
        begin
            rst_n = 0;
            signal_src = 0;
            #25 rst_n = 1;
            #17 signal_src = 1;
            #13 signal_src = 0;
            #21 signal_src = 1;
            #100 $finish;
        end
endmodule
