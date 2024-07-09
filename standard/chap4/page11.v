//如果无符号数的大小小于为该常数指定的大小，
// 则无符号数应向左侧填充为零。
// 如果无符号数字中最左边的位是x或z，则应使用x或z分别向左边填充。
// 如果无符号数的大小大于为该常数指定的大小，则应从左侧截断无符号数。
module page11(
  a, b, c, d, e, f, g
);
	output [11:0] a, b, c, d;
	output [84:0] e, f, g; 
	
	assign a = 'd x;  // yields xxx
	assign b = 'h 3x;  // yields 03x
	assign c = 'h z3;  // yields zz3
	assign d = 'h 0z3; // yields 0z3
	
	assign e = 'h5;        // yields {82{1'b0},3'b101}
	assign f = 'hx;        // yields {85{1'hx}}
	assign g = 'hz;        // yields {85{1'hz}}


endmodule