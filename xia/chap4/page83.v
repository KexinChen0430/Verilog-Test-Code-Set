`timescale1ns/100ps
module riscalu ( alu_out, zero, opcode, data, accum, clock ); 
output [7:0] alu_out;
reg[7:0] alu_out; 
output zero; 
input [2:0] opcode; 
input [7:0] data, accum; 
input clock; 
 
`define Zdly 1.2
`define ALUdly 3.5

wire #`Zdly  zero=(!accum);
//***¼´zero=1'b1  if accum==0,else zero=1'b0 
 
always @(negedge clock)
begin
case(opcode)
3'b000: #`ALUdly alu_out=accum;  //Pass Accumulator
3'b001: #`ALUdly alu_out=accum;  //Pass Accumulator 
3'b010: #`ALUdly alu_out=data+accum;  //ADD 
3'b011: #`ALUdly alu_out=data&accum;  //AND 
3'b100: #`ALUdly alu_out=data^accum;  //XOR 
3'b101: #`ALUdly alu_out=data;   //Pass Data
3'b110: #`ALUdly alu_out=accum;  //Pass Accumulator 
3'b111: #`ALUdly alu_out=accum;  //Pass Accumulator 
default: begin 
$display("Unknown OPcode"); 
#`ALUdly alu_out=8'bXXXXXXXX; 
end 
endcase 
end 
endmodule 
 