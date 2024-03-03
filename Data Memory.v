`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 10:47:54 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
input clk,reset,
input WE,
input [31:0] A,
input [31:0] WD,
output [31:0] RD
    );
    integer i;
    
    reg [31:0] Mem [63:0];
    
    assign RD = reset? 32'b0 : Mem[A[31:2]]; 
    
    always @(posedge clk, posedge reset)
         begin
         if(reset) 
         begin
            for(i=0;i<1023;i=i+1)
                Mem[i] <= 32'b0;
         end
         else
         begin       
            if(WE)
                Mem[A[31:2]] <= WD;
            end
        end
endmodule
