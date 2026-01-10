`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.01.2026 11:12:45
// Design Name: 
// Module Name: dff_en_async_rst
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


module dff_en_async_rst(
    input clk,rst,
    input en,
    input d,
    output reg q
    );
    always@(posedge clk or posedge rst)
        begin
            if(rst)
                q <= 1'b0;
            else if(en)
                q <= d;
            else
                q <= q;
        end
endmodule
