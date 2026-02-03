`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2026 17:57:16
// Design Name: 
// Module Name: async_fifo
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


module async_fifo #(
    parameter WIDTH = 8,
              DEPTH = 16
)(
    input wr_clk, rd_clk,
    input rst,
    input wr_en, rd_en,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output full, empty
    );
    localparam ADDR_WIDTH = $clog2(DEPTH);
    reg [WIDTH-1:0] mem[0:DEPTH-1];
    
    //...binary & gray pointers...
    reg [ADDR_WIDTH:0] wr_bin, rd_bin;
    reg [ADDR_WIDTH:0] wr_gray, rd_gray;
    
    //...synchronized pointers...
    reg [ADDR_WIDTH:0] rd_gray_sync1, rd_gray_sync2;
    reg [ADDR_WIDTH:0] wr_gray_sync1, wr_gray_sync2;
    
    // ...Binary to Gray...
    wire [ADDR_WIDTH:0] wr_gray_next = (wr_bin + 1'b1) ^ ((wr_bin + 1'b1) >> 1);
    wire [ADDR_WIDTH:0] rd_gray_next = (rd_bin + 1'b1) ^ ((rd_bin + 1'b1) >> 1);
    
    // Write pointer logic
    always @(posedge wr_clk or posedge rst) 
        begin
            if (rst) 
                begin
                    wr_bin  <= 0;
                    wr_gray <= 0;
                end 
            else if (wr_en && !full) 
                begin
                    mem[wr_bin[ADDR_WIDTH-1:0]] <= data_in;
                    wr_bin  <= wr_bin + 1'b1;
                    wr_gray <= wr_gray_next;
                end
        end
        
    // Read pointer logic
    always @(posedge rd_clk or posedge rst) 
        begin
            if (rst) 
                begin
                    rd_bin  <= 0;
                    rd_gray <= 0;
                    data_out    <= 0;
                end 
            else if (rd_en && !empty) 
                begin
                    data_out    <= mem[rd_bin[ADDR_WIDTH-1:0]];
                    rd_bin  <= rd_bin + 1'b1;
                    rd_gray <= rd_gray_next;
                end
        end
        
    // Synchronize Gray pointers
    always @(posedge wr_clk or posedge rst) 
        begin
            if (rst) 
                begin
                    rd_gray_sync1 <= 0;
                    rd_gray_sync2 <= 0;
                end 
            else 
                begin
                    rd_gray_sync1 <= rd_gray;
                    rd_gray_sync2 <= rd_gray_sync1;
                end
        end
    always @(posedge rd_clk or posedge rst) 
        begin
            if (rst) 
                begin
                    wr_gray_sync1 <= 0;
                    wr_gray_sync2 <= 0;
                end 
            else 
                begin
                    wr_gray_sync1 <= wr_gray;
                    wr_gray_sync2 <= wr_gray_sync1;
                end
        end
    assign empty = (rd_gray == wr_gray_sync2);
    assign full = (wr_gray_next == {~rd_gray_sync2[ADDR_WIDTH:ADDR_WIDTH-1], rd_gray_sync2[ADDR_WIDTH-2:0]});
endmodule
