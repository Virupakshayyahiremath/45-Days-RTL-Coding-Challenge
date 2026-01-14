`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2026 14:57:17
// Design Name: 
// Module Name: up_down_counter_sc_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module up_down_counter_sc_tb();
    reg clk, rst;
    reg load, mode;
    reg [3:0] data_in;
    wire [3:0] count;

    reg [3:0] expected_count;

    up_down_counter DUT (
        .clk(clk),
        .rst(rst),
        .load(load),
        .mode(mode),
        .data_in(data_in),
        .count(count)
    );

    // Clock generation
    initial clk = 0;
    always #10 clk = ~clk;

    // Initialize signals
    task initialize;
        begin
            rst = 1;
            load = 0;
            mode = 0;
            data_in = 0;
            expected_count = 0;
        end
    endtask

    // Reset task
    task reset;
        begin
            @(negedge clk);
            rst = 1;
            @(negedge clk);
            rst = 0;
            expected_count = 0;
        end
    endtask

    // Stimulus task
    task stimulus(input load_i, mode_i, input [3:0] data_in_i);
        begin
            @(negedge clk);
            load    = load_i;
            mode    = mode_i;
            data_in = data_in_i;
        end
    endtask

    // Expected value calculation
    always @(posedge clk) begin
        if (rst)
            expected_count <= 4'd0;
        else if (load)
            expected_count <= data_in;
        else if (mode)
            expected_count <= expected_count + 1'b1;
        else
            expected_count <= expected_count - 1'b1;
    end

    // Self-checking block
    always @(posedge clk) begin
        #1; // small delay to allow DUT update
        if (count !== expected_count)
            $display("FAIL: Expected=%b, Got=%b at time=%0t",
                    expected_count, count, $time);
        else
            $display("PASS: count=%b at time=%0t", count, $time);
    end

    // Test sequence
    initial begin
        initialize;
        reset;

        stimulus(1,1,4'd12); // load 12
        stimulus(0,1,4'd12); // up
        stimulus(1,0,4'd12); // load 12
        stimulus(0,0,4'd12); // down

        #40 $finish;
    end

endmodule