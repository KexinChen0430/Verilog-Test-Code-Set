//-------------  compareTop.v -----------------------------
 
`timescale 1ns/100ps 
`include "./blocking.v" 
`include "./non_blocking.v" 
 
module compareTop; 
 
  wire [3:0] b1,c1,b2,c2; 
  reg  [3:0] a; 
  reg        clk; 
   
  initial 
  begin 
    clk = 0; 
    forever #50 clk = ~clk; 
  end 
   
  initial 

  begin 
    a = 4'h3; 
    $display("____________________________"); 
    # 100 a = 4'h7; 
    $display("____________________________"); 
    # 100 a = 4'hf; 
    $display("____________________________"); 
    # 100 a = 4'ha; 
    $display("____________________________"); 
    # 100 a = 4'h2; 
    $display("____________________________"); 
    # 100  $display("____________________________"); 
    $stop; 
  end 
  non_blocking  non_blocking(clk,a,b2,c2); 
  blocking      blocking(clk,a,b1,c1); 
 
endmodule    