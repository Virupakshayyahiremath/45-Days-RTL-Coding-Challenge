`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2026 17:38:08
// Design Name: 
// Module Name: prien4_2_tb
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


module prien4_2_tb();
    reg  [3:0] req;
    wire [1:0] code;
    wire       valid;
    integer i;
    prien4_2 DUT (req, code, valid);
    initial 
        begin
            $monitor("time=%0t | req=%b | code=%b valid=%b",$time, req, code, valid);
        end
     initial 
        begin
            req = 4'b0000;
            #10;
            for (i = 0; i < 4; i = i + 1) 
                begin
                    req = 4'b0001 << i;
                    #10;
                end
            req = 4'b1010; #10;
            req = 4'b0111; #10;
            req = 4'b1100; #10;
            $finish;
        end
endmodule
