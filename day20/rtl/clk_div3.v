`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2026 14:10:09
// Design Name: 
// Module Name: clk_div3
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


module clk_div3(
    input clk,rst,
    output reg clk_out
    );
    reg [1:0] count;
    always@(posedge clk)
        begin
            if(rst)
                begin
                    count <= 2'd0;
                    clk_out <= 0; 
                end
            else
                begin
                    if(count == 2'd2)
                        begin
                            count <= 2'd0;
                            clk_out <= ~clk_out;
                        end
                    else
                        count <= count + 1'b1;
                end
        end
    
endmodule
