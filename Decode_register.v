`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2024 10:08:16 AM
// Design Name: 
// Module Name: Decode_register
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


module Decode_register(
input clk,
input CLR_E,
input RegWriteD,MemWriteD,jumpD,branchD,ALUSrcD,
input [1:0] ResultSrcD,
input [2:0] ALUControlD,
input [31:0] RD1,RD2,PCD,ImmExtD,PCPlus4D,
output reg RegWriteE,MemWriteE,jumpE,branchE,ALUSrcE,
output reg [1:0] ResultSrcE,
output reg [2:0] ALUControlE,
output reg [31:0] RD1_E,RD2_E,PCE,ImmExtE,PCPlus4E
    );
    
    always @(posedge clk)
    begin
        if(CLR_E)
        begin
            RegWriteE <= 1'b0;
            MemWriteE <= 1'b0;
            jumpE <= 1'b0;
            branchE <= 1'b0;
            ALUSrcE <= 1'b0;
            ResultSrcE <= 2'b0;
            ALUControlE <= 3'b0;
            
            RD1_E <= 32'b0;
            RD2_E <= 32'b0;
            PCE <= 32'b0;
            ImmExtE <= 32'b0;
            PCPlus4E <= 32'b0;
        end
        else begin
            RegWriteE <= RegWriteD;
            MemWriteE <= MemWriteD;
            jumpE <= jumpD;
            branchE <= branchD;
            ALUSrcE <= ALUSrcD;
            ResultSrcE <= ResultSrcD;
            ALUControlE <= ALUControlD;
                    
            RD1_E <= RD1;
            RD2_E <= RD2;
            PCE <= PCD;
            ImmExtE <= ImmExtD;
            PCPlus4E <= PCPlus4D;
        end
    end
    
endmodule
