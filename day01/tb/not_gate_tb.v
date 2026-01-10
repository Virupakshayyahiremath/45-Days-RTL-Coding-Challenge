`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.12.2025 22:57:47
// Design Name: 
// Module Name: not_gate_tb
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


module not_gate_tb();
    reg a;
    wire y;
    integer i;
    not_gate DUT(a,y);
    initial
        begin
            a = 0;
        end
    initial
        begin
            for(i=0;i<2;i=i+1)
                begin
                    a = i;
                    #10;
                end
        end
    initial
        begin
            $monitor("input a=%b output y=%b",a,y);
        end
    initial
    #100 $finish;
endmodule
