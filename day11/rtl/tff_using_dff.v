`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.01.2026 16:09:40
// Design Name: 
// Module Name: tff_using_dff
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


module tff_using_dff(
    input  clk,
    input  reset,
    input  t,
    output q,
    output qb
    );
    wire d_in;
    assign d_in = t ^ q;
    dff D1 (.clk(clk), .rst(reset), .d(d_in), .q(q), .qb(qb));
endmodule
