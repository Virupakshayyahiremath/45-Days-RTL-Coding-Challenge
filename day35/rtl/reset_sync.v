`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2026 15:20:33
// Design Name: 
// Module Name: reset_sync
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


module reset_sync(
    input clk,
    input rst_async,
    output reg  rst_sync
    );
    always @(posedge clk or posedge rst_async) 
        begin
            if (rst_async)
                rst_sync <= 1'b1;
            else
                rst_sync <= 1'b0;
        end
endmodule
