`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2026 14:29:08
// Design Name: 
// Module Name: up_counter
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


module up_counter(
    input clk,rst,
    input load,
    input [3:0] data_in,
    output reg [3:0] count 
    );
    always@(posedge clk)
        begin
            if(rst)
                count <= 4'd0;
            else if(load)
                count <= data_in;
            else
                count <= count + 1'b1;
        end
endmodule
