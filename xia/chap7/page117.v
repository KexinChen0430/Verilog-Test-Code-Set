module  fsm (Clock, Reset, A,  F, G);
input Clock, Reset, A; 
output F,G; 
reg [1:0] state ; 
wire [1:0] Nextstate; 
 
parameter   Idle  = 2'b00,  Start = 2'b01,   
 Stop = 2'b10,   Clear = 2'b11;
 
always @(posedge Clock) 
if (!Reset) 
begin  
state <= Idle; 
end 
else 
 state <= Nextstate; 
 
 
assign Nextstate = ( state == Idle ) ?   (  A ?  Start  : Idle  ) : 
 ( state==Start ) ?   ( !A ?  Stop  : Start )  : 
 ( state== Stop ) ?   (  A ?  Clear : Stop )   : 
 ( state== Clear) ?   ( !A ?  Idle   : Clear)  : Idle; 
 
assign   F  = (( state == Stop) && A ); 
assign   G =  (( state == Clear) && (!A || !Reset)); 
 
endmodule  
