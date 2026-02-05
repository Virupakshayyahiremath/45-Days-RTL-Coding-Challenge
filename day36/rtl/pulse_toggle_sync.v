`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2026 15:24:24
// Design Name: 
// Module Name: pulse_toggle_sync
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


module pulse_toggle_sync(
    input clk_src,
    input clk_dst,
    input rst,
    input pulse_src,
    output pulse_dst
    );
    reg toggle;
    always @(posedge clk_src or posedge rst) 
        begin
            if (rst)
                toggle <= 1'b0;
            else if (pulse_src)
                toggle <= ~toggle;
        end
    reg sync1, sync2, sync2_d;
    always @(posedge clk_dst or posedge rst) 
        begin
            if (rst) 
                begin
                    sync1 <= 1'b0;
                    sync2 <= 1'b0;
                    sync2_d <= 1'b0;
                end 
            else 
                begin
                    sync1 <= toggle;
                    sync2 <= sync1;
                    sync2_d <= sync2;
                end
        end
    
    assign pulse_dst = sync1 ^ sync2_d; // Edge detect
endmodule
