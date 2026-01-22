`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2026 12:20:16
// Design Name: 
// Module Name: b2g
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


module b2g(
    input [3:0] bin,
    output [3:0] gray
    );
    assign gray[3] = bin[3];
    assign gray[2] = bin[3] ^ bin[2];
    assign gray[1] = bin[2] ^ bin[1];
    assign gray[0] = bin[1] ^ bin[0];
endmodule
