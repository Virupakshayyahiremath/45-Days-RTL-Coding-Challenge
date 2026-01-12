`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.01.2026 14:50:07
// Design Name: 
// Module Name: jkff_using_dff_tb
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


module jkff_using_dff_tb();
    reg clk,rst;
    reg j,k;
    wire q,qb;
    
    jkff_using_dff DUT(clk,rst,j,k,q,qb);
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize();
        begin
            rst = 1'b0;
            {j,k} = 2'b0;
        end
    endtask
    
    task reset();
        begin
            @(negedge clk)
            rst = 1'b1;
            @(negedge clk)
            rst = 1'b0;
        end
    endtask
    
    task stimulus(input j_i,k_i);
        begin
            @(negedge clk);
            j = j_i;
            k = k_i;
        end
    endtask
    
    initial
        begin
            $monitor("values of clk=%b, rst=%b, j=%b, k=%b, q=%b, qb=%b",clk,rst,j,k,q,qb);
            initialize;
            reset;
            stimulus(0,0);
            stimulus(0,1);
            stimulus(1,0);
            stimulus(1,1);
            stimulus(1,1);
            reset;
            stimulus(0,0);
            stimulus(1,0);
            #20 $finish;
        end
endmodule
