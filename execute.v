`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2024 11:20:09 AM
// Design Name: 
// Module Name: execute
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


module execute(
input clk,reset,
input [1:0] ForwardAE,ForwardBE,
input RegWriteE,MemWriteE,jumpE,branchE,ALUSrcE,
input [1:0] ResultSrcE,
input [2:0] ALUControlE,
input [31:0] RD1_E,RD2_E,PCE,ImmExtE,PCPlus4E,
input [31:0] ResultW,
output PcSrcE,
output RegWriteM,MemWriteM,
output [1:0] ResultSrcM,
output [31:0] ALUResultM,WriteDataM,PCPlus4M,PCTargetE
    );
    
    wire zeroE;
    
    assign PcSrcE = (zeroE & branchE) | jumpE ;
    
    wire [31:0] SrcAE,WriteDataE,SrcBE,ALUResultE; 
    
    
    execute_mux_1 e1(
        .ForwardAE(ForwardAE),
        .RD1E(RD1_E),.ResultW(ResultW),.ALUResultM(ALUResultM),
        .SrcAE(SrcAE)
        );
        
    execute_mux_2 e2(
        .ForwardBE(ForwardBE),
        .RD2E(RD2_E),.ResultW(ResultW),.ALUResultM(ALUResultM),
        .WriteDataE(WriteDataE)
            );      
            
        execute_mux e3(
              .WriteData(WriteDataE),
              .ImmExt(ImmExtE),
              .ALUSrc(ALUSrcE),
              .SrcB(SrcBE)
                  );
                   
        PCTarget e4(
              .PC(PCE),
              .ImmExt(ImmExtE),
              .PCTarget(PCTargetE)  
                  );
        ALU e5(
              .SrcAE(SrcAE), .SrcBE(SrcBE),
              .ALUControlE(ALUControlE),
              .ALUResult(ALUResultE),
              .zero(zeroE)
               ); 
        execute_register e6(
               .clk(clk),
               .RegWriteE(RegWriteE),.MemWriteE(MemWriteE),
               .ResultSrcE(ResultSrcE),
               .ALUResultE(ALUResultE),.WriteDataE(WriteDataE),.PCPlus4E(PCPlus4E),
               .RegWriteM(RegWriteM),.MemWriteM(MemWriteM),
               .ResultSrcM(ResultSrcM),
               .ALUResultM(ALUResultM),.WriteDataM(WriteDataM),.PCPlus4M(PCPlus4M)
                   );
endmodule
