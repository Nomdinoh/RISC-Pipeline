`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2024 11:28:35 AM
// Design Name: 
// Module Name: execute_mux_2
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


module execute_mux_2(
input [1:0] ForwardBE,
input [31:0] RD2E,ResultW,ALUResultM,
output [31:0] WriteDataE
    );
    
    assign WriteDataE = (ForwardBE == 2'b00) ? RD2E :
                        (ForwardBE == 2'b01) ? ResultW :
                        (ForwardBE == 2'b10) ? ALUResultM : RD2E;
  
endmodule
