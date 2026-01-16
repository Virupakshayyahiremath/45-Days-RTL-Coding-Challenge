`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 16:57:23
// Design Name: 
// Module Name: pipo_tb
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


module pipo_tb();
    reg clk,rst;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;
    pipo DUT(clk,rst,parallel_in,parallel_out);
    initial clk = 0;
    always #10 clk = ~clk;
    
    task initialize;
        begin
            rst = 1'b0;
            parallel_in = 4'd0;
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
    
    task stimulus(input [3:0] parallel_in_i);
        begin
            @(negedge clk);
                parallel_in = parallel_in_i;
        end
    endtask
    
    initial
        begin
            $monitor("values of clk=%b, rst=%b, parallel_in=%b, parallel_out=%b", clk,rst,parallel_in,parallel_out);
            initialize;
            apply_reset;
            stimulus(4'b1011);
            stimulus(4'b1101);
            stimulus(4'b1111);
            #40 $finish;
        end
endmodule
