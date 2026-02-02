`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2026 16:51:21
// Design Name: 
// Module Name: fifo_edge_tb
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


module fifo_edge_tb;

    reg clk, rst, wr_en, rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    fifo16_8_sync DUT (
        clk, rst, wr_en, rd_en, data_in, data_out, full, empty
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        $display("---- FIFO EDGE CASE TEST ----");

        rst = 1; wr_en = 0; rd_en = 0; data_in = 0;
        #20 rst = 0;

        // 1. Fill FIFO completely
        repeat (16) begin
            @(posedge clk);
            wr_en = 1;
            data_in = data_in + 1;
        end
        wr_en = 0;

        if (!full)
            $display("FAIL: FIFO should be FULL");
        else
            $display("PASS: FIFO FULL condition");

        // 2. Try writing when FULL
        @(posedge clk);
        wr_en = 1;
        data_in = 8'hFF;
        @(posedge clk);
        wr_en = 0;

        // 3. Read all entries
        repeat (16) begin
            @(posedge clk);
            rd_en = 1;
        end
        rd_en = 0;

        if (!empty)
            $display("FAIL: FIFO should be EMPTY");
        else
            $display("PASS: FIFO EMPTY condition");

        // 4. Try reading when EMPTY
        @(posedge clk);
        rd_en = 1;
        @(posedge clk);
        rd_en = 0;

        // 5. Reset during operation
        @(posedge clk);
        rst = 1;
        @(posedge clk);
        rst = 0;

        if (!empty)
            $display("FAIL: FIFO should be EMPTY after reset");
        else
            $display("PASS: FIFO reset behavior OK");

        #40 $finish;
    end

endmodule

