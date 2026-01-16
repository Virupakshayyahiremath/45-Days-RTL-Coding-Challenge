`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 16:19:22
// Design Name: 
// Module Name: piso_tb
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


module piso_tb();
    reg clk,rst;
    reg load,en;
    reg [3:0] parallel_in;
    wire serial_out;
    piso DUT(clk,rst,load,en,parallel_in,serial_out);
    initial clk = 0;
    always #10 clk = ~clk;
    
    task initialize;
        begin
            rst = 1'b0;
            load = 1'b0;
            en = 1'b0;
            parallel_in = 4'd0;
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
    
    task stimulus(input [3:0] parallel_in_i);
        begin
            @(negedge clk);
            load = 1;
            parallel_in = parallel_in_i;
            @(negedge clk);
            load = 0;
        end
    endtask
    
    task shift_data(input integer cycles);
        integer i;
        begin
            @(negedge clk);
            en = 1;
            for (i = 0; i < cycles; i = i + 1)
                @(negedge clk);
            en = 0;
        end
    endtask
    
    initial
        begin
            $monitor("values of clk=%b, rst=%b, parallel_in=%b, serial_out=%b", clk,rst,parallel_in,serial_out);
            initialize;
            apply_reset;
            stimulus(4'b1011);  
            shift_data(4);        
            #100 $finish;
        end
endmodule
