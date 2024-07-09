module test(a,b,c,d,e,f,g,h);
input [7:0] a;  // no explicit declaration - net is unsigned
input [7:0] b;
input signed [7:0] c;
input signed [7:0] d;  // no explicit net declaration - net is signed
output [7:0] e;  // no explicit declaration - net is unsigned
output [7:0] f;
output signed [7:0] g;
output signed [7:0] h;  // no explicit net declaration - net is signed
wire signed [7:0] b;// port b inherits signed attribute from net decl.
wire [7:0] c; // net  c inherits signed attribute from port
reg signed [7:0] f;// port f inherits signed attribute from reg decl.
reg [7:0] g; // reg  g inherits signed attribute from port
endmodule
