module page289;

integer
messages,broadcast,
cpu_chann,alu_chann, mem_chann;
initial begin
cpu_chann = $fopen("cpu.dat"); 
if (cpu_chann == 0) $finish;
alu_chann = $fopen("alu.dat"); 
if (alu_chann == 0) $finish;
mem_chann = $fopen("mem.dat"); 
if (mem_chann == 0) $finish;
messages = cpu_chann | alu_chann | mem_chann;
// broadcast includes standard output
broadcast = 1 | messages;
end

$fdisplay( broadcast, "system reset at time %d", $time );
$fdisplay( messages, "Error occurred on address bus",
" at time %d, address = %h", $time, address );
forever @(posedge clock) 
    $fdisplay( alu_chann, "acc= %h f=%h a=%h b=%h", acc, f, a, b );
    
endmodule