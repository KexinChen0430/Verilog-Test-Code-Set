`timescale 1ns/1ns      //����ʱ�䵥λ�� 
`include  "./compare.v" //����ģ���ļ������еķ�����Ի����в�����Ҫ����䡣 
                       //����Ҫ�ӵ��Ի����Ĳ˵��м����й�ģ���ļ���·�������� 
module  comparetest; 
   reg a,b; 
   wire equal; 
   initial              //initial�����ڷ���ʱ�źŵĸ�����
        begin
       a=0;
       b=0;
     #100   a=0; b=1;
     #100   a=1; b=1;
     #100   a=1; b=0;
     #100   $stop;      //ϵͳ������ͣ�����Ա�۲���沨�Ρ� 
     end 
      
    compare  compare1(.equal(equal),.a(a),.b(b));    //����ģ�顣
     
endmodule          
 