`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2026 16:07:00
// Design Name: 
// Module Name: mealy_seq_1011_tb
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


module mealy_seq_1011_tb();
    reg clk,rst;
    reg d_in;
    wire d_out;
    mealy_seq_1011 DUT(clk,rst,d_in,d_out);
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize;
        begin
            rst = 1'b0;
            d_in = 1'b0;
        end
    endtask
    task apply_reset;
        begin
            @(negedge clk);
            rst = 1'b1;
            @(negedge clk);
            rst = 1'b0;
        end
    endtask
    task stimulus(input d_in_i);
        begin
            @(negedge clk);
            d_in = d_in_i;
        end
    endtask
    initial
        begin
            $monitor("values of clk=%b, rst=%b, d_in=%b, d_out=%b",clk,rst,d_in,d_out);
            initialize;
            apply_reset;
            stimulus(1'b1);
            stimulus(1'b0);
            stimulus(1'b1);
            stimulus(1'b1);
            stimulus(1'b0);
            stimulus(1'b1);
            stimulus(1'b1);
            #40 $finish;
        end
endmodule
