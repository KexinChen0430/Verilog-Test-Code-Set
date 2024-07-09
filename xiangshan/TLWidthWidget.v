`include "Repeater.v"

module TLWidthWidget(
  input          clock,
  input          reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [2:0]   auto_in_a_bits_size,
  input          auto_in_a_bits_source,
  input  [35:0]  auto_in_a_bits_address,
  input  [7:0]   auto_in_a_bits_mask,
  input  [63:0]  auto_in_a_bits_data,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [2:0]   auto_in_d_bits_size,
  output         auto_in_d_bits_source,
  output [63:0]  auto_in_d_bits_data,
  input          auto_out_a_ready,
  output         auto_out_a_valid,
  output [2:0]   auto_out_a_bits_opcode,
  output [2:0]   auto_out_a_bits_size,
  output         auto_out_a_bits_source,
  output [35:0]  auto_out_a_bits_address,
  output [31:0]  auto_out_a_bits_mask,
  output [255:0] auto_out_a_bits_data,
  output         auto_out_d_ready,
  input          auto_out_d_valid,
  input  [2:0]   auto_out_d_bits_opcode,
  input  [2:0]   auto_out_d_bits_size,
  input          auto_out_d_bits_source,
  input  [255:0] auto_out_d_bits_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  wire  Repeater_clock; // @[Repeater.scala 35:26]
  wire  Repeater_reset; // @[Repeater.scala 35:26]
  wire  Repeater_io_repeat; // @[Repeater.scala 35:26]
  wire  Repeater_io_enq_ready; // @[Repeater.scala 35:26]
  wire  Repeater_io_enq_valid; // @[Repeater.scala 35:26]
  wire [2:0] Repeater_io_enq_bits_opcode; // @[Repeater.scala 35:26]
  wire [2:0] Repeater_io_enq_bits_size; // @[Repeater.scala 35:26]
  wire  Repeater_io_enq_bits_source; // @[Repeater.scala 35:26]
  wire [255:0] Repeater_io_enq_bits_data; // @[Repeater.scala 35:26]
  wire  Repeater_io_deq_ready; // @[Repeater.scala 35:26]
  wire  Repeater_io_deq_valid; // @[Repeater.scala 35:26]
  wire [2:0] Repeater_io_deq_bits_opcode; // @[Repeater.scala 35:26]
  wire [2:0] Repeater_io_deq_bits_size; // @[Repeater.scala 35:26]
  wire  Repeater_io_deq_bits_source; // @[Repeater.scala 35:26]
  wire [255:0] Repeater_io_deq_bits_data; // @[Repeater.scala 35:26]
  wire  _T_1 = ~auto_in_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [11:0] _T_3 = 12'h1f << auto_in_a_bits_size; // @[package.scala 234:77]
  wire [4:0] _T_5 = ~_T_3[4:0]; // @[package.scala 234:46]
  reg [1:0] REG; // @[WidthWidget.scala 34:27]
  wire  _T_10 = REG == _T_5[4:3] | ~_T_1; // @[WidthWidget.scala 36:36]
  wire [1:0] _T_12 = REG & _T_5[4:3]; // @[WidthWidget.scala 37:63]
  wire  _T_14 = ~(|_T_12); // @[WidthWidget.scala 37:47]
  wire [1:0] _T_15 = REG ^ 2'h1; // @[WidthWidget.scala 37:56]
  wire [1:0] _T_16 = _T_15 & _T_5[4:3]; // @[WidthWidget.scala 37:63]
  wire  _T_18 = ~(|_T_16); // @[WidthWidget.scala 37:47]
  wire [1:0] _T_19 = REG ^ 2'h2; // @[WidthWidget.scala 37:56]
  wire [1:0] _T_20 = _T_19 & _T_5[4:3]; // @[WidthWidget.scala 37:63]
  wire  _T_22 = ~(|_T_20); // @[WidthWidget.scala 37:47]
  wire  _T_31 = ~_T_10; // @[WidthWidget.scala 70:32]
  wire  _T_32 = auto_out_a_ready | ~_T_10; // @[WidthWidget.scala 70:29]
  wire  _T_28 = _T_32 & auto_in_a_valid; // @[Decoupled.scala 40:37]
  wire [1:0] _T_30 = REG + 2'h1; // @[WidthWidget.scala 44:24]
  reg  REG_2; // @[WidthWidget.scala 56:41]
  wire  _T_35 = _T_14 | ~REG_2; // @[WidthWidget.scala 57:42]
  wire  _T_37 = _T_18 | ~REG_2; // @[WidthWidget.scala 57:42]
  wire  _T_39 = _T_22 | ~REG_2; // @[WidthWidget.scala 57:42]
  reg [63:0] REG_3_0; // @[WidthWidget.scala 60:24]
  reg [63:0] REG_3_1; // @[WidthWidget.scala 60:24]
  reg [63:0] REG_3_2; // @[WidthWidget.scala 60:24]
  wire [63:0] _T_42 = _T_35 ? auto_in_a_bits_data : REG_3_0; // @[WidthWidget.scala 62:88]
  wire [63:0] _T_43 = _T_37 ? auto_in_a_bits_data : REG_3_1; // @[WidthWidget.scala 62:88]
  wire [63:0] _T_44 = _T_39 ? auto_in_a_bits_data : REG_3_2; // @[WidthWidget.scala 62:88]
  wire  _GEN_4 = _T_28 & _T_31 | REG_2; // @[WidthWidget.scala 63:35 64:30 56:41]
  wire [127:0] lo = {_T_43,_T_42}; // @[Cat.scala 30:58]
  wire [127:0] hi = {auto_in_a_bits_data,_T_44}; // @[Cat.scala 30:58]
  wire [4:0] _T_50 = {{2'd0}, auto_in_a_bits_size}; // @[Misc.scala 201:34]
  wire [2:0] shiftAmount = _T_50[2:0]; // @[OneHot.scala 64:49]
  wire [7:0] _T_51 = 8'h1 << shiftAmount; // @[OneHot.scala 65:12]
  wire [4:0] _T_53 = _T_51[4:0] | 5'h1; // @[Misc.scala 201:81]
  wire  _T_54 = auto_in_a_bits_size >= 3'h5; // @[Misc.scala 205:21]
  wire  _T_57 = ~auto_in_a_bits_address[4]; // @[Misc.scala 210:20]
  wire  _T_66 = ~auto_in_a_bits_address[3]; // @[Misc.scala 210:20]
  wire  _T_67 = _T_57 & _T_66; // @[Misc.scala 213:27]
  wire  _T_70 = _T_57 & auto_in_a_bits_address[3]; // @[Misc.scala 213:27]
  wire  _T_73 = auto_in_a_bits_address[4] & _T_66; // @[Misc.scala 213:27]
  wire  _T_76 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3]; // @[Misc.scala 213:27]
  wire  _T_81 = ~auto_in_a_bits_address[2]; // @[Misc.scala 210:20]
  wire  _T_82 = _T_57 & _T_66 & _T_81; // @[Misc.scala 213:27]
  wire  _T_85 = _T_57 & _T_66 & auto_in_a_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_88 = _T_57 & auto_in_a_bits_address[3] & _T_81; // @[Misc.scala 213:27]
  wire  _T_91 = _T_57 & auto_in_a_bits_address[3] & auto_in_a_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_94 = auto_in_a_bits_address[4] & _T_66 & _T_81; // @[Misc.scala 213:27]
  wire  _T_97 = auto_in_a_bits_address[4] & _T_66 & auto_in_a_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_100 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & _T_81; // @[Misc.scala 213:27]
  wire  _T_103 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & auto_in_a_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_108 = ~auto_in_a_bits_address[1]; // @[Misc.scala 210:20]
  wire  _T_109 = _T_57 & _T_66 & _T_81 & _T_108; // @[Misc.scala 213:27]
  wire  _T_112 = _T_57 & _T_66 & _T_81 & auto_in_a_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_115 = _T_57 & _T_66 & auto_in_a_bits_address[2] & _T_108; // @[Misc.scala 213:27]
  wire  _T_118 = _T_57 & _T_66 & auto_in_a_bits_address[2] & auto_in_a_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_121 = _T_57 & auto_in_a_bits_address[3] & _T_81 & _T_108; // @[Misc.scala 213:27]
  wire  _T_124 = _T_57 & auto_in_a_bits_address[3] & _T_81 & auto_in_a_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_127 = _T_57 & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] & _T_108; // @[Misc.scala 213:27]
  wire  _T_130 = _T_57 & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] & auto_in_a_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_133 = auto_in_a_bits_address[4] & _T_66 & _T_81 & _T_108; // @[Misc.scala 213:27]
  wire  _T_136 = auto_in_a_bits_address[4] & _T_66 & _T_81 & auto_in_a_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_139 = auto_in_a_bits_address[4] & _T_66 & auto_in_a_bits_address[2] & _T_108; // @[Misc.scala 213:27]
  wire  _T_142 = auto_in_a_bits_address[4] & _T_66 & auto_in_a_bits_address[2] & auto_in_a_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_145 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & _T_81 & _T_108; // @[Misc.scala 213:27]
  wire  _T_148 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & _T_81 & auto_in_a_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_151 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] & _T_108; // @[Misc.scala 213:27]
  wire  _T_154 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] &
    auto_in_a_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_159 = ~auto_in_a_bits_address[0]; // @[Misc.scala 210:20]
  wire  _T_160 = _T_57 & _T_66 & _T_81 & _T_108 & _T_159; // @[Misc.scala 213:27]
  wire  _T_162 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_67 | _T_53[2] & _T_82 | _T_53[1] & _T_109 | _T_53[0] & _T_160; // @[Misc.scala 214:29]
  wire  _T_163 = _T_57 & _T_66 & _T_81 & _T_108 & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_165 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_67 | _T_53[2] & _T_82 | _T_53[1] & _T_109 | _T_53[0] & _T_163; // @[Misc.scala 214:29]
  wire  _T_166 = _T_57 & _T_66 & _T_81 & auto_in_a_bits_address[1] & _T_159; // @[Misc.scala 213:27]
  wire  _T_168 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_67 | _T_53[2] & _T_82 | _T_53[1] & _T_112 | _T_53[0] & _T_166; // @[Misc.scala 214:29]
  wire  _T_169 = _T_57 & _T_66 & _T_81 & auto_in_a_bits_address[1] & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_171 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_67 | _T_53[2] & _T_82 | _T_53[1] & _T_112 | _T_53[0] & _T_169; // @[Misc.scala 214:29]
  wire  _T_172 = _T_57 & _T_66 & auto_in_a_bits_address[2] & _T_108 & _T_159; // @[Misc.scala 213:27]
  wire  _T_174 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_67 | _T_53[2] & _T_85 | _T_53[1] & _T_115 | _T_53[0] & _T_172; // @[Misc.scala 214:29]
  wire  _T_175 = _T_57 & _T_66 & auto_in_a_bits_address[2] & _T_108 & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_177 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_67 | _T_53[2] & _T_85 | _T_53[1] & _T_115 | _T_53[0] & _T_175; // @[Misc.scala 214:29]
  wire  _T_178 = _T_57 & _T_66 & auto_in_a_bits_address[2] & auto_in_a_bits_address[1] & _T_159; // @[Misc.scala 213:27]
  wire  _T_180 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_67 | _T_53[2] & _T_85 | _T_53[1] & _T_118 | _T_53[0] & _T_178; // @[Misc.scala 214:29]
  wire  _T_181 = _T_57 & _T_66 & auto_in_a_bits_address[2] & auto_in_a_bits_address[1] & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_183 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_67 | _T_53[2] & _T_85 | _T_53[1] & _T_118 | _T_53[0] & _T_181; // @[Misc.scala 214:29]
  wire  _T_184 = _T_57 & auto_in_a_bits_address[3] & _T_81 & _T_108 & _T_159; // @[Misc.scala 213:27]
  wire  _T_186 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_70 | _T_53[2] & _T_88 | _T_53[1] & _T_121 | _T_53[0] & _T_184; // @[Misc.scala 214:29]
  wire  _T_187 = _T_57 & auto_in_a_bits_address[3] & _T_81 & _T_108 & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_189 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_70 | _T_53[2] & _T_88 | _T_53[1] & _T_121 | _T_53[0] & _T_187; // @[Misc.scala 214:29]
  wire  _T_190 = _T_57 & auto_in_a_bits_address[3] & _T_81 & auto_in_a_bits_address[1] & _T_159; // @[Misc.scala 213:27]
  wire  _T_192 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_70 | _T_53[2] & _T_88 | _T_53[1] & _T_124 | _T_53[0] & _T_190; // @[Misc.scala 214:29]
  wire  _T_193 = _T_57 & auto_in_a_bits_address[3] & _T_81 & auto_in_a_bits_address[1] & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_195 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_70 | _T_53[2] & _T_88 | _T_53[1] & _T_124 | _T_53[0] & _T_193; // @[Misc.scala 214:29]
  wire  _T_196 = _T_57 & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] & _T_108 & _T_159; // @[Misc.scala 213:27]
  wire  _T_198 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_70 | _T_53[2] & _T_91 | _T_53[1] & _T_127 | _T_53[0] & _T_196; // @[Misc.scala 214:29]
  wire  _T_199 = _T_57 & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] & _T_108 & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_201 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_70 | _T_53[2] & _T_91 | _T_53[1] & _T_127 | _T_53[0] & _T_199; // @[Misc.scala 214:29]
  wire  _T_202 = _T_57 & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] & auto_in_a_bits_address[1] & _T_159; // @[Misc.scala 213:27]
  wire  _T_204 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_70 | _T_53[2] & _T_91 | _T_53[1] & _T_130 | _T_53[0] & _T_202; // @[Misc.scala 214:29]
  wire  _T_205 = _T_57 & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] & auto_in_a_bits_address[1] &
    auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_207 = _T_54 | _T_53[4] & _T_57 | _T_53[3] & _T_70 | _T_53[2] & _T_91 | _T_53[1] & _T_130 | _T_53[0] & _T_205; // @[Misc.scala 214:29]
  wire  _T_208 = auto_in_a_bits_address[4] & _T_66 & _T_81 & _T_108 & _T_159; // @[Misc.scala 213:27]
  wire  _T_210 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_73 | _T_53[2] & _T_94 | _T_53[1] & _T_133
     | _T_53[0] & _T_208; // @[Misc.scala 214:29]
  wire  _T_211 = auto_in_a_bits_address[4] & _T_66 & _T_81 & _T_108 & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_213 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_73 | _T_53[2] & _T_94 | _T_53[1] & _T_133
     | _T_53[0] & _T_211; // @[Misc.scala 214:29]
  wire  _T_214 = auto_in_a_bits_address[4] & _T_66 & _T_81 & auto_in_a_bits_address[1] & _T_159; // @[Misc.scala 213:27]
  wire  _T_216 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_73 | _T_53[2] & _T_94 | _T_53[1] & _T_136
     | _T_53[0] & _T_214; // @[Misc.scala 214:29]
  wire  _T_217 = auto_in_a_bits_address[4] & _T_66 & _T_81 & auto_in_a_bits_address[1] & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_219 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_73 | _T_53[2] & _T_94 | _T_53[1] & _T_136
     | _T_53[0] & _T_217; // @[Misc.scala 214:29]
  wire  _T_220 = auto_in_a_bits_address[4] & _T_66 & auto_in_a_bits_address[2] & _T_108 & _T_159; // @[Misc.scala 213:27]
  wire  _T_222 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_73 | _T_53[2] & _T_97 | _T_53[1] & _T_139
     | _T_53[0] & _T_220; // @[Misc.scala 214:29]
  wire  _T_223 = auto_in_a_bits_address[4] & _T_66 & auto_in_a_bits_address[2] & _T_108 & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_225 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_73 | _T_53[2] & _T_97 | _T_53[1] & _T_139
     | _T_53[0] & _T_223; // @[Misc.scala 214:29]
  wire  _T_226 = auto_in_a_bits_address[4] & _T_66 & auto_in_a_bits_address[2] & auto_in_a_bits_address[1] & _T_159; // @[Misc.scala 213:27]
  wire  _T_228 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_73 | _T_53[2] & _T_97 | _T_53[1] & _T_142
     | _T_53[0] & _T_226; // @[Misc.scala 214:29]
  wire  _T_229 = auto_in_a_bits_address[4] & _T_66 & auto_in_a_bits_address[2] & auto_in_a_bits_address[1] &
    auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_231 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_73 | _T_53[2] & _T_97 | _T_53[1] & _T_142
     | _T_53[0] & _T_229; // @[Misc.scala 214:29]
  wire  _T_232 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & _T_81 & _T_108 & _T_159; // @[Misc.scala 213:27]
  wire  _T_234 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_76 | _T_53[2] & _T_100 | _T_53[1] & _T_145
     | _T_53[0] & _T_232; // @[Misc.scala 214:29]
  wire  _T_235 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & _T_81 & _T_108 & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_237 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_76 | _T_53[2] & _T_100 | _T_53[1] & _T_145
     | _T_53[0] & _T_235; // @[Misc.scala 214:29]
  wire  _T_238 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & _T_81 & auto_in_a_bits_address[1] & _T_159; // @[Misc.scala 213:27]
  wire  _T_240 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_76 | _T_53[2] & _T_100 | _T_53[1] & _T_148
     | _T_53[0] & _T_238; // @[Misc.scala 214:29]
  wire  _T_241 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & _T_81 & auto_in_a_bits_address[1] &
    auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_243 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_76 | _T_53[2] & _T_100 | _T_53[1] & _T_148
     | _T_53[0] & _T_241; // @[Misc.scala 214:29]
  wire  _T_244 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] & _T_108 & _T_159; // @[Misc.scala 213:27]
  wire  _T_246 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_76 | _T_53[2] & _T_103 | _T_53[1] & _T_151
     | _T_53[0] & _T_244; // @[Misc.scala 214:29]
  wire  _T_247 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] & _T_108 &
    auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_249 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_76 | _T_53[2] & _T_103 | _T_53[1] & _T_151
     | _T_53[0] & _T_247; // @[Misc.scala 214:29]
  wire  _T_250 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] &
    auto_in_a_bits_address[1] & _T_159; // @[Misc.scala 213:27]
  wire  _T_252 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_76 | _T_53[2] & _T_103 | _T_53[1] & _T_154
     | _T_53[0] & _T_250; // @[Misc.scala 214:29]
  wire  _T_253 = auto_in_a_bits_address[4] & auto_in_a_bits_address[3] & auto_in_a_bits_address[2] &
    auto_in_a_bits_address[1] & auto_in_a_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_255 = _T_54 | _T_53[4] & auto_in_a_bits_address[4] | _T_53[3] & _T_76 | _T_53[2] & _T_103 | _T_53[1] & _T_154
     | _T_53[0] & _T_253; // @[Misc.scala 214:29]
  wire [7:0] lo_lo = {_T_183,_T_180,_T_177,_T_174,_T_171,_T_168,_T_165,_T_162}; // @[Cat.scala 30:58]
  wire [15:0] lo_1 = {_T_207,_T_204,_T_201,_T_198,_T_195,_T_192,_T_189,_T_186,lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] hi_lo = {_T_231,_T_228,_T_225,_T_222,_T_219,_T_216,_T_213,_T_210}; // @[Cat.scala 30:58]
  wire [31:0] _T_256 = {_T_255,_T_252,_T_249,_T_246,_T_243,_T_240,_T_237,_T_234,hi_lo,lo_1}; // @[Cat.scala 30:58]
  reg  REG_4; // @[WidthWidget.scala 56:41]
  wire  _T_258 = _T_14 | ~REG_4; // @[WidthWidget.scala 57:42]
  wire  _T_260 = _T_18 | ~REG_4; // @[WidthWidget.scala 57:42]
  wire  _T_262 = _T_22 | ~REG_4; // @[WidthWidget.scala 57:42]
  reg [7:0] REG_5_0; // @[WidthWidget.scala 60:24]
  reg [7:0] REG_5_1; // @[WidthWidget.scala 60:24]
  reg [7:0] REG_5_2; // @[WidthWidget.scala 60:24]
  wire [7:0] _T_265 = _T_258 ? auto_in_a_bits_mask : REG_5_0; // @[WidthWidget.scala 62:88]
  wire [7:0] _T_266 = _T_260 ? auto_in_a_bits_mask : REG_5_1; // @[WidthWidget.scala 62:88]
  wire [7:0] _T_267 = _T_262 ? auto_in_a_bits_mask : REG_5_2; // @[WidthWidget.scala 62:88]
  wire  _GEN_8 = _T_28 & _T_31 | REG_4; // @[WidthWidget.scala 63:35 64:30 56:41]
  wire [31:0] _T_272 = {auto_in_a_bits_mask,_T_267,_T_266,_T_265}; // @[Cat.scala 30:58]
  wire [31:0] _T_274 = _T_1 ? _T_272 : 32'hffffffff; // @[WidthWidget.scala 79:93]
  wire [255:0] _T_278 = {Repeater_io_deq_bits_data[255:64],auto_out_d_bits_data[63:0]}; // @[Cat.scala 30:58]
  wire [2:0] _WIRE_11_bits_opcode = Repeater_io_deq_bits_opcode; // @[WidthWidget.scala 155:25 156:15]
  wire [2:0] _WIRE_11_bits_size = Repeater_io_deq_bits_size; // @[WidthWidget.scala 155:25 156:15]
  wire [11:0] _T_281 = 12'h1f << _WIRE_11_bits_size; // @[package.scala 234:77]
  wire [4:0] _T_283 = ~_T_281[4:0]; // @[package.scala 234:46]
  reg [1:0] REG_6; // @[WidthWidget.scala 99:26]
  wire  _T_285 = REG_6 == 2'h0; // @[WidthWidget.scala 100:25]
  wire  _T_288 = REG_6 == _T_283[4:3] | ~_WIRE_11_bits_opcode[0]; // @[WidthWidget.scala 101:35]
  wire  _WIRE_11_valid = Repeater_io_deq_valid; // @[WidthWidget.scala 155:25 156:15]
  wire  _T_289 = auto_in_d_ready & _WIRE_11_valid; // @[Decoupled.scala 40:37]
  wire [1:0] _T_291 = REG_6 + 2'h1; // @[WidthWidget.scala 104:24]
  reg [1:0] REG_7_0; // @[WidthWidget.scala 180:27]
  reg [1:0] REG_7_1; // @[WidthWidget.scala 180:27]
  wire  _WIRE_11_bits_source = Repeater_io_deq_bits_source; // @[WidthWidget.scala 155:25 156:15]
  reg [1:0] r; // @[Reg.scala 15:16]
  wire [1:0] _GEN_19 = _WIRE_11_bits_source ? REG_7_1 : REG_7_0; // @[Reg.scala 16:{23,23}]
  wire [1:0] _GEN_20 = _T_285 ? _GEN_19 : r; // @[Reg.scala 15:16 16:{19,23}]
  wire [1:0] _T_297 = ~_T_283[4:3]; // @[WidthWidget.scala 116:18]
  wire [1:0] _T_298 = _GEN_20 & _T_297; // @[WidthWidget.scala 116:16]
  wire [1:0] _T_299 = _T_298 | REG_6; // @[WidthWidget.scala 120:24]
  wire [63:0] _GEN_22 = 2'h1 == _T_299 ? _T_278[127:64] : _T_278[63:0]; // @[WidthWidget.scala 131:{30,30}]
  wire [63:0] _GEN_23 = 2'h2 == _T_299 ? _T_278[191:128] : _GEN_22; // @[WidthWidget.scala 131:{30,30}]
  Repeater Repeater ( // @[Repeater.scala 35:26]
    .clock(Repeater_clock),
    .reset(Repeater_reset),
    .io_repeat(Repeater_io_repeat),
    .io_enq_ready(Repeater_io_enq_ready),
    .io_enq_valid(Repeater_io_enq_valid),
    .io_enq_bits_opcode(Repeater_io_enq_bits_opcode),
    .io_enq_bits_size(Repeater_io_enq_bits_size),
    .io_enq_bits_source(Repeater_io_enq_bits_source),
    .io_enq_bits_data(Repeater_io_enq_bits_data),
    .io_deq_ready(Repeater_io_deq_ready),
    .io_deq_valid(Repeater_io_deq_valid),
    .io_deq_bits_opcode(Repeater_io_deq_bits_opcode),
    .io_deq_bits_size(Repeater_io_deq_bits_size),
    .io_deq_bits_source(Repeater_io_deq_bits_source),
    .io_deq_bits_data(Repeater_io_deq_bits_data)
  );
  assign auto_in_a_ready = auto_out_a_ready | ~_T_10; // @[WidthWidget.scala 70:29]
  assign auto_in_d_valid = Repeater_io_deq_valid; // @[WidthWidget.scala 155:25 156:15]
  assign auto_in_d_bits_opcode = Repeater_io_deq_bits_opcode; // @[WidthWidget.scala 155:25 156:15]
  assign auto_in_d_bits_size = Repeater_io_deq_bits_size; // @[WidthWidget.scala 155:25 156:15]
  assign auto_in_d_bits_source = Repeater_io_deq_bits_source; // @[WidthWidget.scala 155:25 156:15]
  assign auto_in_d_bits_data = 2'h3 == _T_299 ? _T_278[255:192] : _GEN_23; // @[WidthWidget.scala 131:{30,30}]
  assign auto_out_a_valid = auto_in_a_valid & _T_10; // @[WidthWidget.scala 71:29]
  assign auto_out_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_mask = _T_256 & _T_274; // @[WidthWidget.scala 79:88]
  assign auto_out_a_bits_data = {hi,lo}; // @[Cat.scala 30:58]
  assign auto_out_d_ready = Repeater_io_enq_ready; // @[Nodes.scala 1207:84 Repeater.scala 37:21]
  assign Repeater_clock = clock;
  assign Repeater_reset = reset;
  assign Repeater_io_repeat = ~_T_288; // @[WidthWidget.scala 142:7]
  assign Repeater_io_enq_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign Repeater_io_enq_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign Repeater_io_enq_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign Repeater_io_enq_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign Repeater_io_enq_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign Repeater_io_deq_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  always @(posedge clock) begin
    if (reset) begin // @[WidthWidget.scala 34:27]
      REG <= 2'h0; // @[WidthWidget.scala 34:27]
    end else if (_T_28) begin // @[WidthWidget.scala 43:24]
      if (_T_10) begin // @[WidthWidget.scala 46:21]
        REG <= 2'h0; // @[WidthWidget.scala 47:17]
      end else begin
        REG <= _T_30; // @[WidthWidget.scala 44:15]
      end
    end
    if (reset) begin // @[WidthWidget.scala 56:41]
      REG_2 <= 1'h0; // @[WidthWidget.scala 56:41]
    end else begin
      REG_2 <= _GEN_4;
    end
    if (_T_28 & _T_31) begin // @[WidthWidget.scala 63:35]
      if (_T_35) begin // @[WidthWidget.scala 62:88]
        REG_3_0 <= auto_in_a_bits_data;
      end
    end
    if (_T_28 & _T_31) begin // @[WidthWidget.scala 63:35]
      if (_T_37) begin // @[WidthWidget.scala 62:88]
        REG_3_1 <= auto_in_a_bits_data;
      end
    end
    if (_T_28 & _T_31) begin // @[WidthWidget.scala 63:35]
      if (_T_39) begin // @[WidthWidget.scala 62:88]
        REG_3_2 <= auto_in_a_bits_data;
      end
    end
    if (reset) begin // @[WidthWidget.scala 56:41]
      REG_4 <= 1'h0; // @[WidthWidget.scala 56:41]
    end else begin
      REG_4 <= _GEN_8;
    end
    if (_T_28 & _T_31) begin // @[WidthWidget.scala 63:35]
      if (_T_258) begin // @[WidthWidget.scala 62:88]
        REG_5_0 <= auto_in_a_bits_mask;
      end
    end
    if (_T_28 & _T_31) begin // @[WidthWidget.scala 63:35]
      if (_T_260) begin // @[WidthWidget.scala 62:88]
        REG_5_1 <= auto_in_a_bits_mask;
      end
    end
    if (_T_28 & _T_31) begin // @[WidthWidget.scala 63:35]
      if (_T_262) begin // @[WidthWidget.scala 62:88]
        REG_5_2 <= auto_in_a_bits_mask;
      end
    end
    if (reset) begin // @[WidthWidget.scala 99:26]
      REG_6 <= 2'h0; // @[WidthWidget.scala 99:26]
    end else if (_T_289) begin // @[WidthWidget.scala 103:25]
      if (_T_288) begin // @[WidthWidget.scala 105:21]
        REG_6 <= 2'h0; // @[WidthWidget.scala 105:29]
      end else begin
        REG_6 <= _T_291; // @[WidthWidget.scala 104:15]
      end
    end
    if (_T_28) begin // @[WidthWidget.scala 182:28]
      if (~auto_in_a_bits_source) begin // @[WidthWidget.scala 183:37]
        REG_7_0 <= auto_in_a_bits_address[4:3]; // @[WidthWidget.scala 183:37]
      end
    end
    if (_T_28) begin // @[WidthWidget.scala 182:28]
      if (auto_in_a_bits_source) begin // @[WidthWidget.scala 183:37]
        REG_7_1 <= auto_in_a_bits_address[4:3]; // @[WidthWidget.scala 183:37]
      end
    end
    if (_T_285) begin // @[Reg.scala 16:19]
      if (_WIRE_11_bits_source) begin // @[Reg.scala 16:23]
        r <= REG_7_1; // @[Reg.scala 16:23]
      end else begin
        r <= REG_7_0;
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
  REG = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  REG_2 = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  REG_3_0 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  REG_3_1 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  REG_3_2 = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  REG_4 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  REG_5_0 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  REG_5_1 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  REG_5_2 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  REG_6 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  REG_7_0 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  REG_7_1 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  r = _RAND_12[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule