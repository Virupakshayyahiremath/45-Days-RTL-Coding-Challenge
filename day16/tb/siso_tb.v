`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 14:30:19
// Design Name: 
// Module Name: siso_tb
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


module siso_tb();
    reg clk,rst;
    reg serial_in;
    wire serial_out;
    siso DUT(clk,rst,serial_in,serial_out);
    initial clk = 0;
    always #10 clk = ~clk;
    
    task initialize;
        begin
            rst = 1'b0;
            serial_in = 0;
        end
    endtask
    
    task apply_reset;
        begin
            @(negedge clk)
            rst = 1'b1;
            @(negedge clk)
            rst = 1'b0;
        end
    endtask
    
    task stimulus(input serial_in_i);
        begin
            @(negedge clk);
            serial_in = serial_in_i;
        end
    endtask
    
    initial
        begin
            $monitor("values of clk=%b, rst=%b, serial_in=%b, serial_out=%b", clk,rst,serial_in,serial_out);
            initialize;
            apply_reset;
            stimulus(1);
            stimulus(0);
            stimulus(1);
            stimulus(1);
            stimulus(0);
            stimulus(0);
            #100 $finish;
        end
endmodule
