module mult_4( X, Y, Product);
input [3 : 0] X, Y; 
output [7 : 0]  Product; 
 
assign    Product = X *  Y; 
 
endmodule 
// �� 8λ�˷���ֻ��Ҫ����λ�����ɣ��������� 
module mult_8( X, Y, Product); 
input [7 : 0] X, Y; 
output [15 : 0]  Product; 
 
assign    Product = X * Y; 
 
endmodule 
