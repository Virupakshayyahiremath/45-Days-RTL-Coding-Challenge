`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2026 15:50:50
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
    input  clk,
    input  rst_async,   // asynchronous reset input
    output rst_sync     // synchronized reset output
    );
    reg rst_ff1, rst_ff2;
    always @(posedge clk or posedge rst_async) 
        begin
            if (rst_async) 
                begin
                    rst_ff1 <= 1'b1;
                    rst_ff2 <= 1'b1;
                end 
            else 
                begin
                    rst_ff1 <= 1'b0;
                    rst_ff2 <= rst_ff1;
                end
        end

    assign rst_sync = rst_ff2;
endmodule
