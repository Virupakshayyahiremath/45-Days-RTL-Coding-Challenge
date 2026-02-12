`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 14:36:33
// Design Name: 
// Module Name: mini_system
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


module mini_system (
    input        clk,
    input        rst,
    input        wr_en,
    input  [7:0] data_in,
    output       processing_done
);

    wire [7:0] fifo_dout;
    wire fifo_full;
    wire fifo_empty;
    reg  fifo_rd_en;

    localparam IDLE = 2'b00;
    localparam READ = 2'b01;
    localparam DONE = 2'b10;

    reg [1:0] state;
    reg done_reg;

    assign processing_done = done_reg;

    fifo16_8_sync fifo_inst (
        .clk      (clk),
        .rst      (rst),
        .wr_en   (wr_en),
        .rd_en   (fifo_rd_en),
        .data_in (data_in),
        .data_out(fifo_dout),
        .full    (fifo_full),
        .empty   (fifo_empty)
    );

    always @(posedge clk) 
        begin
            if (rst) 
                begin
                    state        <= IDLE;
                    fifo_rd_en   <= 1'b0;
                    done_reg     <= 1'b0;
                end 
            else 
                begin 
                    fifo_rd_en <= 1'b0;
                    done_reg   <= 1'b0;
        
                    case (state)
                        IDLE: begin
                            if (!fifo_empty)
                                state <= READ;
                        end
        
                        READ: begin
                            fifo_rd_en <= 1'b1;   
                            state <= DONE;
                        end
        
                        DONE: begin
                            done_reg <= 1'b1;     
                            state <= IDLE;
                        end
        
                        default: state <= IDLE;
                    endcase
                end
        end
endmodule
