module multiple;
reg a;
initial a = 1;
// The assigned value of the reg is determinate
initial begin
a <= #4 0;// schedules a = 0 at time 4
a <= #4 1;// schedules a = 1 at time 4
end // At time 4, a = 1
endmodule

module multiple2;
reg a;
initial a = 1;
initial a <= #4 0;// schedules 0 at time 4
initial a <= #4 1;// schedules 1 at time 4
// At time 4, a = ??
// The assigned value of the reg is indeterminate
endmodule

module multiple3;
reg a;
initial #8 a <= #8 1; // executed at time 8;
 // schedules an update of 1 at time 16
initial #12 a <= #4 0; // executed at time 12;
 // schedules an update of 0 at time 16
// Because it is determinate that the update of a to the value 1
// is scheduled before the update of a to the value 0, 
// then it is determinate that a will have the value 0 
// at the end of time slot 16.
endmodule

module multiple4;
reg r1;
reg [2:0] i;
initial begin
// makes assignments to r1 without cancelling previous assignments
for (i = 0; i <= 5; i = i+1)
r1 <= # (i*10) i[0];
end
endmodule
