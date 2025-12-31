`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.12.2025 22:08:46
// Design Name: 
// Module Name: and_gate_tb
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


module and_gate_tb();
    reg a;
    reg b;
    wire y;
    integer i;
    and_gate DUT(a,b,y);
    initial
        begin
            {a,b} = 0;
        end
    initial
        begin
            for(i=0;i<4;i=i+1)
                begin
                    {a,b} = i;
                    #10;
                end
        end
    initial
        begin
            $monitor("input a=%b b=%b, output y=%b", a,b,y);
        end
    initial
    #100 $finish;
endmodule
