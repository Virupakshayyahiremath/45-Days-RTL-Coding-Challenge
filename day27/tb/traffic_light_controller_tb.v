`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2026 15:29:14
// Design Name: 
// Module Name: traffic_light_controller_tb
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


module traffic_light_controller_tb();
    reg clk, rst;
    wire red, green, yellow;
    traffic_light_controller #(
        .RED_TIME(5),
        .GREEN_TIME(5),
        .YELLOW_TIME(2)
    ) dut (
        .clk(clk),
        .rst(rst),
        .red(red),
        .green(green),
        .yellow(yellow)
    );
    initial clk = 0;
    always #10 clk = ~clk;
    initial 
        begin
            $monitor("time=%0t | RED=%b GREEN=%b YELLOW=%b",$time, red, green, yellow);
            rst = 1;
            #20 rst = 0;
            #300 $finish;
    end
endmodule
