module page248;

specify

$recrem( posedge clear, posedge clk, tREC, tREM );
$removal( posedge clear, posedge clk, tREM );
$recovery( posedge clear, posedge clk, tREC );

endspecify
endmodule