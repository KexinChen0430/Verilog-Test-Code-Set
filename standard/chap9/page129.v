module page129;

reg [7:0] ir;
casez (ir)
8'b1???????: instruction1(ir);
8'b01??????: instruction2(ir);
8'b00010???: instruction3(ir);
8'b000001??: instruction4(ir);
endcase

reg [7:0] r, mask;
mask = 8'bx0x0x0x0;
casex (r ^ mask)
8'b001100xx: stat1;
8'b1100xx00: stat2;
8'b00xx0011: stat3;
8'bxx010100: stat4;
endcase

reg [2:0] encode ;
case (1)
encode[2] : $display("Select Line 2") ;
encode[1] : $display("Select Line 1") ;
encode[0] : $display("Select Line 0") ;
default $display("Error: One of the bits expected ON");
endcase

endmodule