module TLXbar_1(
  input          clock,
  input          reset,
  output         auto_in_1_a_ready,
  input          auto_in_1_a_valid,
  input  [2:0]   auto_in_1_a_bits_opcode,
  input  [2:0]   auto_in_1_a_bits_param,
  input  [2:0]   auto_in_1_a_bits_size,
  input          auto_in_1_a_bits_source,
  input  [35:0]  auto_in_1_a_bits_address,
  input  [31:0]  auto_in_1_a_bits_mask,
  input  [255:0] auto_in_1_a_bits_data,
  input          auto_in_1_d_ready,
  output         auto_in_1_d_valid,
  output [2:0]   auto_in_1_d_bits_opcode,
  output [2:0]   auto_in_1_d_bits_size,
  output [255:0] auto_in_1_d_bits_data,
  output         auto_in_0_a_ready,
  input          auto_in_0_a_valid,
  input  [2:0]   auto_in_0_a_bits_opcode,
  input  [2:0]   auto_in_0_a_bits_param,
  input  [2:0]   auto_in_0_a_bits_size,
  input  [1:0]   auto_in_0_a_bits_source,
  input  [35:0]  auto_in_0_a_bits_address,
  input  [31:0]  auto_in_0_a_bits_mask,
  input  [255:0] auto_in_0_a_bits_data,
  input          auto_in_0_d_ready,
  output         auto_in_0_d_valid,
  output [2:0]   auto_in_0_d_bits_opcode,
  output [2:0]   auto_in_0_d_bits_size,
  output [1:0]   auto_in_0_d_bits_source,
  output [255:0] auto_in_0_d_bits_data,
  input          auto_out_1_a_ready,
  output         auto_out_1_a_valid,
  output [2:0]   auto_out_1_a_bits_opcode,
  output [2:0]   auto_out_1_a_bits_param,
  output [2:0]   auto_out_1_a_bits_size,
  output [2:0]   auto_out_1_a_bits_source,
  output [35:0]  auto_out_1_a_bits_address,
  output [31:0]  auto_out_1_a_bits_mask,
  output [255:0] auto_out_1_a_bits_data,
  output         auto_out_1_d_ready,
  input          auto_out_1_d_valid,
  input  [2:0]   auto_out_1_d_bits_opcode,
  input  [2:0]   auto_out_1_d_bits_size,
  input  [2:0]   auto_out_1_d_bits_source,
  input  [255:0] auto_out_1_d_bits_data,
  input          auto_out_0_a_ready,
  output         auto_out_0_a_valid,
  output [2:0]   auto_out_0_a_bits_opcode,
  output [2:0]   auto_out_0_a_bits_param,
  output [2:0]   auto_out_0_a_bits_size,
  output [2:0]   auto_out_0_a_bits_source,
  output [35:0]  auto_out_0_a_bits_address,
  output [31:0]  auto_out_0_a_bits_mask,
  output [255:0] auto_out_0_a_bits_data,
  output         auto_out_0_d_ready,
  input          auto_out_0_d_valid,
  input  [2:0]   auto_out_0_d_bits_opcode,
  input  [2:0]   auto_out_0_d_bits_size,
  input  [2:0]   auto_out_0_d_bits_source,
  input  [255:0] auto_out_0_d_bits_data
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
`endif // RANDOMIZE_REG_INIT
  reg  REG_6; // @[Arbiter.scala 87:30]
  wire  _T_483 = ~REG_6; // @[Arbiter.scala 88:28]
  wire  _T_83 = ~auto_out_1_d_bits_source[2]; // @[Parameters.scala 54:32]
  wire  _T_231 = auto_out_1_d_valid & _T_83; // @[Xbar.scala 179:40]
  wire  _T_74 = ~auto_out_0_d_bits_source[2]; // @[Parameters.scala 54:32]
  wire  _T_224 = auto_out_0_d_valid & _T_74; // @[Xbar.scala 179:40]
  wire [1:0] _T_489 = {_T_231,_T_224}; // @[Cat.scala 30:58]
  reg [1:0] REG_7; // @[Arbiter.scala 23:23]
  wire [1:0] _T_495 = ~REG_7; // @[Arbiter.scala 24:30]
  wire [1:0] _T_496 = _T_489 & _T_495; // @[Arbiter.scala 24:28]
  wire [3:0] _T_497 = {_T_496,_T_231,_T_224}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_4 = {{1'd0}, _T_497[3:1]}; // @[package.scala 253:43]
  wire [3:0] _T_499 = _T_497 | _GEN_4; // @[package.scala 253:43]
  wire [3:0] _T_502 = {REG_7, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_5 = {{1'd0}, _T_499[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] _T_503 = _GEN_5 | _T_502; // @[Arbiter.scala 25:58]
  wire [1:0] _T_506 = _T_503[3:2] & _T_503[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] _T_507 = ~_T_506; // @[Arbiter.scala 26:18]
  wire  _T_518 = _T_507[0] & _T_224; // @[Arbiter.scala 97:79]
  reg  REG_8_0; // @[Arbiter.scala 116:26]
  wire  _T_557_0 = _T_483 ? _T_518 : REG_8_0; // @[Arbiter.scala 117:30]
  wire [2:0] _T_582 = _T_557_0 ? auto_out_0_d_bits_source : 3'h0; // @[Mux.scala 27:72]
  wire  _T_519 = _T_507[1] & _T_231; // @[Arbiter.scala 97:79]
  reg  REG_8_1; // @[Arbiter.scala 116:26]
  wire  _T_557_1 = _T_483 ? _T_519 : REG_8_1; // @[Arbiter.scala 117:30]
  wire [2:0] _T_583 = _T_557_1 ? auto_out_1_d_bits_source : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_584 = _T_582 | _T_583; // @[Mux.scala 27:72]
  wire [2:0] _GEN_6 = {{2'd0}, auto_in_1_a_bits_source}; // @[Xbar.scala 237:55]
  wire [2:0] _T_2 = _GEN_6 | 3'h4; // @[Xbar.scala 237:55]
  wire [36:0] _T_6 = {1'b0,$signed(auto_in_0_a_bits_address)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_8 = $signed(_T_6) & 37'sh40; // @[Parameters.scala 137:52]
  wire  _T_9 = $signed(_T_8) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_11 = auto_in_0_a_bits_address ^ 36'h40; // @[Parameters.scala 137:31]
  wire [36:0] _T_12 = {1'b0,$signed(_T_11)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_14 = $signed(_T_12) & 37'sh40; // @[Parameters.scala 137:52]
  wire  _T_15 = $signed(_T_14) == 37'sh0; // @[Parameters.scala 137:67]
  wire [36:0] _T_18 = {1'b0,$signed(auto_in_1_a_bits_address)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_20 = $signed(_T_18) & 37'sh40; // @[Parameters.scala 137:52]
  wire  _T_21 = $signed(_T_20) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_23 = auto_in_1_a_bits_address ^ 36'h40; // @[Parameters.scala 137:31]
  wire [36:0] _T_24 = {1'b0,$signed(_T_23)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_26 = $signed(_T_24) & 37'sh40; // @[Parameters.scala 137:52]
  wire  _T_27 = $signed(_T_26) == 37'sh0; // @[Parameters.scala 137:67]
  wire  _T_79 = auto_out_0_d_bits_source == 3'h4; // @[Parameters.scala 46:9]
  wire  _T_88 = auto_out_1_d_bits_source == 3'h4; // @[Parameters.scala 46:9]
  wire [12:0] _T_122 = 13'h3f << auto_in_0_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_124 = ~_T_122[5:0]; // @[package.scala 234:46]
  wire  _T_127 = ~auto_in_0_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire  _T_128 = _T_127 & _T_124[5]; // @[Edges.scala 220:14]
  wire [12:0] _T_130 = 13'h3f << auto_in_1_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_132 = ~_T_130[5:0]; // @[package.scala 234:46]
  wire  _T_135 = ~auto_in_1_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire  _T_136 = _T_135 & _T_132[5]; // @[Edges.scala 220:14]
  wire [12:0] _T_168 = 13'h3f << auto_out_0_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_170 = ~_T_168[5:0]; // @[package.scala 234:46]
  wire  _T_173 = auto_out_0_d_bits_opcode[0] & _T_170[5]; // @[Edges.scala 220:14]
  wire [12:0] _T_175 = 13'h3f << auto_out_1_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_177 = ~_T_175[5:0]; // @[package.scala 234:46]
  wire  _T_180 = auto_out_1_d_bits_opcode[0] & _T_177[5]; // @[Edges.scala 220:14]
  wire  _T_182 = auto_in_0_a_valid & _T_9; // @[Xbar.scala 428:50]
  wire  _T_184 = auto_in_0_a_valid & _T_15; // @[Xbar.scala 428:50]
  reg  REG; // @[Arbiter.scala 87:30]
  wire  _T_251 = ~REG; // @[Arbiter.scala 88:28]
  wire  _T_189 = auto_in_1_a_valid & _T_21; // @[Xbar.scala 428:50]
  wire [1:0] _T_257 = {_T_189,_T_182}; // @[Cat.scala 30:58]
  reg [1:0] REG_1; // @[Arbiter.scala 23:23]
  wire [1:0] _T_263 = ~REG_1; // @[Arbiter.scala 24:30]
  wire [1:0] _T_264 = _T_257 & _T_263; // @[Arbiter.scala 24:28]
  wire [3:0] _T_265 = {_T_264,_T_189,_T_182}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_8 = {{1'd0}, _T_265[3:1]}; // @[package.scala 253:43]
  wire [3:0] _T_267 = _T_265 | _GEN_8; // @[package.scala 253:43]
  wire [3:0] _T_270 = {REG_1, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_9 = {{1'd0}, _T_267[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] _T_271 = _GEN_9 | _T_270; // @[Arbiter.scala 25:58]
  wire [1:0] _T_274 = _T_271[3:2] & _T_271[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] _T_275 = ~_T_274; // @[Arbiter.scala 26:18]
  reg  REG_2_0; // @[Arbiter.scala 116:26]
  wire  _T_327_0 = _T_251 ? _T_275[0] : REG_2_0; // @[Arbiter.scala 121:24]
  wire  _T_328 = auto_out_0_a_ready & _T_327_0; // @[Arbiter.scala 123:31]
  reg  REG_3; // @[Arbiter.scala 87:30]
  wire  _T_366 = ~REG_3; // @[Arbiter.scala 88:28]
  wire  _T_191 = auto_in_1_a_valid & _T_27; // @[Xbar.scala 428:50]
  wire [1:0] _T_372 = {_T_191,_T_184}; // @[Cat.scala 30:58]
  reg [1:0] REG_4; // @[Arbiter.scala 23:23]
  wire [1:0] _T_378 = ~REG_4; // @[Arbiter.scala 24:30]
  wire [1:0] _T_379 = _T_372 & _T_378; // @[Arbiter.scala 24:28]
  wire [3:0] _T_380 = {_T_379,_T_191,_T_184}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_10 = {{1'd0}, _T_380[3:1]}; // @[package.scala 253:43]
  wire [3:0] _T_382 = _T_380 | _GEN_10; // @[package.scala 253:43]
  wire [3:0] _T_385 = {REG_4, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_11 = {{1'd0}, _T_382[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] _T_386 = _GEN_11 | _T_385; // @[Arbiter.scala 25:58]
  wire [1:0] _T_389 = _T_386[3:2] & _T_386[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] _T_390 = ~_T_389; // @[Arbiter.scala 26:18]
  reg  REG_5_0; // @[Arbiter.scala 116:26]
  wire  _T_442_0 = _T_366 ? _T_390[0] : REG_5_0; // @[Arbiter.scala 121:24]
  wire  _T_443 = auto_out_1_a_ready & _T_442_0; // @[Arbiter.scala 123:31]
  reg  REG_2_1; // @[Arbiter.scala 116:26]
  wire  _T_327_1 = _T_251 ? _T_275[1] : REG_2_1; // @[Arbiter.scala 121:24]
  wire  _T_329 = auto_out_0_a_ready & _T_327_1; // @[Arbiter.scala 123:31]
  reg  REG_5_1; // @[Arbiter.scala 116:26]
  wire  _T_442_1 = _T_366 ? _T_390[1] : REG_5_1; // @[Arbiter.scala 121:24]
  wire  _T_444 = auto_out_1_a_ready & _T_442_1; // @[Arbiter.scala 123:31]
  wire  _T_226 = auto_out_0_d_valid & _T_79; // @[Xbar.scala 179:40]
  wire  _T_559_0 = _T_483 ? _T_507[0] : REG_8_0; // @[Arbiter.scala 121:24]
  wire  _T_560 = auto_in_0_d_ready & _T_559_0; // @[Arbiter.scala 123:31]
  reg  REG_9; // @[Arbiter.scala 87:30]
  wire  _T_598 = ~REG_9; // @[Arbiter.scala 88:28]
  wire  _T_233 = auto_out_1_d_valid & _T_88; // @[Xbar.scala 179:40]
  wire [1:0] _T_604 = {_T_233,_T_226}; // @[Cat.scala 30:58]
  reg [1:0] REG_10; // @[Arbiter.scala 23:23]
  wire [1:0] _T_610 = ~REG_10; // @[Arbiter.scala 24:30]
  wire [1:0] _T_611 = _T_604 & _T_610; // @[Arbiter.scala 24:28]
  wire [3:0] _T_612 = {_T_611,_T_233,_T_226}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_12 = {{1'd0}, _T_612[3:1]}; // @[package.scala 253:43]
  wire [3:0] _T_614 = _T_612 | _GEN_12; // @[package.scala 253:43]
  wire [3:0] _T_617 = {REG_10, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_13 = {{1'd0}, _T_614[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] _T_618 = _GEN_13 | _T_617; // @[Arbiter.scala 25:58]
  wire [1:0] _T_621 = _T_618[3:2] & _T_618[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] _T_622 = ~_T_621; // @[Arbiter.scala 26:18]
  reg  REG_11_0; // @[Arbiter.scala 116:26]
  wire  _T_674_0 = _T_598 ? _T_622[0] : REG_11_0; // @[Arbiter.scala 121:24]
  wire  _T_675 = auto_in_1_d_ready & _T_674_0; // @[Arbiter.scala 123:31]
  wire  _T_559_1 = _T_483 ? _T_507[1] : REG_8_1; // @[Arbiter.scala 121:24]
  wire  _T_561 = auto_in_0_d_ready & _T_559_1; // @[Arbiter.scala 123:31]
  reg  REG_11_1; // @[Arbiter.scala 116:26]
  wire  _T_674_1 = _T_598 ? _T_622[1] : REG_11_1; // @[Arbiter.scala 121:24]
  wire  _T_676 = auto_in_1_d_ready & _T_674_1; // @[Arbiter.scala 123:31]
  wire  _T_252 = _T_251 & auto_out_0_a_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _T_278 = _T_275 & _T_257; // @[Arbiter.scala 28:29]
  wire [2:0] _T_279 = {_T_278, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_281 = _T_278 | _T_279[1:0]; // @[package.scala 244:43]
  wire  _T_286 = _T_275[0] & _T_182; // @[Arbiter.scala 97:79]
  wire  _T_287 = _T_275[1] & _T_189; // @[Arbiter.scala 97:79]
  wire  _T_302 = _T_182 | _T_189; // @[Arbiter.scala 107:36]
  wire  _T_316 = _T_286 & _T_128; // @[Arbiter.scala 111:73]
  wire  _T_317 = _T_287 & _T_136; // @[Arbiter.scala 111:73]
  wire  _T_318 = _T_316 | _T_317; // @[Arbiter.scala 112:44]
  wire  _T_325_0 = _T_251 ? _T_286 : REG_2_0; // @[Arbiter.scala 117:30]
  wire  _T_325_1 = _T_251 ? _T_287 : REG_2_1; // @[Arbiter.scala 117:30]
  wire  _T_333 = REG_2_0 & _T_182 | REG_2_1 & _T_189; // @[Mux.scala 27:72]
  wire  _T_334 = _T_251 ? _T_302 : _T_333; // @[Arbiter.scala 125:29]
  wire  _T_321 = auto_out_0_a_ready & _T_334; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_341 = _T_325_0 ? auto_in_0_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_342 = _T_325_1 ? auto_in_1_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_344 = _T_325_0 ? auto_in_0_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_345 = _T_325_1 ? auto_in_1_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_347 = _T_325_0 ? auto_in_0_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_348 = _T_325_1 ? auto_in_1_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [2:0] _WIRE_14_0_a_bits_source = {{1'd0}, auto_in_0_a_bits_source}; // @[Xbar.scala 231:18 237:29]
  wire [2:0] _T_350 = _T_325_0 ? _WIRE_14_0_a_bits_source : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_351 = _T_325_1 ? _T_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_353 = _T_325_0 ? auto_in_0_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_354 = _T_325_1 ? auto_in_1_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_356 = _T_325_0 ? auto_in_0_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_357 = _T_325_1 ? auto_in_1_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_359 = _T_325_0 ? auto_in_0_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_360 = _T_325_1 ? auto_in_1_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire  _T_367 = _T_366 & auto_out_1_a_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _T_393 = _T_390 & _T_372; // @[Arbiter.scala 28:29]
  wire [2:0] _T_394 = {_T_393, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_396 = _T_393 | _T_394[1:0]; // @[package.scala 244:43]
  wire  _T_401 = _T_390[0] & _T_184; // @[Arbiter.scala 97:79]
  wire  _T_402 = _T_390[1] & _T_191; // @[Arbiter.scala 97:79]
  wire  _T_417 = _T_184 | _T_191; // @[Arbiter.scala 107:36]
  wire  _T_431 = _T_401 & _T_128; // @[Arbiter.scala 111:73]
  wire  _T_432 = _T_402 & _T_136; // @[Arbiter.scala 111:73]
  wire  _T_433 = _T_431 | _T_432; // @[Arbiter.scala 112:44]
  wire  _T_440_0 = _T_366 ? _T_401 : REG_5_0; // @[Arbiter.scala 117:30]
  wire  _T_440_1 = _T_366 ? _T_402 : REG_5_1; // @[Arbiter.scala 117:30]
  wire  _T_448 = REG_5_0 & _T_184 | REG_5_1 & _T_191; // @[Mux.scala 27:72]
  wire  _T_449 = _T_366 ? _T_417 : _T_448; // @[Arbiter.scala 125:29]
  wire  _T_436 = auto_out_1_a_ready & _T_449; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_456 = _T_440_0 ? auto_in_0_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_457 = _T_440_1 ? auto_in_1_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_459 = _T_440_0 ? auto_in_0_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_460 = _T_440_1 ? auto_in_1_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_462 = _T_440_0 ? auto_in_0_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_463 = _T_440_1 ? auto_in_1_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_465 = _T_440_0 ? _WIRE_14_0_a_bits_source : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_466 = _T_440_1 ? _T_2 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_468 = _T_440_0 ? auto_in_0_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_469 = _T_440_1 ? auto_in_1_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_471 = _T_440_0 ? auto_in_0_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_472 = _T_440_1 ? auto_in_1_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_474 = _T_440_0 ? auto_in_0_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_475 = _T_440_1 ? auto_in_1_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire  _T_484 = _T_483 & auto_in_0_d_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _T_510 = _T_507 & _T_489; // @[Arbiter.scala 28:29]
  wire [2:0] _T_511 = {_T_510, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_513 = _T_510 | _T_511[1:0]; // @[package.scala 244:43]
  wire  _T_534 = _T_224 | _T_231; // @[Arbiter.scala 107:36]
  wire  _T_548 = _T_518 & _T_173; // @[Arbiter.scala 111:73]
  wire  _T_549 = _T_519 & _T_180; // @[Arbiter.scala 111:73]
  wire  _T_550 = _T_548 | _T_549; // @[Arbiter.scala 112:44]
  wire  _T_565 = REG_8_0 & _T_224 | REG_8_1 & _T_231; // @[Mux.scala 27:72]
  wire  _T_566 = _T_483 ? _T_534 : _T_565; // @[Arbiter.scala 125:29]
  wire  _T_553 = auto_in_0_d_ready & _T_566; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_573 = _T_557_0 ? auto_out_0_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_574 = _T_557_1 ? auto_out_1_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_585 = _T_557_0 ? auto_out_0_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_586 = _T_557_1 ? auto_out_1_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_591 = _T_557_0 ? auto_out_0_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_592 = _T_557_1 ? auto_out_1_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire  _T_599 = _T_598 & auto_in_1_d_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _T_625 = _T_622 & _T_604; // @[Arbiter.scala 28:29]
  wire [2:0] _T_626 = {_T_625, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_628 = _T_625 | _T_626[1:0]; // @[package.scala 244:43]
  wire  _T_633 = _T_622[0] & _T_226; // @[Arbiter.scala 97:79]
  wire  _T_634 = _T_622[1] & _T_233; // @[Arbiter.scala 97:79]
  wire  _T_649 = _T_226 | _T_233; // @[Arbiter.scala 107:36]
  wire  _T_663 = _T_633 & _T_173; // @[Arbiter.scala 111:73]
  wire  _T_664 = _T_634 & _T_180; // @[Arbiter.scala 111:73]
  wire  _T_665 = _T_663 | _T_664; // @[Arbiter.scala 112:44]
  wire  _T_672_0 = _T_598 ? _T_633 : REG_11_0; // @[Arbiter.scala 117:30]
  wire  _T_672_1 = _T_598 ? _T_634 : REG_11_1; // @[Arbiter.scala 117:30]
  wire  _T_680 = REG_11_0 & _T_226 | REG_11_1 & _T_233; // @[Mux.scala 27:72]
  wire  _T_681 = _T_598 ? _T_649 : _T_680; // @[Arbiter.scala 125:29]
  wire  _T_668 = auto_in_1_d_ready & _T_681; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_688 = _T_672_0 ? auto_out_0_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_689 = _T_672_1 ? auto_out_1_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_700 = _T_672_0 ? auto_out_0_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_701 = _T_672_1 ? auto_out_1_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_706 = _T_672_0 ? auto_out_0_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_707 = _T_672_1 ? auto_out_1_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  assign auto_in_1_a_ready = _T_21 & _T_329 | _T_27 & _T_444; // @[Mux.scala 27:72]
  assign auto_in_1_d_valid = _T_598 ? _T_649 : _T_680; // @[Arbiter.scala 125:29]
  assign auto_in_1_d_bits_opcode = _T_706 | _T_707; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_size = _T_700 | _T_701; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_data = _T_688 | _T_689; // @[Mux.scala 27:72]
  assign auto_in_0_a_ready = _T_9 & _T_328 | _T_15 & _T_443; // @[Mux.scala 27:72]
  assign auto_in_0_d_valid = _T_483 ? _T_534 : _T_565; // @[Arbiter.scala 125:29]
  assign auto_in_0_d_bits_opcode = _T_591 | _T_592; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_size = _T_585 | _T_586; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_source = _T_584[1:0]; // @[Xbar.scala 228:69]
  assign auto_in_0_d_bits_data = _T_573 | _T_574; // @[Mux.scala 27:72]
  assign auto_out_1_a_valid = _T_366 ? _T_417 : _T_448; // @[Arbiter.scala 125:29]
  assign auto_out_1_a_bits_opcode = _T_474 | _T_475; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_param = _T_471 | _T_472; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_size = _T_468 | _T_469; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_source = _T_465 | _T_466; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_address = _T_462 | _T_463; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_mask = _T_459 | _T_460; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_data = _T_456 | _T_457; // @[Mux.scala 27:72]
  assign auto_out_1_d_ready = _T_83 & _T_561 | _T_88 & _T_676; // @[Mux.scala 27:72]
  assign auto_out_0_a_valid = _T_251 ? _T_302 : _T_333; // @[Arbiter.scala 125:29]
  assign auto_out_0_a_bits_opcode = _T_359 | _T_360; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_param = _T_356 | _T_357; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_size = _T_353 | _T_354; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_source = _T_350 | _T_351; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_address = _T_347 | _T_348; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_mask = _T_344 | _T_345; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_data = _T_341 | _T_342; // @[Mux.scala 27:72]
  assign auto_out_0_d_ready = _T_74 & _T_560 | _T_79 & _T_675; // @[Mux.scala 27:72]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_6 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_484) begin // @[Arbiter.scala 113:23]
      REG_6 <= _T_550;
    end else begin
      REG_6 <= REG_6 - _T_553;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      REG_7 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (_T_484 & |_T_489) begin // @[Arbiter.scala 27:32]
      REG_7 <= _T_513; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_8_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_483) begin // @[Arbiter.scala 117:30]
      REG_8_0 <= _T_518;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_8_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_483) begin // @[Arbiter.scala 117:30]
      REG_8_1 <= _T_519;
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_252) begin // @[Arbiter.scala 113:23]
      REG <= _T_318;
    end else begin
      REG <= REG - _T_321;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      REG_1 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (_T_252 & |_T_257) begin // @[Arbiter.scala 27:32]
      REG_1 <= _T_281; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_251) begin // @[Arbiter.scala 117:30]
      REG_2_0 <= _T_286;
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_3 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_367) begin // @[Arbiter.scala 113:23]
      REG_3 <= _T_433;
    end else begin
      REG_3 <= REG_3 - _T_436;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      REG_4 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (_T_367 & |_T_372) begin // @[Arbiter.scala 27:32]
      REG_4 <= _T_396; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_5_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_366) begin // @[Arbiter.scala 117:30]
      REG_5_0 <= _T_401;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_251) begin // @[Arbiter.scala 117:30]
      REG_2_1 <= _T_287;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_5_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_366) begin // @[Arbiter.scala 117:30]
      REG_5_1 <= _T_402;
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_9 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_599) begin // @[Arbiter.scala 113:23]
      REG_9 <= _T_665;
    end else begin
      REG_9 <= REG_9 - _T_668;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      REG_10 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (_T_599 & |_T_604) begin // @[Arbiter.scala 27:32]
      REG_10 <= _T_628; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_11_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_598) begin // @[Arbiter.scala 117:30]
      REG_11_0 <= _T_633;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_11_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_598) begin // @[Arbiter.scala 117:30]
      REG_11_1 <= _T_634;
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
  REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  REG_1 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  REG_2_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  REG_3 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  REG_4 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  REG_5_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  REG_2_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  REG_5_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  REG_9 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  REG_10 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  REG_11_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  REG_11_1 = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule