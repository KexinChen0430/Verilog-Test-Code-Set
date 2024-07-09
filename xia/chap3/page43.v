module page43;


// [Àý1]£º
begin:  init_mem
reg[7:0] tempi;
for(tempi=0;tempi<memsize;tempi=tempi+1)
memory[tempi]=0;
end

// [Àý2]£º
parameter  size = 8, longsize = 16;
reg[size:1] opa, opb;
reg[longsize:1] result;

begin:mult
integer bindex;
result=0;
for( bindex=1; bindex<=size; bindex=bindex+1 )
if(opb[bindex])
result = result + (opa<<(bindex-1));
end 

begin: count1s
reg[7:0] tempreg; 
count=0; 
for( tempreg=rega; tempreg; tempreg=tempreg>>1 ) 
if(tempreg[0])   
count=count+1; 
end 

endmodule