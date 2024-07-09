module TLXbar(
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
  input         auto_out_6_a_ready,
  output        auto_out_6_a_valid,
  output [2:0]  auto_out_6_a_bits_opcode,
  output [1:0]  auto_out_6_a_bits_size,
  output        auto_out_6_a_bits_source,
  output [29:0] auto_out_6_a_bits_address,
  output [7:0]  auto_out_6_a_bits_mask,
  output [63:0] auto_out_6_a_bits_data,
  output        auto_out_6_d_ready,
  input         auto_out_6_d_valid,
  input  [2:0]  auto_out_6_d_bits_opcode,
  input  [1:0]  auto_out_6_d_bits_size,
  input         auto_out_6_d_bits_source,
  input  [63:0] auto_out_6_d_bits_data,
  input         auto_out_5_a_ready,
  output        auto_out_5_a_valid,
  output [2:0]  auto_out_5_a_bits_opcode,
  output [1:0]  auto_out_5_a_bits_size,
  output        auto_out_5_a_bits_source,
  output [29:0] auto_out_5_a_bits_address,
  output [7:0]  auto_out_5_a_bits_mask,
  output [63:0] auto_out_5_a_bits_data,
  output        auto_out_5_d_ready,
  input         auto_out_5_d_valid,
  input  [2:0]  auto_out_5_d_bits_opcode,
  input  [1:0]  auto_out_5_d_bits_size,
  input         auto_out_5_d_bits_source,
  input  [63:0] auto_out_5_d_bits_data,
  input         auto_out_4_a_ready,
  output        auto_out_4_a_valid,
  output [2:0]  auto_out_4_a_bits_opcode,
  output [1:0]  auto_out_4_a_bits_size,
  output        auto_out_4_a_bits_source,
  output [29:0] auto_out_4_a_bits_address,
  output [7:0]  auto_out_4_a_bits_mask,
  output [63:0] auto_out_4_a_bits_data,
  output        auto_out_4_d_ready,
  input         auto_out_4_d_valid,
  input  [2:0]  auto_out_4_d_bits_opcode,
  input  [1:0]  auto_out_4_d_bits_size,
  input         auto_out_4_d_bits_source,
  input  [63:0] auto_out_4_d_bits_data,
  input         auto_out_3_a_ready,
  output        auto_out_3_a_valid,
  output [2:0]  auto_out_3_a_bits_opcode,
  output [1:0]  auto_out_3_a_bits_size,
  output        auto_out_3_a_bits_source,
  output [29:0] auto_out_3_a_bits_address,
  output [7:0]  auto_out_3_a_bits_mask,
  output [63:0] auto_out_3_a_bits_data,
  output        auto_out_3_d_ready,
  input         auto_out_3_d_valid,
  input  [2:0]  auto_out_3_d_bits_opcode,
  input  [1:0]  auto_out_3_d_bits_size,
  input         auto_out_3_d_bits_source,
  input  [63:0] auto_out_3_d_bits_data,
  input         auto_out_2_a_ready,
  output        auto_out_2_a_valid,
  output [2:0]  auto_out_2_a_bits_opcode,
  output [1:0]  auto_out_2_a_bits_size,
  output        auto_out_2_a_bits_source,
  output [29:0] auto_out_2_a_bits_address,
  output [7:0]  auto_out_2_a_bits_mask,
  output [63:0] auto_out_2_a_bits_data,
  output        auto_out_2_d_ready,
  input         auto_out_2_d_valid,
  input  [2:0]  auto_out_2_d_bits_opcode,
  input  [1:0]  auto_out_2_d_bits_size,
  input         auto_out_2_d_bits_source,
  input  [63:0] auto_out_2_d_bits_data,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
  output [1:0]  auto_out_1_a_bits_size,
  output        auto_out_1_a_bits_source,
  output [30:0] auto_out_1_a_bits_address,
  output [7:0]  auto_out_1_a_bits_mask,
  output [63:0] auto_out_1_a_bits_data,
  output        auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
  input  [1:0]  auto_out_1_d_bits_size,
  input         auto_out_1_d_bits_source,
  input  [63:0] auto_out_1_d_bits_data,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
  output [2:0]  auto_out_0_a_bits_size,
  output        auto_out_0_a_bits_source,
  output [35:0] auto_out_0_a_bits_address,
  output [7:0]  auto_out_0_a_bits_mask,
  output [63:0] auto_out_0_a_bits_data,
  output        auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
  input  [2:0]  auto_out_0_d_bits_size,
  input         auto_out_0_d_bits_source,
  input  [63:0] auto_out_0_d_bits_data
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
`endif // RANDOMIZE_REG_INIT
  reg [2:0] REG; // @[Arbiter.scala 87:30]
  wire  _T_506 = REG == 3'h0; // @[Arbiter.scala 88:28]
  wire [6:0] _T_522 = {auto_out_6_d_valid,auto_out_5_d_valid,auto_out_4_d_valid,auto_out_3_d_valid,auto_out_2_d_valid,
    auto_out_1_d_valid,auto_out_0_d_valid}; // @[Cat.scala 30:58]
  reg [6:0] REG_1; // @[Arbiter.scala 23:23]
  wire [6:0] _T_528 = ~REG_1; // @[Arbiter.scala 24:30]
  wire [6:0] _T_529 = _T_522 & _T_528; // @[Arbiter.scala 24:28]
  wire [13:0] _T_530 = {_T_529,auto_out_6_d_valid,auto_out_5_d_valid,auto_out_4_d_valid,auto_out_3_d_valid,
    auto_out_2_d_valid,auto_out_1_d_valid,auto_out_0_d_valid}; // @[Cat.scala 30:58]
	 
  wire [13:0] _GEN_1 = {{1'd0}, _T_530[13:1]}; // @[package.scala 253:43]
  wire [13:0] _T_532 = _T_530 | _GEN_1; // @[package.scala 253:43]
  wire [13:0] _GEN_2 = {{2'd0}, _T_532[13:2]}; // @[package.scala 253:43]
  wire [13:0] _T_534 = _T_532 | _GEN_2; // @[package.scala 253:43]
  wire [13:0] _GEN_3 = {{4'd0}, _T_534[13:4]}; // @[package.scala 253:43]
  wire [13:0] _T_536 = _T_534 | _GEN_3; // @[package.scala 253:43]
  wire [13:0] _T_539 = {REG_1, 7'h0}; // @[Arbiter.scala 25:66]
  wire [13:0] _GEN_4 = {{1'd0}, _T_536[13:1]}; // @[Arbiter.scala 25:58]
  wire [13:0] _T_540 = _GEN_4 | _T_539; // @[Arbiter.scala 25:58]
  wire [6:0] _T_543 = _T_540[13:7] & _T_540[6:0]; // @[Arbiter.scala 26:39]
  wire [6:0] _T_544 = ~_T_543; // @[Arbiter.scala 26:18]
  
  wire  _T_566 = _T_544[0] & auto_out_0_d_valid; // @[Arbiter.scala 97:79]
  reg  REG_2_0; // @[Arbiter.scala 116:26]
  wire  _T_670_0 = _T_506 ? _T_566 : REG_2_0; // @[Arbiter.scala 117:30]
  wire  _T_567 = _T_544[1] & auto_out_1_d_valid; // @[Arbiter.scala 97:79]
  reg  REG_2_1; // @[Arbiter.scala 116:26]
  wire  _T_670_1 = _T_506 ? _T_567 : REG_2_1; // @[Arbiter.scala 117:30]
  wire  _T_568 = _T_544[2] & auto_out_2_d_valid; // @[Arbiter.scala 97:79]
  reg  REG_2_2; // @[Arbiter.scala 116:26]
  wire  _T_670_2 = _T_506 ? _T_568 : REG_2_2; // @[Arbiter.scala 117:30]
  wire  _T_569 = _T_544[3] & auto_out_3_d_valid; // @[Arbiter.scala 97:79]
  reg  REG_2_3; // @[Arbiter.scala 116:26]
  wire  _T_670_3 = _T_506 ? _T_569 : REG_2_3; // @[Arbiter.scala 117:30]
  wire  _T_570 = _T_544[4] & auto_out_4_d_valid; // @[Arbiter.scala 97:79]
  reg  REG_2_4; // @[Arbiter.scala 116:26]
  wire  _T_670_4 = _T_506 ? _T_570 : REG_2_4; // @[Arbiter.scala 117:30]
  wire  _T_571 = _T_544[5] & auto_out_5_d_valid; // @[Arbiter.scala 97:79]
  reg  REG_2_5; // @[Arbiter.scala 116:26]
  wire  _T_670_5 = _T_506 ? _T_571 : REG_2_5; // @[Arbiter.scala 117:30]
  wire  _T_572 = _T_544[6] & auto_out_6_d_valid; // @[Arbiter.scala 97:79]
  reg  REG_2_6; // @[Arbiter.scala 116:26]
  wire  _T_670_6 = _T_506 ? _T_572 : REG_2_6; // @[Arbiter.scala 117:30]
  
  
  wire [35:0] _T_9 = auto_in_a_bits_address ^ 36'h80000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_10 = {1'b0,$signed(_T_9)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_12 = $signed(_T_10) & 37'shf80000000; // @[Parameters.scala 137:52]
  wire  _T_13 = $signed(_T_12) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_14 = auto_in_a_bits_address ^ 36'h100000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_15 = {1'b0,$signed(_T_14)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_17 = $signed(_T_15) & 37'shf00000000; // @[Parameters.scala 137:52]
  wire  _T_18 = $signed(_T_17) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_19 = auto_in_a_bits_address ^ 36'h200000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_20 = {1'b0,$signed(_T_19)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_22 = $signed(_T_20) & 37'she00000000; // @[Parameters.scala 137:52]
  wire  _T_23 = $signed(_T_22) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_24 = auto_in_a_bits_address ^ 36'h400000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_25 = {1'b0,$signed(_T_24)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_27 = $signed(_T_25) & 37'shc00000000; // @[Parameters.scala 137:52]
  wire  _T_28 = $signed(_T_27) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_29 = auto_in_a_bits_address ^ 36'h800000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_30 = {1'b0,$signed(_T_29)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_32 = $signed(_T_30) & 37'sh800000000; // @[Parameters.scala 137:52]
  wire  _T_33 = $signed(_T_32) == 37'sh0; // @[Parameters.scala 137:67]
  wire  _T_37 = _T_13 | _T_18 | _T_23 | _T_28 | _T_33; // @[Xbar.scala 363:92]
  wire [36:0] _T_40 = {1'b0,$signed(auto_in_a_bits_address)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_42 = $signed(_T_40) & 37'shfe0000000; // @[Parameters.scala 137:52]
  wire  _T_43 = $signed(_T_42) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_44 = auto_in_a_bits_address ^ 36'h20000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_45 = {1'b0,$signed(_T_44)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_47 = $signed(_T_45) & 37'shff0000000; // @[Parameters.scala 137:52]
  wire  _T_48 = $signed(_T_47) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_49 = auto_in_a_bits_address ^ 36'h30000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_50 = {1'b0,$signed(_T_49)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_52 = $signed(_T_50) & 37'shff8000000; // @[Parameters.scala 137:52]
  wire  _T_53 = $signed(_T_52) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_54 = auto_in_a_bits_address ^ 36'h40000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_55 = {1'b0,$signed(_T_54)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_57 = $signed(_T_55) & 37'shfc0000000; // @[Parameters.scala 137:52]
  wire  _T_58 = $signed(_T_57) == 37'sh0; // @[Parameters.scala 137:67]
  wire  _T_61 = _T_43 | _T_48 | _T_53 | _T_58; // @[Xbar.scala 363:92]
  wire [35:0] _T_63 = auto_in_a_bits_address ^ 36'h38000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_64 = {1'b0,$signed(_T_63)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_66 = $signed(_T_64) & 37'shfffff0000; // @[Parameters.scala 137:52]
  wire  _T_67 = $signed(_T_66) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_69 = auto_in_a_bits_address ^ 36'h3c000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_70 = {1'b0,$signed(_T_69)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_72 = $signed(_T_70) & 37'shffc000000; // @[Parameters.scala 137:52]
  wire  _T_73 = $signed(_T_72) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_75 = auto_in_a_bits_address ^ 36'h3a000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_76 = {1'b0,$signed(_T_75)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_78 = $signed(_T_76) & 37'shffffff000; // @[Parameters.scala 137:52]
  wire  _T_79 = $signed(_T_78) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_81 = auto_in_a_bits_address ^ 36'h38020000; // @[Parameters.scala 137:31]
  wire [36:0] _T_82 = {1'b0,$signed(_T_81)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_84 = $signed(_T_82) & 37'shffffff000; // @[Parameters.scala 137:52]
  wire  _T_85 = $signed(_T_84) == 37'sh0; // @[Parameters.scala 137:67]
  wire [35:0] _T_87 = auto_in_a_bits_address ^ 36'h39000000; // @[Parameters.scala 137:31]
  wire [36:0] _T_88 = {1'b0,$signed(_T_87)}; // @[Parameters.scala 137:49]
  wire [36:0] _T_90 = $signed(_T_88) & 37'shfffff0000; // @[Parameters.scala 137:52]
  wire  _T_91 = $signed(_T_90) == 37'sh0; // @[Parameters.scala 137:67]
  wire [12:0] _T_319 = 13'h3f << auto_out_0_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _T_321 = ~_T_319[5:0]; // @[package.scala 234:46]
  
  wire [2:0] _WIRE_20_1_d_bits_size = {{1'd0}, auto_out_1_d_bits_size}; // @[BundleMap.scala 247:19 Xbar.scala 288:19]
  wire [2:0] _WIRE_20_2_d_bits_size = {{1'd0}, auto_out_2_d_bits_size}; // @[BundleMap.scala 247:19 Xbar.scala 288:19]
  wire [2:0] _WIRE_20_3_d_bits_size = {{1'd0}, auto_out_3_d_bits_size}; // @[BundleMap.scala 247:19 Xbar.scala 288:19]
  wire [2:0] _WIRE_20_4_d_bits_size = {{1'd0}, auto_out_4_d_bits_size}; // @[BundleMap.scala 247:19 Xbar.scala 288:19]
  wire [2:0] _WIRE_20_5_d_bits_size = {{1'd0}, auto_out_5_d_bits_size}; // @[BundleMap.scala 247:19 Xbar.scala 288:19]
  wire [2:0] _WIRE_20_6_d_bits_size = {{1'd0}, auto_out_6_d_bits_size}; // @[BundleMap.scala 247:19 Xbar.scala 288:19]
  wire  _T_507 = _T_506 & auto_in_d_ready; // @[Arbiter.scala 89:24]
  wire [6:0] _T_547 = _T_544 & _T_522; // @[Arbiter.scala 28:29]
  wire [7:0] _T_548 = {_T_547, 1'h0}; // @[package.scala 244:48]
  wire [6:0] _T_550 = _T_547 | _T_548[6:0]; // @[package.scala 244:43]
  wire [8:0] _T_551 = {_T_550, 2'h0}; // @[package.scala 244:48]
  wire [6:0] _T_553 = _T_550 | _T_551[6:0]; // @[package.scala 244:43]
  wire [10:0] _T_554 = {_T_553, 4'h0}; // @[package.scala 244:48]
  wire [6:0] _T_556 = _T_553 | _T_554[6:0]; // @[package.scala 244:43]
  wire  _T_622 = auto_out_0_d_valid | auto_out_1_d_valid | auto_out_2_d_valid | auto_out_3_d_valid | auto_out_4_d_valid
     | auto_out_5_d_valid | auto_out_6_d_valid; // @[Arbiter.scala 107:36]
  wire  _T_698 = REG_2_0 & auto_out_0_d_valid | REG_2_1 & auto_out_1_d_valid | REG_2_2 & auto_out_2_d_valid | REG_2_3 &
    auto_out_3_d_valid | REG_2_4 & auto_out_4_d_valid | REG_2_5 & auto_out_5_d_valid | REG_2_6 & auto_out_6_d_valid; // @[Mux.scala 27:72]
  wire  _T_699 = _T_506 ? _T_622 : _T_698; // @[Arbiter.scala 125:29]
  wire  _T_666 = auto_in_d_ready & _T_699; // @[ReadyValidCancel.scala 50:33]
  wire [2:0] _GEN_5 = {{2'd0}, _T_666}; // @[Arbiter.scala 113:52]
  wire [2:0] _T_668 = REG - _GEN_5; // @[Arbiter.scala 113:52]
  wire  _T_672_0 = _T_506 ? _T_544[0] : REG_2_0; // @[Arbiter.scala 121:24]
  wire  _T_672_1 = _T_506 ? _T_544[1] : REG_2_1; // @[Arbiter.scala 121:24]
  wire  _T_672_2 = _T_506 ? _T_544[2] : REG_2_2; // @[Arbiter.scala 121:24]
  wire  _T_672_3 = _T_506 ? _T_544[3] : REG_2_3; // @[Arbiter.scala 121:24]
  wire  _T_672_4 = _T_506 ? _T_544[4] : REG_2_4; // @[Arbiter.scala 121:24]
  wire  _T_672_5 = _T_506 ? _T_544[5] : REG_2_5; // @[Arbiter.scala 121:24]
  wire  _T_672_6 = _T_506 ? _T_544[6] : REG_2_6; // @[Arbiter.scala 121:24]
  wire [63:0] _T_726 = _T_670_0 ? auto_out_0_d_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_727 = _T_670_1 ? auto_out_1_d_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_728 = _T_670_2 ? auto_out_2_d_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_729 = _T_670_3 ? auto_out_3_d_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_730 = _T_670_4 ? auto_out_4_d_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_731 = _T_670_5 ? auto_out_5_d_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_732 = _T_670_6 ? auto_out_6_d_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_733 = _T_726 | _T_727; // @[Mux.scala 27:72]
  wire [63:0] _T_734 = _T_733 | _T_728; // @[Mux.scala 27:72]
  wire [63:0] _T_735 = _T_734 | _T_729; // @[Mux.scala 27:72]
  wire [63:0] _T_736 = _T_735 | _T_730; // @[Mux.scala 27:72]
  wire [63:0] _T_737 = _T_736 | _T_731; // @[Mux.scala 27:72]
  wire [2:0] _T_778 = _T_670_0 ? auto_out_0_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_779 = _T_670_1 ? _WIRE_20_1_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_780 = _T_670_2 ? _WIRE_20_2_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_781 = _T_670_3 ? _WIRE_20_3_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_782 = _T_670_4 ? _WIRE_20_4_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_783 = _T_670_5 ? _WIRE_20_5_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_784 = _T_670_6 ? _WIRE_20_6_d_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_785 = _T_778 | _T_779; // @[Mux.scala 27:72]
  wire [2:0] _T_786 = _T_785 | _T_780; // @[Mux.scala 27:72]
  wire [2:0] _T_787 = _T_786 | _T_781; // @[Mux.scala 27:72]
  wire [2:0] _T_788 = _T_787 | _T_782; // @[Mux.scala 27:72]
  wire [2:0] _T_789 = _T_788 | _T_783; // @[Mux.scala 27:72]
  wire [2:0] _T_804 = _T_670_0 ? auto_out_0_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_805 = _T_670_1 ? auto_out_1_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_806 = _T_670_2 ? auto_out_2_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_807 = _T_670_3 ? auto_out_3_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_808 = _T_670_4 ? auto_out_4_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_809 = _T_670_5 ? auto_out_5_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_810 = _T_670_6 ? auto_out_6_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_811 = _T_804 | _T_805; // @[Mux.scala 27:72]
  wire [2:0] _T_812 = _T_811 | _T_806; // @[Mux.scala 27:72]
  wire [2:0] _T_813 = _T_812 | _T_807; // @[Mux.scala 27:72]
  wire [2:0] _T_814 = _T_813 | _T_808; // @[Mux.scala 27:72]
  wire [2:0] _T_815 = _T_814 | _T_809; // @[Mux.scala 27:72]
  
  
  assign auto_in_a_ready = _T_37 & auto_out_0_a_ready | _T_61 & auto_out_1_a_ready | _T_67 & auto_out_2_a_ready | _T_73
     & auto_out_3_a_ready | _T_79 & auto_out_4_a_ready | _T_85 & auto_out_5_a_ready | _T_91 & auto_out_6_a_ready; // @[Mux.scala 27:72]
  assign auto_in_d_valid = _T_506 ? _T_622 : _T_698; // @[Arbiter.scala 125:29]
  assign auto_in_d_bits_opcode = _T_815 | _T_810; // @[Mux.scala 27:72]
  assign auto_in_d_bits_size = _T_789 | _T_784; // @[Mux.scala 27:72]
  assign auto_in_d_bits_source = _T_670_0 & auto_out_0_d_bits_source | _T_670_1 & auto_out_1_d_bits_source | _T_670_2 &
    auto_out_2_d_bits_source | _T_670_3 & auto_out_3_d_bits_source | _T_670_4 & auto_out_4_d_bits_source | _T_670_5 &
    auto_out_5_d_bits_source | _T_670_6 & auto_out_6_d_bits_source; // @[Mux.scala 27:72]
  assign auto_in_d_bits_data = _T_737 | _T_732; // @[Mux.scala 27:72]
  assign auto_out_6_a_valid = auto_in_a_valid & _T_91; // @[Xbar.scala 428:50]
  assign auto_out_6_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_6_a_bits_size = auto_in_a_bits_size[1:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_6_a_bits_source = auto_in_a_bits_source; // @[Xbar.scala 237:55]
  assign auto_out_6_a_bits_address = auto_in_a_bits_address[29:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_6_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_6_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_6_d_ready = auto_in_d_ready & _T_672_6; // @[Arbiter.scala 123:31]
  assign auto_out_5_a_valid = auto_in_a_valid & _T_85; // @[Xbar.scala 428:50]
  assign auto_out_5_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_5_a_bits_size = auto_in_a_bits_size[1:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_5_a_bits_source = auto_in_a_bits_source; // @[Xbar.scala 237:55]
  assign auto_out_5_a_bits_address = auto_in_a_bits_address[29:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_5_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_5_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_5_d_ready = auto_in_d_ready & _T_672_5; // @[Arbiter.scala 123:31]
  assign auto_out_4_a_valid = auto_in_a_valid & _T_79; // @[Xbar.scala 428:50]
  assign auto_out_4_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_4_a_bits_size = auto_in_a_bits_size[1:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_4_a_bits_source = auto_in_a_bits_source; // @[Xbar.scala 237:55]
  assign auto_out_4_a_bits_address = auto_in_a_bits_address[29:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_4_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_4_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_4_d_ready = auto_in_d_ready & _T_672_4; // @[Arbiter.scala 123:31]
  assign auto_out_3_a_valid = auto_in_a_valid & _T_73; // @[Xbar.scala 428:50]
  assign auto_out_3_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_3_a_bits_size = auto_in_a_bits_size[1:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_3_a_bits_source = auto_in_a_bits_source; // @[Xbar.scala 237:55]
  assign auto_out_3_a_bits_address = auto_in_a_bits_address[29:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_3_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_3_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_3_d_ready = auto_in_d_ready & _T_672_3; // @[Arbiter.scala 123:31]
  assign auto_out_2_a_valid = auto_in_a_valid & _T_67; // @[Xbar.scala 428:50]
  assign auto_out_2_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_2_a_bits_size = auto_in_a_bits_size[1:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_2_a_bits_source = auto_in_a_bits_source; // @[Xbar.scala 237:55]
  assign auto_out_2_a_bits_address = auto_in_a_bits_address[29:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_2_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_2_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_2_d_ready = auto_in_d_ready & _T_672_2; // @[Arbiter.scala 123:31]
  assign auto_out_1_a_valid = auto_in_a_valid & _T_61; // @[Xbar.scala 428:50]
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_size = auto_in_a_bits_size[1:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_1_a_bits_source = auto_in_a_bits_source; // @[Xbar.scala 237:55]
  assign auto_out_1_a_bits_address = auto_in_a_bits_address[30:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_d_ready = auto_in_d_ready & _T_672_1; // @[Arbiter.scala 123:31]
  assign auto_out_0_a_valid = auto_in_a_valid & _T_37; // @[Xbar.scala 428:50]
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_source = auto_in_a_bits_source; // @[Xbar.scala 237:55]
  assign auto_out_0_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_d_ready = auto_in_d_ready & _T_672_0; // @[Arbiter.scala 123:31]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiter.scala 87:30]
      REG <= 3'h0; // @[Arbiter.scala 87:30]
    end else if (_T_507) begin // @[Arbiter.scala 113:23]
      if (_T_566) begin // @[Arbiter.scala 111:73]
        if (auto_out_0_d_bits_opcode[0]) begin // @[Edges.scala 220:14]
          REG <= _T_321[5:3];
        end else begin
          REG <= 3'h0;
        end
      end else begin
        REG <= 3'h0;
      end
    end else begin
      REG <= _T_668;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      REG_1 <= 7'h7f; // @[Arbiter.scala 23:23]
    end else if (_T_507 & |_T_522) begin // @[Arbiter.scala 27:32]
      REG_1 <= _T_556; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_506) begin // @[Arbiter.scala 117:30]
      REG_2_0 <= _T_566;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_506) begin // @[Arbiter.scala 117:30]
      REG_2_1 <= _T_567;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_2 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_506) begin // @[Arbiter.scala 117:30]
      REG_2_2 <= _T_568;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_3 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_506) begin // @[Arbiter.scala 117:30]
      REG_2_3 <= _T_569;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_4 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_506) begin // @[Arbiter.scala 117:30]
      REG_2_4 <= _T_570;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_5 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_506) begin // @[Arbiter.scala 117:30]
      REG_2_5 <= _T_571;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      REG_2_6 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (_T_506) begin // @[Arbiter.scala 117:30]
      REG_2_6 <= _T_572;
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
  REG = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  REG_1 = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  REG_2_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG_2_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  REG_2_2 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  REG_2_3 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  REG_2_4 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  REG_2_5 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  REG_2_6 = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule