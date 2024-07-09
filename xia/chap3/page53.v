
// [Àý1]£º
`timescale  10ns/1ns
module  test; 
reg  set; 
parameter  p=1.6; 
initial 
begin 
$monitor($time,,"set=",set); 
#p set=0; 
#p set=1; 
end 
endmodule

// page 54
// [Àý2]:
`timescale10ns/1ns
module test;
reg set;
parameter  p=1.55;
initial
begin
$monitor($realtime,,"set=",set);
#p set=0;
#p set=1;
end

// page 56
initial  $readmemh("mem.data",mem);
initial  $readmemh("mem.data",mem,16);
initial  $readmemh("mem.data",mem,128,1);

endmodule
