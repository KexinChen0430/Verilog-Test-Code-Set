
// [例1]：
module  disp;
initial
begin
$display("\\\t%%\n\"\123");
end
endmodule


// [例2]：
module disp;
reg[31:0] rval;
pulldown(pd);
initial
begin
rval=101;
$display("rval=%h hex %d decimal", rval, rval);
$display("rval=%o otal %b binary", rval, rval);
$display("rval has %c ascii character value",rval);
$display("pd strength value is %v",pd);
$display("current scope is %m");
$display("%s is ascii value for 101",101);
$display("simulation time is %t",$time);
end
endmodule

// [例3]：
module printval;
reg[11:0]r1;
initial
 begin
    r1=10;
    $display("Printing with maximum size=%d=%h",r1,r1);
    $display("Printing with minimum size=%0d=%0h",r1,r1);
 end

$display("%d", 1'bx);                         //     输出结果为：x
$display("%h", 14'bx0_1010);                    //         输出结果为：xxXa
$display("%h %o",12'b001x_xx10_1x01,12'b001_xxx_101_x01); //   输出结果为：XXX 1x5X

endmodule