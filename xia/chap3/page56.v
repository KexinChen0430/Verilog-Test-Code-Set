
// [��]
`timescale 1ns/1ns
module random_pulse( dout ); 
output [9:0] dout; 
reg dout; 
integer delay1,delay2,k; 
initial  
begin 
#10 dout=0; 
for (k=0; k< 100; k=k+1) 
begin  
delay1 = 20 * ( {$random} % 6);  
// delay1 ��0��100ns��仯 
delay2 = 20 * ( 1 + {$random} % 3);  
// delay2 ��20��60ns��仯
#delay1  dout = 1 << ({$random} %10);
//dout��0--9λ���������1�������ֵ�ʱ����0-100ns��仯 
#delay2  dout = 0; 
//����Ŀ������20��60ns��仯 
end 
end 
endmodule 