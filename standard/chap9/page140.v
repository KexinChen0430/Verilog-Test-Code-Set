module page140;

parameter d = 50;// d declared as a parameter and
reg [7:0] r;// r declared as an 8-bit reg
begin  // a waveform controlled by sequential delay
#d r = 'h35;
#d r = 'hE2;
#d r = 'h00;
#d r = 'hF7;
#d -> end_wave; //trigger an event called end_wave 
end 

begin
areg = breg;
creg = areg; // creg stores the value of breg
end

begin
areg = breg; 
@(posedge clock) creg = areg;// assignment delayed until
end // posedge on clock


endmodule