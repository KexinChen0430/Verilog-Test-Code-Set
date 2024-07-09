module trist1( out, in, enable);
output out; 
input in, enable; 
assign  out = enable? in: 'bz; 
endmodule 

module trist2( out, in, enable );
output out; 
input in, enable; 
//bufif1是 一个 Verilog门级原语（primitive） 
bufif1 mybuf1(out, in, enable); 
endmodule 

module bidir(tri_inout, out, in, en, b);
inout tri_inout; 
output out; 
input in, en, b; 
assign tri_inout = en? In : 'bz; 
assign out = tri_inout ^ b; 
endmodule 