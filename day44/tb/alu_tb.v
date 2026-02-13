`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2026 18:35:50
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
    parameter WIDTH = 8;

    reg  [WIDTH-1:0] a;
    reg  [WIDTH-1:0] b;
    reg  [2:0] sel_in;
    wire [WIDTH-1:0] result;
    wire zero;
    wire carry;
    alu #(.WIDTH(WIDTH)) dut (
        .a(a),
        .b(b),
        .sel_in(sel_in),
        .result(result),
        .zero(zero),
        .carry(carry)
    );
    task initialize;
        begin
            a = 0;
            b = 0;
            sel_in = 0;
            #10;
        end
    endtask
    
    task apply_op(input [2:0] op, input [WIDTH-1:0] a_in,input [WIDTH-1:0] b_in);
        begin
            sel_in = op;
            a      = a_in;
            b      = b_in;
            #10;
        end
    endtask
    
    initial 
        begin
            $monitor("values of a=%d, b=%d, sel_in=%d, result=%d, carry=%d, zero=%d",a,b,sel_in,result,carry,zero);
            initialize;
            apply_op(3'b000, 8'd10, 8'd5);    // 10 + 5 = 15 -- ADD
            apply_op(3'b001, 8'd10, 8'd5);    // 10 - 5 = 5 -- SUB
            apply_op(3'b010, 8'hAA, 8'h0F);   // AND
            apply_op(3'b011, 8'hAA, 8'h0F);   // OR
            apply_op(3'b100, 8'hAA, 8'h0F);   // XOR
            apply_op(3'b101, 8'd3, 8'd7);     // 3 < 7 → 1 --SLT
            apply_op(3'b101, 8'd9, 8'd4);     // 9 < 4 -- 0
            apply_op(3'b110, 8'b0001_0001, 0); // SHIFT LEFT
            apply_op(3'b111, 8'b1000_0000, 0); // SHIFT RIGHT
            apply_op(3'b001, 8'd5, 8'd5);     // result = 0 --ZERO FLAG CHECK
            $finish;
        end
endmodule
