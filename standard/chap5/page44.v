// Note: signed constants

module page44(a, b, out);
    input [1:0] a, b;
    output [1:0] out;

    integer i;
    i = -12 / 3;// The result is -4.
    for(i = -12 / 3; i <= -3; i = i + 1) begin : page44
        assign out[i+4] = a[i+4] & b[i+4];
    end

endmodule

// module page44;

//     integer IntA;
//     IntA = -12 / 3;// The result is -4.
//     IntA = -'d 12 / 3;// The result is 1431655761.
//     IntA = -'sd 12 / 3;// The result is -4.
//     IntA = -4'sd 12 / 3; // -4'sd12 is the negative of the 4-bit

// endmodule