`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2026 13:10:16
// Design Name: 
// Module Name: blocking_vs_nonblocking
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

//blocking vs nonblocking
// BAD : Blocking in sequential logic
module bad_seq (
    input  clk,
    input  d,
    output reg q
);
    always @(posedge clk) begin
        q = d;   // wrong
    end
endmodule

// GOOD: Non-blocking in sequential logic
module good_seq (
    input  clk,
    input  d,
    output reg q
);
    always @(posedge clk) begin
        q <= d;  // correct
    end
endmodule
