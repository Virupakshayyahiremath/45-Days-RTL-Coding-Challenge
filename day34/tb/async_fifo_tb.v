`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2026 18:39:54
// Design Name: 
// Module Name: async_fifo_tb
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


module async_fifo_tb();
    parameter WIDTH = 8;
    parameter DEPTH = 16;
    reg wr_clk, rd_clk, rst;
    reg wr_en, rd_en;
    reg [WIDTH-1:0] data_in;
    wire [WIDTH-1:0] data_out;
    wire full, empty;
    async_fifo #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) DUT (
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );
    // Write clock (100 MHz)
    initial wr_clk = 0;
    always #5 wr_clk = ~wr_clk;

    // Read clock (≈71 MHz)
    initial rd_clk = 0;
    always #7 rd_clk = ~rd_clk;
    initial begin
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;
        #20 rst = 0;
    end
    
    // Write process
    initial begin
        @(negedge rst);
        repeat (6) begin
            @(posedge wr_clk);
            if (!full) begin
                wr_en = 1;
                data_in = data_in + 1;
            end
        end
        @(posedge wr_clk);
        wr_en = 0;
    end
    
    // Read process
    initial begin
        @(negedge rst);
        #50; // delay read to allow FIFO fill

        repeat (6) begin
            @(posedge rd_clk);
            if (!empty)
                rd_en = 1;
        end
        @(posedge rd_clk);
        rd_en = 0;
    end
    
    initial begin
        $monitor("time=%0t | wr_en=%b rd_en=%b data_in=%0d data_out=%0d full=%b empty=%b", $time, wr_en, rd_en, data_in, data_out, full, empty);
    end

    initial #300 $finish;
endmodule
