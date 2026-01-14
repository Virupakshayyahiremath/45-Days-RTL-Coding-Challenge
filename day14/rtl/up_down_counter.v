`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 14:04:37
// Design Name: 
// Module Name: up_down_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module up_down_counter(
    input            clk,rst,
    input            load,mode,
    input [3:0]      data_in,
    output reg [3:0] count
    );
   always@(posedge clk)
    begin
        if(rst)
            count <= 4'd0;
        else if(load)
            count <= data_in;
        else
            begin
                case(mode)
                    1'b1 : count <= count + 1'b1;
                    1'b0 : count <= count - 1'b1;
                    default : count <= count;
                endcase
            end
    end
endmodule
