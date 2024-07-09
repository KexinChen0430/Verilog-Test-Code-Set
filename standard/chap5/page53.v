module shift;
reg [3:0] start, result;
initial begin
start = 1;
result = (start << 2);
end
endmodule


module ashift;
reg signed [3:0] start, result;
initial begin
start = 4'b1000;
result = (start >>> 2);
end
endmodule