module page193;

begin
fork :mod_1
reg x;
mod_2.x=1;
join
fork :mod_2
reg x;
mod_1.x=0;
join
end

endmodule