module mult_4( X, Y, Product);
input [3 : 0] X, Y; 
output [7 : 0]  Product; 
 
assign    Product = X *  Y; 
 
endmodule 
// 而 8位乘法器只需要扩大位数即可，见下例： 
module mult_8( X, Y, Product); 
input [7 : 0] X, Y; 
output [15 : 0]  Product; 
 
assign    Product = X * Y; 
 
endmodule 
