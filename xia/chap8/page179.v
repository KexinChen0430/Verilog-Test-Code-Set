//------------------------------------------------------------------------------
module  adr(addr,fetch,ir_addr,pc_addr); 
output [12:0] addr; 
input [12:0] ir_addr, pc_addr; 
input  fetch; 
 
assign  addr = fetch?  pc_addr : ir_addr; 

endmodule 
//------------------------------------------------------------------------------ 

//------------------------------------------------------------------------------
module counter ( pc_addr, ir_addr, load, clock, rst);
output [12:0] pc_addr; 
input [12:0] ir_addr; 
input load, clock, rst; 
reg [12:0] pc_addr; 
 
always @( posedge clock or posedge rst ) 
begin 
if(rst) 
pc_addr<=13'b0_0000_0000_0000; 
else 
if(load) 
pc_addr<=ir_addr; 
else 
pc_addr <= pc_addr + 1; 
end
endmodule 
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
module machinectl( ena, fetch, rst); 
output  ena; 
input  fetch, rst; 
reg ena; 
 
always @(posedge fetch or posedge rst) 
begin 
if(rst) 
ena<=0; 
else 
ena<=1; 
end 
 
endmodule 
//------------------------------------------------------------------------------ 
 