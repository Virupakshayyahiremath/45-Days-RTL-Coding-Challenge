`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2026 17:45:34
// Design Name: 
// Module Name: mini_cpu_tb
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


module mini_cpu_tb();
    reg         clk;
    reg         rst;
    reg         start;
    reg  [2:0]  sel_in;
    reg  [1:0]  rs1;
    reg  [1:0]  rs2;
    reg  [1:0]  rd;

    wire [7:0]  alu_out_dbg;
    wire [7:0]  rs1_dbg;
    wire [7:0]  rs2_dbg;
    wire [1:0]  state_dbg;
    mini_cpu DUT(
        .clk(clk),
        .rst(rst),
        .start(start),
        .sel_in(sel_in),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .alu_out_dbg(alu_out_dbg),
        .rs1_dbg(rs1_dbg),
        .rs2_dbg(rs2_dbg),
        .state_dbg(state_dbg)
    );
    initial clk = 0;
    always #5 clk = ~clk;
    task initialize;
        begin
            rst = 1'b1;
            start = 1'b0;
            sel_in = 3'd0;
            rs1 = 2'd0;
            rs2 = 2'd0;
            rd = 2'd0;
        end
    endtask
    
    task apply_reset;
        begin
            @(posedge clk);
            rst = 1'b1;
            @(posedge clk);
            rst = 1'b0;
        end
    endtask
    
    task exec_op(input [2:0] op, input [1:0] src1, input [1:0] src2, input [1:0] dest);
        begin
            sel_in = op;
            rs1    = src1;
            rs2    = src2;
            rd     = dest; //destination register
            start  = 1'b1;
            @(posedge clk);
            start  = 1'b0;
            wait (state_dbg == 2'b00);
            @(posedge clk);
        end
    endtask
    
    initial
        begin
            $monitor("TIME=%0t | STATE=%b | OP=%b RS1=%0d RS2=%0d RD=%0d | A=%0d B=%0d RESULT=%0d",$time, state_dbg, sel_in, rs1, rs2, rd,rs1_dbg, rs2_dbg, alu_out_dbg);
            initialize;
            apply_reset;
            DUT.regfile.mem[0] = 8'd10;
            DUT.regfile.mem[1] = 8'd5;
            DUT.regfile.mem[2] = 8'd3;
            DUT.regfile.mem[3] = 8'd1;
            
            // ADD: R2 = R0 + R1 → 10 + 5 = 15
            exec_op(3'b000, 2'd0, 2'd1, 2'd2);
    
            // SUB: R3 = R2 - R1 → 15 - 5 = 10
            exec_op(3'b001, 2'd2, 2'd1, 2'd3);
    
            // AND: R1 = R0 & R3
            exec_op(3'b010, 2'd0, 2'd3, 2'd1);
    
            // SLT: R0 = R3 < R2
            exec_op(3'b101, 2'd3, 2'd2, 2'd0);
            $finish;
        end
endmodule
