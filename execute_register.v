`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2024 02:57:13 PM
// Design Name: 
// Module Name: execute_register
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


module execute_register(
input clk,
input RegWriteE,MemWriteE,
input [1:0] ResultSrcE,
input [31:0] ALUResultE,WriteDataE,PCPlus4E,
output reg RegWriteM,MemWriteM,
output reg [1:0] ResultSrcM,
output reg [31:0] ALUResultM,WriteDataM,PCPlus4M
    );
    
    always @ (posedge clk)
    begin
        RegWriteM <= RegWriteE;
        MemWriteM <= MemWriteE;
        ResultSrcM <= ResultSrcE;
        ALUResultM <= ALUResultE;
        WriteDataM <= WriteDataE;
        PCPlus4M <= PCPlus4E;
    end
    
endmodule
