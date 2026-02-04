`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2026 15:04:34
// Design Name: 
// Module Name: synchronizer_2ff
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


module synchronizer_2ff(
    input clk_dst,
    input rst_n,
    input signal_src,
    output reg  signal_dst
    );
    reg sync1;

    always @(posedge clk_dst or negedge rst_n) 
        begin
            if (!rst_n) 
                begin
                    sync1      <= 1'b0;
                    signal_dst <= 1'b0;
                end 
            else 
                begin
                    sync1      <= signal_src;
                    signal_dst <= sync1;
                end
        end
endmodule
