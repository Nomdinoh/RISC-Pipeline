`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 09:37:18 PM
// Design Name: 
// Module Name: Main_Decoder
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


module Main_Decoder(
input [6:0] opCode,
output branch,
output jump,
output reg [1:0] ResultSrc,
output reg MemWrite,
output reg ALUSrc,
output reg [1:0] ImmSrc,
output reg RegWrite,
output reg [1:0] ALUOp
    );
    //wire branch,jump;
    
    assign branch = (opCode==7'b1100011)? 1'b1: 1'b0;   // 1100011 => BEQ
    assign jump = (opCode==7'b1101111)? 1'b1: 1'b0;     // 1101111 => JAL
    
   // assign PCSrc = (branch&zero) | jump;
    
    always @(*)
    begin
        case(opCode)
            7'b0000011:begin   // 0000011 => load word
                RegWrite <= 1'b1; ImmSrc <= 2'b00; ALUSrc <= 1'b1; MemWrite <= 1'b0; ResultSrc <= 2'b01; ALUOp <= 2'b00; 
            end
            7'b0100011:begin   // 0100011 => store word
                 RegWrite <= 1'b0; ImmSrc <= 2'b01; ALUSrc <= 1'b1; MemWrite <= 1'b1; ResultSrc <= 2'bxx; ALUOp <= 2'b00; 
            end
            7'b0110011:begin   // 0110011 => R Type
                 RegWrite <= 1'b1; ImmSrc <= 2'bxx; ALUSrc <= 1'b0; MemWrite <= 1'b0; ResultSrc <= 2'b00; ALUOp <= 2'b10; 
            end  
            7'b1100011:begin   // 1100011 => beq
                 RegWrite <= 1'b0; ImmSrc <= 2'b10; ALUSrc <= 1'b0; MemWrite <= 1'b0; ResultSrc <= 2'bxx; ALUOp <= 2'b01; 
            end  
            7'b0010011:begin   // 0010011 => I-type ALU
                 RegWrite <= 1'b1; ImmSrc <= 2'b00; ALUSrc <= 1'b1; MemWrite <= 1'b0; ResultSrc <= 2'b00; ALUOp <= 2'b10; 
            end  
            7'b1101111:begin   // 0010011 => JAL
                 RegWrite <= 1'b1; ImmSrc <= 2'b11; ALUSrc <= 1'bx; MemWrite <= 1'b0; ResultSrc <= 2'b10; ALUOp <= 2'bxx; 
            end      
            default:begin
                RegWrite <= 1'bx; ImmSrc <= 2'bxx; ALUSrc <= 1'bx; MemWrite <= 1'bx; ResultSrc <= 2'bxx; ALUOp <= 2'bxx; 
            end                        
        endcase
    end
    
endmodule
