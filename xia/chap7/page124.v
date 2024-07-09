module compare(equal,a,b);
parameter size=1; 
output equal; 
input [size-1:0] a, b;
assign  equal =(a==b)? 1 : 0;
endmodule

module decoder(out,in);
output [7:0] out; 
input [2:0] in; 
assign  out = 1'b1<<in; 
/**** 把最低位的1左移 in（根据从in口输入的值）位， 
并赋予out  ****/ 
endmodule 

module encoder1(none_on,out,in);
output none_on; 
output [2:0] out; 
input [7:0] in; 
reg [2:0] out; 
reg none_on; 
always @(in) 
begin: local 
integer  i; 
out = 0; 
none_on = 1; 
/*returns the value of the highest bit  
number turned on*/
for( i=0; i<8; i=i+1 ) 
begin 
if( in[i] ) 
begin 
out = i; 
none_on = 0; 
end 
end 
end 
 
endmodule 

module encoder2 ( none_on, out2, out1, out0, h, g, f,
e, d, c, b, a); 
input h, g, f, e, d, c, b, a; 
output none_on, out2, out1, out0; 
wire [3:0] outvec; 
 
assign outvec= h? 4'b0111 : g? 4'b0110 : f? 4'b0101: 
e? 4'b0100 : d? 4'b0011 :c? 4'b0010 : b? 4'b0001: 
a? 4'b0000 : 4'b1000; 
 
assign none_on = outvec[3]; 
assign    out2 = outvec[2]; 
assign    out1 = outvec[1]; 
assign    out0 = outvec[0]; 
 
endmodule 
 
module encoder3 (none_on, out2, out1, out0, h, g,
f, e, d, c, b, a); 
input h, g, f, e, d, c, b, a; 
output out2, out1, out0; 
output none_on; 
reg [3:0] outvec; 
 
assign {none_on,out2,out1,out0} = outvec; 
 
always @( a or b or c or d or e or f or g or h) 
begin 
if(h) outvec=4'b0111; 
else if(g) outvec=4'b0110; 
else if(f) outvec=4'b0101; 
else if(e) outvec=4'b0100; 
else if(d) outvec=4'b0011; 
else if(c) outvec=4'b0010;
else if(b) outvec=4'b0001; 
else if(a) outvec=4'b0000; 
else   outvec=4'b1000; 
end
endmodule
