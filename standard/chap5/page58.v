module page58;

reg [7:0] twod_array[0:255][0:255];
wire threed_array[0:255][0:255][0:7];


a = twod_array[14][1][3:0];      // access lower 4 bits of word
a = twod_array[1][3][6];         // access bit 6 of word
a = twod_array[1][3][sel];       // use variable bit-select
a = threed_array[14][1][3:0];    // Illegal

endmodule