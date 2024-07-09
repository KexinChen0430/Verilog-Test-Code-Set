module XbarCircuit(
  input          clock,
  input          reset,
  output         io_in_1_a_ready,
  input          io_in_1_a_valid,
  input  [2:0]   io_in_1_a_bits_opcode,
  input  [2:0]   io_in_1_a_bits_param,
  input  [2:0]   io_in_1_a_bits_size,
  input  [2:0]   io_in_1_a_bits_source,
  input  [35:0]  io_in_1_a_bits_address,
  input  [31:0]  io_in_1_a_bits_mask,
  input  [255:0] io_in_1_a_bits_data,
  input          io_in_1_d_ready,
  output         io_in_1_d_valid,
  output [2:0]   io_in_1_d_bits_opcode,
  output [2:0]   io_in_1_d_bits_size,
  output [2:0]   io_in_1_d_bits_source,
  output [255:0] io_in_1_d_bits_data,
  output         io_in_0_a_ready,
  input          io_in_0_a_valid,
  input  [2:0]   io_in_0_a_bits_opcode,
  input  [2:0]   io_in_0_a_bits_param,
  input  [2:0]   io_in_0_a_bits_size,
  input  [4:0]   io_in_0_a_bits_source,
  input  [35:0]  io_in_0_a_bits_address,
  input          io_in_0_a_bits_user_preferCache,
  input  [31:0]  io_in_0_a_bits_mask,
  input  [255:0] io_in_0_a_bits_data,
  input          io_in_0_bready,
  output         io_in_0_bvalid,
  output [2:0]   io_in_0_bopcode,
  output [1:0]   io_in_0_bparam,
  output [2:0]   io_in_0_bsize,
  output [35:0]  io_in_0_baddress,
  output [255:0] io_in_0_bdata,
  output         io_in_0_c_ready,
  input          io_in_0_c_valid,
  input  [2:0]   io_in_0_c_bits_opcode,
  input  [2:0]   io_in_0_c_bits_param,
  input  [2:0]   io_in_0_c_bits_size,
  input  [4:0]   io_in_0_c_bits_source,
  input  [35:0]  io_in_0_c_bits_address,
  input          io_in_0_c_bits_echo_blockisdirty,
  input  [255:0] io_in_0_c_bits_data,
  input          io_in_0_d_ready,
  output         io_in_0_d_valid,
  output [2:0]   io_in_0_d_bits_opcode,
  output [1:0]   io_in_0_d_bits_param,
  output [2:0]   io_in_0_d_bits_size,
  output [4:0]   io_in_0_d_bits_source,
  output [5:0]   io_in_0_d_bits_sink,
  output         io_in_0_d_bits_echo_blockisdirty,
  output [255:0] io_in_0_d_bits_data,
  output         io_in_0_e_ready,
  input          io_in_0_e_valid,
  input  [5:0]   io_in_0_e_bits_sink,
  input          io_out_1_a_ready,
  output         io_out_1_a_valid,
  output [2:0]   io_out_1_a_bits_opcode,
  output [2:0]   io_out_1_a_bits_param,
  output [2:0]   io_out_1_a_bits_size,
  output [5:0]   io_out_1_a_bits_source,
  output [35:0]  io_out_1_a_bits_address,
  output         io_out_1_a_bits_user_preferCache,
  output [31:0]  io_out_1_a_bits_mask,
  output [255:0] io_out_1_a_bits_data,
  output         io_out_1_bready,
  input          io_out_1_bvalid,
  input  [1:0]   io_out_1_bparam,
  input  [35:0]  io_out_1_baddress,
  input  [255:0] io_out_1_bdata,
  input          io_out_1_c_ready,
  output         io_out_1_c_valid,
  output [2:0]   io_out_1_c_bits_opcode,
  output [2:0]   io_out_1_c_bits_param,
  output [2:0]   io_out_1_c_bits_size,
  output [5:0]   io_out_1_c_bits_source,
  output [35:0]  io_out_1_c_bits_address,
  output         io_out_1_c_bits_echo_blockisdirty,
  output [255:0] io_out_1_c_bits_data,
  output         io_out_1_d_ready,
  input          io_out_1_d_valid,
  input  [2:0]   io_out_1_d_bits_opcode,
  input  [1:0]   io_out_1_d_bits_param,
  input  [2:0]   io_out_1_d_bits_size,
  input  [5:0]   io_out_1_d_bits_source,
  input  [4:0]   io_out_1_d_bits_sink,
  input          io_out_1_d_bits_echo_blockisdirty,
  input  [255:0] io_out_1_d_bits_data,
  output         io_out_1_e_valid,
  output [4:0]   io_out_1_e_bits_sink,
  input          io_out_0_a_ready,
  output         io_out_0_a_valid,
  output [2:0]   io_out_0_a_bits_opcode,
  output [2:0]   io_out_0_a_bits_param,
  output [2:0]   io_out_0_a_bits_size,
  output [5:0]   io_out_0_a_bits_source,
  output [35:0]  io_out_0_a_bits_address,
  output         io_out_0_a_bits_user_preferCache,
  output [31:0]  io_out_0_a_bits_mask,
  output [255:0] io_out_0_a_bits_data,
  output         io_out_0_bready,
  input          io_out_0_bvalid,
  input  [1:0]   io_out_0_bparam,
  input  [35:0]  io_out_0_baddress,
  input  [255:0] io_out_0_bdata,
  input          io_out_0_c_ready,
  output         io_out_0_c_valid,
  output [2:0]   io_out_0_c_bits_opcode,
  output [2:0]   io_out_0_c_bits_param,
  output [2:0]   io_out_0_c_bits_size,
  output [5:0]   io_out_0_c_bits_source,
  output [35:0]  io_out_0_c_bits_address,
  output         io_out_0_c_bits_echo_blockisdirty,
  output [255:0] io_out_0_c_bits_data,
  output         io_out_0_d_ready,
  input          io_out_0_d_valid,
  input  [2:0]   io_out_0_d_bits_opcode,
  input  [1:0]   io_out_0_d_bits_param,
  input  [2:0]   io_out_0_d_bits_size,
  input  [5:0]   io_out_0_d_bits_source,
  input  [4:0]   io_out_0_d_bits_sink,
  input          io_out_0_d_bits_echo_blockisdirty,
  input  [255:0] io_out_0_d_bits_data,
  output         io_out_0_e_valid,
  output [4:0]   io_out_0_e_bits_sink
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
`endif // RANDOMIZE_REG_INIT
  reg  REG_6; // @[Arbiter.scala 87:30]
  wire  _T_526 = ~REG_6; // @[Arbiter.scala 88:28]
  wire [1:0] _T_532 = {io_out_1_bvalid,io_out_0_bvalid}; // @[Cat.scala 30:58]
  reg [1:0] REG_7; // @[Arbiter.scala 23:23]
  wire [1:0] _T_538 = ~REG_7; // @[Arbiter.scala 24:30]
  wire [1:0] _T_539 = _T_532 & _T_538; // @[Arbiter.scala 24:28]
  wire [3:0] _T_540 = {_T_539,io_out_1_bvalid,io_out_0_bvalid}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_5 = {{1'd0}, _T_540[3:1]}; // @[package.scala 253:43]
  wire [3:0] _T_542 = _T_540 | _GEN_5; // @[package.scala 253:43]
  wire [3:0] _T_545 = {REG_7, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_6 = {{1'd0}, _T_542[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] _T_546 = _GEN_6 | _T_545; // @[Arbiter.scala 25:58]
  wire [1:0] _T_549 = _T_546[3:2] & _T_546[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] _T_550 = ~_T_549; // @[Arbiter.scala 26:18]
  wire  _T_561 = _T_550[0] & io_out_0_bvalid; // @[Arbiter.scala 97:79]
  reg  REG_8_0; // @[Arbiter.scala 116:26]
  wire  _T_600_0 = _T_526 ? _T_561 : REG_8_0; // @[Arbiter.scala 117:30]
  wire  _T_562 = _T_550[1] & io_out_1_bvalid; // @[Arbiter.scala 97:79]
  reg  REG_8_1; // @[Arbiter.scala 116:26]
  wire  _T_600_1 = _T_526 ? _T_562 : REG_8_1; // @[Arbiter.scala 117:30]
  reg  REG_9; // @[Arbiter.scala 87:30]
  wire  _T_639 = ~REG_9; // @[Arbiter.scala 88:28]
  wire  _T_109 = ~io_out_1_d_bits_source[5]; // @[Parameters.scala 54:32]
  wire  _T_264 = io_out_1_d_valid & _T_109; // @[Xbar.scala 179:40]
  wire  _T_93 = ~io_out_0_d_bits_source[5]; // @[Parameters.scala 54:32]
  wire  _T_257 = io_out_0_d_valid & _T_93; // @[Xbar.scala 179:40]
  wire [1:0] _T_645 = {_T_264,_T_257}; // @[Cat.scala 30:58]
  reg [1:0] REG_10; // @[Arbiter.scala 23:23]
  wire [1:0] _T_651 = ~REG_10; // @[Arbiter.scala 24:30]
  wire [1:0] _T_652 = _T_645 & _T_651; // @[Arbiter.scala 24:28]
  wire [3:0] _T_653 = {_T_652,_T_264,_T_257}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_7 = {{1'd0}, _T_653[3:1]}; // @[package.scala 253:43]
  wire [3:0] _T_655 = _T_653 | _GEN_7; // @[package.scala 253:43]
  wire [3:0] _T_658 = {REG_10, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_8 = {{1'd0}, _T_655[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] _T_659 = _GEN_8 | _T_658; // @[Arbiter.scala 25:58]
  wire [1:0] _T_662 = _T_659[3:2] & _T_659[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] _T_663 = ~_T_662; // @[Arbiter.scala 26:18]
  wire  _T_674 = _T_663[0] & _T_257; // @[Arbiter.scala 97:79]
  reg  REG_11_0; // @[Arbiter.scala 116:26]
  wire  _T_713_0 = _T_639 ? _T_674 : REG_11_0; // @[Arbiter.scala 117:30]
  wire [5:0] _T_741 = _T_713_0 ? io_out_0_d_bits_source : 6'h0; // @[Mux.scala 27:72]
  wire  _T_675 = _T_663[1] & _T_264; // @[Arbiter.scala 97:79]
  reg  REG_11_1; // @[Arbiter.scala 116:26]
  wire  _T_713_1 = _T_639 ? _T_675 : REG_11_1; // @[Arbiter.scala 117:30]
  wire [5:0] _T_742 = _T_713_1 ? io_out_1_d_bits_source : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_743 = _T_741 | _T_742; // @[Mux.scala 27:72]
  wire [5:0] _GEN_9 = {{3'd0}, io_in_1_a_bits_source}; // @[Xbar.scala 237:55]
  wire [5:0] _T_4 = _GEN_9 | 6'h20; // @[Xbar.scala 237:55]
  reg  REG_12; // @[Arbiter.scala 87:30]
  wire  _T_757 = ~REG_12; // @[Arbiter.scala 88:28]
  wire  _T_117 = io_out_1_d_bits_source[5:3] == 3'h4; // @[Parameters.scala 54:32]
  wire  _T_266 = io_out_1_d_valid & _T_117; // @[Xbar.scala 179:40]
  wire  _T_101 = io_out_0_d_bits_source[5:3] == 3'h4; // @[Parameters.scala 54:32]
  wire  _T_259 = io_out_0_d_valid & _T_101; // @[Xbar.scala 179:40]
  wire [1:0] _T_763 = {_T_266,_T_259}; // @[Cat.scala 30:58]
  reg [1:0] REG_13; // @[Arbiter.scala 23:23]
  wire [1:0] _T_769 = ~REG_13; // @[Arbiter.scala 24:30]
  wire [1:0] _T_770 = _T_763 & _T_769; // @[Arbiter.scala 24:28]
  wire [3:0] _T_771 = {_T_770,_T_266,_T_259}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_10 = {{1'd0}, _T_771[3:1]}; // @[package.scala 253:43]
  wire [3:0] _T_773 = _T_771 | _GEN_10; // @[package.scala 253:43]
  wire [3:0] _T_776 = {REG_13, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_11 = {{1'd0}, _T_773[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] _T_777 = _GEN_11 | _T_776; // @[Arbiter.scala 25:58]
  wire [1:0] _T_780 = _T_777[3:2] & _T_777[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] _T_781 = ~_T_780; // @[Arbiter.scala 26:18]
  wire  _T_792 = _T_781[0] & _T_259; // @[Arbiter.scala 97:79]
  reg  REG_14_0; // @[Arbiter.scala 116:26]
  wire  _T_831_0 = _T_757 ? _T_792 : REG_14_0; // @[Arbiter.scala 117:30]
  wire [5:0] _T_859 = _T_831_0 ? io_out_0_d_bits_source : 6'h0; // @[Mux.scala 27:72]
  wire  _T_793 = _T_781[1] & _T_266; // @[Arbiter.scala 97:79]
  reg  REG_14_1; // @[Arbiter.scala 116:26]
  wire  _T_831_1 = _T_757 ? _T_793 : REG_14_1; // @[Arbiter.scala 117:30]
  wire [5:0] _T_860 = _T_831_1 ? io_out_1_d_bits_source : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_861 = _T_859 | _T_860; // @[Mux.scala 27:72]
  wire [5:0] _GEN_12 = {{1'd0}, io_out_0_d_bits_sink}; // @[Xbar.scala 323:53]
  wire [5:0] _T_6 = _GEN_12 | 6'h20; // @[Xbar.scala 323:53]
  wire [36:0] _T_11 = {1'b0,$signed(io_in_0_a_bits_address)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_13 = $signed(_T_11) & 37'sh80; // @[Parameters.scala 137:52]
  wire  _T_14 = $signed(_T_13) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_16 = io_in_0_a_bits_address ^ 36'h80; // @[Parameters.scala 137:31]
  wire [36:0] _T_17 = {1'b0,$signed(_T_16)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_19 = $signed(_T_17) & 37'sh80; // @[Parameters.scala 137:52]
  wire  _T_20 = $signed(_T_19) == 37'sh0; // @[Parameters.scala 137:67]
  wire [36:0] _T_23 = {1'b0,$signed(io_in_1_a_bits_address)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_25 = $signed(_T_23) & 37'sh80; // @[Parameters.scala 137:52]
  wire  _T_26 = $signed(_T_25) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_28 = io_in_1_a_bits_address ^ 36'h80; // @[Parameters.scala 137:31]
  wire [36:0] _T_29 = {1'b0,$signed(_T_28)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_31 = $signed(_T_29) & 37'sh80; // @[Parameters.scala 137:52]
  wire  _T_32 = $signed(_T_31) == 37'sh0; // @[Parameters.scala 137:67]
  wire [36:0] _T_35 = {1'b0,$signed(io_in_0_c_bits_address)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_37 = $signed(_T_35) & 37'sh80; // @[Parameters.scala 137:52]
  wire  _T_38 = $signed(_T_37) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_40 = io_in_0_c_bits_address ^ 36'h80; // @[Parameters.scala 137:31]
  wire [36:0] _T_41 = {1'b0,$signed(_T_40)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_43 = $signed(_T_41) & 37'sh80; // @[Parameters.scala 137:52]
  wire  _T_44 = $signed(_T_43) == 37'sh0; // @[Parameters.scala 137:67]
  wire  _T_133 = ~io_in_0_e_bits_sink[5]; // @[Parameters.scala 54:32]
  wire [12:0] _T_155 = 13'h3f << io_in_0_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_157 = ~_T_155[5:0]; // @[package.scala 234:46]
  wire  _T_160 = ~io_in_0_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire  _T_161 = _T_160 & _T_157[5]; // @[Edges.scala 220:14]
  wire [12:0] _T_163 = 13'h3f << io_in_1_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_165 = ~_T_163[5:0]; // @[package.scala 234:46]
  wire  _T_168 = ~io_in_1_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire  _T_169 = _T_168 & _T_165[5]; // @[Edges.scala 220:14]
  wire [12:0] _T_201 = 13'h3f << io_out_0_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_203 = ~_T_201[5:0]; // @[package.scala 234:46]
  wire  _T_206 = io_out_0_d_bits_opcode[0] & _T_203[5]; // @[Edges.scala 220:14]
  wire [12:0] _T_208 = 13'h3f << io_out_1_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_210 = ~_T_208[5:0]; // @[package.scala 234:46]
  wire  _T_213 = io_out_1_d_bits_opcode[0] & _T_210[5]; // @[Edges.scala 220:14]
  wire  _T_215 = io_in_0_a_valid & _T_14; // @[Xbar.scala 428:50]
  wire  _T_217 = io_in_0_a_valid & _T_20; // @[Xbar.scala 428:50]
  reg  REG; // @[Arbiter.scala 87:30]
  wire  _T_284 = ~REG; // @[Arbiter.scala 88:28]
  wire  _T_222 = io_in_1_a_valid & _T_26; // @[Xbar.scala 428:50]
  wire [1:0] _T_290 = {_T_222,_T_215}; // @[Cat.scala 30:58]
  reg [1:0] REG_1; // @[Arbiter.scala 23:23]
  wire [1:0] _T_296 = ~REG_1; // @[Arbiter.scala 24:30]
  wire [1:0] _T_297 = _T_290 & _T_296; // @[Arbiter.scala 24:28]
  wire [3:0] _T_298 = {_T_297,_T_222,_T_215}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_13 = {{1'd0}, _T_298[3:1]}; // @[package.scala 253:43]
  wire [3:0] _T_300 = _T_298 | _GEN_13; // @[package.scala 253:43]
  wire [3:0] _T_303 = {REG_1, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_14 = {{1'd0}, _T_300[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] _T_304 = _GEN_14 | _T_303; // @[Arbiter.scala 25:58]
  wire [1:0] _T_307 = _T_304[3:2] & _T_304[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] _T_308 = ~_T_307; // @[Arbiter.scala 26:18]
  reg  REG_2_0; // @[Arbiter.scala 116:26]
  wire  _T_360_0 = _T_284 ? _T_308[0] : REG_2_0; // @[Arbiter.scala 121:24]
  wire  _T_361 = io_out_0_a_ready & _T_360_0; // @[Arbiter.scala 123:31]
  reg  REG_3; // @[Arbiter.scala 87:30]
  wire  _T_405 = ~REG_3; // @[Arbiter.scala 88:28]
  wire  _T_224 = io_in_1_a_valid & _T_32; // @[Xbar.scala 428:50]
  wire [1:0] _T_411 = {_T_224,_T_217}; // @[Cat.scala 30:58]
  reg [1:0] REG_4; // @[Arbiter.scala 23:23]
  wire [1:0] _T_417 = ~REG_4; // @[Arbiter.scala 24:30]
  wire [1:0] _T_418 = _T_411 & _T_417; // @[Arbiter.scala 24:28]
  wire [3:0] _T_419 = {_T_418,_T_224,_T_217}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_15 = {{1'd0}, _T_419[3:1]}; // @[package.scala 253:43]
  wire [3:0] _T_421 = _T_419 | _GEN_15; // @[package.scala 253:43]
  wire [3:0] _T_424 = {REG_4, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_16 = {{1'd0}, _T_421[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] _T_425 = _GEN_16 | _T_424; // @[Arbiter.scala 25:58]
  wire [1:0] _T_428 = _T_425[3:2] & _T_425[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] _T_429 = ~_T_428; // @[Arbiter.scala 26:18]
  reg  REG_5_0; // @[Arbiter.scala 116:26]
  wire  _T_481_0 = _T_405 ? _T_429[0] : REG_5_0; // @[Arbiter.scala 121:24]
  wire  _T_482 = io_out_1_a_ready & _T_481_0; // @[Arbiter.scala 123:31]
  reg  REG_2_1; // @[Arbiter.scala 116:26]
  wire  _T_360_1 = _T_284 ? _T_308[1] : REG_2_1; // @[Arbiter.scala 121:24]
  wire  _T_362 = io_out_0_a_ready & _T_360_1; // @[Arbiter.scala 123:31]
  reg  REG_5_1; // @[Arbiter.scala 116:26]
  wire  _T_481_1 = _T_405 ? _T_429[1] : REG_5_1; // @[Arbiter.scala 121:24]
  wire  _T_483 = io_out_1_a_ready & _T_481_1; // @[Arbiter.scala 123:31]
  wire  _T_602_0 = _T_526 ? _T_550[0] : REG_8_0; // @[Arbiter.scala 121:24]
  wire  _T_602_1 = _T_526 ? _T_550[1] : REG_8_1; // @[Arbiter.scala 121:24]
  wire  _T_715_0 = _T_639 ? _T_663[0] : REG_11_0; // @[Arbiter.scala 121:24]
  wire  _T_716 = io_in_0_d_ready & _T_715_0; // @[Arbiter.scala 123:31]
  wire  _T_833_0 = _T_757 ? _T_781[0] : REG_14_0; // @[Arbiter.scala 121:24]
  wire  _T_834 = io_in_1_d_ready & _T_833_0; // @[Arbiter.scala 123:31]
  wire  _T_715_1 = _T_639 ? _T_663[1] : REG_11_1; // @[Arbiter.scala 121:24]
  wire  _T_717 = io_in_0_d_ready & _T_715_1; // @[Arbiter.scala 123:31]
  wire  _T_833_1 = _T_757 ? _T_781[1] : REG_14_1; // @[Arbiter.scala 121:24]
  wire  _T_835 = io_in_1_d_ready & _T_833_1; // @[Arbiter.scala 123:31]
  wire  _T_285 = _T_284 & io_out_0_a_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _T_311 = _T_308 & _T_290; // @[Arbiter.scala 28:29]
  wire [2:0] _T_312 = {_T_311, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_314 = _T_311 | _T_312[1:0]; // @[package.scala 244:43]
  wire  _T_319 = _T_308[0] & _T_215; // @[Arbiter.scala 97:79]
  wire  _T_320 = _T_308[1] & _T_222; // @[Arbiter.scala 97:79]
  wire  _T_335 = _T_215 | _T_222; // @[Arbiter.scala 107:36]
  wire  _T_349 = _T_319 & _T_161; // @[Arbiter.scala 111:73]
  wire  _T_350 = _T_320 & _T_169; // @[Arbiter.scala 111:73]
  wire  _T_351 = _T_349 | _T_350; // @[Arbiter.scala 112:44]
  wire  _T_358_0 = _T_284 ? _T_319 : REG_2_0; // @[Arbiter.scala 117:30]
  wire  _T_358_1 = _T_284 ? _T_320 : REG_2_1; // @[Arbiter.scala 117:30]
  wire  _T_366 = REG_2_0 & _T_215 | REG_2_1 & _T_222; // @[Mux.scala 27:72]
  wire  _T_367 = _T_284 ? _T_335 : _T_366; // @[Arbiter.scala 125:29]
  wire  _T_354 = io_out_0_a_ready & _T_367; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_374 = _T_358_0 ? io_in_0_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_375 = _T_358_1 ? io_in_1_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_377 = _T_358_0 ? io_in_0_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_378 = _T_358_1 ? io_in_1_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_386 = _T_358_0 ? io_in_0_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_387 = _T_358_1 ? io_in_1_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [5:0] _WIRE_7_0_a_bits_source = {{1'd0}, io_in_0_a_bits_source}; // @[Xbar.scala 231:18 237:29]
  wire [5:0] _T_389 = _T_358_0 ? _WIRE_7_0_a_bits_source : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_390 = _T_358_1 ? _T_4 : 6'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_392 = _T_358_0 ? io_in_0_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_393 = _T_358_1 ? io_in_1_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_395 = _T_358_0 ? io_in_0_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_396 = _T_358_1 ? io_in_1_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_398 = _T_358_0 ? io_in_0_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_399 = _T_358_1 ? io_in_1_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire  _T_406 = _T_405 & io_out_1_a_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _T_432 = _T_429 & _T_411; // @[Arbiter.scala 28:29]
  wire [2:0] _T_433 = {_T_432, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_435 = _T_432 | _T_433[1:0]; // @[package.scala 244:43]
  wire  _T_440 = _T_429[0] & _T_217; // @[Arbiter.scala 97:79]
  wire  _T_441 = _T_429[1] & _T_224; // @[Arbiter.scala 97:79]
  wire  _T_456 = _T_217 | _T_224; // @[Arbiter.scala 107:36]
  wire  _T_470 = _T_440 & _T_161; // @[Arbiter.scala 111:73]
  wire  _T_471 = _T_441 & _T_169; // @[Arbiter.scala 111:73]
  wire  _T_472 = _T_470 | _T_471; // @[Arbiter.scala 112:44]
  wire  _T_479_0 = _T_405 ? _T_440 : REG_5_0; // @[Arbiter.scala 117:30]
  wire  _T_479_1 = _T_405 ? _T_441 : REG_5_1; // @[Arbiter.scala 117:30]
  wire  _T_487 = REG_5_0 & _T_217 | REG_5_1 & _T_224; // @[Mux.scala 27:72]
  wire  _T_488 = _T_405 ? _T_456 : _T_487; // @[Arbiter.scala 125:29]
  wire  _T_475 = io_out_1_a_ready & _T_488; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_495 = _T_479_0 ? io_in_0_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_496 = _T_479_1 ? io_in_1_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_498 = _T_479_0 ? io_in_0_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_499 = _T_479_1 ? io_in_1_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_507 = _T_479_0 ? io_in_0_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_508 = _T_479_1 ? io_in_1_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_510 = _T_479_0 ? _WIRE_7_0_a_bits_source : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_511 = _T_479_1 ? _T_4 : 6'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_513 = _T_479_0 ? io_in_0_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_514 = _T_479_1 ? io_in_1_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_516 = _T_479_0 ? io_in_0_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_517 = _T_479_1 ? io_in_1_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_519 = _T_479_0 ? io_in_0_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_520 = _T_479_1 ? io_in_1_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire  _T_527 = _T_526 & io_in_0_bready; // @[Arbiter.scala 89:24]
  wire [1:0] _T_553 = _T_550 & _T_532; // @[Arbiter.scala 28:29]
  wire [2:0] _T_554 = {_T_553, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_556 = _T_553 | _T_554[1:0]; // @[package.scala 244:43]
  wire  _T_577 = io_out_0_bvalid | io_out_1_bvalid; // @[Arbiter.scala 107:36]
  wire  _T_608 = REG_8_0 & io_out_0_bvalid | REG_8_1 & io_out_1_bvalid; // @[Mux.scala 27:72]
  wire  _T_609 = _T_526 ? _T_577 : _T_608; // @[Arbiter.scala 125:29]
  wire  _T_596 = io_in_0_bready & _T_609; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_616 = _T_600_0 ? io_out_0_bdata : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_617 = _T_600_1 ? io_out_1_bdata : 256'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_622 = _T_600_0 ? io_out_0_baddress : 36'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_623 = _T_600_1 ? io_out_1_baddress : 36'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_628 = _T_600_0 ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_629 = _T_600_1 ? 3'h6 : 3'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_631 = _T_600_0 ? io_out_0_bparam : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_632 = _T_600_1 ? io_out_1_bparam : 2'h0; // @[Mux.scala 27:72]
  wire  _T_640 = _T_639 & io_in_0_d_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _T_666 = _T_663 & _T_645; // @[Arbiter.scala 28:29]
  wire [2:0] _T_667 = {_T_666, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_669 = _T_666 | _T_667[1:0]; // @[package.scala 244:43]
  wire  _T_690 = _T_257 | _T_264; // @[Arbiter.scala 107:36]
  wire  _T_704 = _T_674 & _T_206; // @[Arbiter.scala 111:73]
  wire  _T_705 = _T_675 & _T_213; // @[Arbiter.scala 111:73]
  wire  _T_706 = _T_704 | _T_705; // @[Arbiter.scala 112:44]
  wire  _T_721 = REG_11_0 & _T_257 | REG_11_1 & _T_264; // @[Mux.scala 27:72]
  wire  _T_722 = _T_639 ? _T_690 : _T_721; // @[Arbiter.scala 125:29]
  wire  _T_709 = io_in_0_d_ready & _T_722; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_729 = _T_713_0 ? io_out_0_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_730 = _T_713_1 ? io_out_1_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_738 = _T_713_0 ? _T_6 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _WIRE_8_1_d_bits_sink = {{1'd0}, io_out_1_d_bits_sink}; // @[Xbar.scala 288:19 323:28]
  wire [5:0] _T_739 = _T_713_1 ? _WIRE_8_1_d_bits_sink : 6'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_744 = _T_713_0 ? io_out_0_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_745 = _T_713_1 ? io_out_1_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_747 = _T_713_0 ? io_out_0_d_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_748 = _T_713_1 ? io_out_1_d_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_750 = _T_713_0 ? io_out_0_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_751 = _T_713_1 ? io_out_1_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire  _T_758 = _T_757 & io_in_1_d_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _T_784 = _T_781 & _T_763; // @[Arbiter.scala 28:29]
  wire [2:0] _T_785 = {_T_784, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_787 = _T_784 | _T_785[1:0]; // @[package.scala 244:43]
  wire  _T_808 = _T_259 | _T_266; // @[Arbiter.scala 107:36]
  wire  _T_822 = _T_792 & _T_206; // @[Arbiter.scala 111:73]
  wire  _T_823 = _T_793 & _T_213; // @[Arbiter.scala 111:73]
  wire  _T_824 = _T_822 | _T_823; // @[Arbiter.scala 112:44]
  wire  _T_839 = REG_14_0 & _T_259 | REG_14_1 & _T_266; // @[Mux.scala 27:72]
  wire  _T_840 = _T_757 ? _T_808 : _T_839; // @[Arbiter.scala 125:29]
  wire  _T_827 = io_in_1_d_ready & _T_840; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_847 = _T_831_0 ? io_out_0_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_848 = _T_831_1 ? io_out_1_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_862 = _T_831_0 ? io_out_0_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_863 = _T_831_1 ? io_out_1_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_868 = _T_831_0 ? io_out_0_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_869 = _T_831_1 ? io_out_1_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  assign io_in_1_a_ready = _T_26 & _T_362 | _T_32 & _T_483; // @[Mux.scala 27:72]
  assign io_in_1_d_valid = _T_757 ? _T_808 : _T_839; // @[Arbiter.scala 125:29]
  assign io_in_1_d_bits_opcode = _T_868 | _T_869; // @[Mux.scala 27:72]
  assign io_in_1_d_bits_size = _T_862 | _T_863; // @[Mux.scala 27:72]
  assign io_in_1_d_bits_source = _T_861[2:0]; // @[Xbar.scala 228:69]
  assign io_in_1_d_bits_data = _T_847 | _T_848; // @[Mux.scala 27:72]
  assign io_in_0_a_ready = _T_14 & _T_361 | _T_20 & _T_482; // @[Mux.scala 27:72]
  assign io_in_0_bvalid = _T_526 ? _T_577 : _T_608; // @[Arbiter.scala 125:29]
  assign io_in_0_bopcode = _T_628 | _T_629; // @[Mux.scala 27:72]
  assign io_in_0_bparam = _T_631 | _T_632; // @[Mux.scala 27:72]
  assign io_in_0_bsize = _T_628 | _T_629; // @[Mux.scala 27:72]
  assign io_in_0_baddress = _T_622 | _T_623; // @[Mux.scala 27:72]
  assign io_in_0_bdata = _T_616 | _T_617; // @[Mux.scala 27:72]
  assign io_in_0_c_ready = _T_38 & io_out_0_c_ready | _T_44 & io_out_1_c_ready; // @[Mux.scala 27:72]
  assign io_in_0_d_valid = _T_639 ? _T_690 : _T_721; // @[Arbiter.scala 125:29]
  assign io_in_0_d_bits_opcode = _T_750 | _T_751; // @[Mux.scala 27:72]
  assign io_in_0_d_bits_param = _T_747 | _T_748; // @[Mux.scala 27:72]
  assign io_in_0_d_bits_size = _T_744 | _T_745; // @[Mux.scala 27:72]
  assign io_in_0_d_bits_source = _T_743[4:0]; // @[Xbar.scala 228:69]
  assign io_in_0_d_bits_sink = _T_738 | _T_739; // @[Mux.scala 27:72]
  assign io_in_0_d_bits_echo_blockisdirty = _T_713_0 & io_out_0_d_bits_echo_blockisdirty | _T_713_1 &
    io_out_1_d_bits_echo_blockisdirty; // @[Mux.scala 27:72]
  assign io_in_0_d_bits_data = _T_729 | _T_730; // @[Mux.scala 27:72]
  assign io_in_0_e_ready = io_in_0_e_bits_sink[5] | _T_133; // @[Mux.scala 27:72]
  assign io_out_1_a_valid = _T_405 ? _T_456 : _T_487; // @[Arbiter.scala 125:29]
  assign io_out_1_a_bits_opcode = _T_519 | _T_520; // @[Mux.scala 27:72]
  assign io_out_1_a_bits_param = _T_516 | _T_517; // @[Mux.scala 27:72]
  assign io_out_1_a_bits_size = _T_513 | _T_514; // @[Mux.scala 27:72]
  assign io_out_1_a_bits_source = _T_510 | _T_511; // @[Mux.scala 27:72]
  assign io_out_1_a_bits_address = _T_507 | _T_508; // @[Mux.scala 27:72]
  assign io_out_1_a_bits_user_preferCache = _T_479_0 & io_in_0_a_bits_user_preferCache; // @[Mux.scala 27:72]
  assign io_out_1_a_bits_mask = _T_498 | _T_499; // @[Mux.scala 27:72]
  assign io_out_1_a_bits_data = _T_495 | _T_496; // @[Mux.scala 27:72]
  assign io_out_1_bready = io_in_0_bready & _T_602_1; // @[Arbiter.scala 123:31]
  assign io_out_1_c_valid = io_in_0_c_valid & _T_44; // @[Xbar.scala 179:40]
  assign io_out_1_c_bits_opcode = io_in_0_c_bits_opcode; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_1_c_bits_param = io_in_0_c_bits_param; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_1_c_bits_size = io_in_0_c_bits_size; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_1_c_bits_source = {{1'd0}, io_in_0_c_bits_source}; // @[Xbar.scala 231:18 259:29]
  assign io_out_1_c_bits_address = io_in_0_c_bits_address; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_1_c_bits_echo_blockisdirty = io_in_0_c_bits_echo_blockisdirty; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_1_c_bits_data = io_in_0_c_bits_data; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_1_d_ready = _T_109 & _T_717 | _T_117 & _T_835; // @[Mux.scala 27:72]
  assign io_out_1_e_valid = io_in_0_e_valid & _T_133; // @[Xbar.scala 179:40]
  assign io_out_1_e_bits_sink = io_in_0_e_bits_sink[4:0]; // @[Xbar.scala 228:69]
  assign io_out_0_a_valid = _T_284 ? _T_335 : _T_366; // @[Arbiter.scala 125:29]
  assign io_out_0_a_bits_opcode = _T_398 | _T_399; // @[Mux.scala 27:72]
  assign io_out_0_a_bits_param = _T_395 | _T_396; // @[Mux.scala 27:72]
  assign io_out_0_a_bits_size = _T_392 | _T_393; // @[Mux.scala 27:72]
  assign io_out_0_a_bits_source = _T_389 | _T_390; // @[Mux.scala 27:72]
  assign io_out_0_a_bits_address = _T_386 | _T_387; // @[Mux.scala 27:72]
  assign io_out_0_a_bits_user_preferCache = _T_358_0 & io_in_0_a_bits_user_preferCache; // @[Mux.scala 27:72]
  assign io_out_0_a_bits_mask = _T_377 | _T_378; // @[Mux.scala 27:72]
  assign io_out_0_a_bits_data = _T_374 | _T_375; // @[Mux.scala 27:72]
  assign io_out_0_bready = io_in_0_bready & _T_602_0; // @[Arbiter.scala 123:31]
  assign io_out_0_c_valid = io_in_0_c_valid & _T_38; // @[Xbar.scala 179:40]
  assign io_out_0_c_bits_opcode = io_in_0_c_bits_opcode; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_0_c_bits_param = io_in_0_c_bits_param; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_0_c_bits_size = io_in_0_c_bits_size; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_0_c_bits_source = {{1'd0}, io_in_0_c_bits_source}; // @[Xbar.scala 231:18 259:29]
  assign io_out_0_c_bits_address = io_in_0_c_bits_address; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_0_c_bits_echo_blockisdirty = io_in_0_c_bits_echo_blockisdirty; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_0_c_bits_data = io_in_0_c_bits_data; // @[BundleMap.scala 247:19 Bundle_ACancel.scala 53:19]
  assign io_out_0_d_ready = _T_93 & _T_716 | _T_101 & _T_834; // @[Mux.scala 27:72]
  assign io_out_0_e_valid = io_in_0_e_valid & io_in_0_e_bits_sink[5]; // @[Xbar.scala 179:40]
  assign io_out_0_e_bits_sink = io_in_0_e_bits_sink[4:0]; // @[Xbar.scala 228:69]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_6 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_527) begin // @[Arbiter.scala 113:23]
      REG_6 <= 1'h0;
    end else begin
      REG_6 <= REG_6 - _T_596;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      REG_7 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (_T_527 & |_T_532) begin // @[Arbiter.scala 27:32]
      REG_7 <= _T_556; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_8_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_526) begin // @[Arbiter.scala 117:30]
      REG_8_0 <= _T_561;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_8_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_526) begin // @[Arbiter.scala 117:30]
      REG_8_1 <= _T_562;
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_9 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_640) begin // @[Arbiter.scala 113:23]
      REG_9 <= _T_706;
    end else begin
      REG_9 <= REG_9 - _T_709;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      REG_10 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (_T_640 & |_T_645) begin // @[Arbiter.scala 27:32]
      REG_10 <= _T_669; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_11_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_639) begin // @[Arbiter.scala 117:30]
      REG_11_0 <= _T_674;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_11_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_639) begin // @[Arbiter.scala 117:30]
      REG_11_1 <= _T_675;
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_12 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_758) begin // @[Arbiter.scala 113:23]
      REG_12 <= _T_824;
    end else begin
      REG_12 <= REG_12 - _T_827;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      REG_13 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (_T_758 & |_T_763) begin // @[Arbiter.scala 27:32]
      REG_13 <= _T_787; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_14_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_757) begin // @[Arbiter.scala 117:30]
      REG_14_0 <= _T_792;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_14_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_757) begin // @[Arbiter.scala 117:30]
      REG_14_1 <= _T_793;
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_285) begin // @[Arbiter.scala 113:23]
      REG <= _T_351;
    end else begin
      REG <= REG - _T_354;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      REG_1 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (_T_285 & |_T_290) begin // @[Arbiter.scala 27:32]
      REG_1 <= _T_314; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_284) begin // @[Arbiter.scala 117:30]
      REG_2_0 <= _T_319;
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_3 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_406) begin // @[Arbiter.scala 113:23]
      REG_3 <= _T_472;
    end else begin
      REG_3 <= REG_3 - _T_475;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      REG_4 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (_T_406 & |_T_411) begin // @[Arbiter.scala 27:32]
      REG_4 <= _T_435; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_5_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_405) begin // @[Arbiter.scala 117:30]
      REG_5_0 <= _T_440;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_284) begin // @[Arbiter.scala 117:30]
      REG_2_1 <= _T_320;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_5_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_405) begin // @[Arbiter.scala 117:30]
      REG_5_1 <= _T_441;
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
  REG_6 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  REG_7 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  REG_8_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG_8_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  REG_9 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  REG_10 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  REG_11_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  REG_11_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  REG_12 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  REG_13 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  REG_14_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  REG_14_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  REG = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  REG_1 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  REG_2_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  REG_3 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  REG_4 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  REG_5_0 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  REG_2_1 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  REG_5_1 = _RAND_19[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule