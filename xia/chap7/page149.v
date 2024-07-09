
`timescale 1ns/1ns 
 
module t; 
reg clk, rst; 
reg [23:0] data; 
wire z,x; 
assign x=data[23]; 
 
initial 
 begin 
  clk<=0; 
  rst<=1; 
  #2 rst<=0; 
  #30 rst<=1;  //��λ�ź� 
  data='b1100_1001_0000_1001_0100; //�������� 
 end 
 
always #10 clk=~clk; //ʱ���ź� 
always @ (posedge clk) // ��λ������� 
  data={data[22:0],data[23]}; 
  

seqdet m ( .x(x), .z(z), .clk(clk), .rst(rst)); //�������м����ģ�� 
 
// Enter fixture code here 
 
endmodule // t   