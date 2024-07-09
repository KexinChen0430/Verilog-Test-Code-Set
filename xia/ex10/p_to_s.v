// ----------------   p_to_s.v ---------------------------------
module p_to_s(D_in,T0,data,SEND,ESC,ADD_100); 
 output       D_in,T0;            // D_in是串行输出，T0是移位时钟并给 
                                      // CPU中断，以确定何时给出下个数据。 
 input [7:0] data;               //并行输入的数据。 
 input       SEND,ESC,ADD_100;   //SEND、ESC共同决定是否进行并到串 
                                      //的数据转化。ADD_100决定何时置数。 
 wire        D_in,T0; 
 reg [7:0] DATA_Q,DATA_Q_buf; 
 
 assign       T0 = ! (SEND & ESC);      //形成移位时钟。. 
 assign       D_in = DATA_Q[7];         //给出串行数据。 
 
 always @(posedge T0 or negedge ADD_100)  //ADD_100下沿置数，T0上沿移位。 
   begin 
     if(!ADD_100)
       DATA_Q = data; 
     else 
       begin 
       DATA_Q_buf = DATA_Q<<1;        //DATA_Q_buf作为中介，以令综合器 
       DATA_Q   = DATA_Q_buf;           //能辨明。 
       end 
   end 
 
endmodule    