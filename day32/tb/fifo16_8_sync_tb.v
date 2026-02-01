`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2026 11:03:08
// Design Name: 
// Module Name: fifo16_8_sync_tb
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


module fifo16_8_sync_tb();
    reg clk, rst;
    reg wr_en, rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;
    integer i;
    fifo16_8_sync DUT(clk, rst, wr_en, rd_en, data_in, data_out, full, empty);
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize;
        begin
            rst = 1'b1;
            wr_en = 1'b0;
            rd_en = 1'b0;
            data_in = 8'd0;
        end
    endtask
    
    task apply_reset;
        begin
            @(posedge clk);
            rst = 1'b1;
            @(posedge clk);
            rst = 1'b0;
        end
    endtask
    
    task value_write(input [7:0] data_in_i);
        begin
            @(posedge clk);
            if (!full) 
                begin
                    wr_en = 1'b1;
                    rd_en = 1'b0;
                    data_in = data_in_i;
                end
            @(posedge clk);
            wr_en = 1'b0;
        end
    endtask
    
    task value_read;
        begin
            @(posedge clk);
            if (!empty)
                begin 
                    rd_en = 1'b1;
                    wr_en = 1'b0;
                end
            @(posedge clk);
            rd_en = 1'b0;
            @(posedge clk);
        end
    endtask
    
    initial
        begin
            initialize;
            apply_reset;
            for(i=0;i<16;i=i+1)
                begin
                    value_write(i);
                end
            for(i=0;i<16;i=i+1)
                begin
                    value_read;
                end
            $finish;
        end
endmodule
