module page130;

// repeat loop
parameter size = 8, longsize = 16;
reg [size:1] opa, opb;
reg [longsize:1] result;
begin : mult
reg [longsize:1] shift_opa, shift_opb;
shift_opa = opa;
shift_opb = opb;
result = 0;

repeat (size) begin
if (shift_opb[1])
result = result + shift_opa;
shift_opa = shift_opa << 1;
shift_opb = shift_opb >> 1;
end
end

// page 131, while loop
begin : count1s
reg [7:0] tempreg;
count = 0;
tempreg = rega;
while (tempreg) begin
if (tempreg[0])
count = count + 1;
tempreg = tempreg >> 1;
end
end

endmodule