`include "Queue_12.v"
`include "Queue_13.v"

module TLBuffer(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_size,
  input         auto_in_a_bits_source,
  input  [35:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [2:0]  auto_in_d_bits_size,
  output        auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_size,
  output        auto_out_a_bits_source,
  output [35:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [2:0]  auto_out_d_bits_size,
  input         auto_out_d_bits_source,
  input  [63:0] auto_out_d_bits_data
);
  wire  q_clock; // @[Decoupled.scala 320:21]
  wire  q_reset; // @[Decoupled.scala 320:21]
  wire  q_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire  q_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire [35:0] q_io_enq_bits_address; // @[Decoupled.scala 320:21]
  wire [7:0] q_io_enq_bits_mask; // @[Decoupled.scala 320:21]
  wire [63:0] q_io_enq_bits_data; // @[Decoupled.scala 320:21]
  wire  q_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire  q_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire [35:0] q_io_deq_bits_address; // @[Decoupled.scala 320:21]
  wire [7:0] q_io_deq_bits_mask; // @[Decoupled.scala 320:21]
  wire [63:0] q_io_deq_bits_data; // @[Decoupled.scala 320:21]
  wire  q_1_clock; // @[Decoupled.scala 320:21]
  wire  q_1_reset; // @[Decoupled.scala 320:21]
  wire  q_1_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_1_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire  q_1_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire [63:0] q_1_io_enq_bits_data; // @[Decoupled.scala 320:21]
  wire  q_1_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_1_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire  q_1_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire [63:0] q_1_io_deq_bits_data; // @[Decoupled.scala 320:21]
  Queue_12 q ( // @[Decoupled.scala 320:21]
    .clock(q_clock),
    .reset(q_reset),
    .io_enq_ready(q_io_enq_ready),
    .io_enq_valid(q_io_enq_valid),
    .io_enq_bits_opcode(q_io_enq_bits_opcode),
    .io_enq_bits_size(q_io_enq_bits_size),
    .io_enq_bits_source(q_io_enq_bits_source),
    .io_enq_bits_address(q_io_enq_bits_address),
    .io_enq_bits_mask(q_io_enq_bits_mask),
    .io_enq_bits_data(q_io_enq_bits_data),
    .io_deq_ready(q_io_deq_ready),
    .io_deq_valid(q_io_deq_valid),
    .io_deq_bits_opcode(q_io_deq_bits_opcode),
    .io_deq_bits_size(q_io_deq_bits_size),
    .io_deq_bits_source(q_io_deq_bits_source),
    .io_deq_bits_address(q_io_deq_bits_address),
    .io_deq_bits_mask(q_io_deq_bits_mask),
    .io_deq_bits_data(q_io_deq_bits_data)
  );
  Queue_13 q_1 ( // @[Decoupled.scala 320:21]
    .clock(q_1_clock),
    .reset(q_1_reset),
    .io_enq_ready(q_1_io_enq_ready),
    .io_enq_valid(q_1_io_enq_valid),
    .io_enq_bits_opcode(q_1_io_enq_bits_opcode),
    .io_enq_bits_size(q_1_io_enq_bits_size),
    .io_enq_bits_source(q_1_io_enq_bits_source),
    .io_enq_bits_data(q_1_io_enq_bits_data),
    .io_deq_ready(q_1_io_deq_ready),
    .io_deq_valid(q_1_io_deq_valid),
    .io_deq_bits_opcode(q_1_io_deq_bits_opcode),
    .io_deq_bits_size(q_1_io_deq_bits_size),
    .io_deq_bits_source(q_1_io_deq_bits_source),
    .io_deq_bits_data(q_1_io_deq_bits_data)
  );
  assign auto_in_a_ready = q_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 323:17]
  assign auto_in_d_valid = q_1_io_deq_valid; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_opcode = q_1_io_deq_bits_opcode; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_size = q_1_io_deq_bits_size; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_source = q_1_io_deq_bits_source; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_data = q_1_io_deq_bits_data; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_out_a_valid = q_io_deq_valid; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_opcode = q_io_deq_bits_opcode; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_size = q_io_deq_bits_size; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_source = q_io_deq_bits_source; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_address = q_io_deq_bits_address; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_mask = q_io_deq_bits_mask; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_data = q_io_deq_bits_data; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_d_ready = q_1_io_enq_ready; // @[Nodes.scala 1207:84 Decoupled.scala 323:17]
  assign q_clock = clock;
  assign q_reset = reset;
  assign q_io_enq_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_io_enq_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_io_enq_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_io_enq_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_io_enq_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_io_enq_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_io_enq_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_io_deq_ready = auto_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign q_1_clock = clock;
  assign q_1_reset = reset;
  assign q_1_io_enq_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign q_1_io_enq_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign q_1_io_enq_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign q_1_io_enq_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign q_1_io_enq_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign q_1_io_deq_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule