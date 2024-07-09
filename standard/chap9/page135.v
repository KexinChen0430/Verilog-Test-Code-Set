module page135;

always @(*)  // equivalent to @(a or b or c or d or f)
y = (a & b) | (c & d) | myfunction(f);

always @* begin // equivalent to @(a or b or c or d or tmp1 or tmp2)
tmp1 = a & b; 
tmp2 = c & d;
y = tmp1 | tmp2;
end

 always @* begin  // equivalent to @(b)
@(i) kid = b;  // i is not added to @*
end

 always @* begin  // equivalent to @(a or b or c or d)
x = a ^ b;
@*             // equivalent to @(c or d)
x = c ^ d;
end

always @* begin  // same as @(a or en)
y = 8'hff;
y[a] = !en;
end

always @* begin  // same as @(state or go or ws)
next = 4'b0;
case (1'b1)
state[IDLE]: if (go)next[READ] = 1'b1;
  else next[IDLE] = 1'b1;
state[READ]: next[DLY ] = 1'b1;
state[DLY ]: if (!ws)next[DONE] = 1'b1;
  else next[READ] = 1'b1;
state[DONE]: next[IDLE] = 1'b1;
endcase
end

endmodule