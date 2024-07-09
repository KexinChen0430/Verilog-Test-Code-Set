`timescale 100ps/100ps
module  con1(address,indata,outdata,wr,nconvst,nbusy,
                                        enout1,enout2,CLK,reset,start);

 input  CLK,     //����10MHZ��ʱ��
        reset,   //��λ�ź�
        start,   //��ΪRAM�Ŀռ������޵ģ���RAM����������;������ֹͣ��
                 //��ʱ��һ��start�ĸߵ�ƽ���彫�Ὺʼ��һ�εľ����
        nbusy;   //��A/Dת���������źű�ʾת������æ����
 output wr,      //RAM д�����ź�
        enout1,enout2, //enout1�Ǵ洢������ֽڽ��RAM��Ƭѡ�ź�
                       //enout2�Ǵ洢������ֽڽ��RAM��Ƭѡ�ź�
        nconvst, //��A/Dת�����Ŀ����ź�,����ת������ʼ����,�͵�ƽ��Ч
        address;  //��ַ���

 input [7:0]  indata;  //��A/Dת����������������
 output[7:0] outdata;  //д��RAMȥ����������

 wire  nbusy;
 reg   wr;
 reg   nconvst,
       enout1,
       enout2;
 reg[7:0]  outdata;

 reg[10:0] address;
 reg[8:0]  state;
 reg[15:0] result;
 reg[23:0] line;
 reg[11:0] counter;
 reg    high;
 reg[4:0] j;
 reg    EOC;

  parameter  h1=1,h2=2,h3=3;  //�����ϵͳϵ��
 parameter  IDLE=9'b000000001,  START=9'b000000010,  NCONVST=9'b000000100,
            READ=9'b000001000,  CALCU=9'b000010000,  WRREADY=9'b000100000,
              WR=9'b001000000,  WREND=9'b010000000,  WAITFOR=9'b100000000;

 parameter  FMAX=20;  //��ΪA/Dת����ʱ��������ģ�Ϊ��֤��һ����Ƶ�ʲ�����A/D
                      //ת�������ź�Ӧ��һ��Ƶ�ʸ������������Ƶ��ͨ��FMAX����
                      // Ϊ500KHZ��

 always @(posedge CLK)
       if(!reset)
          begin
               state<=IDLE;
               nconvst<=1'b1;
               enout1<=1;
               enout2<=1;
               counter<=12'b0;
               high<=0;
               wr<=1;
               line<=24'b0;

               address<=11'b0;
          end
       else
               case(state)
                    IDLE:if(start==1)
                           begin
                                counter<=0;     //counter��һ������������¼��
                                                //�õ�RAM�ռ�
                                line<=24'b0;
                                state<=START;
                           end
                         else
                                state<=IDLE;
                   //START״̬����A/D��ʼת��
                    START: if(EOC)
                               begin
                                    nconvst<=0;
                                    high<=0;
                                    state<= NCONVST;
                               end
                            else
                                    state<=START;
                   //NCONVST״̬��A/Dת�����ֽ׶�
                    NCONVST: begin
                                  nconvst<=1;
                                  state<=READ;
                             end
                  //READ״̬��ȡA/Dת����������������
                   READ:  begin
                            if(EOC)
                              begin
                                line<={line[15:0],indata};
                                state<=CALCU;
                              end
                            else
                                state<=READ;
                          end
                   CALCU: begin
                           result<=line[7:0]*h1+line[15:8]*h2+line[23:16]*h3;
                           state<=WRREADY;
                          end

                   //��������д��RAMʱ����д����ֽڣ���д����ֽ�
                   //WRREADY״̬��дRAM ׼��״̬��������ַ�������ź�
                    WRREADY:begin
                                     address<=counter;
                                     if(!high)   outdata<=result[7:0];
                                     else        outdata<=result[15:8];
                                     state<=WR;
                            end
                   //WR״̬����Ƭѡ��д����
                    WR: begin
                             if(!high)  enout1<=0;
                             else       enout2<=0;
                             wr<=0;
                             state<=WREND;
                        end
                   //WREND״̬����һ��д����������δд����ֽ���ת��WRREADY״

    // ̬��ʼ���ֽ�д��
                    WREND:begin
                               wr<=1;
                               enout1<=1;
                               enout2<=1;
                               if(!high)
                                 begin
                                      high<=1;
                                      state<=WRREADY;
                                 end
                               else   state<=WAITFOR;
                          end
                   //WAITFOR״̬���Ʋ���Ƶ�ʲ��ж�RAM�Ƿ��ѱ�д��
                    WAITFOR: begin
                                  if(j==FMAX-1)
                                    begin
                                         counter<=counter+1;
                                         if(!counter[11])   state<=START;
                                         else
                                           begin
                                              state<=IDLE;
                                              $display($time,"The ram is used up.");
                                              $stop;
                                            end
                                     end
                                  else     state<=WAITFOR;
                               end

                               default:state<=IDLE;
               endcase

 // assign rd=1;   //RAM�Ķ��ź�ʼ�ձ���Ϊ��

 //j��¼ʱ�ӣ���FMAX��ͬ���Ʋ���Ƶ��
 //����ֱ����CLK�������ض�nbusy�ж���
 //����ĳЩ�����Ƿ�����ʱ������Ϊ�����ź�
 //�����������̫������״̬�������������������
 //����CLK���½��ؽ���EOC�ź���nbusyͬ������λ
 //���180�ȣ�Ȼ����CLK���������жϲ����Ƿ���С�

 always @(negedge CLK )
   begin
        EOC <= nbusy;
        if(!reset||state==START)
                  j<=1;
        else
                  j<=j+1;
   end


endmodule
