    module lfsrb1 (q3, clk, pre_n);
      output q3; 
      input  clk, pre_n; 
      reg    q3, q2, q1; 
      wire   n1; 
 
      assign n1 = q1 ^ q3; 
 
      always @(posedge clk or negedge pre_n) 
        if (!pre_n)  
           begin 
              q3 = 1'b1; 
              q2 = 1'b1; 
              q1 = 1'b1; 
           end 
        else  
            begin 
             q3 = q2; 
             q2 = n1; 
             q1 = q3; 
            end 
    endmodule 
     module lfsrb2 (q3, clk, pre_n);
      output q3; 
      input  clk, pre_n; 
      reg    q3, q2, q1; 
 
      always @(posedge clk or negedge pre_n) 
        if (!pre_n) {q3,q2,q1} = 3'b111; 
        else        {q3,q2,q1} = {q2,(q1^q3),q3}; 
    endmodule 