`timescale 1ns/1ns
`define timeslice 200 
module Signal(RESET,CLK,RD,WR,ADDR,ACK,DATA);  
output RESET;        //复位信号 
output CLK;          //时钟信号 
output RD,WR;        //读写信号 
output[10:0] ADDR;    //11位地址信号 
input ACK;           //读写周期的应答信号 
inout[7:0] DATA;      //数据线 
reg RESET; 
reg CLK; 
reg RD,WR; 
reg W_R;            //低位：写操作；高位：读操作  
reg[10:0] ADDR;   
reg[7:0]  data_to_eeprom; 
reg[10:0] addr_mem[0:255]; 
reg[7:0]  data_mem[0:255]; 
reg[7:0]  ROM[1:2048];  
integer i,j; 
integer OUTFILE; 
assign DATA = (W_R) ?  8'bz : data_to_eeprom ; 
 
//------------------------------------时钟信号输入------------------------------ 
always #(`timeslice/2) 
   CLK = ~CLK;  
//----------------------------------- 读写信号输入------------------------------ 
 
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
repeat(15)  //连续写15次数据 
      begin  
        #(5*`timeslice); 
     WR = 1;  
     #(`timeslice); 
     WR = 0; 
    @ (posedge ACK); 
     end 
    #(10*`timeslice); 
    W_R = 1;   //开始读操作 
    repeat(15)  //连续读15次数据  
      begin 
      #(5*`timeslice); 
      RD = 1; 
       #(`timeslice);
      RD = 0; 
       @ (posedge ACK); 
      end 
   end                  
//-----------------------------------------写操作----------------------------- 
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
//----------------------------------------读操作---------------------------- 
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
   $readmemh("./addr.dat",addr_mem); //地址数据存入地址存储器
   $readmemh("./data.dat",data_mem); //写入EEPROM的数据存入数据存储器 
end 
 
endmodule 
 
