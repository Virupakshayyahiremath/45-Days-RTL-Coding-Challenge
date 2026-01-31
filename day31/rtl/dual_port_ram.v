`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2026 17:57:03
// Design Name: 
// Module Name: dual_port_ram
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


module dual_port_ram #(
    parameter WIDTH = 8,
              DEPTH = 8
)(  input clk, rst,
    input we, re,
    input [$clog2(DEPTH)-1:0] wr_addr,rd_addr,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out
    );
    reg[WIDTH-1:0] mem[DEPTH-1:0];
    integer i;
    //write operation
    always@(posedge clk)
        begin
            if(rst)
                begin
                    for(i=0;i<DEPTH;i=i+1)
                        mem[i] <= {WIDTH{1'b0}};
                end
            else if(we)
                begin
                    mem[wr_addr] <= data_in;
                end
        end
    //read operation
    always@(posedge clk)
        begin
            if(rst)
                data_out <= {WIDTH{1'b0}};
            else if(re)
                data_out <= mem[rd_addr];
        end
endmodule
