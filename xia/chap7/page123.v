`define plus   3'd0
`define minus    3'd1 
`define band   3'd2 
`define bor   3'd3 
`define unegate 3'd4 
 
module alu(out,opcode,a,b); 
output [7:0] out; 
input [2:0] opcode; 
input [7:0] a,b; 
reg   [7:0] out; 
 
always @(opcode or a or b) 
//用电平敏感的always块描述组合逻辑 
begin 
case(opcode) 
//算术运算 
`plus: out=a+b; 
`minus: out=a-b; 
//位运算 
`band: out=a&b; 
`bor:  out=a|b; 
//单目运算 
`unegate: out=~a; 
default:out=8'hx; 
endcase 
end 
endmodule 
 
 module sort4(ra,rb,rc,rd,a,b,c,d);
parameter t=3; 
output [t:0] ra, rb, rc, rd; 
input [t:0] a, b, c, d; 
reg [t:0] ra, rb, rc, rd; 
 
always @(a or b or c or d) 
//用电平敏感的always块描述组合逻辑 
begin  
reg [t:0] va, vb, vc, vd; 
{va,vb,vc,vd}={a,b,c,d}; 
sort2(va,vc);
sort2(vb,vd); 
sort2(va,vb);  
sort2(vc,vd); 
sort2(vb,vc); 
{ra,rb,rc,rd}={va,vb,vc,vd}; 
end 
 
task  sort2; 
inout [t:0] x, y; 
reg [t:0] tmp; 
if( x > y ) 
begin 
tmp = x; 
x = y; 
y = tmp; 
end 
endtask 
 
endmodule 
 
