module page138;

fork
#5 a = b; 
#5 b = a;
join

fork // data swap
a = #5 b;
b = #5 a; 
join

fork // data shift
a = @(posedge clk) b;
b = @(posedge clk) c;
join

a <= repeat(5) @(posedge clk) data;

a = repeat(num) @(clk) data;

a <= repeat(a+b) @(posedge phi1 or negedge phi2) data;

endmodule