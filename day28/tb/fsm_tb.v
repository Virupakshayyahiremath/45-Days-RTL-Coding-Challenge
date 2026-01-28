`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2026 17:45:28
// Design Name: 
// Module Name: fsm_tb
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


module fsm_tb();
    reg clk,rst;
    reg in;
    wire out;
    fsm DUT(clk,rst,in,out);
    initial clk = 0;
    always #10 clk = ~clk;
    task initialize;
        begin
            rst = 1'b0;
            in = 1'b0;
        end
    endtask
    
    task apply_reset;
        begin
            @(negedge clk);
            rst = 1'b1;
            @(negedge clk);
            rst = 1'b0;
        end
    endtask
    
    task stimulus(input in_i);
        begin
            @(negedge clk);
            in = in_i;
        end
    endtask
    
    task force_illegal_state;
        begin
            @(negedge clk);
            DUT.state = 2'b11;   // force illegal state
        end
    endtask
    
     task check_recovery;
        begin
            @(negedge clk);
            if (DUT.state !== 2'b00)
                $display("FAIL: FSM did not recover from illegal state");
            else
                $display("PASS: FSM recovered from illegal state");
        end
    endtask
    
    initial
        begin
            initialize;
            apply_reset;
            stimulus(1'b1);
            stimulus(1'b0);
            force_illegal_state;
            check_recovery;
            #40 $finish;
        end
endmodule
