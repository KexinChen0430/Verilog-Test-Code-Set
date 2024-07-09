// 单数入的逻辑操作
// 逻辑综合的结果是将输入的每一位进行相应逻辑操作
module ur_and(x, out);
    input [2:0] x;
    output out;

    assign out = &x;

endmodule

module ur_or(x, out);
    input [2:0] x;
    output out;

    assign out = |x;

endmodule

module ur_xor(x, out);
    input [2:0] x;
    output out;

    assign out = ^x;

endmodule