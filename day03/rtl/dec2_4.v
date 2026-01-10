`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 22:38:54
// Design Name: 
// Module Name: dec2_4
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


module dec2_4(
    input [1:0] a,
    input       en,
    output [3:0] y
    );
    assign y[0] = en & ~a[1] & ~a[0];
    assign y[1] = en & ~a[1] &  a[0];
    assign y[2] = en &  a[1] & ~a[0];
    assign y[3] = en &  a[1] &  a[0];
endmodule
