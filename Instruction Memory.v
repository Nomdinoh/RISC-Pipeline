`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 06:51:42 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
input reset,
input [31:0] A,
output [31:0] RD
    );
    
    reg [31:0] Mem [1023:0];
    
//    assign RD = (reset)? 32'b0 : Mem[A[31:2]];
      assign RD = (reset)? 32'b0 : Mem[A>>2];    
      
    initial begin
        Mem[0] = 32'h00A00093;
        Mem[1] = 32'h03200113;
        Mem[2] = 32'h01400193;
        Mem[3] = 32'h00F00213;
        Mem[4] = 32'h01E00293;
        Mem[5] = 32'h00208333;
        Mem[6] = 32'h401103B3;
    end
    
endmodule
