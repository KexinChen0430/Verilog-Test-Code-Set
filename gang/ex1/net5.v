// a combinatorial circuit with 5 input variables.

module f5(result, r1,r2,r3,r4,r5);
input r1,r2,r3,r4,r5;
output result;

   assign  result = r1 && r2 || (r3 && ~r4) && r5;

endmodule 
 