`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2026 11:22:13
// Design Name: 
// Module Name: dff_en_async_rst_tb
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


module dff_en_async_rst_tb;
    reg clk, rst, en, d;
    wire q;
    dff_en_async_rst DUT (clk, rst, en, d, q);
    initial clk = 0;
    always #10 clk = ~clk;
    
    task initialize;
        begin
            rst = 1'b1;
            en  = 1'b0;
            d   = 1'b0;
        end
    endtask
    
    task reset;
        begin
            #5 rst = 1'b0;   
        end
    endtask
    
    task stimulus(input en_i, input d_i);
        begin
            @(negedge clk);
            en = en_i;
            d  = d_i;
        end
    endtask
    
    initial begin
        $monitor("rst=%b en=%b d=%b q=%b",rst, en, d, q);
        initialize;
        reset;
        stimulus(1,0);
        stimulus(1,1);
        stimulus(0,0); 
        stimulus(0,1);   
        #7 rst = 1'b1;
        #6 rst = 1'b0;
        stimulus(1,1);
        stimulus(1,0);
         #20;
        $finish;
    end
endmodule
