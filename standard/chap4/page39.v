module page39 (output [7:0] DOUT, input [7:0] DIN, input [5:0] ADR,
input WE, CE);

specparam dhold = 1.0;
specparam ddly = 1.0;

parameter width = 1;


specify
specparam tRise_clk_q = 150, tFall_clk_q = 200;
specparam tRise_control = 40, tFall_control = 50;
endspecify

endmodule