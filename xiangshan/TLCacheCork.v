`include "IDPool.v"
`include "Queue_4.v"

module TLCacheCork(
  input          clock,
  input          reset,
  output         auto_in_3_a_ready,
  input          auto_in_3_a_valid,
  input  [2:0]   auto_in_3_a_bits_opcode,
  input  [2:0]   auto_in_3_a_bits_param,
  input  [2:0]   auto_in_3_a_bits_size,
  input  [4:0]   auto_in_3_a_bits_source,
  input  [35:0]  auto_in_3_a_bits_address,
  input  [31:0]  auto_in_3_a_bits_mask,
  input  [255:0] auto_in_3_a_bits_data,
  output         auto_in_3_c_ready,
  input          auto_in_3_c_valid,
  input  [2:0]   auto_in_3_c_bits_opcode,
  input  [2:0]   auto_in_3_c_bits_size,
  input  [4:0]   auto_in_3_c_bits_source,
  input  [35:0]  auto_in_3_c_bits_address,
  input  [255:0] auto_in_3_c_bits_data,
  input          auto_in_3_d_ready,
  output         auto_in_3_d_valid,
  output [2:0]   auto_in_3_d_bits_opcode,
  output [1:0]   auto_in_3_d_bits_param,
  output [2:0]   auto_in_3_d_bits_size,
  output [4:0]   auto_in_3_d_bits_source,
  output [2:0]   auto_in_3_d_bits_sink,
  output         auto_in_3_d_bits_denied,
  output [255:0] auto_in_3_d_bits_data,
  input          auto_in_3_e_valid,
  input  [2:0]   auto_in_3_e_bits_sink,
  output         auto_in_2_a_ready,
  input          auto_in_2_a_valid,
  input  [2:0]   auto_in_2_a_bits_opcode,
  input  [2:0]   auto_in_2_a_bits_param,
  input  [2:0]   auto_in_2_a_bits_size,
  input  [4:0]   auto_in_2_a_bits_source,
  input  [35:0]  auto_in_2_a_bits_address,
  input  [31:0]  auto_in_2_a_bits_mask,
  input  [255:0] auto_in_2_a_bits_data,
  output         auto_in_2_c_ready,
  input          auto_in_2_c_valid,
  input  [2:0]   auto_in_2_c_bits_opcode,
  input  [2:0]   auto_in_2_c_bits_size,
  input  [4:0]   auto_in_2_c_bits_source,
  input  [35:0]  auto_in_2_c_bits_address,
  input  [255:0] auto_in_2_c_bits_data,
  input          auto_in_2_d_ready,
  output         auto_in_2_d_valid,
  output [2:0]   auto_in_2_d_bits_opcode,
  output [1:0]   auto_in_2_d_bits_param,
  output [2:0]   auto_in_2_d_bits_size,
  output [4:0]   auto_in_2_d_bits_source,
  output [2:0]   auto_in_2_d_bits_sink,
  output         auto_in_2_d_bits_denied,
  output [255:0] auto_in_2_d_bits_data,
  input          auto_in_2_e_valid,
  input  [2:0]   auto_in_2_e_bits_sink,
  output         auto_in_1_a_ready,
  input          auto_in_1_a_valid,
  input  [2:0]   auto_in_1_a_bits_opcode,
  input  [2:0]   auto_in_1_a_bits_param,
  input  [2:0]   auto_in_1_a_bits_size,
  input  [4:0]   auto_in_1_a_bits_source,
  input  [35:0]  auto_in_1_a_bits_address,
  input  [31:0]  auto_in_1_a_bits_mask,
  input  [255:0] auto_in_1_a_bits_data,
  output         auto_in_1_c_ready,
  input          auto_in_1_c_valid,
  input  [2:0]   auto_in_1_c_bits_opcode,
  input  [2:0]   auto_in_1_c_bits_size,
  input  [4:0]   auto_in_1_c_bits_source,
  input  [35:0]  auto_in_1_c_bits_address,
  input  [255:0] auto_in_1_c_bits_data,
  input          auto_in_1_d_ready,
  output         auto_in_1_d_valid,
  output [2:0]   auto_in_1_d_bits_opcode,
  output [1:0]   auto_in_1_d_bits_param,
  output [2:0]   auto_in_1_d_bits_size,
  output [4:0]   auto_in_1_d_bits_source,
  output [2:0]   auto_in_1_d_bits_sink,
  output         auto_in_1_d_bits_denied,
  output [255:0] auto_in_1_d_bits_data,
  input          auto_in_1_e_valid,
  input  [2:0]   auto_in_1_e_bits_sink,
  output         auto_in_0_a_ready,
  input          auto_in_0_a_valid,
  input  [2:0]   auto_in_0_a_bits_opcode,
  input  [2:0]   auto_in_0_a_bits_param,
  input  [2:0]   auto_in_0_a_bits_size,
  input  [4:0]   auto_in_0_a_bits_source,
  input  [35:0]  auto_in_0_a_bits_address,
  input  [31:0]  auto_in_0_a_bits_mask,
  input  [255:0] auto_in_0_a_bits_data,
  output         auto_in_0_c_ready,
  input          auto_in_0_c_valid,
  input  [2:0]   auto_in_0_c_bits_opcode,
  input  [2:0]   auto_in_0_c_bits_size,
  input  [4:0]   auto_in_0_c_bits_source,
  input  [35:0]  auto_in_0_c_bits_address,
  input  [255:0] auto_in_0_c_bits_data,
  input          auto_in_0_d_ready,
  output         auto_in_0_d_valid,
  output [2:0]   auto_in_0_d_bits_opcode,
  output [1:0]   auto_in_0_d_bits_param,
  output [2:0]   auto_in_0_d_bits_size,
  output [4:0]   auto_in_0_d_bits_source,
  output [2:0]   auto_in_0_d_bits_sink,
  output         auto_in_0_d_bits_denied,
  output [255:0] auto_in_0_d_bits_data,
  input          auto_in_0_e_valid,
  input  [2:0]   auto_in_0_e_bits_sink,
  input          auto_out_3_a_ready,
  output         auto_out_3_a_valid,
  output [2:0]   auto_out_3_a_bits_opcode,
  output [2:0]   auto_out_3_a_bits_size,
  output [5:0]   auto_out_3_a_bits_source,
  output [35:0]  auto_out_3_a_bits_address,
  output [31:0]  auto_out_3_a_bits_mask,
  output [255:0] auto_out_3_a_bits_data,
  output         auto_out_3_d_ready,
  input          auto_out_3_d_valid,
  input  [2:0]   auto_out_3_d_bits_opcode,
  input  [1:0]   auto_out_3_d_bits_param,
  input  [2:0]   auto_out_3_d_bits_size,
  input  [5:0]   auto_out_3_d_bits_source,
  input          auto_out_3_d_bits_denied,
  input  [255:0] auto_out_3_d_bits_data,
  input          auto_out_2_a_ready,
  output         auto_out_2_a_valid,
  output [2:0]   auto_out_2_a_bits_opcode,
  output [2:0]   auto_out_2_a_bits_size,
  output [5:0]   auto_out_2_a_bits_source,
  output [35:0]  auto_out_2_a_bits_address,
  output [31:0]  auto_out_2_a_bits_mask,
  output [255:0] auto_out_2_a_bits_data,
  output         auto_out_2_d_ready,
  input          auto_out_2_d_valid,
  input  [2:0]   auto_out_2_d_bits_opcode,
  input  [1:0]   auto_out_2_d_bits_param,
  input  [2:0]   auto_out_2_d_bits_size,
  input  [5:0]   auto_out_2_d_bits_source,
  input          auto_out_2_d_bits_denied,
  input  [255:0] auto_out_2_d_bits_data,
  input          auto_out_1_a_ready,
  output         auto_out_1_a_valid,
  output [2:0]   auto_out_1_a_bits_opcode,
  output [2:0]   auto_out_1_a_bits_size,
  output [5:0]   auto_out_1_a_bits_source,
  output [35:0]  auto_out_1_a_bits_address,
  output [31:0]  auto_out_1_a_bits_mask,
  output [255:0] auto_out_1_a_bits_data,
  output         auto_out_1_d_ready,
  input          auto_out_1_d_valid,
  input  [2:0]   auto_out_1_d_bits_opcode,
  input  [1:0]   auto_out_1_d_bits_param,
  input  [2:0]   auto_out_1_d_bits_size,
  input  [5:0]   auto_out_1_d_bits_source,
  input          auto_out_1_d_bits_denied,
  input  [255:0] auto_out_1_d_bits_data,
  input          auto_out_0_a_ready,
  output         auto_out_0_a_valid,
  output [2:0]   auto_out_0_a_bits_opcode,
  output [2:0]   auto_out_0_a_bits_size,
  output [5:0]   auto_out_0_a_bits_source,
  output [35:0]  auto_out_0_a_bits_address,
  output [31:0]  auto_out_0_a_bits_mask,
  output [255:0] auto_out_0_a_bits_data,
  output         auto_out_0_d_ready,
  input          auto_out_0_d_valid,
  input  [2:0]   auto_out_0_d_bits_opcode,
  input  [1:0]   auto_out_0_d_bits_param,
  input  [2:0]   auto_out_0_d_bits_size,
  input  [5:0]   auto_out_0_d_bits_source,
  input          auto_out_0_d_bits_denied,
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
`endif // RANDOMIZE_REG_INIT
  wire  IDPool_clock; // @[CacheCork.scala 117:26]
  wire  IDPool_reset; // @[CacheCork.scala 117:26]
  wire  IDPool_io_free_valid; // @[CacheCork.scala 117:26]
  wire [2:0] IDPool_io_free_bits; // @[CacheCork.scala 117:26]
  wire  IDPool_io_alloc_ready; // @[CacheCork.scala 117:26]
  wire  IDPool_io_alloc_valid; // @[CacheCork.scala 117:26]
  wire [2:0] IDPool_io_alloc_bits; // @[CacheCork.scala 117:26]
  wire  q_clock; // @[Decoupled.scala 320:21]
  wire  q_reset; // @[Decoupled.scala 320:21]
  wire  q_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [1:0] q_io_deq_bits_param; // @[Decoupled.scala 320:21]
  wire [2:0] q_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_io_deq_bits_denied; // @[Decoupled.scala 320:21]
  wire [255:0] q_io_deq_bits_data; // @[Decoupled.scala 320:21]
  wire  q_1_clock; // @[Decoupled.scala 320:21]
  wire  q_1_reset; // @[Decoupled.scala 320:21]
  wire  q_1_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_1_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_1_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_1_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_1_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [1:0] q_1_io_deq_bits_param; // @[Decoupled.scala 320:21]
  wire [2:0] q_1_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_1_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_1_io_deq_bits_denied; // @[Decoupled.scala 320:21]
  wire [255:0] q_1_io_deq_bits_data; // @[Decoupled.scala 320:21]
  wire  IDPool_1_clock; // @[CacheCork.scala 117:26]
  wire  IDPool_1_reset; // @[CacheCork.scala 117:26]
  wire  IDPool_1_io_free_valid; // @[CacheCork.scala 117:26]
  wire [2:0] IDPool_1_io_free_bits; // @[CacheCork.scala 117:26]
  wire  IDPool_1_io_alloc_ready; // @[CacheCork.scala 117:26]
  wire  IDPool_1_io_alloc_valid; // @[CacheCork.scala 117:26]
  wire [2:0] IDPool_1_io_alloc_bits; // @[CacheCork.scala 117:26]
  wire  q_2_clock; // @[Decoupled.scala 320:21]
  wire  q_2_reset; // @[Decoupled.scala 320:21]
  wire  q_2_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_2_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_2_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_2_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_2_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_2_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_2_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_2_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [1:0] q_2_io_deq_bits_param; // @[Decoupled.scala 320:21]
  wire [2:0] q_2_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_2_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_2_io_deq_bits_denied; // @[Decoupled.scala 320:21]
  wire [255:0] q_2_io_deq_bits_data; // @[Decoupled.scala 320:21]
  wire  q_3_clock; // @[Decoupled.scala 320:21]
  wire  q_3_reset; // @[Decoupled.scala 320:21]
  wire  q_3_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_3_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_3_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_3_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_3_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_3_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_3_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_3_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [1:0] q_3_io_deq_bits_param; // @[Decoupled.scala 320:21]
  wire [2:0] q_3_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_3_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_3_io_deq_bits_denied; // @[Decoupled.scala 320:21]
  wire [255:0] q_3_io_deq_bits_data; // @[Decoupled.scala 320:21]
  wire  IDPool_2_clock; // @[CacheCork.scala 117:26]
  wire  IDPool_2_reset; // @[CacheCork.scala 117:26]
  wire  IDPool_2_io_free_valid; // @[CacheCork.scala 117:26]
  wire [2:0] IDPool_2_io_free_bits; // @[CacheCork.scala 117:26]
  wire  IDPool_2_io_alloc_ready; // @[CacheCork.scala 117:26]
  wire  IDPool_2_io_alloc_valid; // @[CacheCork.scala 117:26]
  wire [2:0] IDPool_2_io_alloc_bits; // @[CacheCork.scala 117:26]
  wire  q_4_clock; // @[Decoupled.scala 320:21]
  wire  q_4_reset; // @[Decoupled.scala 320:21]
  wire  q_4_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_4_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_4_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_4_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_4_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_4_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_4_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_4_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [1:0] q_4_io_deq_bits_param; // @[Decoupled.scala 320:21]
  wire [2:0] q_4_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_4_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_4_io_deq_bits_denied; // @[Decoupled.scala 320:21]
  wire [255:0] q_4_io_deq_bits_data; // @[Decoupled.scala 320:21]
  wire  q_5_clock; // @[Decoupled.scala 320:21]
  wire  q_5_reset; // @[Decoupled.scala 320:21]
  wire  q_5_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_5_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_5_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_5_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_5_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_5_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_5_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_5_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [1:0] q_5_io_deq_bits_param; // @[Decoupled.scala 320:21]
  wire [2:0] q_5_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_5_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_5_io_deq_bits_denied; // @[Decoupled.scala 320:21]
  wire [255:0] q_5_io_deq_bits_data; // @[Decoupled.scala 320:21]
  wire  IDPool_3_clock; // @[CacheCork.scala 117:26]
  wire  IDPool_3_reset; // @[CacheCork.scala 117:26]
  wire  IDPool_3_io_free_valid; // @[CacheCork.scala 117:26]
  wire [2:0] IDPool_3_io_free_bits; // @[CacheCork.scala 117:26]
  wire  IDPool_3_io_alloc_ready; // @[CacheCork.scala 117:26]
  wire  IDPool_3_io_alloc_valid; // @[CacheCork.scala 117:26]
  wire [2:0] IDPool_3_io_alloc_bits; // @[CacheCork.scala 117:26]
  wire  q_6_clock; // @[Decoupled.scala 320:21]
  wire  q_6_reset; // @[Decoupled.scala 320:21]
  wire  q_6_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_6_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_6_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_6_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_6_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_6_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_6_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_6_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [1:0] q_6_io_deq_bits_param; // @[Decoupled.scala 320:21]
  wire [2:0] q_6_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_6_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_6_io_deq_bits_denied; // @[Decoupled.scala 320:21]
  wire [255:0] q_6_io_deq_bits_data; // @[Decoupled.scala 320:21]
  wire  q_7_clock; // @[Decoupled.scala 320:21]
  wire  q_7_reset; // @[Decoupled.scala 320:21]
  wire  q_7_io_enq_ready; // @[Decoupled.scala 320:21]
  wire  q_7_io_enq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_7_io_enq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [2:0] q_7_io_enq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_7_io_enq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_7_io_deq_ready; // @[Decoupled.scala 320:21]
  wire  q_7_io_deq_valid; // @[Decoupled.scala 320:21]
  wire [2:0] q_7_io_deq_bits_opcode; // @[Decoupled.scala 320:21]
  wire [1:0] q_7_io_deq_bits_param; // @[Decoupled.scala 320:21]
  wire [2:0] q_7_io_deq_bits_size; // @[Decoupled.scala 320:21]
  wire [4:0] q_7_io_deq_bits_source; // @[Decoupled.scala 320:21]
  wire  q_7_io_deq_bits_denied; // @[Decoupled.scala 320:21]
  wire [255:0] q_7_io_deq_bits_data; // @[Decoupled.scala 320:21]
  wire  _T_2 = auto_in_0_a_bits_opcode == 3'h0 | auto_in_0_a_bits_opcode == 3'h1; // @[CacheCork.scala 66:54]
  wire  _T_3 = auto_in_0_a_bits_opcode == 3'h6; // @[CacheCork.scala 67:37]
  wire  _T_6 = auto_in_0_a_bits_opcode == 3'h7; // @[CacheCork.scala 68:37]
  wire  _T_7 = auto_in_0_a_bits_opcode == 3'h6 & auto_in_0_a_bits_param == 3'h2 | _T_6; // @[CacheCork.scala 67:97]
  wire  _WIRE_9_ready = q_1_io_enq_ready; // @[CacheCork.scala 65:23 Decoupled.scala 323:17]
  reg  REG_2; // @[Arbiter.scala 87:30]
  wire  _T_329 = ~REG_2; // @[Arbiter.scala 88:28]
  wire  _T_10 = auto_in_0_a_valid & ~_T_7; // @[CacheCork.scala 71:33]
  wire  _T_21 = auto_in_0_c_valid & auto_in_0_c_bits_opcode == 3'h7; // @[CacheCork.scala 92:33]
  wire [1:0] _T_335 = {_T_10,_T_21}; // @[Cat.scala 30:58]
  wire [2:0] _T_336 = {_T_335, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_338 = _T_335 | _T_336[1:0]; // @[package.scala 244:43]
  wire [2:0] _T_340 = {_T_338, 1'h0}; // @[Arbiter.scala 16:78]
  wire [1:0] _T_342 = ~_T_340[1:0]; // @[Arbiter.scala 16:61]
  reg  REG_3_1; // @[Arbiter.scala 116:26]
  wire  _T_386_1 = _T_329 ? _T_342[1] : REG_3_1; // @[Arbiter.scala 121:24]
  wire  _T_388 = auto_out_0_a_ready & _T_386_1; // @[Arbiter.scala 123:31]
  wire [5:0] _T_11 = {auto_in_0_a_bits_source, 1'h0}; // @[CacheCork.scala 73:45]
  wire [5:0] _GEN_252 = {{5'd0}, _T_2}; // @[CacheCork.scala 73:50]
  wire [5:0] _T_13 = _T_11 | _GEN_252; // @[CacheCork.scala 73:50]
  wire [5:0] _T_18 = _T_11 | 6'h1; // @[CacheCork.scala 79:52]
  wire [2:0] _GEN_0 = _T_3 | _T_6 ? 3'h4 : auto_in_0_a_bits_opcode; // @[CacheCork.scala 72:18 76:86 77:27]
  wire [5:0] _GEN_2 = _T_3 | _T_6 ? _T_18 : _T_13; // @[CacheCork.scala 73:25 76:86 79:27]
  wire [5:0] _T_22 = {auto_in_0_c_bits_source, 1'h0}; // @[CacheCork.scala 94:41]
  wire [4:0] _T_34 = {{2'd0}, auto_in_0_c_bits_size}; // @[Misc.scala 201:34]
  wire [2:0] shiftAmount = _T_34[2:0]; // @[OneHot.scala 64:49]
  wire [7:0] _T_35 = 8'h1 << shiftAmount; // @[OneHot.scala 65:12]
  wire [4:0] _T_37 = _T_35[4:0] | 5'h1; // @[Misc.scala 201:81]
  wire  _T_38 = auto_in_0_c_bits_size >= 3'h5; // @[Misc.scala 205:21]
  wire  _T_41 = ~auto_in_0_c_bits_address[4]; // @[Misc.scala 210:20]
  wire  _T_50 = ~auto_in_0_c_bits_address[3]; // @[Misc.scala 210:20]
  wire  _T_51 = _T_41 & _T_50; // @[Misc.scala 213:27]
  wire  _T_54 = _T_41 & auto_in_0_c_bits_address[3]; // @[Misc.scala 213:27]
  wire  _T_57 = auto_in_0_c_bits_address[4] & _T_50; // @[Misc.scala 213:27]
  wire  _T_60 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3]; // @[Misc.scala 213:27]
  wire  _T_65 = ~auto_in_0_c_bits_address[2]; // @[Misc.scala 210:20]
  wire  _T_66 = _T_41 & _T_50 & _T_65; // @[Misc.scala 213:27]
  wire  _T_69 = _T_41 & _T_50 & auto_in_0_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_72 = _T_41 & auto_in_0_c_bits_address[3] & _T_65; // @[Misc.scala 213:27]
  wire  _T_75 = _T_41 & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_78 = auto_in_0_c_bits_address[4] & _T_50 & _T_65; // @[Misc.scala 213:27]
  wire  _T_81 = auto_in_0_c_bits_address[4] & _T_50 & auto_in_0_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_84 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & _T_65; // @[Misc.scala 213:27]
  wire  _T_87 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_92 = ~auto_in_0_c_bits_address[1]; // @[Misc.scala 210:20]
  wire  _T_93 = _T_41 & _T_50 & _T_65 & _T_92; // @[Misc.scala 213:27]
  wire  _T_96 = _T_41 & _T_50 & _T_65 & auto_in_0_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_99 = _T_41 & _T_50 & auto_in_0_c_bits_address[2] & _T_92; // @[Misc.scala 213:27]
  wire  _T_102 = _T_41 & _T_50 & auto_in_0_c_bits_address[2] & auto_in_0_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_105 = _T_41 & auto_in_0_c_bits_address[3] & _T_65 & _T_92; // @[Misc.scala 213:27]
  wire  _T_108 = _T_41 & auto_in_0_c_bits_address[3] & _T_65 & auto_in_0_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_111 = _T_41 & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] & _T_92; // @[Misc.scala 213:27]
  wire  _T_114 = _T_41 & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] & auto_in_0_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_117 = auto_in_0_c_bits_address[4] & _T_50 & _T_65 & _T_92; // @[Misc.scala 213:27]
  wire  _T_120 = auto_in_0_c_bits_address[4] & _T_50 & _T_65 & auto_in_0_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_123 = auto_in_0_c_bits_address[4] & _T_50 & auto_in_0_c_bits_address[2] & _T_92; // @[Misc.scala 213:27]
  wire  _T_126 = auto_in_0_c_bits_address[4] & _T_50 & auto_in_0_c_bits_address[2] & auto_in_0_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_129 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & _T_65 & _T_92; // @[Misc.scala 213:27]
  wire  _T_132 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & _T_65 & auto_in_0_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_135 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] & _T_92; // @[Misc.scala 213:27]
  wire  _T_138 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] &
    auto_in_0_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_143 = ~auto_in_0_c_bits_address[0]; // @[Misc.scala 210:20]
  wire  _T_144 = _T_41 & _T_50 & _T_65 & _T_92 & _T_143; // @[Misc.scala 213:27]
  wire  _T_146 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_51 | _T_37[2] & _T_66 | _T_37[1] & _T_93 | _T_37[0] & _T_144; // @[Misc.scala 214:29]
  wire  _T_147 = _T_41 & _T_50 & _T_65 & _T_92 & auto_in_0_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_149 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_51 | _T_37[2] & _T_66 | _T_37[1] & _T_93 | _T_37[0] & _T_147; // @[Misc.scala 214:29]
  wire  _T_150 = _T_41 & _T_50 & _T_65 & auto_in_0_c_bits_address[1] & _T_143; // @[Misc.scala 213:27]
  wire  _T_152 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_51 | _T_37[2] & _T_66 | _T_37[1] & _T_96 | _T_37[0] & _T_150; // @[Misc.scala 214:29]
  wire  _T_153 = _T_41 & _T_50 & _T_65 & auto_in_0_c_bits_address[1] & auto_in_0_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_155 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_51 | _T_37[2] & _T_66 | _T_37[1] & _T_96 | _T_37[0] & _T_153; // @[Misc.scala 214:29]
  wire  _T_156 = _T_41 & _T_50 & auto_in_0_c_bits_address[2] & _T_92 & _T_143; // @[Misc.scala 213:27]
  wire  _T_158 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_51 | _T_37[2] & _T_69 | _T_37[1] & _T_99 | _T_37[0] & _T_156; // @[Misc.scala 214:29]
  wire  _T_159 = _T_41 & _T_50 & auto_in_0_c_bits_address[2] & _T_92 & auto_in_0_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_161 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_51 | _T_37[2] & _T_69 | _T_37[1] & _T_99 | _T_37[0] & _T_159; // @[Misc.scala 214:29]
  wire  _T_162 = _T_41 & _T_50 & auto_in_0_c_bits_address[2] & auto_in_0_c_bits_address[1] & _T_143; // @[Misc.scala 213:27]
  wire  _T_164 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_51 | _T_37[2] & _T_69 | _T_37[1] & _T_102 | _T_37[0] & _T_162; // @[Misc.scala 214:29]
  wire  _T_165 = _T_41 & _T_50 & auto_in_0_c_bits_address[2] & auto_in_0_c_bits_address[1] & auto_in_0_c_bits_address[0]
    ; // @[Misc.scala 213:27]
  wire  _T_167 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_51 | _T_37[2] & _T_69 | _T_37[1] & _T_102 | _T_37[0] & _T_165; // @[Misc.scala 214:29]
  wire  _T_168 = _T_41 & auto_in_0_c_bits_address[3] & _T_65 & _T_92 & _T_143; // @[Misc.scala 213:27]
  wire  _T_170 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_54 | _T_37[2] & _T_72 | _T_37[1] & _T_105 | _T_37[0] & _T_168; // @[Misc.scala 214:29]
  wire  _T_171 = _T_41 & auto_in_0_c_bits_address[3] & _T_65 & _T_92 & auto_in_0_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_173 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_54 | _T_37[2] & _T_72 | _T_37[1] & _T_105 | _T_37[0] & _T_171; // @[Misc.scala 214:29]
  wire  _T_174 = _T_41 & auto_in_0_c_bits_address[3] & _T_65 & auto_in_0_c_bits_address[1] & _T_143; // @[Misc.scala 213:27]
  wire  _T_176 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_54 | _T_37[2] & _T_72 | _T_37[1] & _T_108 | _T_37[0] & _T_174; // @[Misc.scala 214:29]
  wire  _T_177 = _T_41 & auto_in_0_c_bits_address[3] & _T_65 & auto_in_0_c_bits_address[1] & auto_in_0_c_bits_address[0]
    ; // @[Misc.scala 213:27]
  wire  _T_179 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_54 | _T_37[2] & _T_72 | _T_37[1] & _T_108 | _T_37[0] & _T_177; // @[Misc.scala 214:29]
  wire  _T_180 = _T_41 & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] & _T_92 & _T_143; // @[Misc.scala 213:27]
  wire  _T_182 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_54 | _T_37[2] & _T_75 | _T_37[1] & _T_111 | _T_37[0] & _T_180; // @[Misc.scala 214:29]
  wire  _T_183 = _T_41 & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] & _T_92 & auto_in_0_c_bits_address[0]
    ; // @[Misc.scala 213:27]
  wire  _T_185 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_54 | _T_37[2] & _T_75 | _T_37[1] & _T_111 | _T_37[0] & _T_183; // @[Misc.scala 214:29]
  wire  _T_186 = _T_41 & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] & auto_in_0_c_bits_address[1] &
    _T_143; // @[Misc.scala 213:27]
  wire  _T_188 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_54 | _T_37[2] & _T_75 | _T_37[1] & _T_114 | _T_37[0] & _T_186; // @[Misc.scala 214:29]
  wire  _T_189 = _T_41 & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] & auto_in_0_c_bits_address[1] &
    auto_in_0_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_191 = _T_38 | _T_37[4] & _T_41 | _T_37[3] & _T_54 | _T_37[2] & _T_75 | _T_37[1] & _T_114 | _T_37[0] & _T_189; // @[Misc.scala 214:29]
  wire  _T_192 = auto_in_0_c_bits_address[4] & _T_50 & _T_65 & _T_92 & _T_143; // @[Misc.scala 213:27]
  wire  _T_194 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_57 | _T_37[2] & _T_78 | _T_37[1] &
    _T_117 | _T_37[0] & _T_192; // @[Misc.scala 214:29]
  wire  _T_195 = auto_in_0_c_bits_address[4] & _T_50 & _T_65 & _T_92 & auto_in_0_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_197 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_57 | _T_37[2] & _T_78 | _T_37[1] &
    _T_117 | _T_37[0] & _T_195; // @[Misc.scala 214:29]
  wire  _T_198 = auto_in_0_c_bits_address[4] & _T_50 & _T_65 & auto_in_0_c_bits_address[1] & _T_143; // @[Misc.scala 213:27]
  wire  _T_200 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_57 | _T_37[2] & _T_78 | _T_37[1] &
    _T_120 | _T_37[0] & _T_198; // @[Misc.scala 214:29]
  wire  _T_201 = auto_in_0_c_bits_address[4] & _T_50 & _T_65 & auto_in_0_c_bits_address[1] & auto_in_0_c_bits_address[0]
    ; // @[Misc.scala 213:27]
  wire  _T_203 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_57 | _T_37[2] & _T_78 | _T_37[1] &
    _T_120 | _T_37[0] & _T_201; // @[Misc.scala 214:29]
  wire  _T_204 = auto_in_0_c_bits_address[4] & _T_50 & auto_in_0_c_bits_address[2] & _T_92 & _T_143; // @[Misc.scala 213:27]
  wire  _T_206 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_57 | _T_37[2] & _T_81 | _T_37[1] &
    _T_123 | _T_37[0] & _T_204; // @[Misc.scala 214:29]
  wire  _T_207 = auto_in_0_c_bits_address[4] & _T_50 & auto_in_0_c_bits_address[2] & _T_92 & auto_in_0_c_bits_address[0]
    ; // @[Misc.scala 213:27]
  wire  _T_209 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_57 | _T_37[2] & _T_81 | _T_37[1] &
    _T_123 | _T_37[0] & _T_207; // @[Misc.scala 214:29]
  wire  _T_210 = auto_in_0_c_bits_address[4] & _T_50 & auto_in_0_c_bits_address[2] & auto_in_0_c_bits_address[1] &
    _T_143; // @[Misc.scala 213:27]
  wire  _T_212 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_57 | _T_37[2] & _T_81 | _T_37[1] &
    _T_126 | _T_37[0] & _T_210; // @[Misc.scala 214:29]
  wire  _T_213 = auto_in_0_c_bits_address[4] & _T_50 & auto_in_0_c_bits_address[2] & auto_in_0_c_bits_address[1] &
    auto_in_0_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_215 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_57 | _T_37[2] & _T_81 | _T_37[1] &
    _T_126 | _T_37[0] & _T_213; // @[Misc.scala 214:29]
  wire  _T_216 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & _T_65 & _T_92 & _T_143; // @[Misc.scala 213:27]
  wire  _T_218 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_60 | _T_37[2] & _T_84 | _T_37[1] &
    _T_129 | _T_37[0] & _T_216; // @[Misc.scala 214:29]
  wire  _T_219 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & _T_65 & _T_92 & auto_in_0_c_bits_address[0]
    ; // @[Misc.scala 213:27]
  wire  _T_221 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_60 | _T_37[2] & _T_84 | _T_37[1] &
    _T_129 | _T_37[0] & _T_219; // @[Misc.scala 214:29]
  wire  _T_222 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & _T_65 & auto_in_0_c_bits_address[1] &
    _T_143; // @[Misc.scala 213:27]
  wire  _T_224 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_60 | _T_37[2] & _T_84 | _T_37[1] &
    _T_132 | _T_37[0] & _T_222; // @[Misc.scala 214:29]
  wire  _T_225 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & _T_65 & auto_in_0_c_bits_address[1] &
    auto_in_0_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_227 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_60 | _T_37[2] & _T_84 | _T_37[1] &
    _T_132 | _T_37[0] & _T_225; // @[Misc.scala 214:29]
  wire  _T_228 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] & _T_92 &
    _T_143; // @[Misc.scala 213:27]
  wire  _T_230 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_60 | _T_37[2] & _T_87 | _T_37[1] &
    _T_135 | _T_37[0] & _T_228; // @[Misc.scala 214:29]
  wire  _T_231 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] & _T_92 &
    auto_in_0_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_233 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_60 | _T_37[2] & _T_87 | _T_37[1] &
    _T_135 | _T_37[0] & _T_231; // @[Misc.scala 214:29]
  wire  _T_234 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] &
    auto_in_0_c_bits_address[1] & _T_143; // @[Misc.scala 213:27]
  wire  _T_236 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_60 | _T_37[2] & _T_87 | _T_37[1] &
    _T_138 | _T_37[0] & _T_234; // @[Misc.scala 214:29]
  wire  _T_237 = auto_in_0_c_bits_address[4] & auto_in_0_c_bits_address[3] & auto_in_0_c_bits_address[2] &
    auto_in_0_c_bits_address[1] & auto_in_0_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_239 = _T_38 | _T_37[4] & auto_in_0_c_bits_address[4] | _T_37[3] & _T_60 | _T_37[2] & _T_87 | _T_37[1] &
    _T_138 | _T_37[0] & _T_237; // @[Misc.scala 214:29]
  wire [7:0] lo_lo = {_T_167,_T_164,_T_161,_T_158,_T_155,_T_152,_T_149,_T_146}; // @[Cat.scala 30:58]
  wire [15:0] lo = {_T_191,_T_188,_T_185,_T_182,_T_179,_T_176,_T_173,_T_170,lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] hi_lo = {_T_215,_T_212,_T_209,_T_206,_T_203,_T_200,_T_197,_T_194}; // @[Cat.scala 30:58]
  wire [31:0] _T_240 = {_T_239,_T_236,_T_233,_T_230,_T_227,_T_224,_T_221,_T_218,hi_lo,lo}; // @[Cat.scala 30:58]
  wire  _T_241 = auto_in_0_c_bits_opcode == 3'h6; // @[CacheCork.scala 103:53]
  wire  _WIRE_13_ready = q_io_enq_ready; // @[CacheCork.scala 102:23 Decoupled.scala 323:17]
  reg  REG_3_0; // @[Arbiter.scala 116:26]
  wire  _T_386_0 = _T_329 ? _T_342[0] : REG_3_0; // @[Arbiter.scala 121:24]
  wire  _T_387 = auto_out_0_a_ready & _T_386_0; // @[Arbiter.scala 123:31]
  reg  REG; // @[Edges.scala 228:27]
  wire  _T_268 = ~REG; // @[Edges.scala 230:25]
  reg  REG_4; // @[Arbiter.scala 87:30]
  wire  _T_430 = ~REG_4; // @[Arbiter.scala 88:28]
  wire  _WIRE_43_earlyValid = q_1_io_deq_valid; // @[ReadyValidCancel.scala 70:19 71:20]
  wire  _WIRE_42_earlyValid = q_io_deq_valid; // @[ReadyValidCancel.scala 70:19 71:20]
  wire [2:0] _T_438 = {_WIRE_43_earlyValid,_WIRE_42_earlyValid,auto_out_0_d_valid}; // @[Cat.scala 30:58]
  wire [3:0] _T_439 = {_T_438, 1'h0}; // @[package.scala 244:48]
  wire [2:0] _T_441 = _T_438 | _T_439[2:0]; // @[package.scala 244:43]
  wire [4:0] _T_442 = {_T_441, 2'h0}; // @[package.scala 244:48]
  wire [2:0] _T_444 = _T_441 | _T_442[2:0]; // @[package.scala 244:43]
  wire [3:0] _T_446 = {_T_444, 1'h0}; // @[Arbiter.scala 16:78]
  wire [2:0] _T_448 = ~_T_446[2:0]; // @[Arbiter.scala 16:61]
  wire  _T_452 = _T_448[0] & auto_out_0_d_valid; // @[Arbiter.scala 97:79]
  reg  REG_5_0; // @[Arbiter.scala 116:26]
  wire  _T_504_0 = _T_430 ? _T_452 : REG_5_0; // @[Arbiter.scala 117:30]
  wire [2:0] _GEN_60 = auto_out_0_d_bits_opcode == 3'h1 & auto_out_0_d_bits_source[0] ? 3'h5 : auto_out_0_d_bits_opcode; // @[CacheCork.scala 132:13 152:76 153:27]
  wire [2:0] _GEN_62 = auto_out_0_d_bits_opcode == 3'h0 & ~auto_out_0_d_bits_source[0] ? 3'h6 : _GEN_60; // @[CacheCork.scala 156:73 157:27]
  wire [2:0] _T_558 = _T_504_0 ? _GEN_62 : 3'h0; // @[Mux.scala 27:72]
  wire  _T_453 = _T_448[1] & _WIRE_42_earlyValid; // @[Arbiter.scala 97:79]
  reg  REG_5_1; // @[Arbiter.scala 116:26]
  wire  _T_504_1 = _T_430 ? _T_453 : REG_5_1; // @[Arbiter.scala 117:30]
  wire [2:0] _WIRE_42_bits_opcode = q_io_deq_bits_opcode; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_559 = _T_504_1 ? _WIRE_42_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_561 = _T_558 | _T_559; // @[Mux.scala 27:72]
  wire  _T_454 = _T_448[2] & _WIRE_43_earlyValid; // @[Arbiter.scala 97:79]
  reg  REG_5_2; // @[Arbiter.scala 116:26]
  wire  _T_504_2 = _T_430 ? _T_454 : REG_5_2; // @[Arbiter.scala 117:30]
  wire [2:0] _WIRE_43_bits_opcode = q_1_io_deq_bits_opcode; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_560 = _T_504_2 ? _WIRE_43_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_562 = _T_561 | _T_560; // @[Mux.scala 27:72]
  wire  _T_278 = _T_562 == 3'h5 | _T_562 == 3'h4; // @[CacheCork.scala 123:54]
  wire  _T_290 = IDPool_io_alloc_valid | ~_T_268 | ~_T_278; // @[CacheCork.scala 126:70]
  wire  _T_291 = auto_in_0_d_ready & (IDPool_io_alloc_valid | ~_T_268 | ~_T_278); // @[CacheCork.scala 126:34]
  wire  _T_516 = REG_5_0 & auto_out_0_d_valid | REG_5_1 & _WIRE_42_earlyValid | REG_5_2 & _WIRE_43_earlyValid; // @[Mux.scala 27:72]
  wire  _T_517 = _T_430 ? auto_out_0_d_valid | _WIRE_42_earlyValid | _WIRE_43_earlyValid : _T_516; // @[Arbiter.scala 125:29]
  wire  _T_258 = _T_291 & _T_517; // @[Decoupled.scala 40:37]
  wire [2:0] _T_548 = _T_504_0 ? auto_out_0_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _WIRE_42_bits_size = q_io_deq_bits_size; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_549 = _T_504_1 ? _WIRE_42_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_551 = _T_548 | _T_549; // @[Mux.scala 27:72]
  wire [2:0] _WIRE_43_bits_size = q_1_io_deq_bits_size; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_550 = _T_504_2 ? _WIRE_43_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_552 = _T_551 | _T_550; // @[Mux.scala 27:72]
  wire [12:0] _T_260 = 13'h3f << _T_552; // @[package.scala 234:77]
  wire [5:0] _T_262 = ~_T_260[5:0]; // @[package.scala 234:46]
  wire  _T_265 = _T_562[0] & _T_262[5]; // @[Edges.scala 220:14]
  wire  _T_267 = REG - 1'h1; // @[Edges.scala 229:28]
  wire  _T_286 = _T_517 & _T_290; // @[CacheCork.scala 125:34]
  wire  _T_279 = auto_in_0_d_ready & _T_286; // @[Decoupled.scala 40:37]
  reg [2:0] r; // @[Reg.scala 15:16]
  wire [1:0] _GEN_61 = auto_out_0_d_bits_opcode == 3'h1 & auto_out_0_d_bits_source[0] ? 2'h0 : auto_out_0_d_bits_param; // @[CacheCork.scala 132:13 152:76 154:26]
  wire [12:0] _T_314 = 13'h3f << auto_in_0_c_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_316 = ~_T_314[5:0]; // @[package.scala 234:46]
  wire [12:0] _T_322 = 13'h3f << auto_in_0_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_324 = ~_T_322[5:0]; // @[package.scala 234:46]
  wire  _T_327 = ~_GEN_0[2]; // @[Edges.scala 91:28]
  wire  _T_328 = _T_327 & _T_324[5]; // @[Edges.scala 220:14]
  wire  _T_330 = _T_329 & auto_out_0_a_ready; // @[Arbiter.scala 89:24]
  wire  _T_345 = _T_342[0] & _T_21; // @[Arbiter.scala 97:79]
  wire  _T_346 = _T_342[1] & _T_10; // @[Arbiter.scala 97:79]
  wire  _T_361 = _T_21 | _T_10; // @[Arbiter.scala 107:36]
  wire  _T_375 = _T_345 & _T_316[5]; // @[Arbiter.scala 111:73]
  wire  _T_376 = _T_346 & _T_328; // @[Arbiter.scala 111:73]
  wire  _T_377 = _T_375 | _T_376; // @[Arbiter.scala 112:44]
  wire  _T_384_0 = _T_329 ? _T_345 : REG_3_0; // @[Arbiter.scala 117:30]
  wire  _T_384_1 = _T_329 ? _T_346 : REG_3_1; // @[Arbiter.scala 117:30]
  wire  _T_392 = REG_3_0 & _T_21 | REG_3_1 & _T_10; // @[Mux.scala 27:72]
  wire  _T_393 = _T_329 ? _T_361 : _T_392; // @[Arbiter.scala 125:29]
  wire  _T_380 = auto_out_0_a_ready & _T_393; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_400 = _T_384_0 ? auto_in_0_c_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_401 = _T_384_1 ? auto_in_0_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_403 = _T_384_0 ? _T_240 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_404 = _T_384_1 ? auto_in_0_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_406 = _T_384_0 ? auto_in_0_c_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_407 = _T_384_1 ? auto_in_0_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_409 = _T_384_0 ? _T_22 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_410 = _T_384_1 ? _GEN_2 : 6'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_412 = _T_384_0 ? auto_in_0_c_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_413 = _T_384_1 ? auto_in_0_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [12:0] _T_424 = 13'h3f << auto_out_0_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_426 = ~_T_424[5:0]; // @[package.scala 234:46]
  wire  _T_429 = _GEN_62[0] & _T_426[5]; // @[Edges.scala 220:14]
  wire  _T_431 = _T_430 & _T_291; // @[Arbiter.scala 89:24]
  wire  _T_493 = _T_452 & _T_429; // @[Arbiter.scala 111:73]
  wire  _T_506_0 = _T_430 ? _T_448[0] : REG_5_0; // @[Arbiter.scala 121:24]
  wire  _T_506_1 = _T_430 ? _T_448[1] : REG_5_1; // @[Arbiter.scala 121:24]
  wire  _T_506_2 = _T_430 ? _T_448[2] : REG_5_2; // @[Arbiter.scala 121:24]
  wire [255:0] _T_528 = _T_504_0 ? auto_out_0_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _WIRE_42_bits_data = q_io_deq_bits_data; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [255:0] _T_529 = _T_504_1 ? _WIRE_42_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _WIRE_43_bits_data = q_1_io_deq_bits_data; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [255:0] _T_530 = _T_504_2 ? _WIRE_43_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_531 = _T_528 | _T_529; // @[Mux.scala 27:72]
  wire  _WIRE_42_bits_denied = q_io_deq_bits_denied; // @[ReadyValidCancel.scala 70:19 73:14]
  wire  _WIRE_43_bits_denied = q_1_io_deq_bits_denied; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_543 = _T_504_0 ? auto_out_0_d_bits_source[5:1] : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _WIRE_42_bits_source = q_io_deq_bits_source; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_544 = _T_504_1 ? _WIRE_42_bits_source : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _WIRE_43_bits_source = q_1_io_deq_bits_source; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_545 = _T_504_2 ? _WIRE_43_bits_source : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_546 = _T_543 | _T_544; // @[Mux.scala 27:72]
  wire [1:0] _T_553 = _T_504_0 ? _GEN_61 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _WIRE_42_bits_param = q_io_deq_bits_param; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [1:0] _T_554 = _T_504_1 ? _WIRE_42_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _WIRE_43_bits_param = q_1_io_deq_bits_param; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [1:0] _T_555 = _T_504_2 ? _WIRE_43_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_556 = _T_553 | _T_554; // @[Mux.scala 27:72]
  wire  _T_567 = auto_in_1_a_bits_opcode == 3'h0 | auto_in_1_a_bits_opcode == 3'h1; // @[CacheCork.scala 66:54]
  wire  _T_568 = auto_in_1_a_bits_opcode == 3'h6; // @[CacheCork.scala 67:37]
  wire  _T_571 = auto_in_1_a_bits_opcode == 3'h7; // @[CacheCork.scala 68:37]
  wire  _T_572 = auto_in_1_a_bits_opcode == 3'h6 & auto_in_1_a_bits_param == 3'h2 | _T_571; // @[CacheCork.scala 67:97]
  wire  _WIRE_65_ready = q_3_io_enq_ready; // @[CacheCork.scala 65:23 Decoupled.scala 323:17]
  reg  REG_8; // @[Arbiter.scala 87:30]
  wire  _T_894 = ~REG_8; // @[Arbiter.scala 88:28]
  wire  _T_575 = auto_in_1_a_valid & ~_T_572; // @[CacheCork.scala 71:33]
  wire  _T_586 = auto_in_1_c_valid & auto_in_1_c_bits_opcode == 3'h7; // @[CacheCork.scala 92:33]
  wire [1:0] _T_900 = {_T_575,_T_586}; // @[Cat.scala 30:58]
  wire [2:0] _T_901 = {_T_900, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_903 = _T_900 | _T_901[1:0]; // @[package.scala 244:43]
  wire [2:0] _T_905 = {_T_903, 1'h0}; // @[Arbiter.scala 16:78]
  wire [1:0] _T_907 = ~_T_905[1:0]; // @[Arbiter.scala 16:61]
  reg  REG_9_1; // @[Arbiter.scala 116:26]
  wire  _T_951_1 = _T_894 ? _T_907[1] : REG_9_1; // @[Arbiter.scala 121:24]
  wire  _T_953 = auto_out_1_a_ready & _T_951_1; // @[Arbiter.scala 123:31]
  wire [5:0] _T_576 = {auto_in_1_a_bits_source, 1'h0}; // @[CacheCork.scala 73:45]
  wire [5:0] _GEN_253 = {{5'd0}, _T_567}; // @[CacheCork.scala 73:50]
  wire [5:0] _T_578 = _T_576 | _GEN_253; // @[CacheCork.scala 73:50]
  wire [5:0] _T_583 = _T_576 | 6'h1; // @[CacheCork.scala 79:52]
  wire [2:0] _GEN_63 = _T_568 | _T_571 ? 3'h4 : auto_in_1_a_bits_opcode; // @[CacheCork.scala 72:18 76:86 77:27]
  wire [5:0] _GEN_65 = _T_568 | _T_571 ? _T_583 : _T_578; // @[CacheCork.scala 73:25 76:86 79:27]
  wire [5:0] _T_587 = {auto_in_1_c_bits_source, 1'h0}; // @[CacheCork.scala 94:41]
  wire [4:0] _T_599 = {{2'd0}, auto_in_1_c_bits_size}; // @[Misc.scala 201:34]
  wire [2:0] shiftAmount_1 = _T_599[2:0]; // @[OneHot.scala 64:49]
  wire [7:0] _T_600 = 8'h1 << shiftAmount_1; // @[OneHot.scala 65:12]
  wire [4:0] _T_602 = _T_600[4:0] | 5'h1; // @[Misc.scala 201:81]
  wire  _T_603 = auto_in_1_c_bits_size >= 3'h5; // @[Misc.scala 205:21]
  wire  _T_606 = ~auto_in_1_c_bits_address[4]; // @[Misc.scala 210:20]
  wire  _T_615 = ~auto_in_1_c_bits_address[3]; // @[Misc.scala 210:20]
  wire  _T_616 = _T_606 & _T_615; // @[Misc.scala 213:27]
  wire  _T_619 = _T_606 & auto_in_1_c_bits_address[3]; // @[Misc.scala 213:27]
  wire  _T_622 = auto_in_1_c_bits_address[4] & _T_615; // @[Misc.scala 213:27]
  wire  _T_625 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3]; // @[Misc.scala 213:27]
  wire  _T_630 = ~auto_in_1_c_bits_address[2]; // @[Misc.scala 210:20]
  wire  _T_631 = _T_606 & _T_615 & _T_630; // @[Misc.scala 213:27]
  wire  _T_634 = _T_606 & _T_615 & auto_in_1_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_637 = _T_606 & auto_in_1_c_bits_address[3] & _T_630; // @[Misc.scala 213:27]
  wire  _T_640 = _T_606 & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_643 = auto_in_1_c_bits_address[4] & _T_615 & _T_630; // @[Misc.scala 213:27]
  wire  _T_646 = auto_in_1_c_bits_address[4] & _T_615 & auto_in_1_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_649 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & _T_630; // @[Misc.scala 213:27]
  wire  _T_652 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_657 = ~auto_in_1_c_bits_address[1]; // @[Misc.scala 210:20]
  wire  _T_658 = _T_606 & _T_615 & _T_630 & _T_657; // @[Misc.scala 213:27]
  wire  _T_661 = _T_606 & _T_615 & _T_630 & auto_in_1_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_664 = _T_606 & _T_615 & auto_in_1_c_bits_address[2] & _T_657; // @[Misc.scala 213:27]
  wire  _T_667 = _T_606 & _T_615 & auto_in_1_c_bits_address[2] & auto_in_1_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_670 = _T_606 & auto_in_1_c_bits_address[3] & _T_630 & _T_657; // @[Misc.scala 213:27]
  wire  _T_673 = _T_606 & auto_in_1_c_bits_address[3] & _T_630 & auto_in_1_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_676 = _T_606 & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] & _T_657; // @[Misc.scala 213:27]
  wire  _T_679 = _T_606 & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] & auto_in_1_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_682 = auto_in_1_c_bits_address[4] & _T_615 & _T_630 & _T_657; // @[Misc.scala 213:27]
  wire  _T_685 = auto_in_1_c_bits_address[4] & _T_615 & _T_630 & auto_in_1_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_688 = auto_in_1_c_bits_address[4] & _T_615 & auto_in_1_c_bits_address[2] & _T_657; // @[Misc.scala 213:27]
  wire  _T_691 = auto_in_1_c_bits_address[4] & _T_615 & auto_in_1_c_bits_address[2] & auto_in_1_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_694 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & _T_630 & _T_657; // @[Misc.scala 213:27]
  wire  _T_697 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & _T_630 & auto_in_1_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_700 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] & _T_657; // @[Misc.scala 213:27]
  wire  _T_703 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] &
    auto_in_1_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_708 = ~auto_in_1_c_bits_address[0]; // @[Misc.scala 210:20]
  wire  _T_709 = _T_606 & _T_615 & _T_630 & _T_657 & _T_708; // @[Misc.scala 213:27]
  wire  _T_711 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_616 | _T_602[2] & _T_631 | _T_602[1] & _T_658 | _T_602[0]
     & _T_709; // @[Misc.scala 214:29]
  wire  _T_712 = _T_606 & _T_615 & _T_630 & _T_657 & auto_in_1_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_714 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_616 | _T_602[2] & _T_631 | _T_602[1] & _T_658 | _T_602[0]
     & _T_712; // @[Misc.scala 214:29]
  wire  _T_715 = _T_606 & _T_615 & _T_630 & auto_in_1_c_bits_address[1] & _T_708; // @[Misc.scala 213:27]
  wire  _T_717 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_616 | _T_602[2] & _T_631 | _T_602[1] & _T_661 | _T_602[0]
     & _T_715; // @[Misc.scala 214:29]
  wire  _T_718 = _T_606 & _T_615 & _T_630 & auto_in_1_c_bits_address[1] & auto_in_1_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_720 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_616 | _T_602[2] & _T_631 | _T_602[1] & _T_661 | _T_602[0]
     & _T_718; // @[Misc.scala 214:29]
  wire  _T_721 = _T_606 & _T_615 & auto_in_1_c_bits_address[2] & _T_657 & _T_708; // @[Misc.scala 213:27]
  wire  _T_723 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_616 | _T_602[2] & _T_634 | _T_602[1] & _T_664 | _T_602[0]
     & _T_721; // @[Misc.scala 214:29]
  wire  _T_724 = _T_606 & _T_615 & auto_in_1_c_bits_address[2] & _T_657 & auto_in_1_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_726 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_616 | _T_602[2] & _T_634 | _T_602[1] & _T_664 | _T_602[0]
     & _T_724; // @[Misc.scala 214:29]
  wire  _T_727 = _T_606 & _T_615 & auto_in_1_c_bits_address[2] & auto_in_1_c_bits_address[1] & _T_708; // @[Misc.scala 213:27]
  wire  _T_729 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_616 | _T_602[2] & _T_634 | _T_602[1] & _T_667 | _T_602[0]
     & _T_727; // @[Misc.scala 214:29]
  wire  _T_730 = _T_606 & _T_615 & auto_in_1_c_bits_address[2] & auto_in_1_c_bits_address[1] & auto_in_1_c_bits_address[
    0]; // @[Misc.scala 213:27]
  wire  _T_732 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_616 | _T_602[2] & _T_634 | _T_602[1] & _T_667 | _T_602[0]
     & _T_730; // @[Misc.scala 214:29]
  wire  _T_733 = _T_606 & auto_in_1_c_bits_address[3] & _T_630 & _T_657 & _T_708; // @[Misc.scala 213:27]
  wire  _T_735 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_619 | _T_602[2] & _T_637 | _T_602[1] & _T_670 | _T_602[0]
     & _T_733; // @[Misc.scala 214:29]
  wire  _T_736 = _T_606 & auto_in_1_c_bits_address[3] & _T_630 & _T_657 & auto_in_1_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_738 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_619 | _T_602[2] & _T_637 | _T_602[1] & _T_670 | _T_602[0]
     & _T_736; // @[Misc.scala 214:29]
  wire  _T_739 = _T_606 & auto_in_1_c_bits_address[3] & _T_630 & auto_in_1_c_bits_address[1] & _T_708; // @[Misc.scala 213:27]
  wire  _T_741 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_619 | _T_602[2] & _T_637 | _T_602[1] & _T_673 | _T_602[0]
     & _T_739; // @[Misc.scala 214:29]
  wire  _T_742 = _T_606 & auto_in_1_c_bits_address[3] & _T_630 & auto_in_1_c_bits_address[1] & auto_in_1_c_bits_address[
    0]; // @[Misc.scala 213:27]
  wire  _T_744 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_619 | _T_602[2] & _T_637 | _T_602[1] & _T_673 | _T_602[0]
     & _T_742; // @[Misc.scala 214:29]
  wire  _T_745 = _T_606 & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] & _T_657 & _T_708; // @[Misc.scala 213:27]
  wire  _T_747 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_619 | _T_602[2] & _T_640 | _T_602[1] & _T_676 | _T_602[0]
     & _T_745; // @[Misc.scala 214:29]
  wire  _T_748 = _T_606 & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] & _T_657 & auto_in_1_c_bits_address[
    0]; // @[Misc.scala 213:27]
  wire  _T_750 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_619 | _T_602[2] & _T_640 | _T_602[1] & _T_676 | _T_602[0]
     & _T_748; // @[Misc.scala 214:29]
  wire  _T_751 = _T_606 & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] & auto_in_1_c_bits_address[1] &
    _T_708; // @[Misc.scala 213:27]
  wire  _T_753 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_619 | _T_602[2] & _T_640 | _T_602[1] & _T_679 | _T_602[0]
     & _T_751; // @[Misc.scala 214:29]
  wire  _T_754 = _T_606 & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] & auto_in_1_c_bits_address[1] &
    auto_in_1_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_756 = _T_603 | _T_602[4] & _T_606 | _T_602[3] & _T_619 | _T_602[2] & _T_640 | _T_602[1] & _T_679 | _T_602[0]
     & _T_754; // @[Misc.scala 214:29]
  wire  _T_757 = auto_in_1_c_bits_address[4] & _T_615 & _T_630 & _T_657 & _T_708; // @[Misc.scala 213:27]
  wire  _T_759 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_622 | _T_602[2] & _T_643 | _T_602[1]
     & _T_682 | _T_602[0] & _T_757; // @[Misc.scala 214:29]
  wire  _T_760 = auto_in_1_c_bits_address[4] & _T_615 & _T_630 & _T_657 & auto_in_1_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_762 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_622 | _T_602[2] & _T_643 | _T_602[1]
     & _T_682 | _T_602[0] & _T_760; // @[Misc.scala 214:29]
  wire  _T_763 = auto_in_1_c_bits_address[4] & _T_615 & _T_630 & auto_in_1_c_bits_address[1] & _T_708; // @[Misc.scala 213:27]
  wire  _T_765 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_622 | _T_602[2] & _T_643 | _T_602[1]
     & _T_685 | _T_602[0] & _T_763; // @[Misc.scala 214:29]
  wire  _T_766 = auto_in_1_c_bits_address[4] & _T_615 & _T_630 & auto_in_1_c_bits_address[1] & auto_in_1_c_bits_address[
    0]; // @[Misc.scala 213:27]
  wire  _T_768 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_622 | _T_602[2] & _T_643 | _T_602[1]
     & _T_685 | _T_602[0] & _T_766; // @[Misc.scala 214:29]
  wire  _T_769 = auto_in_1_c_bits_address[4] & _T_615 & auto_in_1_c_bits_address[2] & _T_657 & _T_708; // @[Misc.scala 213:27]
  wire  _T_771 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_622 | _T_602[2] & _T_646 | _T_602[1]
     & _T_688 | _T_602[0] & _T_769; // @[Misc.scala 214:29]
  wire  _T_772 = auto_in_1_c_bits_address[4] & _T_615 & auto_in_1_c_bits_address[2] & _T_657 & auto_in_1_c_bits_address[
    0]; // @[Misc.scala 213:27]
  wire  _T_774 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_622 | _T_602[2] & _T_646 | _T_602[1]
     & _T_688 | _T_602[0] & _T_772; // @[Misc.scala 214:29]
  wire  _T_775 = auto_in_1_c_bits_address[4] & _T_615 & auto_in_1_c_bits_address[2] & auto_in_1_c_bits_address[1] &
    _T_708; // @[Misc.scala 213:27]
  wire  _T_777 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_622 | _T_602[2] & _T_646 | _T_602[1]
     & _T_691 | _T_602[0] & _T_775; // @[Misc.scala 214:29]
  wire  _T_778 = auto_in_1_c_bits_address[4] & _T_615 & auto_in_1_c_bits_address[2] & auto_in_1_c_bits_address[1] &
    auto_in_1_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_780 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_622 | _T_602[2] & _T_646 | _T_602[1]
     & _T_691 | _T_602[0] & _T_778; // @[Misc.scala 214:29]
  wire  _T_781 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & _T_630 & _T_657 & _T_708; // @[Misc.scala 213:27]
  wire  _T_783 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_625 | _T_602[2] & _T_649 | _T_602[1]
     & _T_694 | _T_602[0] & _T_781; // @[Misc.scala 214:29]
  wire  _T_784 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & _T_630 & _T_657 & auto_in_1_c_bits_address[
    0]; // @[Misc.scala 213:27]
  wire  _T_786 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_625 | _T_602[2] & _T_649 | _T_602[1]
     & _T_694 | _T_602[0] & _T_784; // @[Misc.scala 214:29]
  wire  _T_787 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & _T_630 & auto_in_1_c_bits_address[1] &
    _T_708; // @[Misc.scala 213:27]
  wire  _T_789 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_625 | _T_602[2] & _T_649 | _T_602[1]
     & _T_697 | _T_602[0] & _T_787; // @[Misc.scala 214:29]
  wire  _T_790 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & _T_630 & auto_in_1_c_bits_address[1] &
    auto_in_1_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_792 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_625 | _T_602[2] & _T_649 | _T_602[1]
     & _T_697 | _T_602[0] & _T_790; // @[Misc.scala 214:29]
  wire  _T_793 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] & _T_657 &
    _T_708; // @[Misc.scala 213:27]
  wire  _T_795 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_625 | _T_602[2] & _T_652 | _T_602[1]
     & _T_700 | _T_602[0] & _T_793; // @[Misc.scala 214:29]
  wire  _T_796 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] & _T_657 &
    auto_in_1_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_798 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_625 | _T_602[2] & _T_652 | _T_602[1]
     & _T_700 | _T_602[0] & _T_796; // @[Misc.scala 214:29]
  wire  _T_799 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] &
    auto_in_1_c_bits_address[1] & _T_708; // @[Misc.scala 213:27]
  wire  _T_801 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_625 | _T_602[2] & _T_652 | _T_602[1]
     & _T_703 | _T_602[0] & _T_799; // @[Misc.scala 214:29]
  wire  _T_802 = auto_in_1_c_bits_address[4] & auto_in_1_c_bits_address[3] & auto_in_1_c_bits_address[2] &
    auto_in_1_c_bits_address[1] & auto_in_1_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_804 = _T_603 | _T_602[4] & auto_in_1_c_bits_address[4] | _T_602[3] & _T_625 | _T_602[2] & _T_652 | _T_602[1]
     & _T_703 | _T_602[0] & _T_802; // @[Misc.scala 214:29]
  wire [7:0] lo_lo_1 = {_T_732,_T_729,_T_726,_T_723,_T_720,_T_717,_T_714,_T_711}; // @[Cat.scala 30:58]
  wire [15:0] lo_1 = {_T_756,_T_753,_T_750,_T_747,_T_744,_T_741,_T_738,_T_735,lo_lo_1}; // @[Cat.scala 30:58]
  wire [7:0] hi_lo_1 = {_T_780,_T_777,_T_774,_T_771,_T_768,_T_765,_T_762,_T_759}; // @[Cat.scala 30:58]
  wire [31:0] _T_805 = {_T_804,_T_801,_T_798,_T_795,_T_792,_T_789,_T_786,_T_783,hi_lo_1,lo_1}; // @[Cat.scala 30:58]
  wire  _T_806 = auto_in_1_c_bits_opcode == 3'h6; // @[CacheCork.scala 103:53]
  wire  _WIRE_69_ready = q_2_io_enq_ready; // @[CacheCork.scala 102:23 Decoupled.scala 323:17]
  reg  REG_9_0; // @[Arbiter.scala 116:26]
  wire  _T_951_0 = _T_894 ? _T_907[0] : REG_9_0; // @[Arbiter.scala 121:24]
  wire  _T_952 = auto_out_1_a_ready & _T_951_0; // @[Arbiter.scala 123:31]
  reg  REG_6; // @[Edges.scala 228:27]
  wire  _T_833 = ~REG_6; // @[Edges.scala 230:25]
  reg  REG_10; // @[Arbiter.scala 87:30]
  wire  _T_995 = ~REG_10; // @[Arbiter.scala 88:28]
  wire  _WIRE_99_earlyValid = q_3_io_deq_valid; // @[ReadyValidCancel.scala 70:19 71:20]
  wire  _WIRE_98_earlyValid = q_2_io_deq_valid; // @[ReadyValidCancel.scala 70:19 71:20]
  wire [2:0] _T_1003 = {_WIRE_99_earlyValid,_WIRE_98_earlyValid,auto_out_1_d_valid}; // @[Cat.scala 30:58]
  wire [3:0] _T_1004 = {_T_1003, 1'h0}; // @[package.scala 244:48]
  wire [2:0] _T_1006 = _T_1003 | _T_1004[2:0]; // @[package.scala 244:43]
  wire [4:0] _T_1007 = {_T_1006, 2'h0}; // @[package.scala 244:48]
  wire [2:0] _T_1009 = _T_1006 | _T_1007[2:0]; // @[package.scala 244:43]
  wire [3:0] _T_1011 = {_T_1009, 1'h0}; // @[Arbiter.scala 16:78]
  wire [2:0] _T_1013 = ~_T_1011[2:0]; // @[Arbiter.scala 16:61]
  wire  _T_1017 = _T_1013[0] & auto_out_1_d_valid; // @[Arbiter.scala 97:79]
  reg  REG_11_0; // @[Arbiter.scala 116:26]
  wire  _T_1069_0 = _T_995 ? _T_1017 : REG_11_0; // @[Arbiter.scala 117:30]
  wire [2:0] _GEN_123 = auto_out_1_d_bits_opcode == 3'h1 & auto_out_1_d_bits_source[0] ? 3'h5 : auto_out_1_d_bits_opcode
    ; // @[CacheCork.scala 132:13 152:76 153:27]
  wire [2:0] _GEN_125 = auto_out_1_d_bits_opcode == 3'h0 & ~auto_out_1_d_bits_source[0] ? 3'h6 : _GEN_123; // @[CacheCork.scala 156:73 157:27]
  wire [2:0] _T_1123 = _T_1069_0 ? _GEN_125 : 3'h0; // @[Mux.scala 27:72]
  wire  _T_1018 = _T_1013[1] & _WIRE_98_earlyValid; // @[Arbiter.scala 97:79]
  reg  REG_11_1; // @[Arbiter.scala 116:26]
  wire  _T_1069_1 = _T_995 ? _T_1018 : REG_11_1; // @[Arbiter.scala 117:30]
  wire [2:0] _WIRE_98_bits_opcode = q_2_io_deq_bits_opcode; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_1124 = _T_1069_1 ? _WIRE_98_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1126 = _T_1123 | _T_1124; // @[Mux.scala 27:72]
  wire  _T_1019 = _T_1013[2] & _WIRE_99_earlyValid; // @[Arbiter.scala 97:79]
  reg  REG_11_2; // @[Arbiter.scala 116:26]
  wire  _T_1069_2 = _T_995 ? _T_1019 : REG_11_2; // @[Arbiter.scala 117:30]
  wire [2:0] _WIRE_99_bits_opcode = q_3_io_deq_bits_opcode; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_1125 = _T_1069_2 ? _WIRE_99_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1127 = _T_1126 | _T_1125; // @[Mux.scala 27:72]
  wire  _T_843 = _T_1127 == 3'h5 | _T_1127 == 3'h4; // @[CacheCork.scala 123:54]
  wire  _T_855 = IDPool_1_io_alloc_valid | ~_T_833 | ~_T_843; // @[CacheCork.scala 126:70]
  wire  _T_856 = auto_in_1_d_ready & (IDPool_1_io_alloc_valid | ~_T_833 | ~_T_843); // @[CacheCork.scala 126:34]
  wire  _T_1081 = REG_11_0 & auto_out_1_d_valid | REG_11_1 & _WIRE_98_earlyValid | REG_11_2 & _WIRE_99_earlyValid; // @[Mux.scala 27:72]
  wire  _T_1082 = _T_995 ? auto_out_1_d_valid | _WIRE_98_earlyValid | _WIRE_99_earlyValid : _T_1081; // @[Arbiter.scala 125:29]
  wire  _T_823 = _T_856 & _T_1082; // @[Decoupled.scala 40:37]
  wire [2:0] _T_1113 = _T_1069_0 ? auto_out_1_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _WIRE_98_bits_size = q_2_io_deq_bits_size; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_1114 = _T_1069_1 ? _WIRE_98_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1116 = _T_1113 | _T_1114; // @[Mux.scala 27:72]
  wire [2:0] _WIRE_99_bits_size = q_3_io_deq_bits_size; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_1115 = _T_1069_2 ? _WIRE_99_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1117 = _T_1116 | _T_1115; // @[Mux.scala 27:72]
  wire [12:0] _T_825 = 13'h3f << _T_1117; // @[package.scala 234:77]
  wire [5:0] _T_827 = ~_T_825[5:0]; // @[package.scala 234:46]
  wire  _T_830 = _T_1127[0] & _T_827[5]; // @[Edges.scala 220:14]
  wire  _T_832 = REG_6 - 1'h1; // @[Edges.scala 229:28]
  wire  _T_851 = _T_1082 & _T_855; // @[CacheCork.scala 125:34]
  wire  _T_844 = auto_in_1_d_ready & _T_851; // @[Decoupled.scala 40:37]
  reg [2:0] r_2; // @[Reg.scala 15:16]
  wire [1:0] _GEN_124 = auto_out_1_d_bits_opcode == 3'h1 & auto_out_1_d_bits_source[0] ? 2'h0 : auto_out_1_d_bits_param; // @[CacheCork.scala 132:13 152:76 154:26]
  wire [12:0] _T_879 = 13'h3f << auto_in_1_c_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_881 = ~_T_879[5:0]; // @[package.scala 234:46]
  wire [12:0] _T_887 = 13'h3f << auto_in_1_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_889 = ~_T_887[5:0]; // @[package.scala 234:46]
  wire  _T_892 = ~_GEN_63[2]; // @[Edges.scala 91:28]
  wire  _T_893 = _T_892 & _T_889[5]; // @[Edges.scala 220:14]
  wire  _T_895 = _T_894 & auto_out_1_a_ready; // @[Arbiter.scala 89:24]
  wire  _T_910 = _T_907[0] & _T_586; // @[Arbiter.scala 97:79]
  wire  _T_911 = _T_907[1] & _T_575; // @[Arbiter.scala 97:79]
  wire  _T_926 = _T_586 | _T_575; // @[Arbiter.scala 107:36]
  wire  _T_940 = _T_910 & _T_881[5]; // @[Arbiter.scala 111:73]
  wire  _T_941 = _T_911 & _T_893; // @[Arbiter.scala 111:73]
  wire  _T_942 = _T_940 | _T_941; // @[Arbiter.scala 112:44]
  wire  _T_949_0 = _T_894 ? _T_910 : REG_9_0; // @[Arbiter.scala 117:30]
  wire  _T_949_1 = _T_894 ? _T_911 : REG_9_1; // @[Arbiter.scala 117:30]
  wire  _T_957 = REG_9_0 & _T_586 | REG_9_1 & _T_575; // @[Mux.scala 27:72]
  wire  _T_958 = _T_894 ? _T_926 : _T_957; // @[Arbiter.scala 125:29]
  wire  _T_945 = auto_out_1_a_ready & _T_958; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_965 = _T_949_0 ? auto_in_1_c_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_966 = _T_949_1 ? auto_in_1_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_968 = _T_949_0 ? _T_805 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_969 = _T_949_1 ? auto_in_1_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_971 = _T_949_0 ? auto_in_1_c_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_972 = _T_949_1 ? auto_in_1_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_974 = _T_949_0 ? _T_587 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_975 = _T_949_1 ? _GEN_65 : 6'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_977 = _T_949_0 ? auto_in_1_c_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_978 = _T_949_1 ? auto_in_1_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [12:0] _T_989 = 13'h3f << auto_out_1_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_991 = ~_T_989[5:0]; // @[package.scala 234:46]
  wire  _T_994 = _GEN_125[0] & _T_991[5]; // @[Edges.scala 220:14]
  wire  _T_996 = _T_995 & _T_856; // @[Arbiter.scala 89:24]
  wire  _T_1058 = _T_1017 & _T_994; // @[Arbiter.scala 111:73]
  wire  _T_1071_0 = _T_995 ? _T_1013[0] : REG_11_0; // @[Arbiter.scala 121:24]
  wire  _T_1071_1 = _T_995 ? _T_1013[1] : REG_11_1; // @[Arbiter.scala 121:24]
  wire  _T_1071_2 = _T_995 ? _T_1013[2] : REG_11_2; // @[Arbiter.scala 121:24]
  wire [255:0] _T_1093 = _T_1069_0 ? auto_out_1_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _WIRE_98_bits_data = q_2_io_deq_bits_data; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [255:0] _T_1094 = _T_1069_1 ? _WIRE_98_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _WIRE_99_bits_data = q_3_io_deq_bits_data; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [255:0] _T_1095 = _T_1069_2 ? _WIRE_99_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_1096 = _T_1093 | _T_1094; // @[Mux.scala 27:72]
  wire  _WIRE_98_bits_denied = q_2_io_deq_bits_denied; // @[ReadyValidCancel.scala 70:19 73:14]
  wire  _WIRE_99_bits_denied = q_3_io_deq_bits_denied; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_1108 = _T_1069_0 ? auto_out_1_d_bits_source[5:1] : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _WIRE_98_bits_source = q_2_io_deq_bits_source; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_1109 = _T_1069_1 ? _WIRE_98_bits_source : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _WIRE_99_bits_source = q_3_io_deq_bits_source; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_1110 = _T_1069_2 ? _WIRE_99_bits_source : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1111 = _T_1108 | _T_1109; // @[Mux.scala 27:72]
  wire [1:0] _T_1118 = _T_1069_0 ? _GEN_124 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _WIRE_98_bits_param = q_2_io_deq_bits_param; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [1:0] _T_1119 = _T_1069_1 ? _WIRE_98_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _WIRE_99_bits_param = q_3_io_deq_bits_param; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [1:0] _T_1120 = _T_1069_2 ? _WIRE_99_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1121 = _T_1118 | _T_1119; // @[Mux.scala 27:72]
  wire  _T_1132 = auto_in_2_a_bits_opcode == 3'h0 | auto_in_2_a_bits_opcode == 3'h1; // @[CacheCork.scala 66:54]
  wire  _T_1133 = auto_in_2_a_bits_opcode == 3'h6; // @[CacheCork.scala 67:37]
  wire  _T_1136 = auto_in_2_a_bits_opcode == 3'h7; // @[CacheCork.scala 68:37]
  wire  _T_1137 = auto_in_2_a_bits_opcode == 3'h6 & auto_in_2_a_bits_param == 3'h2 | _T_1136; // @[CacheCork.scala 67:97]
  wire  _WIRE_121_ready = q_5_io_enq_ready; // @[CacheCork.scala 65:23 Decoupled.scala 323:17]
  reg  REG_14; // @[Arbiter.scala 87:30]
  wire  _T_1459 = ~REG_14; // @[Arbiter.scala 88:28]
  wire  _T_1140 = auto_in_2_a_valid & ~_T_1137; // @[CacheCork.scala 71:33]
  wire  _T_1151 = auto_in_2_c_valid & auto_in_2_c_bits_opcode == 3'h7; // @[CacheCork.scala 92:33]
  wire [1:0] _T_1465 = {_T_1140,_T_1151}; // @[Cat.scala 30:58]
  wire [2:0] _T_1466 = {_T_1465, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_1468 = _T_1465 | _T_1466[1:0]; // @[package.scala 244:43]
  wire [2:0] _T_1470 = {_T_1468, 1'h0}; // @[Arbiter.scala 16:78]
  wire [1:0] _T_1472 = ~_T_1470[1:0]; // @[Arbiter.scala 16:61]
  reg  REG_15_1; // @[Arbiter.scala 116:26]
  wire  _T_1516_1 = _T_1459 ? _T_1472[1] : REG_15_1; // @[Arbiter.scala 121:24]
  wire  _T_1518 = auto_out_2_a_ready & _T_1516_1; // @[Arbiter.scala 123:31]
  wire [5:0] _T_1141 = {auto_in_2_a_bits_source, 1'h0}; // @[CacheCork.scala 73:45]
  wire [5:0] _GEN_254 = {{5'd0}, _T_1132}; // @[CacheCork.scala 73:50]
  wire [5:0] _T_1143 = _T_1141 | _GEN_254; // @[CacheCork.scala 73:50]
  wire [5:0] _T_1148 = _T_1141 | 6'h1; // @[CacheCork.scala 79:52]
  wire [2:0] _GEN_126 = _T_1133 | _T_1136 ? 3'h4 : auto_in_2_a_bits_opcode; // @[CacheCork.scala 72:18 76:86 77:27]
  wire [5:0] _GEN_128 = _T_1133 | _T_1136 ? _T_1148 : _T_1143; // @[CacheCork.scala 73:25 76:86 79:27]
  wire [5:0] _T_1152 = {auto_in_2_c_bits_source, 1'h0}; // @[CacheCork.scala 94:41]
  wire [4:0] _T_1164 = {{2'd0}, auto_in_2_c_bits_size}; // @[Misc.scala 201:34]
  wire [2:0] shiftAmount_2 = _T_1164[2:0]; // @[OneHot.scala 64:49]
  wire [7:0] _T_1165 = 8'h1 << shiftAmount_2; // @[OneHot.scala 65:12]
  wire [4:0] _T_1167 = _T_1165[4:0] | 5'h1; // @[Misc.scala 201:81]
  wire  _T_1168 = auto_in_2_c_bits_size >= 3'h5; // @[Misc.scala 205:21]
  wire  _T_1171 = ~auto_in_2_c_bits_address[4]; // @[Misc.scala 210:20]
  wire  _T_1180 = ~auto_in_2_c_bits_address[3]; // @[Misc.scala 210:20]
  wire  _T_1181 = _T_1171 & _T_1180; // @[Misc.scala 213:27]
  wire  _T_1184 = _T_1171 & auto_in_2_c_bits_address[3]; // @[Misc.scala 213:27]
  wire  _T_1187 = auto_in_2_c_bits_address[4] & _T_1180; // @[Misc.scala 213:27]
  wire  _T_1190 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3]; // @[Misc.scala 213:27]
  wire  _T_1195 = ~auto_in_2_c_bits_address[2]; // @[Misc.scala 210:20]
  wire  _T_1196 = _T_1171 & _T_1180 & _T_1195; // @[Misc.scala 213:27]
  wire  _T_1199 = _T_1171 & _T_1180 & auto_in_2_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_1202 = _T_1171 & auto_in_2_c_bits_address[3] & _T_1195; // @[Misc.scala 213:27]
  wire  _T_1205 = _T_1171 & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_1208 = auto_in_2_c_bits_address[4] & _T_1180 & _T_1195; // @[Misc.scala 213:27]
  wire  _T_1211 = auto_in_2_c_bits_address[4] & _T_1180 & auto_in_2_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_1214 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & _T_1195; // @[Misc.scala 213:27]
  wire  _T_1217 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_1222 = ~auto_in_2_c_bits_address[1]; // @[Misc.scala 210:20]
  wire  _T_1223 = _T_1171 & _T_1180 & _T_1195 & _T_1222; // @[Misc.scala 213:27]
  wire  _T_1226 = _T_1171 & _T_1180 & _T_1195 & auto_in_2_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1229 = _T_1171 & _T_1180 & auto_in_2_c_bits_address[2] & _T_1222; // @[Misc.scala 213:27]
  wire  _T_1232 = _T_1171 & _T_1180 & auto_in_2_c_bits_address[2] & auto_in_2_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1235 = _T_1171 & auto_in_2_c_bits_address[3] & _T_1195 & _T_1222; // @[Misc.scala 213:27]
  wire  _T_1238 = _T_1171 & auto_in_2_c_bits_address[3] & _T_1195 & auto_in_2_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1241 = _T_1171 & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] & _T_1222; // @[Misc.scala 213:27]
  wire  _T_1244 = _T_1171 & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] & auto_in_2_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1247 = auto_in_2_c_bits_address[4] & _T_1180 & _T_1195 & _T_1222; // @[Misc.scala 213:27]
  wire  _T_1250 = auto_in_2_c_bits_address[4] & _T_1180 & _T_1195 & auto_in_2_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1253 = auto_in_2_c_bits_address[4] & _T_1180 & auto_in_2_c_bits_address[2] & _T_1222; // @[Misc.scala 213:27]
  wire  _T_1256 = auto_in_2_c_bits_address[4] & _T_1180 & auto_in_2_c_bits_address[2] & auto_in_2_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1259 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & _T_1195 & _T_1222; // @[Misc.scala 213:27]
  wire  _T_1262 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & _T_1195 & auto_in_2_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1265 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] & _T_1222; // @[Misc.scala 213:27]
  wire  _T_1268 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] &
    auto_in_2_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1273 = ~auto_in_2_c_bits_address[0]; // @[Misc.scala 210:20]
  wire  _T_1274 = _T_1171 & _T_1180 & _T_1195 & _T_1222 & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1276 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1181 | _T_1167[2] & _T_1196 | _T_1167[1] & _T_1223 |
    _T_1167[0] & _T_1274; // @[Misc.scala 214:29]
  wire  _T_1277 = _T_1171 & _T_1180 & _T_1195 & _T_1222 & auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1279 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1181 | _T_1167[2] & _T_1196 | _T_1167[1] & _T_1223 |
    _T_1167[0] & _T_1277; // @[Misc.scala 214:29]
  wire  _T_1280 = _T_1171 & _T_1180 & _T_1195 & auto_in_2_c_bits_address[1] & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1282 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1181 | _T_1167[2] & _T_1196 | _T_1167[1] & _T_1226 |
    _T_1167[0] & _T_1280; // @[Misc.scala 214:29]
  wire  _T_1283 = _T_1171 & _T_1180 & _T_1195 & auto_in_2_c_bits_address[1] & auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1285 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1181 | _T_1167[2] & _T_1196 | _T_1167[1] & _T_1226 |
    _T_1167[0] & _T_1283; // @[Misc.scala 214:29]
  wire  _T_1286 = _T_1171 & _T_1180 & auto_in_2_c_bits_address[2] & _T_1222 & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1288 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1181 | _T_1167[2] & _T_1199 | _T_1167[1] & _T_1229 |
    _T_1167[0] & _T_1286; // @[Misc.scala 214:29]
  wire  _T_1289 = _T_1171 & _T_1180 & auto_in_2_c_bits_address[2] & _T_1222 & auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1291 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1181 | _T_1167[2] & _T_1199 | _T_1167[1] & _T_1229 |
    _T_1167[0] & _T_1289; // @[Misc.scala 214:29]
  wire  _T_1292 = _T_1171 & _T_1180 & auto_in_2_c_bits_address[2] & auto_in_2_c_bits_address[1] & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1294 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1181 | _T_1167[2] & _T_1199 | _T_1167[1] & _T_1232 |
    _T_1167[0] & _T_1292; // @[Misc.scala 214:29]
  wire  _T_1295 = _T_1171 & _T_1180 & auto_in_2_c_bits_address[2] & auto_in_2_c_bits_address[1] &
    auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1297 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1181 | _T_1167[2] & _T_1199 | _T_1167[1] & _T_1232 |
    _T_1167[0] & _T_1295; // @[Misc.scala 214:29]
  wire  _T_1298 = _T_1171 & auto_in_2_c_bits_address[3] & _T_1195 & _T_1222 & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1300 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1184 | _T_1167[2] & _T_1202 | _T_1167[1] & _T_1235 |
    _T_1167[0] & _T_1298; // @[Misc.scala 214:29]
  wire  _T_1301 = _T_1171 & auto_in_2_c_bits_address[3] & _T_1195 & _T_1222 & auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1303 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1184 | _T_1167[2] & _T_1202 | _T_1167[1] & _T_1235 |
    _T_1167[0] & _T_1301; // @[Misc.scala 214:29]
  wire  _T_1304 = _T_1171 & auto_in_2_c_bits_address[3] & _T_1195 & auto_in_2_c_bits_address[1] & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1306 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1184 | _T_1167[2] & _T_1202 | _T_1167[1] & _T_1238 |
    _T_1167[0] & _T_1304; // @[Misc.scala 214:29]
  wire  _T_1307 = _T_1171 & auto_in_2_c_bits_address[3] & _T_1195 & auto_in_2_c_bits_address[1] &
    auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1309 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1184 | _T_1167[2] & _T_1202 | _T_1167[1] & _T_1238 |
    _T_1167[0] & _T_1307; // @[Misc.scala 214:29]
  wire  _T_1310 = _T_1171 & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] & _T_1222 & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1312 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1184 | _T_1167[2] & _T_1205 | _T_1167[1] & _T_1241 |
    _T_1167[0] & _T_1310; // @[Misc.scala 214:29]
  wire  _T_1313 = _T_1171 & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] & _T_1222 &
    auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1315 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1184 | _T_1167[2] & _T_1205 | _T_1167[1] & _T_1241 |
    _T_1167[0] & _T_1313; // @[Misc.scala 214:29]
  wire  _T_1316 = _T_1171 & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] & auto_in_2_c_bits_address[1] &
    _T_1273; // @[Misc.scala 213:27]
  wire  _T_1318 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1184 | _T_1167[2] & _T_1205 | _T_1167[1] & _T_1244 |
    _T_1167[0] & _T_1316; // @[Misc.scala 214:29]
  wire  _T_1319 = _T_1171 & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] & auto_in_2_c_bits_address[1] &
    auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1321 = _T_1168 | _T_1167[4] & _T_1171 | _T_1167[3] & _T_1184 | _T_1167[2] & _T_1205 | _T_1167[1] & _T_1244 |
    _T_1167[0] & _T_1319; // @[Misc.scala 214:29]
  wire  _T_1322 = auto_in_2_c_bits_address[4] & _T_1180 & _T_1195 & _T_1222 & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1324 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1187 | _T_1167[2] & _T_1208 |
    _T_1167[1] & _T_1247 | _T_1167[0] & _T_1322; // @[Misc.scala 214:29]
  wire  _T_1325 = auto_in_2_c_bits_address[4] & _T_1180 & _T_1195 & _T_1222 & auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1327 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1187 | _T_1167[2] & _T_1208 |
    _T_1167[1] & _T_1247 | _T_1167[0] & _T_1325; // @[Misc.scala 214:29]
  wire  _T_1328 = auto_in_2_c_bits_address[4] & _T_1180 & _T_1195 & auto_in_2_c_bits_address[1] & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1330 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1187 | _T_1167[2] & _T_1208 |
    _T_1167[1] & _T_1250 | _T_1167[0] & _T_1328; // @[Misc.scala 214:29]
  wire  _T_1331 = auto_in_2_c_bits_address[4] & _T_1180 & _T_1195 & auto_in_2_c_bits_address[1] &
    auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1333 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1187 | _T_1167[2] & _T_1208 |
    _T_1167[1] & _T_1250 | _T_1167[0] & _T_1331; // @[Misc.scala 214:29]
  wire  _T_1334 = auto_in_2_c_bits_address[4] & _T_1180 & auto_in_2_c_bits_address[2] & _T_1222 & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1336 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1187 | _T_1167[2] & _T_1211 |
    _T_1167[1] & _T_1253 | _T_1167[0] & _T_1334; // @[Misc.scala 214:29]
  wire  _T_1337 = auto_in_2_c_bits_address[4] & _T_1180 & auto_in_2_c_bits_address[2] & _T_1222 &
    auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1339 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1187 | _T_1167[2] & _T_1211 |
    _T_1167[1] & _T_1253 | _T_1167[0] & _T_1337; // @[Misc.scala 214:29]
  wire  _T_1340 = auto_in_2_c_bits_address[4] & _T_1180 & auto_in_2_c_bits_address[2] & auto_in_2_c_bits_address[1] &
    _T_1273; // @[Misc.scala 213:27]
  wire  _T_1342 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1187 | _T_1167[2] & _T_1211 |
    _T_1167[1] & _T_1256 | _T_1167[0] & _T_1340; // @[Misc.scala 214:29]
  wire  _T_1343 = auto_in_2_c_bits_address[4] & _T_1180 & auto_in_2_c_bits_address[2] & auto_in_2_c_bits_address[1] &
    auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1345 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1187 | _T_1167[2] & _T_1211 |
    _T_1167[1] & _T_1256 | _T_1167[0] & _T_1343; // @[Misc.scala 214:29]
  wire  _T_1346 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & _T_1195 & _T_1222 & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1348 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1190 | _T_1167[2] & _T_1214 |
    _T_1167[1] & _T_1259 | _T_1167[0] & _T_1346; // @[Misc.scala 214:29]
  wire  _T_1349 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & _T_1195 & _T_1222 &
    auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1351 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1190 | _T_1167[2] & _T_1214 |
    _T_1167[1] & _T_1259 | _T_1167[0] & _T_1349; // @[Misc.scala 214:29]
  wire  _T_1352 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & _T_1195 & auto_in_2_c_bits_address[1] &
    _T_1273; // @[Misc.scala 213:27]
  wire  _T_1354 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1190 | _T_1167[2] & _T_1214 |
    _T_1167[1] & _T_1262 | _T_1167[0] & _T_1352; // @[Misc.scala 214:29]
  wire  _T_1355 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & _T_1195 & auto_in_2_c_bits_address[1] &
    auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1357 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1190 | _T_1167[2] & _T_1214 |
    _T_1167[1] & _T_1262 | _T_1167[0] & _T_1355; // @[Misc.scala 214:29]
  wire  _T_1358 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] & _T_1222 &
    _T_1273; // @[Misc.scala 213:27]
  wire  _T_1360 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1190 | _T_1167[2] & _T_1217 |
    _T_1167[1] & _T_1265 | _T_1167[0] & _T_1358; // @[Misc.scala 214:29]
  wire  _T_1361 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] & _T_1222 &
    auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1363 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1190 | _T_1167[2] & _T_1217 |
    _T_1167[1] & _T_1265 | _T_1167[0] & _T_1361; // @[Misc.scala 214:29]
  wire  _T_1364 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] &
    auto_in_2_c_bits_address[1] & _T_1273; // @[Misc.scala 213:27]
  wire  _T_1366 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1190 | _T_1167[2] & _T_1217 |
    _T_1167[1] & _T_1268 | _T_1167[0] & _T_1364; // @[Misc.scala 214:29]
  wire  _T_1367 = auto_in_2_c_bits_address[4] & auto_in_2_c_bits_address[3] & auto_in_2_c_bits_address[2] &
    auto_in_2_c_bits_address[1] & auto_in_2_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1369 = _T_1168 | _T_1167[4] & auto_in_2_c_bits_address[4] | _T_1167[3] & _T_1190 | _T_1167[2] & _T_1217 |
    _T_1167[1] & _T_1268 | _T_1167[0] & _T_1367; // @[Misc.scala 214:29]
  wire [7:0] lo_lo_2 = {_T_1297,_T_1294,_T_1291,_T_1288,_T_1285,_T_1282,_T_1279,_T_1276}; // @[Cat.scala 30:58]
  wire [15:0] lo_2 = {_T_1321,_T_1318,_T_1315,_T_1312,_T_1309,_T_1306,_T_1303,_T_1300,lo_lo_2}; // @[Cat.scala 30:58]
  wire [7:0] hi_lo_2 = {_T_1345,_T_1342,_T_1339,_T_1336,_T_1333,_T_1330,_T_1327,_T_1324}; // @[Cat.scala 30:58]
  wire [31:0] _T_1370 = {_T_1369,_T_1366,_T_1363,_T_1360,_T_1357,_T_1354,_T_1351,_T_1348,hi_lo_2,lo_2}; // @[Cat.scala 30:58]
  wire  _T_1371 = auto_in_2_c_bits_opcode == 3'h6; // @[CacheCork.scala 103:53]
  wire  _WIRE_125_ready = q_4_io_enq_ready; // @[CacheCork.scala 102:23 Decoupled.scala 323:17]
  reg  REG_15_0; // @[Arbiter.scala 116:26]
  wire  _T_1516_0 = _T_1459 ? _T_1472[0] : REG_15_0; // @[Arbiter.scala 121:24]
  wire  _T_1517 = auto_out_2_a_ready & _T_1516_0; // @[Arbiter.scala 123:31]
  reg  REG_12; // @[Edges.scala 228:27]
  wire  _T_1398 = ~REG_12; // @[Edges.scala 230:25]
  reg  REG_16; // @[Arbiter.scala 87:30]
  wire  _T_1560 = ~REG_16; // @[Arbiter.scala 88:28]
  wire  _WIRE_155_earlyValid = q_5_io_deq_valid; // @[ReadyValidCancel.scala 70:19 71:20]
  wire  _WIRE_154_earlyValid = q_4_io_deq_valid; // @[ReadyValidCancel.scala 70:19 71:20]
  wire [2:0] _T_1568 = {_WIRE_155_earlyValid,_WIRE_154_earlyValid,auto_out_2_d_valid}; // @[Cat.scala 30:58]
  wire [3:0] _T_1569 = {_T_1568, 1'h0}; // @[package.scala 244:48]
  wire [2:0] _T_1571 = _T_1568 | _T_1569[2:0]; // @[package.scala 244:43]
  wire [4:0] _T_1572 = {_T_1571, 2'h0}; // @[package.scala 244:48]
  wire [2:0] _T_1574 = _T_1571 | _T_1572[2:0]; // @[package.scala 244:43]
  wire [3:0] _T_1576 = {_T_1574, 1'h0}; // @[Arbiter.scala 16:78]
  wire [2:0] _T_1578 = ~_T_1576[2:0]; // @[Arbiter.scala 16:61]
  wire  _T_1582 = _T_1578[0] & auto_out_2_d_valid; // @[Arbiter.scala 97:79]
  reg  REG_17_0; // @[Arbiter.scala 116:26]
  wire  _T_1634_0 = _T_1560 ? _T_1582 : REG_17_0; // @[Arbiter.scala 117:30]
  wire [2:0] _GEN_186 = auto_out_2_d_bits_opcode == 3'h1 & auto_out_2_d_bits_source[0] ? 3'h5 : auto_out_2_d_bits_opcode
    ; // @[CacheCork.scala 132:13 152:76 153:27]
  wire [2:0] _GEN_188 = auto_out_2_d_bits_opcode == 3'h0 & ~auto_out_2_d_bits_source[0] ? 3'h6 : _GEN_186; // @[CacheCork.scala 156:73 157:27]
  wire [2:0] _T_1688 = _T_1634_0 ? _GEN_188 : 3'h0; // @[Mux.scala 27:72]
  wire  _T_1583 = _T_1578[1] & _WIRE_154_earlyValid; // @[Arbiter.scala 97:79]
  reg  REG_17_1; // @[Arbiter.scala 116:26]
  wire  _T_1634_1 = _T_1560 ? _T_1583 : REG_17_1; // @[Arbiter.scala 117:30]
  wire [2:0] _WIRE_154_bits_opcode = q_4_io_deq_bits_opcode; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_1689 = _T_1634_1 ? _WIRE_154_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1691 = _T_1688 | _T_1689; // @[Mux.scala 27:72]
  wire  _T_1584 = _T_1578[2] & _WIRE_155_earlyValid; // @[Arbiter.scala 97:79]
  reg  REG_17_2; // @[Arbiter.scala 116:26]
  wire  _T_1634_2 = _T_1560 ? _T_1584 : REG_17_2; // @[Arbiter.scala 117:30]
  wire [2:0] _WIRE_155_bits_opcode = q_5_io_deq_bits_opcode; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_1690 = _T_1634_2 ? _WIRE_155_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1692 = _T_1691 | _T_1690; // @[Mux.scala 27:72]
  wire  _T_1408 = _T_1692 == 3'h5 | _T_1692 == 3'h4; // @[CacheCork.scala 123:54]
  wire  _T_1420 = IDPool_2_io_alloc_valid | ~_T_1398 | ~_T_1408; // @[CacheCork.scala 126:70]
  wire  _T_1421 = auto_in_2_d_ready & (IDPool_2_io_alloc_valid | ~_T_1398 | ~_T_1408); // @[CacheCork.scala 126:34]
  wire  _T_1646 = REG_17_0 & auto_out_2_d_valid | REG_17_1 & _WIRE_154_earlyValid | REG_17_2 & _WIRE_155_earlyValid; // @[Mux.scala 27:72]
  wire  _T_1647 = _T_1560 ? auto_out_2_d_valid | _WIRE_154_earlyValid | _WIRE_155_earlyValid : _T_1646; // @[Arbiter.scala 125:29]
  wire  _T_1388 = _T_1421 & _T_1647; // @[Decoupled.scala 40:37]
  wire [2:0] _T_1678 = _T_1634_0 ? auto_out_2_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _WIRE_154_bits_size = q_4_io_deq_bits_size; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_1679 = _T_1634_1 ? _WIRE_154_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1681 = _T_1678 | _T_1679; // @[Mux.scala 27:72]
  wire [2:0] _WIRE_155_bits_size = q_5_io_deq_bits_size; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_1680 = _T_1634_2 ? _WIRE_155_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1682 = _T_1681 | _T_1680; // @[Mux.scala 27:72]
  wire [12:0] _T_1390 = 13'h3f << _T_1682; // @[package.scala 234:77]
  wire [5:0] _T_1392 = ~_T_1390[5:0]; // @[package.scala 234:46]
  wire  _T_1395 = _T_1692[0] & _T_1392[5]; // @[Edges.scala 220:14]
  wire  _T_1397 = REG_12 - 1'h1; // @[Edges.scala 229:28]
  wire  _T_1416 = _T_1647 & _T_1420; // @[CacheCork.scala 125:34]
  wire  _T_1409 = auto_in_2_d_ready & _T_1416; // @[Decoupled.scala 40:37]
  reg [2:0] r_4; // @[Reg.scala 15:16]
  wire [1:0] _GEN_187 = auto_out_2_d_bits_opcode == 3'h1 & auto_out_2_d_bits_source[0] ? 2'h0 : auto_out_2_d_bits_param; // @[CacheCork.scala 132:13 152:76 154:26]
  wire [12:0] _T_1444 = 13'h3f << auto_in_2_c_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_1446 = ~_T_1444[5:0]; // @[package.scala 234:46]
  wire [12:0] _T_1452 = 13'h3f << auto_in_2_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_1454 = ~_T_1452[5:0]; // @[package.scala 234:46]
  wire  _T_1457 = ~_GEN_126[2]; // @[Edges.scala 91:28]
  wire  _T_1458 = _T_1457 & _T_1454[5]; // @[Edges.scala 220:14]
  wire  _T_1460 = _T_1459 & auto_out_2_a_ready; // @[Arbiter.scala 89:24]
  wire  _T_1475 = _T_1472[0] & _T_1151; // @[Arbiter.scala 97:79]
  wire  _T_1476 = _T_1472[1] & _T_1140; // @[Arbiter.scala 97:79]
  wire  _T_1491 = _T_1151 | _T_1140; // @[Arbiter.scala 107:36]
  wire  _T_1505 = _T_1475 & _T_1446[5]; // @[Arbiter.scala 111:73]
  wire  _T_1506 = _T_1476 & _T_1458; // @[Arbiter.scala 111:73]
  wire  _T_1507 = _T_1505 | _T_1506; // @[Arbiter.scala 112:44]
  wire  _T_1514_0 = _T_1459 ? _T_1475 : REG_15_0; // @[Arbiter.scala 117:30]
  wire  _T_1514_1 = _T_1459 ? _T_1476 : REG_15_1; // @[Arbiter.scala 117:30]
  wire  _T_1522 = REG_15_0 & _T_1151 | REG_15_1 & _T_1140; // @[Mux.scala 27:72]
  wire  _T_1523 = _T_1459 ? _T_1491 : _T_1522; // @[Arbiter.scala 125:29]
  wire  _T_1510 = auto_out_2_a_ready & _T_1523; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_1530 = _T_1514_0 ? auto_in_2_c_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_1531 = _T_1514_1 ? auto_in_2_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1533 = _T_1514_0 ? _T_1370 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1534 = _T_1514_1 ? auto_in_2_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_1536 = _T_1514_0 ? auto_in_2_c_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_1537 = _T_1514_1 ? auto_in_2_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_1539 = _T_1514_0 ? _T_1152 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_1540 = _T_1514_1 ? _GEN_128 : 6'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1542 = _T_1514_0 ? auto_in_2_c_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_1543 = _T_1514_1 ? auto_in_2_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [12:0] _T_1554 = 13'h3f << auto_out_2_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_1556 = ~_T_1554[5:0]; // @[package.scala 234:46]
  wire  _T_1559 = _GEN_188[0] & _T_1556[5]; // @[Edges.scala 220:14]
  wire  _T_1561 = _T_1560 & _T_1421; // @[Arbiter.scala 89:24]
  wire  _T_1623 = _T_1582 & _T_1559; // @[Arbiter.scala 111:73]
  wire  _T_1636_0 = _T_1560 ? _T_1578[0] : REG_17_0; // @[Arbiter.scala 121:24]
  wire  _T_1636_1 = _T_1560 ? _T_1578[1] : REG_17_1; // @[Arbiter.scala 121:24]
  wire  _T_1636_2 = _T_1560 ? _T_1578[2] : REG_17_2; // @[Arbiter.scala 121:24]
  wire [255:0] _T_1658 = _T_1634_0 ? auto_out_2_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _WIRE_154_bits_data = q_4_io_deq_bits_data; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [255:0] _T_1659 = _T_1634_1 ? _WIRE_154_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _WIRE_155_bits_data = q_5_io_deq_bits_data; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [255:0] _T_1660 = _T_1634_2 ? _WIRE_155_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_1661 = _T_1658 | _T_1659; // @[Mux.scala 27:72]
  wire  _WIRE_154_bits_denied = q_4_io_deq_bits_denied; // @[ReadyValidCancel.scala 70:19 73:14]
  wire  _WIRE_155_bits_denied = q_5_io_deq_bits_denied; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_1673 = _T_1634_0 ? auto_out_2_d_bits_source[5:1] : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _WIRE_154_bits_source = q_4_io_deq_bits_source; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_1674 = _T_1634_1 ? _WIRE_154_bits_source : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _WIRE_155_bits_source = q_5_io_deq_bits_source; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_1675 = _T_1634_2 ? _WIRE_155_bits_source : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1676 = _T_1673 | _T_1674; // @[Mux.scala 27:72]
  wire [1:0] _T_1683 = _T_1634_0 ? _GEN_187 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _WIRE_154_bits_param = q_4_io_deq_bits_param; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [1:0] _T_1684 = _T_1634_1 ? _WIRE_154_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _WIRE_155_bits_param = q_5_io_deq_bits_param; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [1:0] _T_1685 = _T_1634_2 ? _WIRE_155_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1686 = _T_1683 | _T_1684; // @[Mux.scala 27:72]
  wire  _T_1697 = auto_in_3_a_bits_opcode == 3'h0 | auto_in_3_a_bits_opcode == 3'h1; // @[CacheCork.scala 66:54]
  wire  _T_1698 = auto_in_3_a_bits_opcode == 3'h6; // @[CacheCork.scala 67:37]
  wire  _T_1701 = auto_in_3_a_bits_opcode == 3'h7; // @[CacheCork.scala 68:37]
  wire  _T_1702 = auto_in_3_a_bits_opcode == 3'h6 & auto_in_3_a_bits_param == 3'h2 | _T_1701; // @[CacheCork.scala 67:97]
  wire  _WIRE_177_ready = q_7_io_enq_ready; // @[CacheCork.scala 65:23 Decoupled.scala 323:17]
  reg  REG_20; // @[Arbiter.scala 87:30]
  wire  _T_2024 = ~REG_20; // @[Arbiter.scala 88:28]
  wire  _T_1705 = auto_in_3_a_valid & ~_T_1702; // @[CacheCork.scala 71:33]
  wire  _T_1716 = auto_in_3_c_valid & auto_in_3_c_bits_opcode == 3'h7; // @[CacheCork.scala 92:33]
  wire [1:0] _T_2030 = {_T_1705,_T_1716}; // @[Cat.scala 30:58]
  wire [2:0] _T_2031 = {_T_2030, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _T_2033 = _T_2030 | _T_2031[1:0]; // @[package.scala 244:43]
  wire [2:0] _T_2035 = {_T_2033, 1'h0}; // @[Arbiter.scala 16:78]
  wire [1:0] _T_2037 = ~_T_2035[1:0]; // @[Arbiter.scala 16:61]
  reg  REG_21_1; // @[Arbiter.scala 116:26]
  wire  _T_2081_1 = _T_2024 ? _T_2037[1] : REG_21_1; // @[Arbiter.scala 121:24]
  wire  _T_2083 = auto_out_3_a_ready & _T_2081_1; // @[Arbiter.scala 123:31]
  wire [5:0] _T_1706 = {auto_in_3_a_bits_source, 1'h0}; // @[CacheCork.scala 73:45]
  wire [5:0] _GEN_255 = {{5'd0}, _T_1697}; // @[CacheCork.scala 73:50]
  wire [5:0] _T_1708 = _T_1706 | _GEN_255; // @[CacheCork.scala 73:50]
  wire [5:0] _T_1713 = _T_1706 | 6'h1; // @[CacheCork.scala 79:52]
  wire [2:0] _GEN_189 = _T_1698 | _T_1701 ? 3'h4 : auto_in_3_a_bits_opcode; // @[CacheCork.scala 72:18 76:86 77:27]
  wire [5:0] _GEN_191 = _T_1698 | _T_1701 ? _T_1713 : _T_1708; // @[CacheCork.scala 73:25 76:86 79:27]
  wire [5:0] _T_1717 = {auto_in_3_c_bits_source, 1'h0}; // @[CacheCork.scala 94:41]
  wire [4:0] _T_1729 = {{2'd0}, auto_in_3_c_bits_size}; // @[Misc.scala 201:34]
  wire [2:0] shiftAmount_3 = _T_1729[2:0]; // @[OneHot.scala 64:49]
  wire [7:0] _T_1730 = 8'h1 << shiftAmount_3; // @[OneHot.scala 65:12]
  wire [4:0] _T_1732 = _T_1730[4:0] | 5'h1; // @[Misc.scala 201:81]
  wire  _T_1733 = auto_in_3_c_bits_size >= 3'h5; // @[Misc.scala 205:21]
  wire  _T_1736 = ~auto_in_3_c_bits_address[4]; // @[Misc.scala 210:20]
  wire  _T_1745 = ~auto_in_3_c_bits_address[3]; // @[Misc.scala 210:20]
  wire  _T_1746 = _T_1736 & _T_1745; // @[Misc.scala 213:27]
  wire  _T_1749 = _T_1736 & auto_in_3_c_bits_address[3]; // @[Misc.scala 213:27]
  wire  _T_1752 = auto_in_3_c_bits_address[4] & _T_1745; // @[Misc.scala 213:27]
  wire  _T_1755 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3]; // @[Misc.scala 213:27]
  wire  _T_1760 = ~auto_in_3_c_bits_address[2]; // @[Misc.scala 210:20]
  wire  _T_1761 = _T_1736 & _T_1745 & _T_1760; // @[Misc.scala 213:27]
  wire  _T_1764 = _T_1736 & _T_1745 & auto_in_3_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_1767 = _T_1736 & auto_in_3_c_bits_address[3] & _T_1760; // @[Misc.scala 213:27]
  wire  _T_1770 = _T_1736 & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_1773 = auto_in_3_c_bits_address[4] & _T_1745 & _T_1760; // @[Misc.scala 213:27]
  wire  _T_1776 = auto_in_3_c_bits_address[4] & _T_1745 & auto_in_3_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_1779 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & _T_1760; // @[Misc.scala 213:27]
  wire  _T_1782 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2]; // @[Misc.scala 213:27]
  wire  _T_1787 = ~auto_in_3_c_bits_address[1]; // @[Misc.scala 210:20]
  wire  _T_1788 = _T_1736 & _T_1745 & _T_1760 & _T_1787; // @[Misc.scala 213:27]
  wire  _T_1791 = _T_1736 & _T_1745 & _T_1760 & auto_in_3_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1794 = _T_1736 & _T_1745 & auto_in_3_c_bits_address[2] & _T_1787; // @[Misc.scala 213:27]
  wire  _T_1797 = _T_1736 & _T_1745 & auto_in_3_c_bits_address[2] & auto_in_3_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1800 = _T_1736 & auto_in_3_c_bits_address[3] & _T_1760 & _T_1787; // @[Misc.scala 213:27]
  wire  _T_1803 = _T_1736 & auto_in_3_c_bits_address[3] & _T_1760 & auto_in_3_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1806 = _T_1736 & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] & _T_1787; // @[Misc.scala 213:27]
  wire  _T_1809 = _T_1736 & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] & auto_in_3_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1812 = auto_in_3_c_bits_address[4] & _T_1745 & _T_1760 & _T_1787; // @[Misc.scala 213:27]
  wire  _T_1815 = auto_in_3_c_bits_address[4] & _T_1745 & _T_1760 & auto_in_3_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1818 = auto_in_3_c_bits_address[4] & _T_1745 & auto_in_3_c_bits_address[2] & _T_1787; // @[Misc.scala 213:27]
  wire  _T_1821 = auto_in_3_c_bits_address[4] & _T_1745 & auto_in_3_c_bits_address[2] & auto_in_3_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1824 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & _T_1760 & _T_1787; // @[Misc.scala 213:27]
  wire  _T_1827 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & _T_1760 & auto_in_3_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1830 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] & _T_1787; // @[Misc.scala 213:27]
  wire  _T_1833 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] &
    auto_in_3_c_bits_address[1]; // @[Misc.scala 213:27]
  wire  _T_1838 = ~auto_in_3_c_bits_address[0]; // @[Misc.scala 210:20]
  wire  _T_1839 = _T_1736 & _T_1745 & _T_1760 & _T_1787 & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1841 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1746 | _T_1732[2] & _T_1761 | _T_1732[1] & _T_1788 |
    _T_1732[0] & _T_1839; // @[Misc.scala 214:29]
  wire  _T_1842 = _T_1736 & _T_1745 & _T_1760 & _T_1787 & auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1844 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1746 | _T_1732[2] & _T_1761 | _T_1732[1] & _T_1788 |
    _T_1732[0] & _T_1842; // @[Misc.scala 214:29]
  wire  _T_1845 = _T_1736 & _T_1745 & _T_1760 & auto_in_3_c_bits_address[1] & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1847 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1746 | _T_1732[2] & _T_1761 | _T_1732[1] & _T_1791 |
    _T_1732[0] & _T_1845; // @[Misc.scala 214:29]
  wire  _T_1848 = _T_1736 & _T_1745 & _T_1760 & auto_in_3_c_bits_address[1] & auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1850 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1746 | _T_1732[2] & _T_1761 | _T_1732[1] & _T_1791 |
    _T_1732[0] & _T_1848; // @[Misc.scala 214:29]
  wire  _T_1851 = _T_1736 & _T_1745 & auto_in_3_c_bits_address[2] & _T_1787 & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1853 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1746 | _T_1732[2] & _T_1764 | _T_1732[1] & _T_1794 |
    _T_1732[0] & _T_1851; // @[Misc.scala 214:29]
  wire  _T_1854 = _T_1736 & _T_1745 & auto_in_3_c_bits_address[2] & _T_1787 & auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1856 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1746 | _T_1732[2] & _T_1764 | _T_1732[1] & _T_1794 |
    _T_1732[0] & _T_1854; // @[Misc.scala 214:29]
  wire  _T_1857 = _T_1736 & _T_1745 & auto_in_3_c_bits_address[2] & auto_in_3_c_bits_address[1] & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1859 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1746 | _T_1732[2] & _T_1764 | _T_1732[1] & _T_1797 |
    _T_1732[0] & _T_1857; // @[Misc.scala 214:29]
  wire  _T_1860 = _T_1736 & _T_1745 & auto_in_3_c_bits_address[2] & auto_in_3_c_bits_address[1] &
    auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1862 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1746 | _T_1732[2] & _T_1764 | _T_1732[1] & _T_1797 |
    _T_1732[0] & _T_1860; // @[Misc.scala 214:29]
  wire  _T_1863 = _T_1736 & auto_in_3_c_bits_address[3] & _T_1760 & _T_1787 & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1865 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1749 | _T_1732[2] & _T_1767 | _T_1732[1] & _T_1800 |
    _T_1732[0] & _T_1863; // @[Misc.scala 214:29]
  wire  _T_1866 = _T_1736 & auto_in_3_c_bits_address[3] & _T_1760 & _T_1787 & auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1868 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1749 | _T_1732[2] & _T_1767 | _T_1732[1] & _T_1800 |
    _T_1732[0] & _T_1866; // @[Misc.scala 214:29]
  wire  _T_1869 = _T_1736 & auto_in_3_c_bits_address[3] & _T_1760 & auto_in_3_c_bits_address[1] & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1871 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1749 | _T_1732[2] & _T_1767 | _T_1732[1] & _T_1803 |
    _T_1732[0] & _T_1869; // @[Misc.scala 214:29]
  wire  _T_1872 = _T_1736 & auto_in_3_c_bits_address[3] & _T_1760 & auto_in_3_c_bits_address[1] &
    auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1874 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1749 | _T_1732[2] & _T_1767 | _T_1732[1] & _T_1803 |
    _T_1732[0] & _T_1872; // @[Misc.scala 214:29]
  wire  _T_1875 = _T_1736 & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] & _T_1787 & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1877 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1749 | _T_1732[2] & _T_1770 | _T_1732[1] & _T_1806 |
    _T_1732[0] & _T_1875; // @[Misc.scala 214:29]
  wire  _T_1878 = _T_1736 & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] & _T_1787 &
    auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1880 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1749 | _T_1732[2] & _T_1770 | _T_1732[1] & _T_1806 |
    _T_1732[0] & _T_1878; // @[Misc.scala 214:29]
  wire  _T_1881 = _T_1736 & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] & auto_in_3_c_bits_address[1] &
    _T_1838; // @[Misc.scala 213:27]
  wire  _T_1883 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1749 | _T_1732[2] & _T_1770 | _T_1732[1] & _T_1809 |
    _T_1732[0] & _T_1881; // @[Misc.scala 214:29]
  wire  _T_1884 = _T_1736 & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] & auto_in_3_c_bits_address[1] &
    auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1886 = _T_1733 | _T_1732[4] & _T_1736 | _T_1732[3] & _T_1749 | _T_1732[2] & _T_1770 | _T_1732[1] & _T_1809 |
    _T_1732[0] & _T_1884; // @[Misc.scala 214:29]
  wire  _T_1887 = auto_in_3_c_bits_address[4] & _T_1745 & _T_1760 & _T_1787 & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1889 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1752 | _T_1732[2] & _T_1773 |
    _T_1732[1] & _T_1812 | _T_1732[0] & _T_1887; // @[Misc.scala 214:29]
  wire  _T_1890 = auto_in_3_c_bits_address[4] & _T_1745 & _T_1760 & _T_1787 & auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1892 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1752 | _T_1732[2] & _T_1773 |
    _T_1732[1] & _T_1812 | _T_1732[0] & _T_1890; // @[Misc.scala 214:29]
  wire  _T_1893 = auto_in_3_c_bits_address[4] & _T_1745 & _T_1760 & auto_in_3_c_bits_address[1] & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1895 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1752 | _T_1732[2] & _T_1773 |
    _T_1732[1] & _T_1815 | _T_1732[0] & _T_1893; // @[Misc.scala 214:29]
  wire  _T_1896 = auto_in_3_c_bits_address[4] & _T_1745 & _T_1760 & auto_in_3_c_bits_address[1] &
    auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1898 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1752 | _T_1732[2] & _T_1773 |
    _T_1732[1] & _T_1815 | _T_1732[0] & _T_1896; // @[Misc.scala 214:29]
  wire  _T_1899 = auto_in_3_c_bits_address[4] & _T_1745 & auto_in_3_c_bits_address[2] & _T_1787 & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1901 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1752 | _T_1732[2] & _T_1776 |
    _T_1732[1] & _T_1818 | _T_1732[0] & _T_1899; // @[Misc.scala 214:29]
  wire  _T_1902 = auto_in_3_c_bits_address[4] & _T_1745 & auto_in_3_c_bits_address[2] & _T_1787 &
    auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1904 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1752 | _T_1732[2] & _T_1776 |
    _T_1732[1] & _T_1818 | _T_1732[0] & _T_1902; // @[Misc.scala 214:29]
  wire  _T_1905 = auto_in_3_c_bits_address[4] & _T_1745 & auto_in_3_c_bits_address[2] & auto_in_3_c_bits_address[1] &
    _T_1838; // @[Misc.scala 213:27]
  wire  _T_1907 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1752 | _T_1732[2] & _T_1776 |
    _T_1732[1] & _T_1821 | _T_1732[0] & _T_1905; // @[Misc.scala 214:29]
  wire  _T_1908 = auto_in_3_c_bits_address[4] & _T_1745 & auto_in_3_c_bits_address[2] & auto_in_3_c_bits_address[1] &
    auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1910 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1752 | _T_1732[2] & _T_1776 |
    _T_1732[1] & _T_1821 | _T_1732[0] & _T_1908; // @[Misc.scala 214:29]
  wire  _T_1911 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & _T_1760 & _T_1787 & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1913 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1755 | _T_1732[2] & _T_1779 |
    _T_1732[1] & _T_1824 | _T_1732[0] & _T_1911; // @[Misc.scala 214:29]
  wire  _T_1914 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & _T_1760 & _T_1787 &
    auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1916 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1755 | _T_1732[2] & _T_1779 |
    _T_1732[1] & _T_1824 | _T_1732[0] & _T_1914; // @[Misc.scala 214:29]
  wire  _T_1917 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & _T_1760 & auto_in_3_c_bits_address[1] &
    _T_1838; // @[Misc.scala 213:27]
  wire  _T_1919 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1755 | _T_1732[2] & _T_1779 |
    _T_1732[1] & _T_1827 | _T_1732[0] & _T_1917; // @[Misc.scala 214:29]
  wire  _T_1920 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & _T_1760 & auto_in_3_c_bits_address[1] &
    auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1922 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1755 | _T_1732[2] & _T_1779 |
    _T_1732[1] & _T_1827 | _T_1732[0] & _T_1920; // @[Misc.scala 214:29]
  wire  _T_1923 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] & _T_1787 &
    _T_1838; // @[Misc.scala 213:27]
  wire  _T_1925 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1755 | _T_1732[2] & _T_1782 |
    _T_1732[1] & _T_1830 | _T_1732[0] & _T_1923; // @[Misc.scala 214:29]
  wire  _T_1926 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] & _T_1787 &
    auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1928 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1755 | _T_1732[2] & _T_1782 |
    _T_1732[1] & _T_1830 | _T_1732[0] & _T_1926; // @[Misc.scala 214:29]
  wire  _T_1929 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] &
    auto_in_3_c_bits_address[1] & _T_1838; // @[Misc.scala 213:27]
  wire  _T_1931 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1755 | _T_1732[2] & _T_1782 |
    _T_1732[1] & _T_1833 | _T_1732[0] & _T_1929; // @[Misc.scala 214:29]
  wire  _T_1932 = auto_in_3_c_bits_address[4] & auto_in_3_c_bits_address[3] & auto_in_3_c_bits_address[2] &
    auto_in_3_c_bits_address[1] & auto_in_3_c_bits_address[0]; // @[Misc.scala 213:27]
  wire  _T_1934 = _T_1733 | _T_1732[4] & auto_in_3_c_bits_address[4] | _T_1732[3] & _T_1755 | _T_1732[2] & _T_1782 |
    _T_1732[1] & _T_1833 | _T_1732[0] & _T_1932; // @[Misc.scala 214:29]
  wire [7:0] lo_lo_3 = {_T_1862,_T_1859,_T_1856,_T_1853,_T_1850,_T_1847,_T_1844,_T_1841}; // @[Cat.scala 30:58]
  wire [15:0] lo_3 = {_T_1886,_T_1883,_T_1880,_T_1877,_T_1874,_T_1871,_T_1868,_T_1865,lo_lo_3}; // @[Cat.scala 30:58]
  wire [7:0] hi_lo_3 = {_T_1910,_T_1907,_T_1904,_T_1901,_T_1898,_T_1895,_T_1892,_T_1889}; // @[Cat.scala 30:58]
  wire [31:0] _T_1935 = {_T_1934,_T_1931,_T_1928,_T_1925,_T_1922,_T_1919,_T_1916,_T_1913,hi_lo_3,lo_3}; // @[Cat.scala 30:58]
  wire  _T_1936 = auto_in_3_c_bits_opcode == 3'h6; // @[CacheCork.scala 103:53]
  wire  _WIRE_181_ready = q_6_io_enq_ready; // @[CacheCork.scala 102:23 Decoupled.scala 323:17]
  reg  REG_21_0; // @[Arbiter.scala 116:26]
  wire  _T_2081_0 = _T_2024 ? _T_2037[0] : REG_21_0; // @[Arbiter.scala 121:24]
  wire  _T_2082 = auto_out_3_a_ready & _T_2081_0; // @[Arbiter.scala 123:31]
  reg  REG_18; // @[Edges.scala 228:27]
  wire  _T_1963 = ~REG_18; // @[Edges.scala 230:25]
  reg  REG_22; // @[Arbiter.scala 87:30]
  wire  _T_2125 = ~REG_22; // @[Arbiter.scala 88:28]
  wire  _WIRE_211_earlyValid = q_7_io_deq_valid; // @[ReadyValidCancel.scala 70:19 71:20]
  wire  _WIRE_210_earlyValid = q_6_io_deq_valid; // @[ReadyValidCancel.scala 70:19 71:20]
  wire [2:0] _T_2133 = {_WIRE_211_earlyValid,_WIRE_210_earlyValid,auto_out_3_d_valid}; // @[Cat.scala 30:58]
  wire [3:0] _T_2134 = {_T_2133, 1'h0}; // @[package.scala 244:48]
  wire [2:0] _T_2136 = _T_2133 | _T_2134[2:0]; // @[package.scala 244:43]
  wire [4:0] _T_2137 = {_T_2136, 2'h0}; // @[package.scala 244:48]
  wire [2:0] _T_2139 = _T_2136 | _T_2137[2:0]; // @[package.scala 244:43]
  wire [3:0] _T_2141 = {_T_2139, 1'h0}; // @[Arbiter.scala 16:78]
  wire [2:0] _T_2143 = ~_T_2141[2:0]; // @[Arbiter.scala 16:61]
  wire  _T_2147 = _T_2143[0] & auto_out_3_d_valid; // @[Arbiter.scala 97:79]
  reg  REG_23_0; // @[Arbiter.scala 116:26]
  wire  _T_2199_0 = _T_2125 ? _T_2147 : REG_23_0; // @[Arbiter.scala 117:30]
  wire [2:0] _GEN_249 = auto_out_3_d_bits_opcode == 3'h1 & auto_out_3_d_bits_source[0] ? 3'h5 : auto_out_3_d_bits_opcode
    ; // @[CacheCork.scala 132:13 152:76 153:27]
  wire [2:0] _GEN_251 = auto_out_3_d_bits_opcode == 3'h0 & ~auto_out_3_d_bits_source[0] ? 3'h6 : _GEN_249; // @[CacheCork.scala 156:73 157:27]
  wire [2:0] _T_2253 = _T_2199_0 ? _GEN_251 : 3'h0; // @[Mux.scala 27:72]
  wire  _T_2148 = _T_2143[1] & _WIRE_210_earlyValid; // @[Arbiter.scala 97:79]
  reg  REG_23_1; // @[Arbiter.scala 116:26]
  wire  _T_2199_1 = _T_2125 ? _T_2148 : REG_23_1; // @[Arbiter.scala 117:30]
  wire [2:0] _WIRE_210_bits_opcode = q_6_io_deq_bits_opcode; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_2254 = _T_2199_1 ? _WIRE_210_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_2256 = _T_2253 | _T_2254; // @[Mux.scala 27:72]
  wire  _T_2149 = _T_2143[2] & _WIRE_211_earlyValid; // @[Arbiter.scala 97:79]
  reg  REG_23_2; // @[Arbiter.scala 116:26]
  wire  _T_2199_2 = _T_2125 ? _T_2149 : REG_23_2; // @[Arbiter.scala 117:30]
  wire [2:0] _WIRE_211_bits_opcode = q_7_io_deq_bits_opcode; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_2255 = _T_2199_2 ? _WIRE_211_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_2257 = _T_2256 | _T_2255; // @[Mux.scala 27:72]
  wire  _T_1973 = _T_2257 == 3'h5 | _T_2257 == 3'h4; // @[CacheCork.scala 123:54]
  wire  _T_1985 = IDPool_3_io_alloc_valid | ~_T_1963 | ~_T_1973; // @[CacheCork.scala 126:70]
  wire  _T_1986 = auto_in_3_d_ready & (IDPool_3_io_alloc_valid | ~_T_1963 | ~_T_1973); // @[CacheCork.scala 126:34]
  wire  _T_2211 = REG_23_0 & auto_out_3_d_valid | REG_23_1 & _WIRE_210_earlyValid | REG_23_2 & _WIRE_211_earlyValid; // @[Mux.scala 27:72]
  wire  _T_2212 = _T_2125 ? auto_out_3_d_valid | _WIRE_210_earlyValid | _WIRE_211_earlyValid : _T_2211; // @[Arbiter.scala 125:29]
  wire  _T_1953 = _T_1986 & _T_2212; // @[Decoupled.scala 40:37]
  wire [2:0] _T_2243 = _T_2199_0 ? auto_out_3_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _WIRE_210_bits_size = q_6_io_deq_bits_size; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_2244 = _T_2199_1 ? _WIRE_210_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_2246 = _T_2243 | _T_2244; // @[Mux.scala 27:72]
  wire [2:0] _WIRE_211_bits_size = q_7_io_deq_bits_size; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [2:0] _T_2245 = _T_2199_2 ? _WIRE_211_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_2247 = _T_2246 | _T_2245; // @[Mux.scala 27:72]
  wire [12:0] _T_1955 = 13'h3f << _T_2247; // @[package.scala 234:77]
  wire [5:0] _T_1957 = ~_T_1955[5:0]; // @[package.scala 234:46]
  wire  _T_1960 = _T_2257[0] & _T_1957[5]; // @[Edges.scala 220:14]
  wire  _T_1962 = REG_18 - 1'h1; // @[Edges.scala 229:28]
  wire  _T_1981 = _T_2212 & _T_1985; // @[CacheCork.scala 125:34]
  wire  _T_1974 = auto_in_3_d_ready & _T_1981; // @[Decoupled.scala 40:37]
  reg [2:0] r_6; // @[Reg.scala 15:16]
  wire [1:0] _GEN_250 = auto_out_3_d_bits_opcode == 3'h1 & auto_out_3_d_bits_source[0] ? 2'h0 : auto_out_3_d_bits_param; // @[CacheCork.scala 132:13 152:76 154:26]
  wire [12:0] _T_2009 = 13'h3f << auto_in_3_c_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_2011 = ~_T_2009[5:0]; // @[package.scala 234:46]
  wire [12:0] _T_2017 = 13'h3f << auto_in_3_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_2019 = ~_T_2017[5:0]; // @[package.scala 234:46]
  wire  _T_2022 = ~_GEN_189[2]; // @[Edges.scala 91:28]
  wire  _T_2023 = _T_2022 & _T_2019[5]; // @[Edges.scala 220:14]
  wire  _T_2025 = _T_2024 & auto_out_3_a_ready; // @[Arbiter.scala 89:24]
  wire  _T_2040 = _T_2037[0] & _T_1716; // @[Arbiter.scala 97:79]
  wire  _T_2041 = _T_2037[1] & _T_1705; // @[Arbiter.scala 97:79]
  wire  _T_2056 = _T_1716 | _T_1705; // @[Arbiter.scala 107:36]
  wire  _T_2070 = _T_2040 & _T_2011[5]; // @[Arbiter.scala 111:73]
  wire  _T_2071 = _T_2041 & _T_2023; // @[Arbiter.scala 111:73]
  wire  _T_2072 = _T_2070 | _T_2071; // @[Arbiter.scala 112:44]
  wire  _T_2079_0 = _T_2024 ? _T_2040 : REG_21_0; // @[Arbiter.scala 117:30]
  wire  _T_2079_1 = _T_2024 ? _T_2041 : REG_21_1; // @[Arbiter.scala 117:30]
  wire  _T_2087 = REG_21_0 & _T_1716 | REG_21_1 & _T_1705; // @[Mux.scala 27:72]
  wire  _T_2088 = _T_2024 ? _T_2056 : _T_2087; // @[Arbiter.scala 125:29]
  wire  _T_2075 = auto_out_3_a_ready & _T_2088; // @[ReadyValidCancel.scala 50:33]
  wire [255:0] _T_2095 = _T_2079_0 ? auto_in_3_c_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_2096 = _T_2079_1 ? auto_in_3_a_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2098 = _T_2079_0 ? _T_1935 : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_2099 = _T_2079_1 ? auto_in_3_a_bits_mask : 32'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_2101 = _T_2079_0 ? auto_in_3_c_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [35:0] _T_2102 = _T_2079_1 ? auto_in_3_a_bits_address : 36'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_2104 = _T_2079_0 ? _T_1717 : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_2105 = _T_2079_1 ? _GEN_191 : 6'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_2107 = _T_2079_0 ? auto_in_3_c_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_2108 = _T_2079_1 ? auto_in_3_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [12:0] _T_2119 = 13'h3f << auto_out_3_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_2121 = ~_T_2119[5:0]; // @[package.scala 234:46]
  wire  _T_2124 = _GEN_251[0] & _T_2121[5]; // @[Edges.scala 220:14]
  wire  _T_2126 = _T_2125 & _T_1986; // @[Arbiter.scala 89:24]
  wire  _T_2188 = _T_2147 & _T_2124; // @[Arbiter.scala 111:73]
  wire  _T_2201_0 = _T_2125 ? _T_2143[0] : REG_23_0; // @[Arbiter.scala 121:24]
  wire  _T_2201_1 = _T_2125 ? _T_2143[1] : REG_23_1; // @[Arbiter.scala 121:24]
  wire  _T_2201_2 = _T_2125 ? _T_2143[2] : REG_23_2; // @[Arbiter.scala 121:24]
  wire [255:0] _T_2223 = _T_2199_0 ? auto_out_3_d_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _WIRE_210_bits_data = q_6_io_deq_bits_data; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [255:0] _T_2224 = _T_2199_1 ? _WIRE_210_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _WIRE_211_bits_data = q_7_io_deq_bits_data; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [255:0] _T_2225 = _T_2199_2 ? _WIRE_211_bits_data : 256'h0; // @[Mux.scala 27:72]
  wire [255:0] _T_2226 = _T_2223 | _T_2224; // @[Mux.scala 27:72]
  wire  _WIRE_210_bits_denied = q_6_io_deq_bits_denied; // @[ReadyValidCancel.scala 70:19 73:14]
  wire  _WIRE_211_bits_denied = q_7_io_deq_bits_denied; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_2238 = _T_2199_0 ? auto_out_3_d_bits_source[5:1] : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _WIRE_210_bits_source = q_6_io_deq_bits_source; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_2239 = _T_2199_1 ? _WIRE_210_bits_source : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _WIRE_211_bits_source = q_7_io_deq_bits_source; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [4:0] _T_2240 = _T_2199_2 ? _WIRE_211_bits_source : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_2241 = _T_2238 | _T_2239; // @[Mux.scala 27:72]
  wire [1:0] _T_2248 = _T_2199_0 ? _GEN_250 : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _WIRE_210_bits_param = q_6_io_deq_bits_param; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [1:0] _T_2249 = _T_2199_1 ? _WIRE_210_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _WIRE_211_bits_param = q_7_io_deq_bits_param; // @[ReadyValidCancel.scala 70:19 73:14]
  wire [1:0] _T_2250 = _T_2199_2 ? _WIRE_211_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_2251 = _T_2248 | _T_2249; // @[Mux.scala 27:72]
  IDPool IDPool ( // @[CacheCork.scala 117:26]
    .clock(IDPool_clock),
    .reset(IDPool_reset),
    .io_free_valid(IDPool_io_free_valid),
    .io_free_bits(IDPool_io_free_bits),
    .io_alloc_ready(IDPool_io_alloc_ready),
    .io_alloc_valid(IDPool_io_alloc_valid),
    .io_alloc_bits(IDPool_io_alloc_bits)
  );
  Queue_4 q ( // @[Decoupled.scala 320:21]
    .clock(q_clock),
    .reset(q_reset),
    .io_enq_ready(q_io_enq_ready),
    .io_enq_valid(q_io_enq_valid),
    .io_enq_bits_opcode(q_io_enq_bits_opcode),
    .io_enq_bits_size(q_io_enq_bits_size),
    .io_enq_bits_source(q_io_enq_bits_source),
    .io_deq_ready(q_io_deq_ready),
    .io_deq_valid(q_io_deq_valid),
    .io_deq_bits_opcode(q_io_deq_bits_opcode),
    .io_deq_bits_param(q_io_deq_bits_param),
    .io_deq_bits_size(q_io_deq_bits_size),
    .io_deq_bits_source(q_io_deq_bits_source),
    .io_deq_bits_denied(q_io_deq_bits_denied),
    .io_deq_bits_data(q_io_deq_bits_data)
  );
  Queue_4 q_1 ( // @[Decoupled.scala 320:21]
    .clock(q_1_clock),
    .reset(q_1_reset),
    .io_enq_ready(q_1_io_enq_ready),
    .io_enq_valid(q_1_io_enq_valid),
    .io_enq_bits_opcode(q_1_io_enq_bits_opcode),
    .io_enq_bits_size(q_1_io_enq_bits_size),
    .io_enq_bits_source(q_1_io_enq_bits_source),
    .io_deq_ready(q_1_io_deq_ready),
    .io_deq_valid(q_1_io_deq_valid),
    .io_deq_bits_opcode(q_1_io_deq_bits_opcode),
    .io_deq_bits_param(q_1_io_deq_bits_param),
    .io_deq_bits_size(q_1_io_deq_bits_size),
    .io_deq_bits_source(q_1_io_deq_bits_source),
    .io_deq_bits_denied(q_1_io_deq_bits_denied),
    .io_deq_bits_data(q_1_io_deq_bits_data)
  );
  IDPool IDPool_1 ( // @[CacheCork.scala 117:26]
    .clock(IDPool_1_clock),
    .reset(IDPool_1_reset),
    .io_free_valid(IDPool_1_io_free_valid),
    .io_free_bits(IDPool_1_io_free_bits),
    .io_alloc_ready(IDPool_1_io_alloc_ready),
    .io_alloc_valid(IDPool_1_io_alloc_valid),
    .io_alloc_bits(IDPool_1_io_alloc_bits)
  );
  Queue_4 q_2 ( // @[Decoupled.scala 320:21]
    .clock(q_2_clock),
    .reset(q_2_reset),
    .io_enq_ready(q_2_io_enq_ready),
    .io_enq_valid(q_2_io_enq_valid),
    .io_enq_bits_opcode(q_2_io_enq_bits_opcode),
    .io_enq_bits_size(q_2_io_enq_bits_size),
    .io_enq_bits_source(q_2_io_enq_bits_source),
    .io_deq_ready(q_2_io_deq_ready),
    .io_deq_valid(q_2_io_deq_valid),
    .io_deq_bits_opcode(q_2_io_deq_bits_opcode),
    .io_deq_bits_param(q_2_io_deq_bits_param),
    .io_deq_bits_size(q_2_io_deq_bits_size),
    .io_deq_bits_source(q_2_io_deq_bits_source),
    .io_deq_bits_denied(q_2_io_deq_bits_denied),
    .io_deq_bits_data(q_2_io_deq_bits_data)
  );
  Queue_4 q_3 ( // @[Decoupled.scala 320:21]
    .clock(q_3_clock),
    .reset(q_3_reset),
    .io_enq_ready(q_3_io_enq_ready),
    .io_enq_valid(q_3_io_enq_valid),
    .io_enq_bits_opcode(q_3_io_enq_bits_opcode),
    .io_enq_bits_size(q_3_io_enq_bits_size),
    .io_enq_bits_source(q_3_io_enq_bits_source),
    .io_deq_ready(q_3_io_deq_ready),
    .io_deq_valid(q_3_io_deq_valid),
    .io_deq_bits_opcode(q_3_io_deq_bits_opcode),
    .io_deq_bits_param(q_3_io_deq_bits_param),
    .io_deq_bits_size(q_3_io_deq_bits_size),
    .io_deq_bits_source(q_3_io_deq_bits_source),
    .io_deq_bits_denied(q_3_io_deq_bits_denied),
    .io_deq_bits_data(q_3_io_deq_bits_data)
  );
  IDPool IDPool_2 ( // @[CacheCork.scala 117:26]
    .clock(IDPool_2_clock),
    .reset(IDPool_2_reset),
    .io_free_valid(IDPool_2_io_free_valid),
    .io_free_bits(IDPool_2_io_free_bits),
    .io_alloc_ready(IDPool_2_io_alloc_ready),
    .io_alloc_valid(IDPool_2_io_alloc_valid),
    .io_alloc_bits(IDPool_2_io_alloc_bits)
  );
  Queue_4 q_4 ( // @[Decoupled.scala 320:21]
    .clock(q_4_clock),
    .reset(q_4_reset),
    .io_enq_ready(q_4_io_enq_ready),
    .io_enq_valid(q_4_io_enq_valid),
    .io_enq_bits_opcode(q_4_io_enq_bits_opcode),
    .io_enq_bits_size(q_4_io_enq_bits_size),
    .io_enq_bits_source(q_4_io_enq_bits_source),
    .io_deq_ready(q_4_io_deq_ready),
    .io_deq_valid(q_4_io_deq_valid),
    .io_deq_bits_opcode(q_4_io_deq_bits_opcode),
    .io_deq_bits_param(q_4_io_deq_bits_param),
    .io_deq_bits_size(q_4_io_deq_bits_size),
    .io_deq_bits_source(q_4_io_deq_bits_source),
    .io_deq_bits_denied(q_4_io_deq_bits_denied),
    .io_deq_bits_data(q_4_io_deq_bits_data)
  );
  Queue_4 q_5 ( // @[Decoupled.scala 320:21]
    .clock(q_5_clock),
    .reset(q_5_reset),
    .io_enq_ready(q_5_io_enq_ready),
    .io_enq_valid(q_5_io_enq_valid),
    .io_enq_bits_opcode(q_5_io_enq_bits_opcode),
    .io_enq_bits_size(q_5_io_enq_bits_size),
    .io_enq_bits_source(q_5_io_enq_bits_source),
    .io_deq_ready(q_5_io_deq_ready),
    .io_deq_valid(q_5_io_deq_valid),
    .io_deq_bits_opcode(q_5_io_deq_bits_opcode),
    .io_deq_bits_param(q_5_io_deq_bits_param),
    .io_deq_bits_size(q_5_io_deq_bits_size),
    .io_deq_bits_source(q_5_io_deq_bits_source),
    .io_deq_bits_denied(q_5_io_deq_bits_denied),
    .io_deq_bits_data(q_5_io_deq_bits_data)
  );
  IDPool IDPool_3 ( // @[CacheCork.scala 117:26]
    .clock(IDPool_3_clock),
    .reset(IDPool_3_reset),
    .io_free_valid(IDPool_3_io_free_valid),
    .io_free_bits(IDPool_3_io_free_bits),
    .io_alloc_ready(IDPool_3_io_alloc_ready),
    .io_alloc_valid(IDPool_3_io_alloc_valid),
    .io_alloc_bits(IDPool_3_io_alloc_bits)
  );
  Queue_4 q_6 ( // @[Decoupled.scala 320:21]
    .clock(q_6_clock),
    .reset(q_6_reset),
    .io_enq_ready(q_6_io_enq_ready),
    .io_enq_valid(q_6_io_enq_valid),
    .io_enq_bits_opcode(q_6_io_enq_bits_opcode),
    .io_enq_bits_size(q_6_io_enq_bits_size),
    .io_enq_bits_source(q_6_io_enq_bits_source),
    .io_deq_ready(q_6_io_deq_ready),
    .io_deq_valid(q_6_io_deq_valid),
    .io_deq_bits_opcode(q_6_io_deq_bits_opcode),
    .io_deq_bits_param(q_6_io_deq_bits_param),
    .io_deq_bits_size(q_6_io_deq_bits_size),
    .io_deq_bits_source(q_6_io_deq_bits_source),
    .io_deq_bits_denied(q_6_io_deq_bits_denied),
    .io_deq_bits_data(q_6_io_deq_bits_data)
  );
  Queue_4 q_7 ( // @[Decoupled.scala 320:21]
    .clock(q_7_clock),
    .reset(q_7_reset),
    .io_enq_ready(q_7_io_enq_ready),
    .io_enq_valid(q_7_io_enq_valid),
    .io_enq_bits_opcode(q_7_io_enq_bits_opcode),
    .io_enq_bits_size(q_7_io_enq_bits_size),
    .io_enq_bits_source(q_7_io_enq_bits_source),
    .io_deq_ready(q_7_io_deq_ready),
    .io_deq_valid(q_7_io_deq_valid),
    .io_deq_bits_opcode(q_7_io_deq_bits_opcode),
    .io_deq_bits_param(q_7_io_deq_bits_param),
    .io_deq_bits_size(q_7_io_deq_bits_size),
    .io_deq_bits_source(q_7_io_deq_bits_source),
    .io_deq_bits_denied(q_7_io_deq_bits_denied),
    .io_deq_bits_data(q_7_io_deq_bits_data)
  );
  assign auto_in_3_a_ready = _T_1702 ? _WIRE_177_ready : _T_2083; // @[CacheCork.scala 69:26]
  assign auto_in_3_c_ready = _T_1936 ? _WIRE_181_ready : _T_2082; // @[CacheCork.scala 107:26]
  assign auto_in_3_d_valid = _T_2212 & _T_1985; // @[CacheCork.scala 125:34]
  assign auto_in_3_d_bits_opcode = _T_2256 | _T_2255; // @[Mux.scala 27:72]
  assign auto_in_3_d_bits_param = _T_2251 | _T_2250; // @[Mux.scala 27:72]
  assign auto_in_3_d_bits_size = _T_2246 | _T_2245; // @[Mux.scala 27:72]
  assign auto_in_3_d_bits_source = _T_2241 | _T_2240; // @[Mux.scala 27:72]
  assign auto_in_3_d_bits_sink = _T_1963 ? IDPool_3_io_alloc_bits : r_6; // @[package.scala 79:42]
  assign auto_in_3_d_bits_denied = _T_2199_0 & auto_out_3_d_bits_denied | _T_2199_1 & _WIRE_210_bits_denied | _T_2199_2
     & _WIRE_211_bits_denied; // @[Mux.scala 27:72]
  assign auto_in_3_d_bits_data = _T_2226 | _T_2225; // @[Mux.scala 27:72]
  assign auto_in_2_a_ready = _T_1137 ? _WIRE_121_ready : _T_1518; // @[CacheCork.scala 69:26]
  assign auto_in_2_c_ready = _T_1371 ? _WIRE_125_ready : _T_1517; // @[CacheCork.scala 107:26]
  assign auto_in_2_d_valid = _T_1647 & _T_1420; // @[CacheCork.scala 125:34]
  assign auto_in_2_d_bits_opcode = _T_1691 | _T_1690; // @[Mux.scala 27:72]
  assign auto_in_2_d_bits_param = _T_1686 | _T_1685; // @[Mux.scala 27:72]
  assign auto_in_2_d_bits_size = _T_1681 | _T_1680; // @[Mux.scala 27:72]
  assign auto_in_2_d_bits_source = _T_1676 | _T_1675; // @[Mux.scala 27:72]
  assign auto_in_2_d_bits_sink = _T_1398 ? IDPool_2_io_alloc_bits : r_4; // @[package.scala 79:42]
  assign auto_in_2_d_bits_denied = _T_1634_0 & auto_out_2_d_bits_denied | _T_1634_1 & _WIRE_154_bits_denied | _T_1634_2
     & _WIRE_155_bits_denied; // @[Mux.scala 27:72]
  assign auto_in_2_d_bits_data = _T_1661 | _T_1660; // @[Mux.scala 27:72]
  assign auto_in_1_a_ready = _T_572 ? _WIRE_65_ready : _T_953; // @[CacheCork.scala 69:26]
  assign auto_in_1_c_ready = _T_806 ? _WIRE_69_ready : _T_952; // @[CacheCork.scala 107:26]
  assign auto_in_1_d_valid = _T_1082 & _T_855; // @[CacheCork.scala 125:34]
  assign auto_in_1_d_bits_opcode = _T_1126 | _T_1125; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_param = _T_1121 | _T_1120; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_size = _T_1116 | _T_1115; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_source = _T_1111 | _T_1110; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_sink = _T_833 ? IDPool_1_io_alloc_bits : r_2; // @[package.scala 79:42]
  assign auto_in_1_d_bits_denied = _T_1069_0 & auto_out_1_d_bits_denied | _T_1069_1 & _WIRE_98_bits_denied | _T_1069_2
     & _WIRE_99_bits_denied; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_data = _T_1096 | _T_1095; // @[Mux.scala 27:72]
  assign auto_in_0_a_ready = _T_7 ? _WIRE_9_ready : _T_388; // @[CacheCork.scala 69:26]
  assign auto_in_0_c_ready = _T_241 ? _WIRE_13_ready : _T_387; // @[CacheCork.scala 107:26]
  assign auto_in_0_d_valid = _T_517 & _T_290; // @[CacheCork.scala 125:34]
  assign auto_in_0_d_bits_opcode = _T_561 | _T_560; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_param = _T_556 | _T_555; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_size = _T_551 | _T_550; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_source = _T_546 | _T_545; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_sink = _T_268 ? IDPool_io_alloc_bits : r; // @[package.scala 79:42]
  assign auto_in_0_d_bits_denied = _T_504_0 & auto_out_0_d_bits_denied | _T_504_1 & _WIRE_42_bits_denied | _T_504_2 &
    _WIRE_43_bits_denied; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_data = _T_531 | _T_530; // @[Mux.scala 27:72]
  assign auto_out_3_a_valid = _T_2024 ? _T_2056 : _T_2087; // @[Arbiter.scala 125:29]
  assign auto_out_3_a_bits_opcode = _T_2079_1 ? _GEN_189 : 3'h0; // @[Mux.scala 27:72]
  assign auto_out_3_a_bits_size = _T_2107 | _T_2108; // @[Mux.scala 27:72]
  assign auto_out_3_a_bits_source = _T_2104 | _T_2105; // @[Mux.scala 27:72]
  assign auto_out_3_a_bits_address = _T_2101 | _T_2102; // @[Mux.scala 27:72]
  assign auto_out_3_a_bits_mask = _T_2098 | _T_2099; // @[Mux.scala 27:72]
  assign auto_out_3_a_bits_data = _T_2095 | _T_2096; // @[Mux.scala 27:72]
  assign auto_out_3_d_ready = _T_1986 & _T_2201_0; // @[Arbiter.scala 123:31]
  assign auto_out_2_a_valid = _T_1459 ? _T_1491 : _T_1522; // @[Arbiter.scala 125:29]
  assign auto_out_2_a_bits_opcode = _T_1514_1 ? _GEN_126 : 3'h0; // @[Mux.scala 27:72]
  assign auto_out_2_a_bits_size = _T_1542 | _T_1543; // @[Mux.scala 27:72]
  assign auto_out_2_a_bits_source = _T_1539 | _T_1540; // @[Mux.scala 27:72]
  assign auto_out_2_a_bits_address = _T_1536 | _T_1537; // @[Mux.scala 27:72]
  assign auto_out_2_a_bits_mask = _T_1533 | _T_1534; // @[Mux.scala 27:72]
  assign auto_out_2_a_bits_data = _T_1530 | _T_1531; // @[Mux.scala 27:72]
  assign auto_out_2_d_ready = _T_1421 & _T_1636_0; // @[Arbiter.scala 123:31]
  assign auto_out_1_a_valid = _T_894 ? _T_926 : _T_957; // @[Arbiter.scala 125:29]
  assign auto_out_1_a_bits_opcode = _T_949_1 ? _GEN_63 : 3'h0; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_size = _T_977 | _T_978; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_source = _T_974 | _T_975; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_address = _T_971 | _T_972; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_mask = _T_968 | _T_969; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_data = _T_965 | _T_966; // @[Mux.scala 27:72]
  assign auto_out_1_d_ready = _T_856 & _T_1071_0; // @[Arbiter.scala 123:31]
  assign auto_out_0_a_valid = _T_329 ? _T_361 : _T_392; // @[Arbiter.scala 125:29]
  assign auto_out_0_a_bits_opcode = _T_384_1 ? _GEN_0 : 3'h0; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_size = _T_412 | _T_413; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_source = _T_409 | _T_410; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_address = _T_406 | _T_407; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_mask = _T_403 | _T_404; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_data = _T_400 | _T_401; // @[Mux.scala 27:72]
  assign auto_out_0_d_ready = _T_291 & _T_506_0; // @[Arbiter.scala 123:31]
  assign IDPool_clock = clock;
  assign IDPool_reset = reset;
  assign IDPool_io_free_valid = auto_in_0_e_valid; // @[Decoupled.scala 40:37]
  assign IDPool_io_free_bits = auto_in_0_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign IDPool_io_alloc_ready = _T_279 & _T_268 & _T_278; // @[CacheCork.scala 124:55]
  assign q_clock = clock;
  assign q_reset = reset;
  assign q_io_enq_valid = auto_in_0_c_valid & auto_in_0_c_bits_opcode == 3'h6; // @[CacheCork.scala 103:33]
  assign q_io_enq_bits_opcode = 3'h6; // @[Edges.scala 642:17 643:15]
  assign q_io_enq_bits_size = auto_in_0_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_io_enq_bits_source = auto_in_0_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_io_deq_ready = _T_291 & _T_506_1; // @[Arbiter.scala 123:31]
  assign q_1_clock = clock;
  assign q_1_reset = reset;
  assign q_1_io_enq_valid = auto_in_0_a_valid & _T_7; // @[CacheCork.scala 83:33]
  assign q_1_io_enq_bits_opcode = 3'h4; // @[Edges.scala 614:17 615:15]
  assign q_1_io_enq_bits_size = auto_in_0_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_1_io_enq_bits_source = auto_in_0_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_1_io_deq_ready = _T_291 & _T_506_2; // @[Arbiter.scala 123:31]
  assign IDPool_1_clock = clock;
  assign IDPool_1_reset = reset;
  assign IDPool_1_io_free_valid = auto_in_1_e_valid; // @[Decoupled.scala 40:37]
  assign IDPool_1_io_free_bits = auto_in_1_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign IDPool_1_io_alloc_ready = _T_844 & _T_833 & _T_843; // @[CacheCork.scala 124:55]
  assign q_2_clock = clock;
  assign q_2_reset = reset;
  assign q_2_io_enq_valid = auto_in_1_c_valid & auto_in_1_c_bits_opcode == 3'h6; // @[CacheCork.scala 103:33]
  assign q_2_io_enq_bits_opcode = 3'h6; // @[Edges.scala 642:17 643:15]
  assign q_2_io_enq_bits_size = auto_in_1_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_2_io_enq_bits_source = auto_in_1_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_2_io_deq_ready = _T_856 & _T_1071_1; // @[Arbiter.scala 123:31]
  assign q_3_clock = clock;
  assign q_3_reset = reset;
  assign q_3_io_enq_valid = auto_in_1_a_valid & _T_572; // @[CacheCork.scala 83:33]
  assign q_3_io_enq_bits_opcode = 3'h4; // @[Edges.scala 614:17 615:15]
  assign q_3_io_enq_bits_size = auto_in_1_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_3_io_enq_bits_source = auto_in_1_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_3_io_deq_ready = _T_856 & _T_1071_2; // @[Arbiter.scala 123:31]
  assign IDPool_2_clock = clock;
  assign IDPool_2_reset = reset;
  assign IDPool_2_io_free_valid = auto_in_2_e_valid; // @[Decoupled.scala 40:37]
  assign IDPool_2_io_free_bits = auto_in_2_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign IDPool_2_io_alloc_ready = _T_1409 & _T_1398 & _T_1408; // @[CacheCork.scala 124:55]
  assign q_4_clock = clock;
  assign q_4_reset = reset;
  assign q_4_io_enq_valid = auto_in_2_c_valid & auto_in_2_c_bits_opcode == 3'h6; // @[CacheCork.scala 103:33]
  assign q_4_io_enq_bits_opcode = 3'h6; // @[Edges.scala 642:17 643:15]
  assign q_4_io_enq_bits_size = auto_in_2_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_4_io_enq_bits_source = auto_in_2_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_4_io_deq_ready = _T_1421 & _T_1636_1; // @[Arbiter.scala 123:31]
  assign q_5_clock = clock;
  assign q_5_reset = reset;
  assign q_5_io_enq_valid = auto_in_2_a_valid & _T_1137; // @[CacheCork.scala 83:33]
  assign q_5_io_enq_bits_opcode = 3'h4; // @[Edges.scala 614:17 615:15]
  assign q_5_io_enq_bits_size = auto_in_2_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_5_io_enq_bits_source = auto_in_2_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_5_io_deq_ready = _T_1421 & _T_1636_2; // @[Arbiter.scala 123:31]
  assign IDPool_3_clock = clock;
  assign IDPool_3_reset = reset;
  assign IDPool_3_io_free_valid = auto_in_3_e_valid; // @[Decoupled.scala 40:37]
  assign IDPool_3_io_free_bits = auto_in_3_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign IDPool_3_io_alloc_ready = _T_1974 & _T_1963 & _T_1973; // @[CacheCork.scala 124:55]
  assign q_6_clock = clock;
  assign q_6_reset = reset;
  assign q_6_io_enq_valid = auto_in_3_c_valid & auto_in_3_c_bits_opcode == 3'h6; // @[CacheCork.scala 103:33]
  assign q_6_io_enq_bits_opcode = 3'h6; // @[Edges.scala 642:17 643:15]
  assign q_6_io_enq_bits_size = auto_in_3_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_6_io_enq_bits_source = auto_in_3_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_6_io_deq_ready = _T_1986 & _T_2201_1; // @[Arbiter.scala 123:31]
  assign q_7_clock = clock;
  assign q_7_reset = reset;
  assign q_7_io_enq_valid = auto_in_3_a_valid & _T_1702; // @[CacheCork.scala 83:33]
  assign q_7_io_enq_bits_opcode = 3'h4; // @[Edges.scala 614:17 615:15]
  assign q_7_io_enq_bits_size = auto_in_3_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_7_io_enq_bits_source = auto_in_3_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_7_io_deq_ready = _T_1986 & _T_2201_2; // @[Arbiter.scala 123:31]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_2 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_330) begin // @[Arbiter.scala 113:23]
      REG_2 <= _T_377;
    end else begin
      REG_2 <= REG_2 - _T_380;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_3_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_329) begin // @[Arbiter.scala 117:30]
      REG_3_1 <= _T_346;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_3_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_329) begin // @[Arbiter.scala 117:30]
      REG_3_0 <= _T_345;
    end
    if (reset) begin // @[Edges.scala 228:27]
      REG <= 1'h0; // @[Edges.scala 228:27]
    end else if (_T_258) begin // @[Edges.scala 234:17]
      if (_T_268) begin // @[Edges.scala 235:21]
        REG <= _T_265;
      end else begin
        REG <= _T_267;
      end
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_4 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_431) begin // @[Arbiter.scala 113:23]
      REG_4 <= _T_493;
    end else begin
      REG_4 <= REG_4 - _T_258;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_5_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_430) begin // @[Arbiter.scala 117:30]
      REG_5_0 <= _T_452;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_5_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_430) begin // @[Arbiter.scala 117:30]
      REG_5_1 <= _T_453;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_5_2 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_430) begin // @[Arbiter.scala 117:30]
      REG_5_2 <= _T_454;
    end
    if (_T_268) begin // @[Reg.scala 16:19]
      r <= IDPool_io_alloc_bits; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_8 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_895) begin // @[Arbiter.scala 113:23]
      REG_8 <= _T_942;
    end else begin
      REG_8 <= REG_8 - _T_945;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_9_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_894) begin // @[Arbiter.scala 117:30]
      REG_9_1 <= _T_911;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_9_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_894) begin // @[Arbiter.scala 117:30]
      REG_9_0 <= _T_910;
    end
    if (reset) begin // @[Edges.scala 228:27]
      REG_6 <= 1'h0; // @[Edges.scala 228:27]
    end else if (_T_823) begin // @[Edges.scala 234:17]
      if (_T_833) begin // @[Edges.scala 235:21]
        REG_6 <= _T_830;
      end else begin
        REG_6 <= _T_832;
      end
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_10 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_996) begin // @[Arbiter.scala 113:23]
      REG_10 <= _T_1058;
    end else begin
      REG_10 <= REG_10 - _T_823;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_11_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_995) begin // @[Arbiter.scala 117:30]
      REG_11_0 <= _T_1017;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_11_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_995) begin // @[Arbiter.scala 117:30]
      REG_11_1 <= _T_1018;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_11_2 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_995) begin // @[Arbiter.scala 117:30]
      REG_11_2 <= _T_1019;
    end
    if (_T_833) begin // @[Reg.scala 16:19]
      r_2 <= IDPool_1_io_alloc_bits; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_14 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_1460) begin // @[Arbiter.scala 113:23]
      REG_14 <= _T_1507;
    end else begin
      REG_14 <= REG_14 - _T_1510;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_15_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_1459) begin // @[Arbiter.scala 117:30]
      REG_15_1 <= _T_1476;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_15_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_1459) begin // @[Arbiter.scala 117:30]
      REG_15_0 <= _T_1475;
    end
    if (reset) begin // @[Edges.scala 228:27]
      REG_12 <= 1'h0; // @[Edges.scala 228:27]
    end else if (_T_1388) begin // @[Edges.scala 234:17]
      if (_T_1398) begin // @[Edges.scala 235:21]
        REG_12 <= _T_1395;
      end else begin
        REG_12 <= _T_1397;
      end
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_16 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_1561) begin // @[Arbiter.scala 113:23]
      REG_16 <= _T_1623;
    end else begin
      REG_16 <= REG_16 - _T_1388;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_17_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_1560) begin // @[Arbiter.scala 117:30]
      REG_17_0 <= _T_1582;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_17_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_1560) begin // @[Arbiter.scala 117:30]
      REG_17_1 <= _T_1583;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_17_2 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_1560) begin // @[Arbiter.scala 117:30]
      REG_17_2 <= _T_1584;
    end
    if (_T_1398) begin // @[Reg.scala 16:19]
      r_4 <= IDPool_2_io_alloc_bits; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_20 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_2025) begin // @[Arbiter.scala 113:23]
      REG_20 <= _T_2072;
    end else begin
      REG_20 <= REG_20 - _T_2075;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_21_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_2024) begin // @[Arbiter.scala 117:30]
      REG_21_1 <= _T_2041;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_21_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_2024) begin // @[Arbiter.scala 117:30]
      REG_21_0 <= _T_2040;
    end
    if (reset) begin // @[Edges.scala 228:27]
      REG_18 <= 1'h0; // @[Edges.scala 228:27]
    end else if (_T_1953) begin // @[Edges.scala 234:17]
      if (_T_1963) begin // @[Edges.scala 235:21]
        REG_18 <= _T_1960;
      end else begin
        REG_18 <= _T_1962;
      end
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      REG_22 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (_T_2126) begin // @[Arbiter.scala 113:23]
      REG_22 <= _T_2188;
    end else begin
      REG_22 <= REG_22 - _T_1953;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_23_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_2125) begin // @[Arbiter.scala 117:30]
      REG_23_0 <= _T_2147;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_23_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_2125) begin // @[Arbiter.scala 117:30]
      REG_23_1 <= _T_2148;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_23_2 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_2125) begin // @[Arbiter.scala 117:30]
      REG_23_2 <= _T_2149;
    end
    if (_T_1963) begin // @[Reg.scala 16:19]
      r_6 <= IDPool_3_io_alloc_bits; // @[Reg.scala 16:23]
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
  REG_2 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  REG_3_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  REG_3_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  REG_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  REG_5_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  REG_5_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  REG_5_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  r = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  REG_8 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  REG_9_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  REG_9_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  REG_6 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  REG_10 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  REG_11_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  REG_11_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  REG_11_2 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  r_2 = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  REG_14 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  REG_15_1 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  REG_15_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  REG_12 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  REG_16 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  REG_17_0 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  REG_17_1 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  REG_17_2 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  r_4 = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  REG_20 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  REG_21_1 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  REG_21_0 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  REG_18 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  REG_22 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  REG_23_0 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  REG_23_1 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  REG_23_2 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  r_6 = _RAND_35[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule