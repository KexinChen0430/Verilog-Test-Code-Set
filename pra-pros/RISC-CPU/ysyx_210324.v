module ysyx_210324_GHR(
  input        clock,
  input        io_branch,
  input        io_taken,
  output [4:0] io_idx
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] shiftReg; // @[GHR.scala 15:31]
  wire [3:0] shiftReg_hi = shiftReg[3:0]; // @[GHR.scala 18:29]
  wire [4:0] _shiftReg_T = {shiftReg_hi,io_taken}; // @[Cat.scala 30:58]
  assign io_idx = shiftReg; // @[GHR.scala 21:10]
  always @(posedge clock) begin
    if (io_branch) begin // @[GHR.scala 17:19]
      shiftReg <= _shiftReg_T; // @[GHR.scala 18:14]
    end
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
  shiftReg = _RAND_0[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_PHT(
  input        clock,
  input        reset,
  input        io_prevBranch,
  input        io_prevTaken,
  input  [4:0] io_prevIdx,
  input  [4:0] io_idx,
  output       io_taken
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] counters_0; // @[PHT.scala 21:35]
  reg [1:0] counters_1; // @[PHT.scala 21:35]
  reg [1:0] counters_2; // @[PHT.scala 21:35]
  reg [1:0] counters_3; // @[PHT.scala 21:35]
  reg [1:0] counters_4; // @[PHT.scala 21:35]
  reg [1:0] counters_5; // @[PHT.scala 21:35]
  reg [1:0] counters_6; // @[PHT.scala 21:35]
  reg [1:0] counters_7; // @[PHT.scala 21:35]
  reg [1:0] counters_8; // @[PHT.scala 21:35]
  reg [1:0] counters_9; // @[PHT.scala 21:35]
  reg [1:0] counters_10; // @[PHT.scala 21:35]
  reg [1:0] counters_11; // @[PHT.scala 21:35]
  reg [1:0] counters_12; // @[PHT.scala 21:35]
  reg [1:0] counters_13; // @[PHT.scala 21:35]
  reg [1:0] counters_14; // @[PHT.scala 21:35]
  reg [1:0] counters_15; // @[PHT.scala 21:35]
  reg [1:0] counters_16; // @[PHT.scala 21:35]
  reg [1:0] counters_17; // @[PHT.scala 21:35]
  reg [1:0] counters_18; // @[PHT.scala 21:35]
  reg [1:0] counters_19; // @[PHT.scala 21:35]
  reg [1:0] counters_20; // @[PHT.scala 21:35]
  reg [1:0] counters_21; // @[PHT.scala 21:35]
  reg [1:0] counters_22; // @[PHT.scala 21:35]
  reg [1:0] counters_23; // @[PHT.scala 21:35]
  reg [1:0] counters_24; // @[PHT.scala 21:35]
  reg [1:0] counters_25; // @[PHT.scala 21:35]
  reg [1:0] counters_26; // @[PHT.scala 21:35]
  reg [1:0] counters_27; // @[PHT.scala 21:35]
  reg [1:0] counters_28; // @[PHT.scala 21:35]
  reg [1:0] counters_29; // @[PHT.scala 21:35]
  reg [1:0] counters_30; // @[PHT.scala 21:35]
  reg [1:0] counters_31; // @[PHT.scala 21:35]
  wire [1:0] _GEN_1 = 5'h1 == io_prevIdx ? counters_1 : counters_0; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_2 = 5'h2 == io_prevIdx ? counters_2 : _GEN_1; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_3 = 5'h3 == io_prevIdx ? counters_3 : _GEN_2; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_4 = 5'h4 == io_prevIdx ? counters_4 : _GEN_3; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_5 = 5'h5 == io_prevIdx ? counters_5 : _GEN_4; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_6 = 5'h6 == io_prevIdx ? counters_6 : _GEN_5; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_7 = 5'h7 == io_prevIdx ? counters_7 : _GEN_6; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_8 = 5'h8 == io_prevIdx ? counters_8 : _GEN_7; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_9 = 5'h9 == io_prevIdx ? counters_9 : _GEN_8; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_10 = 5'ha == io_prevIdx ? counters_10 : _GEN_9; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_11 = 5'hb == io_prevIdx ? counters_11 : _GEN_10; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_12 = 5'hc == io_prevIdx ? counters_12 : _GEN_11; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_13 = 5'hd == io_prevIdx ? counters_13 : _GEN_12; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_14 = 5'he == io_prevIdx ? counters_14 : _GEN_13; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_15 = 5'hf == io_prevIdx ? counters_15 : _GEN_14; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_16 = 5'h10 == io_prevIdx ? counters_16 : _GEN_15; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_17 = 5'h11 == io_prevIdx ? counters_17 : _GEN_16; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_18 = 5'h12 == io_prevIdx ? counters_18 : _GEN_17; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_19 = 5'h13 == io_prevIdx ? counters_19 : _GEN_18; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_20 = 5'h14 == io_prevIdx ? counters_20 : _GEN_19; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_21 = 5'h15 == io_prevIdx ? counters_21 : _GEN_20; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_22 = 5'h16 == io_prevIdx ? counters_22 : _GEN_21; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_23 = 5'h17 == io_prevIdx ? counters_23 : _GEN_22; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_24 = 5'h18 == io_prevIdx ? counters_24 : _GEN_23; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_25 = 5'h19 == io_prevIdx ? counters_25 : _GEN_24; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_26 = 5'h1a == io_prevIdx ? counters_26 : _GEN_25; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_27 = 5'h1b == io_prevIdx ? counters_27 : _GEN_26; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_28 = 5'h1c == io_prevIdx ? counters_28 : _GEN_27; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_29 = 5'h1d == io_prevIdx ? counters_29 : _GEN_28; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_30 = 5'h1e == io_prevIdx ? counters_30 : _GEN_29; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire [1:0] _GEN_31 = 5'h1f == io_prevIdx ? counters_31 : _GEN_30; // @[PHT.scala 25:31 PHT.scala 25:31]
  wire  _T_1 = ~io_prevTaken; // @[PHT.scala 26:12]
  wire [1:0] _counters_T_1 = _GEN_31 - 2'h1; // @[PHT.scala 27:54]
  wire [1:0] _GEN_32 = 5'h0 == io_prevIdx ? _counters_T_1 : counters_0; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_33 = 5'h1 == io_prevIdx ? _counters_T_1 : counters_1; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_34 = 5'h2 == io_prevIdx ? _counters_T_1 : counters_2; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_35 = 5'h3 == io_prevIdx ? _counters_T_1 : counters_3; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_36 = 5'h4 == io_prevIdx ? _counters_T_1 : counters_4; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_37 = 5'h5 == io_prevIdx ? _counters_T_1 : counters_5; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_38 = 5'h6 == io_prevIdx ? _counters_T_1 : counters_6; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_39 = 5'h7 == io_prevIdx ? _counters_T_1 : counters_7; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_40 = 5'h8 == io_prevIdx ? _counters_T_1 : counters_8; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_41 = 5'h9 == io_prevIdx ? _counters_T_1 : counters_9; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_42 = 5'ha == io_prevIdx ? _counters_T_1 : counters_10; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_43 = 5'hb == io_prevIdx ? _counters_T_1 : counters_11; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_44 = 5'hc == io_prevIdx ? _counters_T_1 : counters_12; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_45 = 5'hd == io_prevIdx ? _counters_T_1 : counters_13; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_46 = 5'he == io_prevIdx ? _counters_T_1 : counters_14; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_47 = 5'hf == io_prevIdx ? _counters_T_1 : counters_15; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_48 = 5'h10 == io_prevIdx ? _counters_T_1 : counters_16; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_49 = 5'h11 == io_prevIdx ? _counters_T_1 : counters_17; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_50 = 5'h12 == io_prevIdx ? _counters_T_1 : counters_18; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_51 = 5'h13 == io_prevIdx ? _counters_T_1 : counters_19; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_52 = 5'h14 == io_prevIdx ? _counters_T_1 : counters_20; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_53 = 5'h15 == io_prevIdx ? _counters_T_1 : counters_21; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_54 = 5'h16 == io_prevIdx ? _counters_T_1 : counters_22; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_55 = 5'h17 == io_prevIdx ? _counters_T_1 : counters_23; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_56 = 5'h18 == io_prevIdx ? _counters_T_1 : counters_24; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_57 = 5'h19 == io_prevIdx ? _counters_T_1 : counters_25; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_58 = 5'h1a == io_prevIdx ? _counters_T_1 : counters_26; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_59 = 5'h1b == io_prevIdx ? _counters_T_1 : counters_27; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_60 = 5'h1c == io_prevIdx ? _counters_T_1 : counters_28; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_61 = 5'h1d == io_prevIdx ? _counters_T_1 : counters_29; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_62 = 5'h1e == io_prevIdx ? _counters_T_1 : counters_30; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _GEN_63 = 5'h1f == io_prevIdx ? _counters_T_1 : counters_31; // @[PHT.scala 27:30 PHT.scala 27:30 PHT.scala 21:35]
  wire [1:0] _counters_T_3 = _GEN_31 + 2'h1; // @[PHT.scala 31:54]
  wire [1:0] _GEN_96 = 5'h0 == io_prevIdx ? _counters_T_3 : counters_0; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_97 = 5'h1 == io_prevIdx ? _counters_T_3 : counters_1; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_98 = 5'h2 == io_prevIdx ? _counters_T_3 : counters_2; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_99 = 5'h3 == io_prevIdx ? _counters_T_3 : counters_3; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_100 = 5'h4 == io_prevIdx ? _counters_T_3 : counters_4; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_101 = 5'h5 == io_prevIdx ? _counters_T_3 : counters_5; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_102 = 5'h6 == io_prevIdx ? _counters_T_3 : counters_6; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_103 = 5'h7 == io_prevIdx ? _counters_T_3 : counters_7; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_104 = 5'h8 == io_prevIdx ? _counters_T_3 : counters_8; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_105 = 5'h9 == io_prevIdx ? _counters_T_3 : counters_9; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_106 = 5'ha == io_prevIdx ? _counters_T_3 : counters_10; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_107 = 5'hb == io_prevIdx ? _counters_T_3 : counters_11; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_108 = 5'hc == io_prevIdx ? _counters_T_3 : counters_12; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_109 = 5'hd == io_prevIdx ? _counters_T_3 : counters_13; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_110 = 5'he == io_prevIdx ? _counters_T_3 : counters_14; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_111 = 5'hf == io_prevIdx ? _counters_T_3 : counters_15; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_112 = 5'h10 == io_prevIdx ? _counters_T_3 : counters_16; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_113 = 5'h11 == io_prevIdx ? _counters_T_3 : counters_17; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_114 = 5'h12 == io_prevIdx ? _counters_T_3 : counters_18; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_115 = 5'h13 == io_prevIdx ? _counters_T_3 : counters_19; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_116 = 5'h14 == io_prevIdx ? _counters_T_3 : counters_20; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_117 = 5'h15 == io_prevIdx ? _counters_T_3 : counters_21; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_118 = 5'h16 == io_prevIdx ? _counters_T_3 : counters_22; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_119 = 5'h17 == io_prevIdx ? _counters_T_3 : counters_23; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_120 = 5'h18 == io_prevIdx ? _counters_T_3 : counters_24; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_121 = 5'h19 == io_prevIdx ? _counters_T_3 : counters_25; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_122 = 5'h1a == io_prevIdx ? _counters_T_3 : counters_26; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_123 = 5'h1b == io_prevIdx ? _counters_T_3 : counters_27; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_124 = 5'h1c == io_prevIdx ? _counters_T_3 : counters_28; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_125 = 5'h1d == io_prevIdx ? _counters_T_3 : counters_29; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_126 = 5'h1e == io_prevIdx ? _counters_T_3 : counters_30; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_127 = 5'h1f == io_prevIdx ? _counters_T_3 : counters_31; // @[PHT.scala 31:30 PHT.scala 31:30 PHT.scala 21:35]
  wire [1:0] _GEN_128 = io_prevTaken ? _GEN_96 : counters_0; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_129 = io_prevTaken ? _GEN_97 : counters_1; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_130 = io_prevTaken ? _GEN_98 : counters_2; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_131 = io_prevTaken ? _GEN_99 : counters_3; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_132 = io_prevTaken ? _GEN_100 : counters_4; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_133 = io_prevTaken ? _GEN_101 : counters_5; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_134 = io_prevTaken ? _GEN_102 : counters_6; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_135 = io_prevTaken ? _GEN_103 : counters_7; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_136 = io_prevTaken ? _GEN_104 : counters_8; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_137 = io_prevTaken ? _GEN_105 : counters_9; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_138 = io_prevTaken ? _GEN_106 : counters_10; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_139 = io_prevTaken ? _GEN_107 : counters_11; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_140 = io_prevTaken ? _GEN_108 : counters_12; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_141 = io_prevTaken ? _GEN_109 : counters_13; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_142 = io_prevTaken ? _GEN_110 : counters_14; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_143 = io_prevTaken ? _GEN_111 : counters_15; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_144 = io_prevTaken ? _GEN_112 : counters_16; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_145 = io_prevTaken ? _GEN_113 : counters_17; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_146 = io_prevTaken ? _GEN_114 : counters_18; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_147 = io_prevTaken ? _GEN_115 : counters_19; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_148 = io_prevTaken ? _GEN_116 : counters_20; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_149 = io_prevTaken ? _GEN_117 : counters_21; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_150 = io_prevTaken ? _GEN_118 : counters_22; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_151 = io_prevTaken ? _GEN_119 : counters_23; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_152 = io_prevTaken ? _GEN_120 : counters_24; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_153 = io_prevTaken ? _GEN_121 : counters_25; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_154 = io_prevTaken ? _GEN_122 : counters_26; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_155 = io_prevTaken ? _GEN_123 : counters_27; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_156 = io_prevTaken ? _GEN_124 : counters_28; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_157 = io_prevTaken ? _GEN_125 : counters_29; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_158 = io_prevTaken ? _GEN_126 : counters_30; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_159 = io_prevTaken ? _GEN_127 : counters_31; // @[PHT.scala 30:26 PHT.scala 21:35]
  wire [1:0] _GEN_224 = _T_1 ? _GEN_32 : _GEN_96; // @[PHT.scala 34:27]
  wire [1:0] _GEN_225 = _T_1 ? _GEN_33 : _GEN_97; // @[PHT.scala 34:27]
  wire [1:0] _GEN_226 = _T_1 ? _GEN_34 : _GEN_98; // @[PHT.scala 34:27]
  wire [1:0] _GEN_227 = _T_1 ? _GEN_35 : _GEN_99; // @[PHT.scala 34:27]
  wire [1:0] _GEN_228 = _T_1 ? _GEN_36 : _GEN_100; // @[PHT.scala 34:27]
  wire [1:0] _GEN_229 = _T_1 ? _GEN_37 : _GEN_101; // @[PHT.scala 34:27]
  wire [1:0] _GEN_230 = _T_1 ? _GEN_38 : _GEN_102; // @[PHT.scala 34:27]
  wire [1:0] _GEN_231 = _T_1 ? _GEN_39 : _GEN_103; // @[PHT.scala 34:27]
  wire [1:0] _GEN_232 = _T_1 ? _GEN_40 : _GEN_104; // @[PHT.scala 34:27]
  wire [1:0] _GEN_233 = _T_1 ? _GEN_41 : _GEN_105; // @[PHT.scala 34:27]
  wire [1:0] _GEN_234 = _T_1 ? _GEN_42 : _GEN_106; // @[PHT.scala 34:27]
  wire [1:0] _GEN_235 = _T_1 ? _GEN_43 : _GEN_107; // @[PHT.scala 34:27]
  wire [1:0] _GEN_236 = _T_1 ? _GEN_44 : _GEN_108; // @[PHT.scala 34:27]
  wire [1:0] _GEN_237 = _T_1 ? _GEN_45 : _GEN_109; // @[PHT.scala 34:27]
  wire [1:0] _GEN_238 = _T_1 ? _GEN_46 : _GEN_110; // @[PHT.scala 34:27]
  wire [1:0] _GEN_239 = _T_1 ? _GEN_47 : _GEN_111; // @[PHT.scala 34:27]
  wire [1:0] _GEN_240 = _T_1 ? _GEN_48 : _GEN_112; // @[PHT.scala 34:27]
  wire [1:0] _GEN_241 = _T_1 ? _GEN_49 : _GEN_113; // @[PHT.scala 34:27]
  wire [1:0] _GEN_242 = _T_1 ? _GEN_50 : _GEN_114; // @[PHT.scala 34:27]
  wire [1:0] _GEN_243 = _T_1 ? _GEN_51 : _GEN_115; // @[PHT.scala 34:27]
  wire [1:0] _GEN_244 = _T_1 ? _GEN_52 : _GEN_116; // @[PHT.scala 34:27]
  wire [1:0] _GEN_245 = _T_1 ? _GEN_53 : _GEN_117; // @[PHT.scala 34:27]
  wire [1:0] _GEN_246 = _T_1 ? _GEN_54 : _GEN_118; // @[PHT.scala 34:27]
  wire [1:0] _GEN_247 = _T_1 ? _GEN_55 : _GEN_119; // @[PHT.scala 34:27]
  wire [1:0] _GEN_248 = _T_1 ? _GEN_56 : _GEN_120; // @[PHT.scala 34:27]
  wire [1:0] _GEN_249 = _T_1 ? _GEN_57 : _GEN_121; // @[PHT.scala 34:27]
  wire [1:0] _GEN_250 = _T_1 ? _GEN_58 : _GEN_122; // @[PHT.scala 34:27]
  wire [1:0] _GEN_251 = _T_1 ? _GEN_59 : _GEN_123; // @[PHT.scala 34:27]
  wire [1:0] _GEN_252 = _T_1 ? _GEN_60 : _GEN_124; // @[PHT.scala 34:27]
  wire [1:0] _GEN_253 = _T_1 ? _GEN_61 : _GEN_125; // @[PHT.scala 34:27]
  wire [1:0] _GEN_254 = _T_1 ? _GEN_62 : _GEN_126; // @[PHT.scala 34:27]
  wire [1:0] _GEN_255 = _T_1 ? _GEN_63 : _GEN_127; // @[PHT.scala 34:27]
  wire [1:0] _GEN_353 = 5'h1 == io_idx ? counters_1 : counters_0; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_354 = 5'h2 == io_idx ? counters_2 : _GEN_353; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_355 = 5'h3 == io_idx ? counters_3 : _GEN_354; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_356 = 5'h4 == io_idx ? counters_4 : _GEN_355; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_357 = 5'h5 == io_idx ? counters_5 : _GEN_356; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_358 = 5'h6 == io_idx ? counters_6 : _GEN_357; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_359 = 5'h7 == io_idx ? counters_7 : _GEN_358; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_360 = 5'h8 == io_idx ? counters_8 : _GEN_359; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_361 = 5'h9 == io_idx ? counters_9 : _GEN_360; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_362 = 5'ha == io_idx ? counters_10 : _GEN_361; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_363 = 5'hb == io_idx ? counters_11 : _GEN_362; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_364 = 5'hc == io_idx ? counters_12 : _GEN_363; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_365 = 5'hd == io_idx ? counters_13 : _GEN_364; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_366 = 5'he == io_idx ? counters_14 : _GEN_365; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_367 = 5'hf == io_idx ? counters_15 : _GEN_366; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_368 = 5'h10 == io_idx ? counters_16 : _GEN_367; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_369 = 5'h11 == io_idx ? counters_17 : _GEN_368; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_370 = 5'h12 == io_idx ? counters_18 : _GEN_369; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_371 = 5'h13 == io_idx ? counters_19 : _GEN_370; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_372 = 5'h14 == io_idx ? counters_20 : _GEN_371; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_373 = 5'h15 == io_idx ? counters_21 : _GEN_372; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_374 = 5'h16 == io_idx ? counters_22 : _GEN_373; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_375 = 5'h17 == io_idx ? counters_23 : _GEN_374; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_376 = 5'h18 == io_idx ? counters_24 : _GEN_375; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_377 = 5'h19 == io_idx ? counters_25 : _GEN_376; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_378 = 5'h1a == io_idx ? counters_26 : _GEN_377; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_379 = 5'h1b == io_idx ? counters_27 : _GEN_378; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_380 = 5'h1c == io_idx ? counters_28 : _GEN_379; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_381 = 5'h1d == io_idx ? counters_29 : _GEN_380; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_382 = 5'h1e == io_idx ? counters_30 : _GEN_381; // @[PHT.scala 42:31 PHT.scala 42:31]
  wire [1:0] _GEN_383 = 5'h1f == io_idx ? counters_31 : _GEN_382; // @[PHT.scala 42:31 PHT.scala 42:31]
  assign io_taken = _GEN_383[1]; // @[PHT.scala 42:31]
  always @(posedge clock) begin
    if (reset) begin // @[PHT.scala 21:35]
      counters_0 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_0 <= _GEN_32;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_0 <= _GEN_128;
      end else begin
        counters_0 <= _GEN_224;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_1 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_1 <= _GEN_33;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_1 <= _GEN_129;
      end else begin
        counters_1 <= _GEN_225;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_2 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_2 <= _GEN_34;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_2 <= _GEN_130;
      end else begin
        counters_2 <= _GEN_226;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_3 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_3 <= _GEN_35;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_3 <= _GEN_131;
      end else begin
        counters_3 <= _GEN_227;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_4 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_4 <= _GEN_36;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_4 <= _GEN_132;
      end else begin
        counters_4 <= _GEN_228;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_5 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_5 <= _GEN_37;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_5 <= _GEN_133;
      end else begin
        counters_5 <= _GEN_229;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_6 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_6 <= _GEN_38;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_6 <= _GEN_134;
      end else begin
        counters_6 <= _GEN_230;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_7 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_7 <= _GEN_39;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_7 <= _GEN_135;
      end else begin
        counters_7 <= _GEN_231;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_8 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_8 <= _GEN_40;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_8 <= _GEN_136;
      end else begin
        counters_8 <= _GEN_232;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_9 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_9 <= _GEN_41;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_9 <= _GEN_137;
      end else begin
        counters_9 <= _GEN_233;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_10 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_10 <= _GEN_42;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_10 <= _GEN_138;
      end else begin
        counters_10 <= _GEN_234;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_11 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_11 <= _GEN_43;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_11 <= _GEN_139;
      end else begin
        counters_11 <= _GEN_235;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_12 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_12 <= _GEN_44;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_12 <= _GEN_140;
      end else begin
        counters_12 <= _GEN_236;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_13 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_13 <= _GEN_45;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_13 <= _GEN_141;
      end else begin
        counters_13 <= _GEN_237;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_14 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_14 <= _GEN_46;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_14 <= _GEN_142;
      end else begin
        counters_14 <= _GEN_238;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_15 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_15 <= _GEN_47;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_15 <= _GEN_143;
      end else begin
        counters_15 <= _GEN_239;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_16 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_16 <= _GEN_48;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_16 <= _GEN_144;
      end else begin
        counters_16 <= _GEN_240;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_17 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_17 <= _GEN_49;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_17 <= _GEN_145;
      end else begin
        counters_17 <= _GEN_241;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_18 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_18 <= _GEN_50;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_18 <= _GEN_146;
      end else begin
        counters_18 <= _GEN_242;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_19 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_19 <= _GEN_51;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_19 <= _GEN_147;
      end else begin
        counters_19 <= _GEN_243;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_20 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_20 <= _GEN_52;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_20 <= _GEN_148;
      end else begin
        counters_20 <= _GEN_244;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_21 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_21 <= _GEN_53;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_21 <= _GEN_149;
      end else begin
        counters_21 <= _GEN_245;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_22 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_22 <= _GEN_54;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_22 <= _GEN_150;
      end else begin
        counters_22 <= _GEN_246;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_23 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_23 <= _GEN_55;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_23 <= _GEN_151;
      end else begin
        counters_23 <= _GEN_247;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_24 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_24 <= _GEN_56;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_24 <= _GEN_152;
      end else begin
        counters_24 <= _GEN_248;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_25 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_25 <= _GEN_57;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_25 <= _GEN_153;
      end else begin
        counters_25 <= _GEN_249;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_26 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_26 <= _GEN_58;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_26 <= _GEN_154;
      end else begin
        counters_26 <= _GEN_250;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_27 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_27 <= _GEN_59;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_27 <= _GEN_155;
      end else begin
        counters_27 <= _GEN_251;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_28 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_28 <= _GEN_60;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_28 <= _GEN_156;
      end else begin
        counters_28 <= _GEN_252;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_29 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_29 <= _GEN_61;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_29 <= _GEN_157;
      end else begin
        counters_29 <= _GEN_253;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_30 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_30 <= _GEN_62;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_30 <= _GEN_158;
      end else begin
        counters_30 <= _GEN_254;
      end
    end
    if (reset) begin // @[PHT.scala 21:35]
      counters_31 <= 2'h2; // @[PHT.scala 21:35]
    end else if (io_prevBranch) begin // @[PHT.scala 24:23]
      if (_GEN_31 == 2'h3) begin // @[PHT.scala 25:44]
        if (~io_prevTaken) begin // @[PHT.scala 26:27]
          counters_31 <= _GEN_63;
        end
      end else if (_GEN_31 == 2'h0) begin // @[PHT.scala 29:50]
        counters_31 <= _GEN_159;
      end else begin
        counters_31 <= _GEN_255;
      end
    end
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
  counters_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  counters_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  counters_2 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  counters_3 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  counters_4 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  counters_5 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  counters_6 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  counters_7 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  counters_8 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  counters_9 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  counters_10 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  counters_11 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  counters_12 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  counters_13 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  counters_14 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  counters_15 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  counters_16 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  counters_17 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  counters_18 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  counters_19 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  counters_20 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  counters_21 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  counters_22 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  counters_23 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  counters_24 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  counters_25 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  counters_26 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  counters_27 = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  counters_28 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  counters_29 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  counters_30 = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  counters_31 = _RAND_31[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_BTB(
  input         clock,
  input         reset,
  input         io_branch,
  input         io_jump,
  input  [63:0] io_pc,
  input  [63:0] io_tgt,
  output        io_lookupBranch,
  output        io_lookupJump,
  input  [63:0] io_lookupPc,
  output [63:0] io_lookupTgt
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] lines_pc [0:31]; // @[BTB.scala 30:29]
  wire [63:0] lines_pc_btbHit_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_pc_btbHit_MPORT_addr; // @[BTB.scala 30:29]
  wire [63:0] lines_pc_io_lookupJump_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_pc_io_lookupJump_MPORT_addr; // @[BTB.scala 30:29]
  wire [63:0] lines_pc_io_lookupTgt_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_pc_io_lookupTgt_MPORT_addr; // @[BTB.scala 30:29]
  wire [63:0] lines_pc_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_pc_MPORT_addr; // @[BTB.scala 30:29]
  wire  lines_pc_MPORT_mask; // @[BTB.scala 30:29]
  wire  lines_pc_MPORT_en; // @[BTB.scala 30:29]
  wire [63:0] lines_pc_MPORT_1_data; // @[BTB.scala 30:29]
  wire [4:0] lines_pc_MPORT_1_addr; // @[BTB.scala 30:29]
  wire  lines_pc_MPORT_1_mask; // @[BTB.scala 30:29]
  wire  lines_pc_MPORT_1_en; // @[BTB.scala 30:29]
  wire [63:0] lines_pc_MPORT_2_data; // @[BTB.scala 30:29]
  wire [4:0] lines_pc_MPORT_2_addr; // @[BTB.scala 30:29]
  wire  lines_pc_MPORT_2_mask; // @[BTB.scala 30:29]
  wire  lines_pc_MPORT_2_en; // @[BTB.scala 30:29]
  reg [63:0] lines_tgt [0:31]; // @[BTB.scala 30:29]
  wire [63:0] lines_tgt_btbHit_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_tgt_btbHit_MPORT_addr; // @[BTB.scala 30:29]
  wire [63:0] lines_tgt_io_lookupJump_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_tgt_io_lookupJump_MPORT_addr; // @[BTB.scala 30:29]
  wire [63:0] lines_tgt_io_lookupTgt_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_tgt_io_lookupTgt_MPORT_addr; // @[BTB.scala 30:29]
  wire [63:0] lines_tgt_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_tgt_MPORT_addr; // @[BTB.scala 30:29]
  wire  lines_tgt_MPORT_mask; // @[BTB.scala 30:29]
  wire  lines_tgt_MPORT_en; // @[BTB.scala 30:29]
  wire [63:0] lines_tgt_MPORT_1_data; // @[BTB.scala 30:29]
  wire [4:0] lines_tgt_MPORT_1_addr; // @[BTB.scala 30:29]
  wire  lines_tgt_MPORT_1_mask; // @[BTB.scala 30:29]
  wire  lines_tgt_MPORT_1_en; // @[BTB.scala 30:29]
  wire [63:0] lines_tgt_MPORT_2_data; // @[BTB.scala 30:29]
  wire [4:0] lines_tgt_MPORT_2_addr; // @[BTB.scala 30:29]
  wire  lines_tgt_MPORT_2_mask; // @[BTB.scala 30:29]
  wire  lines_tgt_MPORT_2_en; // @[BTB.scala 30:29]
  reg  lines_jump [0:31]; // @[BTB.scala 30:29]
  wire  lines_jump_btbHit_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_jump_btbHit_MPORT_addr; // @[BTB.scala 30:29]
  wire  lines_jump_io_lookupJump_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_jump_io_lookupJump_MPORT_addr; // @[BTB.scala 30:29]
  wire  lines_jump_io_lookupTgt_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_jump_io_lookupTgt_MPORT_addr; // @[BTB.scala 30:29]
  wire  lines_jump_MPORT_data; // @[BTB.scala 30:29]
  wire [4:0] lines_jump_MPORT_addr; // @[BTB.scala 30:29]
  wire  lines_jump_MPORT_mask; // @[BTB.scala 30:29]
  wire  lines_jump_MPORT_en; // @[BTB.scala 30:29]
  wire  lines_jump_MPORT_1_data; // @[BTB.scala 30:29]
  wire [4:0] lines_jump_MPORT_1_addr; // @[BTB.scala 30:29]
  wire  lines_jump_MPORT_1_mask; // @[BTB.scala 30:29]
  wire  lines_jump_MPORT_1_en; // @[BTB.scala 30:29]
  wire  lines_jump_MPORT_2_data; // @[BTB.scala 30:29]
  wire [4:0] lines_jump_MPORT_2_addr; // @[BTB.scala 30:29]
  wire  lines_jump_MPORT_2_mask; // @[BTB.scala 30:29]
  wire  lines_jump_MPORT_2_en; // @[BTB.scala 30:29]
  reg  valids_0; // @[BTB.scala 29:33]
  reg  valids_1; // @[BTB.scala 29:33]
  reg  valids_2; // @[BTB.scala 29:33]
  reg  valids_3; // @[BTB.scala 29:33]
  reg  valids_4; // @[BTB.scala 29:33]
  reg  valids_5; // @[BTB.scala 29:33]
  reg  valids_6; // @[BTB.scala 29:33]
  reg  valids_7; // @[BTB.scala 29:33]
  reg  valids_8; // @[BTB.scala 29:33]
  reg  valids_9; // @[BTB.scala 29:33]
  reg  valids_10; // @[BTB.scala 29:33]
  reg  valids_11; // @[BTB.scala 29:33]
  reg  valids_12; // @[BTB.scala 29:33]
  reg  valids_13; // @[BTB.scala 29:33]
  reg  valids_14; // @[BTB.scala 29:33]
  reg  valids_15; // @[BTB.scala 29:33]
  reg  valids_16; // @[BTB.scala 29:33]
  reg  valids_17; // @[BTB.scala 29:33]
  reg  valids_18; // @[BTB.scala 29:33]
  reg  valids_19; // @[BTB.scala 29:33]
  reg  valids_20; // @[BTB.scala 29:33]
  reg  valids_21; // @[BTB.scala 29:33]
  reg  valids_22; // @[BTB.scala 29:33]
  reg  valids_23; // @[BTB.scala 29:33]
  reg  valids_24; // @[BTB.scala 29:33]
  reg  valids_25; // @[BTB.scala 29:33]
  reg  valids_26; // @[BTB.scala 29:33]
  reg  valids_27; // @[BTB.scala 29:33]
  reg  valids_28; // @[BTB.scala 29:33]
  reg  valids_29; // @[BTB.scala 29:33]
  reg  valids_30; // @[BTB.scala 29:33]
  reg  valids_31; // @[BTB.scala 29:33]
  wire [4:0] idx = io_pc[4:0]; // @[BTB.scala 33:28]
  wire  _GEN_0 = 5'h0 == idx | valids_0; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_1 = 5'h1 == idx | valids_1; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_2 = 5'h2 == idx | valids_2; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_3 = 5'h3 == idx | valids_3; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_4 = 5'h4 == idx | valids_4; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_5 = 5'h5 == idx | valids_5; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_6 = 5'h6 == idx | valids_6; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_7 = 5'h7 == idx | valids_7; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_8 = 5'h8 == idx | valids_8; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_9 = 5'h9 == idx | valids_9; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_10 = 5'ha == idx | valids_10; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_11 = 5'hb == idx | valids_11; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_12 = 5'hc == idx | valids_12; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_13 = 5'hd == idx | valids_13; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_14 = 5'he == idx | valids_14; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_15 = 5'hf == idx | valids_15; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_16 = 5'h10 == idx | valids_16; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_17 = 5'h11 == idx | valids_17; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_18 = 5'h12 == idx | valids_18; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_19 = 5'h13 == idx | valids_19; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_20 = 5'h14 == idx | valids_20; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_21 = 5'h15 == idx | valids_21; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_22 = 5'h16 == idx | valids_22; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_23 = 5'h17 == idx | valids_23; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_24 = 5'h18 == idx | valids_24; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_25 = 5'h19 == idx | valids_25; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_26 = 5'h1a == idx | valids_26; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_27 = 5'h1b == idx | valids_27; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_28 = 5'h1c == idx | valids_28; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_29 = 5'h1d == idx | valids_29; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_30 = 5'h1e == idx | valids_30; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire  _GEN_31 = 5'h1f == idx | valids_31; // @[BTB.scala 36:21 BTB.scala 36:21 BTB.scala 29:33]
  wire [4:0] lookupIdx = io_lookupPc[4:0]; // @[BTB.scala 43:32]
  wire  _GEN_73 = 5'h1 == lookupIdx ? valids_1 : valids_0; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_74 = 5'h2 == lookupIdx ? valids_2 : _GEN_73; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_75 = 5'h3 == lookupIdx ? valids_3 : _GEN_74; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_76 = 5'h4 == lookupIdx ? valids_4 : _GEN_75; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_77 = 5'h5 == lookupIdx ? valids_5 : _GEN_76; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_78 = 5'h6 == lookupIdx ? valids_6 : _GEN_77; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_79 = 5'h7 == lookupIdx ? valids_7 : _GEN_78; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_80 = 5'h8 == lookupIdx ? valids_8 : _GEN_79; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_81 = 5'h9 == lookupIdx ? valids_9 : _GEN_80; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_82 = 5'ha == lookupIdx ? valids_10 : _GEN_81; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_83 = 5'hb == lookupIdx ? valids_11 : _GEN_82; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_84 = 5'hc == lookupIdx ? valids_12 : _GEN_83; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_85 = 5'hd == lookupIdx ? valids_13 : _GEN_84; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_86 = 5'he == lookupIdx ? valids_14 : _GEN_85; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_87 = 5'hf == lookupIdx ? valids_15 : _GEN_86; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_88 = 5'h10 == lookupIdx ? valids_16 : _GEN_87; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_89 = 5'h11 == lookupIdx ? valids_17 : _GEN_88; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_90 = 5'h12 == lookupIdx ? valids_18 : _GEN_89; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_91 = 5'h13 == lookupIdx ? valids_19 : _GEN_90; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_92 = 5'h14 == lookupIdx ? valids_20 : _GEN_91; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_93 = 5'h15 == lookupIdx ? valids_21 : _GEN_92; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_94 = 5'h16 == lookupIdx ? valids_22 : _GEN_93; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_95 = 5'h17 == lookupIdx ? valids_23 : _GEN_94; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_96 = 5'h18 == lookupIdx ? valids_24 : _GEN_95; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_97 = 5'h19 == lookupIdx ? valids_25 : _GEN_96; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_98 = 5'h1a == lookupIdx ? valids_26 : _GEN_97; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_99 = 5'h1b == lookupIdx ? valids_27 : _GEN_98; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_100 = 5'h1c == lookupIdx ? valids_28 : _GEN_99; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_101 = 5'h1d == lookupIdx ? valids_29 : _GEN_100; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_102 = 5'h1e == lookupIdx ? valids_30 : _GEN_101; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  _GEN_103 = 5'h1f == lookupIdx ? valids_31 : _GEN_102; // @[BTB.scala 45:39 BTB.scala 45:39]
  wire  btbHit = _GEN_103 & lines_pc_btbHit_MPORT_data == io_lookupPc; // @[BTB.scala 45:39]
  assign lines_pc_btbHit_MPORT_addr = io_lookupPc[4:0];
  assign lines_pc_btbHit_MPORT_data = lines_pc[lines_pc_btbHit_MPORT_addr]; // @[BTB.scala 30:29]
  assign lines_pc_io_lookupJump_MPORT_addr = io_lookupPc[4:0];
  assign lines_pc_io_lookupJump_MPORT_data = lines_pc[lines_pc_io_lookupJump_MPORT_addr]; // @[BTB.scala 30:29]
  assign lines_pc_io_lookupTgt_MPORT_addr = io_lookupPc[4:0];
  assign lines_pc_io_lookupTgt_MPORT_data = lines_pc[lines_pc_io_lookupTgt_MPORT_addr]; // @[BTB.scala 30:29]
  assign lines_pc_MPORT_data = 64'h0;
  assign lines_pc_MPORT_addr = io_pc[4:0];
  assign lines_pc_MPORT_mask = 1'h0;
  assign lines_pc_MPORT_en = io_branch;
  assign lines_pc_MPORT_1_data = io_pc;
  assign lines_pc_MPORT_1_addr = io_pc[4:0];
  assign lines_pc_MPORT_1_mask = 1'h1;
  assign lines_pc_MPORT_1_en = io_branch;
  assign lines_pc_MPORT_2_data = 64'h0;
  assign lines_pc_MPORT_2_addr = io_pc[4:0];
  assign lines_pc_MPORT_2_mask = 1'h0;
  assign lines_pc_MPORT_2_en = io_branch;
  assign lines_tgt_btbHit_MPORT_addr = io_lookupPc[4:0];
  assign lines_tgt_btbHit_MPORT_data = lines_tgt[lines_tgt_btbHit_MPORT_addr]; // @[BTB.scala 30:29]
  assign lines_tgt_io_lookupJump_MPORT_addr = io_lookupPc[4:0];
  assign lines_tgt_io_lookupJump_MPORT_data = lines_tgt[lines_tgt_io_lookupJump_MPORT_addr]; // @[BTB.scala 30:29]
  assign lines_tgt_io_lookupTgt_MPORT_addr = io_lookupPc[4:0];
  assign lines_tgt_io_lookupTgt_MPORT_data = lines_tgt[lines_tgt_io_lookupTgt_MPORT_addr]; // @[BTB.scala 30:29]
  assign lines_tgt_MPORT_data = 64'h0;
  assign lines_tgt_MPORT_addr = io_pc[4:0];
  assign lines_tgt_MPORT_mask = 1'h0;
  assign lines_tgt_MPORT_en = io_branch;
  assign lines_tgt_MPORT_1_data = 64'h0;
  assign lines_tgt_MPORT_1_addr = io_pc[4:0];
  assign lines_tgt_MPORT_1_mask = 1'h0;
  assign lines_tgt_MPORT_1_en = io_branch;
  assign lines_tgt_MPORT_2_data = io_tgt;
  assign lines_tgt_MPORT_2_addr = io_pc[4:0];
  assign lines_tgt_MPORT_2_mask = 1'h1;
  assign lines_tgt_MPORT_2_en = io_branch;
  assign lines_jump_btbHit_MPORT_addr = io_lookupPc[4:0];
  assign lines_jump_btbHit_MPORT_data = lines_jump[lines_jump_btbHit_MPORT_addr]; // @[BTB.scala 30:29]
  assign lines_jump_io_lookupJump_MPORT_addr = io_lookupPc[4:0];
  assign lines_jump_io_lookupJump_MPORT_data = lines_jump[lines_jump_io_lookupJump_MPORT_addr]; // @[BTB.scala 30:29]
  assign lines_jump_io_lookupTgt_MPORT_addr = io_lookupPc[4:0];
  assign lines_jump_io_lookupTgt_MPORT_data = lines_jump[lines_jump_io_lookupTgt_MPORT_addr]; // @[BTB.scala 30:29]
  assign lines_jump_MPORT_data = io_jump;
  assign lines_jump_MPORT_addr = io_pc[4:0];
  assign lines_jump_MPORT_mask = 1'h1;
  assign lines_jump_MPORT_en = io_branch;
  assign lines_jump_MPORT_1_data = 1'h0;
  assign lines_jump_MPORT_1_addr = io_pc[4:0];
  assign lines_jump_MPORT_1_mask = 1'h0;
  assign lines_jump_MPORT_1_en = io_branch;
  assign lines_jump_MPORT_2_data = 1'h0;
  assign lines_jump_MPORT_2_addr = io_pc[4:0];
  assign lines_jump_MPORT_2_mask = 1'h0;
  assign lines_jump_MPORT_2_en = io_branch;
  assign io_lookupBranch = _GEN_103 & lines_pc_btbHit_MPORT_data == io_lookupPc; // @[BTB.scala 45:39]
  assign io_lookupJump = btbHit & lines_jump_io_lookupJump_MPORT_data; // @[BTB.scala 49:25]
  assign io_lookupTgt = btbHit ? lines_tgt_io_lookupTgt_MPORT_data : 64'h0; // @[BTB.scala 50:25]
  always @(posedge clock) begin
    if(lines_pc_MPORT_en & lines_pc_MPORT_mask) begin
      lines_pc[lines_pc_MPORT_addr] <= lines_pc_MPORT_data; // @[BTB.scala 30:29]
    end
    if(lines_pc_MPORT_1_en & lines_pc_MPORT_1_mask) begin
      lines_pc[lines_pc_MPORT_1_addr] <= lines_pc_MPORT_1_data; // @[BTB.scala 30:29]
    end
    if(lines_pc_MPORT_2_en & lines_pc_MPORT_2_mask) begin
      lines_pc[lines_pc_MPORT_2_addr] <= lines_pc_MPORT_2_data; // @[BTB.scala 30:29]
    end
    if(lines_tgt_MPORT_en & lines_tgt_MPORT_mask) begin
      lines_tgt[lines_tgt_MPORT_addr] <= lines_tgt_MPORT_data; // @[BTB.scala 30:29]
    end
    if(lines_tgt_MPORT_1_en & lines_tgt_MPORT_1_mask) begin
      lines_tgt[lines_tgt_MPORT_1_addr] <= lines_tgt_MPORT_1_data; // @[BTB.scala 30:29]
    end
    if(lines_tgt_MPORT_2_en & lines_tgt_MPORT_2_mask) begin
      lines_tgt[lines_tgt_MPORT_2_addr] <= lines_tgt_MPORT_2_data; // @[BTB.scala 30:29]
    end
    if(lines_jump_MPORT_en & lines_jump_MPORT_mask) begin
      lines_jump[lines_jump_MPORT_addr] <= lines_jump_MPORT_data; // @[BTB.scala 30:29]
    end
    if(lines_jump_MPORT_1_en & lines_jump_MPORT_1_mask) begin
      lines_jump[lines_jump_MPORT_1_addr] <= lines_jump_MPORT_1_data; // @[BTB.scala 30:29]
    end
    if(lines_jump_MPORT_2_en & lines_jump_MPORT_2_mask) begin
      lines_jump[lines_jump_MPORT_2_addr] <= lines_jump_MPORT_2_data; // @[BTB.scala 30:29]
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_0 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_0 <= _GEN_0;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_1 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_1 <= _GEN_1;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_2 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_2 <= _GEN_2;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_3 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_3 <= _GEN_3;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_4 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_4 <= _GEN_4;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_5 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_5 <= _GEN_5;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_6 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_6 <= _GEN_6;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_7 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_7 <= _GEN_7;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_8 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_8 <= _GEN_8;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_9 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_9 <= _GEN_9;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_10 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_10 <= _GEN_10;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_11 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_11 <= _GEN_11;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_12 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_12 <= _GEN_12;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_13 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_13 <= _GEN_13;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_14 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_14 <= _GEN_14;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_15 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_15 <= _GEN_15;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_16 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_16 <= _GEN_16;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_17 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_17 <= _GEN_17;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_18 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_18 <= _GEN_18;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_19 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_19 <= _GEN_19;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_20 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_20 <= _GEN_20;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_21 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_21 <= _GEN_21;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_22 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_22 <= _GEN_22;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_23 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_23 <= _GEN_23;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_24 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_24 <= _GEN_24;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_25 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_25 <= _GEN_25;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_26 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_26 <= _GEN_26;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_27 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_27 <= _GEN_27;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_28 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_28 <= _GEN_28;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_29 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_29 <= _GEN_29;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_30 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_30 <= _GEN_30;
    end
    if (reset) begin // @[BTB.scala 29:33]
      valids_31 <= 1'h0; // @[BTB.scala 29:33]
    end else if (io_branch) begin // @[BTB.scala 35:19]
      valids_31 <= _GEN_31;
    end
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    lines_pc[initvar] = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    lines_tgt[initvar] = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    lines_jump[initvar] = _RAND_2[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  valids_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  valids_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  valids_2 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  valids_3 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  valids_4 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  valids_5 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  valids_6 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  valids_7 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  valids_8 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  valids_9 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  valids_10 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  valids_11 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  valids_12 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  valids_13 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  valids_14 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  valids_15 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  valids_16 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  valids_17 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  valids_18 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  valids_19 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  valids_20 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  valids_21 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  valids_22 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  valids_23 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  valids_24 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  valids_25 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  valids_26 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  valids_27 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  valids_28 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  valids_29 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  valids_30 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  valids_31 = _RAND_34[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_BPU(
  input         clock,
  input         reset,
  input         io_branchInfo_branch,
  input         io_branchInfo_jump,
  input         io_branchInfo_taken,
  input  [4:0]  io_branchInfo_idx,
  input  [63:0] io_branchInfo_pc,
  input  [63:0] io_branchInfo_tgt,
  input  [63:0] io_lookupPc,
  output        io_predTaken,
  output [63:0] io_predTgt,
  output [4:0]  io_predIdx
);
  wire  ghr_clock; // @[BPU.scala 20:29]
  wire  ghr_io_branch; // @[BPU.scala 20:29]
  wire  ghr_io_taken; // @[BPU.scala 20:29]
  wire [4:0] ghr_io_idx; // @[BPU.scala 20:29]
  wire  pht_clock; // @[BPU.scala 21:29]
  wire  pht_reset; // @[BPU.scala 21:29]
  wire  pht_io_prevBranch; // @[BPU.scala 21:29]
  wire  pht_io_prevTaken; // @[BPU.scala 21:29]
  wire [4:0] pht_io_prevIdx; // @[BPU.scala 21:29]
  wire [4:0] pht_io_idx; // @[BPU.scala 21:29]
  wire  pht_io_taken; // @[BPU.scala 21:29]
  wire  btb_clock; // @[BPU.scala 22:29]
  wire  btb_reset; // @[BPU.scala 22:29]
  wire  btb_io_branch; // @[BPU.scala 22:29]
  wire  btb_io_jump; // @[BPU.scala 22:29]
  wire [63:0] btb_io_pc; // @[BPU.scala 22:29]
  wire [63:0] btb_io_tgt; // @[BPU.scala 22:29]
  wire  btb_io_lookupBranch; // @[BPU.scala 22:29]
  wire  btb_io_lookupJump; // @[BPU.scala 22:29]
  wire [63:0] btb_io_lookupPc; // @[BPU.scala 22:29]
  wire [63:0] btb_io_lookupTgt; // @[BPU.scala 22:29]
  ysyx_210324_GHR ghr ( // @[BPU.scala 20:29]
    .clock(ghr_clock),
    .io_branch(ghr_io_branch),
    .io_taken(ghr_io_taken),
    .io_idx(ghr_io_idx)
  );
  ysyx_210324_PHT pht ( // @[BPU.scala 21:29]
    .clock(pht_clock),
    .reset(pht_reset),
    .io_prevBranch(pht_io_prevBranch),
    .io_prevTaken(pht_io_prevTaken),
    .io_prevIdx(pht_io_prevIdx),
    .io_idx(pht_io_idx),
    .io_taken(pht_io_taken)
  );
  ysyx_210324_BTB btb ( // @[BPU.scala 22:29]
    .clock(btb_clock),
    .reset(btb_reset),
    .io_branch(btb_io_branch),
    .io_jump(btb_io_jump),
    .io_pc(btb_io_pc),
    .io_tgt(btb_io_tgt),
    .io_lookupBranch(btb_io_lookupBranch),
    .io_lookupJump(btb_io_lookupJump),
    .io_lookupPc(btb_io_lookupPc),
    .io_lookupTgt(btb_io_lookupTgt)
  );
  assign io_predTaken = btb_io_lookupJump ? 1'h0 : btb_io_lookupBranch & pht_io_taken; // @[BPU.scala 44:27 BPU.scala 45:18 BPU.scala 47:18]
  assign io_predTgt = btb_io_lookupTgt; // @[BPU.scala 50:14]
  assign io_predIdx = io_lookupPc[4:0] ^ ghr_io_idx; // @[BPU.scala 28:59]
  assign ghr_clock = clock;
  assign ghr_io_branch = io_branchInfo_branch; // @[BPU.scala 24:17]
  assign ghr_io_taken = io_branchInfo_taken; // @[BPU.scala 25:17]
  assign pht_clock = clock;
  assign pht_reset = reset;
  assign pht_io_prevBranch = io_branchInfo_branch; // @[BPU.scala 29:21]
  assign pht_io_prevTaken = io_branchInfo_taken; // @[BPU.scala 30:21]
  assign pht_io_prevIdx = io_branchInfo_idx; // @[BPU.scala 31:21]
  assign pht_io_idx = io_lookupPc[4:0] ^ ghr_io_idx; // @[BPU.scala 28:59]
  assign btb_clock = clock;
  assign btb_reset = reset;
  assign btb_io_branch = io_branchInfo_branch; // @[BPU.scala 35:19]
  assign btb_io_jump = io_branchInfo_jump; // @[BPU.scala 36:19]
  assign btb_io_pc = io_branchInfo_pc; // @[BPU.scala 37:19]
  assign btb_io_tgt = io_branchInfo_tgt; // @[BPU.scala 38:19]
  assign btb_io_lookupPc = io_lookupPc; // @[BPU.scala 39:19]
endmodule
module ysyx_210324_IFU(
  input         clock,
  input         reset,
  input         io_globalEn,
  input         io_stall,
  input         io_branchInfo_branch,
  input         io_branchInfo_jump,
  input         io_branchInfo_taken,
  input  [4:0]  io_branchInfo_idx,
  input  [63:0] io_branchInfo_pc,
  input  [63:0] io_branchInfo_tgt,
  output [63:0] io_fetch_addr,
  input  [31:0] io_fetch_data,
  output        io_if2id_valid,
  output [31:0] io_if2id_inst,
  output [63:0] io_if2id_pc,
  output [4:0]  io_if2id_branIdx,
  output        io_if2id_predTaken,
  input         io_nxtPC_trap,
  input  [63:0] io_nxtPC_mtvec,
  input         io_nxtPC_mret,
  input  [63:0] io_nxtPC_mepc,
  input         io_nxtPC_branch,
  input  [63:0] io_nxtPC_tgt
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  bpu_clock; // @[IFU.scala 24:29]
  wire  bpu_reset; // @[IFU.scala 24:29]
  wire  bpu_io_branchInfo_branch; // @[IFU.scala 24:29]
  wire  bpu_io_branchInfo_jump; // @[IFU.scala 24:29]
  wire  bpu_io_branchInfo_taken; // @[IFU.scala 24:29]
  wire [4:0] bpu_io_branchInfo_idx; // @[IFU.scala 24:29]
  wire [63:0] bpu_io_branchInfo_pc; // @[IFU.scala 24:29]
  wire [63:0] bpu_io_branchInfo_tgt; // @[IFU.scala 24:29]
  wire [63:0] bpu_io_lookupPc; // @[IFU.scala 24:29]
  wire  bpu_io_predTaken; // @[IFU.scala 24:29]
  wire [63:0] bpu_io_predTgt; // @[IFU.scala 24:29]
  wire [4:0] bpu_io_predIdx; // @[IFU.scala 24:29]
  wire  valid = reset ? 1'h0 : 1'h1; // @[IFU.scala 20:32]
  reg [63:0] pc; // @[IFU.scala 22:36]
  wire [63:0] _pc_T_1 = pc + 64'h4; // @[IFU.scala 38:16]
  wire [63:0] _GEN_0 = bpu_io_predTaken ? bpu_io_predTgt : _pc_T_1; // @[IFU.scala 35:34 IFU.scala 36:10 IFU.scala 38:10]
  wire [63:0] _GEN_1 = io_nxtPC_branch ? io_nxtPC_tgt : _GEN_0; // @[IFU.scala 33:33 IFU.scala 34:10]
  ysyx_210324_BPU bpu ( // @[IFU.scala 24:29]
    .clock(bpu_clock),
    .reset(bpu_reset),
    .io_branchInfo_branch(bpu_io_branchInfo_branch),
    .io_branchInfo_jump(bpu_io_branchInfo_jump),
    .io_branchInfo_taken(bpu_io_branchInfo_taken),
    .io_branchInfo_idx(bpu_io_branchInfo_idx),
    .io_branchInfo_pc(bpu_io_branchInfo_pc),
    .io_branchInfo_tgt(bpu_io_branchInfo_tgt),
    .io_lookupPc(bpu_io_lookupPc),
    .io_predTaken(bpu_io_predTaken),
    .io_predTgt(bpu_io_predTgt),
    .io_predIdx(bpu_io_predIdx)
  );
  assign io_fetch_addr = pc; // @[IFU.scala 49:17]
  assign io_if2id_valid = io_stall ? 1'h0 : valid; // @[IFU.scala 42:28]
  assign io_if2id_inst = io_fetch_data; // @[IFU.scala 43:22]
  assign io_if2id_pc = pc; // @[IFU.scala 44:22]
  assign io_if2id_branIdx = bpu_io_predIdx; // @[IFU.scala 45:22]
  assign io_if2id_predTaken = bpu_io_predTaken; // @[IFU.scala 46:22]
  assign bpu_clock = clock;
  assign bpu_reset = reset;
  assign bpu_io_branchInfo_branch = io_branchInfo_branch; // @[IFU.scala 25:21]
  assign bpu_io_branchInfo_jump = io_branchInfo_jump; // @[IFU.scala 25:21]
  assign bpu_io_branchInfo_taken = io_branchInfo_taken; // @[IFU.scala 25:21]
  assign bpu_io_branchInfo_idx = io_branchInfo_idx; // @[IFU.scala 25:21]
  assign bpu_io_branchInfo_pc = io_branchInfo_pc; // @[IFU.scala 25:21]
  assign bpu_io_branchInfo_tgt = io_branchInfo_tgt; // @[IFU.scala 25:21]
  assign bpu_io_lookupPc = pc; // @[IFU.scala 26:21]
  always @(posedge clock) begin
    if (reset) begin // @[IFU.scala 22:36]
      pc <= 64'h30000000; // @[IFU.scala 22:36]
    end else if (io_globalEn) begin // @[IFU.scala 28:21]
      if (io_nxtPC_trap) begin // @[IFU.scala 29:25]
        pc <= io_nxtPC_mtvec; // @[IFU.scala 30:10]
      end else if (io_nxtPC_mret) begin // @[IFU.scala 31:31]
        pc <= io_nxtPC_mepc; // @[IFU.scala 32:10]
      end else begin
        pc <= _GEN_1;
      end
    end
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
  _RAND_0 = {2{`RANDOM}};
  pc = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_ImmExten(
  input  [31:0] io_inst,
  output [63:0] io_imm_I,
  output [63:0] io_imm_B,
  output [63:0] io_imm_S,
  output [63:0] io_imm_U,
  output [63:0] io_imm_J
);
  wire [11:0] I = io_inst[31:20]; // @[ImmExten.scala 12:28]
  wire [6:0] S_hi = io_inst[31:25]; // @[ImmExten.scala 13:32]
  wire [4:0] S_lo = io_inst[11:7]; // @[ImmExten.scala 13:49]
  wire [11:0] S = {S_hi,S_lo}; // @[Cat.scala 30:58]
  wire  B_hi_hi_hi = io_inst[31]; // @[ImmExten.scala 14:32]
  wire  B_hi_hi_lo = io_inst[7]; // @[ImmExten.scala 14:45]
  wire [5:0] B_hi_lo = io_inst[30:25]; // @[ImmExten.scala 14:57]
  wire [3:0] B_lo_hi = io_inst[11:8]; // @[ImmExten.scala 14:74]
  wire [12:0] B = {B_hi_hi_hi,B_hi_hi_lo,B_hi_lo,B_lo_hi,1'h0}; // @[Cat.scala 30:58]
  wire [19:0] U_hi = io_inst[31:12]; // @[ImmExten.scala 15:32]
  wire [31:0] U = {U_hi,12'h0}; // @[Cat.scala 30:58]
  wire [7:0] J_hi_hi_lo = io_inst[19:12]; // @[ImmExten.scala 16:45]
  wire  J_hi_lo = io_inst[20]; // @[ImmExten.scala 16:62]
  wire [9:0] J_lo_hi = io_inst[30:21]; // @[ImmExten.scala 16:75]
  wire [20:0] J = {B_hi_hi_hi,J_hi_hi_lo,J_hi_lo,J_lo_hi,1'h0}; // @[Cat.scala 30:58]
  wire  io_imm_I_signBit = I[11]; // @[NumExten.scala 11:20]
  wire [51:0] io_imm_I_hi = io_imm_I_signBit ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire  io_imm_S_signBit = S[11]; // @[NumExten.scala 11:20]
  wire [51:0] io_imm_S_hi = io_imm_S_signBit ? 52'hfffffffffffff : 52'h0; // @[Bitwise.scala 72:12]
  wire  io_imm_B_signBit = B[12]; // @[NumExten.scala 11:20]
  wire [50:0] io_imm_B_hi = io_imm_B_signBit ? 51'h7ffffffffffff : 51'h0; // @[Bitwise.scala 72:12]
  wire  io_imm_U_signBit = U[31]; // @[NumExten.scala 11:20]
  wire [31:0] io_imm_U_hi = io_imm_U_signBit ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire  io_imm_J_signBit = J[20]; // @[NumExten.scala 11:20]
  wire [42:0] io_imm_J_hi = io_imm_J_signBit ? 43'h7ffffffffff : 43'h0; // @[Bitwise.scala 72:12]
  assign io_imm_I = {io_imm_I_hi,I}; // @[Cat.scala 30:58]
  assign io_imm_B = {io_imm_B_hi,B}; // @[Cat.scala 30:58]
  assign io_imm_S = {io_imm_S_hi,S}; // @[Cat.scala 30:58]
  assign io_imm_U = {io_imm_U_hi,U}; // @[Cat.scala 30:58]
  assign io_imm_J = {io_imm_J_hi,J}; // @[Cat.scala 30:58]
endmodule
module ysyx_210324_ISADecoder(
  input  [31:0] io_inst,
  output        io_isa_ADD,
  output        io_isa_ADDI,
  output        io_isa_ADDW,
  output        io_isa_ADDIW,
  output        io_isa_SUB,
  output        io_isa_SUBW,
  output        io_isa_LUI,
  output        io_isa_AUIPC,
  output        io_isa_XOR,
  output        io_isa_XORI,
  output        io_isa_OR,
  output        io_isa_ORI,
  output        io_isa_AND,
  output        io_isa_ANDI,
  output        io_isa_SLL,
  output        io_isa_SLLI,
  output        io_isa_SLLW,
  output        io_isa_SLLIW,
  output        io_isa_SRL,
  output        io_isa_SRLI,
  output        io_isa_SRLW,
  output        io_isa_SRLIW,
  output        io_isa_SRA,
  output        io_isa_SRAI,
  output        io_isa_SRAW,
  output        io_isa_SRAIW,
  output        io_isa_SLT,
  output        io_isa_SLTI,
  output        io_isa_SLTU,
  output        io_isa_SLTIU,
  output        io_isa_BEQ,
  output        io_isa_BNE,
  output        io_isa_BLT,
  output        io_isa_BGE,
  output        io_isa_BLTU,
  output        io_isa_BGEU,
  output        io_isa_JAL,
  output        io_isa_JALR,
  output        io_isa_CSRRW,
  output        io_isa_CSRRS,
  output        io_isa_CSRRC,
  output        io_isa_CSRRWI,
  output        io_isa_CSRRSI,
  output        io_isa_CSRRCI,
  output        io_isa_LD,
  output        io_isa_LW,
  output        io_isa_LH,
  output        io_isa_LB,
  output        io_isa_LWU,
  output        io_isa_LHU,
  output        io_isa_LBU,
  output        io_isa_SD,
  output        io_isa_SW,
  output        io_isa_SH,
  output        io_isa_SB,
  output        io_isa_MRET,
  output        io_isa_GCD,
  output [63:0] io_imm_I,
  output [63:0] io_imm_B,
  output [63:0] io_imm_S,
  output [63:0] io_imm_U,
  output [63:0] io_imm_J,
  output        io_wen
);
  wire [31:0] immExten_io_inst; // @[ISADecoder.scala 107:34]
  wire [63:0] immExten_io_imm_I; // @[ISADecoder.scala 107:34]
  wire [63:0] immExten_io_imm_B; // @[ISADecoder.scala 107:34]
  wire [63:0] immExten_io_imm_S; // @[ISADecoder.scala 107:34]
  wire [63:0] immExten_io_imm_U; // @[ISADecoder.scala 107:34]
  wire [63:0] immExten_io_imm_J; // @[ISADecoder.scala 107:34]
  wire [31:0] _io_isa_SLLI_T = io_inst & 32'hfc00707f; // @[ISADecoder.scala 15:33]
  wire [31:0] _io_isa_ADDI_T = io_inst & 32'h707f; // @[ISADecoder.scala 21:33]
  wire [31:0] _io_isa_LUI_T = io_inst & 32'h7f; // @[ISADecoder.scala 75:33]
  wire [31:0] _io_isa_MUL_T = io_inst & 32'hfe00707f; // @[ISADecoder.scala 78:33]
  wire  arith = io_isa_ADD | io_isa_ADDW | io_isa_ADDI | io_isa_ADDIW | io_isa_SUB | io_isa_SUBW | io_isa_LUI |
    io_isa_AUIPC; // @[ISADecoder.scala 93:126]
  wire  logc = io_isa_XOR | io_isa_XORI | io_isa_OR | io_isa_ORI | io_isa_AND | io_isa_ANDI; // @[ISADecoder.scala 94:93]
  wire  shift = io_isa_SLL | io_isa_SLLI | io_isa_SLLW | io_isa_SLLIW | io_isa_SRL | io_isa_SRLI | io_isa_SRLW |
    io_isa_SRLIW | io_isa_SRA | io_isa_SRAI | io_isa_SRAW | io_isa_SRAIW; // @[ISADecoder.scala 95:187]
  wire  comp = io_isa_SLT | io_isa_SLTI | io_isa_SLTU | io_isa_SLTIU; // @[ISADecoder.scala 96:67]
  wire  link = io_isa_JAL | io_isa_JALR; // @[ISADecoder.scala 97:37]
  wire  load = io_isa_LD | io_isa_LW | io_isa_LH | io_isa_LB | io_isa_LWU | io_isa_LHU | io_isa_LBU; // @[ISADecoder.scala 99:103]
  wire  csr = io_isa_CSRRW | io_isa_CSRRS | io_isa_CSRRC | io_isa_CSRRWI | io_isa_CSRRSI | io_isa_CSRRCI; // @[ISADecoder.scala 103:105]
  ysyx_210324_ImmExten immExten ( // @[ISADecoder.scala 107:34]
    .io_inst(immExten_io_inst),
    .io_imm_I(immExten_io_imm_I),
    .io_imm_B(immExten_io_imm_B),
    .io_imm_S(immExten_io_imm_S),
    .io_imm_U(immExten_io_imm_U),
    .io_imm_J(immExten_io_imm_J)
  );
  assign io_isa_ADD = 32'h33 == _io_isa_SLLI_T; // @[ISADecoder.scala 52:33]
  assign io_isa_ADDI = 32'h13 == _io_isa_ADDI_T; // @[ISADecoder.scala 21:33]
  assign io_isa_ADDW = 32'h3b == _io_isa_SLLI_T; // @[ISADecoder.scala 53:33]
  assign io_isa_ADDIW = 32'h1b == _io_isa_ADDI_T; // @[ISADecoder.scala 22:33]
  assign io_isa_SUB = 32'h40000033 == _io_isa_SLLI_T; // @[ISADecoder.scala 54:33]
  assign io_isa_SUBW = 32'h4000003b == _io_isa_SLLI_T; // @[ISADecoder.scala 55:33]
  assign io_isa_LUI = 32'h37 == _io_isa_LUI_T; // @[ISADecoder.scala 75:33]
  assign io_isa_AUIPC = 32'h17 == _io_isa_LUI_T; // @[ISADecoder.scala 76:33]
  assign io_isa_XOR = 32'h4033 == _io_isa_SLLI_T; // @[ISADecoder.scala 56:33]
  assign io_isa_XORI = 32'h4013 == _io_isa_ADDI_T; // @[ISADecoder.scala 23:33]
  assign io_isa_OR = 32'h6033 == _io_isa_SLLI_T; // @[ISADecoder.scala 57:33]
  assign io_isa_ORI = 32'h6013 == _io_isa_ADDI_T; // @[ISADecoder.scala 24:33]
  assign io_isa_AND = 32'h7033 == _io_isa_SLLI_T; // @[ISADecoder.scala 58:33]
  assign io_isa_ANDI = 32'h7013 == _io_isa_ADDI_T; // @[ISADecoder.scala 25:33]
  assign io_isa_SLL = 32'h1033 == _io_isa_SLLI_T; // @[ISADecoder.scala 46:33]
  assign io_isa_SLLI = 32'h1013 == _io_isa_SLLI_T; // @[ISADecoder.scala 15:33]
  assign io_isa_SLLW = 32'h103b == _io_isa_SLLI_T; // @[ISADecoder.scala 47:33]
  assign io_isa_SLLIW = 32'h101b == _io_isa_SLLI_T; // @[ISADecoder.scala 16:33]
  assign io_isa_SRL = 32'h5033 == _io_isa_SLLI_T; // @[ISADecoder.scala 48:33]
  assign io_isa_SRLI = 32'h5013 == _io_isa_SLLI_T; // @[ISADecoder.scala 17:33]
  assign io_isa_SRLW = 32'h503b == _io_isa_SLLI_T; // @[ISADecoder.scala 49:33]
  assign io_isa_SRLIW = 32'h501b == _io_isa_SLLI_T; // @[ISADecoder.scala 18:33]
  assign io_isa_SRA = 32'h40005033 == _io_isa_SLLI_T; // @[ISADecoder.scala 50:33]
  assign io_isa_SRAI = 32'h40005013 == _io_isa_SLLI_T; // @[ISADecoder.scala 19:33]
  assign io_isa_SRAW = 32'h4000503b == _io_isa_SLLI_T; // @[ISADecoder.scala 51:33]
  assign io_isa_SRAIW = 32'h4000501b == _io_isa_SLLI_T; // @[ISADecoder.scala 20:33]
  assign io_isa_SLT = 32'h2033 == _io_isa_SLLI_T; // @[ISADecoder.scala 59:33]
  assign io_isa_SLTI = 32'h2013 == _io_isa_ADDI_T; // @[ISADecoder.scala 26:33]
  assign io_isa_SLTU = 32'h3033 == _io_isa_SLLI_T; // @[ISADecoder.scala 60:33]
  assign io_isa_SLTIU = 32'h3013 == _io_isa_ADDI_T; // @[ISADecoder.scala 27:33]
  assign io_isa_BEQ = 32'h63 == _io_isa_ADDI_T; // @[ISADecoder.scala 65:33]
  assign io_isa_BNE = 32'h1063 == _io_isa_ADDI_T; // @[ISADecoder.scala 66:33]
  assign io_isa_BLT = 32'h4063 == _io_isa_ADDI_T; // @[ISADecoder.scala 67:33]
  assign io_isa_BGE = 32'h5063 == _io_isa_ADDI_T; // @[ISADecoder.scala 68:33]
  assign io_isa_BLTU = 32'h6063 == _io_isa_ADDI_T; // @[ISADecoder.scala 69:33]
  assign io_isa_BGEU = 32'h7063 == _io_isa_ADDI_T; // @[ISADecoder.scala 70:33]
  assign io_isa_JAL = 32'h6f == _io_isa_LUI_T; // @[ISADecoder.scala 77:33]
  assign io_isa_JALR = 32'h67 == _io_isa_ADDI_T; // @[ISADecoder.scala 28:33]
  assign io_isa_CSRRW = 32'h1073 == _io_isa_ADDI_T; // @[ISADecoder.scala 33:33]
  assign io_isa_CSRRS = 32'h2073 == _io_isa_ADDI_T; // @[ISADecoder.scala 35:33]
  assign io_isa_CSRRC = 32'h3073 == _io_isa_ADDI_T; // @[ISADecoder.scala 37:33]
  assign io_isa_CSRRWI = 32'h5073 == _io_isa_ADDI_T; // @[ISADecoder.scala 34:33]
  assign io_isa_CSRRSI = 32'h6073 == _io_isa_ADDI_T; // @[ISADecoder.scala 36:33]
  assign io_isa_CSRRCI = 32'h7073 == _io_isa_ADDI_T; // @[ISADecoder.scala 38:33]
  assign io_isa_LD = 32'h3003 == _io_isa_ADDI_T; // @[ISADecoder.scala 39:33]
  assign io_isa_LW = 32'h2003 == _io_isa_ADDI_T; // @[ISADecoder.scala 40:33]
  assign io_isa_LH = 32'h1003 == _io_isa_ADDI_T; // @[ISADecoder.scala 42:33]
  assign io_isa_LB = 32'h3 == _io_isa_ADDI_T; // @[ISADecoder.scala 44:33]
  assign io_isa_LWU = 32'h6003 == _io_isa_ADDI_T; // @[ISADecoder.scala 41:33]
  assign io_isa_LHU = 32'h5003 == _io_isa_ADDI_T; // @[ISADecoder.scala 43:33]
  assign io_isa_LBU = 32'h4003 == _io_isa_ADDI_T; // @[ISADecoder.scala 45:33]
  assign io_isa_SD = 32'h3023 == _io_isa_ADDI_T; // @[ISADecoder.scala 71:33]
  assign io_isa_SW = 32'h2023 == _io_isa_ADDI_T; // @[ISADecoder.scala 72:33]
  assign io_isa_SH = 32'h1023 == _io_isa_ADDI_T; // @[ISADecoder.scala 73:33]
  assign io_isa_SB = 32'h23 == _io_isa_ADDI_T; // @[ISADecoder.scala 74:33]
  assign io_isa_MRET = 32'h30200073 == io_inst; // @[ISADecoder.scala 61:33]
  assign io_isa_GCD = 32'h8 == _io_isa_MUL_T; // @[ISADecoder.scala 91:33]
  assign io_imm_I = immExten_io_imm_I; // @[ISADecoder.scala 109:20]
  assign io_imm_B = immExten_io_imm_B; // @[ISADecoder.scala 109:20]
  assign io_imm_S = immExten_io_imm_S; // @[ISADecoder.scala 109:20]
  assign io_imm_U = immExten_io_imm_U; // @[ISADecoder.scala 109:20]
  assign io_imm_J = immExten_io_imm_J; // @[ISADecoder.scala 109:20]
  assign io_wen = arith | logc | shift | comp | link | load | csr | io_isa_GCD; // @[ISADecoder.scala 111:77]
  assign immExten_io_inst = io_inst; // @[ISADecoder.scala 108:20]
endmodule
module ysyx_210324_IDU(
  input         clock,
  input         reset,
  input         io_globalEn,
  input         io_stall,
  input         io_if2id_valid,
  input  [31:0] io_if2id_inst,
  input  [63:0] io_if2id_pc,
  input  [4:0]  io_if2id_branIdx,
  input         io_if2id_predTaken,
  input         io_wbdata_wen,
  input  [4:0]  io_wbdata_wdest,
  input  [63:0] io_wbdata_data,
  output        io_id2ex_valid,
  output [31:0] io_id2ex_inst,
  output [63:0] io_id2ex_pc,
  output [4:0]  io_id2ex_branIdx,
  output        io_id2ex_predTaken,
  output        io_id2ex_isa_ADD,
  output        io_id2ex_isa_ADDI,
  output        io_id2ex_isa_ADDW,
  output        io_id2ex_isa_ADDIW,
  output        io_id2ex_isa_SUB,
  output        io_id2ex_isa_SUBW,
  output        io_id2ex_isa_LUI,
  output        io_id2ex_isa_AUIPC,
  output        io_id2ex_isa_XOR,
  output        io_id2ex_isa_XORI,
  output        io_id2ex_isa_OR,
  output        io_id2ex_isa_ORI,
  output        io_id2ex_isa_AND,
  output        io_id2ex_isa_ANDI,
  output        io_id2ex_isa_SLL,
  output        io_id2ex_isa_SLLI,
  output        io_id2ex_isa_SLLW,
  output        io_id2ex_isa_SLLIW,
  output        io_id2ex_isa_SRL,
  output        io_id2ex_isa_SRLI,
  output        io_id2ex_isa_SRLW,
  output        io_id2ex_isa_SRLIW,
  output        io_id2ex_isa_SRA,
  output        io_id2ex_isa_SRAI,
  output        io_id2ex_isa_SRAW,
  output        io_id2ex_isa_SRAIW,
  output        io_id2ex_isa_SLT,
  output        io_id2ex_isa_SLTI,
  output        io_id2ex_isa_SLTU,
  output        io_id2ex_isa_SLTIU,
  output        io_id2ex_isa_BEQ,
  output        io_id2ex_isa_BNE,
  output        io_id2ex_isa_BLT,
  output        io_id2ex_isa_BGE,
  output        io_id2ex_isa_BLTU,
  output        io_id2ex_isa_BGEU,
  output        io_id2ex_isa_JAL,
  output        io_id2ex_isa_JALR,
  output        io_id2ex_isa_LD,
  output        io_id2ex_isa_LW,
  output        io_id2ex_isa_LH,
  output        io_id2ex_isa_LB,
  output        io_id2ex_isa_LWU,
  output        io_id2ex_isa_LHU,
  output        io_id2ex_isa_LBU,
  output        io_id2ex_isa_SD,
  output        io_id2ex_isa_SW,
  output        io_id2ex_isa_SH,
  output        io_id2ex_isa_SB,
  output        io_id2ex_isa_MRET,
  output [63:0] io_id2ex_src1,
  output [63:0] io_id2ex_src2,
  output [63:0] io_id2ex_imm_I,
  output [63:0] io_id2ex_imm_B,
  output [63:0] io_id2ex_imm_S,
  output [63:0] io_id2ex_imm_U,
  output [63:0] io_id2ex_imm_J,
  output        io_id2ex_wen,
  output [4:0]  io_id2ex_wdest
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] decoder_io_inst; // @[IDU.scala 27:33]
  wire  decoder_io_isa_ADD; // @[IDU.scala 27:33]
  wire  decoder_io_isa_ADDI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_ADDW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_ADDIW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SUB; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SUBW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_LUI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_AUIPC; // @[IDU.scala 27:33]
  wire  decoder_io_isa_XOR; // @[IDU.scala 27:33]
  wire  decoder_io_isa_XORI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_OR; // @[IDU.scala 27:33]
  wire  decoder_io_isa_ORI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_AND; // @[IDU.scala 27:33]
  wire  decoder_io_isa_ANDI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SLL; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SLLI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SLLW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SLLIW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SRL; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SRLI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SRLW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SRLIW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SRA; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SRAI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SRAW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SRAIW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SLT; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SLTI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SLTU; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SLTIU; // @[IDU.scala 27:33]
  wire  decoder_io_isa_BEQ; // @[IDU.scala 27:33]
  wire  decoder_io_isa_BNE; // @[IDU.scala 27:33]
  wire  decoder_io_isa_BLT; // @[IDU.scala 27:33]
  wire  decoder_io_isa_BGE; // @[IDU.scala 27:33]
  wire  decoder_io_isa_BLTU; // @[IDU.scala 27:33]
  wire  decoder_io_isa_BGEU; // @[IDU.scala 27:33]
  wire  decoder_io_isa_JAL; // @[IDU.scala 27:33]
  wire  decoder_io_isa_JALR; // @[IDU.scala 27:33]
  wire  decoder_io_isa_CSRRW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_CSRRS; // @[IDU.scala 27:33]
  wire  decoder_io_isa_CSRRC; // @[IDU.scala 27:33]
  wire  decoder_io_isa_CSRRWI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_CSRRSI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_CSRRCI; // @[IDU.scala 27:33]
  wire  decoder_io_isa_LD; // @[IDU.scala 27:33]
  wire  decoder_io_isa_LW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_LH; // @[IDU.scala 27:33]
  wire  decoder_io_isa_LB; // @[IDU.scala 27:33]
  wire  decoder_io_isa_LWU; // @[IDU.scala 27:33]
  wire  decoder_io_isa_LHU; // @[IDU.scala 27:33]
  wire  decoder_io_isa_LBU; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SD; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SW; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SH; // @[IDU.scala 27:33]
  wire  decoder_io_isa_SB; // @[IDU.scala 27:33]
  wire  decoder_io_isa_MRET; // @[IDU.scala 27:33]
  wire  decoder_io_isa_GCD; // @[IDU.scala 27:33]
  wire [63:0] decoder_io_imm_I; // @[IDU.scala 27:33]
  wire [63:0] decoder_io_imm_B; // @[IDU.scala 27:33]
  wire [63:0] decoder_io_imm_S; // @[IDU.scala 27:33]
  wire [63:0] decoder_io_imm_U; // @[IDU.scala 27:33]
  wire [63:0] decoder_io_imm_J; // @[IDU.scala 27:33]
  wire  decoder_io_wen; // @[IDU.scala 27:33]
  reg  idReg_valid; // @[Reg.scala 27:20]
  reg [31:0] idReg_inst; // @[Reg.scala 27:20]
  reg [63:0] idReg_pc; // @[Reg.scala 27:20]
  reg [4:0] idReg_branIdx; // @[Reg.scala 27:20]
  reg  idReg_predTaken; // @[Reg.scala 27:20]
  wire [4:0] rs1 = idReg_inst[19:15]; // @[IDU.scala 23:29]
  wire [4:0] rs2 = idReg_inst[24:20]; // @[IDU.scala 24:29]
  reg [63:0] gpr_0; // @[RegFile.scala 8:20]
  reg [63:0] gpr_1; // @[RegFile.scala 8:20]
  reg [63:0] gpr_2; // @[RegFile.scala 8:20]
  reg [63:0] gpr_3; // @[RegFile.scala 8:20]
  reg [63:0] gpr_4; // @[RegFile.scala 8:20]
  reg [63:0] gpr_5; // @[RegFile.scala 8:20]
  reg [63:0] gpr_6; // @[RegFile.scala 8:20]
  reg [63:0] gpr_7; // @[RegFile.scala 8:20]
  reg [63:0] gpr_8; // @[RegFile.scala 8:20]
  reg [63:0] gpr_9; // @[RegFile.scala 8:20]
  reg [63:0] gpr_10; // @[RegFile.scala 8:20]
  reg [63:0] gpr_11; // @[RegFile.scala 8:20]
  reg [63:0] gpr_12; // @[RegFile.scala 8:20]
  reg [63:0] gpr_13; // @[RegFile.scala 8:20]
  reg [63:0] gpr_14; // @[RegFile.scala 8:20]
  reg [63:0] gpr_15; // @[RegFile.scala 8:20]
  reg [63:0] gpr_16; // @[RegFile.scala 8:20]
  reg [63:0] gpr_17; // @[RegFile.scala 8:20]
  reg [63:0] gpr_18; // @[RegFile.scala 8:20]
  reg [63:0] gpr_19; // @[RegFile.scala 8:20]
  reg [63:0] gpr_20; // @[RegFile.scala 8:20]
  reg [63:0] gpr_21; // @[RegFile.scala 8:20]
  reg [63:0] gpr_22; // @[RegFile.scala 8:20]
  reg [63:0] gpr_23; // @[RegFile.scala 8:20]
  reg [63:0] gpr_24; // @[RegFile.scala 8:20]
  reg [63:0] gpr_25; // @[RegFile.scala 8:20]
  reg [63:0] gpr_26; // @[RegFile.scala 8:20]
  reg [63:0] gpr_27; // @[RegFile.scala 8:20]
  reg [63:0] gpr_28; // @[RegFile.scala 8:20]
  reg [63:0] gpr_29; // @[RegFile.scala 8:20]
  reg [63:0] gpr_30; // @[RegFile.scala 8:20]
  reg [63:0] gpr_31; // @[RegFile.scala 8:20]
  wire  src1En = io_wbdata_wen & rs1 == io_wbdata_wdest & rs1 != 5'h0; // @[IDU.scala 34:70]
  wire  src2En = io_wbdata_wen & rs2 == io_wbdata_wdest & rs2 != 5'h0; // @[IDU.scala 35:70]
  wire [63:0] _GEN_6 = 5'h1 == rs1 ? gpr_1 : gpr_0; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_7 = 5'h2 == rs1 ? gpr_2 : _GEN_6; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_8 = 5'h3 == rs1 ? gpr_3 : _GEN_7; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_9 = 5'h4 == rs1 ? gpr_4 : _GEN_8; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_10 = 5'h5 == rs1 ? gpr_5 : _GEN_9; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_11 = 5'h6 == rs1 ? gpr_6 : _GEN_10; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_12 = 5'h7 == rs1 ? gpr_7 : _GEN_11; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_13 = 5'h8 == rs1 ? gpr_8 : _GEN_12; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_14 = 5'h9 == rs1 ? gpr_9 : _GEN_13; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_15 = 5'ha == rs1 ? gpr_10 : _GEN_14; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_16 = 5'hb == rs1 ? gpr_11 : _GEN_15; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_17 = 5'hc == rs1 ? gpr_12 : _GEN_16; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_18 = 5'hd == rs1 ? gpr_13 : _GEN_17; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_19 = 5'he == rs1 ? gpr_14 : _GEN_18; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_20 = 5'hf == rs1 ? gpr_15 : _GEN_19; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_21 = 5'h10 == rs1 ? gpr_16 : _GEN_20; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_22 = 5'h11 == rs1 ? gpr_17 : _GEN_21; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_23 = 5'h12 == rs1 ? gpr_18 : _GEN_22; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_24 = 5'h13 == rs1 ? gpr_19 : _GEN_23; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_25 = 5'h14 == rs1 ? gpr_20 : _GEN_24; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_26 = 5'h15 == rs1 ? gpr_21 : _GEN_25; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_27 = 5'h16 == rs1 ? gpr_22 : _GEN_26; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_28 = 5'h17 == rs1 ? gpr_23 : _GEN_27; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_29 = 5'h18 == rs1 ? gpr_24 : _GEN_28; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_30 = 5'h19 == rs1 ? gpr_25 : _GEN_29; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_31 = 5'h1a == rs1 ? gpr_26 : _GEN_30; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_32 = 5'h1b == rs1 ? gpr_27 : _GEN_31; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_33 = 5'h1c == rs1 ? gpr_28 : _GEN_32; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_34 = 5'h1d == rs1 ? gpr_29 : _GEN_33; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_35 = 5'h1e == rs1 ? gpr_30 : _GEN_34; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_36 = 5'h1f == rs1 ? gpr_31 : _GEN_35; // @[IDU.scala 36:30 IDU.scala 36:30]
  wire [63:0] _GEN_38 = 5'h1 == rs2 ? gpr_1 : gpr_0; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_39 = 5'h2 == rs2 ? gpr_2 : _GEN_38; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_40 = 5'h3 == rs2 ? gpr_3 : _GEN_39; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_41 = 5'h4 == rs2 ? gpr_4 : _GEN_40; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_42 = 5'h5 == rs2 ? gpr_5 : _GEN_41; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_43 = 5'h6 == rs2 ? gpr_6 : _GEN_42; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_44 = 5'h7 == rs2 ? gpr_7 : _GEN_43; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_45 = 5'h8 == rs2 ? gpr_8 : _GEN_44; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_46 = 5'h9 == rs2 ? gpr_9 : _GEN_45; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_47 = 5'ha == rs2 ? gpr_10 : _GEN_46; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_48 = 5'hb == rs2 ? gpr_11 : _GEN_47; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_49 = 5'hc == rs2 ? gpr_12 : _GEN_48; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_50 = 5'hd == rs2 ? gpr_13 : _GEN_49; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_51 = 5'he == rs2 ? gpr_14 : _GEN_50; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_52 = 5'hf == rs2 ? gpr_15 : _GEN_51; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_53 = 5'h10 == rs2 ? gpr_16 : _GEN_52; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_54 = 5'h11 == rs2 ? gpr_17 : _GEN_53; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_55 = 5'h12 == rs2 ? gpr_18 : _GEN_54; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_56 = 5'h13 == rs2 ? gpr_19 : _GEN_55; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_57 = 5'h14 == rs2 ? gpr_20 : _GEN_56; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_58 = 5'h15 == rs2 ? gpr_21 : _GEN_57; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_59 = 5'h16 == rs2 ? gpr_22 : _GEN_58; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_60 = 5'h17 == rs2 ? gpr_23 : _GEN_59; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_61 = 5'h18 == rs2 ? gpr_24 : _GEN_60; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_62 = 5'h19 == rs2 ? gpr_25 : _GEN_61; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_63 = 5'h1a == rs2 ? gpr_26 : _GEN_62; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_64 = 5'h1b == rs2 ? gpr_27 : _GEN_63; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_65 = 5'h1c == rs2 ? gpr_28 : _GEN_64; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_66 = 5'h1d == rs2 ? gpr_29 : _GEN_65; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_67 = 5'h1e == rs2 ? gpr_30 : _GEN_66; // @[IDU.scala 37:30 IDU.scala 37:30]
  wire [63:0] _GEN_68 = 5'h1f == rs2 ? gpr_31 : _GEN_67; // @[IDU.scala 37:30 IDU.scala 37:30]
  ysyx_210324_ISADecoder decoder ( // @[IDU.scala 27:33]
    .io_inst(decoder_io_inst),
    .io_isa_ADD(decoder_io_isa_ADD),
    .io_isa_ADDI(decoder_io_isa_ADDI),
    .io_isa_ADDW(decoder_io_isa_ADDW),
    .io_isa_ADDIW(decoder_io_isa_ADDIW),
    .io_isa_SUB(decoder_io_isa_SUB),
    .io_isa_SUBW(decoder_io_isa_SUBW),
    .io_isa_LUI(decoder_io_isa_LUI),
    .io_isa_AUIPC(decoder_io_isa_AUIPC),
    .io_isa_XOR(decoder_io_isa_XOR),
    .io_isa_XORI(decoder_io_isa_XORI),
    .io_isa_OR(decoder_io_isa_OR),
    .io_isa_ORI(decoder_io_isa_ORI),
    .io_isa_AND(decoder_io_isa_AND),
    .io_isa_ANDI(decoder_io_isa_ANDI),
    .io_isa_SLL(decoder_io_isa_SLL),
    .io_isa_SLLI(decoder_io_isa_SLLI),
    .io_isa_SLLW(decoder_io_isa_SLLW),
    .io_isa_SLLIW(decoder_io_isa_SLLIW),
    .io_isa_SRL(decoder_io_isa_SRL),
    .io_isa_SRLI(decoder_io_isa_SRLI),
    .io_isa_SRLW(decoder_io_isa_SRLW),
    .io_isa_SRLIW(decoder_io_isa_SRLIW),
    .io_isa_SRA(decoder_io_isa_SRA),
    .io_isa_SRAI(decoder_io_isa_SRAI),
    .io_isa_SRAW(decoder_io_isa_SRAW),
    .io_isa_SRAIW(decoder_io_isa_SRAIW),
    .io_isa_SLT(decoder_io_isa_SLT),
    .io_isa_SLTI(decoder_io_isa_SLTI),
    .io_isa_SLTU(decoder_io_isa_SLTU),
    .io_isa_SLTIU(decoder_io_isa_SLTIU),
    .io_isa_BEQ(decoder_io_isa_BEQ),
    .io_isa_BNE(decoder_io_isa_BNE),
    .io_isa_BLT(decoder_io_isa_BLT),
    .io_isa_BGE(decoder_io_isa_BGE),
    .io_isa_BLTU(decoder_io_isa_BLTU),
    .io_isa_BGEU(decoder_io_isa_BGEU),
    .io_isa_JAL(decoder_io_isa_JAL),
    .io_isa_JALR(decoder_io_isa_JALR),
    .io_isa_CSRRW(decoder_io_isa_CSRRW),
    .io_isa_CSRRS(decoder_io_isa_CSRRS),
    .io_isa_CSRRC(decoder_io_isa_CSRRC),
    .io_isa_CSRRWI(decoder_io_isa_CSRRWI),
    .io_isa_CSRRSI(decoder_io_isa_CSRRSI),
    .io_isa_CSRRCI(decoder_io_isa_CSRRCI),
    .io_isa_LD(decoder_io_isa_LD),
    .io_isa_LW(decoder_io_isa_LW),
    .io_isa_LH(decoder_io_isa_LH),
    .io_isa_LB(decoder_io_isa_LB),
    .io_isa_LWU(decoder_io_isa_LWU),
    .io_isa_LHU(decoder_io_isa_LHU),
    .io_isa_LBU(decoder_io_isa_LBU),
    .io_isa_SD(decoder_io_isa_SD),
    .io_isa_SW(decoder_io_isa_SW),
    .io_isa_SH(decoder_io_isa_SH),
    .io_isa_SB(decoder_io_isa_SB),
    .io_isa_MRET(decoder_io_isa_MRET),
    .io_isa_GCD(decoder_io_isa_GCD),
    .io_imm_I(decoder_io_imm_I),
    .io_imm_B(decoder_io_imm_B),
    .io_imm_S(decoder_io_imm_S),
    .io_imm_U(decoder_io_imm_U),
    .io_imm_J(decoder_io_imm_J),
    .io_wen(decoder_io_wen)
  );
  assign io_id2ex_valid = io_stall ? 1'h0 : idReg_valid; // @[IDU.scala 43:28]
  assign io_id2ex_inst = idReg_inst; // @[IDU.scala 44:22]
  assign io_id2ex_pc = idReg_pc; // @[IDU.scala 45:22]
  assign io_id2ex_branIdx = idReg_branIdx; // @[IDU.scala 46:22]
  assign io_id2ex_predTaken = idReg_predTaken; // @[IDU.scala 47:22]
  assign io_id2ex_isa_ADD = decoder_io_isa_ADD; // @[IDU.scala 48:22]
  assign io_id2ex_isa_ADDI = decoder_io_isa_ADDI; // @[IDU.scala 48:22]
  assign io_id2ex_isa_ADDW = decoder_io_isa_ADDW; // @[IDU.scala 48:22]
  assign io_id2ex_isa_ADDIW = decoder_io_isa_ADDIW; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SUB = decoder_io_isa_SUB; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SUBW = decoder_io_isa_SUBW; // @[IDU.scala 48:22]
  assign io_id2ex_isa_LUI = decoder_io_isa_LUI; // @[IDU.scala 48:22]
  assign io_id2ex_isa_AUIPC = decoder_io_isa_AUIPC; // @[IDU.scala 48:22]
  assign io_id2ex_isa_XOR = decoder_io_isa_XOR; // @[IDU.scala 48:22]
  assign io_id2ex_isa_XORI = decoder_io_isa_XORI; // @[IDU.scala 48:22]
  assign io_id2ex_isa_OR = decoder_io_isa_OR; // @[IDU.scala 48:22]
  assign io_id2ex_isa_ORI = decoder_io_isa_ORI; // @[IDU.scala 48:22]
  assign io_id2ex_isa_AND = decoder_io_isa_AND; // @[IDU.scala 48:22]
  assign io_id2ex_isa_ANDI = decoder_io_isa_ANDI; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SLL = decoder_io_isa_SLL; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SLLI = decoder_io_isa_SLLI; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SLLW = decoder_io_isa_SLLW; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SLLIW = decoder_io_isa_SLLIW; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SRL = decoder_io_isa_SRL; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SRLI = decoder_io_isa_SRLI; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SRLW = decoder_io_isa_SRLW; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SRLIW = decoder_io_isa_SRLIW; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SRA = decoder_io_isa_SRA; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SRAI = decoder_io_isa_SRAI; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SRAW = decoder_io_isa_SRAW; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SRAIW = decoder_io_isa_SRAIW; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SLT = decoder_io_isa_SLT; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SLTI = decoder_io_isa_SLTI; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SLTU = decoder_io_isa_SLTU; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SLTIU = decoder_io_isa_SLTIU; // @[IDU.scala 48:22]
  assign io_id2ex_isa_BEQ = decoder_io_isa_BEQ; // @[IDU.scala 48:22]
  assign io_id2ex_isa_BNE = decoder_io_isa_BNE; // @[IDU.scala 48:22]
  assign io_id2ex_isa_BLT = decoder_io_isa_BLT; // @[IDU.scala 48:22]
  assign io_id2ex_isa_BGE = decoder_io_isa_BGE; // @[IDU.scala 48:22]
  assign io_id2ex_isa_BLTU = decoder_io_isa_BLTU; // @[IDU.scala 48:22]
  assign io_id2ex_isa_BGEU = decoder_io_isa_BGEU; // @[IDU.scala 48:22]
  assign io_id2ex_isa_JAL = decoder_io_isa_JAL; // @[IDU.scala 48:22]
  assign io_id2ex_isa_JALR = decoder_io_isa_JALR; // @[IDU.scala 48:22]
  assign io_id2ex_isa_LD = decoder_io_isa_LD; // @[IDU.scala 48:22]
  assign io_id2ex_isa_LW = decoder_io_isa_LW; // @[IDU.scala 48:22]
  assign io_id2ex_isa_LH = decoder_io_isa_LH; // @[IDU.scala 48:22]
  assign io_id2ex_isa_LB = decoder_io_isa_LB; // @[IDU.scala 48:22]
  assign io_id2ex_isa_LWU = decoder_io_isa_LWU; // @[IDU.scala 48:22]
  assign io_id2ex_isa_LHU = decoder_io_isa_LHU; // @[IDU.scala 48:22]
  assign io_id2ex_isa_LBU = decoder_io_isa_LBU; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SD = decoder_io_isa_SD; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SW = decoder_io_isa_SW; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SH = decoder_io_isa_SH; // @[IDU.scala 48:22]
  assign io_id2ex_isa_SB = decoder_io_isa_SB; // @[IDU.scala 48:22]
  assign io_id2ex_isa_MRET = decoder_io_isa_MRET; // @[IDU.scala 48:22]
  assign io_id2ex_src1 = src1En ? io_wbdata_data : _GEN_36; // @[IDU.scala 36:30]
  assign io_id2ex_src2 = src2En ? io_wbdata_data : _GEN_68; // @[IDU.scala 37:30]
  assign io_id2ex_imm_I = decoder_io_imm_I; // @[IDU.scala 51:22]
  assign io_id2ex_imm_B = decoder_io_imm_B; // @[IDU.scala 51:22]
  assign io_id2ex_imm_S = decoder_io_imm_S; // @[IDU.scala 51:22]
  assign io_id2ex_imm_U = decoder_io_imm_U; // @[IDU.scala 51:22]
  assign io_id2ex_imm_J = decoder_io_imm_J; // @[IDU.scala 51:22]
  assign io_id2ex_wen = decoder_io_wen; // @[IDU.scala 52:22]
  assign io_id2ex_wdest = idReg_inst[11:7]; // @[IDU.scala 25:29]
  assign decoder_io_inst = idReg_inst; // @[IDU.scala 28:19]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      idReg_valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      idReg_valid <= io_if2id_valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      idReg_inst <= 32'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      idReg_inst <= io_if2id_inst; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      idReg_pc <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      idReg_pc <= io_if2id_pc; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      idReg_branIdx <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      idReg_branIdx <= io_if2id_branIdx; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      idReg_predTaken <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      idReg_predTaken <= io_if2id_predTaken; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_0 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h0 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_0 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_1 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h1 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_1 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_2 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h2 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_2 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_3 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h3 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_3 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_4 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h4 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_4 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_5 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h5 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_5 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_6 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h6 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_6 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_7 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h7 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_7 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_8 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h8 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_8 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_9 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h9 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_9 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_10 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'ha == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_10 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_11 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'hb == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_11 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_12 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'hc == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_12 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_13 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'hd == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_13 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_14 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'he == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_14 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_15 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'hf == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_15 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_16 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h10 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_16 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_17 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h11 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_17 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_18 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h12 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_18 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_19 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h13 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_19 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_20 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h14 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_20 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_21 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h15 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_21 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_22 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h16 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_22 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_23 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h17 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_23 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_24 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h18 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_24 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_25 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h19 == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_25 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_26 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h1a == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_26 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_27 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h1b == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_27 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_28 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h1c == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_28 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_29 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h1d == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_29 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_30 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h1e == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_30 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
    if (reset) begin // @[RegFile.scala 8:20]
      gpr_31 <= 64'h0; // @[RegFile.scala 8:20]
    end else if (io_globalEn) begin // @[IDU.scala 39:21]
      if (io_wbdata_wen & io_wbdata_wdest != 5'h0) begin // @[RegFile.scala 13:31]
        if (5'h1f == io_wbdata_wdest) begin // @[RegFile.scala 13:43]
          gpr_31 <= io_wbdata_data; // @[RegFile.scala 13:43]
        end
      end
    end
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
  idReg_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  idReg_inst = _RAND_1[31:0];
  _RAND_2 = {2{`RANDOM}};
  idReg_pc = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  idReg_branIdx = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  idReg_predTaken = _RAND_4[0:0];
  _RAND_5 = {2{`RANDOM}};
  gpr_0 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  gpr_1 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  gpr_2 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  gpr_3 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  gpr_4 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  gpr_5 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  gpr_6 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  gpr_7 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  gpr_8 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  gpr_9 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  gpr_10 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  gpr_11 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  gpr_12 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  gpr_13 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  gpr_14 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  gpr_15 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  gpr_16 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  gpr_17 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  gpr_18 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  gpr_19 = _RAND_24[63:0];
  _RAND_25 = {2{`RANDOM}};
  gpr_20 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  gpr_21 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  gpr_22 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  gpr_23 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  gpr_24 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  gpr_25 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  gpr_26 = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  gpr_27 = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  gpr_28 = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  gpr_29 = _RAND_34[63:0];
  _RAND_35 = {2{`RANDOM}};
  gpr_30 = _RAND_35[63:0];
  _RAND_36 = {2{`RANDOM}};
  gpr_31 = _RAND_36[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_ALU(
  input         io_isa_ADD,
  input         io_isa_ADDI,
  input         io_isa_ADDW,
  input         io_isa_ADDIW,
  input         io_isa_SUB,
  input         io_isa_SUBW,
  input         io_isa_LUI,
  input         io_isa_XOR,
  input         io_isa_XORI,
  input         io_isa_OR,
  input         io_isa_ORI,
  input         io_isa_AND,
  input         io_isa_ANDI,
  input         io_isa_SLL,
  input         io_isa_SLLI,
  input         io_isa_SLLW,
  input         io_isa_SLLIW,
  input         io_isa_SRL,
  input         io_isa_SRLI,
  input         io_isa_SRLW,
  input         io_isa_SRLIW,
  input         io_isa_SRA,
  input         io_isa_SRAI,
  input         io_isa_SRAW,
  input         io_isa_SRAIW,
  input         io_isa_SLT,
  input         io_isa_SLTI,
  input         io_isa_SLTU,
  input         io_isa_SLTIU,
  input  [63:0] io_src1,
  input  [63:0] io_src2,
  input  [63:0] io_imm_I,
  input  [63:0] io_imm_U,
  output [63:0] io_res
);
  wire [62:0] addi_hi = io_isa_ADDI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _addi_T_1 = {addi_hi,io_isa_ADDI}; // @[Cat.scala 30:58]
  wire [63:0] _addi_T_3 = io_src1 + io_imm_I; // @[ALU.scala 15:68]
  wire [63:0] addi = _addi_T_1 & _addi_T_3; // @[ALU.scala 15:57]
  wire [62:0] add_hi = io_isa_ADD ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _add_T_1 = {add_hi,io_isa_ADD}; // @[Cat.scala 30:58]
  wire [63:0] _add_T_3 = io_src1 + io_src2; // @[ALU.scala 16:67]
  wire [63:0] add = _add_T_1 & _add_T_3; // @[ALU.scala 16:56]
  wire [62:0] lui_hi = io_isa_LUI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _lui_T_1 = {lui_hi,io_isa_LUI}; // @[Cat.scala 30:58]
  wire [63:0] lui = _lui_T_1 & io_imm_U; // @[ALU.scala 17:56]
  wire [62:0] sub_hi = io_isa_SUB ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sub_T_1 = {sub_hi,io_isa_SUB}; // @[Cat.scala 30:58]
  wire [63:0] _sub_T_3 = io_src1 - io_src2; // @[ALU.scala 18:67]
  wire [63:0] sub = _sub_T_1 & _sub_T_3; // @[ALU.scala 18:56]
  wire [62:0] addiw_hi = io_isa_ADDIW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _addiw_T_1 = {addiw_hi,io_isa_ADDIW}; // @[Cat.scala 30:58]
  wire [31:0] addiw_lo = _addi_T_3[31:0]; // @[ALU.scala 19:88]
  wire  addiw_signBit_1 = addiw_lo[31]; // @[NumExten.scala 11:20]
  wire [31:0] addiw_hi_1 = addiw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _addiw_T_5 = {addiw_hi_1,addiw_lo}; // @[Cat.scala 30:58]
  wire [63:0] addiw = _addiw_T_1 & _addiw_T_5; // @[ALU.scala 19:58]
  wire [62:0] addw_hi = io_isa_ADDW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _addw_T_1 = {addw_hi,io_isa_ADDW}; // @[Cat.scala 30:58]
  wire [31:0] addw_lo = _add_T_3[31:0]; // @[ALU.scala 20:86]
  wire  addw_signBit_1 = addw_lo[31]; // @[NumExten.scala 11:20]
  wire [31:0] addw_hi_1 = addw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _addw_T_5 = {addw_hi_1,addw_lo}; // @[Cat.scala 30:58]
  wire [63:0] addw = _addw_T_1 & _addw_T_5; // @[ALU.scala 20:57]
  wire [62:0] subw_hi = io_isa_SUBW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _subw_T_1 = {subw_hi,io_isa_SUBW}; // @[Cat.scala 30:58]
  wire [31:0] subw_lo = _sub_T_3[31:0]; // @[ALU.scala 21:86]
  wire  subw_signBit_1 = subw_lo[31]; // @[NumExten.scala 11:20]
  wire [31:0] subw_hi_1 = subw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _subw_T_5 = {subw_hi_1,subw_lo}; // @[Cat.scala 30:58]
  wire [63:0] subw = _subw_T_1 & _subw_T_5; // @[ALU.scala 21:57]
  wire [63:0] _arith_T = addi | add; // @[ALU.scala 22:30]
  wire [63:0] _arith_T_1 = _arith_T | lui; // @[ALU.scala 22:36]
  wire [63:0] _arith_T_2 = _arith_T_1 | sub; // @[ALU.scala 22:42]
  wire [63:0] _arith_T_3 = _arith_T_2 | addiw; // @[ALU.scala 22:48]
  wire [63:0] _arith_T_4 = _arith_T_3 | addw; // @[ALU.scala 22:56]
  wire [63:0] arith = _arith_T_4 | subw; // @[ALU.scala 22:63]
  wire [62:0] andi_hi = io_isa_ANDI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _andi_T_1 = {andi_hi,io_isa_ANDI}; // @[Cat.scala 30:58]
  wire [63:0] _andi_T_2 = io_src1 & io_imm_I; // @[ALU.scala 24:67]
  wire [63:0] andi = _andi_T_1 & _andi_T_2; // @[ALU.scala 24:56]
  wire [62:0] and_hi = io_isa_AND ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _and_T_1 = {and_hi,io_isa_AND}; // @[Cat.scala 30:58]
  wire [63:0] _and_T_2 = io_src1 & io_src2; // @[ALU.scala 25:66]
  wire [63:0] and_ = _and_T_1 & _and_T_2; // @[ALU.scala 25:55]
  wire [62:0] ori_hi = io_isa_ORI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _ori_T_1 = {ori_hi,io_isa_ORI}; // @[Cat.scala 30:58]
  wire [63:0] _ori_T_2 = io_src1 | io_imm_I; // @[ALU.scala 26:66]
  wire [63:0] ori = _ori_T_1 & _ori_T_2; // @[ALU.scala 26:55]
  wire [62:0] or_hi = io_isa_OR ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _or_T_1 = {or_hi,io_isa_OR}; // @[Cat.scala 30:58]
  wire [63:0] _or_T_2 = io_src1 | io_src2; // @[ALU.scala 27:65]
  wire [63:0] or_ = _or_T_1 & _or_T_2; // @[ALU.scala 27:54]
  wire [62:0] xori_hi = io_isa_XORI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _xori_T_1 = {xori_hi,io_isa_XORI}; // @[Cat.scala 30:58]
  wire [63:0] _xori_T_2 = io_src1 ^ io_imm_I; // @[ALU.scala 28:67]
  wire [63:0] xori = _xori_T_1 & _xori_T_2; // @[ALU.scala 28:56]
  wire [62:0] xor_hi = io_isa_XOR ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _xor_T_1 = {xor_hi,io_isa_XOR}; // @[Cat.scala 30:58]
  wire [63:0] _xor_T_2 = io_src1 ^ io_src2; // @[ALU.scala 29:66]
  wire [63:0] xor_ = _xor_T_1 & _xor_T_2; // @[ALU.scala 29:55]
  wire [63:0] _logc_T = andi | and_; // @[ALU.scala 30:29]
  wire [63:0] _logc_T_1 = _logc_T | ori; // @[ALU.scala 30:35]
  wire [63:0] _logc_T_2 = _logc_T_1 | or_; // @[ALU.scala 30:41]
  wire [63:0] _logc_T_3 = _logc_T_2 | xori; // @[ALU.scala 30:46]
  wire [63:0] logc = _logc_T_3 | xor_; // @[ALU.scala 30:53]
  wire [63:0] slt = io_isa_SLT & $signed(io_src1) < $signed(io_src2) ? 64'h1 : 64'h0; // @[ALU.scala 32:28]
  wire [63:0] slti = io_isa_SLTI & $signed(io_src1) < $signed(io_imm_I) ? 64'h1 : 64'h0; // @[ALU.scala 33:28]
  wire [63:0] sltu = io_isa_SLTU & io_src1 < io_src2 ? 64'h1 : 64'h0; // @[ALU.scala 34:28]
  wire [63:0] sltiu = io_isa_SLTIU & io_src1 < io_imm_I ? 64'h1 : 64'h0; // @[ALU.scala 35:28]
  wire [63:0] _comp_T = slt | slti; // @[ALU.scala 36:29]
  wire [63:0] _comp_T_1 = _comp_T | sltu; // @[ALU.scala 36:36]
  wire [63:0] comp = _comp_T_1 | sltiu; // @[ALU.scala 36:43]
  wire [62:0] sll_hi = io_isa_SLL ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sll_T_1 = {sll_hi,io_isa_SLL}; // @[Cat.scala 30:58]
  wire [126:0] _GEN_0 = {{63'd0}, io_src1}; // @[ALU.scala 38:67]
  wire [126:0] _sll_T_3 = _GEN_0 << io_src2[5:0]; // @[ALU.scala 38:67]
  wire [63:0] sll = _sll_T_1 & _sll_T_3[63:0]; // @[ALU.scala 38:56]
  wire [62:0] srl_hi = io_isa_SRL ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srl_T_1 = {srl_hi,io_isa_SRL}; // @[Cat.scala 30:58]
  wire [63:0] _srl_T_3 = io_src1 >> io_src2[5:0]; // @[ALU.scala 39:67]
  wire [63:0] srl = _srl_T_1 & _srl_T_3; // @[ALU.scala 39:56]
  wire [62:0] sra_hi = io_isa_SRA ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sra_T_1 = {sra_hi,io_isa_SRA}; // @[Cat.scala 30:58]
  wire [63:0] _sra_T_5 = $signed(io_src1) >>> io_src2[5:0]; // @[ALU.scala 40:92]
  wire [63:0] sra = _sra_T_1 & _sra_T_5; // @[ALU.scala 40:56]
  wire [62:0] slli_hi = io_isa_SLLI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _slli_T_1 = {slli_hi,io_isa_SLLI}; // @[Cat.scala 30:58]
  wire [126:0] _slli_T_3 = _GEN_0 << io_imm_I[5:0]; // @[ALU.scala 41:68]
  wire [63:0] slli = _slli_T_1 & _slli_T_3[63:0]; // @[ALU.scala 41:57]
  wire [62:0] srli_hi = io_isa_SRLI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srli_T_1 = {srli_hi,io_isa_SRLI}; // @[Cat.scala 30:58]
  wire [63:0] _srli_T_3 = io_src1 >> io_imm_I[5:0]; // @[ALU.scala 42:68]
  wire [63:0] srli = _srli_T_1 & _srli_T_3; // @[ALU.scala 42:57]
  wire [62:0] srai_hi = io_isa_SRAI ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srai_T_1 = {srai_hi,io_isa_SRAI}; // @[Cat.scala 30:58]
  wire [63:0] _srai_T_5 = $signed(io_src1) >>> io_imm_I[5:0]; // @[ALU.scala 43:94]
  wire [63:0] srai = _srai_T_1 & _srai_T_5; // @[ALU.scala 43:57]
  wire [62:0] sllw_hi = io_isa_SLLW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sllw_T_1 = {sllw_hi,io_isa_SLLW}; // @[Cat.scala 30:58]
  wire [94:0] _GEN_2 = {{31'd0}, io_src1}; // @[ALU.scala 44:76]
  wire [94:0] _sllw_T_3 = _GEN_2 << io_src2[4:0]; // @[ALU.scala 44:76]
  wire [31:0] sllw_lo = _sllw_T_3[31:0]; // @[ALU.scala 44:93]
  wire  sllw_signBit_1 = sllw_lo[31]; // @[NumExten.scala 11:20]
  wire [31:0] sllw_hi_1 = sllw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sllw_T_5 = {sllw_hi_1,sllw_lo}; // @[Cat.scala 30:58]
  wire [63:0] sllw = _sllw_T_1 & _sllw_T_5; // @[ALU.scala 44:57]
  wire [62:0] srlw_hi = io_isa_SRLW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srlw_T_1 = {srlw_hi,io_isa_SRLW}; // @[Cat.scala 30:58]
  wire [31:0] srlw_lo = io_src1[31:0] >> io_src2[4:0]; // @[ALU.scala 45:83]
  wire  srlw_signBit_1 = srlw_lo[31]; // @[NumExten.scala 11:20]
  wire [31:0] srlw_hi_1 = srlw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srlw_T_5 = {srlw_hi_1,srlw_lo}; // @[Cat.scala 30:58]
  wire [63:0] srlw = _srlw_T_1 & _srlw_T_5; // @[ALU.scala 45:57]
  wire [62:0] sraw_hi = io_isa_SRAW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sraw_T_1 = {sraw_hi,io_isa_SRAW}; // @[Cat.scala 30:58]
  wire [31:0] _sraw_T_3 = io_src1[31:0]; // @[ALU.scala 46:83]
  wire [31:0] sraw_lo = $signed(_sraw_T_3) >>> io_src2[4:0]; // @[ALU.scala 46:108]
  wire  sraw_signBit_1 = sraw_lo[31]; // @[NumExten.scala 11:20]
  wire [31:0] sraw_hi_1 = sraw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sraw_T_7 = {sraw_hi_1,sraw_lo}; // @[Cat.scala 30:58]
  wire [63:0] sraw = _sraw_T_1 & _sraw_T_7; // @[ALU.scala 46:57]
  wire [62:0] slliw_hi = io_isa_SLLIW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _slliw_T_1 = {slliw_hi,io_isa_SLLIW}; // @[Cat.scala 30:58]
  wire [94:0] _slliw_T_3 = _GEN_2 << io_imm_I[4:0]; // @[ALU.scala 47:77]
  wire [31:0] slliw_lo = _slliw_T_3[31:0]; // @[ALU.scala 47:95]
  wire  slliw_signBit_1 = slliw_lo[31]; // @[NumExten.scala 11:20]
  wire [31:0] slliw_hi_1 = slliw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _slliw_T_5 = {slliw_hi_1,slliw_lo}; // @[Cat.scala 30:58]
  wire [63:0] slliw = _slliw_T_1 & _slliw_T_5; // @[ALU.scala 47:58]
  wire [62:0] srliw_hi = io_isa_SRLIW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srliw_T_1 = {srliw_hi,io_isa_SRLIW}; // @[Cat.scala 30:58]
  wire [31:0] srliw_lo = io_src1[31:0] >> io_imm_I[4:0]; // @[ALU.scala 48:84]
  wire  srliw_signBit_1 = srliw_lo[31]; // @[NumExten.scala 11:20]
  wire [31:0] srliw_hi_1 = srliw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _srliw_T_5 = {srliw_hi_1,srliw_lo}; // @[Cat.scala 30:58]
  wire [63:0] srliw = _srliw_T_1 & _srliw_T_5; // @[ALU.scala 48:58]
  wire [62:0] sraiw_hi = io_isa_SRAIW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sraiw_T_1 = {sraiw_hi,io_isa_SRAIW}; // @[Cat.scala 30:58]
  wire [31:0] sraiw_lo = $signed(_sraw_T_3) >>> io_imm_I[4:0]; // @[ALU.scala 49:110]
  wire  sraiw_signBit_1 = sraiw_lo[31]; // @[NumExten.scala 11:20]
  wire [31:0] sraiw_hi_1 = sraiw_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sraiw_T_7 = {sraiw_hi_1,sraiw_lo}; // @[Cat.scala 30:58]
  wire [63:0] sraiw = _sraiw_T_1 & _sraiw_T_7; // @[ALU.scala 49:58]
  wire [63:0] _shift_T = sll | srl; // @[ALU.scala 50:29]
  wire [63:0] _shift_T_1 = _shift_T | sra; // @[ALU.scala 50:35]
  wire [63:0] _shift_T_2 = _shift_T_1 | slli; // @[ALU.scala 50:41]
  wire [63:0] _shift_T_3 = _shift_T_2 | srli; // @[ALU.scala 50:48]
  wire [63:0] _shift_T_4 = _shift_T_3 | srai; // @[ALU.scala 50:55]
  wire [63:0] _shift_T_5 = _shift_T_4 | sllw; // @[ALU.scala 50:62]
  wire [63:0] _shift_T_6 = _shift_T_5 | srlw; // @[ALU.scala 50:69]
  wire [63:0] _shift_T_7 = _shift_T_6 | sraw; // @[ALU.scala 50:76]
  wire [63:0] _shift_T_8 = _shift_T_7 | slliw; // @[ALU.scala 50:83]
  wire [63:0] _shift_T_9 = _shift_T_8 | srliw; // @[ALU.scala 50:91]
  wire [63:0] shift = _shift_T_9 | sraiw; // @[ALU.scala 50:99]
  wire [63:0] _io_res_T = arith | logc; // @[ALU.scala 52:19]
  wire [63:0] _io_res_T_1 = _io_res_T | comp; // @[ALU.scala 52:26]
  assign io_res = _io_res_T_1 | shift; // @[ALU.scala 52:33]
endmodule
module ysyx_210324_BEU(
  input         io_isa_BEQ,
  input         io_isa_BNE,
  input         io_isa_BLT,
  input         io_isa_BGE,
  input         io_isa_BLTU,
  input         io_isa_BGEU,
  input         io_isa_JAL,
  input         io_isa_JALR,
  input  [63:0] io_imm_I,
  input  [63:0] io_imm_B,
  input  [63:0] io_imm_J,
  input  [63:0] io_src1,
  input  [63:0] io_src2,
  input  [63:0] io_pc,
  input  [4:0]  io_branIdx,
  output        io_branchInfo_branch,
  output        io_branchInfo_jump,
  output        io_branchInfo_taken,
  output [4:0]  io_branchInfo_idx,
  output [63:0] io_branchInfo_pc,
  output [63:0] io_branchInfo_tgt,
  output        io_branch,
  output [63:0] io_tgt
);
  wire  beq = io_isa_BEQ & io_src1 == io_src2; // @[BEU.scala 21:36]
  wire  bne = io_isa_BNE & io_src1 != io_src2; // @[BEU.scala 22:36]
  wire  bgeu = io_isa_BGEU & io_src1 >= io_src2; // @[BEU.scala 23:37]
  wire  bltu = io_isa_BLTU & io_src1 < io_src2; // @[BEU.scala 24:37]
  wire  bge = io_isa_BGE & $signed(io_src1) >= $signed(io_src2); // @[BEU.scala 25:36]
  wire  blt = io_isa_BLT & $signed(io_src1) < $signed(io_src2); // @[BEU.scala 26:36]
  wire  b = beq | bne | bgeu | bltu | bge | blt; // @[BEU.scala 27:55]
  wire [63:0] b_tgt = io_pc + io_imm_B; // @[BEU.scala 33:34]
  wire [63:0] jal_tgt = io_pc + io_imm_J; // @[BEU.scala 34:34]
  wire [63:0] jalr_tgt = io_src1 + io_imm_I; // @[BEU.scala 35:36]
  wire [63:0] _GEN_0 = io_isa_JALR ? jalr_tgt : b_tgt; // @[BEU.scala 41:20 BEU.scala 42:12 BEU.scala 44:12]
  assign io_branchInfo_branch = io_isa_BEQ | io_isa_BNE | io_isa_BGEU | io_isa_BLTU | io_isa_BGE | io_isa_BLT |
    io_isa_JAL | io_isa_JALR; // @[BEU.scala 28:122]
  assign io_branchInfo_jump = io_isa_JAL | io_isa_JALR; // @[BEU.scala 48:31]
  assign io_branchInfo_taken = io_branch; // @[BEU.scala 49:24]
  assign io_branchInfo_idx = io_branIdx; // @[BEU.scala 50:24]
  assign io_branchInfo_pc = io_pc; // @[BEU.scala 51:24]
  assign io_branchInfo_tgt = io_tgt; // @[BEU.scala 52:24]
  assign io_branch = b | io_isa_JAL | io_isa_JALR; // @[BEU.scala 37:24]
  assign io_tgt = io_isa_JAL ? jal_tgt : _GEN_0; // @[BEU.scala 39:13 BEU.scala 40:12]
endmodule
module ysyx_210324_CSRReg(
  input         clock,
  input         reset,
  input         io_globalEn,
  input  [63:0] io_pc,
  input  [63:0] io_inst,
  input  [63:0] io_src,
  output [63:0] io_data,
  input         io_mtip,
  output        io_timeIntrEn,
  output        io_ecallEn,
  output [63:0] io_csrState_mepc,
  output [63:0] io_csrState_mtvec
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire [63:0] _csrrwVis_T = io_inst & 64'h707f; // @[CSRReg.scala 24:38]
  wire  csrrwVis = 64'h1073 == _csrrwVis_T; // @[CSRReg.scala 24:38]
  wire  csrrwiVis = 64'h5073 == _csrrwVis_T; // @[CSRReg.scala 25:38]
  wire  csrrsVis = 64'h2073 == _csrrwVis_T; // @[CSRReg.scala 26:38]
  wire  csrrsiVis = 64'h6073 == _csrrwVis_T; // @[CSRReg.scala 27:38]
  wire  csrrcVis = 64'h3073 == _csrrwVis_T; // @[CSRReg.scala 28:38]
  wire  csrrciVis = 64'h7073 == _csrrwVis_T; // @[CSRReg.scala 29:38]
  wire  csrVis = csrrcVis | csrrciVis | csrrsVis | csrrsiVis | csrrwVis | csrrwiVis; // @[CSRReg.scala 30:88]
  wire [63:0] _mretVis_T = io_inst & 64'hffffffff; // @[CSRReg.scala 31:38]
  wire  mretVis = 64'h30200073 == _mretVis_T; // @[CSRReg.scala 31:38]
  wire  ecallEn = 64'h73 == _mretVis_T; // @[CSRReg.scala 32:38]
  wire [4:0] zimm_lo = io_inst[19:15]; // @[CSRReg.scala 33:44]
  wire [63:0] zimm = {59'h0,zimm_lo}; // @[Cat.scala 30:58]
  wire [11:0] addr = io_inst[31:20]; // @[CSRReg.scala 34:36]
  reg [63:0] mcycle; // @[CSRReg.scala 36:35]
  reg [63:0] mstatus; // @[CSRReg.scala 37:35]
  reg [63:0] mtvec; // @[CSRReg.scala 38:35]
  reg [63:0] mcause; // @[CSRReg.scala 39:35]
  reg [63:0] mepc; // @[CSRReg.scala 40:35]
  reg [63:0] mie; // @[CSRReg.scala 41:35]
  reg [63:0] mip; // @[CSRReg.scala 42:35]
  reg [63:0] mscratch; // @[CSRReg.scala 43:35]
  reg [63:0] medeleg; // @[CSRReg.scala 44:35]
  reg [63:0] mhartid; // @[CSRReg.scala 45:35]
  wire  mhartidVis = addr == 12'hf14; // @[CSRReg.scala 47:36]
  wire  mstatusVis = addr == 12'h300; // @[CSRReg.scala 48:36]
  wire  mieVis = addr == 12'h304; // @[CSRReg.scala 49:36]
  wire  mtvecVis = addr == 12'h305; // @[CSRReg.scala 50:36]
  wire  mscratchVis = addr == 12'h340; // @[CSRReg.scala 51:36]
  wire  mepcVis = addr == 12'h341; // @[CSRReg.scala 52:36]
  wire  mcauseVis = addr == 12'h342; // @[CSRReg.scala 53:36]
  wire  mipVis = addr == 12'h344; // @[CSRReg.scala 54:36]
  wire  mcycleVis = addr == 12'hb00; // @[CSRReg.scala 55:36]
  wire  medelegVis = addr == 12'h302; // @[CSRReg.scala 56:36]
  wire  _mcycleVal_T = csrVis & mcycleVis; // @[CSRReg.scala 58:42]
  wire [63:0] mcycleVal = csrVis & mcycleVis ? mcycle : 64'h0; // @[CSRReg.scala 58:34]
  wire  _mstatusVal_T = csrVis & mstatusVis; // @[CSRReg.scala 59:42]
  wire [63:0] mstatusVal = csrVis & mstatusVis ? mstatus : 64'h0; // @[CSRReg.scala 59:34]
  wire  _mtvecVal_T = csrVis & mtvecVis; // @[CSRReg.scala 60:42]
  wire [63:0] mtvecVal = csrVis & mtvecVis ? mtvec : 64'h0; // @[CSRReg.scala 60:34]
  wire  _mcauseVal_T = csrVis & mcauseVis; // @[CSRReg.scala 61:42]
  wire [63:0] mcauseVal = csrVis & mcauseVis ? mcause : 64'h0; // @[CSRReg.scala 61:34]
  wire  _mepcVal_T = csrVis & mepcVis; // @[CSRReg.scala 62:42]
  wire [63:0] mepcVal = csrVis & mepcVis ? mepc : 64'h0; // @[CSRReg.scala 62:34]
  wire  _mieVal_T = csrVis & mieVis; // @[CSRReg.scala 63:42]
  wire [63:0] mieVal = csrVis & mieVis ? mie : 64'h0; // @[CSRReg.scala 63:34]
  wire  _mipVal_T = csrVis & mipVis; // @[CSRReg.scala 64:42]
  wire [63:0] mipVal = csrVis & mipVis ? mip : 64'h0; // @[CSRReg.scala 64:34]
  wire  _mscratchVal_T = csrVis & mscratchVis; // @[CSRReg.scala 65:42]
  wire [63:0] mscratchVal = csrVis & mscratchVis ? mscratch : 64'h0; // @[CSRReg.scala 65:34]
  wire  _medelegVal_T = csrVis & medelegVis; // @[CSRReg.scala 66:42]
  wire [63:0] medelegVal = csrVis & medelegVis ? medeleg : 64'h0; // @[CSRReg.scala 66:34]
  wire  _mhartidVal_T = csrVis & mhartidVis; // @[CSRReg.scala 67:42]
  wire [63:0] mhartidVal = csrVis & mhartidVis ? mhartid : 64'h0; // @[CSRReg.scala 67:34]
  wire [63:0] _rdVal_T = mcycleVal | mstatusVal; // @[CSRReg.scala 68:35]
  wire [63:0] _rdVal_T_1 = _rdVal_T | mtvecVal; // @[CSRReg.scala 68:48]
  wire [63:0] _rdVal_T_2 = _rdVal_T_1 | mcauseVal; // @[CSRReg.scala 68:59]
  wire [63:0] _rdVal_T_3 = _rdVal_T_2 | mepcVal; // @[CSRReg.scala 68:71]
  wire [63:0] _rdVal_T_4 = _rdVal_T_3 | mieVal; // @[CSRReg.scala 68:81]
  wire [63:0] _rdVal_T_5 = _rdVal_T_4 | mipVal; // @[CSRReg.scala 68:90]
  wire [63:0] _rdVal_T_6 = _rdVal_T_5 | mscratchVal; // @[CSRReg.scala 68:99]
  wire [63:0] _rdVal_T_7 = _rdVal_T_6 | medelegVal; // @[CSRReg.scala 69:17]
  wire [63:0] rdVal = _rdVal_T_7 | mhartidVal; // @[CSRReg.scala 69:30]
  wire  MIE = mstatus[3]; // @[CSRReg.scala 71:37]
  wire  MPIE = mstatus[7]; // @[CSRReg.scala 72:37]
  wire  MTIE = mie[7]; // @[CSRReg.scala 74:33]
  wire  MTIP = mip[7]; // @[CSRReg.scala 75:33]
  wire  TIV = MIE & (MTIE & MTIP); // @[CSRReg.scala 76:34]
  reg  TIVR; // @[Reg.scala 27:20]
  wire  timeIntrEn = TIV & ~TIVR; // @[CSRReg.scala 78:34]
  wire [62:0] rcData_hi = csrrcVis ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _rcData_T_1 = {rcData_hi,csrrcVis}; // @[Cat.scala 30:58]
  wire [63:0] _rcData_T_2 = ~io_src; // @[CSRReg.scala 83:67]
  wire [63:0] _rcData_T_3 = rdVal & _rcData_T_2; // @[CSRReg.scala 83:65]
  wire [63:0] rcData = _rcData_T_1 & _rcData_T_3; // @[CSRReg.scala 83:56]
  wire [62:0] rciData_hi = csrrciVis ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _rciData_T_1 = {rciData_hi,csrrciVis}; // @[Cat.scala 30:58]
  wire [63:0] _rciData_T_2 = ~zimm; // @[CSRReg.scala 84:68]
  wire [63:0] _rciData_T_3 = rdVal & _rciData_T_2; // @[CSRReg.scala 84:66]
  wire [63:0] rciData = _rciData_T_1 & _rciData_T_3; // @[CSRReg.scala 84:57]
  wire [62:0] rsData_hi = csrrsVis ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _rsData_T_1 = {rsData_hi,csrrsVis}; // @[Cat.scala 30:58]
  wire [63:0] _rsData_T_2 = rdVal | io_src; // @[CSRReg.scala 85:65]
  wire [63:0] rsData = _rsData_T_1 & _rsData_T_2; // @[CSRReg.scala 85:56]
  wire [62:0] rsiData_hi = csrrsiVis ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _rsiData_T_1 = {rsiData_hi,csrrsiVis}; // @[Cat.scala 30:58]
  wire [63:0] _rsiData_T_2 = rdVal | zimm; // @[CSRReg.scala 86:66]
  wire [63:0] rsiData = _rsiData_T_1 & _rsiData_T_2; // @[CSRReg.scala 86:57]
  wire [62:0] rwData_hi = csrrwVis ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _rwData_T_1 = {rwData_hi,csrrwVis}; // @[Cat.scala 30:58]
  wire [63:0] rwData = _rwData_T_1 & io_src; // @[CSRReg.scala 87:56]
  wire [62:0] rwiData_hi = csrrwiVis ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _rwiData_T_1 = {rwiData_hi,csrrwiVis}; // @[Cat.scala 30:58]
  wire [63:0] rwiData = _rwiData_T_1 & zimm; // @[CSRReg.scala 88:57]
  wire [63:0] _wData_T = rcData | rciData; // @[CSRReg.scala 89:34]
  wire [63:0] _wData_T_1 = _wData_T | rsData; // @[CSRReg.scala 89:44]
  wire [63:0] _wData_T_2 = _wData_T_1 | rsiData; // @[CSRReg.scala 89:53]
  wire [63:0] _wData_T_3 = _wData_T_2 | rwData; // @[CSRReg.scala 89:63]
  wire [63:0] wData = _wData_T_3 | rwiData; // @[CSRReg.scala 89:72]
  wire  SD = wData[16:15] == 2'h3 | wData[14:13] == 2'h3; // @[CSRReg.scala 91:52]
  wire [50:0] trapStatus_hi_hi_hi = mstatus[63:13]; // @[CSRReg.scala 93:41]
  wire [63:0] trapStatus = {trapStatus_hi_hi_hi,2'h3,3'h0,MIE,7'h0}; // @[Cat.scala 30:58]
  wire [63:0] mretStatus = {trapStatus_hi_hi_hi,2'h0,4'h1,3'h0,MPIE,3'h0}; // @[Cat.scala 30:58]
  wire [63:0] _mcycle_T_1 = mcycle + 64'h1; // @[CSRReg.scala 99:22]
  wire  _T_1 = timeIntrEn | ecallEn; // @[CSRReg.scala 103:21]
  wire [62:0] mstatus_lo = wData[62:0]; // @[CSRReg.scala 108:38]
  wire [63:0] _mstatus_T = {SD,mstatus_lo}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_2 = _mstatusVal_T ? _mstatus_T : mstatus; // @[CSRReg.scala 107:38 CSRReg.scala 108:15 CSRReg.scala 37:35]
  wire [7:0] _mip_T = io_mtip ? 8'h80 : 8'h0; // @[CSRReg.scala 116:17]
  wire [63:0] _GEN_8 = _mcauseVal_T ? wData : mcause; // @[CSRReg.scala 123:37 CSRReg.scala 124:14 CSRReg.scala 39:35]
  assign io_data = _rdVal_T_7 | mhartidVal; // @[CSRReg.scala 69:30]
  assign io_timeIntrEn = TIV & ~TIVR; // @[CSRReg.scala 78:34]
  assign io_ecallEn = 64'h73 == _mretVis_T; // @[CSRReg.scala 32:38]
  assign io_csrState_mepc = mepc; // @[CSRReg.scala 144:30]
  assign io_csrState_mtvec = mtvec; // @[CSRReg.scala 157:30]
  always @(posedge clock) begin
    if (reset) begin // @[CSRReg.scala 36:35]
      mcycle <= 64'h0; // @[CSRReg.scala 36:35]
    end else if (_mcycleVal_T) begin // @[CSRReg.scala 96:29]
      mcycle <= wData; // @[CSRReg.scala 97:12]
    end else begin
      mcycle <= _mcycle_T_1; // @[CSRReg.scala 99:12]
    end
    if (reset) begin // @[CSRReg.scala 37:35]
      mstatus <= 64'h0; // @[CSRReg.scala 37:35]
    end else if (io_globalEn) begin // @[CSRReg.scala 102:21]
      if (timeIntrEn | ecallEn) begin // @[CSRReg.scala 103:33]
        mstatus <= trapStatus; // @[CSRReg.scala 104:15]
      end else if (mretVis) begin // @[CSRReg.scala 105:25]
        mstatus <= mretStatus; // @[CSRReg.scala 106:15]
      end else begin
        mstatus <= _GEN_2;
      end
    end
    if (reset) begin // @[CSRReg.scala 38:35]
      mtvec <= 64'h0; // @[CSRReg.scala 38:35]
    end else if (io_globalEn) begin // @[CSRReg.scala 102:21]
      if (_mtvecVal_T) begin // @[CSRReg.scala 111:30]
        mtvec <= wData; // @[CSRReg.scala 111:38]
      end
    end
    if (reset) begin // @[CSRReg.scala 39:35]
      mcause <= 64'h0; // @[CSRReg.scala 39:35]
    end else if (io_globalEn) begin // @[CSRReg.scala 102:21]
      if (timeIntrEn) begin // @[CSRReg.scala 119:22]
        mcause <= 64'h8000000000000007; // @[CSRReg.scala 120:14]
      end else if (ecallEn) begin // @[CSRReg.scala 121:25]
        mcause <= 64'hb; // @[CSRReg.scala 122:14]
      end else begin
        mcause <= _GEN_8;
      end
    end
    if (reset) begin // @[CSRReg.scala 40:35]
      mepc <= 64'h0; // @[CSRReg.scala 40:35]
    end else if (io_globalEn) begin // @[CSRReg.scala 102:21]
      if (_T_1) begin // @[CSRReg.scala 127:33]
        mepc <= io_pc; // @[CSRReg.scala 128:12]
      end else if (_mepcVal_T) begin // @[CSRReg.scala 129:35]
        mepc <= wData; // @[CSRReg.scala 130:12]
      end
    end
    if (reset) begin // @[CSRReg.scala 41:35]
      mie <= 64'h0; // @[CSRReg.scala 41:35]
    end else if (io_globalEn) begin // @[CSRReg.scala 102:21]
      if (_mieVal_T) begin // @[CSRReg.scala 112:28]
        mie <= wData; // @[CSRReg.scala 112:34]
      end
    end
    if (reset) begin // @[CSRReg.scala 42:35]
      mip <= 64'h0; // @[CSRReg.scala 42:35]
    end else if (io_globalEn) begin // @[CSRReg.scala 102:21]
      if (_mipVal_T) begin // @[CSRReg.scala 113:28]
        mip <= wData; // @[CSRReg.scala 114:11]
      end else begin
        mip <= {{56'd0}, _mip_T}; // @[CSRReg.scala 116:11]
      end
    end
    if (reset) begin // @[CSRReg.scala 43:35]
      mscratch <= 64'h0; // @[CSRReg.scala 43:35]
    end else if (io_globalEn) begin // @[CSRReg.scala 102:21]
      if (_mscratchVal_T) begin // @[CSRReg.scala 133:33]
        mscratch <= wData; // @[CSRReg.scala 133:44]
      end
    end
    if (reset) begin // @[CSRReg.scala 44:35]
      medeleg <= 64'h0; // @[CSRReg.scala 44:35]
    end else if (io_globalEn) begin // @[CSRReg.scala 102:21]
      if (_medelegVal_T) begin // @[CSRReg.scala 134:32]
        medeleg <= wData; // @[CSRReg.scala 134:42]
      end
    end
    if (reset) begin // @[CSRReg.scala 45:35]
      mhartid <= 64'h0; // @[CSRReg.scala 45:35]
    end else if (io_globalEn) begin // @[CSRReg.scala 102:21]
      if (_mhartidVal_T) begin // @[CSRReg.scala 135:32]
        mhartid <= wData; // @[CSRReg.scala 135:42]
      end
    end
    if (reset) begin // @[Reg.scala 27:20]
      TIVR <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      TIVR <= TIV; // @[Reg.scala 28:23]
    end
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
  _RAND_0 = {2{`RANDOM}};
  mcycle = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  mstatus = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  mtvec = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  mcause = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  mepc = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  mie = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  mip = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  mscratch = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  medeleg = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  mhartid = _RAND_9[63:0];
  _RAND_10 = {1{`RANDOM}};
  TIVR = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_EXU(
  input         clock,
  input         reset,
  input         io_globalEn,
  input         io_mtip,
  output        io_stall,
  input         io_id2ex_valid,
  input  [31:0] io_id2ex_inst,
  input  [63:0] io_id2ex_pc,
  input  [4:0]  io_id2ex_branIdx,
  input         io_id2ex_predTaken,
  input         io_id2ex_isa_ADD,
  input         io_id2ex_isa_ADDI,
  input         io_id2ex_isa_ADDW,
  input         io_id2ex_isa_ADDIW,
  input         io_id2ex_isa_SUB,
  input         io_id2ex_isa_SUBW,
  input         io_id2ex_isa_LUI,
  input         io_id2ex_isa_AUIPC,
  input         io_id2ex_isa_XOR,
  input         io_id2ex_isa_XORI,
  input         io_id2ex_isa_OR,
  input         io_id2ex_isa_ORI,
  input         io_id2ex_isa_AND,
  input         io_id2ex_isa_ANDI,
  input         io_id2ex_isa_SLL,
  input         io_id2ex_isa_SLLI,
  input         io_id2ex_isa_SLLW,
  input         io_id2ex_isa_SLLIW,
  input         io_id2ex_isa_SRL,
  input         io_id2ex_isa_SRLI,
  input         io_id2ex_isa_SRLW,
  input         io_id2ex_isa_SRLIW,
  input         io_id2ex_isa_SRA,
  input         io_id2ex_isa_SRAI,
  input         io_id2ex_isa_SRAW,
  input         io_id2ex_isa_SRAIW,
  input         io_id2ex_isa_SLT,
  input         io_id2ex_isa_SLTI,
  input         io_id2ex_isa_SLTU,
  input         io_id2ex_isa_SLTIU,
  input         io_id2ex_isa_BEQ,
  input         io_id2ex_isa_BNE,
  input         io_id2ex_isa_BLT,
  input         io_id2ex_isa_BGE,
  input         io_id2ex_isa_BLTU,
  input         io_id2ex_isa_BGEU,
  input         io_id2ex_isa_JAL,
  input         io_id2ex_isa_JALR,
  input         io_id2ex_isa_LD,
  input         io_id2ex_isa_LW,
  input         io_id2ex_isa_LH,
  input         io_id2ex_isa_LB,
  input         io_id2ex_isa_LWU,
  input         io_id2ex_isa_LHU,
  input         io_id2ex_isa_LBU,
  input         io_id2ex_isa_SD,
  input         io_id2ex_isa_SW,
  input         io_id2ex_isa_SH,
  input         io_id2ex_isa_SB,
  input         io_id2ex_isa_MRET,
  input  [63:0] io_id2ex_src1,
  input  [63:0] io_id2ex_src2,
  input  [63:0] io_id2ex_imm_I,
  input  [63:0] io_id2ex_imm_B,
  input  [63:0] io_id2ex_imm_S,
  input  [63:0] io_id2ex_imm_U,
  input  [63:0] io_id2ex_imm_J,
  input         io_id2ex_wen,
  input  [4:0]  io_id2ex_wdest,
  input         io_bypassMem_wen,
  input  [4:0]  io_bypassMem_wdest,
  input  [63:0] io_bypassMem_data,
  input         io_bypassWb_wen,
  input  [4:0]  io_bypassWb_wdest,
  input  [63:0] io_bypassWb_data,
  output        io_ex2mem_valid,
  output        io_ex2mem_isa_LD,
  output        io_ex2mem_isa_LW,
  output        io_ex2mem_isa_LH,
  output        io_ex2mem_isa_LB,
  output        io_ex2mem_isa_LWU,
  output        io_ex2mem_isa_LHU,
  output        io_ex2mem_isa_LBU,
  output        io_ex2mem_isa_SD,
  output        io_ex2mem_isa_SW,
  output        io_ex2mem_isa_SH,
  output        io_ex2mem_isa_SB,
  output [63:0] io_ex2mem_src1,
  output [63:0] io_ex2mem_src2,
  output [63:0] io_ex2mem_imm_I,
  output [63:0] io_ex2mem_imm_S,
  output        io_ex2mem_wen,
  output [4:0]  io_ex2mem_wdest,
  output [63:0] io_ex2mem_aluRes,
  output [63:0] io_ex2mem_link,
  output [63:0] io_ex2mem_auipc,
  output [63:0] io_ex2mem_csrData,
  output        io_nxtPC_trap,
  output [63:0] io_nxtPC_mtvec,
  output        io_nxtPC_mret,
  output [63:0] io_nxtPC_mepc,
  output        io_nxtPC_branch,
  output [63:0] io_nxtPC_tgt,
  output        io_branchInfo_branch,
  output        io_branchInfo_jump,
  output        io_branchInfo_taken,
  output [4:0]  io_branchInfo_idx,
  output [63:0] io_branchInfo_pc,
  output [63:0] io_branchInfo_tgt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [63:0] _RAND_59;
  reg [63:0] _RAND_60;
  reg [63:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
`endif // RANDOMIZE_REG_INIT
  wire  alu_io_isa_ADD; // @[EXU.scala 39:29]
  wire  alu_io_isa_ADDI; // @[EXU.scala 39:29]
  wire  alu_io_isa_ADDW; // @[EXU.scala 39:29]
  wire  alu_io_isa_ADDIW; // @[EXU.scala 39:29]
  wire  alu_io_isa_SUB; // @[EXU.scala 39:29]
  wire  alu_io_isa_SUBW; // @[EXU.scala 39:29]
  wire  alu_io_isa_LUI; // @[EXU.scala 39:29]
  wire  alu_io_isa_XOR; // @[EXU.scala 39:29]
  wire  alu_io_isa_XORI; // @[EXU.scala 39:29]
  wire  alu_io_isa_OR; // @[EXU.scala 39:29]
  wire  alu_io_isa_ORI; // @[EXU.scala 39:29]
  wire  alu_io_isa_AND; // @[EXU.scala 39:29]
  wire  alu_io_isa_ANDI; // @[EXU.scala 39:29]
  wire  alu_io_isa_SLL; // @[EXU.scala 39:29]
  wire  alu_io_isa_SLLI; // @[EXU.scala 39:29]
  wire  alu_io_isa_SLLW; // @[EXU.scala 39:29]
  wire  alu_io_isa_SLLIW; // @[EXU.scala 39:29]
  wire  alu_io_isa_SRL; // @[EXU.scala 39:29]
  wire  alu_io_isa_SRLI; // @[EXU.scala 39:29]
  wire  alu_io_isa_SRLW; // @[EXU.scala 39:29]
  wire  alu_io_isa_SRLIW; // @[EXU.scala 39:29]
  wire  alu_io_isa_SRA; // @[EXU.scala 39:29]
  wire  alu_io_isa_SRAI; // @[EXU.scala 39:29]
  wire  alu_io_isa_SRAW; // @[EXU.scala 39:29]
  wire  alu_io_isa_SRAIW; // @[EXU.scala 39:29]
  wire  alu_io_isa_SLT; // @[EXU.scala 39:29]
  wire  alu_io_isa_SLTI; // @[EXU.scala 39:29]
  wire  alu_io_isa_SLTU; // @[EXU.scala 39:29]
  wire  alu_io_isa_SLTIU; // @[EXU.scala 39:29]
  wire [63:0] alu_io_src1; // @[EXU.scala 39:29]
  wire [63:0] alu_io_src2; // @[EXU.scala 39:29]
  wire [63:0] alu_io_imm_I; // @[EXU.scala 39:29]
  wire [63:0] alu_io_imm_U; // @[EXU.scala 39:29]
  wire [63:0] alu_io_res; // @[EXU.scala 39:29]
  wire  beu_io_isa_BEQ; // @[EXU.scala 58:29]
  wire  beu_io_isa_BNE; // @[EXU.scala 58:29]
  wire  beu_io_isa_BLT; // @[EXU.scala 58:29]
  wire  beu_io_isa_BGE; // @[EXU.scala 58:29]
  wire  beu_io_isa_BLTU; // @[EXU.scala 58:29]
  wire  beu_io_isa_BGEU; // @[EXU.scala 58:29]
  wire  beu_io_isa_JAL; // @[EXU.scala 58:29]
  wire  beu_io_isa_JALR; // @[EXU.scala 58:29]
  wire [63:0] beu_io_imm_I; // @[EXU.scala 58:29]
  wire [63:0] beu_io_imm_B; // @[EXU.scala 58:29]
  wire [63:0] beu_io_imm_J; // @[EXU.scala 58:29]
  wire [63:0] beu_io_src1; // @[EXU.scala 58:29]
  wire [63:0] beu_io_src2; // @[EXU.scala 58:29]
  wire [63:0] beu_io_pc; // @[EXU.scala 58:29]
  wire [4:0] beu_io_branIdx; // @[EXU.scala 58:29]
  wire  beu_io_branchInfo_branch; // @[EXU.scala 58:29]
  wire  beu_io_branchInfo_jump; // @[EXU.scala 58:29]
  wire  beu_io_branchInfo_taken; // @[EXU.scala 58:29]
  wire [4:0] beu_io_branchInfo_idx; // @[EXU.scala 58:29]
  wire [63:0] beu_io_branchInfo_pc; // @[EXU.scala 58:29]
  wire [63:0] beu_io_branchInfo_tgt; // @[EXU.scala 58:29]
  wire  beu_io_branch; // @[EXU.scala 58:29]
  wire [63:0] beu_io_tgt; // @[EXU.scala 58:29]
  wire  csrReg_clock; // @[EXU.scala 72:32]
  wire  csrReg_reset; // @[EXU.scala 72:32]
  wire  csrReg_io_globalEn; // @[EXU.scala 72:32]
  wire [63:0] csrReg_io_pc; // @[EXU.scala 72:32]
  wire [63:0] csrReg_io_inst; // @[EXU.scala 72:32]
  wire [63:0] csrReg_io_src; // @[EXU.scala 72:32]
  wire [63:0] csrReg_io_data; // @[EXU.scala 72:32]
  wire  csrReg_io_mtip; // @[EXU.scala 72:32]
  wire  csrReg_io_timeIntrEn; // @[EXU.scala 72:32]
  wire  csrReg_io_ecallEn; // @[EXU.scala 72:32]
  wire [63:0] csrReg_io_csrState_mepc; // @[EXU.scala 72:32]
  wire [63:0] csrReg_io_csrState_mtvec; // @[EXU.scala 72:32]
  reg  exReg_valid; // @[Reg.scala 27:20]
  reg [31:0] exReg_inst; // @[Reg.scala 27:20]
  reg [63:0] exReg_pc; // @[Reg.scala 27:20]
  reg [4:0] exReg_branIdx; // @[Reg.scala 27:20]
  reg  exReg_predTaken; // @[Reg.scala 27:20]
  reg  exReg_isa_ADD; // @[Reg.scala 27:20]
  reg  exReg_isa_ADDI; // @[Reg.scala 27:20]
  reg  exReg_isa_ADDW; // @[Reg.scala 27:20]
  reg  exReg_isa_ADDIW; // @[Reg.scala 27:20]
  reg  exReg_isa_SUB; // @[Reg.scala 27:20]
  reg  exReg_isa_SUBW; // @[Reg.scala 27:20]
  reg  exReg_isa_LUI; // @[Reg.scala 27:20]
  reg  exReg_isa_AUIPC; // @[Reg.scala 27:20]
  reg  exReg_isa_XOR; // @[Reg.scala 27:20]
  reg  exReg_isa_XORI; // @[Reg.scala 27:20]
  reg  exReg_isa_OR; // @[Reg.scala 27:20]
  reg  exReg_isa_ORI; // @[Reg.scala 27:20]
  reg  exReg_isa_AND; // @[Reg.scala 27:20]
  reg  exReg_isa_ANDI; // @[Reg.scala 27:20]
  reg  exReg_isa_SLL; // @[Reg.scala 27:20]
  reg  exReg_isa_SLLI; // @[Reg.scala 27:20]
  reg  exReg_isa_SLLW; // @[Reg.scala 27:20]
  reg  exReg_isa_SLLIW; // @[Reg.scala 27:20]
  reg  exReg_isa_SRL; // @[Reg.scala 27:20]
  reg  exReg_isa_SRLI; // @[Reg.scala 27:20]
  reg  exReg_isa_SRLW; // @[Reg.scala 27:20]
  reg  exReg_isa_SRLIW; // @[Reg.scala 27:20]
  reg  exReg_isa_SRA; // @[Reg.scala 27:20]
  reg  exReg_isa_SRAI; // @[Reg.scala 27:20]
  reg  exReg_isa_SRAW; // @[Reg.scala 27:20]
  reg  exReg_isa_SRAIW; // @[Reg.scala 27:20]
  reg  exReg_isa_SLT; // @[Reg.scala 27:20]
  reg  exReg_isa_SLTI; // @[Reg.scala 27:20]
  reg  exReg_isa_SLTU; // @[Reg.scala 27:20]
  reg  exReg_isa_SLTIU; // @[Reg.scala 27:20]
  reg  exReg_isa_BEQ; // @[Reg.scala 27:20]
  reg  exReg_isa_BNE; // @[Reg.scala 27:20]
  reg  exReg_isa_BLT; // @[Reg.scala 27:20]
  reg  exReg_isa_BGE; // @[Reg.scala 27:20]
  reg  exReg_isa_BLTU; // @[Reg.scala 27:20]
  reg  exReg_isa_BGEU; // @[Reg.scala 27:20]
  reg  exReg_isa_JAL; // @[Reg.scala 27:20]
  reg  exReg_isa_JALR; // @[Reg.scala 27:20]
  reg  exReg_isa_LD; // @[Reg.scala 27:20]
  reg  exReg_isa_LW; // @[Reg.scala 27:20]
  reg  exReg_isa_LH; // @[Reg.scala 27:20]
  reg  exReg_isa_LB; // @[Reg.scala 27:20]
  reg  exReg_isa_LWU; // @[Reg.scala 27:20]
  reg  exReg_isa_LHU; // @[Reg.scala 27:20]
  reg  exReg_isa_LBU; // @[Reg.scala 27:20]
  reg  exReg_isa_SD; // @[Reg.scala 27:20]
  reg  exReg_isa_SW; // @[Reg.scala 27:20]
  reg  exReg_isa_SH; // @[Reg.scala 27:20]
  reg  exReg_isa_SB; // @[Reg.scala 27:20]
  reg  exReg_isa_MRET; // @[Reg.scala 27:20]
  reg [63:0] exReg_src1; // @[Reg.scala 27:20]
  reg [63:0] exReg_src2; // @[Reg.scala 27:20]
  reg [63:0] exReg_imm_I; // @[Reg.scala 27:20]
  reg [63:0] exReg_imm_B; // @[Reg.scala 27:20]
  reg [63:0] exReg_imm_S; // @[Reg.scala 27:20]
  reg [63:0] exReg_imm_U; // @[Reg.scala 27:20]
  reg [63:0] exReg_imm_J; // @[Reg.scala 27:20]
  reg  exReg_wen; // @[Reg.scala 27:20]
  reg [4:0] exReg_wdest; // @[Reg.scala 27:20]
  wire [4:0] rs1 = exReg_inst[19:15]; // @[EXU.scala 28:39]
  wire [4:0] rs2 = exReg_inst[24:20]; // @[EXU.scala 29:39]
  wire  _bypassMemSrc1En_T_2 = rs1 != 5'h0; // @[EXU.scala 32:92]
  wire  bypassMemSrc1En = io_bypassMem_wen & rs1 == io_bypassMem_wdest & rs1 != 5'h0; // @[EXU.scala 32:84]
  wire  _bypassMemSrc2En_T_2 = rs2 != 5'h0; // @[EXU.scala 33:92]
  wire  bypassMemSrc2En = io_bypassMem_wen & rs2 == io_bypassMem_wdest & rs2 != 5'h0; // @[EXU.scala 33:84]
  wire  bypassWbSrc1En = io_bypassWb_wen & rs1 == io_bypassWb_wdest & _bypassMemSrc1En_T_2; // @[EXU.scala 34:82]
  wire  bypassWbSrc2En = io_bypassWb_wen & rs2 == io_bypassWb_wdest & _bypassMemSrc2En_T_2; // @[EXU.scala 35:82]
  wire [63:0] _src1_T = bypassWbSrc1En ? io_bypassWb_data : exReg_src1; // @[EXU.scala 36:78]
  wire [63:0] _src2_T = bypassWbSrc2En ? io_bypassWb_data : exReg_src2; // @[EXU.scala 37:78]
  wire  link_lo = exReg_isa_JAL | exReg_isa_JALR; // @[EXU.scala 69:42]
  wire [62:0] link_hi = link_lo ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _link_T_1 = {link_hi,link_lo}; // @[Cat.scala 30:58]
  wire [63:0] _link_T_3 = exReg_pc + 64'h4; // @[EXU.scala 69:72]
  wire [62:0] auipc_hi = exReg_isa_AUIPC ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _auipc_T_1 = {auipc_hi,exReg_isa_AUIPC}; // @[Cat.scala 30:58]
  wire [63:0] _auipc_T_3 = exReg_pc + exReg_imm_U; // @[EXU.scala 70:61]
  wire [31:0] _csrReg_io_inst_T = exReg_valid ? exReg_inst : 32'h13; // @[EXU.scala 75:28]
  wire  predNTfactT = beu_io_branch & ~exReg_predTaken; // @[EXU.scala 87:38]
  wire  predTfactNT = ~beu_io_branch & exReg_predTaken; // @[EXU.scala 88:39]
  wire [63:0] _io_nxtPC_tgt_T_4 = exReg_valid & predTfactNT ? _link_T_3 : 64'h0; // @[EXU.scala 90:56]
  ysyx_210324_ALU alu ( // @[EXU.scala 39:29]
    .io_isa_ADD(alu_io_isa_ADD),
    .io_isa_ADDI(alu_io_isa_ADDI),
    .io_isa_ADDW(alu_io_isa_ADDW),
    .io_isa_ADDIW(alu_io_isa_ADDIW),
    .io_isa_SUB(alu_io_isa_SUB),
    .io_isa_SUBW(alu_io_isa_SUBW),
    .io_isa_LUI(alu_io_isa_LUI),
    .io_isa_XOR(alu_io_isa_XOR),
    .io_isa_XORI(alu_io_isa_XORI),
    .io_isa_OR(alu_io_isa_OR),
    .io_isa_ORI(alu_io_isa_ORI),
    .io_isa_AND(alu_io_isa_AND),
    .io_isa_ANDI(alu_io_isa_ANDI),
    .io_isa_SLL(alu_io_isa_SLL),
    .io_isa_SLLI(alu_io_isa_SLLI),
    .io_isa_SLLW(alu_io_isa_SLLW),
    .io_isa_SLLIW(alu_io_isa_SLLIW),
    .io_isa_SRL(alu_io_isa_SRL),
    .io_isa_SRLI(alu_io_isa_SRLI),
    .io_isa_SRLW(alu_io_isa_SRLW),
    .io_isa_SRLIW(alu_io_isa_SRLIW),
    .io_isa_SRA(alu_io_isa_SRA),
    .io_isa_SRAI(alu_io_isa_SRAI),
    .io_isa_SRAW(alu_io_isa_SRAW),
    .io_isa_SRAIW(alu_io_isa_SRAIW),
    .io_isa_SLT(alu_io_isa_SLT),
    .io_isa_SLTI(alu_io_isa_SLTI),
    .io_isa_SLTU(alu_io_isa_SLTU),
    .io_isa_SLTIU(alu_io_isa_SLTIU),
    .io_src1(alu_io_src1),
    .io_src2(alu_io_src2),
    .io_imm_I(alu_io_imm_I),
    .io_imm_U(alu_io_imm_U),
    .io_res(alu_io_res)
  );
  ysyx_210324_BEU beu ( // @[EXU.scala 58:29]
    .io_isa_BEQ(beu_io_isa_BEQ),
    .io_isa_BNE(beu_io_isa_BNE),
    .io_isa_BLT(beu_io_isa_BLT),
    .io_isa_BGE(beu_io_isa_BGE),
    .io_isa_BLTU(beu_io_isa_BLTU),
    .io_isa_BGEU(beu_io_isa_BGEU),
    .io_isa_JAL(beu_io_isa_JAL),
    .io_isa_JALR(beu_io_isa_JALR),
    .io_imm_I(beu_io_imm_I),
    .io_imm_B(beu_io_imm_B),
    .io_imm_J(beu_io_imm_J),
    .io_src1(beu_io_src1),
    .io_src2(beu_io_src2),
    .io_pc(beu_io_pc),
    .io_branIdx(beu_io_branIdx),
    .io_branchInfo_branch(beu_io_branchInfo_branch),
    .io_branchInfo_jump(beu_io_branchInfo_jump),
    .io_branchInfo_taken(beu_io_branchInfo_taken),
    .io_branchInfo_idx(beu_io_branchInfo_idx),
    .io_branchInfo_pc(beu_io_branchInfo_pc),
    .io_branchInfo_tgt(beu_io_branchInfo_tgt),
    .io_branch(beu_io_branch),
    .io_tgt(beu_io_tgt)
  );
  ysyx_210324_CSRReg csrReg ( // @[EXU.scala 72:32]
    .clock(csrReg_clock),
    .reset(csrReg_reset),
    .io_globalEn(csrReg_io_globalEn),
    .io_pc(csrReg_io_pc),
    .io_inst(csrReg_io_inst),
    .io_src(csrReg_io_src),
    .io_data(csrReg_io_data),
    .io_mtip(csrReg_io_mtip),
    .io_timeIntrEn(csrReg_io_timeIntrEn),
    .io_ecallEn(csrReg_io_ecallEn),
    .io_csrState_mepc(csrReg_io_csrState_mepc),
    .io_csrState_mtvec(csrReg_io_csrState_mtvec)
  );
  assign io_stall = exReg_valid & (io_nxtPC_branch | csrReg_io_timeIntrEn | csrReg_io_ecallEn | exReg_isa_MRET); // @[EXU.scala 91:28]
  assign io_ex2mem_valid = csrReg_io_timeIntrEn ? 1'h0 : exReg_valid; // @[EXU.scala 93:32]
  assign io_ex2mem_isa_LD = exReg_isa_LD; // @[EXU.scala 98:26]
  assign io_ex2mem_isa_LW = exReg_isa_LW; // @[EXU.scala 98:26]
  assign io_ex2mem_isa_LH = exReg_isa_LH; // @[EXU.scala 98:26]
  assign io_ex2mem_isa_LB = exReg_isa_LB; // @[EXU.scala 98:26]
  assign io_ex2mem_isa_LWU = exReg_isa_LWU; // @[EXU.scala 98:26]
  assign io_ex2mem_isa_LHU = exReg_isa_LHU; // @[EXU.scala 98:26]
  assign io_ex2mem_isa_LBU = exReg_isa_LBU; // @[EXU.scala 98:26]
  assign io_ex2mem_isa_SD = exReg_isa_SD; // @[EXU.scala 98:26]
  assign io_ex2mem_isa_SW = exReg_isa_SW; // @[EXU.scala 98:26]
  assign io_ex2mem_isa_SH = exReg_isa_SH; // @[EXU.scala 98:26]
  assign io_ex2mem_isa_SB = exReg_isa_SB; // @[EXU.scala 98:26]
  assign io_ex2mem_src1 = bypassMemSrc1En ? io_bypassMem_data : _src1_T; // @[EXU.scala 36:38]
  assign io_ex2mem_src2 = bypassMemSrc2En ? io_bypassMem_data : _src2_T; // @[EXU.scala 37:38]
  assign io_ex2mem_imm_I = exReg_imm_I; // @[EXU.scala 101:26]
  assign io_ex2mem_imm_S = exReg_imm_S; // @[EXU.scala 101:26]
  assign io_ex2mem_wen = exReg_wen; // @[EXU.scala 102:26]
  assign io_ex2mem_wdest = exReg_wdest; // @[EXU.scala 103:26]
  assign io_ex2mem_aluRes = alu_io_res; // @[EXU.scala 104:26]
  assign io_ex2mem_link = _link_T_1 & _link_T_3; // @[EXU.scala 69:66]
  assign io_ex2mem_auipc = _auipc_T_1 & _auipc_T_3; // @[EXU.scala 70:55]
  assign io_ex2mem_csrData = csrReg_io_data; // @[EXU.scala 109:26]
  assign io_nxtPC_trap = exReg_valid & (csrReg_io_timeIntrEn | csrReg_io_ecallEn); // @[EXU.scala 82:27]
  assign io_nxtPC_mtvec = csrReg_io_csrState_mtvec; // @[EXU.scala 83:18]
  assign io_nxtPC_mret = exReg_valid & exReg_isa_MRET; // @[EXU.scala 84:27]
  assign io_nxtPC_mepc = csrReg_io_csrState_mepc; // @[EXU.scala 85:18]
  assign io_nxtPC_branch = exReg_valid & (predNTfactT | predTfactNT); // @[EXU.scala 89:28]
  assign io_nxtPC_tgt = exReg_valid & predNTfactT ? beu_io_tgt : _io_nxtPC_tgt_T_4; // @[EXU.scala 90:25]
  assign io_branchInfo_branch = beu_io_branchInfo_branch; // @[EXU.scala 65:21]
  assign io_branchInfo_jump = beu_io_branchInfo_jump; // @[EXU.scala 65:21]
  assign io_branchInfo_taken = beu_io_branchInfo_taken; // @[EXU.scala 65:21]
  assign io_branchInfo_idx = beu_io_branchInfo_idx; // @[EXU.scala 65:21]
  assign io_branchInfo_pc = beu_io_branchInfo_pc; // @[EXU.scala 65:21]
  assign io_branchInfo_tgt = beu_io_branchInfo_tgt; // @[EXU.scala 65:21]
  assign alu_io_isa_ADD = exReg_isa_ADD; // @[EXU.scala 40:15]
  assign alu_io_isa_ADDI = exReg_isa_ADDI; // @[EXU.scala 40:15]
  assign alu_io_isa_ADDW = exReg_isa_ADDW; // @[EXU.scala 40:15]
  assign alu_io_isa_ADDIW = exReg_isa_ADDIW; // @[EXU.scala 40:15]
  assign alu_io_isa_SUB = exReg_isa_SUB; // @[EXU.scala 40:15]
  assign alu_io_isa_SUBW = exReg_isa_SUBW; // @[EXU.scala 40:15]
  assign alu_io_isa_LUI = exReg_isa_LUI; // @[EXU.scala 40:15]
  assign alu_io_isa_XOR = exReg_isa_XOR; // @[EXU.scala 40:15]
  assign alu_io_isa_XORI = exReg_isa_XORI; // @[EXU.scala 40:15]
  assign alu_io_isa_OR = exReg_isa_OR; // @[EXU.scala 40:15]
  assign alu_io_isa_ORI = exReg_isa_ORI; // @[EXU.scala 40:15]
  assign alu_io_isa_AND = exReg_isa_AND; // @[EXU.scala 40:15]
  assign alu_io_isa_ANDI = exReg_isa_ANDI; // @[EXU.scala 40:15]
  assign alu_io_isa_SLL = exReg_isa_SLL; // @[EXU.scala 40:15]
  assign alu_io_isa_SLLI = exReg_isa_SLLI; // @[EXU.scala 40:15]
  assign alu_io_isa_SLLW = exReg_isa_SLLW; // @[EXU.scala 40:15]
  assign alu_io_isa_SLLIW = exReg_isa_SLLIW; // @[EXU.scala 40:15]
  assign alu_io_isa_SRL = exReg_isa_SRL; // @[EXU.scala 40:15]
  assign alu_io_isa_SRLI = exReg_isa_SRLI; // @[EXU.scala 40:15]
  assign alu_io_isa_SRLW = exReg_isa_SRLW; // @[EXU.scala 40:15]
  assign alu_io_isa_SRLIW = exReg_isa_SRLIW; // @[EXU.scala 40:15]
  assign alu_io_isa_SRA = exReg_isa_SRA; // @[EXU.scala 40:15]
  assign alu_io_isa_SRAI = exReg_isa_SRAI; // @[EXU.scala 40:15]
  assign alu_io_isa_SRAW = exReg_isa_SRAW; // @[EXU.scala 40:15]
  assign alu_io_isa_SRAIW = exReg_isa_SRAIW; // @[EXU.scala 40:15]
  assign alu_io_isa_SLT = exReg_isa_SLT; // @[EXU.scala 40:15]
  assign alu_io_isa_SLTI = exReg_isa_SLTI; // @[EXU.scala 40:15]
  assign alu_io_isa_SLTU = exReg_isa_SLTU; // @[EXU.scala 40:15]
  assign alu_io_isa_SLTIU = exReg_isa_SLTIU; // @[EXU.scala 40:15]
  assign alu_io_src1 = bypassMemSrc1En ? io_bypassMem_data : _src1_T; // @[EXU.scala 36:38]
  assign alu_io_src2 = bypassMemSrc2En ? io_bypassMem_data : _src2_T; // @[EXU.scala 37:38]
  assign alu_io_imm_I = exReg_imm_I; // @[EXU.scala 41:15]
  assign alu_io_imm_U = exReg_imm_U; // @[EXU.scala 41:15]
  assign beu_io_isa_BEQ = exReg_isa_BEQ; // @[EXU.scala 59:21]
  assign beu_io_isa_BNE = exReg_isa_BNE; // @[EXU.scala 59:21]
  assign beu_io_isa_BLT = exReg_isa_BLT; // @[EXU.scala 59:21]
  assign beu_io_isa_BGE = exReg_isa_BGE; // @[EXU.scala 59:21]
  assign beu_io_isa_BLTU = exReg_isa_BLTU; // @[EXU.scala 59:21]
  assign beu_io_isa_BGEU = exReg_isa_BGEU; // @[EXU.scala 59:21]
  assign beu_io_isa_JAL = exReg_isa_JAL; // @[EXU.scala 59:21]
  assign beu_io_isa_JALR = exReg_isa_JALR; // @[EXU.scala 59:21]
  assign beu_io_imm_I = exReg_imm_I; // @[EXU.scala 60:21]
  assign beu_io_imm_B = exReg_imm_B; // @[EXU.scala 60:21]
  assign beu_io_imm_J = exReg_imm_J; // @[EXU.scala 60:21]
  assign beu_io_src1 = bypassMemSrc1En ? io_bypassMem_data : _src1_T; // @[EXU.scala 36:38]
  assign beu_io_src2 = bypassMemSrc2En ? io_bypassMem_data : _src2_T; // @[EXU.scala 37:38]
  assign beu_io_pc = exReg_pc; // @[EXU.scala 63:21]
  assign beu_io_branIdx = exReg_branIdx; // @[EXU.scala 64:21]
  assign csrReg_clock = clock;
  assign csrReg_reset = reset;
  assign csrReg_io_globalEn = io_globalEn; // @[EXU.scala 73:22]
  assign csrReg_io_pc = exReg_pc; // @[EXU.scala 74:22]
  assign csrReg_io_inst = {{32'd0}, _csrReg_io_inst_T}; // @[EXU.scala 75:28]
  assign csrReg_io_src = bypassMemSrc1En ? io_bypassMem_data : _src1_T; // @[EXU.scala 36:38]
  assign csrReg_io_mtip = io_mtip; // @[EXU.scala 77:22]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      exReg_valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_valid <= io_id2ex_valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_inst <= 32'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_inst <= io_id2ex_inst; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_pc <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_pc <= io_id2ex_pc; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_branIdx <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_branIdx <= io_id2ex_branIdx; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_predTaken <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_predTaken <= io_id2ex_predTaken; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_ADD <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_ADD <= io_id2ex_isa_ADD; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_ADDI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_ADDI <= io_id2ex_isa_ADDI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_ADDW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_ADDW <= io_id2ex_isa_ADDW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_ADDIW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_ADDIW <= io_id2ex_isa_ADDIW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SUB <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SUB <= io_id2ex_isa_SUB; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SUBW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SUBW <= io_id2ex_isa_SUBW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_LUI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_LUI <= io_id2ex_isa_LUI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_AUIPC <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_AUIPC <= io_id2ex_isa_AUIPC; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_XOR <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_XOR <= io_id2ex_isa_XOR; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_XORI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_XORI <= io_id2ex_isa_XORI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_OR <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_OR <= io_id2ex_isa_OR; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_ORI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_ORI <= io_id2ex_isa_ORI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_AND <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_AND <= io_id2ex_isa_AND; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_ANDI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_ANDI <= io_id2ex_isa_ANDI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SLL <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SLL <= io_id2ex_isa_SLL; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SLLI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SLLI <= io_id2ex_isa_SLLI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SLLW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SLLW <= io_id2ex_isa_SLLW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SLLIW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SLLIW <= io_id2ex_isa_SLLIW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SRL <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SRL <= io_id2ex_isa_SRL; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SRLI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SRLI <= io_id2ex_isa_SRLI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SRLW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SRLW <= io_id2ex_isa_SRLW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SRLIW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SRLIW <= io_id2ex_isa_SRLIW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SRA <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SRA <= io_id2ex_isa_SRA; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SRAI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SRAI <= io_id2ex_isa_SRAI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SRAW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SRAW <= io_id2ex_isa_SRAW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SRAIW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SRAIW <= io_id2ex_isa_SRAIW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SLT <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SLT <= io_id2ex_isa_SLT; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SLTI <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SLTI <= io_id2ex_isa_SLTI; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SLTU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SLTU <= io_id2ex_isa_SLTU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SLTIU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SLTIU <= io_id2ex_isa_SLTIU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_BEQ <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_BEQ <= io_id2ex_isa_BEQ; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_BNE <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_BNE <= io_id2ex_isa_BNE; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_BLT <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_BLT <= io_id2ex_isa_BLT; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_BGE <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_BGE <= io_id2ex_isa_BGE; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_BLTU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_BLTU <= io_id2ex_isa_BLTU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_BGEU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_BGEU <= io_id2ex_isa_BGEU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_JAL <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_JAL <= io_id2ex_isa_JAL; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_JALR <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_JALR <= io_id2ex_isa_JALR; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_LD <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_LD <= io_id2ex_isa_LD; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_LW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_LW <= io_id2ex_isa_LW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_LH <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_LH <= io_id2ex_isa_LH; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_LB <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_LB <= io_id2ex_isa_LB; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_LWU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_LWU <= io_id2ex_isa_LWU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_LHU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_LHU <= io_id2ex_isa_LHU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_LBU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_LBU <= io_id2ex_isa_LBU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SD <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SD <= io_id2ex_isa_SD; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SW <= io_id2ex_isa_SW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SH <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SH <= io_id2ex_isa_SH; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_SB <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_SB <= io_id2ex_isa_SB; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_isa_MRET <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_isa_MRET <= io_id2ex_isa_MRET; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_src1 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_src1 <= io_id2ex_src1; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_src2 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_src2 <= io_id2ex_src2; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_imm_I <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_imm_I <= io_id2ex_imm_I; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_imm_B <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_imm_B <= io_id2ex_imm_B; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_imm_S <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_imm_S <= io_id2ex_imm_S; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_imm_U <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_imm_U <= io_id2ex_imm_U; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_imm_J <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_imm_J <= io_id2ex_imm_J; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_wen <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_wen <= io_id2ex_wen; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      exReg_wdest <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      exReg_wdest <= io_id2ex_wdest; // @[Reg.scala 28:23]
    end
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
  exReg_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  exReg_inst = _RAND_1[31:0];
  _RAND_2 = {2{`RANDOM}};
  exReg_pc = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  exReg_branIdx = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  exReg_predTaken = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  exReg_isa_ADD = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  exReg_isa_ADDI = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  exReg_isa_ADDW = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  exReg_isa_ADDIW = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  exReg_isa_SUB = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  exReg_isa_SUBW = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  exReg_isa_LUI = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  exReg_isa_AUIPC = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  exReg_isa_XOR = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  exReg_isa_XORI = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  exReg_isa_OR = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  exReg_isa_ORI = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  exReg_isa_AND = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  exReg_isa_ANDI = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  exReg_isa_SLL = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  exReg_isa_SLLI = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  exReg_isa_SLLW = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  exReg_isa_SLLIW = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  exReg_isa_SRL = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  exReg_isa_SRLI = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  exReg_isa_SRLW = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  exReg_isa_SRLIW = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  exReg_isa_SRA = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  exReg_isa_SRAI = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  exReg_isa_SRAW = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  exReg_isa_SRAIW = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  exReg_isa_SLT = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  exReg_isa_SLTI = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  exReg_isa_SLTU = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  exReg_isa_SLTIU = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  exReg_isa_BEQ = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  exReg_isa_BNE = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  exReg_isa_BLT = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  exReg_isa_BGE = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  exReg_isa_BLTU = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  exReg_isa_BGEU = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  exReg_isa_JAL = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  exReg_isa_JALR = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  exReg_isa_LD = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  exReg_isa_LW = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  exReg_isa_LH = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  exReg_isa_LB = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  exReg_isa_LWU = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  exReg_isa_LHU = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  exReg_isa_LBU = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  exReg_isa_SD = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  exReg_isa_SW = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  exReg_isa_SH = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  exReg_isa_SB = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  exReg_isa_MRET = _RAND_54[0:0];
  _RAND_55 = {2{`RANDOM}};
  exReg_src1 = _RAND_55[63:0];
  _RAND_56 = {2{`RANDOM}};
  exReg_src2 = _RAND_56[63:0];
  _RAND_57 = {2{`RANDOM}};
  exReg_imm_I = _RAND_57[63:0];
  _RAND_58 = {2{`RANDOM}};
  exReg_imm_B = _RAND_58[63:0];
  _RAND_59 = {2{`RANDOM}};
  exReg_imm_S = _RAND_59[63:0];
  _RAND_60 = {2{`RANDOM}};
  exReg_imm_U = _RAND_60[63:0];
  _RAND_61 = {2{`RANDOM}};
  exReg_imm_J = _RAND_61[63:0];
  _RAND_62 = {1{`RANDOM}};
  exReg_wen = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  exReg_wdest = _RAND_63[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_LSU(
  input         io_valid,
  input         io_isa_LD,
  input         io_isa_LW,
  input         io_isa_LH,
  input         io_isa_LB,
  input         io_isa_LWU,
  input         io_isa_LHU,
  input         io_isa_LBU,
  input         io_isa_SD,
  input         io_isa_SW,
  input         io_isa_SH,
  input         io_isa_SB,
  input  [63:0] io_src1,
  input  [63:0] io_src2,
  input  [63:0] io_imm_I,
  input  [63:0] io_imm_S,
  output        io_ld_en,
  output [63:0] io_ld_addr,
  input  [63:0] io_ld_data,
  output [2:0]  io_ld_size,
  output        io_sd_en,
  output [63:0] io_sd_addr,
  output [63:0] io_sd_data,
  output [7:0]  io_sd_mask,
  output [63:0] io_loadData
);
  wire  ldInstVis = io_isa_LD | io_isa_LW | io_isa_LH | io_isa_LB | io_isa_LWU | io_isa_LHU | io_isa_LBU; // @[LSU.scala 18:106]
  wire  sdInstVis = io_isa_SD | io_isa_SW | io_isa_SH | io_isa_SB; // @[LSU.scala 19:65]
  wire  hSize = io_isa_LH | io_isa_LHU; // @[LSU.scala 24:42]
  wire [1:0] wSize = io_isa_LW | io_isa_LWU ? 2'h2 : 2'h0; // @[LSU.scala 25:31]
  wire [1:0] dSize = io_isa_LD ? 2'h3 : 2'h0; // @[LSU.scala 26:31]
  wire [2:0] _loadSize_T = {{2'd0}, hSize}; // @[LSU.scala 27:34]
  wire [2:0] _GEN_0 = {{1'd0}, wSize}; // @[LSU.scala 27:42]
  wire [2:0] _loadSize_T_1 = _loadSize_T | _GEN_0; // @[LSU.scala 27:42]
  wire [2:0] _GEN_1 = {{1'd0}, dSize}; // @[LSU.scala 27:50]
  wire [31:0] wInstData = io_ld_addr[2] ? io_ld_data[63:32] : io_ld_data[31:0]; // @[LSU.scala 31:32]
  wire [15:0] hTypeData = io_ld_addr[1] ? wInstData[31:16] : wInstData[15:0]; // @[LSU.scala 32:32]
  wire [7:0] bTypeData = io_ld_addr[0] ? hTypeData[15:8] : hTypeData[7:0]; // @[LSU.scala 33:32]
  wire [62:0] ldData_hi = io_isa_LD ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _ldData_T_1 = {ldData_hi,io_isa_LD}; // @[Cat.scala 30:58]
  wire [63:0] ldData = _ldData_T_1 & io_ld_data; // @[LSU.scala 35:57]
  wire [62:0] lwData_hi = io_isa_LW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _lwData_T_1 = {lwData_hi,io_isa_LW}; // @[Cat.scala 30:58]
  wire  lwData_signBit_1 = wInstData[31]; // @[NumExten.scala 11:20]
  wire [31:0] lwData_hi_1 = lwData_signBit_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _lwData_T_3 = {lwData_hi_1,wInstData}; // @[Cat.scala 30:58]
  wire [63:0] lwData = _lwData_T_1 & _lwData_T_3; // @[LSU.scala 36:57]
  wire [62:0] lhData_hi = io_isa_LH ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _lhData_T_1 = {lhData_hi,io_isa_LH}; // @[Cat.scala 30:58]
  wire  lhData_signBit_1 = hTypeData[15]; // @[NumExten.scala 11:20]
  wire [47:0] lhData_hi_1 = lhData_signBit_1 ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _lhData_T_3 = {lhData_hi_1,hTypeData}; // @[Cat.scala 30:58]
  wire [63:0] lhData = _lhData_T_1 & _lhData_T_3; // @[LSU.scala 37:57]
  wire [62:0] lbData_hi = io_isa_LB ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _lbData_T_1 = {lbData_hi,io_isa_LB}; // @[Cat.scala 30:58]
  wire  lbData_signBit_1 = bTypeData[7]; // @[NumExten.scala 11:20]
  wire [55:0] lbData_hi_1 = lbData_signBit_1 ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _lbData_T_3 = {lbData_hi_1,bTypeData}; // @[Cat.scala 30:58]
  wire [63:0] lbData = _lbData_T_1 & _lbData_T_3; // @[LSU.scala 38:57]
  wire [62:0] lwuData_hi = io_isa_LWU ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _lwuData_T_1 = {lwuData_hi,io_isa_LWU}; // @[Cat.scala 30:58]
  wire [63:0] _lwuData_T_2 = {32'h0,wInstData}; // @[Cat.scala 30:58]
  wire [63:0] lwuData = _lwuData_T_1 & _lwuData_T_2; // @[LSU.scala 39:58]
  wire [62:0] lhuData_hi = io_isa_LHU ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _lhuData_T_1 = {lhuData_hi,io_isa_LHU}; // @[Cat.scala 30:58]
  wire [63:0] _lhuData_T_2 = {48'h0,hTypeData}; // @[Cat.scala 30:58]
  wire [63:0] lhuData = _lhuData_T_1 & _lhuData_T_2; // @[LSU.scala 40:58]
  wire [62:0] lbuData_hi = io_isa_LBU ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _lbuData_T_1 = {lbuData_hi,io_isa_LBU}; // @[Cat.scala 30:58]
  wire [63:0] _lbuData_T_2 = {56'h0,bTypeData}; // @[Cat.scala 30:58]
  wire [63:0] lbuData = _lbuData_T_1 & _lbuData_T_2; // @[LSU.scala 41:58]
  wire [63:0] _io_loadData_T = ldData | lwData; // @[LSU.scala 42:25]
  wire [63:0] _io_loadData_T_1 = _io_loadData_T | lhData; // @[LSU.scala 42:34]
  wire [63:0] _io_loadData_T_2 = _io_loadData_T_1 | lbData; // @[LSU.scala 42:43]
  wire [63:0] _io_loadData_T_3 = _io_loadData_T_2 | lwuData; // @[LSU.scala 42:52]
  wire [63:0] _io_loadData_T_4 = _io_loadData_T_3 | lhuData; // @[LSU.scala 42:62]
  wire [62:0] sdData_hi = io_isa_SD ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sdData_T_1 = {sdData_hi,io_isa_SD}; // @[Cat.scala 30:58]
  wire [63:0] sdData = _sdData_T_1 & io_src2; // @[LSU.scala 46:59]
  wire [62:0] swData_hi = io_isa_SW ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _swData_T_1 = {swData_hi,io_isa_SW}; // @[Cat.scala 30:58]
  wire [31:0] swData_hi_1 = io_src2[31:0]; // @[LSU.scala 47:72]
  wire [63:0] _swData_T_2 = {swData_hi_1,swData_hi_1}; // @[Cat.scala 30:58]
  wire [63:0] swData = _swData_T_1 & _swData_T_2; // @[LSU.scala 47:59]
  wire [62:0] shData_hi = io_isa_SH ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _shData_T_1 = {shData_hi,io_isa_SH}; // @[Cat.scala 30:58]
  wire [15:0] shData_hi_hi = io_src2[15:0]; // @[LSU.scala 48:72]
  wire [63:0] _shData_T_2 = {shData_hi_hi,shData_hi_hi,shData_hi_hi,shData_hi_hi}; // @[Cat.scala 30:58]
  wire [63:0] shData = _shData_T_1 & _shData_T_2; // @[LSU.scala 48:59]
  wire [62:0] sbData_hi = io_isa_SB ? 63'h7fffffffffffffff : 63'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _sbData_T_1 = {sbData_hi,io_isa_SB}; // @[Cat.scala 30:58]
  wire [7:0] sbData_hi_hi_hi = io_src2[7:0]; // @[LSU.scala 49:72]
  wire [63:0] _sbData_T_2 = {sbData_hi_hi_hi,sbData_hi_hi_hi,sbData_hi_hi_hi,sbData_hi_hi_hi,sbData_hi_hi_hi,
    sbData_hi_hi_hi,sbData_hi_hi_hi,sbData_hi_hi_hi}; // @[Cat.scala 30:58]
  wire [63:0] sbData = _sbData_T_1 & _sbData_T_2; // @[LSU.scala 49:59]
  wire [63:0] _storeData_T = sdData | swData; // @[LSU.scala 50:36]
  wire [63:0] _storeData_T_1 = _storeData_T | shData; // @[LSU.scala 50:45]
  wire [63:0] storeData = _storeData_T_1 | sbData; // @[LSU.scala 50:54]
  wire [6:0] dInstMask_hi = io_isa_SD ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [7:0] dInstMask = {dInstMask_hi,io_isa_SD}; // @[Cat.scala 30:58]
  wire [6:0] wInstMask_hi = io_isa_SW ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _wInstMask_T_1 = {wInstMask_hi,io_isa_SW}; // @[Cat.scala 30:58]
  wire [14:0] _wInstMask_T_3 = 15'hf << io_sd_addr[2:0]; // @[LSU.scala 52:81]
  wire [14:0] _GEN_2 = {{7'd0}, _wInstMask_T_1}; // @[LSU.scala 52:58]
  wire [14:0] wInstMask = _GEN_2 & _wInstMask_T_3; // @[LSU.scala 52:58]
  wire [6:0] hInstMask_hi = io_isa_SH ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _hInstMask_T_1 = {hInstMask_hi,io_isa_SH}; // @[Cat.scala 30:58]
  wire [14:0] _hInstMask_T_3 = 15'h3 << io_sd_addr[2:0]; // @[LSU.scala 53:81]
  wire [14:0] _GEN_3 = {{7'd0}, _hInstMask_T_1}; // @[LSU.scala 53:58]
  wire [14:0] hInstMask = _GEN_3 & _hInstMask_T_3; // @[LSU.scala 53:58]
  wire [6:0] bInstMask_hi = io_isa_SB ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _bInstMask_T_1 = {bInstMask_hi,io_isa_SB}; // @[Cat.scala 30:58]
  wire [14:0] _bInstMask_T_3 = 15'h1 << io_sd_addr[2:0]; // @[LSU.scala 54:81]
  wire [14:0] _GEN_4 = {{7'd0}, _bInstMask_T_1}; // @[LSU.scala 54:58]
  wire [14:0] bInstMask = _GEN_4 & _bInstMask_T_3; // @[LSU.scala 54:58]
  wire [14:0] _GEN_5 = {{7'd0}, dInstMask}; // @[LSU.scala 55:39]
  wire [14:0] _sdMask_T = _GEN_5 | wInstMask; // @[LSU.scala 55:39]
  wire [14:0] _sdMask_T_1 = _sdMask_T | hInstMask; // @[LSU.scala 55:51]
  wire [14:0] sdMask = _sdMask_T_1 | bInstMask; // @[LSU.scala 55:63]
  wire [7:0] sdMask0 = sdMask[0] ? 8'hff : 8'h0; // @[LSU.scala 57:32]
  wire [7:0] sdMask1 = sdMask[1] ? 8'hff : 8'h0; // @[LSU.scala 58:32]
  wire [7:0] sdMask2 = sdMask[2] ? 8'hff : 8'h0; // @[LSU.scala 59:32]
  wire [7:0] sdMask3 = sdMask[3] ? 8'hff : 8'h0; // @[LSU.scala 60:32]
  wire [7:0] sdMask4 = sdMask[4] ? 8'hff : 8'h0; // @[LSU.scala 61:32]
  wire [7:0] sdMask5 = sdMask[5] ? 8'hff : 8'h0; // @[LSU.scala 62:32]
  wire [7:0] sdMask6 = sdMask[6] ? 8'hff : 8'h0; // @[LSU.scala 63:32]
  wire [7:0] sdMask7 = sdMask[7] ? 8'hff : 8'h0; // @[LSU.scala 64:32]
  wire [63:0] extenMask = {sdMask7,sdMask6,sdMask5,sdMask4,sdMask3,sdMask2,sdMask1,sdMask0}; // @[Cat.scala 30:58]
  assign io_ld_en = io_valid & ldInstVis; // @[LSU.scala 21:26]
  assign io_ld_addr = io_src1 + io_imm_I; // @[LSU.scala 22:25]
  assign io_ld_size = _loadSize_T_1 | _GEN_1; // @[LSU.scala 27:50]
  assign io_sd_en = io_valid & sdInstVis; // @[LSU.scala 44:26]
  assign io_sd_addr = io_src1 + io_imm_S; // @[LSU.scala 45:25]
  assign io_sd_data = storeData & extenMask; // @[LSU.scala 67:27]
  assign io_sd_mask = sdMask[7:0]; // @[LSU.scala 68:14]
  assign io_loadData = _io_loadData_T_4 | lbuData; // @[LSU.scala 42:72]
endmodule
module ysyx_210324_CLINT(
  input         clock,
  input         reset,
  input         io_valid,
  output        io_mtip,
  input         io_cld_en,
  input  [63:0] io_cld_addr,
  output [63:0] io_cld_data,
  input  [2:0]  io_cld_size,
  input         io_csd_en,
  input  [63:0] io_csd_addr,
  input  [63:0] io_csd_data,
  input  [7:0]  io_csd_mask,
  output        io_ld_en,
  output [63:0] io_ld_addr,
  input  [63:0] io_ld_data,
  output [2:0]  io_ld_size,
  output        io_sd_en,
  output [63:0] io_sd_addr,
  output [63:0] io_sd_data,
  output [7:0]  io_sd_mask
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] _addr_T_1 = io_cld_en ? io_cld_addr[31:0] : 32'h0; // @[CLINT.scala 19:34]
  wire [31:0] _addr_T_3 = io_csd_en ? io_csd_addr[31:0] : 32'h0; // @[CLINT.scala 19:76]
  wire [31:0] addr = _addr_T_1 | _addr_T_3; // @[CLINT.scala 19:71]
  wire [63:0] _GEN_5 = {{32'd0}, addr}; // @[CLINT.scala 21:36]
  wire  mtimeVis = _GEN_5 == 64'h200bff8; // @[CLINT.scala 21:36]
  wire  mtimecmpVis = _GEN_5 == 64'h2004000; // @[CLINT.scala 22:36]
  wire  _cren_T = mtimecmpVis | mtimeVis; // @[CLINT.scala 24:52]
  wire  cren = io_cld_en & (mtimecmpVis | mtimeVis) & io_valid; // @[CLINT.scala 24:65]
  wire  cwen = io_csd_en & _cren_T & io_valid; // @[CLINT.scala 25:65]
  wire  cvalid = cren | cwen; // @[CLINT.scala 26:31]
  reg [2:0] tickCnt; // @[Counter.scala 60:40]
  wire  wrap_wrap = tickCnt == 3'h4; // @[Counter.scala 72:24]
  wire [2:0] _wrap_value_T_1 = tickCnt + 3'h1; // @[Counter.scala 76:24]
  reg [63:0] mtime; // @[CLINT.scala 30:45]
  reg [63:0] mtimecmp; // @[CLINT.scala 31:45]
  wire [63:0] _mtime_T_1 = mtime + 64'h1; // @[CLINT.scala 36:33]
  wire [63:0] mtimeVal = cren & mtimeVis ? mtime : 64'h0; // @[CLINT.scala 41:34]
  wire [63:0] mtimecmpVal = cren & mtimecmpVis ? mtimecmp : 64'h0; // @[CLINT.scala 42:34]
  wire [63:0] rdata = mtimeVal | mtimecmpVal; // @[CLINT.scala 43:40]
  assign io_mtip = mtime >= mtimecmp; // @[CLINT.scala 56:22]
  assign io_cld_data = cvalid ? rdata : io_ld_data; // @[CLINT.scala 49:21]
  assign io_ld_en = cvalid ? 1'h0 : io_cld_en; // @[CLINT.scala 46:21]
  assign io_ld_addr = io_cld_addr; // @[CLINT.scala 47:15]
  assign io_ld_size = io_cld_size; // @[CLINT.scala 48:15]
  assign io_sd_en = cvalid ? 1'h0 : io_csd_en; // @[CLINT.scala 51:20]
  assign io_sd_addr = io_csd_addr; // @[CLINT.scala 52:14]
  assign io_sd_data = io_csd_data; // @[CLINT.scala 53:14]
  assign io_sd_mask = io_csd_mask; // @[CLINT.scala 54:14]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 60:40]
      tickCnt <= 3'h0; // @[Counter.scala 60:40]
    end else if (wrap_wrap) begin // @[Counter.scala 86:20]
      tickCnt <= 3'h0; // @[Counter.scala 86:28]
    end else begin
      tickCnt <= _wrap_value_T_1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[CLINT.scala 30:45]
      mtime <= 64'h0; // @[CLINT.scala 30:45]
    end else if (cwen & mtimeVis) begin // @[CLINT.scala 33:26]
      mtime <= io_csd_data; // @[CLINT.scala 34:11]
    end else if (wrap_wrap) begin // @[CLINT.scala 36:17]
      mtime <= _mtime_T_1;
    end
    if (reset) begin // @[CLINT.scala 31:45]
      mtimecmp <= 64'h0; // @[CLINT.scala 31:45]
    end else if (cwen & mtimecmpVis) begin // @[CLINT.scala 39:29]
      mtimecmp <= io_csd_data; // @[CLINT.scala 39:40]
    end
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
  tickCnt = _RAND_0[2:0];
  _RAND_1 = {2{`RANDOM}};
  mtime = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  mtimecmp = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_Memory(
  input         clock,
  input         reset,
  input         io_globalEn,
  input         io_ex2mem_valid,
  input         io_ex2mem_isa_LD,
  input         io_ex2mem_isa_LW,
  input         io_ex2mem_isa_LH,
  input         io_ex2mem_isa_LB,
  input         io_ex2mem_isa_LWU,
  input         io_ex2mem_isa_LHU,
  input         io_ex2mem_isa_LBU,
  input         io_ex2mem_isa_SD,
  input         io_ex2mem_isa_SW,
  input         io_ex2mem_isa_SH,
  input         io_ex2mem_isa_SB,
  input  [63:0] io_ex2mem_src1,
  input  [63:0] io_ex2mem_src2,
  input  [63:0] io_ex2mem_imm_I,
  input  [63:0] io_ex2mem_imm_S,
  input         io_ex2mem_wen,
  input  [4:0]  io_ex2mem_wdest,
  input  [63:0] io_ex2mem_aluRes,
  input  [63:0] io_ex2mem_link,
  input  [63:0] io_ex2mem_auipc,
  input  [63:0] io_ex2mem_csrData,
  output        io_mem2wb_valid,
  output        io_mem2wb_wen,
  output [4:0]  io_mem2wb_wdest,
  output [63:0] io_mem2wb_aluRes,
  output [63:0] io_mem2wb_link,
  output [63:0] io_mem2wb_auipc,
  output [63:0] io_mem2wb_csrData,
  output [63:0] io_mem2wb_loadData,
  output        io_ld_en,
  output [63:0] io_ld_addr,
  input  [63:0] io_ld_data,
  output [2:0]  io_ld_size,
  output        io_sd_en,
  output [63:0] io_sd_addr,
  output [63:0] io_sd_data,
  output [7:0]  io_sd_mask,
  output        io_bypassMem_wen,
  output [4:0]  io_bypassMem_wdest,
  output [63:0] io_bypassMem_data,
  output        io_mtip
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
`endif // RANDOMIZE_REG_INIT
  wire  lsu_io_valid; // @[Memory.scala 31:29]
  wire  lsu_io_isa_LD; // @[Memory.scala 31:29]
  wire  lsu_io_isa_LW; // @[Memory.scala 31:29]
  wire  lsu_io_isa_LH; // @[Memory.scala 31:29]
  wire  lsu_io_isa_LB; // @[Memory.scala 31:29]
  wire  lsu_io_isa_LWU; // @[Memory.scala 31:29]
  wire  lsu_io_isa_LHU; // @[Memory.scala 31:29]
  wire  lsu_io_isa_LBU; // @[Memory.scala 31:29]
  wire  lsu_io_isa_SD; // @[Memory.scala 31:29]
  wire  lsu_io_isa_SW; // @[Memory.scala 31:29]
  wire  lsu_io_isa_SH; // @[Memory.scala 31:29]
  wire  lsu_io_isa_SB; // @[Memory.scala 31:29]
  wire [63:0] lsu_io_src1; // @[Memory.scala 31:29]
  wire [63:0] lsu_io_src2; // @[Memory.scala 31:29]
  wire [63:0] lsu_io_imm_I; // @[Memory.scala 31:29]
  wire [63:0] lsu_io_imm_S; // @[Memory.scala 31:29]
  wire  lsu_io_ld_en; // @[Memory.scala 31:29]
  wire [63:0] lsu_io_ld_addr; // @[Memory.scala 31:29]
  wire [63:0] lsu_io_ld_data; // @[Memory.scala 31:29]
  wire [2:0] lsu_io_ld_size; // @[Memory.scala 31:29]
  wire  lsu_io_sd_en; // @[Memory.scala 31:29]
  wire [63:0] lsu_io_sd_addr; // @[Memory.scala 31:29]
  wire [63:0] lsu_io_sd_data; // @[Memory.scala 31:29]
  wire [7:0] lsu_io_sd_mask; // @[Memory.scala 31:29]
  wire [63:0] lsu_io_loadData; // @[Memory.scala 31:29]
  wire  clint_clock; // @[Memory.scala 39:31]
  wire  clint_reset; // @[Memory.scala 39:31]
  wire  clint_io_valid; // @[Memory.scala 39:31]
  wire  clint_io_mtip; // @[Memory.scala 39:31]
  wire  clint_io_cld_en; // @[Memory.scala 39:31]
  wire [63:0] clint_io_cld_addr; // @[Memory.scala 39:31]
  wire [63:0] clint_io_cld_data; // @[Memory.scala 39:31]
  wire [2:0] clint_io_cld_size; // @[Memory.scala 39:31]
  wire  clint_io_csd_en; // @[Memory.scala 39:31]
  wire [63:0] clint_io_csd_addr; // @[Memory.scala 39:31]
  wire [63:0] clint_io_csd_data; // @[Memory.scala 39:31]
  wire [7:0] clint_io_csd_mask; // @[Memory.scala 39:31]
  wire  clint_io_ld_en; // @[Memory.scala 39:31]
  wire [63:0] clint_io_ld_addr; // @[Memory.scala 39:31]
  wire [63:0] clint_io_ld_data; // @[Memory.scala 39:31]
  wire [2:0] clint_io_ld_size; // @[Memory.scala 39:31]
  wire  clint_io_sd_en; // @[Memory.scala 39:31]
  wire [63:0] clint_io_sd_addr; // @[Memory.scala 39:31]
  wire [63:0] clint_io_sd_data; // @[Memory.scala 39:31]
  wire [7:0] clint_io_sd_mask; // @[Memory.scala 39:31]
  reg  memReg_valid; // @[Reg.scala 27:20]
  reg  memReg_isa_LD; // @[Reg.scala 27:20]
  reg  memReg_isa_LW; // @[Reg.scala 27:20]
  reg  memReg_isa_LH; // @[Reg.scala 27:20]
  reg  memReg_isa_LB; // @[Reg.scala 27:20]
  reg  memReg_isa_LWU; // @[Reg.scala 27:20]
  reg  memReg_isa_LHU; // @[Reg.scala 27:20]
  reg  memReg_isa_LBU; // @[Reg.scala 27:20]
  reg  memReg_isa_SD; // @[Reg.scala 27:20]
  reg  memReg_isa_SW; // @[Reg.scala 27:20]
  reg  memReg_isa_SH; // @[Reg.scala 27:20]
  reg  memReg_isa_SB; // @[Reg.scala 27:20]
  reg [63:0] memReg_src1; // @[Reg.scala 27:20]
  reg [63:0] memReg_src2; // @[Reg.scala 27:20]
  reg [63:0] memReg_imm_I; // @[Reg.scala 27:20]
  reg [63:0] memReg_imm_S; // @[Reg.scala 27:20]
  reg  memReg_wen; // @[Reg.scala 27:20]
  reg [4:0] memReg_wdest; // @[Reg.scala 27:20]
  reg [63:0] memReg_aluRes; // @[Reg.scala 27:20]
  reg [63:0] memReg_link; // @[Reg.scala 27:20]
  reg [63:0] memReg_auipc; // @[Reg.scala 27:20]
  reg [63:0] memReg_csrData; // @[Reg.scala 27:20]
  wire [63:0] _memWbdata_T = memReg_aluRes | memReg_link; // @[Memory.scala 47:43]
  wire [63:0] _memWbdata_T_1 = _memWbdata_T | memReg_auipc; // @[Memory.scala 47:57]
  wire [63:0] memWbdata = _memWbdata_T_1 | memReg_csrData; // @[Memory.scala 47:72]
  ysyx_210324_LSU lsu ( // @[Memory.scala 31:29]
    .io_valid(lsu_io_valid),
    .io_isa_LD(lsu_io_isa_LD),
    .io_isa_LW(lsu_io_isa_LW),
    .io_isa_LH(lsu_io_isa_LH),
    .io_isa_LB(lsu_io_isa_LB),
    .io_isa_LWU(lsu_io_isa_LWU),
    .io_isa_LHU(lsu_io_isa_LHU),
    .io_isa_LBU(lsu_io_isa_LBU),
    .io_isa_SD(lsu_io_isa_SD),
    .io_isa_SW(lsu_io_isa_SW),
    .io_isa_SH(lsu_io_isa_SH),
    .io_isa_SB(lsu_io_isa_SB),
    .io_src1(lsu_io_src1),
    .io_src2(lsu_io_src2),
    .io_imm_I(lsu_io_imm_I),
    .io_imm_S(lsu_io_imm_S),
    .io_ld_en(lsu_io_ld_en),
    .io_ld_addr(lsu_io_ld_addr),
    .io_ld_data(lsu_io_ld_data),
    .io_ld_size(lsu_io_ld_size),
    .io_sd_en(lsu_io_sd_en),
    .io_sd_addr(lsu_io_sd_addr),
    .io_sd_data(lsu_io_sd_data),
    .io_sd_mask(lsu_io_sd_mask),
    .io_loadData(lsu_io_loadData)
  );
  ysyx_210324_CLINT clint ( // @[Memory.scala 39:31]
    .clock(clint_clock),
    .reset(clint_reset),
    .io_valid(clint_io_valid),
    .io_mtip(clint_io_mtip),
    .io_cld_en(clint_io_cld_en),
    .io_cld_addr(clint_io_cld_addr),
    .io_cld_data(clint_io_cld_data),
    .io_cld_size(clint_io_cld_size),
    .io_csd_en(clint_io_csd_en),
    .io_csd_addr(clint_io_csd_addr),
    .io_csd_data(clint_io_csd_data),
    .io_csd_mask(clint_io_csd_mask),
    .io_ld_en(clint_io_ld_en),
    .io_ld_addr(clint_io_ld_addr),
    .io_ld_data(clint_io_ld_data),
    .io_ld_size(clint_io_ld_size),
    .io_sd_en(clint_io_sd_en),
    .io_sd_addr(clint_io_sd_addr),
    .io_sd_data(clint_io_sd_data),
    .io_sd_mask(clint_io_sd_mask)
  );
  assign io_mem2wb_valid = memReg_valid; // @[Memory.scala 54:24]
  assign io_mem2wb_wen = memReg_wen; // @[Memory.scala 63:24]
  assign io_mem2wb_wdest = memReg_wdest; // @[Memory.scala 64:24]
  assign io_mem2wb_aluRes = memReg_aluRes; // @[Memory.scala 65:24]
  assign io_mem2wb_link = memReg_link; // @[Memory.scala 68:24]
  assign io_mem2wb_auipc = memReg_auipc; // @[Memory.scala 69:24]
  assign io_mem2wb_csrData = memReg_csrData; // @[Memory.scala 70:24]
  assign io_mem2wb_loadData = lsu_io_loadData; // @[Memory.scala 71:24]
  assign io_ld_en = clint_io_ld_en; // @[Memory.scala 43:18]
  assign io_ld_addr = clint_io_ld_addr; // @[Memory.scala 43:18]
  assign io_ld_size = clint_io_ld_size; // @[Memory.scala 43:18]
  assign io_sd_en = clint_io_sd_en; // @[Memory.scala 44:18]
  assign io_sd_addr = clint_io_sd_addr; // @[Memory.scala 44:18]
  assign io_sd_data = clint_io_sd_data; // @[Memory.scala 44:18]
  assign io_sd_mask = clint_io_sd_mask; // @[Memory.scala 44:18]
  assign io_bypassMem_wen = (lsu_io_ld_en | memReg_wen) & memReg_valid; // @[Memory.scala 50:57]
  assign io_bypassMem_wdest = memReg_wdest; // @[Memory.scala 51:28]
  assign io_bypassMem_data = lsu_io_ld_en ? lsu_io_loadData : memWbdata; // @[Memory.scala 52:28]
  assign io_mtip = clint_io_mtip; // @[Memory.scala 76:24]
  assign lsu_io_valid = memReg_valid; // @[Memory.scala 32:16]
  assign lsu_io_isa_LD = memReg_isa_LD; // @[Memory.scala 33:16]
  assign lsu_io_isa_LW = memReg_isa_LW; // @[Memory.scala 33:16]
  assign lsu_io_isa_LH = memReg_isa_LH; // @[Memory.scala 33:16]
  assign lsu_io_isa_LB = memReg_isa_LB; // @[Memory.scala 33:16]
  assign lsu_io_isa_LWU = memReg_isa_LWU; // @[Memory.scala 33:16]
  assign lsu_io_isa_LHU = memReg_isa_LHU; // @[Memory.scala 33:16]
  assign lsu_io_isa_LBU = memReg_isa_LBU; // @[Memory.scala 33:16]
  assign lsu_io_isa_SD = memReg_isa_SD; // @[Memory.scala 33:16]
  assign lsu_io_isa_SW = memReg_isa_SW; // @[Memory.scala 33:16]
  assign lsu_io_isa_SH = memReg_isa_SH; // @[Memory.scala 33:16]
  assign lsu_io_isa_SB = memReg_isa_SB; // @[Memory.scala 33:16]
  assign lsu_io_src1 = memReg_src1; // @[Memory.scala 34:16]
  assign lsu_io_src2 = memReg_src2; // @[Memory.scala 35:16]
  assign lsu_io_imm_I = memReg_imm_I; // @[Memory.scala 36:16]
  assign lsu_io_imm_S = memReg_imm_S; // @[Memory.scala 36:16]
  assign lsu_io_ld_data = clint_io_cld_data; // @[Memory.scala 41:18]
  assign clint_clock = clock;
  assign clint_reset = reset;
  assign clint_io_valid = memReg_valid; // @[Memory.scala 40:18]
  assign clint_io_cld_en = lsu_io_ld_en; // @[Memory.scala 41:18]
  assign clint_io_cld_addr = lsu_io_ld_addr; // @[Memory.scala 41:18]
  assign clint_io_cld_size = lsu_io_ld_size; // @[Memory.scala 41:18]
  assign clint_io_csd_en = lsu_io_sd_en; // @[Memory.scala 42:18]
  assign clint_io_csd_addr = lsu_io_sd_addr; // @[Memory.scala 42:18]
  assign clint_io_csd_data = lsu_io_sd_data; // @[Memory.scala 42:18]
  assign clint_io_csd_mask = lsu_io_sd_mask; // @[Memory.scala 42:18]
  assign clint_io_ld_data = io_ld_data; // @[Memory.scala 43:18]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      memReg_valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_valid <= io_ex2mem_valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_isa_LD <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_isa_LD <= io_ex2mem_isa_LD; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_isa_LW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_isa_LW <= io_ex2mem_isa_LW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_isa_LH <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_isa_LH <= io_ex2mem_isa_LH; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_isa_LB <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_isa_LB <= io_ex2mem_isa_LB; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_isa_LWU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_isa_LWU <= io_ex2mem_isa_LWU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_isa_LHU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_isa_LHU <= io_ex2mem_isa_LHU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_isa_LBU <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_isa_LBU <= io_ex2mem_isa_LBU; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_isa_SD <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_isa_SD <= io_ex2mem_isa_SD; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_isa_SW <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_isa_SW <= io_ex2mem_isa_SW; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_isa_SH <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_isa_SH <= io_ex2mem_isa_SH; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_isa_SB <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_isa_SB <= io_ex2mem_isa_SB; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_src1 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_src1 <= io_ex2mem_src1; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_src2 <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_src2 <= io_ex2mem_src2; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_imm_I <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_imm_I <= io_ex2mem_imm_I; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_imm_S <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_imm_S <= io_ex2mem_imm_S; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_wen <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_wen <= io_ex2mem_wen; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_wdest <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_wdest <= io_ex2mem_wdest; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_aluRes <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_aluRes <= io_ex2mem_aluRes; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_link <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_link <= io_ex2mem_link; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_auipc <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_auipc <= io_ex2mem_auipc; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      memReg_csrData <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      memReg_csrData <= io_ex2mem_csrData; // @[Reg.scala 28:23]
    end
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
  memReg_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  memReg_isa_LD = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  memReg_isa_LW = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  memReg_isa_LH = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  memReg_isa_LB = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  memReg_isa_LWU = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  memReg_isa_LHU = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  memReg_isa_LBU = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  memReg_isa_SD = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  memReg_isa_SW = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  memReg_isa_SH = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  memReg_isa_SB = _RAND_11[0:0];
  _RAND_12 = {2{`RANDOM}};
  memReg_src1 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  memReg_src2 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  memReg_imm_I = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  memReg_imm_S = _RAND_15[63:0];
  _RAND_16 = {1{`RANDOM}};
  memReg_wen = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  memReg_wdest = _RAND_17[4:0];
  _RAND_18 = {2{`RANDOM}};
  memReg_aluRes = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  memReg_link = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  memReg_auipc = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  memReg_csrData = _RAND_21[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_WriteBack(
  input         clock,
  input         reset,
  input         io_globalEn,
  input         io_mem2wb_valid,
  input         io_mem2wb_wen,
  input  [4:0]  io_mem2wb_wdest,
  input  [63:0] io_mem2wb_aluRes,
  input  [63:0] io_mem2wb_link,
  input  [63:0] io_mem2wb_auipc,
  input  [63:0] io_mem2wb_csrData,
  input  [63:0] io_mem2wb_loadData,
  output        io_wbdata_wen,
  output [4:0]  io_wbdata_wdest,
  output [63:0] io_wbdata_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg  wbReg_valid; // @[Reg.scala 27:20]
  reg  wbReg_wen; // @[Reg.scala 27:20]
  reg [4:0] wbReg_wdest; // @[Reg.scala 27:20]
  reg [63:0] wbReg_aluRes; // @[Reg.scala 27:20]
  reg [63:0] wbReg_link; // @[Reg.scala 27:20]
  reg [63:0] wbReg_auipc; // @[Reg.scala 27:20]
  reg [63:0] wbReg_csrData; // @[Reg.scala 27:20]
  reg [63:0] wbReg_loadData; // @[Reg.scala 27:20]
  wire [63:0] _wbdata_T = wbReg_aluRes | wbReg_link; // @[WriteBack.scala 52:33]
  wire [63:0] _wbdata_T_1 = _wbdata_T | wbReg_auipc; // @[WriteBack.scala 52:40]
  wire [63:0] _wbdata_T_2 = _wbdata_T_1 | wbReg_loadData; // @[WriteBack.scala 52:48]
  assign io_wbdata_wen = wbReg_valid & wbReg_wen; // @[WriteBack.scala 54:28]
  assign io_wbdata_wdest = wbReg_wdest; // @[WriteBack.scala 55:19]
  assign io_wbdata_data = _wbdata_T_2 | wbReg_csrData; // @[WriteBack.scala 52:59]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 27:20]
      wbReg_valid <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      wbReg_valid <= io_mem2wb_valid; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbReg_wen <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      wbReg_wen <= io_mem2wb_wen; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbReg_wdest <= 5'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      wbReg_wdest <= io_mem2wb_wdest; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbReg_aluRes <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      wbReg_aluRes <= io_mem2wb_aluRes; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbReg_link <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      wbReg_link <= io_mem2wb_link; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbReg_auipc <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      wbReg_auipc <= io_mem2wb_auipc; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbReg_csrData <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      wbReg_csrData <= io_mem2wb_csrData; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      wbReg_loadData <= 64'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      wbReg_loadData <= io_mem2wb_loadData; // @[Reg.scala 28:23]
    end
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
  wbReg_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  wbReg_wen = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  wbReg_wdest = _RAND_2[4:0];
  _RAND_3 = {2{`RANDOM}};
  wbReg_aluRes = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  wbReg_link = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  wbReg_auipc = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  wbReg_csrData = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  wbReg_loadData = _RAND_7[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_TreeCoreL2(
  input         clock,
  input         reset,
  input         io_globalEn,
  output [63:0] io_fetch_addr,
  input  [31:0] io_fetch_data,
  output        io_ld_en,
  output [63:0] io_ld_addr,
  input  [63:0] io_ld_data,
  output [2:0]  io_ld_size,
  output        io_sd_en,
  output [63:0] io_sd_addr,
  output [63:0] io_sd_data,
  output [7:0]  io_sd_mask
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  ifu_clock; // @[TreeCoreL2.scala 24:29]
  wire  ifu_reset; // @[TreeCoreL2.scala 24:29]
  wire  ifu_io_globalEn; // @[TreeCoreL2.scala 24:29]
  wire  ifu_io_stall; // @[TreeCoreL2.scala 24:29]
  wire  ifu_io_branchInfo_branch; // @[TreeCoreL2.scala 24:29]
  wire  ifu_io_branchInfo_jump; // @[TreeCoreL2.scala 24:29]
  wire  ifu_io_branchInfo_taken; // @[TreeCoreL2.scala 24:29]
  wire [4:0] ifu_io_branchInfo_idx; // @[TreeCoreL2.scala 24:29]
  wire [63:0] ifu_io_branchInfo_pc; // @[TreeCoreL2.scala 24:29]
  wire [63:0] ifu_io_branchInfo_tgt; // @[TreeCoreL2.scala 24:29]
  wire [63:0] ifu_io_fetch_addr; // @[TreeCoreL2.scala 24:29]
  wire [31:0] ifu_io_fetch_data; // @[TreeCoreL2.scala 24:29]
  wire  ifu_io_if2id_valid; // @[TreeCoreL2.scala 24:29]
  wire [31:0] ifu_io_if2id_inst; // @[TreeCoreL2.scala 24:29]
  wire [63:0] ifu_io_if2id_pc; // @[TreeCoreL2.scala 24:29]
  wire [4:0] ifu_io_if2id_branIdx; // @[TreeCoreL2.scala 24:29]
  wire  ifu_io_if2id_predTaken; // @[TreeCoreL2.scala 24:29]
  wire  ifu_io_nxtPC_trap; // @[TreeCoreL2.scala 24:29]
  wire [63:0] ifu_io_nxtPC_mtvec; // @[TreeCoreL2.scala 24:29]
  wire  ifu_io_nxtPC_mret; // @[TreeCoreL2.scala 24:29]
  wire [63:0] ifu_io_nxtPC_mepc; // @[TreeCoreL2.scala 24:29]
  wire  ifu_io_nxtPC_branch; // @[TreeCoreL2.scala 24:29]
  wire [63:0] ifu_io_nxtPC_tgt; // @[TreeCoreL2.scala 24:29]
  wire  idu_clock; // @[TreeCoreL2.scala 25:29]
  wire  idu_reset; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_globalEn; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_stall; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_if2id_valid; // @[TreeCoreL2.scala 25:29]
  wire [31:0] idu_io_if2id_inst; // @[TreeCoreL2.scala 25:29]
  wire [63:0] idu_io_if2id_pc; // @[TreeCoreL2.scala 25:29]
  wire [4:0] idu_io_if2id_branIdx; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_if2id_predTaken; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_wbdata_wen; // @[TreeCoreL2.scala 25:29]
  wire [4:0] idu_io_wbdata_wdest; // @[TreeCoreL2.scala 25:29]
  wire [63:0] idu_io_wbdata_data; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_valid; // @[TreeCoreL2.scala 25:29]
  wire [31:0] idu_io_id2ex_inst; // @[TreeCoreL2.scala 25:29]
  wire [63:0] idu_io_id2ex_pc; // @[TreeCoreL2.scala 25:29]
  wire [4:0] idu_io_id2ex_branIdx; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_predTaken; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_ADD; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_ADDI; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_ADDW; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_ADDIW; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SUB; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SUBW; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_LUI; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_AUIPC; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_XOR; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_XORI; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_OR; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_ORI; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_AND; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_ANDI; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SLL; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SLLI; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SLLW; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SLLIW; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SRL; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SRLI; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SRLW; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SRLIW; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SRA; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SRAI; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SRAW; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SRAIW; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SLT; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SLTI; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SLTU; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SLTIU; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_BEQ; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_BNE; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_BLT; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_BGE; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_BLTU; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_BGEU; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_JAL; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_JALR; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_LD; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_LW; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_LH; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_LB; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_LWU; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_LHU; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_LBU; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SD; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SW; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SH; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_SB; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_isa_MRET; // @[TreeCoreL2.scala 25:29]
  wire [63:0] idu_io_id2ex_src1; // @[TreeCoreL2.scala 25:29]
  wire [63:0] idu_io_id2ex_src2; // @[TreeCoreL2.scala 25:29]
  wire [63:0] idu_io_id2ex_imm_I; // @[TreeCoreL2.scala 25:29]
  wire [63:0] idu_io_id2ex_imm_B; // @[TreeCoreL2.scala 25:29]
  wire [63:0] idu_io_id2ex_imm_S; // @[TreeCoreL2.scala 25:29]
  wire [63:0] idu_io_id2ex_imm_U; // @[TreeCoreL2.scala 25:29]
  wire [63:0] idu_io_id2ex_imm_J; // @[TreeCoreL2.scala 25:29]
  wire  idu_io_id2ex_wen; // @[TreeCoreL2.scala 25:29]
  wire [4:0] idu_io_id2ex_wdest; // @[TreeCoreL2.scala 25:29]
  wire  exu_clock; // @[TreeCoreL2.scala 26:29]
  wire  exu_reset; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_globalEn; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_mtip; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_stall; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_valid; // @[TreeCoreL2.scala 26:29]
  wire [31:0] exu_io_id2ex_inst; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_id2ex_pc; // @[TreeCoreL2.scala 26:29]
  wire [4:0] exu_io_id2ex_branIdx; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_predTaken; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_ADD; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_ADDI; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_ADDW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_ADDIW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SUB; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SUBW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_LUI; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_AUIPC; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_XOR; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_XORI; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_OR; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_ORI; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_AND; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_ANDI; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SLL; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SLLI; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SLLW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SLLIW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SRL; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SRLI; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SRLW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SRLIW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SRA; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SRAI; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SRAW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SRAIW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SLT; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SLTI; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SLTU; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SLTIU; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_BEQ; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_BNE; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_BLT; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_BGE; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_BLTU; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_BGEU; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_JAL; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_JALR; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_LD; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_LW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_LH; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_LB; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_LWU; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_LHU; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_LBU; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SD; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SH; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_SB; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_isa_MRET; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_id2ex_src1; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_id2ex_src2; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_id2ex_imm_I; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_id2ex_imm_B; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_id2ex_imm_S; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_id2ex_imm_U; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_id2ex_imm_J; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_id2ex_wen; // @[TreeCoreL2.scala 26:29]
  wire [4:0] exu_io_id2ex_wdest; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_bypassMem_wen; // @[TreeCoreL2.scala 26:29]
  wire [4:0] exu_io_bypassMem_wdest; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_bypassMem_data; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_bypassWb_wen; // @[TreeCoreL2.scala 26:29]
  wire [4:0] exu_io_bypassWb_wdest; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_bypassWb_data; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_valid; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_isa_LD; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_isa_LW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_isa_LH; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_isa_LB; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_isa_LWU; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_isa_LHU; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_isa_LBU; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_isa_SD; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_isa_SW; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_isa_SH; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_isa_SB; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_ex2mem_src1; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_ex2mem_src2; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_ex2mem_imm_I; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_ex2mem_imm_S; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_ex2mem_wen; // @[TreeCoreL2.scala 26:29]
  wire [4:0] exu_io_ex2mem_wdest; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_ex2mem_aluRes; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_ex2mem_link; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_ex2mem_auipc; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_ex2mem_csrData; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_nxtPC_trap; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_nxtPC_mtvec; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_nxtPC_mret; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_nxtPC_mepc; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_nxtPC_branch; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_nxtPC_tgt; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_branchInfo_branch; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_branchInfo_jump; // @[TreeCoreL2.scala 26:29]
  wire  exu_io_branchInfo_taken; // @[TreeCoreL2.scala 26:29]
  wire [4:0] exu_io_branchInfo_idx; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_branchInfo_pc; // @[TreeCoreL2.scala 26:29]
  wire [63:0] exu_io_branchInfo_tgt; // @[TreeCoreL2.scala 26:29]
  wire  mau_clock; // @[TreeCoreL2.scala 27:29]
  wire  mau_reset; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_globalEn; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_valid; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_isa_LD; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_isa_LW; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_isa_LH; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_isa_LB; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_isa_LWU; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_isa_LHU; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_isa_LBU; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_isa_SD; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_isa_SW; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_isa_SH; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_isa_SB; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_ex2mem_src1; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_ex2mem_src2; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_ex2mem_imm_I; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_ex2mem_imm_S; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ex2mem_wen; // @[TreeCoreL2.scala 27:29]
  wire [4:0] mau_io_ex2mem_wdest; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_ex2mem_aluRes; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_ex2mem_link; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_ex2mem_auipc; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_ex2mem_csrData; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_mem2wb_valid; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_mem2wb_wen; // @[TreeCoreL2.scala 27:29]
  wire [4:0] mau_io_mem2wb_wdest; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_mem2wb_aluRes; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_mem2wb_link; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_mem2wb_auipc; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_mem2wb_csrData; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_mem2wb_loadData; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_ld_en; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_ld_addr; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_ld_data; // @[TreeCoreL2.scala 27:29]
  wire [2:0] mau_io_ld_size; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_sd_en; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_sd_addr; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_sd_data; // @[TreeCoreL2.scala 27:29]
  wire [7:0] mau_io_sd_mask; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_bypassMem_wen; // @[TreeCoreL2.scala 27:29]
  wire [4:0] mau_io_bypassMem_wdest; // @[TreeCoreL2.scala 27:29]
  wire [63:0] mau_io_bypassMem_data; // @[TreeCoreL2.scala 27:29]
  wire  mau_io_mtip; // @[TreeCoreL2.scala 27:29]
  wire  wbu_clock; // @[TreeCoreL2.scala 28:29]
  wire  wbu_reset; // @[TreeCoreL2.scala 28:29]
  wire  wbu_io_globalEn; // @[TreeCoreL2.scala 28:29]
  wire  wbu_io_mem2wb_valid; // @[TreeCoreL2.scala 28:29]
  wire  wbu_io_mem2wb_wen; // @[TreeCoreL2.scala 28:29]
  wire [4:0] wbu_io_mem2wb_wdest; // @[TreeCoreL2.scala 28:29]
  wire [63:0] wbu_io_mem2wb_aluRes; // @[TreeCoreL2.scala 28:29]
  wire [63:0] wbu_io_mem2wb_link; // @[TreeCoreL2.scala 28:29]
  wire [63:0] wbu_io_mem2wb_auipc; // @[TreeCoreL2.scala 28:29]
  wire [63:0] wbu_io_mem2wb_csrData; // @[TreeCoreL2.scala 28:29]
  wire [63:0] wbu_io_mem2wb_loadData; // @[TreeCoreL2.scala 28:29]
  wire  wbu_io_wbdata_wen; // @[TreeCoreL2.scala 28:29]
  wire [4:0] wbu_io_wbdata_wdest; // @[TreeCoreL2.scala 28:29]
  wire [63:0] wbu_io_wbdata_data; // @[TreeCoreL2.scala 28:29]
  wire  _T = io_globalEn & exu_io_stall; // @[TreeCoreL2.scala 53:58]
  reg [1:0] tickCnt; // @[Counter.scala 60:40]
  wire  wrap_wrap = tickCnt == 2'h2; // @[Counter.scala 72:24]
  wire [1:0] _wrap_value_T_1 = tickCnt + 2'h1; // @[Counter.scala 76:24]
  wire  stallCycle1 = exu_io_stall & tickCnt == 2'h0; // @[TreeCoreL2.scala 54:46]
  wire  stallCycle2 = exu_io_stall & tickCnt == 2'h1; // @[TreeCoreL2.scala 55:46]
  wire  stallCycle3 = exu_io_stall & wrap_wrap; // @[TreeCoreL2.scala 56:46]
  wire  _exu_io_globalEn_T = stallCycle1 | stallCycle2; // @[TreeCoreL2.scala 63:38]
  reg [63:0] ldDataInStall; // @[TreeCoreL2.scala 70:40]
  reg  lsStall_r; // @[Reg.scala 27:20]
  reg  lsStall_r_1; // @[Reg.scala 27:20]
  wire  lsStall = lsStall_r | lsStall_r_1; // @[TreeCoreL2.scala 84:72]
  wire  _io_ld_enT = ~lsStall; // @[TreeCoreL2.scala 85:37]
  ysyx_210324_IFU ifu ( // @[TreeCoreL2.scala 24:29]
    .clock(ifu_clock),
    .reset(ifu_reset),
    .io_globalEn(ifu_io_globalEn),
    .io_stall(ifu_io_stall),
    .io_branchInfo_branch(ifu_io_branchInfo_branch),
    .io_branchInfo_jump(ifu_io_branchInfo_jump),
    .io_branchInfo_taken(ifu_io_branchInfo_taken),
    .io_branchInfo_idx(ifu_io_branchInfo_idx),
    .io_branchInfo_pc(ifu_io_branchInfo_pc),
    .io_branchInfo_tgt(ifu_io_branchInfo_tgt),
    .io_fetch_addr(ifu_io_fetch_addr),
    .io_fetch_data(ifu_io_fetch_data),
    .io_if2id_valid(ifu_io_if2id_valid),
    .io_if2id_inst(ifu_io_if2id_inst),
    .io_if2id_pc(ifu_io_if2id_pc),
    .io_if2id_branIdx(ifu_io_if2id_branIdx),
    .io_if2id_predTaken(ifu_io_if2id_predTaken),
    .io_nxtPC_trap(ifu_io_nxtPC_trap),
    .io_nxtPC_mtvec(ifu_io_nxtPC_mtvec),
    .io_nxtPC_mret(ifu_io_nxtPC_mret),
    .io_nxtPC_mepc(ifu_io_nxtPC_mepc),
    .io_nxtPC_branch(ifu_io_nxtPC_branch),
    .io_nxtPC_tgt(ifu_io_nxtPC_tgt)
  );
  ysyx_210324_IDU idu ( // @[TreeCoreL2.scala 25:29]
    .clock(idu_clock),
    .reset(idu_reset),
    .io_globalEn(idu_io_globalEn),
    .io_stall(idu_io_stall),
    .io_if2id_valid(idu_io_if2id_valid),
    .io_if2id_inst(idu_io_if2id_inst),
    .io_if2id_pc(idu_io_if2id_pc),
    .io_if2id_branIdx(idu_io_if2id_branIdx),
    .io_if2id_predTaken(idu_io_if2id_predTaken),
    .io_wbdata_wen(idu_io_wbdata_wen),
    .io_wbdata_wdest(idu_io_wbdata_wdest),
    .io_wbdata_data(idu_io_wbdata_data),
    .io_id2ex_valid(idu_io_id2ex_valid),
    .io_id2ex_inst(idu_io_id2ex_inst),
    .io_id2ex_pc(idu_io_id2ex_pc),
    .io_id2ex_branIdx(idu_io_id2ex_branIdx),
    .io_id2ex_predTaken(idu_io_id2ex_predTaken),
    .io_id2ex_isa_ADD(idu_io_id2ex_isa_ADD),
    .io_id2ex_isa_ADDI(idu_io_id2ex_isa_ADDI),
    .io_id2ex_isa_ADDW(idu_io_id2ex_isa_ADDW),
    .io_id2ex_isa_ADDIW(idu_io_id2ex_isa_ADDIW),
    .io_id2ex_isa_SUB(idu_io_id2ex_isa_SUB),
    .io_id2ex_isa_SUBW(idu_io_id2ex_isa_SUBW),
    .io_id2ex_isa_LUI(idu_io_id2ex_isa_LUI),
    .io_id2ex_isa_AUIPC(idu_io_id2ex_isa_AUIPC),
    .io_id2ex_isa_XOR(idu_io_id2ex_isa_XOR),
    .io_id2ex_isa_XORI(idu_io_id2ex_isa_XORI),
    .io_id2ex_isa_OR(idu_io_id2ex_isa_OR),
    .io_id2ex_isa_ORI(idu_io_id2ex_isa_ORI),
    .io_id2ex_isa_AND(idu_io_id2ex_isa_AND),
    .io_id2ex_isa_ANDI(idu_io_id2ex_isa_ANDI),
    .io_id2ex_isa_SLL(idu_io_id2ex_isa_SLL),
    .io_id2ex_isa_SLLI(idu_io_id2ex_isa_SLLI),
    .io_id2ex_isa_SLLW(idu_io_id2ex_isa_SLLW),
    .io_id2ex_isa_SLLIW(idu_io_id2ex_isa_SLLIW),
    .io_id2ex_isa_SRL(idu_io_id2ex_isa_SRL),
    .io_id2ex_isa_SRLI(idu_io_id2ex_isa_SRLI),
    .io_id2ex_isa_SRLW(idu_io_id2ex_isa_SRLW),
    .io_id2ex_isa_SRLIW(idu_io_id2ex_isa_SRLIW),
    .io_id2ex_isa_SRA(idu_io_id2ex_isa_SRA),
    .io_id2ex_isa_SRAI(idu_io_id2ex_isa_SRAI),
    .io_id2ex_isa_SRAW(idu_io_id2ex_isa_SRAW),
    .io_id2ex_isa_SRAIW(idu_io_id2ex_isa_SRAIW),
    .io_id2ex_isa_SLT(idu_io_id2ex_isa_SLT),
    .io_id2ex_isa_SLTI(idu_io_id2ex_isa_SLTI),
    .io_id2ex_isa_SLTU(idu_io_id2ex_isa_SLTU),
    .io_id2ex_isa_SLTIU(idu_io_id2ex_isa_SLTIU),
    .io_id2ex_isa_BEQ(idu_io_id2ex_isa_BEQ),
    .io_id2ex_isa_BNE(idu_io_id2ex_isa_BNE),
    .io_id2ex_isa_BLT(idu_io_id2ex_isa_BLT),
    .io_id2ex_isa_BGE(idu_io_id2ex_isa_BGE),
    .io_id2ex_isa_BLTU(idu_io_id2ex_isa_BLTU),
    .io_id2ex_isa_BGEU(idu_io_id2ex_isa_BGEU),
    .io_id2ex_isa_JAL(idu_io_id2ex_isa_JAL),
    .io_id2ex_isa_JALR(idu_io_id2ex_isa_JALR),
    .io_id2ex_isa_LD(idu_io_id2ex_isa_LD),
    .io_id2ex_isa_LW(idu_io_id2ex_isa_LW),
    .io_id2ex_isa_LH(idu_io_id2ex_isa_LH),
    .io_id2ex_isa_LB(idu_io_id2ex_isa_LB),
    .io_id2ex_isa_LWU(idu_io_id2ex_isa_LWU),
    .io_id2ex_isa_LHU(idu_io_id2ex_isa_LHU),
    .io_id2ex_isa_LBU(idu_io_id2ex_isa_LBU),
    .io_id2ex_isa_SD(idu_io_id2ex_isa_SD),
    .io_id2ex_isa_SW(idu_io_id2ex_isa_SW),
    .io_id2ex_isa_SH(idu_io_id2ex_isa_SH),
    .io_id2ex_isa_SB(idu_io_id2ex_isa_SB),
    .io_id2ex_isa_MRET(idu_io_id2ex_isa_MRET),
    .io_id2ex_src1(idu_io_id2ex_src1),
    .io_id2ex_src2(idu_io_id2ex_src2),
    .io_id2ex_imm_I(idu_io_id2ex_imm_I),
    .io_id2ex_imm_B(idu_io_id2ex_imm_B),
    .io_id2ex_imm_S(idu_io_id2ex_imm_S),
    .io_id2ex_imm_U(idu_io_id2ex_imm_U),
    .io_id2ex_imm_J(idu_io_id2ex_imm_J),
    .io_id2ex_wen(idu_io_id2ex_wen),
    .io_id2ex_wdest(idu_io_id2ex_wdest)
  );
  ysyx_210324_EXU exu ( // @[TreeCoreL2.scala 26:29]
    .clock(exu_clock),
    .reset(exu_reset),
    .io_globalEn(exu_io_globalEn),
    .io_mtip(exu_io_mtip),
    .io_stall(exu_io_stall),
    .io_id2ex_valid(exu_io_id2ex_valid),
    .io_id2ex_inst(exu_io_id2ex_inst),
    .io_id2ex_pc(exu_io_id2ex_pc),
    .io_id2ex_branIdx(exu_io_id2ex_branIdx),
    .io_id2ex_predTaken(exu_io_id2ex_predTaken),
    .io_id2ex_isa_ADD(exu_io_id2ex_isa_ADD),
    .io_id2ex_isa_ADDI(exu_io_id2ex_isa_ADDI),
    .io_id2ex_isa_ADDW(exu_io_id2ex_isa_ADDW),
    .io_id2ex_isa_ADDIW(exu_io_id2ex_isa_ADDIW),
    .io_id2ex_isa_SUB(exu_io_id2ex_isa_SUB),
    .io_id2ex_isa_SUBW(exu_io_id2ex_isa_SUBW),
    .io_id2ex_isa_LUI(exu_io_id2ex_isa_LUI),
    .io_id2ex_isa_AUIPC(exu_io_id2ex_isa_AUIPC),
    .io_id2ex_isa_XOR(exu_io_id2ex_isa_XOR),
    .io_id2ex_isa_XORI(exu_io_id2ex_isa_XORI),
    .io_id2ex_isa_OR(exu_io_id2ex_isa_OR),
    .io_id2ex_isa_ORI(exu_io_id2ex_isa_ORI),
    .io_id2ex_isa_AND(exu_io_id2ex_isa_AND),
    .io_id2ex_isa_ANDI(exu_io_id2ex_isa_ANDI),
    .io_id2ex_isa_SLL(exu_io_id2ex_isa_SLL),
    .io_id2ex_isa_SLLI(exu_io_id2ex_isa_SLLI),
    .io_id2ex_isa_SLLW(exu_io_id2ex_isa_SLLW),
    .io_id2ex_isa_SLLIW(exu_io_id2ex_isa_SLLIW),
    .io_id2ex_isa_SRL(exu_io_id2ex_isa_SRL),
    .io_id2ex_isa_SRLI(exu_io_id2ex_isa_SRLI),
    .io_id2ex_isa_SRLW(exu_io_id2ex_isa_SRLW),
    .io_id2ex_isa_SRLIW(exu_io_id2ex_isa_SRLIW),
    .io_id2ex_isa_SRA(exu_io_id2ex_isa_SRA),
    .io_id2ex_isa_SRAI(exu_io_id2ex_isa_SRAI),
    .io_id2ex_isa_SRAW(exu_io_id2ex_isa_SRAW),
    .io_id2ex_isa_SRAIW(exu_io_id2ex_isa_SRAIW),
    .io_id2ex_isa_SLT(exu_io_id2ex_isa_SLT),
    .io_id2ex_isa_SLTI(exu_io_id2ex_isa_SLTI),
    .io_id2ex_isa_SLTU(exu_io_id2ex_isa_SLTU),
    .io_id2ex_isa_SLTIU(exu_io_id2ex_isa_SLTIU),
    .io_id2ex_isa_BEQ(exu_io_id2ex_isa_BEQ),
    .io_id2ex_isa_BNE(exu_io_id2ex_isa_BNE),
    .io_id2ex_isa_BLT(exu_io_id2ex_isa_BLT),
    .io_id2ex_isa_BGE(exu_io_id2ex_isa_BGE),
    .io_id2ex_isa_BLTU(exu_io_id2ex_isa_BLTU),
    .io_id2ex_isa_BGEU(exu_io_id2ex_isa_BGEU),
    .io_id2ex_isa_JAL(exu_io_id2ex_isa_JAL),
    .io_id2ex_isa_JALR(exu_io_id2ex_isa_JALR),
    .io_id2ex_isa_LD(exu_io_id2ex_isa_LD),
    .io_id2ex_isa_LW(exu_io_id2ex_isa_LW),
    .io_id2ex_isa_LH(exu_io_id2ex_isa_LH),
    .io_id2ex_isa_LB(exu_io_id2ex_isa_LB),
    .io_id2ex_isa_LWU(exu_io_id2ex_isa_LWU),
    .io_id2ex_isa_LHU(exu_io_id2ex_isa_LHU),
    .io_id2ex_isa_LBU(exu_io_id2ex_isa_LBU),
    .io_id2ex_isa_SD(exu_io_id2ex_isa_SD),
    .io_id2ex_isa_SW(exu_io_id2ex_isa_SW),
    .io_id2ex_isa_SH(exu_io_id2ex_isa_SH),
    .io_id2ex_isa_SB(exu_io_id2ex_isa_SB),
    .io_id2ex_isa_MRET(exu_io_id2ex_isa_MRET),
    .io_id2ex_src1(exu_io_id2ex_src1),
    .io_id2ex_src2(exu_io_id2ex_src2),
    .io_id2ex_imm_I(exu_io_id2ex_imm_I),
    .io_id2ex_imm_B(exu_io_id2ex_imm_B),
    .io_id2ex_imm_S(exu_io_id2ex_imm_S),
    .io_id2ex_imm_U(exu_io_id2ex_imm_U),
    .io_id2ex_imm_J(exu_io_id2ex_imm_J),
    .io_id2ex_wen(exu_io_id2ex_wen),
    .io_id2ex_wdest(exu_io_id2ex_wdest),
    .io_bypassMem_wen(exu_io_bypassMem_wen),
    .io_bypassMem_wdest(exu_io_bypassMem_wdest),
    .io_bypassMem_data(exu_io_bypassMem_data),
    .io_bypassWb_wen(exu_io_bypassWb_wen),
    .io_bypassWb_wdest(exu_io_bypassWb_wdest),
    .io_bypassWb_data(exu_io_bypassWb_data),
    .io_ex2mem_valid(exu_io_ex2mem_valid),
    .io_ex2mem_isa_LD(exu_io_ex2mem_isa_LD),
    .io_ex2mem_isa_LW(exu_io_ex2mem_isa_LW),
    .io_ex2mem_isa_LH(exu_io_ex2mem_isa_LH),
    .io_ex2mem_isa_LB(exu_io_ex2mem_isa_LB),
    .io_ex2mem_isa_LWU(exu_io_ex2mem_isa_LWU),
    .io_ex2mem_isa_LHU(exu_io_ex2mem_isa_LHU),
    .io_ex2mem_isa_LBU(exu_io_ex2mem_isa_LBU),
    .io_ex2mem_isa_SD(exu_io_ex2mem_isa_SD),
    .io_ex2mem_isa_SW(exu_io_ex2mem_isa_SW),
    .io_ex2mem_isa_SH(exu_io_ex2mem_isa_SH),
    .io_ex2mem_isa_SB(exu_io_ex2mem_isa_SB),
    .io_ex2mem_src1(exu_io_ex2mem_src1),
    .io_ex2mem_src2(exu_io_ex2mem_src2),
    .io_ex2mem_imm_I(exu_io_ex2mem_imm_I),
    .io_ex2mem_imm_S(exu_io_ex2mem_imm_S),
    .io_ex2mem_wen(exu_io_ex2mem_wen),
    .io_ex2mem_wdest(exu_io_ex2mem_wdest),
    .io_ex2mem_aluRes(exu_io_ex2mem_aluRes),
    .io_ex2mem_link(exu_io_ex2mem_link),
    .io_ex2mem_auipc(exu_io_ex2mem_auipc),
    .io_ex2mem_csrData(exu_io_ex2mem_csrData),
    .io_nxtPC_trap(exu_io_nxtPC_trap),
    .io_nxtPC_mtvec(exu_io_nxtPC_mtvec),
    .io_nxtPC_mret(exu_io_nxtPC_mret),
    .io_nxtPC_mepc(exu_io_nxtPC_mepc),
    .io_nxtPC_branch(exu_io_nxtPC_branch),
    .io_nxtPC_tgt(exu_io_nxtPC_tgt),
    .io_branchInfo_branch(exu_io_branchInfo_branch),
    .io_branchInfo_jump(exu_io_branchInfo_jump),
    .io_branchInfo_taken(exu_io_branchInfo_taken),
    .io_branchInfo_idx(exu_io_branchInfo_idx),
    .io_branchInfo_pc(exu_io_branchInfo_pc),
    .io_branchInfo_tgt(exu_io_branchInfo_tgt)
  );
  ysyx_210324_Memory mau ( // @[TreeCoreL2.scala 27:29]
    .clock(mau_clock),
    .reset(mau_reset),
    .io_globalEn(mau_io_globalEn),
    .io_ex2mem_valid(mau_io_ex2mem_valid),
    .io_ex2mem_isa_LD(mau_io_ex2mem_isa_LD),
    .io_ex2mem_isa_LW(mau_io_ex2mem_isa_LW),
    .io_ex2mem_isa_LH(mau_io_ex2mem_isa_LH),
    .io_ex2mem_isa_LB(mau_io_ex2mem_isa_LB),
    .io_ex2mem_isa_LWU(mau_io_ex2mem_isa_LWU),
    .io_ex2mem_isa_LHU(mau_io_ex2mem_isa_LHU),
    .io_ex2mem_isa_LBU(mau_io_ex2mem_isa_LBU),
    .io_ex2mem_isa_SD(mau_io_ex2mem_isa_SD),
    .io_ex2mem_isa_SW(mau_io_ex2mem_isa_SW),
    .io_ex2mem_isa_SH(mau_io_ex2mem_isa_SH),
    .io_ex2mem_isa_SB(mau_io_ex2mem_isa_SB),
    .io_ex2mem_src1(mau_io_ex2mem_src1),
    .io_ex2mem_src2(mau_io_ex2mem_src2),
    .io_ex2mem_imm_I(mau_io_ex2mem_imm_I),
    .io_ex2mem_imm_S(mau_io_ex2mem_imm_S),
    .io_ex2mem_wen(mau_io_ex2mem_wen),
    .io_ex2mem_wdest(mau_io_ex2mem_wdest),
    .io_ex2mem_aluRes(mau_io_ex2mem_aluRes),
    .io_ex2mem_link(mau_io_ex2mem_link),
    .io_ex2mem_auipc(mau_io_ex2mem_auipc),
    .io_ex2mem_csrData(mau_io_ex2mem_csrData),
    .io_mem2wb_valid(mau_io_mem2wb_valid),
    .io_mem2wb_wen(mau_io_mem2wb_wen),
    .io_mem2wb_wdest(mau_io_mem2wb_wdest),
    .io_mem2wb_aluRes(mau_io_mem2wb_aluRes),
    .io_mem2wb_link(mau_io_mem2wb_link),
    .io_mem2wb_auipc(mau_io_mem2wb_auipc),
    .io_mem2wb_csrData(mau_io_mem2wb_csrData),
    .io_mem2wb_loadData(mau_io_mem2wb_loadData),
    .io_ld_en(mau_io_ld_en),
    .io_ld_addr(mau_io_ld_addr),
    .io_ld_data(mau_io_ld_data),
    .io_ld_size(mau_io_ld_size),
    .io_sd_en(mau_io_sd_en),
    .io_sd_addr(mau_io_sd_addr),
    .io_sd_data(mau_io_sd_data),
    .io_sd_mask(mau_io_sd_mask),
    .io_bypassMem_wen(mau_io_bypassMem_wen),
    .io_bypassMem_wdest(mau_io_bypassMem_wdest),
    .io_bypassMem_data(mau_io_bypassMem_data),
    .io_mtip(mau_io_mtip)
  );
  ysyx_210324_WriteBack wbu ( // @[TreeCoreL2.scala 28:29]
    .clock(wbu_clock),
    .reset(wbu_reset),
    .io_globalEn(wbu_io_globalEn),
    .io_mem2wb_valid(wbu_io_mem2wb_valid),
    .io_mem2wb_wen(wbu_io_mem2wb_wen),
    .io_mem2wb_wdest(wbu_io_mem2wb_wdest),
    .io_mem2wb_aluRes(wbu_io_mem2wb_aluRes),
    .io_mem2wb_link(wbu_io_mem2wb_link),
    .io_mem2wb_auipc(wbu_io_mem2wb_auipc),
    .io_mem2wb_csrData(wbu_io_mem2wb_csrData),
    .io_mem2wb_loadData(wbu_io_mem2wb_loadData),
    .io_wbdata_wen(wbu_io_wbdata_wen),
    .io_wbdata_wdest(wbu_io_wbdata_wdest),
    .io_wbdata_data(wbu_io_wbdata_data)
  );
  assign io_fetch_addr = ifu_io_fetch_addr; // @[TreeCoreL2.scala 81:12]
  assign io_ld_en = mau_io_ld_en & ~lsStall; // @[TreeCoreL2.scala 85:34]
  assign io_ld_addr = mau_io_ld_addr; // @[TreeCoreL2.scala 86:18]
  assign io_ld_size = mau_io_ld_size; // @[TreeCoreL2.scala 88:18]
  assign io_sd_en = mau_io_sd_en & _io_ld_enT; // @[TreeCoreL2.scala 90:30]
  assign io_sd_addr = mau_io_sd_addr; // @[TreeCoreL2.scala 91:14]
  assign io_sd_data = mau_io_sd_data; // @[TreeCoreL2.scala 92:14]
  assign io_sd_mask = mau_io_sd_mask; // @[TreeCoreL2.scala 93:14]
  assign ifu_clock = clock;
  assign ifu_reset = reset;
  assign ifu_io_globalEn = io_globalEn; // @[TreeCoreL2.scala 61:19]
  assign ifu_io_stall = exu_io_stall & tickCnt == 2'h0; // @[TreeCoreL2.scala 54:46]
  assign ifu_io_branchInfo_branch = exu_io_branchInfo_branch; // @[TreeCoreL2.scala 43:21]
  assign ifu_io_branchInfo_jump = exu_io_branchInfo_jump; // @[TreeCoreL2.scala 43:21]
  assign ifu_io_branchInfo_taken = exu_io_branchInfo_taken; // @[TreeCoreL2.scala 43:21]
  assign ifu_io_branchInfo_idx = exu_io_branchInfo_idx; // @[TreeCoreL2.scala 43:21]
  assign ifu_io_branchInfo_pc = exu_io_branchInfo_pc; // @[TreeCoreL2.scala 43:21]
  assign ifu_io_branchInfo_tgt = exu_io_branchInfo_tgt; // @[TreeCoreL2.scala 43:21]
  assign ifu_io_fetch_data = io_fetch_data; // @[TreeCoreL2.scala 81:12]
  assign ifu_io_nxtPC_trap = stallCycle1 & exu_io_nxtPC_trap; // @[TreeCoreL2.scala 68:23]
  assign ifu_io_nxtPC_mtvec = stallCycle1 ? exu_io_nxtPC_mtvec : 64'h0; // @[TreeCoreL2.scala 68:23]
  assign ifu_io_nxtPC_mret = stallCycle1 & exu_io_nxtPC_mret; // @[TreeCoreL2.scala 68:23]
  assign ifu_io_nxtPC_mepc = stallCycle1 ? exu_io_nxtPC_mepc : 64'h0; // @[TreeCoreL2.scala 68:23]
  assign ifu_io_nxtPC_branch = stallCycle1 & exu_io_nxtPC_branch; // @[TreeCoreL2.scala 68:23]
  assign ifu_io_nxtPC_tgt = stallCycle1 ? exu_io_nxtPC_tgt : 64'h0; // @[TreeCoreL2.scala 68:23]
  assign idu_clock = clock;
  assign idu_reset = reset;
  assign idu_io_globalEn = io_globalEn; // @[TreeCoreL2.scala 62:19]
  assign idu_io_stall = exu_io_stall & tickCnt == 2'h0; // @[TreeCoreL2.scala 54:46]
  assign idu_io_if2id_valid = ifu_io_if2id_valid; // @[TreeCoreL2.scala 34:17]
  assign idu_io_if2id_inst = ifu_io_if2id_inst; // @[TreeCoreL2.scala 34:17]
  assign idu_io_if2id_pc = ifu_io_if2id_pc; // @[TreeCoreL2.scala 34:17]
  assign idu_io_if2id_branIdx = ifu_io_if2id_branIdx; // @[TreeCoreL2.scala 34:17]
  assign idu_io_if2id_predTaken = ifu_io_if2id_predTaken; // @[TreeCoreL2.scala 34:17]
  assign idu_io_wbdata_wen = _exu_io_globalEn_T ? 1'h0 : wbu_io_wbdata_wen; // @[TreeCoreL2.scala 67:23]
  assign idu_io_wbdata_wdest = _exu_io_globalEn_T ? 5'h0 : wbu_io_wbdata_wdest; // @[TreeCoreL2.scala 67:23]
  assign idu_io_wbdata_data = _exu_io_globalEn_T ? 64'h0 : wbu_io_wbdata_data; // @[TreeCoreL2.scala 67:23]
  assign exu_clock = clock;
  assign exu_reset = reset;
  assign exu_io_globalEn = stallCycle1 | stallCycle2 ? 1'h0 : io_globalEn; // @[TreeCoreL2.scala 63:25]
  assign exu_io_mtip = mau_io_mtip; // @[TreeCoreL2.scala 50:20]
  assign exu_io_id2ex_valid = idu_io_id2ex_valid; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_inst = idu_io_id2ex_inst; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_pc = idu_io_id2ex_pc; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_branIdx = idu_io_id2ex_branIdx; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_predTaken = idu_io_id2ex_predTaken; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_ADD = idu_io_id2ex_isa_ADD; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_ADDI = idu_io_id2ex_isa_ADDI; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_ADDW = idu_io_id2ex_isa_ADDW; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_ADDIW = idu_io_id2ex_isa_ADDIW; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SUB = idu_io_id2ex_isa_SUB; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SUBW = idu_io_id2ex_isa_SUBW; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_LUI = idu_io_id2ex_isa_LUI; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_AUIPC = idu_io_id2ex_isa_AUIPC; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_XOR = idu_io_id2ex_isa_XOR; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_XORI = idu_io_id2ex_isa_XORI; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_OR = idu_io_id2ex_isa_OR; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_ORI = idu_io_id2ex_isa_ORI; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_AND = idu_io_id2ex_isa_AND; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_ANDI = idu_io_id2ex_isa_ANDI; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SLL = idu_io_id2ex_isa_SLL; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SLLI = idu_io_id2ex_isa_SLLI; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SLLW = idu_io_id2ex_isa_SLLW; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SLLIW = idu_io_id2ex_isa_SLLIW; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SRL = idu_io_id2ex_isa_SRL; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SRLI = idu_io_id2ex_isa_SRLI; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SRLW = idu_io_id2ex_isa_SRLW; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SRLIW = idu_io_id2ex_isa_SRLIW; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SRA = idu_io_id2ex_isa_SRA; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SRAI = idu_io_id2ex_isa_SRAI; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SRAW = idu_io_id2ex_isa_SRAW; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SRAIW = idu_io_id2ex_isa_SRAIW; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SLT = idu_io_id2ex_isa_SLT; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SLTI = idu_io_id2ex_isa_SLTI; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SLTU = idu_io_id2ex_isa_SLTU; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SLTIU = idu_io_id2ex_isa_SLTIU; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_BEQ = idu_io_id2ex_isa_BEQ; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_BNE = idu_io_id2ex_isa_BNE; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_BLT = idu_io_id2ex_isa_BLT; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_BGE = idu_io_id2ex_isa_BGE; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_BLTU = idu_io_id2ex_isa_BLTU; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_BGEU = idu_io_id2ex_isa_BGEU; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_JAL = idu_io_id2ex_isa_JAL; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_JALR = idu_io_id2ex_isa_JALR; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_LD = idu_io_id2ex_isa_LD; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_LW = idu_io_id2ex_isa_LW; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_LH = idu_io_id2ex_isa_LH; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_LB = idu_io_id2ex_isa_LB; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_LWU = idu_io_id2ex_isa_LWU; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_LHU = idu_io_id2ex_isa_LHU; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_LBU = idu_io_id2ex_isa_LBU; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SD = idu_io_id2ex_isa_SD; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SW = idu_io_id2ex_isa_SW; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SH = idu_io_id2ex_isa_SH; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_SB = idu_io_id2ex_isa_SB; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_isa_MRET = idu_io_id2ex_isa_MRET; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_src1 = idu_io_id2ex_src1; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_src2 = idu_io_id2ex_src2; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_imm_I = idu_io_id2ex_imm_I; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_imm_B = idu_io_id2ex_imm_B; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_imm_S = idu_io_id2ex_imm_S; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_imm_U = idu_io_id2ex_imm_U; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_imm_J = idu_io_id2ex_imm_J; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_wen = idu_io_id2ex_wen; // @[TreeCoreL2.scala 35:17]
  assign exu_io_id2ex_wdest = idu_io_id2ex_wdest; // @[TreeCoreL2.scala 35:17]
  assign exu_io_bypassMem_wen = mau_io_bypassMem_wen; // @[TreeCoreL2.scala 47:20]
  assign exu_io_bypassMem_wdest = mau_io_bypassMem_wdest; // @[TreeCoreL2.scala 47:20]
  assign exu_io_bypassMem_data = mau_io_bypassMem_data; // @[TreeCoreL2.scala 47:20]
  assign exu_io_bypassWb_wen = wbu_io_wbdata_wen; // @[TreeCoreL2.scala 48:20]
  assign exu_io_bypassWb_wdest = wbu_io_wbdata_wdest; // @[TreeCoreL2.scala 48:20]
  assign exu_io_bypassWb_data = wbu_io_wbdata_data; // @[TreeCoreL2.scala 48:20]
  assign mau_clock = clock;
  assign mau_reset = reset;
  assign mau_io_globalEn = _exu_io_globalEn_T ? 1'h0 : io_globalEn; // @[TreeCoreL2.scala 64:25]
  assign mau_io_ex2mem_valid = exu_io_ex2mem_valid; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_isa_LD = exu_io_ex2mem_isa_LD; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_isa_LW = exu_io_ex2mem_isa_LW; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_isa_LH = exu_io_ex2mem_isa_LH; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_isa_LB = exu_io_ex2mem_isa_LB; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_isa_LWU = exu_io_ex2mem_isa_LWU; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_isa_LHU = exu_io_ex2mem_isa_LHU; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_isa_LBU = exu_io_ex2mem_isa_LBU; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_isa_SD = exu_io_ex2mem_isa_SD; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_isa_SW = exu_io_ex2mem_isa_SW; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_isa_SH = exu_io_ex2mem_isa_SH; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_isa_SB = exu_io_ex2mem_isa_SB; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_src1 = exu_io_ex2mem_src1; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_src2 = exu_io_ex2mem_src2; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_imm_I = exu_io_ex2mem_imm_I; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_imm_S = exu_io_ex2mem_imm_S; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_wen = exu_io_ex2mem_wen; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_wdest = exu_io_ex2mem_wdest; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_aluRes = exu_io_ex2mem_aluRes; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_link = exu_io_ex2mem_link; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_auipc = exu_io_ex2mem_auipc; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ex2mem_csrData = exu_io_ex2mem_csrData; // @[TreeCoreL2.scala 36:17]
  assign mau_io_ld_data = lsStall ? ldDataInStall : io_ld_data; // @[TreeCoreL2.scala 87:24]
  assign wbu_clock = clock;
  assign wbu_reset = reset;
  assign wbu_io_globalEn = _exu_io_globalEn_T ? 1'h0 : io_globalEn; // @[TreeCoreL2.scala 65:25]
  assign wbu_io_mem2wb_valid = mau_io_mem2wb_valid; // @[TreeCoreL2.scala 37:17]
  assign wbu_io_mem2wb_wen = mau_io_mem2wb_wen; // @[TreeCoreL2.scala 37:17]
  assign wbu_io_mem2wb_wdest = mau_io_mem2wb_wdest; // @[TreeCoreL2.scala 37:17]
  assign wbu_io_mem2wb_aluRes = mau_io_mem2wb_aluRes; // @[TreeCoreL2.scala 37:17]
  assign wbu_io_mem2wb_link = mau_io_mem2wb_link; // @[TreeCoreL2.scala 37:17]
  assign wbu_io_mem2wb_auipc = mau_io_mem2wb_auipc; // @[TreeCoreL2.scala 37:17]
  assign wbu_io_mem2wb_csrData = mau_io_mem2wb_csrData; // @[TreeCoreL2.scala 37:17]
  assign wbu_io_mem2wb_loadData = mau_io_mem2wb_loadData; // @[TreeCoreL2.scala 37:17]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 60:40]
      tickCnt <= 2'h0; // @[Counter.scala 60:40]
    end else if (_T) begin // @[Counter.scala 118:17]
      if (wrap_wrap) begin // @[Counter.scala 86:20]
        tickCnt <= 2'h0; // @[Counter.scala 86:28]
      end else begin
        tickCnt <= _wrap_value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[TreeCoreL2.scala 70:40]
      ldDataInStall <= 64'h0; // @[TreeCoreL2.scala 70:40]
    end else if (io_globalEn) begin // @[TreeCoreL2.scala 72:21]
      if (stallCycle1) begin // @[TreeCoreL2.scala 73:23]
        ldDataInStall <= io_ld_data; // @[TreeCoreL2.scala 74:21]
      end else if (stallCycle3) begin // @[TreeCoreL2.scala 75:29]
        ldDataInStall <= 64'h0; // @[TreeCoreL2.scala 76:21]
      end
    end
    if (reset) begin // @[Reg.scala 27:20]
      lsStall_r <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      lsStall_r <= stallCycle1; // @[Reg.scala 28:23]
    end
    if (reset) begin // @[Reg.scala 27:20]
      lsStall_r_1 <= 1'h0; // @[Reg.scala 27:20]
    end else if (io_globalEn) begin // @[Reg.scala 28:19]
      lsStall_r_1 <= stallCycle2; // @[Reg.scala 28:23]
    end
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
  tickCnt = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  ldDataInStall = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  lsStall_r = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  lsStall_r_1 = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_Crossbar(
  input         clock,
  input         reset,
  input         io_runEn,
  output        io_dxchg_ren,
  output [63:0] io_dxchg_raddr,
  output [2:0]  io_dxchg_rsize,
  input  [63:0] io_dxchg_rdata,
  output        io_dxchg_wen,
  output [63:0] io_dxchg_waddr,
  output [63:0] io_dxchg_wdata,
  output [7:0]  io_dxchg_wmask,
  output        io_core_globalEn,
  input  [63:0] io_core_fetchaddr,
  output [31:0] io_core_fetchdata,
  input         io_core_lden,
  input  [63:0] io_core_ldaddr,
  output [63:0] io_core_lddata,
  input  [2:0]  io_core_ldze,
  input         io_core_sden,
  input  [63:0] io_core_sdaddr,
  input  [63:0] io_core_sddata,
  input  [7:0]  io_core_sdmask
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  globalEn; // @[Crossbar.scala 14:35]
  reg [31:0] inst; // @[Crossbar.scala 15:35]
  reg  stateReg; // @[Crossbar.scala 24:51]
  wire  _T = ~stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_0 = io_runEn | stateReg; // @[Crossbar.scala 28:22 Crossbar.scala 29:18 Crossbar.scala 24:51]
  wire  _GEN_1 = io_runEn | globalEn; // @[Crossbar.scala 28:22 Crossbar.scala 30:18 Crossbar.scala 14:35]
  wire [63:0] instAddr = io_core_fetchaddr - 64'h0; // @[Crossbar.scala 47:48]
  wire [63:0] loadAddr = io_core_ldaddr - 64'h0; // @[Crossbar.scala 48:45]
  wire  maEn = io_core_lden | io_core_sden; // @[Crossbar.scala 50:43]
  assign io_dxchg_ren = _T | stateReg & maEn; // @[Crossbar.scala 53:45]
  assign io_dxchg_raddr = _T ? instAddr : loadAddr; // @[Crossbar.scala 54:24]
  assign io_dxchg_rsize = stateReg & io_core_lden ? io_core_ldze : 3'h2; // @[Crossbar.scala 55:24]
  assign io_dxchg_wen = stateReg & io_core_sden; // @[Crossbar.scala 59:41]
  assign io_dxchg_waddr = io_core_sdaddr - 64'h0; // @[Crossbar.scala 49:45]
  assign io_dxchg_wdata = io_core_sddata; // @[Crossbar.scala 57:18]
  assign io_dxchg_wmask = io_core_sdmask; // @[Crossbar.scala 58:18]
  assign io_core_globalEn = io_runEn & globalEn; // @[Crossbar.scala 18:28]
  assign io_core_fetchdata = inst; // @[Crossbar.scala 19:22]
  assign io_core_lddata = io_dxchg_rdata; // @[Crossbar.scala 20:22]
  always @(posedge clock) begin
    if (reset) begin // @[Crossbar.scala 14:35]
      globalEn <= 1'h0; // @[Crossbar.scala 14:35]
    end else if (_T) begin // @[Conditional.scala 40:58]
      globalEn <= _GEN_1;
    end else if (stateReg) begin // @[Conditional.scala 39:67]
      if (io_runEn) begin // @[Crossbar.scala 35:22]
        globalEn <= 1'h0; // @[Crossbar.scala 37:18]
      end
    end
    if (reset) begin // @[Crossbar.scala 15:35]
      inst <= 32'h0; // @[Crossbar.scala 15:35]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_runEn) begin // @[Crossbar.scala 28:22]
        if (io_core_fetchaddr[2]) begin // @[Crossbar.scala 16:31]
          inst <= io_dxchg_rdata[63:32];
        end else begin
          inst <= io_dxchg_rdata[31:0];
        end
      end
    end else if (stateReg) begin // @[Conditional.scala 39:67]
      if (io_runEn) begin // @[Crossbar.scala 35:22]
        inst <= 32'h13; // @[Crossbar.scala 38:18]
      end
    end
    if (reset) begin // @[Crossbar.scala 24:51]
      stateReg <= 1'h0; // @[Crossbar.scala 24:51]
    end else if (_T) begin // @[Conditional.scala 40:58]
      stateReg <= _GEN_0;
    end else if (stateReg) begin // @[Conditional.scala 39:67]
      if (io_runEn) begin // @[Crossbar.scala 35:22]
        stateReg <= 1'h0; // @[Crossbar.scala 36:18]
      end
    end
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
  globalEn = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  inst = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  stateReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324_Processor(
  input         clock,
  input         reset,
  input         io_runEn,
  output        io_dxchg_ren,
  output [63:0] io_dxchg_raddr,
  output [2:0]  io_dxchg_rsize,
  input  [63:0] io_dxchg_rdata,
  output        io_dxchg_wen,
  output [63:0] io_dxchg_waddr,
  output [63:0] io_dxchg_wdata,
  output [7:0]  io_dxchg_wmask
);
  wire  cpu_clock; // @[Processor.scala 22:34]
  wire  cpu_reset; // @[Processor.scala 22:34]
  wire  cpu_io_globalEn; // @[Processor.scala 22:34]
  wire [63:0] cpu_io_fetch_addr; // @[Processor.scala 22:34]
  wire [31:0] cpu_io_fetch_data; // @[Processor.scala 22:34]
  wire  cpu_io_ld_en; // @[Processor.scala 22:34]
  wire [63:0] cpu_io_ld_addr; // @[Processor.scala 22:34]
  wire [63:0] cpu_io_ld_data; // @[Processor.scala 22:34]
  wire [2:0] cpu_io_ld_size; // @[Processor.scala 22:34]
  wire  cpu_io_sd_en; // @[Processor.scala 22:34]
  wire [63:0] cpu_io_sd_addr; // @[Processor.scala 22:34]
  wire [63:0] cpu_io_sd_data; // @[Processor.scala 22:34]
  wire [7:0] cpu_io_sd_mask; // @[Processor.scala 22:34]
  wire  crossbar_clock; // @[Processor.scala 23:34]
  wire  crossbar_reset; // @[Processor.scala 23:34]
  wire  crossbar_io_runEn; // @[Processor.scala 23:34]
  wire  crossbar_io_dxchg_ren; // @[Processor.scala 23:34]
  wire [63:0] crossbar_io_dxchg_raddr; // @[Processor.scala 23:34]
  wire [2:0] crossbar_io_dxchg_rsize; // @[Processor.scala 23:34]
  wire [63:0] crossbar_io_dxchg_rdata; // @[Processor.scala 23:34]
  wire  crossbar_io_dxchg_wen; // @[Processor.scala 23:34]
  wire [63:0] crossbar_io_dxchg_waddr; // @[Processor.scala 23:34]
  wire [63:0] crossbar_io_dxchg_wdata; // @[Processor.scala 23:34]
  wire [7:0] crossbar_io_dxchg_wmask; // @[Processor.scala 23:34]
  wire  crossbar_io_core_globalEn; // @[Processor.scala 23:34]
  wire [63:0] crossbar_io_core_fetchaddr; // @[Processor.scala 23:34]
  wire [31:0] crossbar_io_core_fetchdata; // @[Processor.scala 23:34]
  wire  crossbar_io_core_lden; // @[Processor.scala 23:34]
  wire [63:0] crossbar_io_core_ldaddr; // @[Processor.scala 23:34]
  wire [63:0] crossbar_io_core_lddata; // @[Processor.scala 23:34]
  wire [2:0] crossbar_io_core_ldze; // @[Processor.scala 23:34]
  wire  crossbar_io_core_sden; // @[Processor.scala 23:34]
  wire [63:0] crossbar_io_core_sdaddr; // @[Processor.scala 23:34]
  wire [63:0] crossbar_io_core_sddata; // @[Processor.scala 23:34]
  wire [7:0] crossbar_io_core_sdmask; // @[Processor.scala 23:34]
  ysyx_210324_TreeCoreL2 cpu ( // @[Processor.scala 22:34]
    .clock(cpu_clock),
    .reset(cpu_reset),
    .io_globalEn(cpu_io_globalEn),
    .io_fetch_addr(cpu_io_fetch_addr),
    .io_fetch_data(cpu_io_fetch_data),
    .io_ld_en(cpu_io_ld_en),
    .io_ld_addr(cpu_io_ld_addr),
    .io_ld_data(cpu_io_ld_data),
    .io_ld_size(cpu_io_ld_size),
    .io_sd_en(cpu_io_sd_en),
    .io_sd_addr(cpu_io_sd_addr),
    .io_sd_data(cpu_io_sd_data),
    .io_sd_mask(cpu_io_sd_mask)
  );
  ysyx_210324_Crossbar crossbar ( // @[Processor.scala 23:34]
    .clock(crossbar_clock),
    .reset(crossbar_reset),
    .io_runEn(crossbar_io_runEn),
    .io_dxchg_ren(crossbar_io_dxchg_ren),
    .io_dxchg_raddr(crossbar_io_dxchg_raddr),
    .io_dxchg_rsize(crossbar_io_dxchg_rsize),
    .io_dxchg_rdata(crossbar_io_dxchg_rdata),
    .io_dxchg_wen(crossbar_io_dxchg_wen),
    .io_dxchg_waddr(crossbar_io_dxchg_waddr),
    .io_dxchg_wdata(crossbar_io_dxchg_wdata),
    .io_dxchg_wmask(crossbar_io_dxchg_wmask),
    .io_core_globalEn(crossbar_io_core_globalEn),
    .io_core_fetchaddr(crossbar_io_core_fetchaddr),
    .io_core_fetchdata(crossbar_io_core_fetchdata),
    .io_core_lden(crossbar_io_core_lden),
    .io_core_ldaddr(crossbar_io_core_ldaddr),
    .io_core_lddata(crossbar_io_core_lddata),
    .io_core_ldze(crossbar_io_core_ldze),
    .io_core_sden(crossbar_io_core_sden),
    .io_core_sdaddr(crossbar_io_core_sdaddr),
    .io_core_sddata(crossbar_io_core_sddata),
    .io_core_sdmask(crossbar_io_core_sdmask)
  );
  assign io_dxchg_ren = crossbar_io_dxchg_ren; // @[Processor.scala 33:21]
  assign io_dxchg_raddr = crossbar_io_dxchg_raddr; // @[Processor.scala 33:21]
  assign io_dxchg_rsize = crossbar_io_dxchg_rsize; // @[Processor.scala 33:21]
  assign io_dxchg_wen = crossbar_io_dxchg_wen; // @[Processor.scala 33:21]
  assign io_dxchg_waddr = crossbar_io_dxchg_waddr; // @[Processor.scala 33:21]
  assign io_dxchg_wdata = crossbar_io_dxchg_wdata; // @[Processor.scala 33:21]
  assign io_dxchg_wmask = crossbar_io_dxchg_wmask; // @[Processor.scala 33:21]
  assign cpu_clock = clock;
  assign cpu_reset = reset;
  assign cpu_io_globalEn = crossbar_io_core_globalEn; // @[Processor.scala 29:21]
  assign cpu_io_fetch_data = crossbar_io_core_fetchdata; // @[Processor.scala 30:21]
  assign cpu_io_ld_data = crossbar_io_core_lddata; // @[Processor.scala 31:21]
  assign crossbar_clock = clock;
  assign crossbar_reset = reset;
  assign crossbar_io_runEn = io_runEn; // @[Processor.scala 26:21]
  assign crossbar_io_dxchg_rdata = io_dxchg_rdata; // @[Processor.scala 33:21]
  assign crossbar_io_core_fetchaddr = cpu_io_fetch_addr; // @[Processor.scala 30:21]
  assign crossbar_io_core_lden = cpu_io_ld_en; // @[Processor.scala 31:21]
  assign crossbar_io_core_ldaddr = cpu_io_ld_addr; // @[Processor.scala 31:21]
  assign crossbar_io_core_ldze = cpu_io_ld_size; // @[Processor.scala 31:21]
  assign crossbar_io_core_sden = cpu_io_sd_en; // @[Processor.scala 32:21]
  assign crossbar_io_core_sdaddr = cpu_io_sd_addr; // @[Processor.scala 32:21]
  assign crossbar_io_core_sddata = cpu_io_sd_data; // @[Processor.scala 32:21]
  assign crossbar_io_core_sdmask = cpu_io_sd_mask; // @[Processor.scala 32:21]
endmodule
module ysyx_210324_AXI4Bridge(
  input         clock,
  input         reset,
  output        io_runEn,
  input         io_dxchg_ren,
  input  [63:0] io_dxchg_raddr,
  input  [2:0]  io_dxchg_rsize,
  output [63:0] io_dxchg_rdata,
  input         io_dxchg_wen,
  input  [63:0] io_dxchg_waddr,
  input  [63:0] io_dxchg_wdata,
  input  [7:0]  io_dxchg_wmask,
  input         io_axi_awready,
  output        io_axi_awvalid,
  output [31:0] io_axi_awaddr,
  output [2:0]  io_axi_awsize,
  input         io_axi_wready,
  output        io_axi_wvalid,
  output [63:0] io_axi_wdata,
  output [7:0]  io_axi_wstrb,
  output        io_axi_bready,
  input         io_axi_bvalid,
  input         io_axi_arready,
  output        io_axi_arvalid,
  output [31:0] io_axi_araddr,
  output [2:0]  io_axi_arsize,
  output        io_axi_rready,
  input         io_axi_rvalid,
  input  [63:0] io_axi_rdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg  runEn; // @[AXI4Bridge.scala 16:32]
  wire  awHdShk = io_axi_awready & io_axi_awvalid; // @[Decoupled.scala 40:37]
  wire  wHdShk = io_axi_wready & io_axi_wvalid; // @[Decoupled.scala 40:37]
  wire  bHdShk = io_axi_bready & io_axi_bvalid; // @[Decoupled.scala 40:37]
  wire  rHdShk = io_axi_rready & io_axi_rvalid; // @[Decoupled.scala 40:37]
  reg  finished; // @[Arbiter.scala 7:25]
  reg  ren; // @[Arbiter.scala 8:25]
  reg [63:0] raddr; // @[Arbiter.scala 9:25]
  reg [63:0] rdata; // @[Arbiter.scala 10:25]
  reg [2:0] socARSize; // @[Arbiter.scala 11:25]
  reg  wen; // @[Arbiter.scala 12:25]
  reg [63:0] waddr; // @[Arbiter.scala 13:25]
  reg [63:0] wdata; // @[Arbiter.scala 14:25]
  reg [7:0] wMask; // @[Arbiter.scala 15:25]
  reg [2:0] stateReg; // @[AXI4Bridge.scala 30:35]
  wire  _T = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_1 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_0 = ren ? 3'h6 : 3'h1; // @[AXI4Bridge.scala 51:31 AXI4Bridge.scala 52:18 AXI4Bridge.scala 55:26]
  wire  _GEN_1 = ren ? finished : 1'h1; // @[AXI4Bridge.scala 51:31 Arbiter.scala 7:25 AXI4Bridge.scala 54:26]
  wire [2:0] _GEN_2 = wen ? 3'h3 : _GEN_0; // @[AXI4Bridge.scala 49:31 AXI4Bridge.scala 50:18]
  wire  _GEN_3 = wen ? finished : _GEN_1; // @[AXI4Bridge.scala 49:31 Arbiter.scala 7:25]
  wire  _GEN_4 = finished | runEn; // @[AXI4Bridge.scala 46:30 AXI4Bridge.scala 47:18 AXI4Bridge.scala 16:32]
  wire  _T_2 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h6 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_7 = io_axi_arready ? 3'h7 : stateReg; // @[AXI4Bridge.scala 63:29 AXI4Bridge.scala 64:18 AXI4Bridge.scala 30:35]
  wire  _T_4 = 3'h7 == stateReg; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_8 = rHdShk ? io_axi_rdata : rdata; // @[AXI4Bridge.scala 68:20 AXI4Bridge.scala 69:26 Arbiter.scala 10:25]
  wire  _GEN_9 = rHdShk | finished; // @[AXI4Bridge.scala 68:20 AXI4Bridge.scala 70:26 Arbiter.scala 7:25]
  wire [2:0] _GEN_10 = rHdShk ? 3'h1 : stateReg; // @[AXI4Bridge.scala 68:20 AXI4Bridge.scala 71:26 AXI4Bridge.scala 30:35]
  wire  _T_5 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_11 = awHdShk ? 3'h4 : stateReg; // @[AXI4Bridge.scala 75:21 AXI4Bridge.scala 76:18 AXI4Bridge.scala 30:35]
  wire  _T_6 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_12 = wHdShk ? 3'h5 : stateReg; // @[AXI4Bridge.scala 80:20 AXI4Bridge.scala 81:18 AXI4Bridge.scala 30:35]
  wire  _T_7 = 3'h5 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_13 = bHdShk | finished; // @[AXI4Bridge.scala 85:20 AXI4Bridge.scala 86:26 Arbiter.scala 7:25]
  wire [2:0] _GEN_14 = bHdShk ? 3'h1 : stateReg; // @[AXI4Bridge.scala 85:20 AXI4Bridge.scala 87:26 AXI4Bridge.scala 30:35]
  wire  _GEN_15 = _T_7 ? _GEN_13 : finished; // @[Conditional.scala 39:67 Arbiter.scala 7:25]
  wire [2:0] _GEN_16 = _T_7 ? _GEN_14 : stateReg; // @[Conditional.scala 39:67 AXI4Bridge.scala 30:35]
  wire [2:0] _GEN_17 = _T_6 ? _GEN_12 : _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_18 = _T_6 ? finished : _GEN_15; // @[Conditional.scala 39:67 Arbiter.scala 7:25]
  wire [2:0] _GEN_19 = _T_5 ? _GEN_11 : _GEN_17; // @[Conditional.scala 39:67]
  wire  _GEN_20 = _T_5 ? finished : _GEN_18; // @[Conditional.scala 39:67 Arbiter.scala 7:25]
  wire [63:0] _GEN_21 = _T_4 ? _GEN_8 : rdata; // @[Conditional.scala 39:67 Arbiter.scala 10:25]
  wire  _GEN_22 = _T_4 ? _GEN_9 : _GEN_20; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_23 = _T_4 ? _GEN_10 : _GEN_19; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_24 = _T_3 ? _GEN_7 : _GEN_23; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_25 = _T_3 ? rdata : _GEN_21; // @[Conditional.scala 39:67 Arbiter.scala 10:25]
  wire  _GEN_26 = _T_3 ? finished : _GEN_22; // @[Conditional.scala 39:67 Arbiter.scala 7:25]
  wire  _bitCnt_T_3 = wMask[7] + wMask[6]; // @[AXI4Bridge.scala 93:35]
  wire  _bitCnt_T_6 = _bitCnt_T_3 + wMask[5]; // @[AXI4Bridge.scala 93:46]
  wire  _bitCnt_T_9 = _bitCnt_T_6 + wMask[4]; // @[AXI4Bridge.scala 93:57]
  wire  _bitCnt_T_12 = _bitCnt_T_9 + wMask[3]; // @[AXI4Bridge.scala 93:68]
  wire  _bitCnt_T_15 = _bitCnt_T_12 + wMask[2]; // @[AXI4Bridge.scala 93:79]
  wire  _bitCnt_T_18 = _bitCnt_T_15 + wMask[1]; // @[AXI4Bridge.scala 93:90]
  wire  bitCnt = _bitCnt_T_18 + wMask[0]; // @[AXI4Bridge.scala 93:101]
  wire [2:0] _GEN_85 = {{2'd0}, bitCnt}; // @[Mux.scala 80:60]
  wire [1:0] _socAWSize_T_1 = 3'h4 == _GEN_85 ? 2'h2 : 2'h3; // @[Mux.scala 80:57]
  wire [1:0] _GEN_86 = {{1'd0}, bitCnt}; // @[Mux.scala 80:60]
  wire [1:0] _socAWSize_T_3 = 2'h2 == _GEN_86 ? 2'h1 : _socAWSize_T_1; // @[Mux.scala 80:57]
  wire [1:0] socAWSize = bitCnt ? 2'h0 : _socAWSize_T_3; // @[Mux.scala 80:57]
  wire  _T_9 = stateReg == 3'h7; // @[AXI4Bridge.scala 123:23]
  wire  _T_10 = stateReg == 3'h3; // @[AXI4Bridge.scala 136:23]
  wire  _T_11 = stateReg == 3'h4; // @[AXI4Bridge.scala 149:23]
  wire  _T_12 = stateReg == 3'h5; // @[AXI4Bridge.scala 162:23]
  wire [1:0] _GEN_49 = stateReg == 3'h4 ? socAWSize : 2'h0; // @[AXI4Bridge.scala 149:33 AXI4Bridge.scala 155:25]
  wire [63:0] _GEN_50 = stateReg == 3'h4 ? waddr : 64'h0; // @[AXI4Bridge.scala 149:33 AXI4Bridge.scala 156:25]
  wire [7:0] _GEN_52 = stateReg == 3'h4 ? wMask : 8'h0; // @[AXI4Bridge.scala 149:33 AXI4Bridge.scala 158:25]
  wire [63:0] _GEN_53 = stateReg == 3'h4 ? wdata : 64'h0; // @[AXI4Bridge.scala 149:33 AXI4Bridge.scala 159:25]
  wire  _GEN_54 = stateReg == 3'h4 ? 1'h0 : _T_12; // @[AXI4Bridge.scala 149:33 AXI4Bridge.scala 160:25]
  wire [1:0] _GEN_57 = stateReg == 3'h3 ? socAWSize : _GEN_49; // @[AXI4Bridge.scala 136:34 AXI4Bridge.scala 142:25]
  wire [63:0] _GEN_58 = stateReg == 3'h3 ? waddr : _GEN_50; // @[AXI4Bridge.scala 136:34 AXI4Bridge.scala 143:25]
  wire  _GEN_59 = stateReg == 3'h3 ? 1'h0 : _T_11; // @[AXI4Bridge.scala 136:34 AXI4Bridge.scala 144:25]
  wire [7:0] _GEN_60 = stateReg == 3'h3 ? 8'h0 : _GEN_52; // @[AXI4Bridge.scala 136:34 AXI4Bridge.scala 145:25]
  wire [63:0] _GEN_61 = stateReg == 3'h3 ? 64'h0 : _GEN_53; // @[AXI4Bridge.scala 136:34 AXI4Bridge.scala 146:25]
  wire  _GEN_62 = stateReg == 3'h3 ? 1'h0 : _GEN_54; // @[AXI4Bridge.scala 136:34 AXI4Bridge.scala 147:25]
  wire [2:0] _GEN_64 = stateReg == 3'h7 ? socARSize : 3'h0; // @[AXI4Bridge.scala 123:33 AXI4Bridge.scala 125:25]
  wire [63:0] _GEN_65 = stateReg == 3'h7 ? raddr : 64'h0; // @[AXI4Bridge.scala 123:33 AXI4Bridge.scala 126:25]
  wire  _GEN_67 = stateReg == 3'h7 ? 1'h0 : _T_10; // @[AXI4Bridge.scala 123:33 AXI4Bridge.scala 128:25]
  wire [1:0] _GEN_68 = stateReg == 3'h7 ? 2'h0 : _GEN_57; // @[AXI4Bridge.scala 123:33 AXI4Bridge.scala 129:25]
  wire [63:0] _GEN_69 = stateReg == 3'h7 ? 64'h0 : _GEN_58; // @[AXI4Bridge.scala 123:33 AXI4Bridge.scala 130:25]
  wire  _GEN_70 = stateReg == 3'h7 ? 1'h0 : _GEN_59; // @[AXI4Bridge.scala 123:33 AXI4Bridge.scala 131:25]
  wire [7:0] _GEN_71 = stateReg == 3'h7 ? 8'h0 : _GEN_60; // @[AXI4Bridge.scala 123:33 AXI4Bridge.scala 132:25]
  wire [63:0] _GEN_72 = stateReg == 3'h7 ? 64'h0 : _GEN_61; // @[AXI4Bridge.scala 123:33 AXI4Bridge.scala 133:25]
  wire  _GEN_73 = stateReg == 3'h7 ? 1'h0 : _GEN_62; // @[AXI4Bridge.scala 123:33 AXI4Bridge.scala 134:25]
  wire [63:0] _GEN_76 = stateReg == 3'h6 ? raddr : _GEN_65; // @[AXI4Bridge.scala 110:28 AXI4Bridge.scala 113:25]
  wire [1:0] _GEN_79 = stateReg == 3'h6 ? 2'h0 : _GEN_68; // @[AXI4Bridge.scala 110:28 AXI4Bridge.scala 116:25]
  wire [63:0] _GEN_80 = stateReg == 3'h6 ? 64'h0 : _GEN_69; // @[AXI4Bridge.scala 110:28 AXI4Bridge.scala 117:25]
  assign io_runEn = reset ? 1'h0 : runEn; // @[AXI4Bridge.scala 17:18]
  assign io_dxchg_rdata = rdata; // @[AXI4Bridge.scala 221:18]
  assign io_axi_awvalid = stateReg == 3'h6 ? 1'h0 : _GEN_67; // @[AXI4Bridge.scala 110:28 AXI4Bridge.scala 115:25]
  assign io_axi_awaddr = _GEN_80[31:0];
  assign io_axi_awsize = {{1'd0}, _GEN_79}; // @[AXI4Bridge.scala 110:28 AXI4Bridge.scala 116:25]
  assign io_axi_wvalid = stateReg == 3'h6 ? 1'h0 : _GEN_70; // @[AXI4Bridge.scala 110:28 AXI4Bridge.scala 118:25]
  assign io_axi_wdata = stateReg == 3'h6 ? 64'h0 : _GEN_72; // @[AXI4Bridge.scala 110:28 AXI4Bridge.scala 120:25]
  assign io_axi_wstrb = stateReg == 3'h6 ? 8'h0 : _GEN_71; // @[AXI4Bridge.scala 110:28 AXI4Bridge.scala 119:25]
  assign io_axi_bready = stateReg == 3'h6 ? 1'h0 : _GEN_73; // @[AXI4Bridge.scala 110:28 AXI4Bridge.scala 121:25]
  assign io_axi_arvalid = stateReg == 3'h6; // @[AXI4Bridge.scala 110:17]
  assign io_axi_araddr = _GEN_76[31:0];
  assign io_axi_arsize = stateReg == 3'h6 ? socARSize : _GEN_64; // @[AXI4Bridge.scala 110:28 AXI4Bridge.scala 112:25]
  assign io_axi_rready = stateReg == 3'h6 ? 1'h0 : _T_9; // @[AXI4Bridge.scala 110:28 AXI4Bridge.scala 114:25]
  always @(posedge clock) begin
    if (reset) begin // @[AXI4Bridge.scala 16:32]
      runEn <= 1'h0; // @[AXI4Bridge.scala 16:32]
    end else if (!(_T)) begin // @[Conditional.scala 40:58]
      if (_T_1) begin // @[Conditional.scala 39:67]
        runEn <= _GEN_4;
      end else if (_T_2) begin // @[Conditional.scala 39:67]
        runEn <= 1'h0; // @[AXI4Bridge.scala 59:16]
      end
    end
    if (reset) begin // @[Arbiter.scala 7:25]
      finished <= 1'h0; // @[Arbiter.scala 7:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      finished <= 1'h0; // @[AXI4Bridge.scala 34:24]
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      if (!(finished)) begin // @[AXI4Bridge.scala 46:30]
        finished <= _GEN_3;
      end
    end else if (!(_T_2)) begin // @[Conditional.scala 39:67]
      finished <= _GEN_26;
    end
    if (reset) begin // @[Arbiter.scala 8:25]
      ren <= 1'h0; // @[Arbiter.scala 8:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      ren <= io_dxchg_ren; // @[AXI4Bridge.scala 35:24]
    end
    if (reset) begin // @[Arbiter.scala 9:25]
      raddr <= 64'h0; // @[Arbiter.scala 9:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      raddr <= io_dxchg_raddr; // @[AXI4Bridge.scala 36:24]
    end
    if (reset) begin // @[Arbiter.scala 10:25]
      rdata <= 64'h0; // @[Arbiter.scala 10:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      rdata <= io_dxchg_rdata; // @[AXI4Bridge.scala 37:24]
    end else if (!(_T_1)) begin // @[Conditional.scala 39:67]
      if (!(_T_2)) begin // @[Conditional.scala 39:67]
        rdata <= _GEN_25;
      end
    end
    if (reset) begin // @[Arbiter.scala 11:25]
      socARSize <= 3'h0; // @[Arbiter.scala 11:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      socARSize <= io_dxchg_rsize; // @[AXI4Bridge.scala 38:24]
    end
    if (reset) begin // @[Arbiter.scala 12:25]
      wen <= 1'h0; // @[Arbiter.scala 12:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      wen <= io_dxchg_wen; // @[AXI4Bridge.scala 39:24]
    end
    if (reset) begin // @[Arbiter.scala 13:25]
      waddr <= 64'h0; // @[Arbiter.scala 13:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      waddr <= io_dxchg_waddr; // @[AXI4Bridge.scala 40:24]
    end
    if (reset) begin // @[Arbiter.scala 14:25]
      wdata <= 64'h0; // @[Arbiter.scala 14:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      wdata <= io_dxchg_wdata; // @[AXI4Bridge.scala 41:24]
    end
    if (reset) begin // @[Arbiter.scala 15:25]
      wMask <= 8'h0; // @[Arbiter.scala 15:25]
    end else if (_T) begin // @[Conditional.scala 40:58]
      wMask <= io_dxchg_wmask; // @[AXI4Bridge.scala 42:24]
    end
    if (reset) begin // @[AXI4Bridge.scala 30:35]
      stateReg <= 3'h0; // @[AXI4Bridge.scala 30:35]
    end else if (_T) begin // @[Conditional.scala 40:58]
      stateReg <= 3'h1; // @[AXI4Bridge.scala 43:24]
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      if (finished) begin // @[AXI4Bridge.scala 46:30]
        stateReg <= 3'h2; // @[AXI4Bridge.scala 48:18]
      end else begin
        stateReg <= _GEN_2;
      end
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      stateReg <= 3'h0; // @[AXI4Bridge.scala 60:16]
    end else begin
      stateReg <= _GEN_24;
    end
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
  runEn = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  finished = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ren = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  raddr = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  rdata = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  socARSize = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  wen = _RAND_6[0:0];
  _RAND_7 = {2{`RANDOM}};
  waddr = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  wdata = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  wMask = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  stateReg = _RAND_10[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ysyx_210324(
  input         clock,
  input         reset,
  input         io_interrupt,
  input         io_master_awready,
  output        io_master_awvalid,
  output [31:0] io_master_awaddr,
  output [3:0]  io_master_awid,
  output [7:0]  io_master_awlen,
  output [2:0]  io_master_awsize,
  output [1:0]  io_master_awburst,
  input         io_master_wready,
  output        io_master_wvalid,
  output [63:0] io_master_wdata,
  output [7:0]  io_master_wstrb,
  output        io_master_wlast,
  output        io_master_bready,
  input         io_master_bvalid,
  input  [1:0]  io_master_bresp,
  input  [3:0]  io_master_bid,
  input         io_master_arready,
  output        io_master_arvalid,
  output [31:0] io_master_araddr,
  output [3:0]  io_master_arid,
  output [7:0]  io_master_arlen,
  output [2:0]  io_master_arsize,
  output [1:0]  io_master_arburst,
  output        io_master_rready,
  input         io_master_rvalid,
  input  [1:0]  io_master_rresp,
  input  [63:0] io_master_rdata,
  input         io_master_rlast,
  input  [3:0]  io_master_rid,
  output        io_slave_awready,
  input         io_slave_awvalid,
  input  [31:0] io_slave_awaddr,
  input  [3:0]  io_slave_awid,
  input  [7:0]  io_slave_awlen,
  input  [2:0]  io_slave_awsize,
  input  [1:0]  io_slave_awburst,
  output        io_slave_wready,
  input         io_slave_wvalid,
  input  [63:0] io_slave_wdata,
  input  [7:0]  io_slave_wstrb,
  input         io_slave_wlast,
  input         io_slave_bready,
  output        io_slave_bvalid,
  output [1:0]  io_slave_bresp,
  output [3:0]  io_slave_bid,
  output        io_slave_arready,
  input         io_slave_arvalid,
  input  [31:0] io_slave_araddr,
  input  [3:0]  io_slave_arid,
  input  [7:0]  io_slave_arlen,
  input  [2:0]  io_slave_arsize,
  input  [1:0]  io_slave_arburst,
  input         io_slave_rready,
  output        io_slave_rvalid,
  output [1:0]  io_slave_rresp,
  output [63:0] io_slave_rdata,
  output        io_slave_rlast,
  output [3:0]  io_slave_rid
);
  wire  proc_clock; // @[SoCTop.scala 14:25]
  wire  proc_reset; // @[SoCTop.scala 14:25]
  wire  proc_io_runEn; // @[SoCTop.scala 14:25]
  wire  proc_io_dxchg_ren; // @[SoCTop.scala 14:25]
  wire [63:0] proc_io_dxchg_raddr; // @[SoCTop.scala 14:25]
  wire [2:0] proc_io_dxchg_rsize; // @[SoCTop.scala 14:25]
  wire [63:0] proc_io_dxchg_rdata; // @[SoCTop.scala 14:25]
  wire  proc_io_dxchg_wen; // @[SoCTop.scala 14:25]
  wire [63:0] proc_io_dxchg_waddr; // @[SoCTop.scala 14:25]
  wire [63:0] proc_io_dxchg_wdata; // @[SoCTop.scala 14:25]
  wire [7:0] proc_io_dxchg_wmask; // @[SoCTop.scala 14:25]
  wire  axiBridge_clock; // @[SoCTop.scala 15:25]
  wire  axiBridge_reset; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_runEn; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_dxchg_ren; // @[SoCTop.scala 15:25]
  wire [63:0] axiBridge_io_dxchg_raddr; // @[SoCTop.scala 15:25]
  wire [2:0] axiBridge_io_dxchg_rsize; // @[SoCTop.scala 15:25]
  wire [63:0] axiBridge_io_dxchg_rdata; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_dxchg_wen; // @[SoCTop.scala 15:25]
  wire [63:0] axiBridge_io_dxchg_waddr; // @[SoCTop.scala 15:25]
  wire [63:0] axiBridge_io_dxchg_wdata; // @[SoCTop.scala 15:25]
  wire [7:0] axiBridge_io_dxchg_wmask; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_axi_awready; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_axi_awvalid; // @[SoCTop.scala 15:25]
  wire [31:0] axiBridge_io_axi_awaddr; // @[SoCTop.scala 15:25]
  wire [2:0] axiBridge_io_axi_awsize; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_axi_wready; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_axi_wvalid; // @[SoCTop.scala 15:25]
  wire [63:0] axiBridge_io_axi_wdata; // @[SoCTop.scala 15:25]
  wire [7:0] axiBridge_io_axi_wstrb; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_axi_bready; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_axi_bvalid; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_axi_arready; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_axi_arvalid; // @[SoCTop.scala 15:25]
  wire [31:0] axiBridge_io_axi_araddr; // @[SoCTop.scala 15:25]
  wire [2:0] axiBridge_io_axi_arsize; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_axi_rready; // @[SoCTop.scala 15:25]
  wire  axiBridge_io_axi_rvalid; // @[SoCTop.scala 15:25]
  wire [63:0] axiBridge_io_axi_rdata; // @[SoCTop.scala 15:25]
  ysyx_210324_Processor proc ( // @[SoCTop.scala 14:25]
    .clock(proc_clock),
    .reset(proc_reset),
    .io_runEn(proc_io_runEn),
    .io_dxchg_ren(proc_io_dxchg_ren),
    .io_dxchg_raddr(proc_io_dxchg_raddr),
    .io_dxchg_rsize(proc_io_dxchg_rsize),
    .io_dxchg_rdata(proc_io_dxchg_rdata),
    .io_dxchg_wen(proc_io_dxchg_wen),
    .io_dxchg_waddr(proc_io_dxchg_waddr),
    .io_dxchg_wdata(proc_io_dxchg_wdata),
    .io_dxchg_wmask(proc_io_dxchg_wmask)
  );
  ysyx_210324_AXI4Bridge axiBridge ( // @[SoCTop.scala 15:25]
    .clock(axiBridge_clock),
    .reset(axiBridge_reset),
    .io_runEn(axiBridge_io_runEn),
    .io_dxchg_ren(axiBridge_io_dxchg_ren),
    .io_dxchg_raddr(axiBridge_io_dxchg_raddr),
    .io_dxchg_rsize(axiBridge_io_dxchg_rsize),
    .io_dxchg_rdata(axiBridge_io_dxchg_rdata),
    .io_dxchg_wen(axiBridge_io_dxchg_wen),
    .io_dxchg_waddr(axiBridge_io_dxchg_waddr),
    .io_dxchg_wdata(axiBridge_io_dxchg_wdata),
    .io_dxchg_wmask(axiBridge_io_dxchg_wmask),
    .io_axi_awready(axiBridge_io_axi_awready),
    .io_axi_awvalid(axiBridge_io_axi_awvalid),
    .io_axi_awaddr(axiBridge_io_axi_awaddr),
    .io_axi_awsize(axiBridge_io_axi_awsize),
    .io_axi_wready(axiBridge_io_axi_wready),
    .io_axi_wvalid(axiBridge_io_axi_wvalid),
    .io_axi_wdata(axiBridge_io_axi_wdata),
    .io_axi_wstrb(axiBridge_io_axi_wstrb),
    .io_axi_bready(axiBridge_io_axi_bready),
    .io_axi_bvalid(axiBridge_io_axi_bvalid),
    .io_axi_arready(axiBridge_io_axi_arready),
    .io_axi_arvalid(axiBridge_io_axi_arvalid),
    .io_axi_araddr(axiBridge_io_axi_araddr),
    .io_axi_arsize(axiBridge_io_axi_arsize),
    .io_axi_rready(axiBridge_io_axi_rready),
    .io_axi_rvalid(axiBridge_io_axi_rvalid),
    .io_axi_rdata(axiBridge_io_axi_rdata)
  );
  assign io_master_awvalid = axiBridge_io_axi_awvalid; // @[SoCTop.scala 21:13]
  assign io_master_awaddr = axiBridge_io_axi_awaddr; // @[SoCTop.scala 21:13]
  assign io_master_awid = 4'h0; // @[SoCTop.scala 21:13]
  assign io_master_awlen = 8'h0; // @[SoCTop.scala 21:13]
  assign io_master_awsize = axiBridge_io_axi_awsize; // @[SoCTop.scala 21:13]
  assign io_master_awburst = 2'h1; // @[SoCTop.scala 21:13]
  assign io_master_wvalid = axiBridge_io_axi_wvalid; // @[SoCTop.scala 21:13]
  assign io_master_wdata = axiBridge_io_axi_wdata; // @[SoCTop.scala 21:13]
  assign io_master_wstrb = axiBridge_io_axi_wstrb; // @[SoCTop.scala 21:13]
  assign io_master_wlast = 1'h1; // @[SoCTop.scala 21:13]
  assign io_master_bready = axiBridge_io_axi_bready; // @[SoCTop.scala 21:13]
  assign io_master_arvalid = axiBridge_io_axi_arvalid; // @[SoCTop.scala 21:13]
  assign io_master_araddr = axiBridge_io_axi_araddr; // @[SoCTop.scala 21:13]
  assign io_master_arid = 4'h0; // @[SoCTop.scala 21:13]
  assign io_master_arlen = 8'h0; // @[SoCTop.scala 21:13]
  assign io_master_arsize = axiBridge_io_axi_arsize; // @[SoCTop.scala 21:13]
  assign io_master_arburst = 2'h1; // @[SoCTop.scala 21:13]
  assign io_master_rready = axiBridge_io_axi_rready; // @[SoCTop.scala 21:13]
  assign io_slave_awready = 1'h0; // @[SoCTop.scala 23:24]
  assign io_slave_wready = 1'h0; // @[SoCTop.scala 24:24]
  assign io_slave_bvalid = 1'h0; // @[SoCTop.scala 25:24]
  assign io_slave_bresp = 2'h0; // @[SoCTop.scala 26:24]
  assign io_slave_bid = 4'h0; // @[SoCTop.scala 27:24]
  assign io_slave_arready = 1'h0; // @[SoCTop.scala 28:24]
  assign io_slave_rvalid = 1'h0; // @[SoCTop.scala 29:24]
  assign io_slave_rresp = 2'h0; // @[SoCTop.scala 30:24]
  assign io_slave_rdata = 64'h0; // @[SoCTop.scala 31:24]
  assign io_slave_rlast = 1'h0; // @[SoCTop.scala 32:24]
  assign io_slave_rid = 4'h0; // @[SoCTop.scala 33:24]
  assign proc_clock = clock;
  assign proc_reset = reset;
  assign proc_io_runEn = axiBridge_io_runEn; // @[SoCTop.scala 16:22]
  assign proc_io_dxchg_rdata = axiBridge_io_dxchg_rdata; // @[SoCTop.scala 17:22]
  assign axiBridge_clock = clock;
  assign axiBridge_reset = reset;
  assign axiBridge_io_dxchg_ren = proc_io_dxchg_ren; // @[SoCTop.scala 17:22]
  assign axiBridge_io_dxchg_raddr = proc_io_dxchg_raddr; // @[SoCTop.scala 17:22]
  assign axiBridge_io_dxchg_rsize = proc_io_dxchg_rsize; // @[SoCTop.scala 17:22]
  assign axiBridge_io_dxchg_wen = proc_io_dxchg_wen; // @[SoCTop.scala 17:22]
  assign axiBridge_io_dxchg_waddr = proc_io_dxchg_waddr; // @[SoCTop.scala 17:22]
  assign axiBridge_io_dxchg_wdata = proc_io_dxchg_wdata; // @[SoCTop.scala 17:22]
  assign axiBridge_io_dxchg_wmask = proc_io_dxchg_wmask; // @[SoCTop.scala 17:22]
  assign axiBridge_io_axi_awready = io_master_awready; // @[SoCTop.scala 21:13]
  assign axiBridge_io_axi_wready = io_master_wready; // @[SoCTop.scala 21:13]
  assign axiBridge_io_axi_bvalid = io_master_bvalid; // @[SoCTop.scala 21:13]
  assign axiBridge_io_axi_arready = io_master_arready; // @[SoCTop.scala 21:13]
  assign axiBridge_io_axi_rvalid = io_master_rvalid; // @[SoCTop.scala 21:13]
  assign axiBridge_io_axi_rdata = io_master_rdata; // @[SoCTop.scala 21:13]
endmodule
