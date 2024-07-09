module  shift;
reg [3:0]  start, result; 
initial 
begin 
start  = 1; //start在初始时刻设为值0001 
result = (start<<2); 
//移位后，start的值0100，然后赋给result。
end 
endmodule 