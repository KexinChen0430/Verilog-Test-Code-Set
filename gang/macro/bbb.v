`define out result
`include  "aaa.v"
`define filename ccc.v

module  bbb(c,d,e,out);
input  c,d,e;
output `out;
wire  out_a;
wire  `out;
      aaa  aaa(.a(c),.b(d),.`out(out_a));
assign  out=e&`out_a;
endmodule

`include  "`filename"