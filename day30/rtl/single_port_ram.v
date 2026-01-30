`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2026 06:33:50
// Design Name: 
// Module Name: single_port_ram
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


module single_port_ram #(
    parameter WIDTH = 8,
              DEPTH = 8
)(
    input clk, rst,
    input we,
    input [$clog2(DEPTH)-1:0] addr,
    input [WIDTH-1:0]data_in,
    output reg [WIDTH-1:0] data_out
    );
    reg [WIDTH-1:0] mem[DEPTH-1:0];
    integer i;
    always@(posedge clk)
        begin
            if(rst)
                begin
                    for(i=0;i<DEPTH;i=i+1)
                        mem[i] <= {WIDTH{1'b0}};
                end
            else if(we)
                begin
                    mem[addr] <= data_in;
                end
        end
    always@(*)
        begin
            data_out = mem[addr];
        end
endmodule
