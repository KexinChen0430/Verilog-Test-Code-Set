module add_4( X, Y, sum, C);
input [3 : 0] X, Y; 
output [3: 0]  sum; 
output C; 
 
assign    {C,  Sum } = X + Y; 


endmodule 
 
// �� 16λ�ӷ���ֻ��Ҫ����λ�����ɣ���������
module add_16( X, Y, sum, C);
input [15 : 0] X, Y; 
output [15 : 0]  sum; 
output C; 
 
assign    {C,  Sum } = X + Y; 
 
endmodule 
