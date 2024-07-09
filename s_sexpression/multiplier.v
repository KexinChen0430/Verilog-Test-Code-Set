// multiplies 2 n-bit numbers `m` and `q` into their `n * 2` bit product `s`
module multiplier (
    m,
    q,
    s
);
  parameter integer n = 32;

  input [n-1:0] m, q;
  output [n*2-1:0] s;

  wire [n-1:0] b;
  wire [n*n-1:0] t, u;  // results of ands, adders

  wire [n-1:0] c;  // carry

  genvar i;
  generate
    for (i = 0; i < n; i = i + 1) begin
      multi_and ma (
          m,
          q[i],
          t[n*i+(n-1) : n*i]
      );
    end
  endgenerate

  assign s[0] = t[0];
  assign c[0] = 1'b0;
  assign u[n-1:1] = t[n-1:1];

  genvar j;
  generate
    for (j = 0; j < n - 1; j = j + 1) begin
      addern a (
          t[(j*n)+(2*n)-1 : (j*n)+n],  // a
          {c[j], u[n*j+(n-1) : n*j+1]},  // b
          1'b0,  // cin
          u[(j*n)+(2*n)-1 : (j*n)+n],  // s
          c[j+1]  // cout
      );
      assign s[j+1] = u[j*n+n];
    end
  endgenerate

  assign s[n*2-2 : n-1] = u[n*n-1 : n*n-1-n+1];
  assign s[n*2-1] = c[n-1];
endmodule  // multiplier

// Multiplies an n-bit `x` by a single bit `y`
module multi_and (
    x,
    y,
    s
);
  parameter integer n = 32;

  input [n-1:0] x;
  input y;
  output [n-1:0] s;

  genvar i;
  generate
    for (i = 0; i <= n - 1; i = i + 1) begin
      and a (s[i], x[i], y);
    end
  endgenerate
endmodule

// ripple carry adder for 2 n-bit numbers
module addern (
    X,
    Y,
    carryin,
    S,
    carryout
);
  parameter integer n = 32;

  input carryin;
  input [n-1:0] X, Y;

  output [n-1:0] S;
  output carryout;

  wire [n:0] C;
  genvar i;
  assign C[0] = carryin;
  assign carryout = C[n];

  generate
    for (i = 0; i <= n - 1; i = i + 1) begin
      full_adder fa (
          C[i],
          X[i],
          Y[i],
          S[i],
          C[i+1]
      );
    end
  endgenerate
endmodule  // addern

// Verilog code for full adder 
module full_adder (
    x,
    y,
    cin,
    s,
    cout
);
  input x, y, cin;
  output s, cout;
  assign s = (x ^ y) ^ cin;
  assign cout = (y & cin) | (x & y) | (x & cin);
endmodule  // full_adder
