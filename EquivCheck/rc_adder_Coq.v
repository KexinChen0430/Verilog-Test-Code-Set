// module FullAdder(
//       input A, B, Cin,
//       output Sum, Cout
// );

//       assign Sum = A ^ B ^ Cin; 
//       assign Cout = (A & B) | (Cin & (A ^ B));
// endmodule


// module rc_adder_2(
//     input a0,a1,b0,b1,  
//     input Cin,        
//     output [1:0] sum, 
//     output cout       
// );

//     wire [1:0] S;  
//     wire C1, C2, C3; 

//     FullAdder FA0(a0, b0, Cin, S[0], C1);

//     FullAdder FA1(a1, b1, C1, S[1], C2);

//     // 连接结果
//     assign sum = S;
//     assign cout = C2;

// endmodule

module rc_adder(                                
             input a1,b1,a0,b0,c,
             output sum1, sum0, cout
         );
        
        assign sum0 = ((a0)^(b0))^(c);
        assign sum1 = ((a1)^(b1))^(((a0)&(b0))|(((a0)^(b0))&(c)));
        assign cout = ((a1)&(b1))|(((a1)^(b1))&(((a0)&(b0))|(((a0)^(b0))&(c))));
                                                
endmodule