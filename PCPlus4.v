`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 06:46:38 PM
// Design Name: 
// Module Name: PCPlus4
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


module PCPlus4(
input [31:0] PC,
output [31:0] PCPlus4
    );
    
    assign PCPlus4 = PC + 3'b100;
    
endmodule
