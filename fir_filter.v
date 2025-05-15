`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 23:24:38
// Design Name: 
// Module Name: fir_filter
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
module fir_filter (
    input clk,
    input reset,
    input [7:0] x_in,
    output reg [15:0] y_out
);
    reg [7:0] x_reg0, x_reg1, x_reg2;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            x_reg0 <= 0;
            x_reg1 <= 0;
            x_reg2 <= 0;
            y_out <= 0;
        end else begin
            // Shift input samples
            x_reg2 <= x_reg1;
            x_reg1 <= x_reg0;
            x_reg0 <= x_in;

            // Apply FIR filter: y = 1*x[n] + 2*x[n-1] + 1*x[n-2]
            y_out <= (x_reg0 * 1) + (x_reg1 * 2) + (x_reg2 * 1);
        end
    end
endmodule

