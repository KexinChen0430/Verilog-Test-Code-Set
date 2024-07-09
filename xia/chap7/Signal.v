`timescale 1ns/1ns
`define timeslice 200 
module Signal(RESET,CLK,RD,WR,ADDR,ACK,DATA);  
output RESET;        //��λ�ź� 
output CLK;          //ʱ���ź� 
output RD,WR;        //��д�ź� 
output[10:0] ADDR;    //11λ��ַ�ź� 
input ACK;           //��д���ڵ�Ӧ���ź� 
inout[7:0] DATA;      //������ 
reg RESET; 
reg CLK; 
reg RD,WR; 
reg W_R;            //��λ��д��������λ��������  
reg[10:0] ADDR;   
reg[7:0]  data_to_eeprom; 
reg[10:0] addr_mem[0:255]; 
reg[7:0]  data_mem[0:255]; 
reg[7:0]  ROM[1:2048];  
integer i,j; 
integer OUTFILE; 
assign DATA = (W_R) ?  8'bz : data_to_eeprom ; 
 
//------------------------------------ʱ���ź�����------------------------------ 
always #(`timeslice/2) 
   CLK = ~CLK;  
//----------------------------------- ��д�ź�����------------------------------ 
 
initial  
   begin 
     RESET = 1; 
     i   = 0;  
     j   =0; 
     W_R = 0; 
     CLK = 0;        
     RD  = 0; 
     WR  = 0; 
     #1000 ; 
     RESET = 0;  
repeat(15)  //����д15������ 
      begin  
        #(5*`timeslice); 
     WR = 1;  
     #(`timeslice); 
     WR = 0; 
    @ (posedge ACK); 
     end 
    #(10*`timeslice); 
    W_R = 1;   //��ʼ������ 
    repeat(15)  //������15������  
      begin 
      #(5*`timeslice); 
      RD = 1; 
       #(`timeslice);
      RD = 0; 
       @ (posedge ACK); 
      end 
   end                  
//-----------------------------------------д����----------------------------- 
initial  
  begin 
    $display("writing-----writing-----writing-----writing"); 
    # (2*`timeslice); 
    for(i=0;i<=15;i=i+1) 
      begin 
       ADDR = addr_mem[i];                  
       data_to_eeprom = data_mem[i];     
       $fdisplay(OUTFILE,"@%0h  %0h",ADDR, data_to_eeprom); 
       @(posedge ACK) ;             
     end 
 end    
//----------------------------------------������---------------------------- 
initial 
  @(posedge W_R) 
   begin 
    ADDR = addr_mem[0]; 
    $fclose(OUTFILE); 
    $readmemh("./eeprom.dat",ROM);  
    $display("Begin READING-----READING-----READING-----READING"); 
     for(j = 0; j <= 15; j = j+1)          
     begin 
        ADDR = addr_mem[j];           
        @(posedge ACK); 
        if(DATA == ROM[ADDR]) 
          $display("DATA %0h == ROM[%0h]---READ RIGHT",DATA,ADDR); 
        else 
          $display("DATA %0h != ROM[%0h]---READ WRONG",DATA,ADDR);      
     end 
  end    
 
initial 
  begin 
   OUTFILE = $fopen("./eeprom.dat"); 
   $readmemh("./addr.dat",addr_mem); //��ַ���ݴ����ַ�洢��
   $readmemh("./data.dat",data_mem); //д��EEPROM�����ݴ������ݴ洢�� 
end 
 
endmodule 
 
