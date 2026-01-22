`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2026 12:50:33
// Design Name: 
// Module Name: g2b_tb
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


module g2b_tb();
    reg [3:0] gray;
    wire [3:0] bin;
    g2b DUT(gray,bin);
    
    task initialize;
        begin
            gray = 4'd0;
            #10;
        end
    endtask
    
    task stimulus(input [3:0]gray_i);
        begin
            gray = gray_i;
            #10;
        end
    endtask
    
    initial
        begin
            $monitor("values of gray=%b, bin=%b",gray,bin);
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
