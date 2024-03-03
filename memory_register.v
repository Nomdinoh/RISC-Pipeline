`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2024 03:07:22 PM
// Design Name: 
// Module Name: memory_register
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


module memory_register(
input clk,
input RegWriteM,
input [1:0] ResultSrcM,
input [31:0] ALUResultM,ReadDataM,PCPlus4M,
output reg RegWriteW,
output reg [1:0] ResultSrcW,
output reg [31:0] ALUResultW,ReadDataW,PCPlus4W
    );
    
    always @ (posedge clk)
    begin
        RegWriteW <= RegWriteM;
        ResultSrcW <= ResultSrcM;
        ALUResultW <= ALUResultM;
        ReadDataW <= ReadDataM;
        PCPlus4W <= PCPlus4M;
    end
    
endmodule
