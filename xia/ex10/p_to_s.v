// ----------------   p_to_s.v ---------------------------------
module p_to_s(D_in,T0,data,SEND,ESC,ADD_100); 
 output       D_in,T0;            // D_in�Ǵ��������T0����λʱ�Ӳ��� 
                                      // CPU�жϣ���ȷ����ʱ�����¸����ݡ� 
 input [7:0] data;               //������������ݡ� 
 input       SEND,ESC,ADD_100;   //SEND��ESC��ͬ�����Ƿ���в����� 
                                      //������ת����ADD_100������ʱ������ 
 wire        D_in,T0; 
 reg [7:0] DATA_Q,DATA_Q_buf; 
 
 assign       T0 = ! (SEND & ESC);      //�γ���λʱ�ӡ�. 
 assign       D_in = DATA_Q[7];         //�����������ݡ� 
 
 always @(posedge T0 or negedge ADD_100)  //ADD_100����������T0������λ�� 
   begin 
     if(!ADD_100)
       DATA_Q = data; 
     else 
       begin 
       DATA_Q_buf = DATA_Q<<1;        //DATA_Q_buf��Ϊ�н飬�����ۺ��� 
       DATA_Q   = DATA_Q_buf;           //�ܱ����� 
       end 
   end 
 
endmodule    