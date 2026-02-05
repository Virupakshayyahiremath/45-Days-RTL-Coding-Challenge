`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2026 15:45:15
// Design Name: 
// Module Name: handshake_cdc_tb
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


module handshake_cdc_tb();
    reg clk_src, clk_dst, rst;
    reg send;
    wire busy;

    handshake_cdc dut (.clk_src(clk_src), .clk_dst(clk_dst), .rst(rst), .send(send), .busy(busy));
    initial clk_src = 0;
    always #7 clk_src = ~clk_src;

    initial clk_dst = 0;
    always #19 clk_dst = ~clk_dst;
    initial 
        begin
            rst = 1;
            send = 0;
            #30 rst = 0;
            #15 send = 1;
            #10 send = 0;
    
            #20 send = 1; // Try sending again while busy (should be ignored)
            #10 send = 0;
    
            #100 send = 1; // Send after handshake completes
            #10 send = 0;
            #200 $finish;
        end
endmodule
