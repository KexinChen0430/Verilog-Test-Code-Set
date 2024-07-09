module page152;

fork
begin : event_expr
@ev1;
repeat (3) @trig;
#d action (areg, breg);
end
@reset disable event_expr;
join

always begin : monostable
#250 q = 0;
end
always @retrig begin
disable monostable;
q = 1;
end

endmodule