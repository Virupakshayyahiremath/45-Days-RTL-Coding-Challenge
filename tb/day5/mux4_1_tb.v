`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2026 17:45:38
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


module mux4_1_tb();
    reg [3:0]i;
    reg [1:0]sel;
    wire y;
    mux4_1 DUT(i,sel,y);
    task initialize;
        begin 
            {i,sel} = 1'b0;
        end
    endtask
    task stimulus(input [3:0]m,input [1:0]n);
        begin 
            #10;
            i   = m;
            sel = n;
        end 
    endtask
    initial 
        begin 
            initialize;
            stimulus(4'd5,2'd2);
            stimulus(4'd15,2'd3);
            stimulus(4'd5,2'd1);
            $finish;
        end 
    initial
        $monitor("input i=%b,sel=%b,output y=%b",i,sel,y);
endmodule
