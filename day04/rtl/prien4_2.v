`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2026 17:31:12
// Design Name: 
// Module Name: prien4_2
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


module prien4_2(
    input  [3:0] req,
    output reg [1:0] code,
    output reg       valid
    );
    always @(*) begin
        code  = 2'b00;   
        valid = 1'b0;    

        casez (req)
            4'b1???: begin code = 2'b11; valid = 1'b1; end
            4'b01??: begin code = 2'b10; valid = 1'b1; end
            4'b001?: begin code = 2'b01; valid = 1'b1; end
            4'b0001: begin code = 2'b00; valid = 1'b1; end
            default: begin code = 2'b00; valid = 1'b0; end
        endcase
    end
endmodule
