
`timescale 1ns/1ns 
module control (load_acc, mem_rd, mem_wr, inc_pc, load_pc, load_ir,  
halt, opcode, fetch, zero, clk, clk2, reset); 
output load_acc, mem_rd, mem_wr, inc_pc, load_pc, load_ir, halt; 
reg load_acc, mem_rd, mem_wr, inc_pc, load_pc, load_ir, halt; 
input [2:0] opcode; 
input fetch, zero, clk, clk2, reset; 
 
`define HLT 3'b000 
`define SKZ 3'b001 
`define ADD 3'b010 
`define AND 3'b011 
`define XOR 3'b100 
`define LDA 3'b101 
`define STO 3'b110 
`define JMP 3'b111 
 
always @(posedge fetch) 
if(reset) 
ctl_cycle; 
 
always @(negedge reset) 
begin 
disable ctl_cycle; 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0000000; 
end 
 
always @(posedge reset) 
@(posedge fetch)  ctl_cycle; 

task ctl_cycle;
begin 
//state 0！first Address Setup 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0000000; 
 
//state1！Instruction Fetch 
@(posedge clk) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0000100; 
//state2--InstructionLoad 
@(negedge clk) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0000110; 
//state3--Idle 
@(posedge clk) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0000110; 
 
//state4！Second Address Setup 
@(negedge clk) 
if(opcode==`HLT) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b1000001; 
else 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b1000000; 
//state5！Operand Fetch 
@(posedge clk) 
if((opcode==`ADD)||(opcode==`AND)||(opcode==`XOR)||(opcode==`LDA)) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0000100; 
else 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0000000; 
//state6！ALU operation 
@(negedge clk) 
if(opcode==`JMP) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0010000; 
else if((opcode==`SKZ)&&(zero)) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b1000000; 
else if ( ( opcode==`ADD) || (opcode==`AND) || (opcode==`XOR)|| (opcode ==`LDA)) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0100100; 
else 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0000000; 
//state7！Store Result 
@(posedge clk) 
if(opcode ==`JMP) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b1010000; 
else if(opcode==`STO) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0001000; 
else if((opcode==`SKZ)&&(zero)) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b1000000; 
else if ((opcode==`ADD) ||(opcode==`AND) ||(opcode==`XOR)|| (opcode==`LDA)) 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0100100; 
else 
{inc_pc,load_acc,load_pc,mem_wr,mem_rd,load_ir,halt}=7'b0000000; 
end  //task ctl_cycle 
endtask 

endmodule 
