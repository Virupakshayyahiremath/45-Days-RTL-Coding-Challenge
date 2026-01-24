`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2026 13:37:26
// Design Name: 
// Module Name: mealy_seq_101_tb
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


module mealy_seq_101_tb();
    reg clk,rst;
    reg data_in;
    wire data_out;
    mealy_seq_101 DUT(clk,rst,data_in,data_out);
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize;
        begin
            rst = 1'b0;
            data_in = 1'b0;
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
    task stimulus(input data_in_i);
        begin
            @(negedge clk);
            data_in = data_in_i;
        end
    endtask
    initial
        begin
            $monitor("values of clk=%b, rst=%b, data_in=%b, data_out=%b",clk,rst,data_in,data_out);
            initialize;
            apply_reset;
            stimulus(1'b1);
            stimulus(1'b0);
            stimulus(1'b1);
            stimulus(1'b0);
            stimulus(1'b1);
            #20 $finish;
        end
endmodule
