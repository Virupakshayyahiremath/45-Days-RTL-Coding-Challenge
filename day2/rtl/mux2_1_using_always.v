`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2026 17:47:24
// Design Name: 
// Module Name: mux2_1_using_always
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


module mux2_1_using_always(
    input a,b,
    input sel,
    output reg y
     );
     always @(*)
        begin
            if(sel)
                y = a;
            else
                y = b;
        end
endmodule
