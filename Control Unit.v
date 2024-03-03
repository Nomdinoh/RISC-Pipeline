`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 10:30:30 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
//input zero,
input [31:0] Instr,
//output PCSrc,
output branch,jump,
output [1:0] ResultSrc,
output MemWrite,
output ALUSrc,
output [1:0] ImmSrc,
output RegWrtie,
//output [1:0] ALUOp,
output [2:0] ALUControl
    );
    
   // wire branch,jump;
    wire [1:0] ALUOp;
        
   Main_Decoder C1(
            .opCode(Instr[6:0]),
            .branch(branch),
            .jump(jump),
            .ResultSrc(ResultSrc),
            .MemWrite(MemWrite),
            .ALUSrc(ALUSrc),
            .ImmSrc(ImmSrc),
            .RegWrite(RegWrtie),
            .ALUOp(ALUOp)
          );
        ALU_Decoder C2(
            .ALUOp(ALUOp),
            .func3(Instr[14:12]),
            .func7_b_5(Instr[30]),
            .opCode_b_5(Instr[5]),
            .ALUControl(ALUControl)
           );
    //assign PCSrc = (branch&zero) | jump;

endmodule
