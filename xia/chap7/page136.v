module pipeb1 (q3, d, clk);
      output [7:0] q3; 
      input  [7:0] d; 
      input        clk; 
      reg    [7:0] q3, q2, q1; 
 
      always @(posedge clk)  
        begin 
           q1 = d; 
           q2 = q1; 
           q3 = q2; 
       end 
    endmodule 

module pipeb2 (q3, d, clk);
      output [7:0] q3; 
      input  [7:0] d; 
      input        clk; 
      reg    [7:0] q3, q2, q1; 
 
      always @(posedge clk)  
        begin 
          q3 = q2; 
          q2 = q1; 
          q1 = d; 
        end 
    endmodule 
  
 module pipeb3 (q3, d, clk);
      output [7:0] q3; 
      input  [7:0] d; 
      input        clk; 
      reg    [7:0] q3, q2, q1; 
 
      always @(posedge clk) q1 = d; 
      always @(posedge clk) q2 = q1; 
      always @(posedge clk) q3 = q2; 
    endmodule 
 
     module pipeb4 (q3, d, clk);
      output [7:0] q3; 
      input  [7:0] d; 
      input        clk; 
      reg    [7:0] q3, q2, q1; 
      

      always @(posedge clk) q2 = q1; 
      always @(posedge clk) q3 = q2; 
      always @(posedge clk) q1 = d; 
    endmodule             