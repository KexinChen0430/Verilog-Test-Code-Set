module page134;

@(trig or enable) rega = regb; // controlled by trig or enable
@(posedge clk_a or posedge clk_b or trig) rega = regb;

// comma (,) as an event logical or operator

 always @(a, b, c, d, e)          rega = regb;
always @(posedge clk, negedge rstn)    rega = regb;
always @(a or b, c, d or e)       rega = regb;

endmodule