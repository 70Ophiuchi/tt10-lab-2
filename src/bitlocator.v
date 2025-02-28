`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 09:44:04 PM
// Design Name: 
// Module Name: priority_encoder
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

module priority_encoder (
    input wire clk,              // Clock input
    input wire rst_n,            // Active-low reset
    input wire ena,              // Enable signal
    input wire [15:0] ui_in,     // 16-bit input
    output reg [7:0] ui_out      // 8-bit encoded output
);

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            ui_out <= 8'b00000000;   // Reset output to 0
        end else if (ena) begin
            if (ui_in[15]) ui_out <= 8'd15;
            else if (ui_in[14]) ui_out <= 8'd14;
            else if (ui_in[13]) ui_out <= 8'd13;
            else if (ui_in[12]) ui_out <= 8'd12;
            else if (ui_in[11]) ui_out <= 8'd11;
            else if (ui_in[10]) ui_out <= 8'd10;
            else if (ui_in[9])  ui_out <= 8'd9;
            else if (ui_in[8])  ui_out <= 8'd8;
            else if (ui_in[7])  ui_out <= 8'd7;
            else if (ui_in[6])  ui_out <= 8'd6;
            else if (ui_in[5])  ui_out <= 8'd5;
            else if (ui_in[4])  ui_out <= 8'd4;
            else if (ui_in[3])  ui_out <= 8'd3;
            else if (ui_in[2])  ui_out <= 8'd2;
            else if (ui_in[1])  ui_out <= 8'd1;
            else if (ui_in[0])  ui_out <= 8'd0;
            else                 ui_out <= 8'b11110000; // Special case: all zeros
        end
    end
endmodule
