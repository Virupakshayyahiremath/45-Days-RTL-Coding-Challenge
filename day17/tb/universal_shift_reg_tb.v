`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 17:27:53
// Design Name: 
// Module Name: universal_shift_reg_tb
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


module universal_shift_reg_tb();
    reg clk, rst;
    reg [1:0] mode;
    reg serial_in;
    reg [3:0] parallel_in;
    wire [3:0] q;
    universal_shift_reg DUT (clk, rst, mode, serial_in, parallel_in, q);
    initial clk = 0;
    always #10 clk = ~clk;
    
    task initialize;
        begin
            rst = 1'b1;
            mode = 2'b00;
            serial_in = 0;
            parallel_in = 4'b0000;
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
    
    task stimulus(input [1:0] mode_i, input serial_in_i, input [3:0] parallel_in_i);
        begin
            @(negedge clk);
            mode = mode_i;
            serial_in = serial_in_i;
            parallel_in = parallel_in_i;
        end
    endtask
    
    initial begin
        $monitor("values of mode=%b serial_in=%b parallel_in=%b q=%b",mode, serial_in, parallel_in, q);
        initialize;
        apply_reset;
        stimulus(2'b11, 0, 4'b1010);
        stimulus(2'b10, 1, 4'b0000);
        stimulus(2'b10, 0, 4'b0000);
        stimulus(2'b01, 1, 4'b0000);
        stimulus(2'b01, 0, 4'b0000);
        stimulus(2'b00, 0, 4'b0000);
        #40 $finish;
    end
endmodule
