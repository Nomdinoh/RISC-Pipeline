`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2024 12:01:21 PM
// Design Name: 
// Module Name: memory
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


module memory(
input clk,reset,
input RegWriteM,MemWriteM,
input [1:0] ResultSrcM,
input [31:0] ALUResultM,WriteDataM,PCPlus4M,
output RegWriteW,
output [1:0] ResultSrcW,
output [31:0] ALUResultW,ReadDataW,PCPlus4W
    );
    
    wire [31:0] ReadData;
    
        Data_Memory M1(
              .clk(clk),.reset(reset),
              .WE(MemWriteM),
              .A(ALUResultM),.WD(WriteDataM),
              .RD(ReadData)
               );
    
    memory_register m2(
               .clk(clk),
               .RegWriteM(RegWriteM),
               .ResultSrcM(ResultSrcM),
               .ALUResultM(ALUResultM),.ReadDataM(ReadData),.PCPlus4M(PCPlus4M),
               .RegWriteW(RegWriteW),
               .ResultSrcW(ResultSrcW),
               .ALUResultW(ALUResultW),.ReadDataW(ReadDataW),.PCPlus4W(PCPlus4W)
                   );
    
endmodule
