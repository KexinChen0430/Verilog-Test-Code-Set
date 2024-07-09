// 例[3.1.1]:
module  adder ( count,sum,a,b,cin );
input [2:0] a,b; 
input   cin; 
output  count; 
output [2:0] sum; 
assign {count,sum} = a + b + cin; 
endmodule 

// 例[3.1.2]：
module compare ( equal,a,b );
output  equal;    //声明输出信号equal 
input [1:0] a,b;  //声明输入信号a,b 
  assign  equal = (a==b) ? 1 : 0;  
/*如果a、b 两个输入信号相等,输出为1。否则为0*/
endmodule

// 例[3.1.3]：
module  trist2(out,in,enable);
output  out;
input   in, enable;
  bufif1  mybuf(out,in,enable);
endmodule

// 例[3.1.4]：
module trist1(out,in,enable);
output  out;
input  in, enable;
   mytri  tri_inst(out,in,enable);
    //调用由mytri模块定义的实例元件tri_inst
endmodule

module  mytri(out,in,enable);
output  out;
input  in, enable;
   assign  out = enable? in : 'bz;
endmodule
