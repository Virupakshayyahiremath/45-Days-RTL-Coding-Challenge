`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 14:51:09
// Design Name: 
// Module Name: mini_system_tb
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


module mini_system_tb();
    reg clk, rst, wr_en;
    reg [7:0] data_in;
    wire processing_done;
    mini_system DUT (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .data_in(data_in),
        .processing_done(processing_done)
    );
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize;
        begin
            rst = 1'b0;
            wr_en = 1'b0;
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
    
    task write_fifo(input [7:0] data);
        begin
            @(posedge clk);
            wr_en = 1'b1;
            data_in = data;
            @(posedge clk);
            wr_en = 1'b0;
        end
    endtask
    
    task wait_for_done;
        begin
            @(posedge processing_done);
            $display("[%0t] processing_done seen", $time);
        end
    endtask
    
    initial
        begin
            $monitor("values of clk=%b, rst=%b, wr_en=%b, data_in=%b, processing_done=%b", clk,rst,wr_en,data_in,processing_done);
            initialize;
            apply_reset;
            write_fifo(8'd10);
            write_fifo(8'd20);
            write_fifo(8'd30);
            wait_for_done;
            wait_for_done;
            wait_for_done;
            #40 $finish;
        end
endmodule
