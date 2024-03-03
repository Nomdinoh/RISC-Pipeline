`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 06:27:46 PM
// Design Name: 
// Module Name: mux_fetch
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


module mux_fetch (
input [32-1:0] PCTarget,
input [32-1:0] PCPlus4,
input PCSrc,
output [32-1:0] PCNext
    );
    
    assign PCNext = (PCSrc)? PCTarget : PCPlus4;
    
endmodule
