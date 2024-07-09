`timescale 1ns/100ps
 
module  testcon3ad; 
  wire  wr, 
        enin, 
        enout1, 
        enout2; 
  wire[10:0] address;        
  reg   clk, 
        reset, 
        start, // original file has a semicolon here, assume to be an error 
        rd;
  wire  nbusy1,
        nbusy2, 
        nbusy3; 
         
  wire nconvst1, 
       nconvst2, 
       nconvst3; 
  wire[7:0] indata; 
  wire[7:0] outdata; 
   
  parameter HALF_PERIOD=15;//时钟周期为30ns 
   
  initial 
    begin 
         clk=1; 
         forever #HALF_PERIOD clk=~clk; 
    end 
      
  initial 
    begin 
         reset=1; 
         #110 reset=0; 
         #140 reset=1; 
    end 
  initial 
    begin 
         start=0; 
         rd=1; 
         #420 start=1; 
         #120 start=0;  
         #107600 start=1;
         #150   start=0;
    end
           
  assign enin=1; 

  con3ad con3ad(.indata(indata),.outdata(outdata),.address(address), 
                .CLK(clk),.reset(reset),.start(start), 
                .nconvst1(nconvst1),.nconvst2(nconvst2),.nconvst3(nconvst3), 
                .nbusy1(nbusy1),.nbusy2(nbusy2),.nbusy3(nbusy3), 
                .wr(wr),.enout1(enout1),.enout2(enout2)); 
            
  sram ramlow(.Address(address),.Data(outdata),.SRW(wr),.SRG(rd),.SRE(enout1)); 
 
  adc  ad_1(.nconvst(nconvst1),.nbusy(nbusy1),. data(indata)); 
  adc  ad_2(.nconvst(nconvst2),.nbusy(nbusy2),. data(indata)); 
  adc  ad_3(.nconvst(nconvst3),.nbusy(nbusy3),. data(indata)); 
   
endmodule 
