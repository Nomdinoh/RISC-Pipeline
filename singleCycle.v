`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 11:01:40 PM
// Design Name: 
// Module Name: datapath
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


module datapath(
input clk,reset,
input StallF,StallD,FlushD,FlushE,
input [1:0] ForwardA_E,ForwardB_E
    );
    
//    wire [31:0] PCTargetE,PCPlus4F,PCNextF,PCF,InstrD,ResultW,ImmExtD,ALUResultE,ReadData;
//    wire PCSrcE,RegWriteE;
    
//    wire [31:0] RD1_E,RD2_E,SrcB_E;
//    wire zeroE,MemWriteE,ALUSrcE;
//    wire [1:0] ResultSrcE,ImmSrcE;
    
//    wire [2:0] ALUControlE;
    
    wire PcSrc_E,RegWrite_W;
    wire [31:0] PCTarget_E,Result_W;
    // ------------fetch----------------
    wire [31:0] Instr_D,PC_D,PCPlus4_F;
    
    //------------Decode---------------
    wire RegWrite_E,MemWrite_E,Jump_E,Branch_E,ALUSrc_E;
    wire [1:0] ResultSrc_E;
    wire [2:0] ALUControl_E;
    wire [31:0] RD1_E,RD2_E,PC_E,ImmExt_E,PCPlus4_E;
    
    //-----------Execute---------------
    wire RegWrite_M,MemWrite_M;
    wire [1:0] ResultSrc_M;
    wire [31:0] ALUResult_M,WriteData_M,PCPlus4_M;
    
    //-----------Memory----------------
    wire [1:0] ResultSrc_W;
    wire [31:0] ALUResult_W,ReadData_W,PCPlus4_W;
    
    Fetch f1(
        .clk(clk),.reset(reset),
        .PCSrcE(PcSrc_E),
        .StallF(StallF),.StallD(StallD),.FlushD(FlushD),
        .PCTargetE(PCTarget_E),
        .InstrD(Instr_D),.PCD(PC_D),.PCPlus4D(PCPlus4_F)
        );
        
    Decode d1(
        .clk(clk),.reset(reset),
        .InstrD(Instr_D),.PCD(PC_D),.PCPlus4D(PCPlus4_F),
        .FlushE(FlushE),
        .RegWriteW(RegWrite_W),
        .ResultW(Result_W),
        .RegWriteE(RegWrite_E),.MemWriteE(MemWrite_E),.jumpE(Jump_E),.branchE(Branch_E),.ALUSrcE(ALUSrc_E),
        .ResultSrcE(ResultSrc_E),
        .ALUControlE(ALUControl_E),
        .RD1_E(RD1_E),.RD2_E(RD2_E),.PCE(PC_E),.ImmExtE(ImmExt_E),.PCPlus4E(PCPlus4_E)
            ); 
   
   execute e1(
        .clk(clk),.reset(reset),
        .ForwardAE(ForwardA_E),.ForwardBE(ForwardB_E),
        .RegWriteE(RegWrite_E),.MemWriteE(MemWrite_E),.jumpE(Jump_E),.branchE(Branch_E),.ALUSrcE(ALUSrc_E),
        .ResultSrcE(ResultSrc_E),
        .ALUControlE(ALUControl_E),
        .RD1_E(RD1_E),.RD2_E(RD2_E),.PCE(PC_E),.ImmExtE(ImmExt_E),.PCPlus4E(PCPlus4_E),
        .ResultW(Result_W),
        .PcSrcE(PcSrc_E),
        .RegWriteM(RegWrite_M),.MemWriteM(MemWrite_M),
        .ResultSrcM(ResultSrc_M),
        .ALUResultM(ALUResult_M),.WriteDataM(WriteData_M),.PCPlus4M(PCPlus4_M),.PCTargetE(PCTarget_E)
                );  
     
   memory m1(
        .clk(clk),.reset(reset),
        .RegWriteM(RegWrite_M),.MemWriteM(MemWrite_M),
        .ResultSrcM(ResultSrc_M),
        .ALUResultM(ALUResult_M),.WriteDataM(WriteData_M),.PCPlus4M(PCPlus4_M),
        .RegWriteW(RegWrite_W),
        .ResultSrcW(ResultSrc_W),
        .ALUResultW(ALUResult_W),.ReadDataW(ReadData_W),.PCPlus4W(PCPlus4_W)
               );  
   
   writeback w1(
               //input RegWriteW,
        .ResultSrcW(ResultSrc_W),
        .ALUResultW(ALUResult_W),.ReadDataW(ReadData_W),.PCPlus4W(PCPlus4_W),
        .ResultW(Result_W)
              );
                              
//    mux_fetch f1(
//        .PCTarget(PCTargetE),.PCPlus4(PCPlus4F),.PCSrc(PCSrcE),
//        .PCNext(PCNextF)
//        );
//    Program_Counter f2(
//        .clk(clk),.reset(reset),
//        .PCNext(PCNextF),
//        .PC(PCF)
//            );  
//    PCPlus4 f3(
//        .PC(PCF),
//        .PCPlus4(PCPlus4F)
//            );  
//    Instruction_Memory f4(
//         .reset(reset),
//         .A(PCF),
//         .RD(InstrD)
//            );
//    Reg_File d1(
//         .clk(clk),.reset(reset),
//         .WE3(RegWriteE),
//         .A1(InstrD[19:15]),.A2(InstrD[24:20]),.A3(InstrD[11:7]),
//         .WD3(ResultW),
//         .RD1(RD1_E),.RD2(RD2_E)
//           ); 
//    Control_Unit d2(
//         .zero(zeroE),
//         .Instr(InstrD),
//         .PCSrc(PCSrcE),
//         .ResultSrc(ResultSrcE),
//         .MemWrite(MemWriteE),
//         .ALUSrc(ALUSrcE),
//         .ImmSrc(ImmSrcE),
//         .RegWrtie(RegWriteE),
////         .ALUOp(),
//         .ALUControl(ALUControlE)
//           );   
//    Sign_Extension d3(
//         .ImmSrc(ImmSrcE),
//         .Instr(InstrD[31:7]),
//         .ImmExt(ImmExtD)
//          );  
//    execute_mux e1(
//          .RD2(RD2_E),
//          .ImmExt(ImmExtD),
//          .ALUSrc(ALUSrcE),
//          .SrcB(SrcB_E)
//              ); 
//    PCTarget e2(
//          .PC(PCF),
//          .ImmExt(ImmExtD),
//          .PCTarget(PCTargetE)  
//              );
//    ALU e3(
//          .SrcAE(RD1_E), .SrcBE(SrcB_E),
//          .ALUControlE(ALUControlE),
//          .ALUResult(ALUResultE),
//          .zero(zeroE)
//           ); 
//    Data_Memory M1(
//          .clk(clk),.reset(reset),
//          .WE(MemWriteE),
//          .A(ALUResultE),.WD(RD2_E),
//          .RD(ReadData)
//           );  
//    WriteBack_MUX w1(
//          .ResultSrc(ResultSrcE),
//          .ALUResult(ALUResultE),
//          .ReadData(ReadData),.PCPlus4(PCPlus4F),
//          .Result(ResultW)
//               );                                                                                       
endmodule
