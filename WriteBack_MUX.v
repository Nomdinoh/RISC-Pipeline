`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 10:55:10 PM
// Design Name: 
// Module Name: WriteBack_MUX
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


module WriteBack_MUX(
input [1:0]ResultSrc,
input [31:0] ALUResult,
input [31:0] ReadData,
input [31:0] PCPlus4,
output [31:0] Result
    );
    
    assign Result = (ResultSrc == 2'b00) ? ALUResult :
                    (ResultSrc == 2'b01) ? ReadData :
                    (ResultSrc == 2'b10) ? PCPlus4 :  ALUResult ; 
endmodule
