module writing(reset,clk,address,data,sda,ack);
  input reset,clk; 
  input[7:0] data,address; 
   
  output sda,ack; //sda负责串行数据输出； 
           //ack 是一个对象操作完毕后，模块给出的应答信号。 
  reg link_write; //link_write 决定何时输出。 
  reg[3:0] state; //主状态机的状态字。 
  reg[4:0] sh8out_state; //从状态机的状态字。 
  reg[7:0] sh8out_buf;    //输入数据缓冲。 
  reg finish_F;           //用以判断是否处理完一个操作对象。 
  reg ack; 
   
  parameter 
    idle=0,addr_write=1,data_write=2,stop_ack=3; 
  parameter 
    bit0=1,bit1=2,bit2=3,bit3=4,bit4=5,bit5=6,bit6=7,bit7=8;  
   
  assign   sda = link_write? sh8out_buf[7] : 1'bz; 
  

  always @(posedge clk) 
    begin 
      if(!reset)               //复位。 
        begin 
          link_write<= 0; 
          state    <= idle; 
          finish_F <= 0; 
          sh8out_state<=idle; 
                ack<= 0; 
          sh8out_buf<=0; 
        end 
      else 
        case(state) 
         
        idle:                        
          begin 
            link_write  <= 0; 
            state    <= idle; 
            finish_F <= 0; 
            sh8out_state<=idle; 
                  ack<= 0; 
            sh8out_buf<=address;   
            state    <= addr_write; 
          end 

        addr_write:         //地址的输入。 
          begin 
            if(finish_F==0) 
              begin  shift8_out; end 
            else 
              begin 
                sh8out_state <= idle; 
                sh8out_buf   <= data; 
                       state <= data_write; 
                    finish_F <= 0; 
              end 
          end 
         
        data_write:       //数据的写入。 
          begin 
            if(finish_F==0)  
              begin  shift8_out; end 
            else 
              begin 
                 link_write <= 0; 
                      state <= stop_ack; 
                   finish_F <= 0;   
                        ack <= 1; 
              end 
          end              
        stop_ack:             //完成应答。
          begin 
              ack <= 0; 
            state <= idle; 
          end 
         
        endcase        
    end                         
                
task shift8_out;                //串行写入。 
  begin 
    case(sh8out_state) 
     
    idle:  
      begin 
        link_write  <= 1; 
       sh8out_state <= bit0; 
     end
     
    bit0: 
      begin 
          link_write <= 1; 
        sh8out_state <= bit1;                            
          sh8out_buf <= sh8out_buf<<1; 
      end 
     
    bit1: 
      begin 
        sh8out_state<=bit2; 
        sh8out_buf<=sh8out_buf<<1; 
      end 
       
    bit2: 
      begin 
        sh8out_state<=bit3; 
        sh8out_buf<=sh8out_buf<<1; 
      end 
    bit3:
      begin 
        sh8out_state<=bit4; 
        sh8out_buf<=sh8out_buf<<1; 
      end 
     
    bit4: 
      begin 
        sh8out_state<=bit5; 
        sh8out_buf<=sh8out_buf<<1; 
      end 
     
    bit5: 
      begin 
        sh8out_state<=bit6; 
        sh8out_buf<=sh8out_buf<<1; 
      end 
     
    bit6: 
      begin 
        sh8out_state<=bit7; 
        sh8out_buf<=sh8out_buf<<1; 
      end                       
    bit7:
      begin 
        link_write<= 0; 
        finish_F<=finish_F+1;       
      end   
       
    endcase 
  end 
endtask 
 
endmodule               