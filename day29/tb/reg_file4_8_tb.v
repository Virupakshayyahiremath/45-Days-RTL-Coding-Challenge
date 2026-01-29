`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2026 21:22:41
// Design Name: 
// Module Name: reg_file4_8_tb
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


module reg_file4_8_tb();
    reg clk, rst;
    reg we;
    reg [1:0] wr_addr, rd_addr;
    reg [7:0] wr_data;
    wire [7:0] rd_data;
    reg_file4_8 DUT(.clk(clk), .rst(rst), .we(we), .wr_addr(wr_addr), .rd_addr(rd_addr), .wr_data(wr_data), .rd_data(rd_data));
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize;
        begin
            rst = 1'b1;
            we = 1'b0;
            wr_addr = 2'd0;
            rd_addr = 2'd0;
            wr_data = 8'd0;
        end
    endtask
    
    task apply_reset;
        begin
            @(negedge clk);
            rst = 1'b1;
            @(negedge clk);
            rst = 1'b0;
        end
    endtask
    
    task value_write(input [1:0] wr_addr_i, input [7:0] wr_data_i);
        begin
            @(negedge clk);
            we = 1'b1;
            wr_addr = wr_addr_i;
            wr_data = wr_data_i;
            @(negedge clk);
            we = 1'b0;
        end
    endtask
    
    task value_read(input [1:0] rd_addr_i);
        begin
            @(negedge clk);
            rd_addr = rd_addr_i;
            #2;  // This allows combinational read
            $display("Time=%0t | Read Addr=%0d | Data=%0d", $time, rd_addr_i, rd_data);
        end
    endtask
    
    initial 
        begin
            initialize;
            apply_reset;
            value_write(2'd2, 8'd10);
            value_read(2'd2);
            value_write(2'd3, 8'd11);
            value_read(2'd3);
            #20 $finish;
        end
endmodule
