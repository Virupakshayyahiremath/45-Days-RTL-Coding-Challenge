`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2026 15:12:29
// Design Name: 
// Module Name: dff_en
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


module dff_en(
    input clk,rst,
    input en,
    input d,
    output reg q
    );
    always@(posedge clk)
        begin
            if(rst)
                q <= 1'b0;
            else if(en)
                q <= d;
            else
                q <= q;
        end
endmodule
