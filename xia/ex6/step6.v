module tryfunct(clk,n,result,reset);
 
  output[31:0] result; 
  input[3:0]  n; 
  input reset,clk; 
  reg[31:0] result; 
 
  always @(posedge clk)    //clk的上沿触发同步运算。 
begin 
    if(!reset)            //reset为低时复位。 
        result<=0; 
       else 
           begin 
            result <= n * factorial(n)/((n*2)+1);
           end 
      end 
   
  function [31:0] factorial;      //函数定义。 
    input  [3:0]  operand; 
    reg    [3:0]  index; 
    begin 
      factorial = operand ? 1 : 0; 
      for(index = 2; index <= operand; index = index + 1) 
        factorial = index * factorial; 
    end 
  endfunction 
   
endmodule 
            