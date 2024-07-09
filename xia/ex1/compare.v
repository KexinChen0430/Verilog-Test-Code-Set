//--------------- compare.v -----------------
module compare(equal,a,b); 
input a,b; 
output equal; 
   assign  equal=(a==b)?1:0; //a等于b时，equal输出为1；a不等于b时， 
                             //equal输出为0。 
endmodule
