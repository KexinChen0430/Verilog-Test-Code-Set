module async_array(a1,a2,a3,a4,a5,a6,a7,b1,b2,b3);
input a1, a2, a3, a4, a5, a6, a7 ;
output b1, b2, b3;
reg [1:7] mem[1:3]; // memory declaration for array personality
reg b1, b2, b3;
initial begin
// set up the personality from the file array.dat
$readmemb("array.dat", mem);
// set up an asynchronous logic array with the input
// and output terms expressed as concatenations  
$async$and$array(mem,{a1,a2,a3,a4,a5,a6,a7},{b1,b2,b3});
end
endmodule


module sync_array(a1,a2,a3,a4,a5,a6,a7,b1,b2,b3,clk);
input a1, a2, a3, a4, a5, a6, a7, clk;
output b1, b2, b3;
reg [1:7] mem[1:3]; // memory declaration
reg b1, b2, b3;
initial begin
// set up the personality
$readmemb("array.dat", mem);
// set up a synchronous logic array to be evaluated
   // when a positive edge on the clock occurs 
forever @(posedge clk)
$async$and$array(mem,{a1,a2,a3,a4,a5,a6,a7},{b1,b2,b3});
end
endmodule

module pla;
`define rows 4
`define cols 3
reg [1:`cols] a, mem[1:`rows];
reg [1:`rows] b;
initial begin
// PLA system call
$async$and$plane(mem,a[1:3],b[1:4]);
mem[1] = 3'b10?;
mem[2] = 3'b??1;
mem[3] = 3'b0?0;
mem[4] = 3'b???;
// stimulus and display
#10 a = 3'b111;
#10 $displayb(a, " -> ", b);
#10 a = 3'b000;
#10 $displayb(a, " -> ", b);
#10 a = 3'bxxx;
#10 $displayb(a, " -> ", b);
#10 a = 3'b101;
#10 $displayb(a, " -> ", b);
end
endmodule