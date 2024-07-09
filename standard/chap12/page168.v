module foo(a,b);
   real r1,r2;
   parameter [2:0] A = 3'h2;
   parameter B = 3'h2;
   initial begin
      r1 = A;
      r2 = B;
      $display("r1 is %f r2 is %f",r1,r2);
   end
endmodule // foo
module bar;
   wire a,b;
   defparam f1.A = 3.1415;
   defparam f1.B = 3.1415;
   foo f1(a,b);
endmodule // bar
