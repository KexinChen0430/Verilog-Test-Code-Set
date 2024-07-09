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
if(clr) //清零 
dout = 8'b0; 
else  
begin 
dout = dout<<1; //左移一位 
dout[0] = din;   //把输入信号放入寄存器的最低位 
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
//只有当out[7:0]的所有各位都为1
//并且进位cin也为1时才能产生进位cout 
endmodule 

module counter2( out, cout, data, load, cin, clk);
output [7:0] out; 
output cout; 
input [7:0] data; 
input load, cin, clk; 
reg [7:0] out; 
reg cout; 
reg [7:0] preout; 
//创建8位寄存器  
always @(posedge clk) 
begin 
out = preout; 
end 
/****计算计数器和进位的下一个状态， 
注意：为提高性能不希望加载影响进位****/ 
always @( out or data or load or cin ) 
begin 
{cout, preout} = out + cin; 
if(load)  
preout = data; 
end 
endmodule 
  

