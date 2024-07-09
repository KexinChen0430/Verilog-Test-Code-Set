module page127;

reg [15:0]rega;
reg [9:0] result;
case (rega)
16'd0:result=10'b0111111111;
16'd1:result=10'b1011111111;
16'd2:result=10'b1101111111;
16'd3:result=10'b1110111111;
16'd4:result=10'b1111011111;
16'd5:result=10'b1111101111;
16'd6:result=10'b1111110111;
16'd7:result=10'b1111111011;
16'd8:result=10'b1111111101;
16'd9:result=10'b1111111110;
default result='bx;
endcase

// page 128
case (select[1:2])
2'b00:result=0;
2'b01:result=flaga;
2'b0x,
2'b0z:result=flaga?'bx:0;
2'b10:result=flagb;
2'bx0,
2'bz0:result=flagb?'bx:0;
default result='bx;
endcase

case (sig)
1'bz: $display("signal is floating");
1'bx: $display("signal is unknown");
default: $display("signal is %b", sig);
endcase

endmodule