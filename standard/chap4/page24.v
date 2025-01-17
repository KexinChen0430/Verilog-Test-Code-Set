module page24;

	wand w; // a scalar net of type "wand"
	tri [15:0] busa;// a three-state 16-bit bus
	trireg (small) storeit;// a charge storage node of strength small
	reg a; // a scalar reg
	reg[3:0] v; // a 4-bit vector reg made up of (from most to 
	// least significant)v[3], v[2], v[1], and v[0]
	reg signed [3:0] signed_reg; // a 4-bit vector in range -8 to 7
	reg [-1:4] b; // a 6-bit vector reg
	wire w1, w2;// declares two wires
	reg [4:0] x, y, z;// declares three 5-bit regs

	// page 25 examples
	trireg aa;                     // trireg net of charge strength medium

	trireg (small)signed [3:0] cap2;// signed 4-bit trireg vector of
										 // charge strength small 

endmodule