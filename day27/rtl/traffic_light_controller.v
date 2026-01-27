`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2026 15:06:49
// Design Name: 
// Module Name: traffic_light_controller
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


module traffic_light_controller #(
    parameter RED_TIME = 5,
    parameter GREEN_TIME = 5,
    parameter YELLOW_TIME = 2
    )(
    input clk,rst,
    output reg red,green,yellow
    );
    localparam RED = 2'b00,
              GREEN = 2'b01,
              YELLOW = 2'b10;
    reg [1:0] state, next_state;
    reg [3:0] timer;
    always@(posedge clk)
        begin
            if(rst)
                state <= RED;
            else
                state <= next_state;
        end
    always@(posedge clk)
        begin
            if(rst || state != next_state)
                timer <= 0;
            else
                timer <= timer + 1'b1;
        end
    always@(*)
        begin
            next_state = state;
            case(state)
                RED : begin
                    if(timer == RED_TIME - 1)
                        next_state = GREEN;
                    else
                        next_state = RED;
                end
                GREEN : begin
                    if(timer == GREEN_TIME - 1)
                        next_state = YELLOW;
                    else
                        next_state = GREEN;
                end
                YELLOW : begin
                    if(timer == YELLOW_TIME - 1)
                        next_state = RED;
                    else
                        next_state = YELLOW;
                end
                default : begin
                    next_state = RED;
                end
            endcase
        end
    always@(*)
        begin
            red = (state == RED);
            green = (state == GREEN);
            yellow = (state == YELLOW);
        end
endmodule
