module page126;

// declare regs and parameters
reg [31:0]instruction,segment_area[255:0];
reg [7:0]index;
reg [5:0]modify_seg1,
modify_seg2,
modify_seg3;
parameter
segment1=0,inc_seg1=1,
segment2=20,inc_seg2=2,
segment3=64,inc_seg3=4,
data=128;
// test the index variable
if (index<segment2) begin
instruction=segment_area [index+ modify_seg1];
index=index+inc_seg1;
end
else if (index<segment3) begin
instruction=segment_area [index+ modify_seg2];
index=index+inc_seg2;
end
else if (index<data) begin
instruction=segment_area [index+ modify_seg3];
index=index+inc_seg3;
end
else
instruction=segment_area [index];

endmodule