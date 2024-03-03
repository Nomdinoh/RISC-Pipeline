`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2024 12:12:22 PM
// Design Name: 
// Module Name: writeback
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


module writeback(
//input RegWriteW,
input [1:0] ResultSrcW,
input [31:0] ALUResultW,ReadDataW,PCPlus4W,
output [31:0] ResultW
    );
    
   WriteBack_MUX w1(
        .ResultSrc(ResultSrcW),
        .ALUResult(ALUResultW),
        .ReadData(ReadDataW),
        .PCPlus4(PCPlus4W),
        .Result(ResultW)
       );
    
endmodule
