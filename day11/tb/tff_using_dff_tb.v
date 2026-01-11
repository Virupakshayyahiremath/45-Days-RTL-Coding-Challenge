`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 16:19:23
// Design Name: 
// Module Name: tff_using_dff_tb
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


module tff_using_dff_tb();
    reg clk,rst;
    reg t;
    wire q;
    wire qb;
    tff_using_dff DUT(clk,rst,t,q,qb);
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize;
        begin
            rst = 1'b1;
            t = 1'b0;
        end
    endtask
    
    task reset;
        begin
            @(negedge clk);
            rst = 1'b1;
            @(negedge clk);
            rst = 1'b0;
        end
    endtask
    
    task stimulus(input t_i);
        begin
            @(negedge clk);
            t = t_i;
        end
    endtask
    initial 
        begin
            $monitor("values of clk=%b, rst=%b, t=%b, q=%b, qb=%b",clk,rst,t,q,qb);
            initialize;
            reset;
            stimulus(0);
            stimulus(1);
            stimulus(0);
            stimulus(1);
            stimulus(0);
            reset;
            stimulus(1);
            stimulus(0);
            #20 $finish;
        end
    
endmodule
