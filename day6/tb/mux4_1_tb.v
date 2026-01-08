`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2026 17:48:39
// Design Name: 
// Module Name: mux4_1_tb
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


module mux4_1_tb();
    reg d0,d1,d2,d3;
    reg [1:0] sel;
    wire y;
    integer i;
    mux4_1 DUT(d0,d1,d2,d3,sel,y);
    initial
        begin 
            {d0,d1,d2,d3,sel[0],sel[1]} = 1'b0;
        end
    initial
        begin
            for(i=0;i<64;i=i+1)
                begin
                    {d3, d2, d1, d0, sel} = i;
                    #10;
                end
            $finish;
        end
    initial
        $monitor("input d0=%b, d1=%b, d2=%b, d3=%b, sel[1]=%b, sel[0]=%b, output y=%b",d0,d1,d2,d3,sel[1],sel[0],y);
endmodule
