module  tryfact;
 //函数的定义------------------------------- 
function[31:0]factorial; 
input[3:0]operand; 
reg[3:0]index; 
begin 
factorial = operand? 1 : 0; 
for(index=2;index<=operand;index=index+1) 
factorial = index * factorial; 
end 
endfunction 
//函数的测试------------------------------------- 
reg[31:0]result; 
reg[3:0]n; 
initial 
begin 
result=1; 
for(n=2;n<=9;n=n+1) 
begin 
$display("Partial result n= %d result= %d", n, result); 
result = n * factorial(n)/((n*2)+1); 
end 
 $display("Finalresult=%d",result); 
end 
endmodule//模块结束 