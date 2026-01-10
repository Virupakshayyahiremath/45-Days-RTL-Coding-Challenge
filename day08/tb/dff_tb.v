`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2026 18:11:33
// Design Name: 
// Module Name: dff_tb
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


module dff_tb();
    reg clk,rst;
    reg d;
    wire q;
    dff_sync_rst DUT(clk,rst,d,q);
    initial
        clk = 0;
    always
        #10 clk = ~clk;
    task initialize;
        begin
            rst = 1'b1; 
            d   = 1'b0;
        end
    endtask
    task rst_dut;
        begin
            @(negedge clk);
            rst = 1'b1;
            @(negedge clk);
            rst = 1'b0;
        end
    endtask
    task stimulus(input i);
        begin
            @(negedge clk);
            d = i;
        end
    endtask
    initial
        begin
            $monitor("time=%0t values of clk=%b, rst=%b, d=%b, q=%b",$time,clk,rst,d,q);
            initialize;
            rst_dut;
            stimulus(0);
            stimulus(1);
            stimulus(0);
            stimulus(1);
            stimulus(1);
            rst_dut;
            stimulus(0);
            stimulus(1);
            #20 $finish;
        end
endmodule
