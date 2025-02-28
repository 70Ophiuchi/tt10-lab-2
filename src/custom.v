`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:46:35 PM
// Design Name: 
// Module Name: custom
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


module custom_logic(
input [7:0] A,
input [7:0] B,
output [7:0] C
    );
    
wire [7:0] XOR_R;
assign XOR_R = A ^ B;

assign C = (A[7] == 0) ? XOR_R : ~XOR_R;


endmodule
