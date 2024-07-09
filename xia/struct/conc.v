// concatenation expressions
// used to check concatenation parsing and printing.
// reference: ÏÄÓîÎÅ£¬page 30.

module conc(a,b,c);

input a,w;
input [4:0] b;
output [7:0] c;

assign c = { 1'b0 };
assign c = {a};
assign c = {a,b[3:0],w,3'b101} ;
assign c = {a,b[3],b[2],b[1],b[0],w,1'b1,1'b0,1'b1};
assign c = {b,{3{a,b}}};

endmodule