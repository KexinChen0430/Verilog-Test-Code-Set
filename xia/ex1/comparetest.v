`timescale 1ns/1ns      //定义时间单位。 
`include  "./compare.v" //包含模块文件。在有的仿真调试环境中并不需要此语句。 
                       //而需要从调试环境的菜单中键入有关模块文件的路径和名称 
module  comparetest; 
   reg a,b; 
   wire equal; 
   initial              //initial常用于仿真时信号的给出。
        begin
       a=0;
       b=0;
     #100   a=0; b=1;
     #100   a=1; b=1;
     #100   a=1; b=0;
     #100   $stop;      //系统任务，暂停仿真以便观察仿真波形。 
     end 
      
    compare  compare1(.equal(equal),.a(a),.b(b));    //调用模块。
     
endmodule          
 