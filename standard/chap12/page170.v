module tb1;
  wire [9:0] out_a, out_d;
  wire [4:0] out_b, out_c;
  reg  [9:0] in_a, in_d;
  reg  [4:0] in_b, in_c;
  reg        clk;
  // testbench clock & stimulus generation code ...
          
  // Four instances of vdff with parameter value assignment
  // by ordered list
  // mod_a has new parameter values size=10 and delay=15
  // mod_b has default parameters (size=5, delay=1)
  // mod_c has one default size=5 and one new delay=12
  //   In order to change the value of delay,
    //   it is necessary to specify the (default) value of size as well.
  // mod_d has a new parameter value size=10.
  //   delay retains its default value
  vdff #(10,15) mod_a (.out(out_a), .in(in_a), .clk(clk));
  vdff          mod_b (.out(out_b), .in(in_b), .clk(clk));
  vdff #( 5,12) mod_c (.out(out_c), .in(in_c), .clk(clk));
  vdff #(10)    mod_d (.out(out_d), .in(in_d), .clk(clk));
endmodule
module vdff (out, in, clk);
  parameter size=5, delay=1;
  output [size-1:0] out;
  input  [size-1:0] in;
  input             clk;
  reg    [size-1:0] out;
  always @(posedge clk)
    #delay out = in;
endmodule