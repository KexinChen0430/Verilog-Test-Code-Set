module logic_or(x, y ,out);
  input [1:0] x;
  input [1:0] y;
  output [1:0] out;

  assign out = x & y;

endmodule