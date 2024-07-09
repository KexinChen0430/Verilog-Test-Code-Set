module driver (net_r);
output net_r; 
real r; 
wire [64:1] net_r = $realtobits(r); 
endmodule
module receiver (net_r); 
input net_r; 
wire [64:1] net_r; 
real r; 
initial assign r = $bitstoreal(net_r);
endmodule