`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 21:34:22
// Design Name: 
// Module Name: dec3_8_tb
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


module dec3_8_tb;
    reg  [2:0] a;
    reg        en;
    wire [7:0] y;
    integer i;

    dec3_8 DUT (a, en, y);
    initial begin
        $monitor("input a=%b, en=%b, output y=%b",en, a, y);
        en = 0;
        a  = 3'b000;
        #10;
        en = 1;
        for (i = 0; i < 8; i = i + 1) begin
            a = i[2:0];
            #10;
        end
        en = 0;
        #10;

        $finish;
    end

endmodule


