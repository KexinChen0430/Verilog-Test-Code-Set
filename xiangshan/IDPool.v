module IDPool(
  input        clock,
  input        reset,
  input        io_free_valid,
  input  [2:0] io_free_bits,
  input        io_alloc_ready,
  output       io_alloc_valid,
  output [2:0] io_alloc_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] bitmap; // @[IDPool.scala 18:23]
  reg [2:0] select; // @[IDPool.scala 19:23]
  reg  valid; // @[IDPool.scala 20:23]
  wire [7:0] _T_1 = 8'h1 << io_alloc_bits; // @[OneHot.scala 65:12]
  wire [7:0] taken = io_alloc_ready ? _T_1 : 8'h0; // @[IDPool.scala 25:19]
  wire [7:0] _T_3 = 8'h1 << io_free_bits; // @[OneHot.scala 65:12]
  wire [7:0] given = io_free_valid ? _T_3 : 8'h0; // @[IDPool.scala 26:19]
  wire [7:0] _T_5 = ~taken; // @[IDPool.scala 27:27]
  wire [7:0] _T_6 = bitmap & _T_5; // @[IDPool.scala 27:25]
  wire [7:0] bitmap1 = _T_6 | given; // @[IDPool.scala 27:35]
  wire [2:0] _T_15 = bitmap1[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_16 = bitmap1[5] ? 3'h5 : _T_15; // @[Mux.scala 47:69]
  wire [2:0] _T_17 = bitmap1[4] ? 3'h4 : _T_16; // @[Mux.scala 47:69]
  wire [2:0] _T_18 = bitmap1[3] ? 3'h3 : _T_17; // @[Mux.scala 47:69]
  wire [2:0] _T_19 = bitmap1[2] ? 3'h2 : _T_18; // @[Mux.scala 47:69]
  wire [1:0] _T_30 = bitmap[0] + bitmap[1]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_32 = bitmap[2] + bitmap[3]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_34 = _T_30 + _T_32; // @[Bitwise.scala 47:55]
  wire [1:0] _T_36 = bitmap[4] + bitmap[5]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_38 = bitmap[6] + bitmap[7]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_40 = _T_36 + _T_38; // @[Bitwise.scala 47:55]
  wire [3:0] _T_42 = _T_34 + _T_40; // @[Bitwise.scala 47:55]
  wire  _T_47 = |bitmap & ~(_T_42 == 4'h1 & io_alloc_ready); // @[IDPool.scala 29:32]
  wire  valid1 = _T_47 | io_free_valid; // @[IDPool.scala 30:17]
  wire  _GEN_1 = io_alloc_ready | io_free_valid ? valid1 : valid; // @[IDPool.scala 33:42 35:12 20:23]
  assign io_alloc_valid = valid; // @[IDPool.scala 22:18]
  assign io_alloc_bits = select; // @[IDPool.scala 23:18]
  always @(posedge clock) begin
    if (reset) begin // @[IDPool.scala 18:23]
      bitmap <= 8'hff; // @[IDPool.scala 18:23]
    end else if (io_alloc_ready | io_free_valid) begin // @[IDPool.scala 33:42]
      bitmap <= bitmap1; // @[IDPool.scala 34:12]
    end
    if (reset) begin // @[IDPool.scala 19:23]
      select <= 3'h0; // @[IDPool.scala 19:23]
    end else if (io_alloc_ready | ~io_alloc_valid & io_free_valid) begin // @[IDPool.scala 39:63]
      if (bitmap1[0]) begin // @[Mux.scala 47:69]
        select <= 3'h0;
      end else if (bitmap1[1]) begin // @[Mux.scala 47:69]
        select <= 3'h1;
      end else begin
        select <= _T_19;
      end
    end
    valid <= reset | _GEN_1; // @[IDPool.scala 20:{23,23}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  bitmap = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  select = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  valid = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule