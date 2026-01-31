`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2026 18:33:38
// Design Name: 
// Module Name: dual_port_ram_tb
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


module dual_port_ram_tb();
    parameter DEPTH = 8;
    parameter WIDTH = 8;
     reg clk, rst;
    reg we, re;
    reg [$clog2(DEPTH)-1:0] wr_addr, rd_addr;
    reg [WIDTH-1:0] data_in;
    wire [WIDTH-1:0] data_out;
    dual_port_ram #(
        .DEPTH(DEPTH),
        .WIDTH(WIDTH)
    ) DUT (
        .clk(clk),
        .rst(rst),
        .we(we),
        .re(re),
        .wr_addr(wr_addr),
        .rd_addr(rd_addr),
        .data_in(data_in),
        .data_out(data_out)
    );
    integer i;
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize;
        begin
            rst     = 1'b1;
            we      = 1'b0;
            re      = 1'b0;
            wr_addr = {($clog2(DEPTH)){1'b0}};
            rd_addr = {($clog2(DEPTH)){1'b0}};
            data_in = {WIDTH{1'b0}};
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
    
    task value_write(input [$clog2(DEPTH)-1:0] addr_i, input [WIDTH-1:0] data_i);
        begin
            @(posedge clk);
            we      = 1'b1;
            wr_addr = addr_i;
            data_in = data_i;
            @(posedge clk);
            we      = 1'b0;
        end
    endtask
    
    task value_read(input [$clog2(DEPTH)-1:0] addr_i);
        begin
            @(posedge clk);
            re      = 1'b1;
            rd_addr = addr_i;
            // synchronous read takes 1 clock
            @(posedge clk);
            $display("Time=%0t | Read Addr=%0d | Data=%0h", $time, addr_i, data_out);
            re = 1'b0;
        end
    endtask
    
    initial 
        begin
            initialize;
            apply_reset;
            // WRITE 
            for (i = 0; i < DEPTH; i = i + 1)
                value_write(i, i + 8'h10);
            // READ PHASE
            for (i = 0; i < DEPTH; i = i + 1)
                value_read(i);
            #20 $finish;
        end
endmodule
