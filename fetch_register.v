`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2024 09:51:50 AM
// Design Name: 
// Module Name: fetch_register
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


module fetch_register(
input clk,
input EN,
input CLR,
input [31:0] RD,
input [31:0] PCF,
input [31:0] PCPlus4F,
output reg [31:0] InstrD,
output reg [31:0] PCD,
output reg [31:0] PCPlus4D
    );
    
    always @(posedge clk)
    begin
        if(CLR)
        begin
           InstrD <= 32'b0;
           PCD <= 32'b0;
           PCPlus4D = 32'b0;    
        end
        else if(EN)
        begin
            InstrD <= InstrD;
            PCD <= PCD;
            PCPlus4D <= PCPlus4D;
        end
        else begin
            InstrD <= RD;
            PCD <= PCF;
            PCPlus4D <= PCPlus4F;
        end
    end
    
endmodule
