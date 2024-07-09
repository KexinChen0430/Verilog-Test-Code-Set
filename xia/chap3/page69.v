module page69;

reg[7:0]V;
reg[2:0]Count; 
 
always @(V) 
begin 
Count=0; 
while(~V[Count]) 
Count=Count+1; 
end 

reg [3:0] A;
reg V ,W; 
integer K; 

A=4'b1010; 
for(K=2;K>=0;K=K-1) 
begin 
V=V^A[k]; 
W=A[K]^A[K+1]; 
end

endmodule