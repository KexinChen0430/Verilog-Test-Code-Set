module muxWithAssign
  #(parameter WIDTH=4)
  (output  [WIDTH-1:0]  out,
   input [WIDTH-1:0]A, B,
   input sel);

   assign out = (sel) ? A: B;
endmodule