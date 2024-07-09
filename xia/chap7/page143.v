    module nbex2 (q, a, b, clk, rst_n);
      output q; 
      input  clk, rst_n; 
      input  a, b; 
      reg    q; 
 
      always @(posedge clk or negedge rst_n) 
        if (!rst_n) q <= 1'b0; // ʱ���߼� 
        else        q <= a ^ b;// ���Ϊ����߼� 
    endmodule 
     module nbex1 (q, a, b, clk, rst_n);
      output q; 
      input  clk, rst_n; 
      input  a, b; 
      reg    q, y; 
 
      always @(a or b) 
        y = a ^ b; 
 
      always @(posedge clk or negedge rst_n) 
        if (!rst_n) q <= 1'b0; 
        else        q <= y; 
    endmodule 
    