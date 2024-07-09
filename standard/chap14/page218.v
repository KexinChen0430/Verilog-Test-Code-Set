module page218;

specify

if (C1) (IN => OUT) = (1,1);
ifnone (IN => OUT) = (2,2);
// add operation
if (opcode == 2'b00) (i1,i2 *> o1) = (25.0, 25.0);
// pass-through i1 operation
if (opcode == 2'b01) (i1 => o1) = (5.6, 8.0);
// pass-through i2 operation
if (opcode == 2'b10) (i2 => o1) = (5.6, 8.0);
// all other operations
ifnone (i2 => o1) = (15.0, 15.0);
(posedge CLK => (Q +: D)) = (1,1);
ifnone (CLK => Q) = (2,2);

endspecify

specify
if (a)(b => out) = (2,2);
if (b)(a => out) = (2,2);
ifnone (a => out) = (1,1);
(a => out) = (1,1);
endspecify

endmodule