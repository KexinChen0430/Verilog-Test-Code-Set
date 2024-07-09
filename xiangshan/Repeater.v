module Repeater(
  input          clock,
  input          reset,
  input          io_repeat,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [2:0]   io_enq_bits_opcode,
  input  [2:0]   io_enq_bits_size,
  input          io_enq_bits_source,
  input  [255:0] io_enq_bits_data,
  input          io_deq_ready,
  output         io_deq_valid,
  output [2:0]   io_deq_bits_opcode,
  output [2:0]   io_deq_bits_size,
  output         io_deq_bits_source,
  output [255:0] io_deq_bits_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [255:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  full; // @[Repeater.scala 19:21]
  reg [2:0] saved_opcode; // @[Repeater.scala 20:18]
  reg [2:0] saved_size; // @[Repeater.scala 20:18]
  reg  saved_source; // @[Repeater.scala 20:18]
  reg [255:0] saved_data; // @[Repeater.scala 20:18]
  wire  _T_4 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_0 = _T_4 & io_repeat | full; // @[Repeater.scala 19:21 28:{38,45}]
  wire  _T_6 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  assign io_enq_ready = io_deq_ready & ~full; // @[Repeater.scala 24:32]
  assign io_deq_valid = io_enq_valid | full; // @[Repeater.scala 23:32]
  assign io_deq_bits_opcode = full ? saved_opcode : io_enq_bits_opcode; // @[Repeater.scala 25:21]
  assign io_deq_bits_size = full ? saved_size : io_enq_bits_size; // @[Repeater.scala 25:21]
  assign io_deq_bits_source = full ? saved_source : io_enq_bits_source; // @[Repeater.scala 25:21]
  assign io_deq_bits_data = full ? saved_data : io_enq_bits_data; // @[Repeater.scala 25:21]
  always @(posedge clock) begin
    if (reset) begin // @[Repeater.scala 19:21]
      full <= 1'h0; // @[Repeater.scala 19:21]
    end else if (_T_6 & ~io_repeat) begin // @[Repeater.scala 29:38]
      full <= 1'h0; // @[Repeater.scala 29:45]
    end else begin
      full <= _GEN_0;
    end
    if (_T_4 & io_repeat) begin // @[Repeater.scala 28:38]
      saved_opcode <= io_enq_bits_opcode; // @[Repeater.scala 28:62]
    end
    if (_T_4 & io_repeat) begin // @[Repeater.scala 28:38]
      saved_size <= io_enq_bits_size; // @[Repeater.scala 28:62]
    end
    if (_T_4 & io_repeat) begin // @[Repeater.scala 28:38]
      saved_source <= io_enq_bits_source; // @[Repeater.scala 28:62]
    end
    if (_T_4 & io_repeat) begin // @[Repeater.scala 28:38]
      saved_data <= io_enq_bits_data; // @[Repeater.scala 28:62]
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
  full = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  saved_opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  saved_size = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  saved_source = _RAND_3[0:0];
  _RAND_4 = {8{`RANDOM}};
  saved_data = _RAND_4[255:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule