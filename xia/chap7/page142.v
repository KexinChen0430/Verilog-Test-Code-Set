    module ao4 (y, a, b, c, d);
      output y; 
      input  a, b, c, d; 
      reg    y, tmp1, tmp2;
 
      always @(a or b or c or d)  
          begin 
             tmp1 <= a & b; 
             tmp2 <= c & d; 
             y    <= tmp1 | tmp2; 
          end 
endmodule 

     module ao5 (y, a, b, c, d);
      output y; 
      input  a, b, c, d; 
// original code was:      
 //     reg    y, tmp1, tmp2;5
     reg    y, tmp1, tmp2;

      always @(a or b or c or d or tmp1 or tmp2)  
         begin 
             tmp1 <= a & b; 
             tmp2 <= c & d; 
                y <= tmp1 | tmp2; 
      end 
    endmodule
    
        module ao2 (y, a, b, c, d);
      output y; 
      input  a, b, c, d; 
      reg    y, tmp1, tmp2; 
 
      always @(a or b or c or d) begin 
        tmp1 = a & b; 
        tmp2 = c & d; 
        y    = tmp1 | tmp2; 
      end
    endmodule 
