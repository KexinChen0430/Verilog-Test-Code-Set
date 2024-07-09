
`define FIFO_SIZE 8 
`include "./sram.v"  //  �еķ��湤�߲���Ҫ������,  ֻҪ sram.v ģ���������Ϳ����� 
`timescale 1ns/1ns 
 
module t; 
 
reg [7:0]      in_data;             //FIFO �������� 
reg            fiford,fifowr;       //FIFO �����ź� 
 
wire[7:0]      out_data;       

wire           nfull, nempty;       //FIFO ״̬�ź�
 
reg            clk,rst;              
       
wire[7:0]      sram_data;           //SRAM �������� 
wire[10:0]     address;             //SRAM �ĵ�ַ���� 
wire           rd,wr;               //SRAM ��д�����ź� 
 
reg [7:0]      data_buf[`FIFO_SIZE:0]; //���ݻ��棬���ڽ������� 
integer index;                      //���ڶ�д data_buf ��ָ�� 
 
//ϵͳʱ�� 
initial  clk=0; 
always   #25 clk=~clk; 
 
//���Լ������� 
initial 
   begin 
      fiford=1; 
      fifowr=1; 
      rst=1; 
      #40 rst=0; 
      #42 rst=1; 
 
      if (nempty) $display($time,"Error: FIFO be empty, nempty should be low.\n"); 
       
      //���д FIFO    
      index = 0; 
      repeat(`FIFO_SIZE) begin 
         data_buf[index]=$random; 
         write_fifo(data_buf[index]); 
         index = index + 1; 
      end 
       
      if (nfull) $display($time,"Error: FIFO full, nfull should be low.\n"); 
      repeat(2) write_fifo($random); 
      #200 
       
      //����� FIFO 
      index=0; 
      read_fifo_compare(data_buf[index]); 
      if (~nfull) $display($time,"Error: FIFO not full, nfull should be high.\n"); 
       
      repeat(`FIFO_SIZE-1) begin 

         index = index + 1;
         read_fifo_compare(data_buf[index]); 
      end 
       
      if (nempty) $display($time,"Error: FIFO be empty, nempty should be low.\n"); 
       
      repeat(2) read_fifo_compare(8'bx); 
       
      reset_fifo; 
       
      //д���� FIFO 
      repeat(`FIFO_SIZE*2) 
      begin 
         data_buf[0] = $random; 
         write_fifo(data_buf[0]);       
         read_fifo_compare(data_buf[0]); 
      end 
       
      //�쳣���� 
      reset_fifo; 
      read_fifo_compare(8'bx); 
      write_fifo(data_buf[0]); 
      read_fifo_compare(data_buf[0]); 
       
      $stop;       
  end 
 
fifo_interface  fifo_interface( 
               .in_data(in_data),.out_data(out_data), 
               .fiford(fiford),.fifowr(fifowr), 
               .nfull(nfull),.nempty(nempty), 
               .address(address),.sram_data(sram_data), 
               .rd(rd),.wr(wr), 
               .clk(clk),.rst(rst) 
      ); 
 
sram m1( .Address(address), 
         .Data(sram_data), 
         .SRG(rd),          //SRAM ��ʹ�� 
         .SRE(1'b0),        //SRAM Ƭѡ,����Ч 
         .SRW(wr));        //SRAM дʹ�� 
 
task write_fifo; 
input [7:0] data; 
begin
         in_data=data; 
   #50   fifowr=0;             //�� SRAM ��д�� 
   #200  fifowr=1; 
   #50;   
end 
endtask 
 
task read_fifo_compare; 
input [7:0] data; 
begin 
   #50   fiford=0;             //�� SRAM �ж���  
   #200  fiford=1; 
         if (out_data != data)  
            $display($time,"Error: Data retrieved (%h) not match the one stored (%h). \n", 
                     out_data, data); 
          
   #50;            
end 
endtask 
 
task reset_fifo; 
begin 
   #40 rst=0; 
   #40 rst=1; 
end 
endtask 
 
endmodule  
