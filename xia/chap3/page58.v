// [Àý2]£º
module  test;
  reg  a, b, c, d, e, out;
  `define  expression  a+b+c+d;
assign out = `expression + e;

endmodule

// [Àý3]£º
module test;
reg  a, b, c;
wire out;
`define aa a + b
`define cc c + `aa
assign out = `cc;
endmodule


// [Àý4]: 
module
 `define typ_nand nand #5  //define a nand with typical delay
     `typ_nand g121(q21,n10,n11);
endmodule
