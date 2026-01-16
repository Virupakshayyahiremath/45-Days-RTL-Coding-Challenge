`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 15:40:23
// Design Name: 
// Module Name: sipo_4bit
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


module sipo_4bit(
    input clk, rst,
    input serial_in,
    output reg [3:0] parallel_out
    );
    always@(posedge clk)
        begin
            if(rst)
                parallel_out = 4'd0;
            else
                parallel_out = {parallel_out[2:0], serial_in};
        end
endmodule
