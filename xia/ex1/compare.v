//--------------- compare.v -----------------
module compare(equal,a,b); 
input a,b; 
output equal; 
   assign  equal=(a==b)?1:0; //a����bʱ��equal���Ϊ1��a������bʱ�� 
                             //equal���Ϊ0�� 
endmodule
