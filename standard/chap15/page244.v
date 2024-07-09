module page244;

specify
$setuphold( posedge clk, data, tSU, tHLD );

$setup( data, posedge clk, tSU );
$hold( posedge clk, data, tHLD );
endspecify

endmodule