// original code : modul emux1(out, a, b, sel);

module mux1(out, a, b, sel);
output out;
input a, b, sel; 
assign out = sel? A : b; 
endmodule 

module  mux2( out, a, b, sel);
output out;
input a, b, sel;
reg out;
//用电平触发的always块来设计多路器的组合逻辑
always @( a or b or sel )
begin
/*检查输入信号sel的值，如为1，输出out为a,如为0，
输出out为b.*/
case( sel )
     1'b1: out = a;
     1'b0: out = b;
  default: out = 'bx;
endcase
end
endmodule

module mux3( out, a, b, sel);
output out; 
input a, b, sel; 
reg out; 
always @( a or b or sel ) 
begin 
if( sel )
out = a; 
else 
out = b; 
end 
endmodule 

module parity( even_numbits,odd_numbits,input_bus);
output even_numbits, odd_numbits; 
input [7:0] input_bus; 
assign odd_numbits = ^input_bus; 
assign even_numbits = ~odd_numbits; 
endmodule 


