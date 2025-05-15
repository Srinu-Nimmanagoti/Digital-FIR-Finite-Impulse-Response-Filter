`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 23:26:11
// Design Name: 
// Module Name: tb_fir_filter
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


module tb_fir_filter;
    reg clk;
    reg reset;
    reg [7:0] x_in;
    wire [15:0] y_out;

    // Instantiate the FIR filter
    fir_filter uut (
        .clk(clk),
        .reset(reset),
        .x_in(x_in),
        .y_out(y_out)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10 ns clock period

    initial begin
        // Test sequence
        reset = 1; x_in = 0;
        #10 reset = 0;

        x_in = 8'd1; #10;
        x_in = 8'd2; #10;
        x_in = 8'd3; #10;
        x_in = 8'd4; #10;
        x_in = 8'd5; #10;

        x_in = 8'd0; #50;

        $stop;
    end
endmodule

