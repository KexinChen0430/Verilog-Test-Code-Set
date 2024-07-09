module page229;

specify
(clk => q) = 12;
(data => q) = 10;
(clr, pre *> q) = 4;
specparam
PATHPULSE$clk$q = (2,9),
PATHPULSE$clr$q = (0,4),
PATHPULSE$ = 3;
endspecify

endmodule