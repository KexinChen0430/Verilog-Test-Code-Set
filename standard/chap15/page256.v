module page251;

specify

$width (posedge clk, 6, 0, ntfr_reg);

// Legal Calls
$width ( negedge clr, lim );
$width ( negedge clr, lim, thresh, notif );
$width ( negedge clr, lim, 0, notif );

endspecify
endmodule