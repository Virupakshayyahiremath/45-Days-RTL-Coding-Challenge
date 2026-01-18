`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2026 14:46:33
// Design Name: 
// Module Name: johnson_counter_tb
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


module johnson_counter_tb();
    reg clk,rst;
    wire [3:0] q;
    johnson_counter DUT(clk,rst,q);
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize;
        begin
            rst = 1'b0;
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
        begin
            repeat(12)
                begin
                    @(negedge clk);
                end
        end
    endtask
    
    initial
        begin
            $monitor("values of clk=%b, rst=%b, q=%b",clk,rst,q);
            initialize;
            apply_reset;
            stimulus;
            #20 $finish; 
        end
endmodule
