`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2026 16:50:35
// Design Name: 
// Module Name: loadable_johnson_counter_tb
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


module loadable_johnson_counter_tb();
    reg clk,rst,load;
    reg [3:0] load_val;
    wire [3:0] q;
    loadable_johnson_counter DUT(clk,rst,load,load_val,q);
    initial clk = 0;
    always #10 clk = ~clk;
    
    task initialize;
        begin
            rst = 1'b0;
            load = 1'b0;
            load_val = 4'b0000;
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
    
    task stimulus(input load_i,input [3:0] load_val_i);
        begin
            @(negedge clk);
            load = load_i;
            load_val = load_val_i;
        end
    endtask
    
    initial
        begin
            $monitor("values of clk=%b, rst=%b, load=%b, load_val=%b, q=%b",clk,rst,load,load_val,q);
            initialize;
            apply_reset;
            stimulus(1'b1, 4'b0000);
            stimulus(1'b0, 4'b0000);
            stimulus(1'b1, 4'b0001);
            stimulus(1'b0, 4'b0001);
            apply_reset;
            stimulus(1'b1, 4'b1000);
            stimulus(1'b0, 4'b1000);
            #100 $finish;
        end
endmodule
