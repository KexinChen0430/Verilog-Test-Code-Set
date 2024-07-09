`include "XbarCircuit_2.v"

module BinaryArbiter(
  input          clock,
  input          reset,
  output         auto_in_3_a_ready,
  input          auto_in_3_a_valid,
  input  [2:0]   auto_in_3_a_bits_opcode,
  input  [2:0]   auto_in_3_a_bits_size,
  input  [5:0]   auto_in_3_a_bits_source,
  input  [35:0]  auto_in_3_a_bits_address,
  input  [31:0]  auto_in_3_a_bits_mask,
  input  [255:0] auto_in_3_a_bits_data,
  input          auto_in_3_d_ready,
  output         auto_in_3_d_valid,
  output [2:0]   auto_in_3_d_bits_opcode,
  output [1:0]   auto_in_3_d_bits_param,
  output [2:0]   auto_in_3_d_bits_size,
  output [5:0]   auto_in_3_d_bits_source,
  output         auto_in_3_d_bits_denied,
  output [255:0] auto_in_3_d_bits_data,
  output         auto_in_2_a_ready,
  input          auto_in_2_a_valid,
  input  [2:0]   auto_in_2_a_bits_opcode,
  input  [2:0]   auto_in_2_a_bits_size,
  input  [5:0]   auto_in_2_a_bits_source,
  input  [35:0]  auto_in_2_a_bits_address,
  input  [31:0]  auto_in_2_a_bits_mask,
  input  [255:0] auto_in_2_a_bits_data,
  input          auto_in_2_d_ready,
  output         auto_in_2_d_valid,
  output [2:0]   auto_in_2_d_bits_opcode,
  output [1:0]   auto_in_2_d_bits_param,
  output [2:0]   auto_in_2_d_bits_size,
  output [5:0]   auto_in_2_d_bits_source,
  output         auto_in_2_d_bits_denied,
  output [255:0] auto_in_2_d_bits_data,
  output         auto_in_1_a_ready,
  input          auto_in_1_a_valid,
  input  [2:0]   auto_in_1_a_bits_opcode,
  input  [2:0]   auto_in_1_a_bits_size,
  input  [5:0]   auto_in_1_a_bits_source,
  input  [35:0]  auto_in_1_a_bits_address,
  input  [31:0]  auto_in_1_a_bits_mask,
  input  [255:0] auto_in_1_a_bits_data,
  input          auto_in_1_d_ready,
  output         auto_in_1_d_valid,
  output [2:0]   auto_in_1_d_bits_opcode,
  output [1:0]   auto_in_1_d_bits_param,
  output [2:0]   auto_in_1_d_bits_size,
  output [5:0]   auto_in_1_d_bits_source,
  output         auto_in_1_d_bits_denied,
  output [255:0] auto_in_1_d_bits_data,
  output         auto_in_0_a_ready,
  input          auto_in_0_a_valid,
  input  [2:0]   auto_in_0_a_bits_opcode,
  input  [2:0]   auto_in_0_a_bits_size,
  input  [5:0]   auto_in_0_a_bits_source,
  input  [35:0]  auto_in_0_a_bits_address,
  input  [31:0]  auto_in_0_a_bits_mask,
  input  [255:0] auto_in_0_a_bits_data,
  input          auto_in_0_d_ready,
  output         auto_in_0_d_valid,
  output [2:0]   auto_in_0_d_bits_opcode,
  output [1:0]   auto_in_0_d_bits_param,
  output [2:0]   auto_in_0_d_bits_size,
  output [5:0]   auto_in_0_d_bits_source,
  output         auto_in_0_d_bits_denied,
  output [255:0] auto_in_0_d_bits_data,
  input          auto_out_1_a_ready,
  output         auto_out_1_a_valid,
  output [2:0]   auto_out_1_a_bits_opcode,
  output [2:0]   auto_out_1_a_bits_size,
  output [6:0]   auto_out_1_a_bits_source,
  output [35:0]  auto_out_1_a_bits_address,
  output [31:0]  auto_out_1_a_bits_mask,
  output [255:0] auto_out_1_a_bits_data,
  output         auto_out_1_d_ready,
  input          auto_out_1_d_valid,
  input  [2:0]   auto_out_1_d_bits_opcode,
  input  [1:0]   auto_out_1_d_bits_param,
  input  [2:0]   auto_out_1_d_bits_size,
  input  [6:0]   auto_out_1_d_bits_source,
  input          auto_out_1_d_bits_denied,
  input  [255:0] auto_out_1_d_bits_data,
  input          auto_out_0_a_ready,
  output         auto_out_0_a_valid,
  output [2:0]   auto_out_0_a_bits_opcode,
  output [2:0]   auto_out_0_a_bits_size,
  output [6:0]   auto_out_0_a_bits_source,
  output [35:0]  auto_out_0_a_bits_address,
  output [31:0]  auto_out_0_a_bits_mask,
  output [255:0] auto_out_0_a_bits_data,
  output         auto_out_0_d_ready,
  input          auto_out_0_d_valid,
  input  [2:0]   auto_out_0_d_bits_opcode,
  input  [1:0]   auto_out_0_d_bits_param,
  input  [2:0]   auto_out_0_d_bits_size,
  input  [6:0]   auto_out_0_d_bits_source,
  input          auto_out_0_d_bits_denied,
  input  [255:0] auto_out_0_d_bits_data
);
  wire  XbarCircuit_clock; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_reset; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_in_1_a_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_in_1_a_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_in_1_a_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_in_1_a_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [5:0] XbarCircuit_io_in_1_a_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire [35:0] XbarCircuit_io_in_1_a_bits_address; // @[BinaryArbiterNode.scala 94:26]
  wire [31:0] XbarCircuit_io_in_1_a_bits_mask; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_io_in_1_a_bits_data; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_in_1_d_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_in_1_d_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_in_1_d_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [1:0] XbarCircuit_io_in_1_d_bits_param; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_in_1_d_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [5:0] XbarCircuit_io_in_1_d_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_in_1_d_bits_denied; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_io_in_1_d_bits_data; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_in_0_a_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_in_0_a_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_in_0_a_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_in_0_a_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [5:0] XbarCircuit_io_in_0_a_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire [35:0] XbarCircuit_io_in_0_a_bits_address; // @[BinaryArbiterNode.scala 94:26]
  wire [31:0] XbarCircuit_io_in_0_a_bits_mask; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_io_in_0_a_bits_data; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_in_0_d_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_in_0_d_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_in_0_d_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [1:0] XbarCircuit_io_in_0_d_bits_param; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_in_0_d_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [5:0] XbarCircuit_io_in_0_d_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_in_0_d_bits_denied; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_io_in_0_d_bits_data; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_out_0_a_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_out_0_a_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_out_0_a_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_out_0_a_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [6:0] XbarCircuit_io_out_0_a_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire [35:0] XbarCircuit_io_out_0_a_bits_address; // @[BinaryArbiterNode.scala 94:26]
  wire [31:0] XbarCircuit_io_out_0_a_bits_mask; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_io_out_0_a_bits_data; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_out_0_d_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_out_0_d_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_out_0_d_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [1:0] XbarCircuit_io_out_0_d_bits_param; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_io_out_0_d_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [6:0] XbarCircuit_io_out_0_d_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_io_out_0_d_bits_denied; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_io_out_0_d_bits_data; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_clock; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_reset; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_in_1_a_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_in_1_a_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_in_1_a_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_in_1_a_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [5:0] XbarCircuit_1_io_in_1_a_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire [35:0] XbarCircuit_1_io_in_1_a_bits_address; // @[BinaryArbiterNode.scala 94:26]
  wire [31:0] XbarCircuit_1_io_in_1_a_bits_mask; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_1_io_in_1_a_bits_data; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_in_1_d_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_in_1_d_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_in_1_d_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [1:0] XbarCircuit_1_io_in_1_d_bits_param; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_in_1_d_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [5:0] XbarCircuit_1_io_in_1_d_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_in_1_d_bits_denied; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_1_io_in_1_d_bits_data; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_in_0_a_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_in_0_a_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_in_0_a_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_in_0_a_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [5:0] XbarCircuit_1_io_in_0_a_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire [35:0] XbarCircuit_1_io_in_0_a_bits_address; // @[BinaryArbiterNode.scala 94:26]
  wire [31:0] XbarCircuit_1_io_in_0_a_bits_mask; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_1_io_in_0_a_bits_data; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_in_0_d_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_in_0_d_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_in_0_d_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [1:0] XbarCircuit_1_io_in_0_d_bits_param; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_in_0_d_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [5:0] XbarCircuit_1_io_in_0_d_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_in_0_d_bits_denied; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_1_io_in_0_d_bits_data; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_out_0_a_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_out_0_a_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_out_0_a_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_out_0_a_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [6:0] XbarCircuit_1_io_out_0_a_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire [35:0] XbarCircuit_1_io_out_0_a_bits_address; // @[BinaryArbiterNode.scala 94:26]
  wire [31:0] XbarCircuit_1_io_out_0_a_bits_mask; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_1_io_out_0_a_bits_data; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_out_0_d_ready; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_out_0_d_valid; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_out_0_d_bits_opcode; // @[BinaryArbiterNode.scala 94:26]
  wire [1:0] XbarCircuit_1_io_out_0_d_bits_param; // @[BinaryArbiterNode.scala 94:26]
  wire [2:0] XbarCircuit_1_io_out_0_d_bits_size; // @[BinaryArbiterNode.scala 94:26]
  wire [6:0] XbarCircuit_1_io_out_0_d_bits_source; // @[BinaryArbiterNode.scala 94:26]
  wire  XbarCircuit_1_io_out_0_d_bits_denied; // @[BinaryArbiterNode.scala 94:26]
  wire [255:0] XbarCircuit_1_io_out_0_d_bits_data; // @[BinaryArbiterNode.scala 94:26]
  XbarCircuit_2 XbarCircuit ( // @[BinaryArbiterNode.scala 94:26]
    .clock(XbarCircuit_clock),
    .reset(XbarCircuit_reset),
    .io_in_1_a_ready(XbarCircuit_io_in_1_a_ready),
    .io_in_1_a_valid(XbarCircuit_io_in_1_a_valid),
    .io_in_1_a_bits_opcode(XbarCircuit_io_in_1_a_bits_opcode),
    .io_in_1_a_bits_size(XbarCircuit_io_in_1_a_bits_size),
    .io_in_1_a_bits_source(XbarCircuit_io_in_1_a_bits_source),
    .io_in_1_a_bits_address(XbarCircuit_io_in_1_a_bits_address),
    .io_in_1_a_bits_mask(XbarCircuit_io_in_1_a_bits_mask),
    .io_in_1_a_bits_data(XbarCircuit_io_in_1_a_bits_data),
    .io_in_1_d_ready(XbarCircuit_io_in_1_d_ready),
    .io_in_1_d_valid(XbarCircuit_io_in_1_d_valid),
    .io_in_1_d_bits_opcode(XbarCircuit_io_in_1_d_bits_opcode),
    .io_in_1_d_bits_param(XbarCircuit_io_in_1_d_bits_param),
    .io_in_1_d_bits_size(XbarCircuit_io_in_1_d_bits_size),
    .io_in_1_d_bits_source(XbarCircuit_io_in_1_d_bits_source),
    .io_in_1_d_bits_denied(XbarCircuit_io_in_1_d_bits_denied),
    .io_in_1_d_bits_data(XbarCircuit_io_in_1_d_bits_data),
    .io_in_0_a_ready(XbarCircuit_io_in_0_a_ready),
    .io_in_0_a_valid(XbarCircuit_io_in_0_a_valid),
    .io_in_0_a_bits_opcode(XbarCircuit_io_in_0_a_bits_opcode),
    .io_in_0_a_bits_size(XbarCircuit_io_in_0_a_bits_size),
    .io_in_0_a_bits_source(XbarCircuit_io_in_0_a_bits_source),
    .io_in_0_a_bits_address(XbarCircuit_io_in_0_a_bits_address),
    .io_in_0_a_bits_mask(XbarCircuit_io_in_0_a_bits_mask),
    .io_in_0_a_bits_data(XbarCircuit_io_in_0_a_bits_data),
    .io_in_0_d_ready(XbarCircuit_io_in_0_d_ready),
    .io_in_0_d_valid(XbarCircuit_io_in_0_d_valid),
    .io_in_0_d_bits_opcode(XbarCircuit_io_in_0_d_bits_opcode),
    .io_in_0_d_bits_param(XbarCircuit_io_in_0_d_bits_param),
    .io_in_0_d_bits_size(XbarCircuit_io_in_0_d_bits_size),
    .io_in_0_d_bits_source(XbarCircuit_io_in_0_d_bits_source),
    .io_in_0_d_bits_denied(XbarCircuit_io_in_0_d_bits_denied),
    .io_in_0_d_bits_data(XbarCircuit_io_in_0_d_bits_data),
    .io_out_0_a_ready(XbarCircuit_io_out_0_a_ready),
    .io_out_0_a_valid(XbarCircuit_io_out_0_a_valid),
    .io_out_0_a_bits_opcode(XbarCircuit_io_out_0_a_bits_opcode),
    .io_out_0_a_bits_size(XbarCircuit_io_out_0_a_bits_size),
    .io_out_0_a_bits_source(XbarCircuit_io_out_0_a_bits_source),
    .io_out_0_a_bits_address(XbarCircuit_io_out_0_a_bits_address),
    .io_out_0_a_bits_mask(XbarCircuit_io_out_0_a_bits_mask),
    .io_out_0_a_bits_data(XbarCircuit_io_out_0_a_bits_data),
    .io_out_0_d_ready(XbarCircuit_io_out_0_d_ready),
    .io_out_0_d_valid(XbarCircuit_io_out_0_d_valid),
    .io_out_0_d_bits_opcode(XbarCircuit_io_out_0_d_bits_opcode),
    .io_out_0_d_bits_param(XbarCircuit_io_out_0_d_bits_param),
    .io_out_0_d_bits_size(XbarCircuit_io_out_0_d_bits_size),
    .io_out_0_d_bits_source(XbarCircuit_io_out_0_d_bits_source),
    .io_out_0_d_bits_denied(XbarCircuit_io_out_0_d_bits_denied),
    .io_out_0_d_bits_data(XbarCircuit_io_out_0_d_bits_data)
  );
  XbarCircuit_2 XbarCircuit_1 ( // @[BinaryArbiterNode.scala 94:26]
    .clock(XbarCircuit_1_clock),
    .reset(XbarCircuit_1_reset),
    .io_in_1_a_ready(XbarCircuit_1_io_in_1_a_ready),
    .io_in_1_a_valid(XbarCircuit_1_io_in_1_a_valid),
    .io_in_1_a_bits_opcode(XbarCircuit_1_io_in_1_a_bits_opcode),
    .io_in_1_a_bits_size(XbarCircuit_1_io_in_1_a_bits_size),
    .io_in_1_a_bits_source(XbarCircuit_1_io_in_1_a_bits_source),
    .io_in_1_a_bits_address(XbarCircuit_1_io_in_1_a_bits_address),
    .io_in_1_a_bits_mask(XbarCircuit_1_io_in_1_a_bits_mask),
    .io_in_1_a_bits_data(XbarCircuit_1_io_in_1_a_bits_data),
    .io_in_1_d_ready(XbarCircuit_1_io_in_1_d_ready),
    .io_in_1_d_valid(XbarCircuit_1_io_in_1_d_valid),
    .io_in_1_d_bits_opcode(XbarCircuit_1_io_in_1_d_bits_opcode),
    .io_in_1_d_bits_param(XbarCircuit_1_io_in_1_d_bits_param),
    .io_in_1_d_bits_size(XbarCircuit_1_io_in_1_d_bits_size),
    .io_in_1_d_bits_source(XbarCircuit_1_io_in_1_d_bits_source),
    .io_in_1_d_bits_denied(XbarCircuit_1_io_in_1_d_bits_denied),
    .io_in_1_d_bits_data(XbarCircuit_1_io_in_1_d_bits_data),
    .io_in_0_a_ready(XbarCircuit_1_io_in_0_a_ready),
    .io_in_0_a_valid(XbarCircuit_1_io_in_0_a_valid),
    .io_in_0_a_bits_opcode(XbarCircuit_1_io_in_0_a_bits_opcode),
    .io_in_0_a_bits_size(XbarCircuit_1_io_in_0_a_bits_size),
    .io_in_0_a_bits_source(XbarCircuit_1_io_in_0_a_bits_source),
    .io_in_0_a_bits_address(XbarCircuit_1_io_in_0_a_bits_address),
    .io_in_0_a_bits_mask(XbarCircuit_1_io_in_0_a_bits_mask),
    .io_in_0_a_bits_data(XbarCircuit_1_io_in_0_a_bits_data),
    .io_in_0_d_ready(XbarCircuit_1_io_in_0_d_ready),
    .io_in_0_d_valid(XbarCircuit_1_io_in_0_d_valid),
    .io_in_0_d_bits_opcode(XbarCircuit_1_io_in_0_d_bits_opcode),
    .io_in_0_d_bits_param(XbarCircuit_1_io_in_0_d_bits_param),
    .io_in_0_d_bits_size(XbarCircuit_1_io_in_0_d_bits_size),
    .io_in_0_d_bits_source(XbarCircuit_1_io_in_0_d_bits_source),
    .io_in_0_d_bits_denied(XbarCircuit_1_io_in_0_d_bits_denied),
    .io_in_0_d_bits_data(XbarCircuit_1_io_in_0_d_bits_data),
    .io_out_0_a_ready(XbarCircuit_1_io_out_0_a_ready),
    .io_out_0_a_valid(XbarCircuit_1_io_out_0_a_valid),
    .io_out_0_a_bits_opcode(XbarCircuit_1_io_out_0_a_bits_opcode),
    .io_out_0_a_bits_size(XbarCircuit_1_io_out_0_a_bits_size),
    .io_out_0_a_bits_source(XbarCircuit_1_io_out_0_a_bits_source),
    .io_out_0_a_bits_address(XbarCircuit_1_io_out_0_a_bits_address),
    .io_out_0_a_bits_mask(XbarCircuit_1_io_out_0_a_bits_mask),
    .io_out_0_a_bits_data(XbarCircuit_1_io_out_0_a_bits_data),
    .io_out_0_d_ready(XbarCircuit_1_io_out_0_d_ready),
    .io_out_0_d_valid(XbarCircuit_1_io_out_0_d_valid),
    .io_out_0_d_bits_opcode(XbarCircuit_1_io_out_0_d_bits_opcode),
    .io_out_0_d_bits_param(XbarCircuit_1_io_out_0_d_bits_param),
    .io_out_0_d_bits_size(XbarCircuit_1_io_out_0_d_bits_size),
    .io_out_0_d_bits_source(XbarCircuit_1_io_out_0_d_bits_source),
    .io_out_0_d_bits_denied(XbarCircuit_1_io_out_0_d_bits_denied),
    .io_out_0_d_bits_data(XbarCircuit_1_io_out_0_d_bits_data)
  );
  assign auto_in_3_a_ready = XbarCircuit_1_io_in_1_a_ready; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_3_d_valid = XbarCircuit_1_io_in_1_d_valid; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_3_d_bits_opcode = XbarCircuit_1_io_in_1_d_bits_opcode; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_3_d_bits_param = XbarCircuit_1_io_in_1_d_bits_param; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_3_d_bits_size = XbarCircuit_1_io_in_1_d_bits_size; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_3_d_bits_source = XbarCircuit_1_io_in_1_d_bits_source; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_3_d_bits_denied = XbarCircuit_1_io_in_1_d_bits_denied; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_3_d_bits_data = XbarCircuit_1_io_in_1_d_bits_data; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_2_a_ready = XbarCircuit_io_in_1_a_ready; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_2_d_valid = XbarCircuit_io_in_1_d_valid; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_2_d_bits_opcode = XbarCircuit_io_in_1_d_bits_opcode; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_2_d_bits_param = XbarCircuit_io_in_1_d_bits_param; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_2_d_bits_size = XbarCircuit_io_in_1_d_bits_size; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_2_d_bits_source = XbarCircuit_io_in_1_d_bits_source; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_2_d_bits_denied = XbarCircuit_io_in_1_d_bits_denied; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_2_d_bits_data = XbarCircuit_io_in_1_d_bits_data; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_1_a_ready = XbarCircuit_1_io_in_0_a_ready; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_1_d_valid = XbarCircuit_1_io_in_0_d_valid; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_1_d_bits_opcode = XbarCircuit_1_io_in_0_d_bits_opcode; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_1_d_bits_param = XbarCircuit_1_io_in_0_d_bits_param; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_1_d_bits_size = XbarCircuit_1_io_in_0_d_bits_size; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_1_d_bits_source = XbarCircuit_1_io_in_0_d_bits_source; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_1_d_bits_denied = XbarCircuit_1_io_in_0_d_bits_denied; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_1_d_bits_data = XbarCircuit_1_io_in_0_d_bits_data; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_0_a_ready = XbarCircuit_io_in_0_a_ready; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_0_d_valid = XbarCircuit_io_in_0_d_valid; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_0_d_bits_opcode = XbarCircuit_io_in_0_d_bits_opcode; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_0_d_bits_param = XbarCircuit_io_in_0_d_bits_param; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_0_d_bits_size = XbarCircuit_io_in_0_d_bits_size; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_0_d_bits_source = XbarCircuit_io_in_0_d_bits_source; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_0_d_bits_denied = XbarCircuit_io_in_0_d_bits_denied; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_in_0_d_bits_data = XbarCircuit_io_in_0_d_bits_data; // @[Nodes.scala 1210:84 BinaryArbiterNode.scala 95:56]
  assign auto_out_1_a_valid = XbarCircuit_1_io_out_0_a_valid; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_1_a_bits_opcode = XbarCircuit_1_io_out_0_a_bits_opcode; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_1_a_bits_size = XbarCircuit_1_io_out_0_a_bits_size; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_1_a_bits_source = XbarCircuit_1_io_out_0_a_bits_source; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_1_a_bits_address = XbarCircuit_1_io_out_0_a_bits_address; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_1_a_bits_mask = XbarCircuit_1_io_out_0_a_bits_mask; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_1_a_bits_data = XbarCircuit_1_io_out_0_a_bits_data; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_1_d_ready = XbarCircuit_1_io_out_0_d_ready; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_0_a_valid = XbarCircuit_io_out_0_a_valid; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_0_a_bits_opcode = XbarCircuit_io_out_0_a_bits_opcode; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_0_a_bits_size = XbarCircuit_io_out_0_a_bits_size; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_0_a_bits_source = XbarCircuit_io_out_0_a_bits_source; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_0_a_bits_address = XbarCircuit_io_out_0_a_bits_address; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_0_a_bits_mask = XbarCircuit_io_out_0_a_bits_mask; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_0_a_bits_data = XbarCircuit_io_out_0_a_bits_data; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign auto_out_0_d_ready = XbarCircuit_io_out_0_d_ready; // @[Nodes.scala 1207:84 BinaryArbiterNode.scala 96:16]
  assign XbarCircuit_clock = clock;
  assign XbarCircuit_reset = reset;
  assign XbarCircuit_io_in_1_a_valid = auto_in_2_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_1_a_bits_opcode = auto_in_2_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_1_a_bits_size = auto_in_2_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_1_a_bits_source = auto_in_2_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_1_a_bits_address = auto_in_2_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_1_a_bits_mask = auto_in_2_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_1_a_bits_data = auto_in_2_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_1_d_ready = auto_in_2_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_0_a_valid = auto_in_0_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_0_a_bits_opcode = auto_in_0_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_0_a_bits_size = auto_in_0_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_0_a_bits_source = auto_in_0_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_0_a_bits_address = auto_in_0_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_0_a_bits_mask = auto_in_0_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_0_a_bits_data = auto_in_0_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_in_0_d_ready = auto_in_0_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_io_out_0_a_ready = auto_out_0_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_io_out_0_d_valid = auto_out_0_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_io_out_0_d_bits_opcode = auto_out_0_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_io_out_0_d_bits_param = auto_out_0_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_io_out_0_d_bits_size = auto_out_0_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_io_out_0_d_bits_source = auto_out_0_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_io_out_0_d_bits_denied = auto_out_0_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_io_out_0_d_bits_data = auto_out_0_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_1_clock = clock;
  assign XbarCircuit_1_reset = reset;
  assign XbarCircuit_1_io_in_1_a_valid = auto_in_3_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_1_a_bits_opcode = auto_in_3_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_1_a_bits_size = auto_in_3_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_1_a_bits_source = auto_in_3_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_1_a_bits_address = auto_in_3_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_1_a_bits_mask = auto_in_3_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_1_a_bits_data = auto_in_3_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_1_d_ready = auto_in_3_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_0_a_valid = auto_in_1_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_0_a_bits_opcode = auto_in_1_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_0_a_bits_size = auto_in_1_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_0_a_bits_source = auto_in_1_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_0_a_bits_address = auto_in_1_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_0_a_bits_mask = auto_in_1_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_0_a_bits_data = auto_in_1_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_in_0_d_ready = auto_in_1_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign XbarCircuit_1_io_out_0_a_ready = auto_out_1_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_1_io_out_0_d_valid = auto_out_1_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_1_io_out_0_d_bits_opcode = auto_out_1_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_1_io_out_0_d_bits_param = auto_out_1_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_1_io_out_0_d_bits_size = auto_out_1_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_1_io_out_0_d_bits_source = auto_out_1_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_1_io_out_0_d_bits_denied = auto_out_1_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign XbarCircuit_1_io_out_0_d_bits_data = auto_out_1_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
endmodule