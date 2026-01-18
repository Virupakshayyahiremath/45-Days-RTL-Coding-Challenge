`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.01.2026 14:40:54
// Design Name: 
// Module Name: johnson_counter
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


module johnson_counter(
    input clk,rst,
    output reg [3:0] q 
    );
    always@(posedge clk)
        begin
            if(rst)
                q <= 4'b0000;
            else
                q <= {~q[0], q[3:1]};
        end
endmodule
