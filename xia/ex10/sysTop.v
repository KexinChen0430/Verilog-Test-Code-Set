//-------------Top test file for sys.v ------------------
`timescale 1ns/100ps 
`include "./sys.v" 
module Top; 
 reg D_out,SEND,ESC,DSC,TAKE,ADD_100,ADD_101; 
 reg[7:0] data_buf; 
 wire [7:0] data; 
 wire clk2; 
 
 assign  data = (ADD_101) ? data_buf : 8'bz;    
                                 //data在sys中是inout型变量，ADD_101 
                                 //控制data是作为输入还是进行输出。 
assign  clk2 =DSC && TAKE; 
 
initial   
  begin 
     SEND = 0; 
     ESC = 0; 
     DSC = 1; 
     TAKE = 1; 
     ADD_100 = 1; 
     ADD_101 = 1; 
  end 
initial
  begin 
    data_buf = 8'b10000001; 
    #90 ADD_100 = 0; 
    #100 ADD_100 = 1; 
  end 
 
always  
  begin 
    #50; 
    SEND = ~SEND; 
    ESC = ~ESC;
  end 
 
initial 
  begin 
    #1500 ; 
    SEND = 0; 
    ESC  = 0; 
    DSC  = 1; 
    TAKE = 1; 
    ADD_100 = 1; 
    ADD_101 = 1; 
    D_out = 0;     
    #1150 ADD_101 = 0; 
    #100 ADD_101 =1; 
    #100 $stop; 
  end 
   

always  
  begin 
    #50 ; 
    DSC = ~DSC; 
    TAKE = ~TAKE; 
  end 
   
always @(negedge clk2) D_out = ~D_out; 
 
sys    sys(.D_in(D_in),.T0(T0),.T1(T1),.data(data),.D_out(D_out), 
              .ADD_101(ADD_101), .SEND(SEND),.ESC(ESC),.DSC(DSC), 
                                   .TAKE(TAKE),.ADD_100(ADD_100));   
endmodule 
          