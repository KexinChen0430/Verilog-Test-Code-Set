module string_test;
reg [8*14:1]stringvar;
initial begin
stringvar="Helloworld";
$display("%s is stored as %h", stringvar, stringvar);
stringvar={stringvar,"!!!"};
$display("%s is stored as %h", stringvar, stringvar);
end

reg [8*10:1]s1,s2;
initial begin
s1="Hello";
s2=" world!";
if ({s1,s2}=="Hello world!")
$display("strings are equal");
end

endmodule