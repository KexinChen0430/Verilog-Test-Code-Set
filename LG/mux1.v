module mux1 ( a, equal );
  input a; 
  output  equal;   
  
  assign equal = a ? 1 : 0;
endmodule
