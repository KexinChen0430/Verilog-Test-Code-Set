`timescale1ns/1ns
module register(r,clk,data,ena,rst); 
output [7:0] r; 
input [7:0] data; 
input clk, ena, rst; 
wire load; 
and  a1(load,clk,ena); 
DFF  d7(r[7],,load,data[7],rst); 
DFF  d6(r[6],,load,data[6],rst); 
DFF  d5(r[5],,load,data[5],rst); 
DFF  d4(r[4],,load,data[4],rst); 
DFF  d3(r[3],,load,data[3],rst); 
DFF  d2(r[2],,load,data[2],rst); 
DFF  d1(r[1],,load,data[1],rst); 
DFF  d0(r[0],,load,data[0],rst); 
endmodule 