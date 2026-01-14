`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 14:11:10
// Design Name: 
// Module Name: up_down_counter_tb
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


module up_down_counter_tb();
    reg clk,rst;
    reg load,mode;
    reg [3:0] data_in;
    wire [3:0] count;
    up_down_counter DUT(clk,rst,load,mode,data_in,count);
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize;
        begin
            rst = 1'b1;
            load = 1'b0;
            mode = 1'b0;
            data_in = 4'd0;
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
    
    task stimulus(input load_i, mode_i, input [3:0] data_in_i);
        begin
            @(negedge clk);
            load = load_i;
            mode = mode_i;
            data_in = data_in_i;
        end
    endtask
    
    initial
        begin
            $monitor("values of clk=%b, rst=%b, load=%b, mode=%b, data_in =%b, count=%b",clk,rst,load,mode,data_in,count);
            initialize;
            reset;
            stimulus(1,1,4'd12);
            stimulus(0,1,4'd12);
            stimulus(1,0,4'd12);
            stimulus(0,0,4'd12);
            #20 $finish;
        end
endmodule
