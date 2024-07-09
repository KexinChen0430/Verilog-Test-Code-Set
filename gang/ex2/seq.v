// -------------   seq.v ---------------

module seq(clk,x,y,z,b,c);
  output [3:0] b,c;
  input  [3:0] x;
  input  [2:0] y1,y2;
  input  z,w;

  input        clk;
  reg    [3:0] b,c;
  always @(posedge clk)
   begin
    b = z;
    c = w;
   end
endmodule
