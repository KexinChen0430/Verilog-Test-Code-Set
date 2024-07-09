//--------------------- s_to_p.v ---------------------------
module s_to_p(T1, data, D_out,DSC,TAKE,ADD_101); 
       output       T1;                     //��CPU�жϣ���ȷ��CPU��ʱȡת�� 
                                            //�õ��Ĳ������ݡ�               
       output [7:0] data;                  
       input   D_out, DSC, TAKE, ADD_101;  //D_out�ṩ���봮�����ݡ�DSC��TAKE 
                                           //��ͬ������ʱȡ����            
       wire   [7:0] data; 
       wire         T1,clk2;  
       reg    [7:0] data_latch, data_latch_buf; 
        
       assign       clk2 = DSC  & TAKE ;   //�ṩ��λʱ�ӡ�        
       assign       T1 = !clk2; 
        
       assign       data =  (!ADD_101) ? data_latch : 8'bz;     
       always@(posedge clk2) 
            begin 
               data_latch_buf = data_latch << 1;   //data_latch_buf������ 
               data_latch     = data_latch_buf;   //�������ۺ����ܱ����� 
                data_latch[0] = D_out; 
           end 
endmodule 