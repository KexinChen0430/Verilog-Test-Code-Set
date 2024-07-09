//------------------- sys.v ---------------------------
`include "./p_to_s.v" 
`include "./s_to_p.v" 
module sys(D_in,T0,T1, data, D_out,SEND,ESC,DSC,TAKE,ADD_100,ADD_101); 
  input         D_out,SEND,ESC,DSC,TAKE,ADD_100,ADD_101; 
  inout  [7:0]  data; 
  output        D_in,T0,T1; 

  p_to_s   p_to_s(.D_in(D_in),.T0(T0),.data(data), 
                .SEND(SEND),.ESC(ESC),.ADD_100(ADD_100)); 
  s_to_p   s_to_p(.T1(T1),.data(data),.D_out(D_out), 
          .DSC(DSC),.TAKE(TAKE),.ADD_101(ADD_101)); 
   
endmodule   