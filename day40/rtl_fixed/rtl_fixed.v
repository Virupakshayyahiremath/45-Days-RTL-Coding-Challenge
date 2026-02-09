`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2026 17:13:36
// Design Name: 
// Module Name: rtl_fixed
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


module rtl_fixed(
    input        clk,
    input        rst_n,
    input        en,
    input        a,
    input        b,
    output reg   y,
    output reg [7:0] data
);

    // COMBINATIONAL - NO LATCH
    always @(*) 
        begin
            y = 1'b0;
            if (en)
                y = a;
        end
    
    // SINGLE DRIVER + WIDTH CLEAN
    always @(posedge clk or negedge rst_n) 
        begin
            if (!rst_n)
                data <= 8'b0;
            else
                data <= en ? {7'b0, a} : {7'b0, b};
        end
endmodule
