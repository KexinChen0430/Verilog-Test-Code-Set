

module  flop(data,clock,clear,q,qb);
input  data,clock,clear; 
output   q,qb; 
 
nand #10 nd1(a,data,clock,clear), 
nd2(b,ndata,clock), 
nd4(d,c,b,clear), 
nd5(e,c,nclock),
nd6(f,d,nclock), 
nd8(qb,q,f,clear); 
nand #9 nd3(c,a,d), 
nd7(q,e,qb); 
not #10 iv1(ndata,data), 
iv2(nclock,clock); 
 
endmodule 


module hardreg(d,clk,clrb,q); 
input  clk,clrb; 
input[3:0] d; 
output[3:0] q; 
 
flop f1(d[0],clk,clrb,q[0],), 
f2(d[1],clk,clrb,q[1],), 
f3(d[2],clk,clrb,q[2],), 
f4(d[3],clk,clrb,q[3],); 
 
endmodule 
 