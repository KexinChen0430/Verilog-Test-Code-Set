//--------------------------- testcon1.v -------------------
`timescale 100ps/100ps
module  testcon1;
  wire  wr,
        enin,
        enout1,
        enout2;
  wire[10:0] address;
  reg  rd,
       CLK,
       reset,
       start;
  wire  nbusy;
  wire nconvst;
  wire[7:0] indata;
    wire[7:0] outdata;
  integer i;

  parameter HALF_PERIOD=1000;

  //����10KHZ��ʱ��
  initial
    begin
         rd=1;
         i=0;
         CLK=1;
         forever #HALF_PERIOD CLK=~CLK;
    end
  //������λ�ź�
  initial
    begin
         reset=1;
         #(HALF_PERIOD*2 + 50) reset=0;
         #(HALF_PERIOD*3) reset=1; 
    end 
  //������ʼ��������ź�   
    initial
    begin 
         start=0; 
         #(HALF_PERIOD*7 + 20) start=1; 
         #(HALF_PERIOD*2) start=0;  
         #(HALF_PERIOD*1000) start=1; 
         #(HALF_PERIOD*2)   start=0; 
    end 
           
  assign enin =1; 
      
  con1 con(.address(address),.indata(indata),.outdata(outdata),.wr(wr), 
                .nconvst(nconvst),.nbusy(nbusy),.enout1(enout1), 
           .enout2(enout2),.CLK(CLK),.reset(reset),.start(start)); 
 
  sram ramlow(.Address(address),.Data(outdata),.SRW(wr),.SRG(rd),.SRE(enout1)); 
  adc  adc(.nconvst(nconvst),.nbusy(nbusy),. data(indata)); 
   
endmodule 
