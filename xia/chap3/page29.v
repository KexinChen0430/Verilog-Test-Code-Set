module  shift;
reg [3:0]  start, result; 
initial 
begin 
start  = 1; //start�ڳ�ʼʱ����Ϊֵ0001 
result = (start<<2); 
//��λ��start��ֵ0100��Ȼ�󸳸�result��
end 
endmodule 