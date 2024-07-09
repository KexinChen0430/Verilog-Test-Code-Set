module comparator (
    q,
    a,
    b
);
  parameter integer N = 8;
  input [N-1:0] a, b;
  output q;

  // assign q = (a<b)?1'b0:1'b1;
  always @* begin
    if (a < b) begin
      q = 1'b0;
    end else begin
      q = 1'b1;
    end
  end
endmodule
