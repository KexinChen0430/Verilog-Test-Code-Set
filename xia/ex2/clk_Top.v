//-------------------  clk_Top.v -----------------------------
 
`timescale 1ns/100ps 
// Error in original file: missing `include "half_clk.v"
`define clk_cycle 50

module clk_Top;

reg clk,reset;
wire clk_out;

always  #`clk_cycle  clk = ~clk;

initial
  begin
     clk = 0;
     reset = 1;
    #100 reset = 0;
    #100 reset = 1;
    #10000 $stop;

  end

half_clk half_clk(.reset(reset),.clk(clk_in),.clk_out(clk_out));

endmodule