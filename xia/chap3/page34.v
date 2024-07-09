module page34;

 begin
areg = breg; 
#10 creg = areg; 
//在两条赋值语句间延迟10个时间单位。 
end  

parameter  d=50;  //声明d是一个参数
reg [7:0]  r;     //声明r是一个8位的寄存器变量 
begin             //由一系列延迟产生的波形 
#d  r = 'h35; 
#d  r = 'hE2; 
#d  r = 'h00; 
#d  r = 'hF7; 
#d  -> end_wave;  //触发事件end_wave 
end 

endmodule