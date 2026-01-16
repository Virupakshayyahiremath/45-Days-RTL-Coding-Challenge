`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 16:50:08
// Design Name: 
// Module Name: pipo
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


module pipo(
    input clk,rst,
    input [3:0] parallel_in,
    output reg [3:0] parallel_out
    );
    always@(posedge clk)
        begin
            if(rst)
                parallel_out <= 4'd0;
            else
                parallel_out <= parallel_in;
        end
endmodule
