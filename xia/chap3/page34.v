module page34;

 begin
areg = breg; 
#10 creg = areg; 
//��������ֵ�����ӳ�10��ʱ�䵥λ�� 
end  

parameter  d=50;  //����d��һ������
reg [7:0]  r;     //����r��һ��8λ�ļĴ������� 
begin             //��һϵ���ӳٲ����Ĳ��� 
#d  r = 'h35; 
#d  r = 'hE2; 
#d  r = 'h00; 
#d  r = 'hF7; 
#d  -> end_wave;  //�����¼�end_wave 
end 

endmodule