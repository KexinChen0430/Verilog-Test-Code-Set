`define WIDTH 3
`define WIDTHR 4
module test(a, b, c);
    input a[`WIDTHR:0];
    input b;
    output c;
    assign c = a|~b;
endmodule