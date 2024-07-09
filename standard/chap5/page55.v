module page55;

parameter P = 32;
// The following is legal for all P from 1 to 32
assign b[31:0] = { {32-P{1'b1}}, a[P-1:0] } ;
// The following is illegal for P=32 because the zero
// replication appears alone within a concatenation
// original code has a missing semicolon at the end.
assign c[31:0] = { {{32-P{1'b1}}}, a[P-1:0] };
// The following is illegal for P=32
initial
  $displayb({32-P{1'b1}}, a[P-1:0]);

endmodule