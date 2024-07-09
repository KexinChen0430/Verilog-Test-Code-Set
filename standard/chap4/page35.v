module page35;

wire [7:0] mema[0:255]; 
wire arrayb[7:0][0:255]; 

time chng_hist[1:1000];
integer t_index;


assign mema[1] = 0; 
assign arrayb[1][0] = 0;
initial
	chng_hist[t_index] = $time;

endmodule