module flip;
reg clock, data;
parameter p1 = 10;
parameter p2 = 33;
parameter p3 = 12;
d_edge_ff #p3 d_inst (q, clock, data);
initial begin
data = 1;
clock = 1;
#(20 * p1) $finish;
end
always #p1 clock = ~clock;
always #p2 data = ~data;
endmodule

primitive jk_edge_ff (q, clock, j, k, preset, clear);
output q; reg q;
input clock, j, k, preset, clear;
table
// clockjkpcstate output/next state
 ? ?? 01: ? : 1 ; // preset logic
 ? ?? *1: 1 : 1 ;
 ? ?? 10: ? : 0 ; // clear logic
 ? ?? 1*: 0 : 0 ;
 r 00 00: 0 : 1 ; // normal clockingcases
 r 00 11: ? : - ;
 r 01 11: ? : 0 ;
 r 10 11: ? : 1 ;
 r 11 11: 0 : 1 ;
 r 11 11: 1 : 0 ;
 f ?? ??: ? : - ;
 b *? ??: ? : - ; // j and k transition cases
 b ?* ??: ? : - ;
endtable
endprimitive