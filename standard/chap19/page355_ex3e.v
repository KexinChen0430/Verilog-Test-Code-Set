//     initial $display("second_block defined, first_block is not");

module test;
  `define last_result
  `define real_last
  `ifdef first_block
    `ifndef second_nest
       initial $display("first_block is defined");
    `else
       initial $display("first_block and second_nest defined");
    `endif
  `elsif second_block
     initial $display("second_block defined, first_block is not");
  `else
    `ifndef last_result
       initial $display("first_block, second_block,"
                        " last_result not defined.");
    `elsif real_last
       initial $display("first_block, second_block not defined,"
                        " last_result and real_last defined.");
    `else
       initial $display("Only last_result defined!");
   `endif
 `endif
endmodule