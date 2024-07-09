// page 89

module addrmux(addr, pc_addr, ir_addr, fetch); 
output [4:0] addr; 
input [4:0] pc_addr, ir_addr; 
input fetch; 
assign  addr = ( fetch?  pc_addr : ir_addr ); 
endmodule 

`timescale1ns/1ns
module clkgen(fetch,clk2,clk,alu_clk); 
output fetch,clk2,clk,alu_clk; 
reg fetch,clk2,clk; 
`define period 80 
assign  alu_clk = ( fetch | clk2 | clk ); 
initial 
fork 
clk=0; 
clk2=1; 
fetch=1; 
forever #(`period/2)  clk = ~clk; 
forever #(`period)    clk2 = ~clk2; 
forever #(`period*2)  fetch = ~fetch; 
join 
endmodule 


`timescale 1ns/100ps 
module risc_top; 
wire reset, load_acc, load_ir, load_pc, halt, zero; 
wire clock, clk2, alu_clock, fetch, inc_pc; 
wire [7:0] alu_out, accum, data, opcode_iraddr; 
wire [4:0] addr, ir_addr, pc_addr; 
wire [2:0] opcode; 
 
assign {opcode,ir_addr} = opcode_iraddr; 
 
register accumulator( .r(accum), .clk(clock), .data(alu_out),  
.ena(load_acc),.rst(reset)); 
 
riscalu  risc_alu( .alu_out(alu_out), .zero(zero), 
.opcode(opcode),.data(data),.accum(accum),.clock(clock) ); 


datactrl data_control( .data(data),.alu_out(alu_out), 
.fetch(fetch),.mem_rd(mem_rd),.clk2(clk2) ); 
 
mem ram_mem(.data(data),.addr(addr),.read(mem_rd),.write(mem_wr)); 
 
register instr_register( .r(opcode_iraddr),.clk(clock), 
.data(data),.ena(load_ir),.rst(reset) ); 
 
control state_controler( .load_acc(load_acc),.mem_rd(mem_rd),.mem_wr(mem_wr),  
.inc_pc(inc_pc), .load_pc(load_pc),.load_ir(load_ir), 
.halt(halt), .opcode(opcode),.fetch(fetch),  
.zero(zero), .clk(clock), .clk2(clk2),.reset(reset) ); 
 
counter program_counter( .cnt(pc_addr),.clk(inc_pc),.data(ir_addr), 
.rst(reset),.load(load_pc) ); 
 
addrmux addr_mux( .addr(addr), .pc_addr(pc_addr),.ir_addr(ir_addr),.fetch(fetch) ); 
 
clkgen clock_risc( .fetch(fetch),.clk2(clk2),.clk(clock),.alu_clk(alu_clock) ); 
 
endmodule  