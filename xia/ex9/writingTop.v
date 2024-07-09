`timescale 1ns/100ps
`define clk_cycle 50 
module writingTop; 
  reg reset,clk; 
  reg[7:0] data,address; 
  wire ack,sda; 
   
  always #`clk_cycle  clk = ~clk; 
   
  initial 
    begin 
       clk=0; 
       reset=1; 
       data=0; 
       address=0; 
       #(2*`clk_cycle) reset=0; 
       #(2*`clk_cycle) reset=1; 
      #(100*`clk_cycle) $stop; 
    end 
     
  always @(posedge ack)      //���յ�Ӧ���źź󣬸�����һ��������� 
    begin 
       data=data+1; 
       address=address+1; 
    end       
  writing writing(.reset(reset),.clk(clk),.data(data), 
                  .address(address),.ack(ack),.sda(sda));   
endmodule       