module Decode(A,F);
parameter  Width=1, Polarity=1; 
endmodule

module  Top;
wire[3:0] A4;
wire[4:0] A5;
wire[15:0] F16;
wire[31:0] F32;
Decode  #(4,0)  D1(A4,F16);
Decode  #(5)    D2(A5,F32);
endmodule 
