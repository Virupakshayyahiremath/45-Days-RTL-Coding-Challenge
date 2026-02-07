`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2026 17:14:38
// Design Name: 
// Module Name: param_counter
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


module param_counter#(
    parameter WIDTH = 8
)(
    input  clk,
    input  rst,
    input  en,
    output reg [WIDTH-1:0] count
);

    always @(posedge clk) 
        begin
            if (rst)
                count <= {WIDTH{1'b0}};
            else if (en)
                count <= count + 1'b1;
        end
endmodule
