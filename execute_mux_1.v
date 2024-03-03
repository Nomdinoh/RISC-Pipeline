`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2024 11:21:26 AM
// Design Name: 
// Module Name: execute_mux_1
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


module execute_mux_1(
input [1:0] ForwardAE,
input [31:0] RD1E,ResultW,ALUResultM,
output [31:0] SrcAE
    );
    
    assign SrcAE = (ForwardAE == 2'b00) ? RD1E :
                   (ForwardAE == 2'b01) ? ResultW :
                   (ForwardAE == 2'b10) ? ALUResultM : RD1E;
    
endmodule
