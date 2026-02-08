`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2026 13:12:04
// Design Name: 
// Module Name: latch_inference_example
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

//latch interface example
//BAD: Latch inferred
module bad_latch (
    input  en,
    input  a,
    output reg y
);
    always @(*) begin
        if (en)
            y = a;
    end
endmodule

//GOOD: No latch
module good_no_latch (
    input  en,
    input  a,
    output reg y
);
    always @(*) begin
        y = 1'b0;       // default assignment
        if (en)
            y = a;  //or else block can include to avoid the latch interface
    end
endmodule

