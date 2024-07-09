module dff( q, data, clk);
output q; 
input data, clk; 
reg q; 
always @( posedge clk ) 
begin 
q = data; 
end 
endmodule 

 module latch1( q, data, clk);
output q; 
input data, clk; 
assign q = clk? data : q; 
endmodule

module latch2( q, data, clk, set, reset); 
output q;
input data, clk, set, reset; 
assign q= reset? 0 : ( set? 1:(clk? data : q ) ); 
endmodule 

module latch3( q, data, clk);
output q; 
input data, clk; 
reg q; 
always @(clk or data) 
begin 
if(clk) 
q=data; 
end 
endmodule 

module shifter( din, clk, clr, dout);
input din, clk, clr; 
output [7:0] dout; 
reg [7:0] dout; 
always @(posedge clk) 
begin 
if(clr) //���� 
dout = 8'b0; 
else  
begin 
dout = dout<<1; //����һλ 
dout[0] = din;   //�������źŷ���Ĵ��������λ 
end 
end 
 
endmodule 

module counter1( out, cout, data, load, cin, clk);
output [7:0] out; 
output cout; 
input [7:0] data; 
input load, cin, clk; 
reg [7:0] out; 
always @(posedge clk) 
begin 
if( load ) 
out = data; 
else 
out = out + cin; 
end 
assign cout= & out & cin; 
//ֻ�е�out[7:0]�����и�λ��Ϊ1
//���ҽ�λcinҲΪ1ʱ���ܲ�����λcout 
endmodule 

module counter2( out, cout, data, load, cin, clk);
output [7:0] out; 
output cout; 
input [7:0] data; 
input load, cin, clk; 
reg [7:0] out; 
reg cout; 
reg [7:0] preout; 
//����8λ�Ĵ���  
always @(posedge clk) 
begin 
out = preout; 
end 
/****����������ͽ�λ����һ��״̬�� 
ע�⣺Ϊ������ܲ�ϣ������Ӱ���λ****/ 
always @( out or data or load or cin ) 
begin 
{cout, preout} = out + cin; 
if(load)  
preout = data; 
end 
endmodule 
  

