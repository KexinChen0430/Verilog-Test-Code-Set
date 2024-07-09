module addr_decode( addr, rom_sel, ram_sel);
output rom_sel, ram_sel; 
input [12:0] addr; 
reg rom_sel, ram_sel; 
 
always @( addr ) 
begin 
casex(addr) 
13'b1_1xxx_xxxx_xxxx:{rom_sel,ram_sel}<=2'b01; 
13'b0_xxxx_xxxx_xxxx:{rom_sel,ram_sel}<=2'b10; 
13'b1_0xxx_xxxx_xxxx:{rom_sel,ram_sel}<=2'b10; 
default:{rom_sel,ram_sel}<=2'b00; 
endcase 
end 
endmodule 

module ram( data, addr, ena, read, write );
inout [7:0] data; 
input [9:0] addr; 
input ena; 
input read, write; 
reg [7:0] ram [10'h3ff:0]; 
 
assign data = ( read && ena )?  ram[addr] : 8'hzz; 
 
always @(posedge write) 
begin 
ram[addr]<=data; 
end 
endmodule 
 

module rom( data, addr, read, ena ); 
output [7:0] data; 
input [12:0] addr; 
input read, ena; 
reg [7:0] memory [13'h1fff:0]; 
wire [7:0] data; 

assign data= ( read && ena )? memory[addr] : 8'bzzzzzzzz; 
 
endmodule 
 

