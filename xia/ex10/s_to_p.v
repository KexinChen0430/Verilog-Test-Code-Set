//--------------------- s_to_p.v ---------------------------
module s_to_p(T1, data, D_out,DSC,TAKE,ADD_101); 
       output       T1;                     //给CPU中断，以确定CPU何时取转化 
                                            //得到的并行数据。               
       output [7:0] data;                  
       input   D_out, DSC, TAKE, ADD_101;  //D_out提供输入串行数据。DSC、TAKE 
                                           //共同决定何时取数。            
       wire   [7:0] data; 
       wire         T1,clk2;  
       reg    [7:0] data_latch, data_latch_buf; 
        
       assign       clk2 = DSC  & TAKE ;   //提供移位时钟。        
       assign       T1 = !clk2; 
        
       assign       data =  (!ADD_101) ? data_latch : 8'bz;     
       always@(posedge clk2) 
            begin 
               data_latch_buf = data_latch << 1;   //data_latch_buf作缓冲 
               data_latch     = data_latch_buf;   //，以令综合器能辩明。 
                data_latch[0] = D_out; 
           end 
endmodule 