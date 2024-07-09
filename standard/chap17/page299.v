`timescale 1 ms / 1 us
module a_dat;
initial
$printtimescale(b_dat.c1);
endmodule

`timescale 10 fs / 1 fs
module b_dat;
c_dat c1 ();
endmodule

`timescale 1 ns / 1 ns
module c_dat;

endmodule