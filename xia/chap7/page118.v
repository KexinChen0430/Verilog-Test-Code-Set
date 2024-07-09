module  fsm (Clock, Reset, A,  F, G);
input Clock, Reset, A; 
output F,G; 
reg [1:0] state, Nextstate; 
 
parameter   Idle  = 2'b00,  Start = 2'b01,
Stop = 2'b10, Clear = 2'b11;
always @(posedge Clock) 
if (!Reset) 
begin  
state <= Idle; 
end 
else 
 state <= Nextstate; 
always @( state or A ) 
begin 
F=0;
G=0; 
 if (state == Idle) 
begin 
 if (A) 
Nextstate  =  Start; 
else  
Nextstate  =  Idle; 
G=1; 
end 
else  
 if (state == Start) 
if (!A) 
Nextstate  =  Stop; 
else  
Nextstate  =  Start; 
 
else  
 if (state == Stop) 
if (A) 
Nextstate  =  Clear; 
else  
Nextstate  =  Stop; 
 
else  
 if (state == Clear) 
begin 
if (!A) 
Nextstate  =  Idle; 
else  
Nextstate  =  Clear;  
F=1; 
end 
else 
 Nextstate= Idle; 
end 
 
endmodule