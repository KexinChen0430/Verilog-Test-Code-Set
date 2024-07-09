    module fbosc1 (y1, y2, clk, rst);
      output y1, y2; 
      input  clk, rst; 
      reg    y1, y2; 
 
      always @(posedge clk or posedge rst) 
        if (rst) y1 = 0;  // reset 
        else     y1 = y2; 
 
      always @(posedge clk or posedge rst) 
        if (rst) y2 = 1;  // preset 
        else     y2 = y1; 
    endmodule 

    module fbosc2 (y1, y2, clk, rst);
      output y1, y2; 
      input  clk, rst; 
      reg    y1, y2; 
 
      always @(posedge clk or posedge rst) 
        if (rst) y1 <= 0;  // reset 

        else     y1 <= y2; 
 
      always @(posedge clk or posedge rst) 
        if (rst) y2 <= 1;  // preset 
        else     y2 <= y1; 
    endmodule 
           