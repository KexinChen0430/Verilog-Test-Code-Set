//------------- alu_Top.v -----------------
`timescale 1ns/1ns 
`include  "./alu.v" 
module    alutest; 
   wire[7:0] out; 
   reg[7:0]  a,b; 
   reg[2:0]  opcode; 
   parameter   times=5; 
   initial 
    begin    
        a={$random}%256;  //Give a radom number blongs to [0,255] . 
        b={$random}%256;  //Give a radom number blongs to [0,255]. 
        opcode=3'h0; 
        repeat(times) 
          begin 
          #100     a={$random}%256;  //Give a radom number. 
                   b={$random}%256;  //Give a radom number. 
                   opcode=opcode+1; 
          end
          
        #100  $stop;

   end

   alu    alu1(out,opcode,a,b);

endmodule