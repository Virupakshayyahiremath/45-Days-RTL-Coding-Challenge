`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2026 14:42:30
// Design Name: 
// Module Name: up_counter_tb
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


module up_counter_tb();
    reg clk,rst,load;
    reg [3:0]data_in;
    wire [3:0] count;
    up_counter DUT(clk,rst,load,data_in,count);
    initial clk = 0;
    always #10 clk = ~clk;
    
    task initialize;
        begin
            rst = 1'b1;
            load = 1'b0;
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
    
    task stimulus(input load_i ,input [3:0]  data_in_i);
        begin
            @(negedge clk);
            begin
                load = load_i;
                data_in = data_in_i;
            end
        end
    endtask
    
    initial
        begin
            $monitor("values of clk=%b, rst=%b,load=%b, data_in=%b, count=%b",clk,rst,load,data_in,count);
            initialize;
            reset;
            stimulus(1'b0, 4'd13);
            stimulus(1'b1, 4'd13);
            #20 $finish;
        end
endmodule
