`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2026 16:49:54
// Design Name: 
// Module Name: reg_file4_8
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


module reg_file4_8(
    input clk,rst,
    input we,
    input [1:0] wr_addr, rd_addr,
    input [7:0] wr_data,
    output reg [7:0] rd_data
    );
    reg [7:0] mem [3:0];
    integer i;
    always@(posedge clk)
        begin
            if(rst)
                begin
                    for(i=0;i<4;i=i+1)
                        mem[i] <= 8'd0;
                end
            else if(we)
                begin
                    mem[wr_addr] <= wr_data;
                end
        end
    always@(*)
        begin
            rd_data = mem[rd_addr];
        end
endmodule
