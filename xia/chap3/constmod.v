module constmod ;

input

a1=8'b10101100,  //位宽为8的数的二进制表示, 'b表示二进制
a2=8'ha2,        //位宽为8的数的十六进制，'h表示十六进制。

b1=4'b10x0, //位宽为4的二进制数从低位数起第二位为不定值
b2=4'b101z, //位宽为4的二进制数从低位数起第一位为高阻值
b3=12'dz,   //位宽为12的十进制数其值为高阻值(第一种表达方式)
b4=12'd?,   //位宽为12的十进制数其值为高阻值(第二种表达方式)
b5=8'h4x,   //位宽为8的十六进制数其低四位值为不定值

c1=-8'd5,   //这个表达式代表5的补数（用八位二进制数表示)
c2=16'b1010_1011_1111_1010,
c3=1,
c4=-1,
c5='BX
;

parameter  msb=7;       //定义参数msb为常量7
parameter  e=25, f=29;  //定义二个常数参数 
parameter  r=5.7;       //声明r为一个实型参数 
parameter  byte_size=8, byte_msb=byte_size-1; //用常数表达式赋值 
parameter  average_delay = (r+f)/2;           //用常数表达式赋值 

endmodule