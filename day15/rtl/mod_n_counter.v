`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2026 13:55:12
// Design Name: 
// Module Name: mod_n_counter
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


module mod_n_counter #(
    parameter N = 10,
    parameter WIDTH = $clog2(N)
    )(
    input clk,rst,
    output reg [WIDTH-1:0] count
    );
    always@(posedge clk)
        begin
            if(rst)
                count <= 0;
            else if(count == N-1)
                count <= 0;
            else
                count <= count + 1'b1;
        end
endmodule
