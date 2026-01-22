`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2026 12:30:16
// Design Name: 
// Module Name: b2g_tb
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


module b2g_tb();
    reg [3:0] bin;
    wire [3:0] gray;
    b2g DUT(bin,gray);
    
    task initialize;
        begin
            bin = 4'd0;
            #10;
        end
    endtask
    
    task stimulus(input [3:0]bin_i);
        begin
            bin = bin_i;
            #10;
        end
    endtask
    
    initial
        begin
            $monitor("values of bin=%b, gray=%b",bin,gray);
            initialize;
            stimulus(4'b0001);
            stimulus(4'b0011);
            stimulus(4'b0010);
            stimulus(4'b1000);
            stimulus(4'b0100);
            initialize;
            stimulus(4'b0101);
            stimulus(4'b0001);
            $finish;
        end
endmodule
