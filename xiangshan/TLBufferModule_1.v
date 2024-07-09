`include "Queue_2.v"
`include "Queue_3.v"

module TLBufferModule_1(
  input          clock,
  input          reset,
  output         io_in_a_ready,
  input          io_in_a_valid,
  input  [2:0]   io_in_a_bits_opcode,
  input  [2:0]   io_in_a_bits_size,
  input  [5:0]   io_in_a_bits_source,
  input  [35:0]  io_in_a_bits_address,
  input  [31:0]  io_in_a_bits_mask,
  input  [255:0] io_in_a_bits_data,
  input          io_in_d_ready,
  output         io_in_d_valid,
  output [2:0]   io_in_d_bits_opcode,
  output [1:0]   io_in_d_bits_param,
  output [2:0]   io_in_d_bits_size,
  output [5:0]   io_in_d_bits_source,
  output         io_in_d_bits_denied,
  output [255:0] io_in_d_bits_data,
  input          io_out_a_ready,
  output         io_out_a_valid,
  output [2:0]   io_out_a_bits_opcode,
  output [2:0]   io_out_a_bits_size,
  output [5:0]   io_out_a_bits_source,
  output [35:0]  io_out_a_bits_address,
  output [31:0]  io_out_a_bits_mask,
  output [255:0] io_out_a_bits_data,
  output         io_out_d_ready,
  input          io_out_d_valid,
  input  [2:0]   io_out_d_bits_opcode,
  input  [1:0]   io_out_d_bits_param,
  input  [2:0]   io_out_d_bits_size,
  input  [5:0]   io_out_d_bits_source,
  input          io_out_d_bits_denied,
  input  [255:0] io_out_d_bits_data
);
  wire  q_clock; // @[Decoupled.scala 320:21]
  wire  q_reset; // @[Decoupled.scala 320:21]
  wire  q_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire [5:0] q_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire [35:0] q_io_enq_bits_address; // @[Decoupled.scala 320:21]
  wire [31:0] q_io_enq_bits_mask; // @[Decoupled.scala 320:21]
  wire [255:0] q_io_enq_bits_data; // @[Decoupled.scala 320:21]
  wire  q_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire [5:0] q_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire [35:0] q_io_deq_bits_address; // @[Decoupled.scala 320:21]
  wire [31:0] q_io_deq_bits_mask; // @[Decoupled.scala 320:21]
  wire [255:0] q_io_deq_bits_data; // @[Decoupled.scala 320:21]
  wire  q_1_clock; // @[Decoupled.scala 320:21]
  wire  q_1_reset; // @[Decoupled.scala 320:21]
  wire  q_1_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_1_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [1:0] q_1_io_enq_bits_param; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire [5:0] q_1_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_1_io_enq_bits_denied; // @[Decoupled.scala 320:21]
  wire [255:0] q_1_io_enq_bits_data; // @[Decoupled.scala 320:21]
  wire  q_1_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_1_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [1:0] q_1_io_deq_bits_param; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire [5:0] q_1_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_1_io_deq_bits_denied; // @[Decoupled.scala 320:21]
  wire [255:0] q_1_io_deq_bits_data; // @[Decoupled.scala 320:21]
  Queue_2 q ( // @[Decoupled.scala 320:21]
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
  Queue_3 q_1 ( // @[Decoupled.scala 320:21]
    .clock(q_1_clock),
    .reset(q_1_reset),
    .io_enq_ready(q_1_io_enq_ready),
    .io_enq_valid(q_1_io_enq_valid),
    .io_enq_bits_opcode(q_1_io_enq_bits_opcode),
    .io_enq_bits_param(q_1_io_enq_bits_param),
    .io_enq_bits_size(q_1_io_enq_bits_size),
    .io_enq_bits_source(q_1_io_enq_bits_source),
    .io_enq_bits_denied(q_1_io_enq_bits_denied),
    .io_enq_bits_data(q_1_io_enq_bits_data),
    .io_deq_ready(q_1_io_deq_ready),
    .io_deq_valid(q_1_io_deq_valid),
    .io_deq_bits_opcode(q_1_io_deq_bits_opcode),
    .io_deq_bits_param(q_1_io_deq_bits_param),
    .io_deq_bits_size(q_1_io_deq_bits_size),
    .io_deq_bits_source(q_1_io_deq_bits_source),
    .io_deq_bits_denied(q_1_io_deq_bits_denied),
    .io_deq_bits_data(q_1_io_deq_bits_data)
  );
  assign io_in_a_ready = q_io_enq_ready; // @[Decoupled.scala 323:17]
  assign io_in_d_valid = q_1_io_deq_valid; // @[TLEdgeBuffer.scala 63:11]
  assign io_in_d_bits_opcode = q_1_io_deq_bits_opcode; // @[TLEdgeBuffer.scala 63:11]
  assign io_in_d_bits_param = q_1_io_deq_bits_param; // @[TLEdgeBuffer.scala 63:11]
  assign io_in_d_bits_size = q_1_io_deq_bits_size; // @[TLEdgeBuffer.scala 63:11]
  assign io_in_d_bits_source = q_1_io_deq_bits_source; // @[TLEdgeBuffer.scala 63:11]
  assign io_in_d_bits_denied = q_1_io_deq_bits_denied; // @[TLEdgeBuffer.scala 63:11]
  assign io_in_d_bits_data = q_1_io_deq_bits_data; // @[TLEdgeBuffer.scala 63:11]
  assign io_out_a_valid = q_io_deq_valid; // @[TLEdgeBuffer.scala 62:12]
  assign io_out_a_bits_opcode = q_io_deq_bits_opcode; // @[TLEdgeBuffer.scala 62:12]
  assign io_out_a_bits_size = q_io_deq_bits_size; // @[TLEdgeBuffer.scala 62:12]
  assign io_out_a_bits_source = q_io_deq_bits_source; // @[TLEdgeBuffer.scala 62:12]
  assign io_out_a_bits_address = q_io_deq_bits_address; // @[TLEdgeBuffer.scala 62:12]
  assign io_out_a_bits_mask = q_io_deq_bits_mask; // @[TLEdgeBuffer.scala 62:12]
  assign io_out_a_bits_data = q_io_deq_bits_data; // @[TLEdgeBuffer.scala 62:12]
  assign io_out_d_ready = q_1_io_enq_ready; // @[Decoupled.scala 323:17]
  assign q_clock = clock;
  assign q_reset = reset;
  assign q_io_enq_valid = io_in_a_valid; // @[Decoupled.scala 321:22]
  assign q_io_enq_bits_opcode = io_in_a_bits_opcode; // @[Decoupled.scala 322:21]
  assign q_io_enq_bits_size = io_in_a_bits_size; // @[Decoupled.scala 322:21]
  assign q_io_enq_bits_source = io_in_a_bits_source; // @[Decoupled.scala 322:21]
  assign q_io_enq_bits_address = io_in_a_bits_address; // @[Decoupled.scala 322:21]
  assign q_io_enq_bits_mask = io_in_a_bits_mask; // @[Decoupled.scala 322:21]
  assign q_io_enq_bits_data = io_in_a_bits_data; // @[Decoupled.scala 322:21]
  assign q_io_deq_ready = io_out_a_ready; // @[TLEdgeBuffer.scala 62:12]
  assign q_1_clock = clock;
  assign q_1_reset = reset;
  assign q_1_io_enq_valid = io_out_d_valid; // @[Decoupled.scala 321:22]
  assign q_1_io_enq_bits_opcode = io_out_d_bits_opcode; // @[Decoupled.scala 322:21]
  assign q_1_io_enq_bits_param = io_out_d_bits_param; // @[Decoupled.scala 322:21]
  assign q_1_io_enq_bits_size = io_out_d_bits_size; // @[Decoupled.scala 322:21]
  assign q_1_io_enq_bits_source = io_out_d_bits_source; // @[Decoupled.scala 322:21]
  assign q_1_io_enq_bits_denied = io_out_d_bits_denied; // @[Decoupled.scala 322:21]
  assign q_1_io_enq_bits_data = io_out_d_bits_data; // @[Decoupled.scala 322:21]
  assign q_1_io_deq_ready = io_in_d_ready; // @[TLEdgeBuffer.scala 63:11]
endmodule