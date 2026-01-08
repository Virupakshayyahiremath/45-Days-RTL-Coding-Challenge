`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2026 17:33:47
// Design Name: 
// Module Name: mux4_1_tb
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


module mux4_1_tb;
    reg  [3:0] i;
    reg  [1:0] sel;
    wire y;

    mux4_1 DUT (
        .i0(i[0]),
        .i1(i[1]),
        .i2(i[2]),
        .i3(i[3]),
        .s0(sel[0]),
        .s1(sel[1]),
        .y(y)
    );
    task initialize;
        begin
            i   = 4'b0000;
            sel = 2'b00;
        end
    endtask
    task stimulus(input [3:0] m, input [1:0] n);
        begin
            #10;
            i   = m;
            sel = n;
        end
    endtask

    initial begin
        initialize;
        stimulus(4'b0101, 2'd2); 
        stimulus(4'b1111, 2'd3); 
        stimulus(4'b0101, 2'd1); 
        $finish;
    end
    initial
        $monitor("i=%b sel=%b y=%b", i, sel, y);
endmodule

