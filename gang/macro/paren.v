/// macro with non-argument parenthesis

`define outa  out.(out_a)

`define filename ccc.v

module  bbb(c,d,e,out);
input  c,d,e;
output out;
wire  out_a;
wire  `out;
      aaa  aaa(.a(c),.b(d),. `outa);
assign  out=e & out_a;
endmodule

`include  "`filename"