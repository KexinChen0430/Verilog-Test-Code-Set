module page148;

task my_task;
input a, b; 
inout c; 
output d, e; 
begin
  // statements that perform the work of the task

c = foo1; // the assignments that initialize result regs
d = foo2;
e = foo3;
end
endtask

task my_task (input a, b, inout c, output d, e);
begin
   // statements that perform the work of the task

c = foo1; // the assignments that initialize result regs
d = foo2;
e = foo3;
end
endtask

endmodule