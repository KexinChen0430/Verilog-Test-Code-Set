module page312;

reg [23:0] rand;
rand = $random % 60;

reg [23:0] rand;
rand = {$random} % 60;

endmodule