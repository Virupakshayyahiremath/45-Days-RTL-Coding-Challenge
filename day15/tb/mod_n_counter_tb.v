`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2026 14:18:13
// Design Name: 
// Module Name: mod_n_counter_tb
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


module mod_n_counter_tb();
    parameter N = 10;
    parameter WIDTH = 4;
    reg clk,rst;
    wire [WIDTH-1:0] count;
    mod_n_counter #(
        .N(N),
        .WIDTH(WIDTH)
        ) dut (
        .clk(clk),
        .rst(rst),
        .count(count)
        );
        
    initial clk = 0;
    always #10 clk = ~clk;
    
    task initialize;
        begin
            rst = 1'b1;
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
    
    task stimulus;
        integer  i;
        begin
            for (i = 0; i < (N + 5); i = i + 1) begin
                @(posedge clk);
            end
        end
    endtask
    
    initial
        begin
            $monitor("values of clk=%b, rst=%b,count=%b",clk,rst,count);
            initialize;
            apply_reset;
            stimulus;
            $finish;
        end
endmodule
