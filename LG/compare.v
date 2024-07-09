module eq(x, y ,out);
  input [1:0] x;
  input [1:0] y;
  output out;

  assign out = x == y;

endmodule