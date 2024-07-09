module page150;

begin : block_name
rega = regb;
disable block_name;
regc = rega; // this assignment will never execute
end

begin : break
for (i = 0; i < n; i = i+1) begin : continue
@clk
if (a == 0) // "continue" loop
disable continue;
@clk
if (a == b) // "break" from loop
disable break;
end
end

endmodule