`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 10:58:45 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] SrcAE, SrcBE,
    input [2:0] ALUControlE,
    output [31:0] ALUResult,
    output zero
    );
    
    wire [31:0] A_and_B, A_or_B, not_B,mux_1,sum;
    
    assign A_and_B = SrcAE & SrcBE;
    assign A_or_B = SrcAE | SrcBE;
    assign not_B = ~SrcBE;
    assign mux_1 = ( ALUControlE[0] ? not_B : SrcBE );
    assign sum = mux_1 + SrcAE + ALUControlE[0];
    assign ALUResult = ( ALUControlE[1:0]==2'b00) ? sum:
                        (ALUControlE[1:0]==2'b01) ? sum:
                        (ALUControlE[1:0]==2'b10) ? A_and_B:
                                                   A_or_B;
    assign zero = &(~ALUResult);                                           
endmodule

