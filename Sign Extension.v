`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 07:20:32 PM
// Design Name: 
// Module Name: Sign_Extension
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


module Sign_Extension(
input [1:0] ImmSrc,
input [31:7] Instr,
output reg [31:0] ImmExt
    );
    
    always @(*)
    begin
        case(ImmSrc)
            2'b00: ImmExt = {{20{Instr[31]}},Instr[31:20]};    // I type
            2'b01: ImmExt = {{20{Instr[31]}},Instr[31:25],Instr[11:7]};    // S type
            2'b10: ImmExt = {{20{Instr[31]}},Instr[7],Instr[30:25],Instr[11:8],1'b0};    // B type
            2'b11: ImmExt = {{12{Instr[31]}},Instr[19:12],Instr[20],Instr[30:21],1'b0};    // J type
        
        endcase
    end
    
endmodule
