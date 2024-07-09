module FullAdder(
      input A, B, Cin,
      output Sum, Cout
);

      assign Sum = A ^ B ^ Cin; 
      assign Cout = (A & B) | (Cin & (A ^ B));
endmodule


module rc_adder(
    input [1:0] A, B, 
    input Cin, 
    output [0:0] Sum0, 
    output [0:0] Sum1, 
    output Cout
);


    wire [1:0] S;  
    wire C1, C2, C3;

    FullAdder FA0(A[0], B[0], Cin, S[0], C1);
    FullAdder FA1(A[1], B[1], C1, S[1], C2);
    
    // // Connect the results
    assign {Sum1, Sum0} = S; 

    // // Carry-out is the last carry signal
    assign Cout = C2;

endmodule

module rc_adder(                                
             input [1:0] A, B,
             input Cin,
             output Sum0, Sum1, Cout                    
         );
        
        assign Sum0 = ((A[0])^(B[0]))^(Cin);
        assign Sum1 = ((A[1])^(B[1]))^(((A[0])&(B[0]))|(((A[0])^(B[0]))&(Cin)));
        assign Cout = ((A[1])&(B[1]))|(((A[1])^(B[1]))&(((A[0])&(B[0]))|(((A[0])^(B[0]))&(Cin))));
                                                
endmodule

