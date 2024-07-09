module page142;

fork
#250 -> end_wave;
#200 r = 'hF7;
#150 r = 'h00;
#100 r = 'hE2;
#50 r = 'h35;
join

begin
fork
@Aevent;
@Bevent;
join
areg=breg;
end

fork
@enable_a
 begin
#ta wa=0;
#ta wa=1;
#ta wa=0;
end
@enable_b
begin
#tb wb=1;
#tb wb=0;
#tb wb=1;
end
join

endmodule