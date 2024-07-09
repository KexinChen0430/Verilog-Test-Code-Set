
module hardreg_top; 
reg clock, clearb; 
reg [3:0] data;
wire [3:0] qout;
`define  stim  #100 data=4'b //宏定义 stim,可使源程序简洁 
event  end_first_pass;  //定义事件end_first_pass 
hardreg  reg_4bit (.d(data), .clk(clock), .clrb(clearb), .q(qout)); 
/********************************************************************************** 
把本模块中产生的测试信号data、clock、clearb输入实例reg_4bit以观察输出信号qout.实例
reg_4bit引用了hardreg 
**********************************************************************************/ 
initial
begin 
clock = 0; 
clearb = 1; 
end  
  
always #50 clock = ~clock; 

always @(end_first_pass) 
clearb = ~clearb; 
 
always @(posedge clock) 
$display("at time %0d clearb= %b data= %d qout= %d", $time, clearb, data, qout); 
/***************************************************** 
    类似于C语言的 printf 语句，可打印不同时刻的信号值 
******************************************************/ 
initial 
begin 
repeat(2)  //重复两次产生下面的data变化 
begin 
data=4'b0000; 
`stim0001; 
/*************************************************************** 
  宏定义stim引用,等同于 #100 data=4'b0001；。注意引用时要用 `符号。 
****************************************************************/
`stim0010; 
`stim0011; 
`stim0100; 
`stim0101; 

`stim1110; 
`stim1111; 
end 
#200 -> end_first_pass;

/***********************************************
延迟200个单位时间，触发事件end_first_pass 
************************************************/ 
$finish;  //结束仿真 
end 
endmodule