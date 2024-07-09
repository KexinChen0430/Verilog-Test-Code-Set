module evaluates2 (out);
output out;
reg a, b, c;
initial begin
a = 0;
b = 1;
c = 0;
end
always c = #5 ~c;

always @(posedge c) begin
a <= b; // evaluates, schedules,
b <= a; // and executes in two steps
end
endmodule

//non_block1.v
module non_block1;
reg a, b, c, d, e, f;
//blocking assignments
initial begin
a = #10 1; // a will be assigned 1 at time 10
b = #2 0; // b will be assigned 0 at time 12
c = #4 1; // c will be assigned 1 at time 16
end
//non-blocking assignments
initial begin
d <= #10 1; // d will be assigned 1 at time 10
e <= #2 0; // e will be assigned 0 at time 2
f <= #4 1; // f will be assigned 1 at time 4
end
endmodule
