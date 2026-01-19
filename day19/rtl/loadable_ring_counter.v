`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2026 16:21:16
// Design Name: 
// Module Name: loadable_ring_counter
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


module loadable_ring_counter(
    input clk,rst,
    input load,
    input [3:0] load_val,
    output reg [3:0] q
    );
    always @(posedge clk)
        begin
            if(rst)
                q <= 4'b0001;
            else if(load)
                q <= load_val;
            else
                q <= {q[0],q[3:1]};
        end
endmodule
