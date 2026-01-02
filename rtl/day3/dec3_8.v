`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2026 21:33:20
// Design Name: 
// Module Name: dec3_8
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


module dec3_8 (
    input  [2:0] a,
    input        en,
    output reg [7:0] y
);
    always @(*) 
        begin
            y = 8'b00000000;     
            if (en) 
                begin
                    case (a)
                        3'b000: y = 8'b00000001;
                        3'b001: y = 8'b00000010;
                        3'b010: y = 8'b00000100;
                        3'b011: y = 8'b00001000;
                        3'b100: y = 8'b00010000;
                        3'b101: y = 8'b00100000;
                        3'b110: y = 8'b01000000;
                        3'b111: y = 8'b10000000;
                        default: y = 8'b00000000;
                    endcase
                end
            end
endmodule