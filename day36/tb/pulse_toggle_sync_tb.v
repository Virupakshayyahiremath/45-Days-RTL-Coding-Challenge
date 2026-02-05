`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2026 15:28:28
// Design Name: 
// Module Name: pulse_toggle_sync_tb
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


module pulse_toggle_sync_tb();
    reg clk_src, clk_dst, rst;
    reg pulse_src;
    wire pulse_dst;
    pulse_toggle_sync dut (.clk_src(clk_src), .clk_dst(clk_dst), .rst(rst), .pulse_src(pulse_src), .pulse_dst(pulse_dst));
    // Source clock (fast)
    initial clk_src = 0;
    always #5 clk_src = ~clk_src;

    // Destination clock (slow, async)
    initial clk_dst = 0;
    always #13 clk_dst = ~clk_dst;
    initial 
        begin
            rst = 1;
            pulse_src = 0;
            #20 rst = 0;
    
            // Generate single-cycle pulses
            #17 pulse_src = 1;
            #10 pulse_src = 0;
            #37 pulse_src = 1;
            #10 pulse_src = 0;
            #100 $finish;
        end
endmodule
