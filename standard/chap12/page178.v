// ports connected by name
module topmod;
wire [4:0] v;
wire a,b,c,w;
modB b1 (.wb(v[3]),.wa(v[0]),.d(v[4]),.c(w));
endmodule
module modB(wa, wb, c, d);
inout wa, wb;
input c, d;
tranif1 g1(wa, wb, cinvert);
not #(6, 2)n1(cinvert, int);
and #(5, 6)g2(int, c, d);
endmodule

// real numbers in port connection
module driver (net_r); 
output net_r;
real r;
wire [64:1] net_r = $realtobits(r);
endmodule
module receiver (net_r); 
input net_r; 
wire [64:1] net_r; 
real r; 
initial assign r = $bitstoreal(net_r); 
endmodule