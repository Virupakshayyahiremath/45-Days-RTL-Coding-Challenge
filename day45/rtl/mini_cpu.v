`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2026 16:58:37
// Design Name: 
// Module Name: mini_cpu
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


module mini_cpu(
    input         clk,
    input         rst,
    input         start,
    input  [2:0]  sel_in,     // ALU operation
    input  [1:0]  rs1,        // source register 1
    input  [1:0]  rs2,        // source register 2
    input  [1:0]  rd,         // destination register

    // Debug 
    output [7:0]  alu_out_dbg,
    output [7:0]  rs1_dbg,
    output [7:0]  rs2_dbg,
    output [1:0]  state_dbg
    );
    reg we;
    reg [1:0] wr_addr, rd_addr;
    reg [7:0] wr_data;
    
    wire [7:0] rd_data;
    reg [7:0] operand_a, operand_b;
    
    wire [7:0] alu_result;
    wire zero;
    wire carry;
    
    reg_file4_8 regfile (
        .clk(clk),
        .rst(rst),
        .we(we),
        .wr_addr(wr_addr),
        .rd_addr(rd_addr),
        .wr_data(wr_data),
        .rd_data(rd_data)
    );
    
    alu alu_inst (
        .a(operand_a),
        .b(operand_b),
        .sel_in(sel_in),
        .result(alu_result),
        .zero(zero),
        .carry(carry)
    );
    
    localparam IDLE  = 2'b00,
               READ1 = 2'b01,
               READ2 = 2'b10,
               WRITE = 2'b11;
    reg [1:0] state;
    always @(posedge clk) 
        begin
            if (rst)
                begin
                    state     <= IDLE;
                    we        <= 1'b0;
                    operand_a<= 8'd0;
                    operand_b<= 8'd0;
                    wr_addr  <= 2'd0;
                    wr_data  <= 8'd0;
                    rd_addr  <= 2'd0;
                end
            else
                begin
                    case(state)
                        IDLE: begin
                            we <= 1'b0;
                            if (start) 
                                begin
                                    rd_addr <= rs1;   // read rs1
                                    state   <= READ1;
                                end
                        end

                        READ1: begin
                            operand_a <= rd_data;
                            rd_addr   <= rs2;    // read rs2
                            state     <= READ2;
                        end

                        READ2: begin
                            operand_b <= rd_data;
                            state     <= WRITE;
                        end

                        WRITE: begin
                            wr_addr <= rd;
                            wr_data <= alu_result;
                            we      <= 1'b1;
                            state   <= IDLE;
                        end

                        default: state <= IDLE;
                    endcase
                end
        end
    assign alu_out_dbg = alu_result;
    assign rs1_dbg     = operand_a;
    assign rs2_dbg     = operand_b;
    assign state_dbg   = state;
endmodule
