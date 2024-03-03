`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2024 03:39:48 PM
// Design Name: 
// Module Name: Fetch
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


module Fetch(
input clk,reset,
input PCSrcE,
input StallF,StallD,FlushD,
input [31:0] PCTargetE,
output [31:0] InstrD,PCD,PCPlus4D
    );
    
    wire [31:0] PCPlus4F,PCF_bar,PCF,Instr;
    
    mux_fetch f1(
            .PCTarget(PCTargetE),.PCPlus4(PCPlus4F),.PCSrc(PCSrcE),
            .PCNext(PCF_bar)
            );
    Program_Counter f2(
            .clk(clk),.reset(reset),.EN(StallF),
            .PCNext(PCF_bar),
            .PC(PCF)
            );  
    PCPlus4 f3(
            .PC(PCF),
            .PCPlus4(PCPlus4F)
             );  
    Instruction_Memory f4(
             .reset(reset),
             .A(PCF),
             .RD(Instr)
              );
    fetch_register f5(
              .clk(clk),
              .EN(StallD),
              .CLR(FlushD),
              .RD(Instr),
              .PCF(PCF),
              .PCPlus4F(PCPlus4F),
              .InstrD(InstrD),
              .PCD(PCD),
              .PCPlus4D(PCPlus4D)
              );              
endmodule
