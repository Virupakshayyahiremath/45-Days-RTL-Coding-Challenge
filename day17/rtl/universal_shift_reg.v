`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 17:02:21
// Design Name: 
// Module Name: universal_shift_reg
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


module universal_shift_reg(
    input clk,rst,
    input [1:0] mode,
    input serial_in,
    input [3:0] parallel_in,
    output reg [3:0] q 
    );
    always@(posedge clk)
        begin
            if(rst)
                q <= 4'd0;
            else
                begin
                    case(mode)
                        2'b00: q <= q;                          
                        2'b01: q <= {serial_in, q[3:1]};       
                        2'b10: q <= {q[2:0], serial_in};        
                        2'b11: q <= parallel_in;                
                        default: q <= q;
                    endcase
                end
        end
endmodule
