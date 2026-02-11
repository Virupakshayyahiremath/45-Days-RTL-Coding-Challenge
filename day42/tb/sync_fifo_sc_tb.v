`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2026 14:05:07
// Design Name: 
// Module Name: sync_fifo_sc_tb
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


module sync_fifo_sc_tb();
    reg clk, rst, wr_en, rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    integer write_count = 0;
    integer read_count  = 0;
    integer error_count = 0;

    // Simple reference model (scoreboard)
    reg [7:0] model_mem [0:15];

    fifo16_8_sync DUT (
        clk, rst, wr_en, rd_en, data_in, data_out, full, empty
    );

    initial clk = 0;
    always #10 clk = ~clk;

    initial begin
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;
        #20 rst = 0;

        // Write 8 values
        repeat (8) begin
            @(posedge clk);
            if (!full) begin
                wr_en   <= 1;
                data_in <= write_count;
                model_mem[write_count % 16] <= write_count;
            end

            @(posedge clk);
            wr_en <= 0;
            write_count = write_count + 1;
        end

        // Read 
        repeat (8) begin
    
        @(posedge clk);
        if (!empty)
            rd_en <= 1;
    
        @(posedge clk);
        rd_en <= 0;
    
        @(posedge clk);
    
        if (data_out !== model_mem[read_count % 16]) begin
            $error("Mismatch: Expected=%0d Got=%0d at time=%0t", model_mem[read_count % 16], data_out, $time);
            error_count = error_count + 1;
        end
        else begin
            $display("PASS: Data=%0d", data_out);
        end
    
        read_count = read_count + 1;
    end

        if (error_count == 0)
            $display("TEST PASSED");
        else
            $display("TEST FAILED with %0d errors", error_count);

        #20 $finish;
    end

endmodule