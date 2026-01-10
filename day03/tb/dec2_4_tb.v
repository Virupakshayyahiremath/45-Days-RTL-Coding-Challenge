`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 22:43:39
// Design Name: 
// Module Name: dec2_4_tb
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


module dec2_4_tb();
    reg [1:0]a;
    reg en;
    wire [3:0] y;
    integer i;
    dec2_4 DUT (a,en,y);
    initial begin
        $monitor("input a=%b, en=%b, output y=%b",a,en, y);
        en = 0;
        a  = 2'b00;
        #10;
        en = 1;
        for (i = 0; i < 4; i = i + 1) begin
            a = i[1:0];
            #10;
        end
        en = 0;
        #10;

        $finish;
    end

endmodule
