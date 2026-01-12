`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.01.2026 14:25:45
// Design Name: 
// Module Name: jkff_using_dff
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


module jkff_using_dff(
    input  clk,
    input  rst, 
    input  j,
    input  k,
    output q,
    output qb
    );
    wire d_in;
    assign d_in = (j & ~q) | (~k & q);
     dff D1 (.clk(clk), .rst(rst), .d(d_in), .q(q), .qb(qb));
endmodule
