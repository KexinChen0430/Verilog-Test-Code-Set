
// original code had the comment after the define macro, which is modified
// Ϊ��С�� FIFO �������Ĳ��Թ�����,�� SRAM �ռ�Ϊ 8Byte
`define SRAM_SIZE 8
`timescale 1ns/1ns
 
//module fifo_interface(   
module sram(
  
            in_data,    //���û��������������� 
            out_data,   //���û��������������, 
            fiford,     //FIFO�������źţ��͵�ƽ��Ч 
            fifowr,     //FIFO д�����źţ��͵�ƽ��Ч 
            nfull, 
            nempty,
            
            address,    //�� SRAM �ĵ�ַ����
            sram_data,  //�� SRAM ��˫���������� 
            rd,         //SRAM ��ʹ�ܣ��͵�ƽ��Ч
            wr,         //SRAM дʹ�ܣ��͵�ƽ��Ч

            clk,        //ϵͳʱ���ź� 
            rst);       //ȫ�ָ�λ�źţ��͵�ƽ��Ч 
             
//�����û��Ŀ��������ź� 
input          fiford, fifowr, clk, rst; 
 
//�����û��������ź� 
input[7:0]     in_data;              
output[7:0]    out_data;             
                                     
 
reg[7:0]       in_data_buf,         //�������ݻ����� 
               out_data_buf;        //������ݻ����� 
 
//������û���״ָ̬ʾ�ź� 
output         nfull, nempty; 
reg            nfull, nempty; 
 
//����� SRAM �Ŀ����ź� 
output         rd, wr; 
 
//�� SRAM ��˫���������� 
inout[7:0]     sram_data; 
 
//����� SRAM �ĵ�ַ���� 
output[10:0]   address; 
reg[10:0]      address; 
 
//Internal Register   
reg[10:0]      fifo_wp,             //FIFO дָ�� 
               fifo_rp;             //FIFO ��ָ�� 
 
reg[10:0]      fifo_wp_next,        //fifo_wp ����һ��ֵ 
               fifo_rp_next;        //fifo_rp ����һ��ֵ 
 
reg            near_full, near_empty; 

reg[3:0]       state;               //SRAM ����״̬���Ĵ���
 
parameter       idle        = 'b0000, 
               read_ready  = 'b0100, 
               read        = 'b0101, 
               read_over   = 'b0111, 
               write_ready = 'b1000, 
               write       = 'b1001, 
               write_over  = 'b1011; 
 
//SRAM ����״̬�� 
always @(posedge clk or negedge rst) 
   if (~rst) 
      state <= idle; 
   else  
      case(state) 
         idle:                            //�ȴ��� FIFO �Ĳ��������ź� 
               if (fifowr==0 && nfull)    //�û�����д FIFO ����,�� FIFO δ�� 
                  state<=write_ready;   
               else if(fiford==0 && nempty)//�û������� FIFO����,�� FIFO δ�� 
                  state<=read_ready; 
               else                        //û�ö� FIFO ���������� 
                  state<=idle; 
 
         read_ready:                       //���� SRAM ���������ַ������ 
                  state <= read; 
                   
         read:                             //�ȴ��û�������ǰ������ 
               if (fiford == 1) 
                  state <= read_over;                  
               else 
                  state <= read; 
                   
         read_over:                        //�������� SRAM ��ַ�Ա�֤�����ȶ� 
                  state <= idle; 
                   
         write_ready:                      //���� SRAM ���������ַ������ 
                  state <= write; 
                   
         write:                            //�ȴ��û�������ǰд���� 
               if (fifowr == 1) 
                  state <= write_over;                 
               else 
                  state <= write;   

         write_over:         //�������� SRAM ��ַ��д�������Ա�֤�����ȶ� 
                  state <= idle; 
                   
         default: state<=idle; 
   endcase 
 
//���� SRAM ��������ź� 
assign rd = ~state[2];     //state Ϊ read_ready �� read �� read_over  
assign wr = (state == write) ? fifowr : 1'b1; 
 
always @(posedge clk) 
   if (~fifowr) 
      in_data_buf <= in_data; 
       
assign sram_data = (state[3]) ? //stateΪ write_ready�� write �� write_over  
                     in_data_buf : 8'hzz;   
                                                    
 
always @(state or fiford or fifowr or fifo_wp or fifo_rp) 
   if (state[2] || ~fiford)       
      address = fifo_rp; 
   else if (state[3] || ~fifowr)  
      address = fifo_wp; 
   else 
      address = 'bz; 
       
//���� FIFO ���� 
assign out_data = (state[2]) ?  
                     sram_data : 8'bz; 
 
always @(posedge clk) 
   if (state == read) 
      out_data_buf <= sram_data;   
 
 
//���� FIFO ��дָ�� 
always @(posedge clk or negedge rst) 
   if (~rst) 
      fifo_rp <= 0; 
   else if (state == read_over) 
      fifo_rp <= fifo_rp_next; 
       
always @(fifo_rp) 
   if (fifo_rp == `SRAM_SIZE-1)
      fifo_rp_next = 0; 
   else 
      fifo_rp_next = fifo_rp + 1; 
 
always @(posedge clk or negedge rst) 
   if (~rst) 
      fifo_wp <= 0; 
   else if (state == write_over) 
      fifo_wp <= fifo_wp_next; 
       
always @(fifo_wp) 
   if (fifo_wp == `SRAM_SIZE-1) 
      fifo_wp_next = 0; 
   else 
      fifo_wp_next = fifo_wp + 1; 
       
 
always @(posedge clk or negedge rst) 
   if (~rst) 
      near_empty <= 1'b0; 
   else if (fifo_wp == fifo_rp_next) 
      near_empty <= 1'b1; 
   else 
      near_empty <= 1'b0; 
 
always @(posedge clk or negedge rst) 
   if (~rst) 
      nempty <= 1'b0; 
   else if (near_empty && state == read) 
      nempty <= 1'b0; 
   else if (state == write) 
      nempty <= 1'b1; 
       
always @(posedge clk or negedge rst) 
   if (~rst) 
      near_full <= 1'b0; 
   else if (fifo_rp == fifo_wp_next) 
      near_full <= 1'b1; 
   else 
      near_full <= 1'b0; 
 
always @(posedge clk or negedge rst) 
   if (~rst) 
      nfull <= 1'b1;
   else if (near_full && state == write) 
      nfull <= 1'b0; 
   else if (state == read) 
      nfull <= 1'b1; 
 
endmodule 
                                 