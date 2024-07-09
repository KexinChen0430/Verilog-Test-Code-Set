module logic_and(x, out);
  input [1:0] x;
  output [1:0] out;

  assign out = ~x;

endmodule