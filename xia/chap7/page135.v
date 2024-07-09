 module osc1 (clk);
      output clk; 
      reg    clk; 
 
        initial #10 clk = 0; 
        always @(clk) #10 clk = ~clk; 
 
 endmodule 
 
 module osc2 (clk);
      output clk; 
      reg    clk; 
 
      initial #10 clk = 0; 
      always @(clk) #10 clk <= ~clk; 
 
endmodule 