`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 07:07:12 PM
// Design Name: 
// Module Name: Reg_File
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


module Reg_File(
    input clk,reset,
    input WE3,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD3,
    output [31:0] RD1,
    output [31:0] RD2
    );
    
    integer i;
    reg [31:0] Registers [63:0];
    
    // Read functionality
    assign RD1 = (reset)? 32'b0 : Registers[A1];
    assign RD2 = (reset)? 32'b0 : Registers[A2];
    
    // Write functionality
    always @(negedge clk, posedge reset)
    begin
        if(reset)
            begin
                for(i=0;i<64;i=i+1)
                    Registers[i] <= 32'b0;
            end
        else if(WE3) begin
            Registers[A3] <= WD3;
            Registers[0] <= 32'b0;
        end
//        else begin
//            for(i=0;i<64;i=i+1)
//                Registers[i] <= Registers[i];
//        end
    end
endmodule
