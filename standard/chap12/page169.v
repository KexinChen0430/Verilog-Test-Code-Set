// same as defparam2

module top;
reg clk;
reg [0:4] in1;
reg [0:9] in2;
wire [0:4] o1;
wire [0:9] o2;
vdff m1 (o1, in1, clk);
vdff m2 (o2, in2, clk);
endmodule
module vdff (out, in, clk);
parameter size = 1, delay = 1;
input [0:size-1] in;
input clk;
output [0:size-1] out;
reg [0:size-1] out;
always @(posedge clk)
# delay out = in;
endmodule
module annotate;
defparam 
top.m1.size = 5,
top.m1.delay = 10,
top.m2.size = 10,
top.m2.delay = 20;
endmodule