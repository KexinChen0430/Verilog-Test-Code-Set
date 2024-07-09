module topmod;
wire [4:0] v;
wire a,b,c,w;
modB b1 (v[0], v[3], w, v[4]);
endmodule
module modB (wa, wb, c, d);
inout wa, wb;
input c, d;
tranif1 g1 (wa, wb, cinvert);
not #(2, 6)n1 (cinvert, int);
and #(6, 5)g2 (int, c, d);
endmodule