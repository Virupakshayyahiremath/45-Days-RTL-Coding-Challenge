`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2026 18:57:42
// Design Name: 
// Module Name: dff_async_rst
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


module dff_async_rst(
    input      clk,rst,
    input      d,
    output reg q
    );
    always@(posedge clk or posedge rst)
        begin
            if(rst)
                q <= 1'b0;
            else
                q <= d;
        end
endmodule
