`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2026 15:39:12
// Design Name: 
// Module Name: handshake_cdc
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


module handshake_cdc(
    input clk_src,
    input clk_dst,
    input rst,
    input send,
    output busy
    );
    reg req;
    reg ack_sync1, ack_sync2;
    reg ack;

    always @(posedge clk_src or posedge rst) 
        begin
            if (rst)
                req <= 1'b0;
            else if (send && !req)
                req <= 1'b1;
            else if (ack_sync2)
                req <= 1'b0;
        end
    always @(posedge clk_src or posedge rst) 
        begin
            if (rst) 
                begin
                    ack_sync1 <= 1'b0;
                    ack_sync2 <= 1'b0;
                end 
            else 
                begin
                    ack_sync1 <= ack;
                    ack_sync2 <= ack_sync1;
                end
        end
    assign busy = req;
    reg req_sync1, req_sync2;
    always @(posedge clk_dst or posedge rst) 
        begin
            if (rst) 
                begin
                    req_sync1 <= 1'b0;
                    req_sync2 <= 1'b0;
                    ack <= 1'b0;
                end 
            else 
                begin
                    req_sync1 <= req;
                    req_sync2 <= req_sync1;
                    ack <= req_sync2;
                end
        end
endmodule
