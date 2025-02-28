`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 09:44:04 PM
// Design Name: 
// Module Name: bit-locator
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
    input en,
    input [15:0] In,
    output reg [7:0] C
);

    always @(en, In)
    begin
    if (en == 1)
    begin
        if (In[15]) C = 8'd15;
        else if (In[14]) C = 8'd14;
        else if (In[13]) C = 8'd13;
        else if (In[12]) C = 8'd12;
        else if (In[11]) C = 8'd11;
        else if (In[10]) C = 8'd10;
        else if (In[9])  C = 8'd9;
        else if (In[8])  C = 8'd8;
        else if (In[7])  C = 8'd7;
        else if (In[6])  C = 8'd6;
        else if (In[5])  C = 8'd5;
        else if (In[4])  C = 8'd4;
        else if (In[3])  C = 8'd3;
        else if (In[2])  C = 8'd2;
        else if (In[1])  C = 8'd1;
        else if (In[0])  C = 8'd0;
        else             C = 8'b11110000; // Special case: all zeros
    end
    end
endmodule