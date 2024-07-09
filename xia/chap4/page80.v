
module hardreg_top; 
reg clock, clearb; 
reg [3:0] data;
wire [3:0] qout;
`define  stim  #100 data=4'b //�궨�� stim,��ʹԴ������ 
event  end_first_pass;  //�����¼�end_first_pass 
hardreg  reg_4bit (.d(data), .clk(clock), .clrb(clearb), .q(qout)); 
/********************************************************************************** 
�ѱ�ģ���в����Ĳ����ź�data��clock��clearb����ʵ��reg_4bit�Թ۲�����ź�qout.ʵ��
reg_4bit������hardreg 
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
    ������C���Ե� printf ��䣬�ɴ�ӡ��ͬʱ�̵��ź�ֵ 
******************************************************/ 
initial 
begin 
repeat(2)  //�ظ����β��������data�仯 
begin 
data=4'b0000; 
`stim0001; 
/*************************************************************** 
  �궨��stim����,��ͬ�� #100 data=4'b0001����ע������ʱҪ�� `���š� 
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
�ӳ�200����λʱ�䣬�����¼�end_first_pass 
************************************************/ 
$finish;  //�������� 
end 
endmodule