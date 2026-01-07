`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2026 17:25:40
// Design Name: 
// Module Name: mux4_1
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


module mux4_1(
    input i0,i1,i2,i3,
    input s0,s1,
    output y
    );
    wire w0,w1,w2,w3;
    dec2_4 DUT1(s0,s1,w0,w1,w2,w3);
    trimux t1(i0,w0,y);
    trimux t2(i1,w1,y);
    trimux t3(i2,w2,y);
    trimux t4(i3,w3,y);
endmodule
