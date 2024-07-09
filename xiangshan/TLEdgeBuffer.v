module TLEdgeBuffer(
  input          clock,
  input          reset,
  output         auto_in_1_a_ready,
  input          auto_in_1_a_valid,
  input  [2:0]   auto_in_1_a_bits_opcode,
  input  [2:0]   auto_in_1_a_bits_size,
  input  [6:0]   auto_in_1_a_bits_source,
  input  [35:0]  auto_in_1_a_bits_address,
  input  [31:0]  auto_in_1_a_bits_mask,
  input  [255:0] auto_in_1_a_bits_data,
  input          auto_in_1_d_ready,
  output         auto_in_1_d_valid,
  output [2:0]   auto_in_1_d_bits_opcode,
  output [1:0]   auto_in_1_d_bits_param,
  output [2:0]   auto_in_1_d_bits_size,
  output [6:0]   auto_in_1_d_bits_source,
  output         auto_in_1_d_bits_denied,
  output [255:0] auto_in_1_d_bits_data,
  output         auto_in_0_a_ready,
  input          auto_in_0_a_valid,
  input  [2:0]   auto_in_0_a_bits_opcode,
  input  [2:0]   auto_in_0_a_bits_size,
  input  [6:0]   auto_in_0_a_bits_source,
  input  [35:0]  auto_in_0_a_bits_address,
  input  [31:0]  auto_in_0_a_bits_mask,
  input  [255:0] auto_in_0_a_bits_data,
  input          auto_in_0_d_ready,
  output         auto_in_0_d_valid,
  output [2:0]   auto_in_0_d_bits_opcode,
  output [1:0]   auto_in_0_d_bits_param,
  output [2:0]   auto_in_0_d_bits_size,
  output [6:0]   auto_in_0_d_bits_source,
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
  wire  L3EdgeBuffer_1_edge_0_clock; // @[TLEdgeBuffer.scala 93:21]
  wire  L3EdgeBuffer_1_edge_0_reset; // @[TLEdgeBuffer.scala 93:21]
  wire  L3EdgeBuffer_1_edge_0_io_in_a_ready; // @[TLEdgeBuffer.scala 93:21]
  wire  L3EdgeBuffer_1_edge_0_io_in_a_valid; // @[TLEdgeBuffer.scala 93:21]
  wire [2:0] L3EdgeBuffer_1_edge_0_io_in_a_bits_opcode; // @[TLEdgeBuffer.scala 93:21]
  wire [2:0] L3EdgeBuffer_1_edge_0_io_in_a_bits_size; // @[TLEdgeBuffer.scala 93:21]
  wire [6:0] L3EdgeBuffer_1_edge_0_io_in_a_bits_source; // @[TLEdgeBuffer.scala 93:21]
  wire [35:0] L3EdgeBuffer_1_edge_0_io_in_a_bits_address; // @[TLEdgeBuffer.scala 93:21]
  wire [31:0] L3EdgeBuffer_1_edge_0_io_in_a_bits_mask; // @[TLEdgeBuffer.scala 93:21]
  wire [255:0] L3EdgeBuffer_1_edge_0_io_in_a_bits_data; // @[TLEdgeBuffer.scala 93:21]
  wire  L3EdgeBuffer_1_edge_0_io_in_d_ready; // @[TLEdgeBuffer.scala 93:21]
  wire  L3EdgeBuffer_1_edge_0_io_in_d_valid; // @[TLEdgeBuffer.scala 93:21]
  wire [2:0] L3EdgeBuffer_1_edge_0_io_in_d_bits_opcode; // @[TLEdgeBuffer.scala 93:21]
  wire [1:0] L3EdgeBuffer_1_edge_0_io_in_d_bits_param; // @[TLEdgeBuffer.scala 93:21]
  wire [2:0] L3EdgeBuffer_1_edge_0_io_in_d_bits_size; // @[TLEdgeBuffer.scala 93:21]
  wire [6:0] L3EdgeBuffer_1_edge_0_io_in_d_bits_source; // @[TLEdgeBuffer.scala 93:21]
  wire  L3EdgeBuffer_1_edge_0_io_in_d_bits_denied; // @[TLEdgeBuffer.scala 93:21]
  wire [255:0] L3EdgeBuffer_1_edge_0_io_in_d_bits_data; // @[TLEdgeBuffer.scala 93:21]
  wire  L3EdgeBuffer_1_edge_0_io_out_a_ready; // @[TLEdgeBuffer.scala 93:21]
  wire  L3EdgeBuffer_1_edge_0_io_out_a_valid; // @[TLEdgeBuffer.scala 93:21]
  wire [2:0] L3EdgeBuffer_1_edge_0_io_out_a_bits_opcode; // @[TLEdgeBuffer.scala 93:21]
  wire [2:0] L3EdgeBuffer_1_edge_0_io_out_a_bits_size; // @[TLEdgeBuffer.scala 93:21]
  wire [6:0] L3EdgeBuffer_1_edge_0_io_out_a_bits_source; // @[TLEdgeBuffer.scala 93:21]
  wire [35:0] L3EdgeBuffer_1_edge_0_io_out_a_bits_address; // @[TLEdgeBuffer.scala 93:21]
  wire [31:0] L3EdgeBuffer_1_edge_0_io_out_a_bits_mask; // @[TLEdgeBuffer.scala 93:21]
  wire [255:0] L3EdgeBuffer_1_edge_0_io_out_a_bits_data; // @[TLEdgeBuffer.scala 93:21]
  wire  L3EdgeBuffer_1_edge_0_io_out_d_ready; // @[TLEdgeBuffer.scala 93:21]
  wire  L3EdgeBuffer_1_edge_0_io_out_d_valid; // @[TLEdgeBuffer.scala 93:21]
  wire [2:0] L3EdgeBuffer_1_edge_0_io_out_d_bits_opcode; // @[TLEdgeBuffer.scala 93:21]
  wire [1:0] L3EdgeBuffer_1_edge_0_io_out_d_bits_param; // @[TLEdgeBuffer.scala 93:21]
  wire [2:0] L3EdgeBuffer_1_edge_0_io_out_d_bits_size; // @[TLEdgeBuffer.scala 93:21]
  wire [6:0] L3EdgeBuffer_1_edge_0_io_out_d_bits_source; // @[TLEdgeBuffer.scala 93:21]
  wire  L3EdgeBuffer_1_edge_0_io_out_d_bits_denied; // @[TLEdgeBuffer.scala 93:21]
  wire [255:0] L3EdgeBuffer_1_edge_0_io_out_d_bits_data; // @[TLEdgeBuffer.scala 93:21]
  TLBufferModule L3EdgeBuffer_1_edge_0 ( // @[TLEdgeBuffer.scala 93:21]
    .clock(L3EdgeBuffer_1_edge_0_clock),
    .reset(L3EdgeBuffer_1_edge_0_reset),
    .io_in_a_ready(L3EdgeBuffer_1_edge_0_io_in_a_ready),
    .io_in_a_valid(L3EdgeBuffer_1_edge_0_io_in_a_valid),
    .io_in_a_bits_opcode(L3EdgeBuffer_1_edge_0_io_in_a_bits_opcode),
    .io_in_a_bits_size(L3EdgeBuffer_1_edge_0_io_in_a_bits_size),
    .io_in_a_bits_source(L3EdgeBuffer_1_edge_0_io_in_a_bits_source),
    .io_in_a_bits_address(L3EdgeBuffer_1_edge_0_io_in_a_bits_address),
    .io_in_a_bits_mask(L3EdgeBuffer_1_edge_0_io_in_a_bits_mask),
    .io_in_a_bits_data(L3EdgeBuffer_1_edge_0_io_in_a_bits_data),
    .io_in_d_ready(L3EdgeBuffer_1_edge_0_io_in_d_ready),
    .io_in_d_valid(L3EdgeBuffer_1_edge_0_io_in_d_valid),
    .io_in_d_bits_opcode(L3EdgeBuffer_1_edge_0_io_in_d_bits_opcode),
    .io_in_d_bits_param(L3EdgeBuffer_1_edge_0_io_in_d_bits_param),
    .io_in_d_bits_size(L3EdgeBuffer_1_edge_0_io_in_d_bits_size),
    .io_in_d_bits_source(L3EdgeBuffer_1_edge_0_io_in_d_bits_source),
    .io_in_d_bits_denied(L3EdgeBuffer_1_edge_0_io_in_d_bits_denied),
    .io_in_d_bits_data(L3EdgeBuffer_1_edge_0_io_in_d_bits_data),
    .io_out_a_ready(L3EdgeBuffer_1_edge_0_io_out_a_ready),
    .io_out_a_valid(L3EdgeBuffer_1_edge_0_io_out_a_valid),
    .io_out_a_bits_opcode(L3EdgeBuffer_1_edge_0_io_out_a_bits_opcode),
    .io_out_a_bits_size(L3EdgeBuffer_1_edge_0_io_out_a_bits_size),
    .io_out_a_bits_source(L3EdgeBuffer_1_edge_0_io_out_a_bits_source),
    .io_out_a_bits_address(L3EdgeBuffer_1_edge_0_io_out_a_bits_address),
    .io_out_a_bits_mask(L3EdgeBuffer_1_edge_0_io_out_a_bits_mask),
    .io_out_a_bits_data(L3EdgeBuffer_1_edge_0_io_out_a_bits_data),
    .io_out_d_ready(L3EdgeBuffer_1_edge_0_io_out_d_ready),
    .io_out_d_valid(L3EdgeBuffer_1_edge_0_io_out_d_valid),
    .io_out_d_bits_opcode(L3EdgeBuffer_1_edge_0_io_out_d_bits_opcode),
    .io_out_d_bits_param(L3EdgeBuffer_1_edge_0_io_out_d_bits_param),
    .io_out_d_bits_size(L3EdgeBuffer_1_edge_0_io_out_d_bits_size),
    .io_out_d_bits_source(L3EdgeBuffer_1_edge_0_io_out_d_bits_source),
    .io_out_d_bits_denied(L3EdgeBuffer_1_edge_0_io_out_d_bits_denied),
    .io_out_d_bits_data(L3EdgeBuffer_1_edge_0_io_out_d_bits_data)
  );
  assign auto_in_1_a_ready = auto_out_1_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_valid = auto_out_1_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_opcode = auto_out_1_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_param = auto_out_1_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_size = auto_out_1_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_source = auto_out_1_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_denied = auto_out_1_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_data = auto_out_1_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_a_ready = L3EdgeBuffer_1_edge_0_io_in_a_ready; // @[Nodes.scala 1210:84 TLEdgeBuffer.scala 95:15]
  assign auto_in_0_d_valid = L3EdgeBuffer_1_edge_0_io_in_d_valid; // @[Nodes.scala 1210:84 TLEdgeBuffer.scala 95:15]
  assign auto_in_0_d_bits_opcode = L3EdgeBuffer_1_edge_0_io_in_d_bits_opcode; // @[Nodes.scala 1210:84 TLEdgeBuffer.scala 95:15]
  assign auto_in_0_d_bits_param = L3EdgeBuffer_1_edge_0_io_in_d_bits_param; // @[Nodes.scala 1210:84 TLEdgeBuffer.scala 95:15]
  assign auto_in_0_d_bits_size = L3EdgeBuffer_1_edge_0_io_in_d_bits_size; // @[Nodes.scala 1210:84 TLEdgeBuffer.scala 95:15]
  assign auto_in_0_d_bits_source = L3EdgeBuffer_1_edge_0_io_in_d_bits_source; // @[Nodes.scala 1210:84 TLEdgeBuffer.scala 95:15]
  assign auto_in_0_d_bits_denied = L3EdgeBuffer_1_edge_0_io_in_d_bits_denied; // @[Nodes.scala 1210:84 TLEdgeBuffer.scala 95:15]
  assign auto_in_0_d_bits_data = L3EdgeBuffer_1_edge_0_io_in_d_bits_data; // @[Nodes.scala 1210:84 TLEdgeBuffer.scala 95:15]
  assign auto_out_1_a_valid = auto_in_1_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_opcode = auto_in_1_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_size = auto_in_1_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_source = auto_in_1_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_address = auto_in_1_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_mask = auto_in_1_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_data = auto_in_1_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_d_ready = auto_in_1_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_valid = L3EdgeBuffer_1_edge_0_io_out_a_valid; // @[Nodes.scala 1207:84 TLEdgeBuffer.scala 26:13]
  assign auto_out_0_a_bits_opcode = L3EdgeBuffer_1_edge_0_io_out_a_bits_opcode; // @[Nodes.scala 1207:84 TLEdgeBuffer.scala 26:13]
  assign auto_out_0_a_bits_size = L3EdgeBuffer_1_edge_0_io_out_a_bits_size; // @[Nodes.scala 1207:84 TLEdgeBuffer.scala 26:13]
  assign auto_out_0_a_bits_source = L3EdgeBuffer_1_edge_0_io_out_a_bits_source; // @[Nodes.scala 1207:84 TLEdgeBuffer.scala 26:13]
  assign auto_out_0_a_bits_address = L3EdgeBuffer_1_edge_0_io_out_a_bits_address; // @[Nodes.scala 1207:84 TLEdgeBuffer.scala 26:13]
  assign auto_out_0_a_bits_mask = L3EdgeBuffer_1_edge_0_io_out_a_bits_mask; // @[Nodes.scala 1207:84 TLEdgeBuffer.scala 26:13]
  assign auto_out_0_a_bits_data = L3EdgeBuffer_1_edge_0_io_out_a_bits_data; // @[Nodes.scala 1207:84 TLEdgeBuffer.scala 26:13]
  assign auto_out_0_d_ready = L3EdgeBuffer_1_edge_0_io_out_d_ready; // @[Nodes.scala 1207:84 TLEdgeBuffer.scala 26:13]
  assign L3EdgeBuffer_1_edge_0_clock = clock;
  assign L3EdgeBuffer_1_edge_0_reset = reset;
  assign L3EdgeBuffer_1_edge_0_io_in_a_valid = auto_in_0_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign L3EdgeBuffer_1_edge_0_io_in_a_bits_opcode = auto_in_0_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign L3EdgeBuffer_1_edge_0_io_in_a_bits_size = auto_in_0_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign L3EdgeBuffer_1_edge_0_io_in_a_bits_source = auto_in_0_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign L3EdgeBuffer_1_edge_0_io_in_a_bits_address = auto_in_0_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign L3EdgeBuffer_1_edge_0_io_in_a_bits_mask = auto_in_0_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign L3EdgeBuffer_1_edge_0_io_in_a_bits_data = auto_in_0_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign L3EdgeBuffer_1_edge_0_io_in_d_ready = auto_in_0_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign L3EdgeBuffer_1_edge_0_io_out_a_ready = auto_out_0_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign L3EdgeBuffer_1_edge_0_io_out_d_valid = auto_out_0_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign L3EdgeBuffer_1_edge_0_io_out_d_bits_opcode = auto_out_0_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign L3EdgeBuffer_1_edge_0_io_out_d_bits_param = auto_out_0_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign L3EdgeBuffer_1_edge_0_io_out_d_bits_size = auto_out_0_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign L3EdgeBuffer_1_edge_0_io_out_d_bits_source = auto_out_0_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign L3EdgeBuffer_1_edge_0_io_out_d_bits_denied = auto_out_0_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign L3EdgeBuffer_1_edge_0_io_out_d_bits_data = auto_out_0_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
endmodule