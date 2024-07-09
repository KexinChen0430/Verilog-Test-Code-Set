
/********************************************************** 
*   Behavior of a 5-bit counter 
***********************************************************/ 
`timescale 1ns/1ns 
module counter (cnt, clk, data, rst, load); 
output [4:0] cnt; 
input [4:0] data; 
input clk, rst, load; 
reg [4:0] cnt; 
 
//asynchronous reset 
always @(rst) 
begin 
if(rst==0) 
cnt<=5'h00; 
wait(rst!=0); 
end 
 
always @(posedge clk) 
if (load==1)  //load counter 
cnt <= data; 
else  //(load!=1) therefore increment 
if(cnt==5'h1F) //counter roll over 
begin 
cnt<=5'h00; 
end 
else 
cnt<=cnt+1; 
endmodule 
 

 

