`include "./step6.v"
`timescale 1ns/100ps 
`define clk_cycle 50 
 
module tryfuctTop; 
 
reg[3:0] n,i; 
reg reset,clk; 
 
wire[31:0] result; 
 
initial 
  begin 
    n=0; 
    reset=1; 
    clk=0; 
    #100 reset=0; 
    #100 reset=1; 
    for(i=0;i<=15;i=i+1) 
      begin 
        #200 n=i; 
      end 
    #100 $stop; 
  end 
 
always #`clk_cycle clk=~clk;  

tryfunct tryfunct(.clk(clk),.n(n),.result(result),.reset(reset));

endmodule
