`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2026 16:53:57
// Design Name: 
// Module Name: fifo16_8_sync
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


module fifo16_8_sync(
    input clk, rst,
    input wr_en, rd_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full, empty
    );
    reg[7:0] mem[0:15];
    reg [4:0] wr_ptr;
    reg [4:0] rd_ptr;
    //.....write operation.....
    always@(posedge clk)
        begin
            if(rst)
                wr_ptr <= 5'd0;
            else if(wr_en && (!full))
                begin
                    mem[wr_ptr[3:0]] <= data_in;
                    wr_ptr <= wr_ptr + 1'b1;
                end
        end
    //.....read operation..........
    always@(posedge clk)
        begin
            if(rst)
                begin
                    rd_ptr <= 5'd0;
                    data_out <= 8'd0;
                end
            else if(rd_en && (!empty))
                begin
                    data_out <= mem[rd_ptr[3:0]];
                    rd_ptr <= rd_ptr + 1'b1;
                end
        end
    //......full & empty logic.......
    assign empty = (wr_ptr == rd_ptr);
    assign full = (wr_ptr[4] != rd_ptr[4]) && (wr_ptr[3:0] == rd_ptr[3:0]);
endmodule

