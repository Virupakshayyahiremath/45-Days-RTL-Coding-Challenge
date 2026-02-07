`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2026 17:15:21
// Design Name: 
// Module Name: param_reg
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


module param_reg #(
    parameter WIDTH = 8
)(
    input  clk,
    input  rst,
    input  [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);

    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) 
            begin 
                always @(posedge clk) 
                    begin
                        if (rst)
                            q[i] <= 1'b0;
                        else
                            q[i] <= d[i];
                    end
            end
    endgenerate
endmodule
