`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 17:30:46
// Design Name: 
// Module Name: mux2_1_tb
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


module mux2_1_tb();
reg a,b;
reg sel;
wire y;
integer i;
mux2_1 DUT(a,b,sel,y);
initial
    begin
        for(i=0;i<8;i=i+1)
            begin
                {sel,a,b} = i;
                #10;
            end
            $finish;
    end
initial
    begin
        $monitor("input a=%b,b=%b,sel=%b,output y=%b",a,b,sel,y);
    end
endmodule
