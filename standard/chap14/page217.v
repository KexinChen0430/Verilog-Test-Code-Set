module page217;

specify

if ( !reset && !clear )
( posedge clock => ( out +: in ) ) = (10, 8) ;

endspecify

specify
( posedge clk => ( q[0] : data ) ) = (10, 5);
( negedge clk => ( q[0] : data ) ) = (20, 12);
endspecify

specify
if (reset)
( posedge clk => ( q[0] : data ) ) = (15, 8);
if (!reset && cntrl)
( posedge clk => ( q[0] : data ) ) = (6, 2);
endspecify

endmodule