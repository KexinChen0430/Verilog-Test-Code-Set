module Test;
 wire W;
 Top T ( );
endmodule
module Top;
  wire W;
  Block B1 ( );
  Block B2 ( );
endmodule
module Block;
  parameter P = 0;
endmodule
module Annotate;
  defparam
   Test.T.B1.P = 2,
   Test.T.B2.P = 3;
endmodule