// [Àý2]:
module  fsm (Clock, Reset, A,  F, G);
input Clock, Reset, A;
output F,G;
reg F,G;
reg [3:0] state ;

parameter   Idle     = 4'b1000,
Start    = 4'b0100,
Stop     = 4'b0010,
Clear    = 4'b0001;
 
always @(posedge clock) 
if (!Reset) 
begin  
state <= Idle;  F<=0; G<=0; 
end 
else 
case (state) 
Idle:  begin  
if (A)  begin  
          state <= Start; 
            G<=0; 
        end
else state <= Idle;
end
Start: if (!A)  state <= Stop;
       else  state <= Start;
Stop:  begin
if (A) begin
        state <= Clear;
        F <= 1;
      end
else  state <= Stop;
end
Clear: begin
if (!A)  begin
           state <=Idle;
           F<=0;  G<=1;
         end
else   state <= Clear;
end
default:  state <=Idle;
endcase
endmodule
