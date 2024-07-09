`timescale 10 ns / 1 ns
module test;
reg set;
parameter p = 1.55;
initial begin
$monitor($time,,"set=",set);
#p set = 0;
#p set = 1;
end
endmodule

`timescale 10 ns / 1 ns
module test;
reg set;
parameter p = 1.55;
initial begin
$monitor($realtime,,"set=",set);
#p set = 0;
#p set = 1;
end
endmodule
