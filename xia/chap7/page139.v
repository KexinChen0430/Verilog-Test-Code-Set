
// [Àý13]
module dffb (q, d, clk, rst);
       output q; 
       input  d, clk, rst; 
       reg    q; 
 
      always @(posedge clk) 
        if (rst) q = 1'b0; 
        else     q = d; 
endmodule

    module dffx (q, d, clk, rst);
      output q; 
      input  d, clk, rst; 
      reg    q; 
 
      always @(posedge clk) 
      
          if (rst) q  <= 1'b0;
        else     q  <= d;    
    endmodule     