module Queue_3(
  input          clock,
  input          reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [2:0]   io_enq_bits_opcode,
  input  [1:0]   io_enq_bits_param,
  input  [2:0]   io_enq_bits_size,
  input  [5:0]   io_enq_bits_source,
  input          io_enq_bits_denied,
  input  [255:0] io_enq_bits_data,
  input          io_deq_ready,
  output         io_deq_valid,
  output [2:0]   io_deq_bits_opcode,
  output [1:0]   io_deq_bits_param,
  output [2:0]   io_deq_bits_size,
  output [5:0]   io_deq_bits_source,
  output         io_deq_bits_denied,
  output [255:0] io_deq_bits_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [255:0] _RAND_5;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] ram_opcode [0:1]; // @[Decoupled.scala 224:95]
  wire  ram_opcode_io_deq_bits_MPORT_en; // @[Decoupled.scala 224:95]
  wire  ram_opcode_io_deq_bits_MPORT_addr; // @[Decoupled.scala 224:95]
  wire [2:0] ram_opcode_io_deq_bits_MPORT_data; // @[Decoupled.scala 224:95]
  wire [2:0] ram_opcode_MPORT_data; // @[Decoupled.scala 224:95]
  wire  ram_opcode_MPORT_addr; // @[Decoupled.scala 224:95]
  wire  ram_opcode_MPORT_mask; // @[Decoupled.scala 224:95]
  wire  ram_opcode_MPORT_en; // @[Decoupled.scala 224:95]
  reg [1:0] ram_param [0:1]; // @[Decoupled.scala 224:95]
  wire  ram_param_io_deq_bits_MPORT_en; // @[Decoupled.scala 224:95]
  wire  ram_param_io_deq_bits_MPORT_addr; // @[Decoupled.scala 224:95]
  wire [1:0] ram_param_io_deq_bits_MPORT_data; // @[Decoupled.scala 224:95]
  wire [1:0] ram_param_MPORT_data; // @[Decoupled.scala 224:95]
  wire  ram_param_MPORT_addr; // @[Decoupled.scala 224:95]
  wire  ram_param_MPORT_mask; // @[Decoupled.scala 224:95]
  wire  ram_param_MPORT_en; // @[Decoupled.scala 224:95]
  reg [2:0] ram_size [0:1]; // @[Decoupled.scala 224:95]
  wire  ram_size_io_deq_bits_MPORT_en; // @[Decoupled.scala 224:95]
  wire  ram_size_io_deq_bits_MPORT_addr; // @[Decoupled.scala 224:95]
  wire [2:0] ram_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 224:95]
  wire [2:0] ram_size_MPORT_data; // @[Decoupled.scala 224:95]
  wire  ram_size_MPORT_addr; // @[Decoupled.scala 224:95]
  wire  ram_size_MPORT_mask; // @[Decoupled.scala 224:95]
  wire  ram_size_MPORT_en; // @[Decoupled.scala 224:95]
  reg [5:0] ram_source [0:1]; // @[Decoupled.scala 224:95]
  wire  ram_source_io_deq_bits_MPORT_en; // @[Decoupled.scala 224:95]
  wire  ram_source_io_deq_bits_MPORT_addr; // @[Decoupled.scala 224:95]
  wire [5:0] ram_source_io_deq_bits_MPORT_data; // @[Decoupled.scala 224:95]
  wire [5:0] ram_source_MPORT_data; // @[Decoupled.scala 224:95]
  wire  ram_source_MPORT_addr; // @[Decoupled.scala 224:95]
  wire  ram_source_MPORT_mask; // @[Decoupled.scala 224:95]
  wire  ram_source_MPORT_en; // @[Decoupled.scala 224:95]
  reg  ram_denied [0:1]; // @[Decoupled.scala 224:95]
  wire  ram_denied_io_deq_bits_MPORT_en; // @[Decoupled.scala 224:95]
  wire  ram_denied_io_deq_bits_MPORT_addr; // @[Decoupled.scala 224:95]
  wire  ram_denied_io_deq_bits_MPORT_data; // @[Decoupled.scala 224:95]
  wire  ram_denied_MPORT_data; // @[Decoupled.scala 224:95]
  wire  ram_denied_MPORT_addr; // @[Decoupled.scala 224:95]
  wire  ram_denied_MPORT_mask; // @[Decoupled.scala 224:95]
  wire  ram_denied_MPORT_en; // @[Decoupled.scala 224:95]
  reg [255:0] ram_data [0:1]; // @[Decoupled.scala 224:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 224:95]
  wire  ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 224:95]
  wire [255:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 224:95]
  wire [255:0] ram_data_MPORT_data; // @[Decoupled.scala 224:95]
  wire  ram_data_MPORT_addr; // @[Decoupled.scala 224:95]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 224:95]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 224:95]
  reg  value; // @[Counter.scala 60:40]
  reg  value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 227:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 228:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 229:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 230:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  assign ram_opcode_io_deq_bits_MPORT_en = 1'h1;
  assign ram_opcode_io_deq_bits_MPORT_addr = value_1;
  assign ram_opcode_io_deq_bits_MPORT_data = ram_opcode[ram_opcode_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 224:95]
  assign ram_opcode_MPORT_data = io_enq_bits_opcode;
  assign ram_opcode_MPORT_addr = value;
  assign ram_opcode_MPORT_mask = 1'h1;
  assign ram_opcode_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_param_io_deq_bits_MPORT_en = 1'h1;
  assign ram_param_io_deq_bits_MPORT_addr = value_1;
  assign ram_param_io_deq_bits_MPORT_data = ram_param[ram_param_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 224:95]
  assign ram_param_MPORT_data = io_enq_bits_param;
  assign ram_param_MPORT_addr = value;
  assign ram_param_MPORT_mask = 1'h1;
  assign ram_param_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_size_io_deq_bits_MPORT_addr = value_1;
  assign ram_size_io_deq_bits_MPORT_data = ram_size[ram_size_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 224:95]
  assign ram_size_MPORT_data = io_enq_bits_size;
  assign ram_size_MPORT_addr = value;
  assign ram_size_MPORT_mask = 1'h1;
  assign ram_size_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_source_io_deq_bits_MPORT_en = 1'h1;
  assign ram_source_io_deq_bits_MPORT_addr = value_1;
  assign ram_source_io_deq_bits_MPORT_data = ram_source[ram_source_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 224:95]
  assign ram_source_MPORT_data = io_enq_bits_source;
  assign ram_source_MPORT_addr = value;
  assign ram_source_MPORT_mask = 1'h1;
  assign ram_source_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_denied_io_deq_bits_MPORT_en = 1'h1;
  assign ram_denied_io_deq_bits_MPORT_addr = value_1;
  assign ram_denied_io_deq_bits_MPORT_data = ram_denied[ram_denied_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 224:95]
  assign ram_denied_MPORT_data = io_enq_bits_denied;
  assign ram_denied_MPORT_addr = value;
  assign ram_denied_MPORT_mask = 1'h1;
  assign ram_denied_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = value_1;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 224:95]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 254:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 253:19]
  assign io_deq_bits_opcode = ram_opcode_io_deq_bits_MPORT_data; // @[Decoupled.scala 262:17]
  assign io_deq_bits_param = ram_param_io_deq_bits_MPORT_data; // @[Decoupled.scala 262:17]
  assign io_deq_bits_size = ram_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 262:17]
  assign io_deq_bits_source = ram_source_io_deq_bits_MPORT_data; // @[Decoupled.scala 262:17]
  assign io_deq_bits_denied = ram_denied_io_deq_bits_MPORT_data; // @[Decoupled.scala 262:17]
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 262:17]
  always @(posedge clock) begin
    if (ram_opcode_MPORT_en & ram_opcode_MPORT_mask) begin
      ram_opcode[ram_opcode_MPORT_addr] <= ram_opcode_MPORT_data; // @[Decoupled.scala 224:95]
    end
    if (ram_param_MPORT_en & ram_param_MPORT_mask) begin
      ram_param[ram_param_MPORT_addr] <= ram_param_MPORT_data; // @[Decoupled.scala 224:95]
    end
    if (ram_size_MPORT_en & ram_size_MPORT_mask) begin
      ram_size[ram_size_MPORT_addr] <= ram_size_MPORT_data; // @[Decoupled.scala 224:95]
    end
    if (ram_source_MPORT_en & ram_source_MPORT_mask) begin
      ram_source[ram_source_MPORT_addr] <= ram_source_MPORT_data; // @[Decoupled.scala 224:95]
    end
    if (ram_denied_MPORT_en & ram_denied_MPORT_mask) begin
      ram_denied[ram_denied_MPORT_addr] <= ram_denied_MPORT_data; // @[Decoupled.scala 224:95]
    end
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[Decoupled.scala 224:95]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 1'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 237:17]
      value <= value + 1'h1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 1'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[Decoupled.scala 241:17]
      value_1 <= value_1 + 1'h1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Decoupled.scala 227:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 227:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 244:28]
      maybe_full <= do_enq; // @[Decoupled.scala 245:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_opcode[initvar] = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_param[initvar] = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_size[initvar] = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_source[initvar] = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_denied[initvar] = _RAND_4[0:0];
  _RAND_5 = {8{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram_data[initvar] = _RAND_5[255:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  value = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  value_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  maybe_full = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule