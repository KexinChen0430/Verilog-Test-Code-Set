//-------------------- adc.v ------------------------
module   adc (nconvst, nbusy, data);   
input   nconvst;         // A/D ��������ST������ͼ��  
output    nbusy;       // A/D ������־������ͼ��  
output       data;         // �������ߣ���AD.DATA�ļ��ж�ȡ���ݺ󾭶˿���� 
reg[7:0]  databuf,i;   // �ڲ��Ĵ��� 
reg       nbusy; 
wire[7:0] data; 
reg[7:0]  data_mem[0:255]; 
reg       link_bus; 
integer   tconv, 
          t5, 
          t8, 
          t9, 
          t12; 
integer   wideth1, 
          wideth2, 
          wideth;           
 
//ʱ���������(����AD7886�ֲ�)�� 
always @(negedge nconvst) 
   begin 
         tconv =9500+{$random}%500; //(type 950, max 1000��Conversion Time 
         t5 ={$random}%1000;  //(max 100)   CONVST to BUSY Propagation Dlay 
                             // CL = 10pf 
         t8 = 200;     //(min 20)  CL=20pf  Data Setup Time Prior to BUSY 
                      //(min 10)  CL=100pf 
         t9 = 100+{$random}%900; //(min 10, max 100) Bus Relinquish Time After CONVST
         t12 = 2500;   //(type) BUSY High to CONVST Low, SHA Acquisition Time
   end 
 
initial 
      begin  
    $readmemh("adc.data",data_mem);  //�������ļ� adc.data�ж�ȡ����
    i = 0; 
    nbusy  = 1;  
           link_bus = 0; 
      end
 
assign data = link_bus? databuf:8'bzz; //��̬���� 
/*---------------------------------------------------------------------------- 
���ź�nconvst�ĸ������ص����󣬸�t5��nbusy�ź���Ϊ�ͣ�tconv��AD��ģ���ź�ת
��Ϊ�����źŵ�ʱ�䣬���ź�nconvst���������ص����󾭹� tconvʱ������nbusy
�źű�Ϊ�ߡ�  
---------------------------------------------------------------------------*/   
always @(negedge nconvst)  
     fork 
        #t5  nbusy =0;
          @(posedge nconvst)
                    begin
                         #tconv  nbusy=1;
                    end        
     join

/*--------------------------------------------------------------------------        
nconvst�źŵ��½��ش���������t9 ��ʱ�󣬰�������������ر���Ϊ����̬����ͼʾ�� 
 nconvst�źŵ������ص����� ���� ��tconv  -  t8)ʱ�䣬 ���һ���ֽ� ��8λ���ݣ� ��databuf��
������������data_mem����data_mem�е������ǳ�ʼ��ʱ�������ļ�AD.DATA�ж�ȡ�ġ�
��ʱӦ�������ߵ���̬�����  
---------------------------------------------------------------------------*/ 
 
always @(negedge nconvst)           
      begin 
         @(posedge nconvst) 
            begin  
              #(tconv-t8)   databuf=data_mem[i];   
            end 
             
         if(wideth <10000  && wideth>500)   
            begin 
              if(i==255) i=0; 
              else i=i+1;
            end    
         else  i = i; 
           
      end 
 
//��ģ��ת���ڼ�ر���̬�����ת������ʱ������̬��� 
always @(negedge nconvst) 
  fork 
       #t9 link_bus = 1'b0;    //�ر���̬������������������ 
       @(posedge nconvst) 
            begin  
            #(tconv-t8)   link_bus=1'b1;      
            end 
  join 
 
 
/*------------------------------------------------------------------------ 
��nconvst�����źŵ���һ��ת�����½�����nbusy�ź�������֮��ʱ���ӳ�С��t12ʱ��  
������־�����Ϣ��֪ͨ���������ת���������ź�Ƶ��̫�죬A/D����ת���ٶȸ����ϡ� 
����ģ�Ͳ����ܹ�ʵ��Ӳ����·��������ܣ�ͬʱ�ܹ��������źŽ��м�⣬ 
�������źŲ������ֲ�Ҫ��ʱ����ʾ������Ϣ�� 
-------------------------------------------------------------------------*/ 
 
// ���A/D�����źŵ�Ƶ���Ƿ�̫�� 
     always @(posedge nbusy) 
       begin 
          #t12; 
          if (!nconvst)  
             begin  
               $display("Warning!  SHA Acquisition Time is too short!"); 
             end 
        //  else  $display(" SHA Acquisition Time is enough! "); 
       end 
 
// ���A/D�����źŵĸ��������Ƿ��㹻��̫�� 
   always @(negedge nconvst) 
     begin 
          wideth=$time; 
          @(posedge nconvst)  wideth=$time-wideth; 
          if (wideth<=500 || wideth > 10000) 
            begin 
              
             $display("nCONVST Pulse Width = %d",wideth);
             $display("Warning! nCONVST Pulse Width is too narrow or too wide!");
             //$stop; 
            end 
    end 
 
endmodule 
