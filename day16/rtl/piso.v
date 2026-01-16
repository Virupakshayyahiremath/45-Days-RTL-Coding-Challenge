`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2026 16:11:20
// Design Name: 
// Module Name: piso
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


module piso(
    input clk,rst,
    input load,en,
    input [3:0] parallel_in,
    output reg serial_out
    );
    reg [3:0] w;
    always@(posedge clk)
        begin
            if(rst)
                begin
                    w <= 4'd0;
                    serial_out <= 1'b0;
                end
            else if(load)
                w <= parallel_in;
            else if(en)
                begin
                    serial_out <= w[3];
                    w <= {w[2:0], 1'b0};
                end
        end
endmodule
