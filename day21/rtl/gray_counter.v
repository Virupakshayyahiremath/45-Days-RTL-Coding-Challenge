`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 17:19:50
// Design Name: 
// Module Name: gray_counter
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


module gray_counter(
    input clk, rst,
    output reg [3:0] gray
    );
    reg [3:0] bin;
    always@(posedge clk)
        begin
            if(rst)
                begin
                    bin <= 4'd0;
                    gray <= 4'd0;
                end
            else
                begin
                    bin <= bin + 1'b1;
                    gray <= (bin >> 1) ^ bin;
                end
        end
endmodule
