`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2026 06:48:51
// Design Name: 
// Module Name: fsm_with_counter
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


module fsm_with_counter(
    input clk,rst,
    input start,
    output reg done
    );
    parameter IDLE = 2'b00,
              WAIT = 2'b01,
              DONE = 2'b10;
    reg [1:0] state, next_state;
    reg [3:0] count;
    always@(posedge clk)
        begin
            if(rst)
                state <=IDLE;
            else
                state <= next_state;
        end
    always@(posedge clk)
        begin
            if(rst || state != WAIT)
                count <= 0;
            else
                count <= count + 1'b1;
        end
    always @(*)
        begin
        next_state = state;
            case(state)
                    IDLE : begin
                        if(start)
                            next_state = WAIT;
                        else
                            next_state = IDLE;
                    end
                    WAIT : begin
                        if(count == 4)
                            next_state = DONE;
                        else
                            next_state = WAIT;
                    end
                    DONE : begin
                        next_state = IDLE;
                    end
                    default : begin
                        next_state = IDLE;
                    end
            endcase
        end
    always@(*)
        begin
            done = (state == DONE);
        end
endmodule
