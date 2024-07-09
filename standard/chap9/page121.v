//non_block1.v
module non_block1;
reg a, b;
initial begin
a = 0;
b = 1;
a <= b; // evaluates, schedules, and
b <= a; // executes in two steps
end
initial begin
// remove an ampty argument
// $monitor ($time, ,"a = %b b = %b", a, b);
$monitor ($time, "a = %b b = %b", a, b);
#100 $finish;
end
endmodule
