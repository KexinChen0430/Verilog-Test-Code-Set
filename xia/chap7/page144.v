    module ba_nba2 (q, a, b, clk, rst_n);
      output q; 
      input  a, b, rst_n; 
      input  clk; 
      reg    q; 
 
      always @(posedge clk or negedge rst_n) begin: ff 
        reg tmp; 
        if (!rst_n) q <= 1'b0; 
        else begin 
          tmp = a & b; 
          q <= tmp; 
        end 
      end 
    endmodule 
     module ba_nba6 (q, a, b, clk, rst_n);
      output q; 
      input  a, b, rst_n; 
      input  clk; 
      reg    q, tmp; 
 
      always @(posedge clk or negedge rst_n) 
        if (!rst_n) q = 1'b0;  // 对 q进行阻塞赋值 
        else begin 
          tmp = a & b; 
          q <= tmp;            // 对 q进行非阻塞赋值     
        end 
    endmodule 
    module badcode1 (q, d1, d2, clk, rst_n); 
          output q;
      input  d1, d2, clk, rst_n; 
      reg    q; 
 
      always @(posedge clk or negedge rst_n) 
        if (!rst_n) q <= 1'b0; 
        else        q <= d1; 
 
      always @(posedge clk or negedge rst_n) 
        if (!rst_n) q <= 1'b0; 
        else        q <= d2; 
    endmodule 
 