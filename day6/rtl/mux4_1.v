`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2026 17:42:18
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
    input d0,d1,d2,d3,
    input [1:0] sel,
    output y
    );
    wire w1,w2;
    mux2_1 DUT1(.a(d0), .b(d1), .sel(sel[0]), .out(w1));
    mux2_1 DUT2(.a(d2), .b(d3), .sel(sel[0]), .out(w2));
    mux2_1 DUT3(.a(w1), .b(w2), .sel(sel[1]), .out(y));
    
endmodule
