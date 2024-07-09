
module datactrl(data,alu_out,fetch,mem_rd,clk2); 
output [7:0] data; 
input [7:0] alu_out; 
input fetch, mem_rd, clk2; 
 
assign data=(( !fetch & !mem_rd & !clk2 )? alu_out : 8'bz); 
 
endmodule 


`timescale 1ns/1ns 
module mem(data,addr,read,write); 
inout [7:0] data; 
input [4:0] addr; 
input  read, write; 
reg [7:0] memory[0:'h1F]; 
wire[7:0] data =( read?  memory[addr] : 8'bZZZZZZZZ ); 
 
always @(posedge write) 
begin 
memory[addr]=data; 
end 
endmodule