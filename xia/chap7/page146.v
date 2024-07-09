module display_cmds;
     reg a; 
     initial $monitor("\$monitor: a = %b", a); 
     initial  
       begin 
           $strobe  ("\$strobe : a = %b", a); 
            a = 0; 
           a <= 1; 
           $display ("\$display: a = %b", a); 
           #1 $finish; 
       end 
   endmodule 
module nb_schedule1;
      reg a, b; 
 
      initial  
        begin 
           a = 0; 
           b = 1; 
          a <= b; 
          b <= a; 
 
           $monitor ("%0dns: \$monitor: a=%b  b=%b",   $stime, a, b); 
           $display ("%0dns: \$display: a=%b  b=%b",   $stime, a, b); 
           $strobe  ("%0dns: \$strobe : a=%b  b=%b\n", $stime, a, b); 
        #0 $display ("%0dns: #0      : a=%b  b=%b",    $stime, a, b); 
 
        #1 $monitor ("%0dns: \$monitor: a=%b  b=%b",   $stime, a, b); 
           $display ("%0dns: \$display: a=%b  b=%b",   $stime, a, b); 
           $strobe  ("%0dns: \$strobe : a=%b  b=%b\n", $stime, a, b); 
           $display ("%0dns: #0      : a=%b  b=%b",    $stime, a, b); 
 
        #1 $finish; 
      end 
    endmodule 
    