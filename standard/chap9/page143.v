module page143;

initial begin
areg=0;//initializeareg
for (index = 0; index < size; index = index + 1)
 memory[index] = 0; //initialize memory word
end

initial begin
inputs='b000000;     // initializeattimezero
#10 inputs='b011001; //firstpattern
#10 inputs='b011011;//secondpattern
#10 inputs='b011000;//thirdpattern
#10 inputs='b001000;//lastpattern
end

always areg = ~areg;

always #half_period areg = ~areg;

endmodule