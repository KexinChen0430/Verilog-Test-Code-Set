module page132;

// Example 1¡ªThe following example delays the execution of the assignment by 10 time units:
#10 rega = regb;

// Example 2¡ªThe next three examples provide an expression following the number sign (#). Execution of the
// assignment is delayed by the amount of simulation time specified by the value of the expression.

#d rega = regb;// d is defined as a parameter
#((d+e)/2) rega = regb;// delay is average of d and e
#regr regr = regr + 1;// delay is the value in regr

endmodule