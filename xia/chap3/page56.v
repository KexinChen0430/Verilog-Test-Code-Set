
// [例]
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
// delay1 在0到100ns间变化 
delay2 = 20 * ( 1 + {$random} % 3);  
// delay2 在20到60ns间变化
#delay1  dout = 1 << ({$random} %10);
//dout的0--9位中随机出现1，并出现的时间在0-100ns间变化 
#delay2  dout = 0; 
//脉冲的宽度在在20到60ns间变化 
end 
end 
endmodule 