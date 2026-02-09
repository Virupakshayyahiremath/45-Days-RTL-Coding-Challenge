`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2026 17:12:17
// Design Name: 
// Module Name: rtl_buggy
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


module rtl_buggy(
    input        clk,
    input        rst_n,
    input        en,
    input        a,
    input        b,
    output reg   y,
    output reg [7:0] data
);

wire unused_signal;              // UNUSED SIGNAL

// LATCH INFERENCE
always @(*) begin
    if (en)
        y = a;
end

// WIDTH MISMATCH
always @(*) begin
    data = 1'b1;
end

// MULTIPLE DRIVERS
always @(posedge clk)
    data <= {7'b0, a};

always @(posedge clk)
    data <= {7'b0, b};
endmodule
