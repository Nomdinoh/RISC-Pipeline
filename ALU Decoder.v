`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2024 10:12:41 PM
// Design Name: 
// Module Name: ALU_Decoder
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


module ALU_Decoder(
input [1:0] ALUOp,
input [2:0] func3,
input func7_b_5,
input opCode_b_5,
output reg [2:0] ALUControl
    );
    
    wire [1:0] OP5_func7_b_5;
    
    assign OP5_func7_b_5 = {opCode_b_5,func7_b_5};
    
    always @(*)
    begin
        case(ALUOp)
            2'b00: ALUControl <= 3'b000;        // LW, SW  000=> add
            2'b01: ALUControl <= 3'b001;       // beq     001=> subtract
            2'b10: begin
                if(func3==3'b000) begin
                    if(OP5_func7_b_5==2'b00 | OP5_func7_b_5==1'b01 | OP5_func7_b_5==2'b10)
                        ALUControl <= 3'b000;  // add
                    else
                        ALUControl <= 3'b001;  // sub
                end
                else if(func3==3'b010) begin
                    ALUControl <= 3'b101;  // set less than (slt)
                end
                else if(func3==3'b110) begin
                    ALUControl <= 3'b011;  // or
                end
                else if(func3==3'b111) begin
                    ALUControl <= 3'b010;  // and
                end                
            end
            default:begin
                ALUControl <= 3'bxxx;
            end
        endcase
    end
    
endmodule
