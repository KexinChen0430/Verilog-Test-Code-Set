module page56;

reg [31: 0] big_vect;
reg [0 :31] little_vect;

reg [63: 0] dword;
integer sel;
reg big_vect[ 0 +: 8];    // == big_vect[ 7 : 0]
reg big_vect[15 -: 8];    // == big_vect[15 : 8]
reg little_vect[ 0 +: 8]; // == little_vect[0 : 7]
reg little_vect[15 -: 8]; // == little_vect[8 :15]
reg dword[8*sel +: 8];    // variable part-select with fixed width

endmodule