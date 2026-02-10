`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2026 18:58:21
// Design Name: 
// Module Name: uart_tx_tb
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


module uart_tx_tb();
    reg clk, rst, tx_start;
    reg [7:0] tx_data;
    wire tx, tx_done;
    uart_tx #(.CLKS_PER_BIT(8)) DUT (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_done(tx_done)
    );
    
    initial clk = 0;
    always #5 clk = ~clk;
    task initialize;
        begin
            rst      = 1'b1;
            tx_start = 1'b0;
            tx_data  = 8'h00;
        end
    endtask
    
    task apply_reset;
        begin
            rst = 1'b1;
            repeat (5) @(posedge clk);
            rst = 1'b0;
            @(posedge clk);
        end
    endtask
    
    task send_byte(input [7:0] tx_data_i);
        begin
            @(posedge clk);
            tx_data  <= tx_data_i;
            tx_start <= 1'b1;

            @(posedge clk);
            tx_start <= 1'b0;
            wait (tx_done == 1'b1);
            @(posedge clk);
        end
    endtask
    
    initial 
        begin
            $monitor("time=%0t tx=%b tx_done=%b", $time, tx, tx_done);
            initialize;
            apply_reset();
            send_byte(8'h96); // 1001_0110
            $finish;
        end
endmodule
