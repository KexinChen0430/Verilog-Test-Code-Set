module page136;

begin
wait (!enable) #10 a = b; 
#10 c = d; 
end

endmodule