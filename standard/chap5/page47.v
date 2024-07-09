module logicSynthesis(out);

  integer intA;
  reg [15:0] regA;
  reg signed [15:0] regS;
  output out;

  initial begin
    intA = -4'd12;
    regA = intA / 3; // expression result is -4
    //$display("intA is %d, regA is %d", intA, regA);

    regA = -4'd12; // regA is 65524
    //$display("regA is %d", regA);

    intA = regA / 3; // expression result is 21841
    //$display("intA is %d, regA is %d", intA, regA);

    intA = -4'd12 / 3; // expression result is 1431655761
    //$display("intA is %d", intA);

    regA = -12 / 3; // expression result is -4
    //$display("regA is %d", regA);

    regS = -12 / 3; // expression result is -4
    //$display("regS is %d", regS);

    regS = -4'sd12 / 3; // expression result is 1
    //$display("regS is %d", regS);
  end

endmodule

// module page47;

// integer intA;
// reg [15:0] regA;
// reg signed [15:0] regS;
// intA = -4'd12;
// regA = intA / 3;// expression result is -4,
// // intA is an integer data type, regA is 65532
// regA = -4'd12;// regA is 65524
// intA = regA / 3;// expression result is 21841, 
// // regA is a reg data type
// intA = -4'd12 / 3;// expression result is 1431655761.
// // -4'd12 is effectively a 32-bit reg data type
// regA = -12 / 3;// expression result is -4, -12 is effectively 
// // an integer data type. regA is 65532
// regS = -12 / 3;// expression result is -4. regS is a signed reg
// regS = -4'sd12 / 3;// expression result is 1. -4'sd12 is actually 4.
// // The rules for integer division yield 4/3==1.

// endmodule