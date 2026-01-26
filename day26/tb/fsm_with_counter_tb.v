`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2026 07:13:55
// Design Name: 
// Module Name: fsm_with_counter_tb
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


module fsm_with_counter_tb();
    reg clk, rst, start;
    wire done;
    fsm_with_counter DUT (clk, rst, start, done);
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize;
        begin
            rst   = 1'b1;
            start = 1'b0;
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
    
    task stimulus(input start_i);
        begin
            @(negedge clk);
            start = start_i;
        end
    endtask
    initial 
        begin
            $monitor("clk=%b rst=%b start=%b done=%b",clk, rst, start, done);
            initialize;
            apply_reset;
            stimulus(1'b1);
            stimulus(1'b0);
            repeat(10) @(negedge clk);
            $finish;
        end
endmodule
