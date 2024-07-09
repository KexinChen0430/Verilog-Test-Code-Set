// ��[3.1.1]:
module  adder ( count,sum,a,b,cin );
input [2:0] a,b; 
input   cin; 
output  count; 
output [2:0] sum; 
assign {count,sum} = a + b + cin; 
endmodule 

// ��[3.1.2]��
module compare ( equal,a,b );
output  equal;    //��������ź�equal 
input [1:0] a,b;  //���������ź�a,b 
  assign  equal = (a==b) ? 1 : 0;  
/*���a��b ���������ź����,���Ϊ1������Ϊ0*/
endmodule

// ��[3.1.3]��
module  trist2(out,in,enable);
output  out;
input   in, enable;
  bufif1  mybuf(out,in,enable);
endmodule

// ��[3.1.4]��
module trist1(out,in,enable);
output  out;
input  in, enable;
   mytri  tri_inst(out,in,enable);
    //������mytriģ�鶨���ʵ��Ԫ��tri_inst
endmodule

module  mytri(out,in,enable);
output  out;
input  in, enable;
   assign  out = enable? in : 'bz;
endmodule
