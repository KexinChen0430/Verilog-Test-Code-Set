module TLXbar_2(
  input          clock,
  input          reset,
  output         auto_in_1_a_ready,
  input          auto_in_1_a_valid,
  input  [2:0]   auto_in_1_a_bits_opcode,
  input  [2:0]   auto_in_1_a_bits_size,
  input          auto_in_1_a_bits_source,
  input  [35:0]  auto_in_1_a_bits_address,
  input  [31:0]  auto_in_1_a_bits_mask,
  input  [255:0] auto_in_1_a_bits_data,
  input          auto_in_1_d_ready,
  output         auto_in_1_d_valid,
  output [2:0]   auto_in_1_d_bits_opcode,
  output [2:0]   auto_in_1_d_bits_size,
  output         auto_in_1_d_bits_source,
  output [255:0] auto_in_1_d_bits_data,
  output         auto_in_0_a_ready,
  input          auto_in_0_a_valid,
  input  [2:0]   auto_in_0_a_bits_opcode,
  input  [2:0]   auto_in_0_a_bits_size,
  input  [7:0]   auto_in_0_a_bits_source,
  input  [35:0]  auto_in_0_a_bits_address,
  input  [31:0]  auto_in_0_a_bits_mask,
  input  [255:0] auto_in_0_a_bits_data,
  input          auto_in_0_d_ready,
  output         auto_in_0_d_valid,
  output [2:0]   auto_in_0_d_bits_opcode,
  output [1:0]   auto_in_0_d_bits_param,
  output [2:0]   auto_in_0_d_bits_size,
  output [7:0]   auto_in_0_d_bits_source,
  output         auto_in_0_d_bits_denied,
  output [255:0] auto_in_0_d_bits_data,
  input          auto_out_a_ready,
  output         auto_out_a_valid,
  output [2:0]   auto_out_a_bits_opcode,
  output [2:0]   auto_out_a_bits_size,
  output [8:0]   auto_out_a_bits_source,
  output [35:0]  auto_out_a_bits_address,
  output [31:0]  auto_out_a_bits_mask,
  output [255:0] auto_out_a_bits_data,
  output         auto_out_d_ready,
  input          auto_out_d_valid,
  input  [2:0]   auto_out_d_bits_opcode,
  input  [1:0]   auto_out_d_bits_param,
  input  [2:0]   auto_out_d_bits_size,
  input  [8:0]   auto_out_d_bits_source,
  input          auto_out_d_bits_denied,
  input  [255:0] auto_out_d_bits_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire [8:0] _GEN_1 = {{8'd0}, auto_in_1_a_bits_source}; // @[Xbar.scala 237:55]
  wire [8:0] _T_2 = _GEN_1 | 9'h100; // @[Xbar.scala 237:55]
  wire  _T_48 = ~auto_out_d_bits_source[8]; // @[Parameters.scala 54:32]
  wire  _T_56 = auto_out_d_bits_source[8:1] == 8'h80; // @[Parameters.scala 54:32]
  wire [12:0] _T_62 = 13'h3f << auto_in_0_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_64 = ~_T_62[5:0]; // @[package.scala 234:46]
  wire  _T_67 = ~auto_in_0_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire  _T_68 = _T_67 & _T_64[5]; // @[Edges.scala 220:14]
  wire [12:0] _T_70 = 13'h3f << auto_in_1_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_72 = ~_T_70[5:0]; // @[package.scala 234:46]
  wire  _T_75 = ~auto_in_1_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire  _T_76 = _T_75 & _T_72[5]; // @[Edges.scala 220:14]
  reg  REG; // @[Arbiter.scala 87:30]
  wire  _T_132 = ~REG; // @[Arbiter.scala 88:28]
  wire  _T_133 = _T_132 & auto_out_a_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _T_138 = {auto_in_1_a_valid,auto_in_0_a_valid}; // @[Cat.scala 30:58]
  reg [1:0] REG_1; // @[Arbiter.scala 23:23]
  wire [1:0] _T_144 = ~REG_1; // @[Arbiter.scala 24:30]
  wire [1:0] _T_145 = _T_138 & _T_144; // @[Arbiter.scala 24:28]
  wire [3:0] _T_146 = {_T_145,auto_in_1_a_valid,auto_in_0_a_valid}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_2 = {{1'd0}, _T_146[3:1]}; // @[package.scala 253:43]
  wire [3:0] _T_148 = _T_146 | _GEN_2; // @[package.scala 253:43]
  wire [3:0] _T_151 = {REG_1, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_3 = {{1'd0}, _T_148[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] _T_152 = _GEN_3 | _T_151; // @[Arbiter.scala 25:58]
  wire [1:0] _T_155 = _T_152[3:2] & _T_152[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] _T_156 = ~_T_155; // @[Arbiter.scala 26:18]
  wire [1:0] _T_159 = _T_156 & _T_138; // @[Arbiter.scala 28:29]
  wire [2:0] _T_160 = {_T_159, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_162 = _T_159 | _T_160[1:0]; // @[package.scala 244:43]
  wire  _T_167 = _T_156[0] & auto_in_0_a_valid; // @[Arbiter.scala 97:79]
  wire  _T_168 = _T_156[1] & auto_in_1_a_valid; // @[Arbiter.scala 97:79]
  wire  _T_183 = auto_in_0_a_valid | auto_in_1_a_valid; // @[Arbiter.scala 107:36]
  wire  _T_197 = _T_167 & _T_68; // @[Arbiter.scala 111:73]
  wire  _T_198 = _T_168 & _T_76; // @[Arbiter.scala 111:73]
  wire  _T_199 = _T_197 | _T_198; // @[Arbiter.scala 112:44]
  reg  REG_2_0; // @[Arbiter.scala 116:26]
  wire  _T_206_0 = _T_132 ? _T_167 : REG_2_0; // @[Arbiter.scala 117:30]
  reg  REG_2_1; // @[Arbiter.scala 116:26]
  wire  _T_206_1 = _T_132 ? _T_168 : REG_2_1; // @[Arbiter.scala 117:30]
  wire  _T_214 = REG_2_0 & auto_in_0_a_valid | REG_2_1 & auto_in_1_a_valid; // @[Mux.scala 27:72]
  wire  _T_215 = _T_132 ? _T_183 : _T_214; // @[Arbiter.scala 125:29]
  wire  _T_202 = auto_out_a_ready & _T_215; // @[ReadyValidCancel.scala 50:33]
  wire  _T_208_0 = _T_132 ? _T_156[0] : REG_2_0; // @[Arbiter.scala 121:24]
  wire  _T_208_1 = _T_132 ? _T_156[1] : REG_2_1; // @[Arbiter.scala 121:24]
  wire [255:0] _T_222 = _T_206_0 ? auto_in_0_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_223 = _T_206_1 ? auto_in_1_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_225 = _T_206_0 ? auto_in_0_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_226 = _T_206_1 ? auto_in_1_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_228 = _T_206_0 ? auto_in_0_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_229 = _T_206_1 ? auto_in_1_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [8:0] _WIRE_12_0_a_bits_source = {{1'd0}, auto_in_0_a_bits_source}; // @[Xbar.scala 231:18 237:29]
  wire [8:0] _T_231 = _T_206_0 ? _WIRE_12_0_a_bits_source : 9'h0; // @[Mux.scala 27:72]
  wire [8:0] _T_232 = _T_206_1 ? _T_2 : 9'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_234 = _T_206_0 ? auto_in_0_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_235 = _T_206_1 ? auto_in_1_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_240 = _T_206_0 ? auto_in_0_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_241 = _T_206_1 ? auto_in_1_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  assign auto_in_1_a_ready = auto_out_a_ready & _T_208_1; // @[Arbiter.scala 123:31]
  assign auto_in_1_d_valid = auto_out_d_valid & _T_56; // @[Xbar.scala 179:40]
  assign auto_in_1_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_source = auto_out_d_bits_source[0]; // @[Xbar.scala 228:69]
  assign auto_in_1_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_a_ready = auto_out_a_ready & _T_208_0; // @[Arbiter.scala 123:31]
  assign auto_in_0_d_valid = auto_out_d_valid & _T_48; // @[Xbar.scala 179:40]
  assign auto_in_0_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_source = auto_out_d_bits_source[7:0]; // @[Xbar.scala 228:69]
  assign auto_in_0_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_out_a_valid = _T_132 ? _T_183 : _T_214; // @[Arbiter.scala 125:29]
  assign auto_out_a_bits_opcode = _T_240 | _T_241; // @[Mux.scala 27:72]
  assign auto_out_a_bits_size = _T_234 | _T_235; // @[Mux.scala 27:72]
  assign auto_out_a_bits_source = _T_231 | _T_232; // @[Mux.scala 27:72]
  assign auto_out_a_bits_address = _T_228 | _T_229; // @[Mux.scala 27:72]
  assign auto_out_a_bits_mask = _T_225 | _T_226; // @[Mux.scala 27:72]
  assign auto_out_a_bits_data = _T_222 | _T_223; // @[Mux.scala 27:72]
  assign auto_out_d_ready = _T_48 & auto_in_0_d_ready | _T_56 & auto_in_1_d_ready; // @[Mux.scala 27:72]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiter.scala 87:30]
      REG <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_133) begin // @[Arbiter.scala 113:23]
      REG <= _T_199;
    end else begin
      REG <= REG - _T_202;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      REG_1 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (_T_133 & |_T_138) begin // @[Arbiter.scala 27:32]
      REG_1 <= _T_162; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_132) begin // @[Arbiter.scala 117:30]
      REG_2_0 <= _T_167;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_132) begin // @[Arbiter.scala 117:30]
      REG_2_1 <= _T_168;
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
  REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  REG_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  REG_2_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG_2_1 = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule