`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 06:33:59 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter (
input clk,reset,EN,
input [32-1:0] PCNext,
output reg [32-1:0] PC
    );
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            PC <= 32'b0;
        else if(EN)
            PC <= PC;
        else begin
            PC <= PCNext;
        end    
    end
    
endmodule
