`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 10:43:55 PM
// Design Name: 
// Module Name: execute_mux
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


module execute_mux(
input [31:0] WriteData,
input [31:0] ImmExt,
input ALUSrc,
output [31:0] SrcB
    );
    
    assign SrcB = (ALUSrc) ? ImmExt : WriteData;
    
endmodule
