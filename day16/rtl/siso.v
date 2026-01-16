`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 13:56:30
// Design Name: 
// Module Name: siso
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


module siso(
    input  clk,
    input  rst,
    input  serial_in,
    output serial_out
);
    reg [3:0] w;
    always @(posedge clk) 
        begin
            if (rst)
                w <= 4'b0000;
            else
                w <= {w[2:0], serial_in};
        end

    assign serial_out = w[3];

endmodule

