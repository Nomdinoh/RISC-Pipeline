`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2024 04:04:47 PM
// Design Name: 
// Module Name: Decode
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


module Decode(
input clk,reset,
input [31:0] InstrD,PCD,PCPlus4D,
input FlushE,
input RegWriteW,
input [31:0] ResultW,
output RegWriteE,MemWriteE,jumpE,branchE,ALUSrcE,
output [1:0] ResultSrcE,
output [2:0] ALUControlE,
output [31:0] RD1_E,RD2_E,PCE,ImmExtE,PCPlus4E
    );

    wire [31:0] RD1,RD2;
    wire branchD,jumpD,MemWriteD,ALUSrcD,RegWriteD;
    wire [1:0] ResultSrcD,ImmSrcD;
    wire [2:0] ALUControlD;
    wire [31:0] ImmExtD;
    
    Reg_File d1(
         .clk(clk),.reset(reset),
         .WE3(RegWriteW),
         .A1(InstrD[19:15]),.A2(InstrD[24:20]),.A3(InstrD[11:7]),
         .WD3(ResultW),
         .RD1(RD1),.RD2(RD2)
           ); 
    Control_Unit d2(
         //.zero(),
         .Instr(InstrD),
         //.PCSrc(),
         .branch(branchD),
         .jump(jumpD),
         .ResultSrc(ResultSrcD),
         .MemWrite(MemWriteD),
         .ALUSrc(ALUSrcD),
         .ImmSrc(ImmSrcD),
         .RegWrtie(RegWriteD),
//         .ALUOp(),
         .ALUControl(ALUControlD)
           );   
    Sign_Extension d3(
         .ImmSrc(ImmSrcD),
         .Instr(InstrD[31:7]),
         .ImmExt(ImmExtD)
          );    
Decode_register d4(
          .clk(clk),
          .CLR_E(FlushE),
          .RegWriteD(RegWriteD),.MemWriteD(MemWriteD),.jumpD(jumpD),.branchD(branchD),.ALUSrcD(ALUSrcD),
          .ResultSrcD(ResultSrcD),
          .ALUControlD(ALUControlD),
          .RD1(RD1),.RD2(RD2),.PCD(PCD),.ImmExtD(ImmExtD),.PCPlus4D(PCPlus4D),
          .RegWriteE(RegWriteE),.MemWriteE(MemWriteE),.jumpE(jumpE),.branchE(branchE),.ALUSrcE(ALUSrcE),
          .ResultSrcE(ResultSrcE),
          .ALUControlE(ALUControlE),
          .RD1_E(RD1_E),.RD2_E(RD2_E),.PCE(PCE),.ImmExtE(ImmExtE),.PCPlus4E(PCPlus4E)
              );           
endmodule
