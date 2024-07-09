module SCTable_5(
  input         clock,
  input         reset,
  input         io_req_valid,
  input  [38:0] io_req_bits_pc,
  input  [63:0] io_req_bits_hist,
  output [5:0]  io_resp_ctr_0,
  output [5:0]  io_resp_ctr_1,
  input  [38:0] io_update_pc,
  input  [63:0] io_update_hist,
  input         io_update_mask,
  input  [5:0]  io_update_oldCtr,
  input         io_update_tagePred,
  input         io_update_taken
);
  wire  table__clock; // @[SC.scala 79:21]
  wire  table__reset; // @[SC.scala 79:21]
  wire  table__io_rreq_valid; // @[SC.scala 79:21]
  wire [8:0] table__io_rreq_bits_setIdx; // @[SC.scala 79:21]
  wire [5:0] table__io_rresp_data_0; // @[SC.scala 79:21]
  wire [5:0] table__io_rresp_data_1; // @[SC.scala 79:21]
  wire  table__io_wreq_valid; // @[SC.scala 79:21]
  wire [8:0] table__io_wreq_bits_setIdx; // @[SC.scala 79:21]
  wire [5:0] table__io_wreq_bits_data_0; // @[SC.scala 79:21]
  wire [5:0] table__io_wreq_bits_data_1; // @[SC.scala 79:21]
  wire [1:0] table__io_wreq_bits_waymask; // @[SC.scala 79:21]
  wire  wrbypass_clock; // @[SC.scala 157:24]
  wire  wrbypass_reset; // @[SC.scala 157:24]
  wire  wrbypass_io_wen; // @[SC.scala 157:24]
  wire [8:0] wrbypass_io_update_idx; // @[SC.scala 157:24]
  wire  wrbypass_io_update_ctrs_valid; // @[SC.scala 157:24]
  wire [5:0] wrbypass_io_update_ctrs_bits; // @[SC.scala 157:24]
  wire  wrbypass_io_update_ctrPos; // @[SC.scala 157:24]
  wire  wrbypass_io_update_altPos; // @[SC.scala 157:24]
  wire  wrbypass_io_hit; // @[SC.scala 157:24]
  wire  wrbypass_io_ctrs_0_valid; // @[SC.scala 157:24]
  wire [5:0] wrbypass_io_ctrs_0_bits; // @[SC.scala 157:24]
  wire  wrbypass_io_ctrs_1_valid; // @[SC.scala 157:24]
  wire [5:0] wrbypass_io_ctrs_1_bits; // @[SC.scala 157:24]
  wire [8:0] _T_4 = io_req_bits_hist[8:0] ^ io_req_bits_hist[17:9]; // @[ParallelMux.scala 58:54]
  wire [8:0] _GEN_5 = {{4'd0}, io_req_bits_hist[31:27]}; // @[ParallelMux.scala 58:54]
  wire [8:0] _T_5 = io_req_bits_hist[26:18] ^ _GEN_5; // @[ParallelMux.scala 58:54]
  wire [8:0] _T_6 = _T_4 ^ _T_5; // @[ParallelMux.scala 58:54]
  wire [37:0] _GEN_6 = {{29'd0}, _T_6}; // @[SC.scala 83:50]
  wire [37:0] _T_8 = _GEN_6 ^ io_req_bits_pc[38:1]; // @[SC.scala 83:50]
  wire  _T_10 = io_update_mask & ~io_update_tagePred; // @[SC.scala 98:43]
  wire  _T_12 = io_update_mask & io_update_tagePred; // @[SC.scala 98:43]
  wire [8:0] _T_17 = io_update_hist[8:0] ^ io_update_hist[17:9]; // @[ParallelMux.scala 58:54]
  wire [8:0] _GEN_7 = {{4'd0}, io_update_hist[31:27]}; // @[ParallelMux.scala 58:54]
  wire [8:0] _T_18 = io_update_hist[26:18] ^ _GEN_7; // @[ParallelMux.scala 58:54]
  wire [8:0] _T_19 = _T_17 ^ _T_18; // @[ParallelMux.scala 58:54]
  wire [37:0] _GEN_8 = {{29'd0}, _T_19}; // @[SC.scala 83:50]
  wire [37:0] _T_21 = _GEN_8 ^ io_update_pc[38:1]; // @[SC.scala 83:50]
  wire  _GEN_2 = io_update_tagePred ? wrbypass_io_ctrs_1_valid : wrbypass_io_ctrs_0_valid; // @[SC.scala 162:{39,39}]
  wire  hit_and_valid = wrbypass_io_hit & _GEN_2; // @[SC.scala 162:39]
  wire [5:0] _GEN_3 = wrbypass_io_ctrs_0_bits; // @[SC.scala 163:{19,19}]
  wire [5:0] _GEN_4 = io_update_tagePred ? $signed(wrbypass_io_ctrs_1_bits) : $signed(_GEN_3); // @[SC.scala 163:{19,19}]
  wire [5:0] oldCtr = hit_and_valid ? $signed(_GEN_4) : $signed(io_update_oldCtr); // @[SC.scala 163:19]
  wire  _T_22 = $signed(oldCtr) == 6'sh1f; // @[BPU.scala 96:27]
  wire  _T_23 = $signed(oldCtr) == 6'sh20; // @[BPU.scala 97:30]
  wire [5:0] _T_29 = $signed(oldCtr) + 6'sh1; // @[BPU.scala 100:24]
  wire [5:0] _T_32 = $signed(oldCtr) - 6'sh1; // @[BPU.scala 100:35]
  wire [5:0] _T_33 = io_update_taken ? $signed(_T_29) : $signed(_T_32); // @[BPU.scala 100:12]
  wire [5:0] _T_34 = _T_23 & ~io_update_taken ? $signed(6'sh20) : $signed(_T_33); // @[BPU.scala 99:10]
  SRAMTemplate_20 table_ ( // @[SC.scala 79:21]
    .clock(table__clock),
    .reset(table__reset),
    .io_rreq_valid(table__io_rreq_valid),
    .io_rreq_bits_setIdx(table__io_rreq_bits_setIdx),
    .io_rresp_data_0(table__io_rresp_data_0),
    .io_rresp_data_1(table__io_rresp_data_1),
    .io_wreq_valid(table__io_wreq_valid),
    .io_wreq_bits_setIdx(table__io_wreq_bits_setIdx),
    .io_wreq_bits_data_0(table__io_wreq_bits_data_0),
    .io_wreq_bits_data_1(table__io_wreq_bits_data_1),
    .io_wreq_bits_waymask(table__io_wreq_bits_waymask)
  );
  SCWrBypass wrbypass ( // @[SC.scala 157:24]
    .clock(wrbypass_clock),
    .reset(wrbypass_reset),
    .io_wen(wrbypass_io_wen),
    .io_update_idx(wrbypass_io_update_idx),
    .io_update_ctrs_valid(wrbypass_io_update_ctrs_valid),
    .io_update_ctrs_bits(wrbypass_io_update_ctrs_bits),
    .io_update_ctrPos(wrbypass_io_update_ctrPos),
    .io_update_altPos(wrbypass_io_update_altPos),
    .io_hit(wrbypass_io_hit),
    .io_ctrs_0_valid(wrbypass_io_ctrs_0_valid),
    .io_ctrs_0_bits(wrbypass_io_ctrs_0_bits),
    .io_ctrs_1_valid(wrbypass_io_ctrs_1_valid),
    .io_ctrs_1_bits(wrbypass_io_ctrs_1_bits)
  );
  assign io_resp_ctr_0 = table__io_rresp_data_0; // @[SC.scala 94:15]
  assign io_resp_ctr_1 = table__io_rresp_data_1; // @[SC.scala 94:15]
  assign table__clock = clock;
  assign table__reset = reset;
  assign table__io_rreq_valid = io_req_valid; // @[SC.scala 91:24]
  assign table__io_rreq_bits_setIdx = _T_8[8:0]; // @[SC.scala 83:75]
  assign table__io_wreq_valid = io_update_mask; // @[SRAMTemplate.scala 84:20]
  assign table__io_wreq_bits_setIdx = _T_21[8:0]; // @[SC.scala 83:75]
  assign table__io_wreq_bits_data_0 = _T_22 & io_update_taken ? $signed(6'sh1f) : $signed(_T_34); // @[BPU.scala 98:8]
  assign table__io_wreq_bits_data_1 = _T_22 & io_update_taken ? $signed(6'sh1f) : $signed(_T_34); // @[BPU.scala 98:8]
  assign table__io_wreq_bits_waymask = {_T_12,_T_10}; // @[SC.scala 98:82]
  assign wrbypass_clock = clock;
  assign wrbypass_reset = reset;
  assign wrbypass_io_wen = io_update_mask; // @[SC.scala 166:19]
  assign wrbypass_io_update_idx = _T_21[8:0]; // @[SC.scala 83:75]
  assign wrbypass_io_update_ctrs_valid = io_update_mask; // @[SC.scala 167:33]
  assign wrbypass_io_update_ctrs_bits = _T_22 & io_update_taken ? $signed(6'sh1f) : $signed(_T_34); // @[BPU.scala 98:8]
  assign wrbypass_io_update_ctrPos = io_update_tagePred; // @[SC.scala 170:29]
  assign wrbypass_io_update_altPos = ~io_update_tagePred; // @[SC.scala 160:16]
endmodule
module Tage_SC(
  input           clock,
  input           reset,
  input  [38:0]   io_in_bits_s0_pc,
  input  [63:0]   io_in_bits_ghist,
  input  [38:0]   io_in_bits_resp_in_0_s1_pc,
  input           io_in_bits_resp_in_0_s1_preds_br_taken_mask_0,
  input           io_in_bits_resp_in_0_s1_preds_br_taken_mask_1,
  input           io_in_bits_resp_in_0_s1_preds_slot_valids_0,
  input           io_in_bits_resp_in_0_s1_preds_slot_valids_1,
  input  [38:0]   io_in_bits_resp_in_0_s1_preds_targets_0,
  input  [38:0]   io_in_bits_resp_in_0_s1_preds_targets_1,
  input           io_in_bits_resp_in_0_s1_preds_is_br_sharing,
  input           io_in_bits_resp_in_0_s1_preds_hit,
  input  [3:0]    io_in_bits_resp_in_0_s1_ftb_entry_brSlots_0_offset,
  input  [3:0]    io_in_bits_resp_in_0_s1_ftb_entry_tailSlot_offset,
  input  [4:0]    io_in_bits_resp_in_0_s1_ftb_entry_pftAddr,
  input           io_in_bits_resp_in_0_s1_ftb_entry_carry,
  input           io_in_bits_resp_in_0_s1_ftb_entry_oversize,
  output [1023:0] io_out_s3_meta,
  output [38:0]   io_out_resp_s1_pc,
  output          io_out_resp_s1_preds_br_taken_mask_0,
  output          io_out_resp_s1_preds_br_taken_mask_1,
  output          io_out_resp_s1_preds_slot_valids_0,
  output          io_out_resp_s1_preds_slot_valids_1,
  output [38:0]   io_out_resp_s1_preds_targets_0,
  output [38:0]   io_out_resp_s1_preds_targets_1,
  output          io_out_resp_s1_preds_is_br_sharing,
  output          io_out_resp_s1_preds_hit,
  output [3:0]    io_out_resp_s1_ftb_entry_brSlots_0_offset,
  output [3:0]    io_out_resp_s1_ftb_entry_tailSlot_offset,
  output [4:0]    io_out_resp_s1_ftb_entry_pftAddr,
  output          io_out_resp_s1_ftb_entry_carry,
  output          io_out_resp_s1_ftb_entry_oversize,
  output          io_out_resp_s2_preds_br_taken_mask_0,
  output          io_out_resp_s2_preds_br_taken_mask_1,
  input           io_s0_fire,
  input           io_s1_fire,
  input           io_s2_fire,
  input           io_update_valid,
  input  [38:0]   io_update_bits_pc,
  input           io_update_bits_preds_br_taken_mask_0,
  input           io_update_bits_preds_br_taken_mask_1,
  input  [63:0]   io_update_bits_ghist_predHist,
  input           io_update_bits_ftb_entry_brSlots_0_valid,
  input           io_update_bits_ftb_entry_tailSlot_sharing,
  input           io_update_bits_ftb_entry_tailSlot_valid,
  input           io_update_bits_ftb_entry_always_taken_0,
  input           io_update_bits_ftb_entry_always_taken_1,
  input           io_update_bits_mispred_mask_0,
  input           io_update_bits_mispred_mask_1,
  input  [1023:0] io_update_bits_meta,
  output [5:0]    perfinfo_perfEvents_perf_events_0_incr_step,
  output [5:0]    perfinfo_perfEvents_perf_events_1_incr_step,
  output [5:0]    perfinfo_perfEvents_perf_events_2_incr_step
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
  reg [63:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [287:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [63:0] _RAND_61;
  reg [63:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [63:0] _RAND_69;
  reg [63:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [63:0] _RAND_77;
  reg [63:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [63:0] _RAND_85;
  reg [63:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [63:0] _RAND_93;
  reg [63:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [63:0] _RAND_101;
  reg [95:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [63:0] _RAND_109;
  reg [95:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [63:0] _RAND_117;
  reg [95:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [63:0] _RAND_125;
  reg [95:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [63:0] _RAND_133;
  reg [95:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [63:0] _RAND_141;
  reg [95:0] _RAND_142;
  reg [63:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [63:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [63:0] _RAND_169;
  reg [63:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [63:0] _RAND_175;
  reg [63:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [63:0] _RAND_181;
  reg [63:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [63:0] _RAND_187;
  reg [63:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [63:0] _RAND_193;
  reg [63:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [63:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [63:0] _RAND_204;
  reg [95:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [63:0] _RAND_210;
  reg [95:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [63:0] _RAND_216;
  reg [95:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [63:0] _RAND_222;
  reg [95:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [63:0] _RAND_228;
  reg [95:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
`endif // RANDOMIZE_REG_INIT
  wire  bank_tables_0_0_clock; // @[Tage.scala 504:25]
  wire  bank_tables_0_0_reset; // @[Tage.scala 504:25]
  wire  bank_tables_0_0_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_0_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_0_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_0_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_0_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_0_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_0_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_0_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_0_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_0_0_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_0_0_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_0_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_0_0_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_0_io_update_u; // @[Tage.scala 504:25]
  wire  bank_tables_0_1_clock; // @[Tage.scala 504:25]
  wire  bank_tables_0_1_reset; // @[Tage.scala 504:25]
  wire  bank_tables_0_1_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_1_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_1_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_1_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_1_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_1_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_1_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_1_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_1_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_0_1_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_0_1_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_1_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_0_1_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_1_io_update_u; // @[Tage.scala 504:25]
  wire  bank_tables_0_2_clock; // @[Tage.scala 504:25]
  wire  bank_tables_0_2_reset; // @[Tage.scala 504:25]
  wire  bank_tables_0_2_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_2_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_2_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_2_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_2_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_2_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_2_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_2_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_2_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_0_2_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_0_2_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_2_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_0_2_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_2_io_update_u; // @[Tage.scala 504:25]
  wire  bank_tables_0_3_clock; // @[Tage.scala 504:25]
  wire  bank_tables_0_3_reset; // @[Tage.scala 504:25]
  wire  bank_tables_0_3_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_3_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_3_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_3_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_3_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_3_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_3_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_3_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_3_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_0_3_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_0_3_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_3_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_0_3_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_3_io_update_u; // @[Tage.scala 504:25]
  wire  bank_tables_0_4_clock; // @[Tage.scala 504:25]
  wire  bank_tables_0_4_reset; // @[Tage.scala 504:25]
  wire  bank_tables_0_4_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_4_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_4_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_4_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_4_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_4_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_4_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_4_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_4_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_0_4_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_0_4_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_4_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_0_4_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_4_io_update_u; // @[Tage.scala 504:25]
  wire  bank_tables_0_5_clock; // @[Tage.scala 504:25]
  wire  bank_tables_0_5_reset; // @[Tage.scala 504:25]
  wire  bank_tables_0_5_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_5_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_5_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_5_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_5_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_5_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_0_5_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_0_5_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_0_5_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_0_5_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_0_5_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_0_5_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_0_5_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_0_5_io_update_u; // @[Tage.scala 504:25]
  wire  bank_tables_1_0_clock; // @[Tage.scala 504:25]
  wire  bank_tables_1_0_reset; // @[Tage.scala 504:25]
  wire  bank_tables_1_0_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_0_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_0_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_0_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_0_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_0_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_0_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_0_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_0_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_1_0_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_1_0_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_0_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_1_0_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_0_io_update_u; // @[Tage.scala 504:25]
  wire  bank_tables_1_1_clock; // @[Tage.scala 504:25]
  wire  bank_tables_1_1_reset; // @[Tage.scala 504:25]
  wire  bank_tables_1_1_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_1_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_1_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_1_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_1_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_1_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_1_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_1_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_1_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_1_1_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_1_1_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_1_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_1_1_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_1_io_update_u; // @[Tage.scala 504:25]
  wire  bank_tables_1_2_clock; // @[Tage.scala 504:25]
  wire  bank_tables_1_2_reset; // @[Tage.scala 504:25]
  wire  bank_tables_1_2_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_2_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_2_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_2_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_2_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_2_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_2_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_2_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_2_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_1_2_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_1_2_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_2_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_1_2_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_2_io_update_u; // @[Tage.scala 504:25]
  wire  bank_tables_1_3_clock; // @[Tage.scala 504:25]
  wire  bank_tables_1_3_reset; // @[Tage.scala 504:25]
  wire  bank_tables_1_3_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_3_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_3_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_3_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_3_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_3_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_3_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_3_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_3_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_1_3_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_1_3_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_3_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_1_3_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_3_io_update_u; // @[Tage.scala 504:25]
  wire  bank_tables_1_4_clock; // @[Tage.scala 504:25]
  wire  bank_tables_1_4_reset; // @[Tage.scala 504:25]
  wire  bank_tables_1_4_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_4_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_4_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_4_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_4_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_4_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_4_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_4_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_4_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_1_4_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_1_4_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_4_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_1_4_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_4_io_update_u; // @[Tage.scala 504:25]
  wire  bank_tables_1_5_clock; // @[Tage.scala 504:25]
  wire  bank_tables_1_5_reset; // @[Tage.scala 504:25]
  wire  bank_tables_1_5_io_req_valid; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_5_io_req_bits_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_5_io_req_bits_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_5_io_resp_valid; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_5_io_resp_bits_ctr; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_5_io_resp_bits_u; // @[Tage.scala 504:25]
  wire [38:0] bank_tables_1_5_io_update_pc; // @[Tage.scala 504:25]
  wire [63:0] bank_tables_1_5_io_update_hist; // @[Tage.scala 504:25]
  wire  bank_tables_1_5_io_update_mask; // @[Tage.scala 504:25]
  wire  bank_tables_1_5_io_update_taken; // @[Tage.scala 504:25]
  wire  bank_tables_1_5_io_update_alloc; // @[Tage.scala 504:25]
  wire [2:0] bank_tables_1_5_io_update_oldCtr; // @[Tage.scala 504:25]
  wire  bank_tables_1_5_io_update_uMask; // @[Tage.scala 504:25]
  wire [1:0] bank_tables_1_5_io_update_u; // @[Tage.scala 504:25]
  wire  bt_clock; // @[Tage.scala 513:19]
  wire  bt_reset; // @[Tage.scala 513:19]
  wire  bt_io_s0_fire; // @[Tage.scala 513:19]
  wire [38:0] bt_io_s0_pc; // @[Tage.scala 513:19]
  wire [1:0] bt_io_s1_cnt_0; // @[Tage.scala 513:19]
  wire [1:0] bt_io_s1_cnt_1; // @[Tage.scala 513:19]
  wire [1:0] bt_io_update_cnt_0; // @[Tage.scala 513:19]
  wire [1:0] bt_io_update_cnt_1; // @[Tage.scala 513:19]
  wire  bt_io_update_valid; // @[Tage.scala 513:19]
  wire [38:0] bt_io_update_bits_pc; // @[Tage.scala 513:19]
  wire  bt_io_update_bits_preds_br_taken_mask_0; // @[Tage.scala 513:19]
  wire  bt_io_update_bits_preds_br_taken_mask_1; // @[Tage.scala 513:19]
  wire  bt_io_update_bits_ftb_entry_brSlots_0_valid; // @[Tage.scala 513:19]
  wire  bt_io_update_bits_ftb_entry_tailSlot_sharing; // @[Tage.scala 513:19]
  wire  bt_io_update_bits_ftb_entry_tailSlot_valid; // @[Tage.scala 513:19]
  wire  SCTable_clock; // @[SC.scala 232:27]
  wire  SCTable_reset; // @[SC.scala 232:27]
  wire  SCTable_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_io_req_bits_pc; // @[SC.scala 232:27]
  wire [5:0] SCTable_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_io_update_pc; // @[SC.scala 232:27]
  wire  SCTable_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_io_update_taken; // @[SC.scala 232:27]
  wire  SCTable_1_clock; // @[SC.scala 232:27]
  wire  SCTable_1_reset; // @[SC.scala 232:27]
  wire  SCTable_1_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_1_io_req_bits_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_1_io_req_bits_hist; // @[SC.scala 232:27]
  wire [5:0] SCTable_1_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_1_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_1_io_update_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_1_io_update_hist; // @[SC.scala 232:27]
  wire  SCTable_1_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_1_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_1_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_1_io_update_taken; // @[SC.scala 232:27]
  wire  SCTable_2_clock; // @[SC.scala 232:27]
  wire  SCTable_2_reset; // @[SC.scala 232:27]
  wire  SCTable_2_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_2_io_req_bits_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_2_io_req_bits_hist; // @[SC.scala 232:27]
  wire [5:0] SCTable_2_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_2_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_2_io_update_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_2_io_update_hist; // @[SC.scala 232:27]
  wire  SCTable_2_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_2_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_2_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_2_io_update_taken; // @[SC.scala 232:27]
  wire  SCTable_3_clock; // @[SC.scala 232:27]
  wire  SCTable_3_reset; // @[SC.scala 232:27]
  wire  SCTable_3_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_3_io_req_bits_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_3_io_req_bits_hist; // @[SC.scala 232:27]
  wire [5:0] SCTable_3_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_3_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_3_io_update_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_3_io_update_hist; // @[SC.scala 232:27]
  wire  SCTable_3_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_3_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_3_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_3_io_update_taken; // @[SC.scala 232:27]
  wire  SCTable_4_clock; // @[SC.scala 232:27]
  wire  SCTable_4_reset; // @[SC.scala 232:27]
  wire  SCTable_4_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_4_io_req_bits_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_4_io_req_bits_hist; // @[SC.scala 232:27]
  wire [5:0] SCTable_4_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_4_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_4_io_update_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_4_io_update_hist; // @[SC.scala 232:27]
  wire  SCTable_4_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_4_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_4_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_4_io_update_taken; // @[SC.scala 232:27]
  wire  SCTable_5_clock; // @[SC.scala 232:27]
  wire  SCTable_5_reset; // @[SC.scala 232:27]
  wire  SCTable_5_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_5_io_req_bits_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_5_io_req_bits_hist; // @[SC.scala 232:27]
  wire [5:0] SCTable_5_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_5_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_5_io_update_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_5_io_update_hist; // @[SC.scala 232:27]
  wire  SCTable_5_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_5_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_5_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_5_io_update_taken; // @[SC.scala 232:27]
  wire  SCTable_6_clock; // @[SC.scala 232:27]
  wire  SCTable_6_reset; // @[SC.scala 232:27]
  wire  SCTable_6_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_6_io_req_bits_pc; // @[SC.scala 232:27]
  wire [5:0] SCTable_6_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_6_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_6_io_update_pc; // @[SC.scala 232:27]
  wire  SCTable_6_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_6_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_6_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_6_io_update_taken; // @[SC.scala 232:27]
  wire  SCTable_7_clock; // @[SC.scala 232:27]
  wire  SCTable_7_reset; // @[SC.scala 232:27]
  wire  SCTable_7_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_7_io_req_bits_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_7_io_req_bits_hist; // @[SC.scala 232:27]
  wire [5:0] SCTable_7_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_7_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_7_io_update_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_7_io_update_hist; // @[SC.scala 232:27]
  wire  SCTable_7_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_7_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_7_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_7_io_update_taken; // @[SC.scala 232:27]
  wire  SCTable_8_clock; // @[SC.scala 232:27]
  wire  SCTable_8_reset; // @[SC.scala 232:27]
  wire  SCTable_8_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_8_io_req_bits_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_8_io_req_bits_hist; // @[SC.scala 232:27]
  wire [5:0] SCTable_8_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_8_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_8_io_update_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_8_io_update_hist; // @[SC.scala 232:27]
  wire  SCTable_8_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_8_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_8_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_8_io_update_taken; // @[SC.scala 232:27]
  wire  SCTable_9_clock; // @[SC.scala 232:27]
  wire  SCTable_9_reset; // @[SC.scala 232:27]
  wire  SCTable_9_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_9_io_req_bits_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_9_io_req_bits_hist; // @[SC.scala 232:27]
  wire [5:0] SCTable_9_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_9_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_9_io_update_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_9_io_update_hist; // @[SC.scala 232:27]
  wire  SCTable_9_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_9_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_9_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_9_io_update_taken; // @[SC.scala 232:27]
  wire  SCTable_10_clock; // @[SC.scala 232:27]
  wire  SCTable_10_reset; // @[SC.scala 232:27]
  wire  SCTable_10_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_10_io_req_bits_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_10_io_req_bits_hist; // @[SC.scala 232:27]
  wire [5:0] SCTable_10_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_10_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_10_io_update_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_10_io_update_hist; // @[SC.scala 232:27]
  wire  SCTable_10_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_10_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_10_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_10_io_update_taken; // @[SC.scala 232:27]
  wire  SCTable_11_clock; // @[SC.scala 232:27]
  wire  SCTable_11_reset; // @[SC.scala 232:27]
  wire  SCTable_11_io_req_valid; // @[SC.scala 232:27]
  wire [38:0] SCTable_11_io_req_bits_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_11_io_req_bits_hist; // @[SC.scala 232:27]
  wire [5:0] SCTable_11_io_resp_ctr_0; // @[SC.scala 232:27]
  wire [5:0] SCTable_11_io_resp_ctr_1; // @[SC.scala 232:27]
  wire [38:0] SCTable_11_io_update_pc; // @[SC.scala 232:27]
  wire [63:0] SCTable_11_io_update_hist; // @[SC.scala 232:27]
  wire  SCTable_11_io_update_mask; // @[SC.scala 232:27]
  wire [5:0] SCTable_11_io_update_oldCtr; // @[SC.scala 232:27]
  wire  SCTable_11_io_update_tagePred; // @[SC.scala 232:27]
  wire  SCTable_11_io_update_taken; // @[SC.scala 232:27]
  wire [64:0] _T_7 = {io_in_bits_ghist, 1'h0}; // @[Tage.scala 507:50]
  reg  s2_tageTakens_0; // @[Reg.scala 15:16]
  reg  s2_tageTakens_1; // @[Reg.scala 15:16]
  wire  s1_resps_0_5_valid = bank_tables_0_5_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_0_5_bits_ctr = bank_tables_0_5_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  s1_resps_0_4_valid = bank_tables_0_4_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_0_4_bits_ctr = bank_tables_0_4_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  s1_resps_0_3_valid = bank_tables_0_3_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_0_3_bits_ctr = bank_tables_0_3_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  s1_resps_0_2_valid = bank_tables_0_2_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_0_2_bits_ctr = bank_tables_0_2_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  s1_resps_0_1_valid = bank_tables_0_1_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_0_1_bits_ctr = bank_tables_0_1_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  s1_resps_0_0_valid = bank_tables_0_0_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_0_0_bits_ctr = bank_tables_0_0_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  _T_119 = s1_resps_0_0_valid ? s1_resps_0_0_bits_ctr[2] : bt_io_s1_cnt_0[1]; // @[Tage.scala 616:23]
  wire  _T_132 = s1_resps_0_1_valid ? s1_resps_0_1_bits_ctr[2] : _T_119; // @[Tage.scala 616:23]
  wire  _T_145 = s1_resps_0_2_valid ? s1_resps_0_2_bits_ctr[2] : _T_132; // @[Tage.scala 616:23]
  wire  _T_158 = s1_resps_0_3_valid ? s1_resps_0_3_bits_ctr[2] : _T_145; // @[Tage.scala 616:23]
  wire  _T_171 = s1_resps_0_4_valid ? s1_resps_0_4_bits_ctr[2] : _T_158; // @[Tage.scala 616:23]
  wire  _T_178 = s1_resps_0_5_bits_ctr == 3'h3 | s1_resps_0_5_bits_ctr == 3'h4 ? _T_171 : s1_resps_0_5_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _T_165 = s1_resps_0_4_bits_ctr == 3'h3 | s1_resps_0_4_bits_ctr == 3'h4 ? _T_158 : s1_resps_0_4_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _T_152 = s1_resps_0_3_bits_ctr == 3'h3 | s1_resps_0_3_bits_ctr == 3'h4 ? _T_145 : s1_resps_0_3_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _T_139 = s1_resps_0_2_bits_ctr == 3'h3 | s1_resps_0_2_bits_ctr == 3'h4 ? _T_132 : s1_resps_0_2_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _T_126 = s1_resps_0_1_bits_ctr == 3'h3 | s1_resps_0_1_bits_ctr == 3'h4 ? _T_119 : s1_resps_0_1_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _T_113 = s1_resps_0_0_bits_ctr == 3'h3 | s1_resps_0_0_bits_ctr == 3'h4 ? bt_io_s1_cnt_0[1] :
    s1_resps_0_0_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _GEN_33 = s1_resps_0_0_valid ? _T_113 : bt_io_s1_cnt_0[1]; // @[Tage.scala 609:18 610:22]
  wire  _GEN_35 = s1_resps_0_1_valid ? _T_126 : _GEN_33; // @[Tage.scala 609:18 610:22]
  wire  _GEN_37 = s1_resps_0_2_valid ? _T_139 : _GEN_35; // @[Tage.scala 609:18 610:22]
  wire  _GEN_39 = s1_resps_0_3_valid ? _T_152 : _GEN_37; // @[Tage.scala 609:18 610:22]
  wire  _GEN_41 = s1_resps_0_4_valid ? _T_165 : _GEN_39; // @[Tage.scala 609:18 610:22]
  wire  s1_tageTakens_0 = s1_resps_0_5_valid ? _T_178 : _GEN_41; // @[Tage.scala 609:18 610:22]
  wire  s1_resps_1_5_valid = bank_tables_1_5_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_1_5_bits_ctr = bank_tables_1_5_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  s1_resps_1_4_valid = bank_tables_1_4_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_1_4_bits_ctr = bank_tables_1_4_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  s1_resps_1_3_valid = bank_tables_1_3_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_1_3_bits_ctr = bank_tables_1_3_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  s1_resps_1_2_valid = bank_tables_1_2_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_1_2_bits_ctr = bank_tables_1_2_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  s1_resps_1_1_valid = bank_tables_1_1_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_1_1_bits_ctr = bank_tables_1_1_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  s1_resps_1_0_valid = bank_tables_1_0_io_resp_valid; // @[Tage.scala 521:{59,59}]
  wire [2:0] s1_resps_1_0_bits_ctr = bank_tables_1_0_io_resp_bits_ctr; // @[Tage.scala 521:{59,59}]
  wire  _T_339 = s1_resps_1_0_valid ? s1_resps_1_0_bits_ctr[2] : bt_io_s1_cnt_1[1]; // @[Tage.scala 616:23]
  wire  _T_352 = s1_resps_1_1_valid ? s1_resps_1_1_bits_ctr[2] : _T_339; // @[Tage.scala 616:23]
  wire  _T_365 = s1_resps_1_2_valid ? s1_resps_1_2_bits_ctr[2] : _T_352; // @[Tage.scala 616:23]
  wire  _T_378 = s1_resps_1_3_valid ? s1_resps_1_3_bits_ctr[2] : _T_365; // @[Tage.scala 616:23]
  wire  _T_391 = s1_resps_1_4_valid ? s1_resps_1_4_bits_ctr[2] : _T_378; // @[Tage.scala 616:23]
  wire  _T_398 = s1_resps_1_5_bits_ctr == 3'h3 | s1_resps_1_5_bits_ctr == 3'h4 ? _T_391 : s1_resps_1_5_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _T_385 = s1_resps_1_4_bits_ctr == 3'h3 | s1_resps_1_4_bits_ctr == 3'h4 ? _T_378 : s1_resps_1_4_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _T_372 = s1_resps_1_3_bits_ctr == 3'h3 | s1_resps_1_3_bits_ctr == 3'h4 ? _T_365 : s1_resps_1_3_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _T_359 = s1_resps_1_2_bits_ctr == 3'h3 | s1_resps_1_2_bits_ctr == 3'h4 ? _T_352 : s1_resps_1_2_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _T_346 = s1_resps_1_1_bits_ctr == 3'h3 | s1_resps_1_1_bits_ctr == 3'h4 ? _T_339 : s1_resps_1_1_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _T_333 = s1_resps_1_0_bits_ctr == 3'h3 | s1_resps_1_0_bits_ctr == 3'h4 ? bt_io_s1_cnt_1[1] :
    s1_resps_1_0_bits_ctr[2]; // @[Tage.scala 610:28]
  wire  _GEN_344 = s1_resps_1_0_valid ? _T_333 : bt_io_s1_cnt_1[1]; // @[Tage.scala 609:18 610:22]
  wire  _GEN_346 = s1_resps_1_1_valid ? _T_346 : _GEN_344; // @[Tage.scala 609:18 610:22]
  wire  _GEN_348 = s1_resps_1_2_valid ? _T_359 : _GEN_346; // @[Tage.scala 609:18 610:22]
  wire  _GEN_350 = s1_resps_1_3_valid ? _T_372 : _GEN_348; // @[Tage.scala 609:18 610:22]
  wire  _GEN_352 = s1_resps_1_4_valid ? _T_385 : _GEN_350; // @[Tage.scala 609:18 610:22]
  wire  s1_tageTakens_1 = s1_resps_1_5_valid ? _T_398 : _GEN_352; // @[Tage.scala 609:18 610:22]
  reg  s2_provideds_0; // @[Reg.scala 15:16]
  reg  s2_provideds_1; // @[Reg.scala 15:16]
  wire  _T_129 = s1_resps_0_0_valid | s1_resps_0_1_valid; // @[Tage.scala 614:33]
  wire  _T_142 = s1_resps_0_0_valid | s1_resps_0_1_valid | s1_resps_0_2_valid; // @[Tage.scala 614:33]
  wire  _T_155 = s1_resps_0_0_valid | s1_resps_0_1_valid | s1_resps_0_2_valid | s1_resps_0_3_valid; // @[Tage.scala 614:33]
  wire  _T_168 = s1_resps_0_0_valid | s1_resps_0_1_valid | s1_resps_0_2_valid | s1_resps_0_3_valid | s1_resps_0_4_valid; // @[Tage.scala 614:33]
  wire  s1_provideds_0 = s1_resps_0_0_valid | s1_resps_0_1_valid | s1_resps_0_2_valid | s1_resps_0_3_valid |
    s1_resps_0_4_valid | s1_resps_0_5_valid; // @[Tage.scala 614:33]
  wire  _T_349 = s1_resps_1_0_valid | s1_resps_1_1_valid; // @[Tage.scala 614:33]
  wire  _T_362 = s1_resps_1_0_valid | s1_resps_1_1_valid | s1_resps_1_2_valid; // @[Tage.scala 614:33]
  wire  _T_375 = s1_resps_1_0_valid | s1_resps_1_1_valid | s1_resps_1_2_valid | s1_resps_1_3_valid; // @[Tage.scala 614:33]
  wire  _T_388 = s1_resps_1_0_valid | s1_resps_1_1_valid | s1_resps_1_2_valid | s1_resps_1_3_valid | s1_resps_1_4_valid; // @[Tage.scala 614:33]
  wire  s1_provideds_1 = s1_resps_1_0_valid | s1_resps_1_1_valid | s1_resps_1_2_valid | s1_resps_1_3_valid |
    s1_resps_1_4_valid | s1_resps_1_5_valid; // @[Tage.scala 614:33]
  reg [2:0] s2_providers_1; // @[Reg.scala 15:16]
  reg [2:0] s2_providers_0; // @[Reg.scala 15:16]
  wire [1:0] _T_143 = s1_resps_0_2_valid ? 2'h2 : {{1'd0}, s1_resps_0_1_valid}; // @[Tage.scala 615:24]
  wire [1:0] _T_156 = s1_resps_0_3_valid ? 2'h3 : _T_143; // @[Tage.scala 615:24]
  wire [2:0] _T_169 = s1_resps_0_4_valid ? 3'h4 : {{1'd0}, _T_156}; // @[Tage.scala 615:24]
  wire [2:0] s1_providers_0 = s1_resps_0_5_valid ? 3'h5 : _T_169; // @[Tage.scala 615:24]
  wire [1:0] _T_363 = s1_resps_1_2_valid ? 2'h2 : {{1'd0}, s1_resps_1_1_valid}; // @[Tage.scala 615:24]
  wire [1:0] _T_376 = s1_resps_1_3_valid ? 2'h3 : _T_363; // @[Tage.scala 615:24]
  wire [2:0] _T_389 = s1_resps_1_4_valid ? 3'h4 : {{1'd0}, _T_376}; // @[Tage.scala 615:24]
  wire [2:0] s1_providers_1 = s1_resps_1_5_valid ? 3'h5 : _T_389; // @[Tage.scala 615:24]
  reg  s2_finalAltPreds_0; // @[Reg.scala 15:16]
  reg  s2_finalAltPreds_1; // @[Reg.scala 15:16]
  wire  _GEN_34 = s1_resps_0_0_valid ? bt_io_s1_cnt_0[1] : bt_io_s1_cnt_0[1]; // @[Tage.scala 609:18 611:25]
  wire  _GEN_36 = s1_resps_0_1_valid ? _T_119 : _GEN_34; // @[Tage.scala 609:18 611:25]
  wire  _GEN_38 = s1_resps_0_2_valid ? _T_132 : _GEN_36; // @[Tage.scala 609:18 611:25]
  wire  _GEN_345 = s1_resps_1_0_valid ? bt_io_s1_cnt_1[1] : bt_io_s1_cnt_1[1]; // @[Tage.scala 609:18 611:25]
  wire  _GEN_347 = s1_resps_1_1_valid ? _T_339 : _GEN_345; // @[Tage.scala 609:18 611:25]
  wire  _GEN_349 = s1_resps_1_2_valid ? _T_352 : _GEN_347; // @[Tage.scala 609:18 611:25]
  reg [1:0] s2_providerUs_0; // @[Reg.scala 15:16]
  reg [1:0] s2_providerUs_1; // @[Reg.scala 15:16]
  wire [1:0] s1_resps_0_5_bits_u = bank_tables_0_5_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] s1_resps_0_4_bits_u = bank_tables_0_4_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] s1_resps_0_3_bits_u = bank_tables_0_3_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] s1_resps_0_2_bits_u = bank_tables_0_2_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] s1_resps_0_1_bits_u = bank_tables_0_1_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] s1_resps_0_0_bits_u = bank_tables_0_0_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] _GEN_46 = 3'h1 == s1_providers_0 ? s1_resps_0_1_bits_u : s1_resps_0_0_bits_u; // @[Tage.scala 625:{26,26}]
  wire [1:0] _GEN_47 = 3'h2 == s1_providers_0 ? s1_resps_0_2_bits_u : _GEN_46; // @[Tage.scala 625:{26,26}]
  wire [1:0] s1_resps_1_5_bits_u = bank_tables_1_5_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] s1_resps_1_4_bits_u = bank_tables_1_4_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] s1_resps_1_3_bits_u = bank_tables_1_3_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] s1_resps_1_2_bits_u = bank_tables_1_2_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] s1_resps_1_1_bits_u = bank_tables_1_1_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] s1_resps_1_0_bits_u = bank_tables_1_0_io_resp_bits_u; // @[Tage.scala 521:{59,59}]
  wire [1:0] _GEN_357 = 3'h1 == s1_providers_1 ? s1_resps_1_1_bits_u : s1_resps_1_0_bits_u; // @[Tage.scala 625:{26,26}]
  wire [1:0] _GEN_358 = 3'h2 == s1_providers_1 ? s1_resps_1_2_bits_u : _GEN_357; // @[Tage.scala 625:{26,26}]
  reg [2:0] s2_providerCtrs_0; // @[Reg.scala 15:16]
  reg [2:0] s2_providerCtrs_1; // @[Reg.scala 15:16]
  wire [2:0] _GEN_52 = 3'h1 == s1_providers_0 ? s1_resps_0_1_bits_ctr : s1_resps_0_0_bits_ctr; // @[Tage.scala 626:{26,26}]
  wire [2:0] _GEN_53 = 3'h2 == s1_providers_0 ? s1_resps_0_2_bits_ctr : _GEN_52; // @[Tage.scala 626:{26,26}]
  wire [2:0] _GEN_54 = 3'h3 == s1_providers_0 ? s1_resps_0_3_bits_ctr : _GEN_53; // @[Tage.scala 626:{26,26}]
  wire [2:0] _GEN_55 = 3'h4 == s1_providers_0 ? s1_resps_0_4_bits_ctr : _GEN_54; // @[Tage.scala 626:{26,26}]
  wire [2:0] s1_providerCtrs_0 = 3'h5 == s1_providers_0 ? s1_resps_0_5_bits_ctr : _GEN_55; // @[Tage.scala 626:{26,26}]
  wire [2:0] _GEN_363 = 3'h1 == s1_providers_1 ? s1_resps_1_1_bits_ctr : s1_resps_1_0_bits_ctr; // @[Tage.scala 626:{26,26}]
  wire [2:0] _GEN_364 = 3'h2 == s1_providers_1 ? s1_resps_1_2_bits_ctr : _GEN_363; // @[Tage.scala 626:{26,26}]
  wire [2:0] _GEN_365 = 3'h3 == s1_providers_1 ? s1_resps_1_3_bits_ctr : _GEN_364; // @[Tage.scala 626:{26,26}]
  wire [2:0] _GEN_366 = 3'h4 == s1_providers_1 ? s1_resps_1_4_bits_ctr : _GEN_365; // @[Tage.scala 626:{26,26}]
  wire [2:0] s1_providerCtrs_1 = 3'h5 == s1_providers_1 ? s1_resps_1_5_bits_ctr : _GEN_366; // @[Tage.scala 626:{26,26}]
  reg [2:0] s2_prednums_1; // @[Reg.scala 15:16]
  reg [2:0] s2_prednums_0; // @[Reg.scala 15:16]
  reg [2:0] s2_altprednums_1; // @[Reg.scala 15:16]
  reg [2:0] s2_altprednums_0; // @[Reg.scala 15:16]
  wire  _T_146 = s1_resps_0_2_valid & s1_resps_0_1_valid; // @[Tage.scala 617:26]
  wire [1:0] _T_159 = s1_resps_0_3_valid ? _T_143 : {{1'd0}, _T_146}; // @[Tage.scala 617:26]
  wire [1:0] _T_172 = s1_resps_0_4_valid ? _T_156 : _T_159; // @[Tage.scala 617:26]
  wire [2:0] s1_altprednums_0 = s1_resps_0_5_valid ? _T_169 : {{1'd0}, _T_172}; // @[Tage.scala 617:26]
  wire  _T_366 = s1_resps_1_2_valid & s1_resps_1_1_valid; // @[Tage.scala 617:26]
  wire [1:0] _T_379 = s1_resps_1_3_valid ? _T_363 : {{1'd0}, _T_366}; // @[Tage.scala 617:26]
  wire [1:0] _T_392 = s1_resps_1_4_valid ? _T_376 : _T_379; // @[Tage.scala 617:26]
  wire [2:0] s1_altprednums_1 = s1_resps_1_5_valid ? _T_389 : {{1'd0}, _T_392}; // @[Tage.scala 617:26]
  reg [2:0] s2_predcnts_0; // @[Reg.scala 15:16]
  reg [2:0] s2_predcnts_1; // @[Reg.scala 15:16]
  reg [2:0] s2_altpredcnts_0; // @[Reg.scala 15:16]
  reg [2:0] s2_altpredcnts_1; // @[Reg.scala 15:16]
  wire [2:0] _GEN_64 = 3'h1 == s1_altprednums_0 ? s1_resps_0_1_bits_ctr : s1_resps_0_0_bits_ctr; // @[Tage.scala 631:{26,26}]
  wire [2:0] _GEN_65 = 3'h2 == s1_altprednums_0 ? s1_resps_0_2_bits_ctr : _GEN_64; // @[Tage.scala 631:{26,26}]
  wire [2:0] _GEN_375 = 3'h1 == s1_altprednums_1 ? s1_resps_1_1_bits_ctr : s1_resps_1_0_bits_ctr; // @[Tage.scala 631:{26,26}]
  wire [2:0] _GEN_376 = 3'h2 == s1_altprednums_1 ? s1_resps_1_2_bits_ctr : _GEN_375; // @[Tage.scala 631:{26,26}]
  reg  s2_altpredhits_0; // @[Reg.scala 15:16]
  reg  s2_altpredhits_1; // @[Reg.scala 15:16]
  wire  s1_altpredhits_0 = _T_168 & s1_resps_0_5_valid | (_T_155 & s1_resps_0_4_valid | (_T_142 & s1_resps_0_3_valid | (
    _T_129 & s1_resps_0_2_valid | s1_resps_0_0_valid & s1_resps_0_1_valid))); // @[Tage.scala 613:44]
  wire  s1_altpredhits_1 = _T_388 & s1_resps_1_5_valid | (_T_375 & s1_resps_1_4_valid | (_T_362 & s1_resps_1_3_valid | (
    _T_349 & s1_resps_1_2_valid | s1_resps_1_0_valid & s1_resps_1_1_valid))); // @[Tage.scala 613:44]
  reg [1:0] s2_basecnts_0; // @[Reg.scala 15:16]
  reg [1:0] s2_basecnts_1; // @[Reg.scala 15:16]
  wire [1:0] s1_basecnts_0 = bt_io_s1_cnt_0; // @[Tage.scala 546:30 621:26]
  wire [1:0] s1_basecnts_1 = bt_io_s1_cnt_1; // @[Tage.scala 546:30 621:26]
  reg [5:0] r_6_0; // @[Reg.scala 15:16]
  reg [5:0] r_6_1; // @[Reg.scala 15:16]
  reg [5:0] r_6_2; // @[Reg.scala 15:16]
  reg [5:0] r_6_3; // @[Reg.scala 15:16]
  reg [5:0] r_6_4; // @[Reg.scala 15:16]
  reg [5:0] r_6_5; // @[Reg.scala 15:16]
  reg [5:0] r_10_0; // @[Reg.scala 15:16]
  reg [5:0] r_10_1; // @[Reg.scala 15:16]
  reg [5:0] r_10_2; // @[Reg.scala 15:16]
  reg [5:0] r_10_3; // @[Reg.scala 15:16]
  reg [5:0] r_10_4; // @[Reg.scala 15:16]
  reg [5:0] r_10_5; // @[Reg.scala 15:16]
  reg [63:0] REG; // @[GTimer.scala 23:20]
  wire [93:0] lo_lo_lo = {r_6_4,r_6_3,r_6_2,r_6_1,r_6_0,REG}; // @[Tage.scala 562:41]
  reg  r_4_1; // @[Reg.scala 15:16]
  reg  r_4_0; // @[Reg.scala 15:16]
  wire  resp_meta_0_scMeta_scPred = s2_tageTakens_0 ? r_4_1 : r_4_0; // @[SC.scala 298:{21,21}]
  reg [7:0] r_1; // @[Reg.scala 15:16]
  wire  resp_meta_0_allocate_valid = r_1 != 8'h0; // @[Tage.scala 662:53]
  reg [63:0] REG_1; // @[LFSR64.scala 25:23]
  wire [7:0] _GEN_835 = {{2'd0}, REG_1[5:0]}; // @[Tage.scala 660:56]
  wire [7:0] _T_253 = r_1 & _GEN_835; // @[Tage.scala 660:56]
  wire [2:0] _T_262 = _T_253[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_263 = _T_253[5] ? 3'h5 : _T_262; // @[Mux.scala 47:69]
  wire [2:0] _T_264 = _T_253[4] ? 3'h4 : _T_263; // @[Mux.scala 47:69]
  wire [2:0] _T_265 = _T_253[3] ? 3'h3 : _T_264; // @[Mux.scala 47:69]
  wire [2:0] _T_266 = _T_253[2] ? 3'h2 : _T_265; // @[Mux.scala 47:69]
  wire [2:0] _T_267 = _T_253[1] ? 3'h1 : _T_266; // @[Mux.scala 47:69]
  wire [2:0] _T_268 = _T_253[0] ? 3'h0 : _T_267; // @[Mux.scala 47:69]
  wire [7:0] _T_269 = r_1 >> _T_268; // @[Tage.scala 661:43]
  wire [2:0] _T_246 = r_1[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_247 = r_1[5] ? 3'h5 : _T_246; // @[Mux.scala 47:69]
  wire [2:0] _T_248 = r_1[4] ? 3'h4 : _T_247; // @[Mux.scala 47:69]
  wire [2:0] _T_249 = r_1[3] ? 3'h3 : _T_248; // @[Mux.scala 47:69]
  wire [2:0] _T_250 = r_1[2] ? 3'h2 : _T_249; // @[Mux.scala 47:69]
  wire [2:0] _T_251 = r_1[1] ? 3'h1 : _T_250; // @[Mux.scala 47:69]
  wire [2:0] _T_252 = r_1[0] ? 3'h0 : _T_251; // @[Mux.scala 47:69]
  wire [2:0] resp_meta_0_allocate_bits = _T_269[0] ? _T_268 : _T_252; // @[Tage.scala 661:26]
  wire [107:0] lo_lo = {resp_meta_0_allocate_valid,resp_meta_0_allocate_bits,s2_tageTakens_0,s2_tageTakens_0,
    s2_provideds_0,resp_meta_0_scMeta_scPred,r_6_5,lo_lo_lo}; // @[Tage.scala 562:41]
  wire [13:0] lo_hi_lo = {s2_providerUs_0,s2_providerCtrs_0,s2_basecnts_0,s2_predcnts_0,s2_altpredhits_0,
    s2_altpredcnts_0}; // @[Tage.scala 562:41]
  wire  resp_meta_0_altDiffers = s2_finalAltPreds_0 != s2_tageTakens_0; // @[Tage.scala 639:58]
  wire [134:0] lo = {s2_provideds_0,s2_providers_0,s2_provideds_0,s2_prednums_0,s2_altpredhits_0,s2_altprednums_0,
    resp_meta_0_altDiffers,lo_hi_lo,lo_lo}; // @[Tage.scala 562:41]
  reg [63:0] REG_2; // @[GTimer.scala 23:20]
  wire [93:0] hi_lo_lo = {r_10_4,r_10_3,r_10_2,r_10_1,r_10_0,REG_2}; // @[Tage.scala 562:41]
  reg  r_8_1; // @[Reg.scala 15:16]
  reg  r_8_0; // @[Reg.scala 15:16]
  wire  resp_meta_1_scMeta_scPred = s2_tageTakens_1 ? r_8_1 : r_8_0; // @[SC.scala 298:{21,21}]
  reg [7:0] r_2; // @[Reg.scala 15:16]
  wire  resp_meta_1_allocate_valid = r_2 != 8'h0; // @[Tage.scala 662:53]
  reg [63:0] REG_3; // @[LFSR64.scala 25:23]
  wire [7:0] _GEN_836 = {{2'd0}, REG_3[5:0]}; // @[Tage.scala 660:56]
  wire [7:0] _T_473 = r_2 & _GEN_836; // @[Tage.scala 660:56]
  wire [2:0] _T_482 = _T_473[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_483 = _T_473[5] ? 3'h5 : _T_482; // @[Mux.scala 47:69]
  wire [2:0] _T_484 = _T_473[4] ? 3'h4 : _T_483; // @[Mux.scala 47:69]
  wire [2:0] _T_485 = _T_473[3] ? 3'h3 : _T_484; // @[Mux.scala 47:69]
  wire [2:0] _T_486 = _T_473[2] ? 3'h2 : _T_485; // @[Mux.scala 47:69]
  wire [2:0] _T_487 = _T_473[1] ? 3'h1 : _T_486; // @[Mux.scala 47:69]
  wire [2:0] _T_488 = _T_473[0] ? 3'h0 : _T_487; // @[Mux.scala 47:69]
  wire [7:0] _T_489 = r_2 >> _T_488; // @[Tage.scala 661:43]
  wire [2:0] _T_466 = r_2[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_467 = r_2[5] ? 3'h5 : _T_466; // @[Mux.scala 47:69]
  wire [2:0] _T_468 = r_2[4] ? 3'h4 : _T_467; // @[Mux.scala 47:69]
  wire [2:0] _T_469 = r_2[3] ? 3'h3 : _T_468; // @[Mux.scala 47:69]
  wire [2:0] _T_470 = r_2[2] ? 3'h2 : _T_469; // @[Mux.scala 47:69]
  wire [2:0] _T_471 = r_2[1] ? 3'h1 : _T_470; // @[Mux.scala 47:69]
  wire [2:0] _T_472 = r_2[0] ? 3'h0 : _T_471; // @[Mux.scala 47:69]
  wire [2:0] resp_meta_1_allocate_bits = _T_489[0] ? _T_488 : _T_472; // @[Tage.scala 661:26]
  wire [107:0] hi_lo = {resp_meta_1_allocate_valid,resp_meta_1_allocate_bits,s2_tageTakens_1,s2_tageTakens_1,
    s2_provideds_1,resp_meta_1_scMeta_scPred,r_10_5,hi_lo_lo}; // @[Tage.scala 562:41]
  wire [13:0] hi_hi_lo = {s2_providerUs_1,s2_providerCtrs_1,s2_basecnts_1,s2_predcnts_1,s2_altpredhits_1,
    s2_altpredcnts_1}; // @[Tage.scala 562:41]
  wire  resp_meta_1_altDiffers = s2_finalAltPreds_1 != s2_tageTakens_1; // @[Tage.scala 639:58]
  wire [269:0] _T_25 = {s2_provideds_1,s2_providers_1,s2_provideds_1,s2_prednums_1,s2_altpredhits_1,s2_altprednums_1,
    resp_meta_1_altDiffers,hi_hi_lo,hi_lo,lo}; // @[Tage.scala 562:41]
  reg [269:0] r; // @[Reg.scala 15:16]
  wire  _T_26 = io_update_bits_ftb_entry_tailSlot_valid & io_update_bits_ftb_entry_tailSlot_sharing; // @[FTB.scala 186:46]
  wire  updateValids_0 = io_update_bits_ftb_entry_brSlots_0_valid & io_update_valid & ~
    io_update_bits_ftb_entry_always_taken_0; // @[Tage.scala 572:47]
  wire  _T_30 = io_update_bits_preds_br_taken_mask_0 ? 1'h0 : 1'h1; // @[Mux.scala 47:69]
  wire  _T_40 = ~(_T_30 < 1'h1); // @[Tage.scala 573:7]
  wire  updateValids_1 = _T_26 & io_update_valid & ~io_update_bits_ftb_entry_always_taken_1 & _T_40; // @[Tage.scala 572:84]
  wire [5:0] updateMetas_0_scMeta_ctrs_0 = io_update_bits_meta[69:64]; // @[Tage.scala 577:41]
  wire [5:0] updateMetas_0_scMeta_ctrs_1 = io_update_bits_meta[75:70]; // @[Tage.scala 577:41]
  wire [5:0] updateMetas_0_scMeta_ctrs_2 = io_update_bits_meta[81:76]; // @[Tage.scala 577:41]
  wire [5:0] updateMetas_0_scMeta_ctrs_3 = io_update_bits_meta[87:82]; // @[Tage.scala 577:41]
  wire [5:0] updateMetas_0_scMeta_ctrs_4 = io_update_bits_meta[93:88]; // @[Tage.scala 577:41]
  wire [5:0] updateMetas_0_scMeta_ctrs_5 = io_update_bits_meta[99:94]; // @[Tage.scala 577:41]
  wire  updateMetas_0_scMeta_scPred = io_update_bits_meta[100]; // @[Tage.scala 577:41]
  wire  updateMetas_0_scMeta_scUsed = io_update_bits_meta[101]; // @[Tage.scala 577:41]
  wire  updateMetas_0_scMeta_tageTaken = io_update_bits_meta[102]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_0_allocate_bits = io_update_bits_meta[106:104]; // @[Tage.scala 577:41]
  wire  updateMetas_0_allocate_valid = io_update_bits_meta[107]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_0_altpredcnt = io_update_bits_meta[110:108]; // @[Tage.scala 577:41]
  wire  updateMetas_0_altpredhit = io_update_bits_meta[111]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_0_predcnt = io_update_bits_meta[114:112]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_0_providerCtr = io_update_bits_meta[119:117]; // @[Tage.scala 577:41]
  wire [1:0] updateMetas_0_providerU = io_update_bits_meta[121:120]; // @[Tage.scala 577:41]
  wire  updateMetas_0_altDiffers = io_update_bits_meta[122]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_0_altprednum_bits = io_update_bits_meta[125:123]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_0_prednum_bits = io_update_bits_meta[129:127]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_0_provider_bits = io_update_bits_meta[133:131]; // @[Tage.scala 577:41]
  wire  updateMetas_0_provider_valid = io_update_bits_meta[134]; // @[Tage.scala 577:41]
  wire [5:0] updateMetas_1_scMeta_ctrs_0 = io_update_bits_meta[204:199]; // @[Tage.scala 577:41]
  wire [5:0] updateMetas_1_scMeta_ctrs_1 = io_update_bits_meta[210:205]; // @[Tage.scala 577:41]
  wire [5:0] updateMetas_1_scMeta_ctrs_2 = io_update_bits_meta[216:211]; // @[Tage.scala 577:41]
  wire [5:0] updateMetas_1_scMeta_ctrs_3 = io_update_bits_meta[222:217]; // @[Tage.scala 577:41]
  wire [5:0] updateMetas_1_scMeta_ctrs_4 = io_update_bits_meta[228:223]; // @[Tage.scala 577:41]
  wire [5:0] updateMetas_1_scMeta_ctrs_5 = io_update_bits_meta[234:229]; // @[Tage.scala 577:41]
  wire  updateMetas_1_scMeta_scPred = io_update_bits_meta[235]; // @[Tage.scala 577:41]
  wire  updateMetas_1_scMeta_scUsed = io_update_bits_meta[236]; // @[Tage.scala 577:41]
  wire  updateMetas_1_scMeta_tageTaken = io_update_bits_meta[237]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_1_allocate_bits = io_update_bits_meta[241:239]; // @[Tage.scala 577:41]
  wire  updateMetas_1_allocate_valid = io_update_bits_meta[242]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_1_altpredcnt = io_update_bits_meta[245:243]; // @[Tage.scala 577:41]
  wire  updateMetas_1_altpredhit = io_update_bits_meta[246]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_1_predcnt = io_update_bits_meta[249:247]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_1_providerCtr = io_update_bits_meta[254:252]; // @[Tage.scala 577:41]
  wire [1:0] updateMetas_1_providerU = io_update_bits_meta[256:255]; // @[Tage.scala 577:41]
  wire  updateMetas_1_altDiffers = io_update_bits_meta[257]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_1_altprednum_bits = io_update_bits_meta[260:258]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_1_prednum_bits = io_update_bits_meta[264:262]; // @[Tage.scala 577:41]
  wire [2:0] updateMetas_1_provider_bits = io_update_bits_meta[268:266]; // @[Tage.scala 577:41]
  wire  updateMetas_1_provider_valid = io_update_bits_meta[269]; // @[Tage.scala 577:41]
  wire [63:0] _T_189 = REG + 64'h1; // @[GTimer.scala 24:12]
  wire  _T_192 = ~s1_resps_0_0_valid & s1_resps_0_0_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire  _T_195 = ~s1_resps_0_1_valid & s1_resps_0_1_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire  _T_198 = ~s1_resps_0_2_valid & s1_resps_0_2_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire  _T_201 = ~s1_resps_0_3_valid & s1_resps_0_3_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire  _T_204 = ~s1_resps_0_4_valid & s1_resps_0_4_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire  _T_207 = ~s1_resps_0_5_valid & s1_resps_0_5_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire [5:0] _T_208 = {_T_207,_T_204,_T_201,_T_198,_T_195,_T_192}; // @[Tage.scala 653:69]
  wire [7:0] _T_209 = 8'h1 << s1_providers_0; // @[OneHot.scala 58:35]
  wire [7:0] _T_211 = {{1'd0}, _T_209[7:1]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_212 = {{2'd0}, _T_209[7:2]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_213 = {{3'd0}, _T_209[7:3]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_214 = {{4'd0}, _T_209[7:4]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_215 = {{5'd0}, _T_209[7:5]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_216 = _T_211 | _T_212; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_217 = _T_209 | _T_216; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_218 = _T_214 | _T_215; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_219 = _T_213 | _T_218; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_220 = _T_217 | _T_219; // @[ParallelMux.scala 36:55]
  wire [5:0] _T_222 = s1_provideds_0 ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _GEN_842 = {{2'd0}, _T_222}; // @[Tage.scala 654:66]
  wire [7:0] _T_223 = _T_220 & _GEN_842; // @[Tage.scala 654:66]
  wire [7:0] _T_224 = ~_T_223; // @[Tage.scala 654:11]
  wire [7:0] _GEN_843 = {{2'd0}, _T_208}; // @[Tage.scala 653:76]
  wire [7:0] _T_225 = _GEN_843 & _T_224; // @[Tage.scala 653:76]
  wire  _T_232 = REG_1[0] ^ REG_1[1] ^ REG_1[3] ^ REG_1[4]; // @[LFSR64.scala 26:43]
  wire [63:0] _T_235 = {_T_232,REG_1[63:1]}; // @[Cat.scala 30:58]
  wire  updateTaken_0_0 = updateValids_0 & io_update_bits_preds_br_taken_mask_0; // @[Tage.scala 668:37]
  wire  _T_275 = updateMetas_0_predcnt == 3'h3; // @[Tage.scala 675:69]
  wire  _T_276 = updateMetas_0_predcnt == 3'h4; // @[Tage.scala 675:99]
  wire  _T_277 = updateMetas_0_predcnt == 3'h3 | updateMetas_0_predcnt == 3'h4; // @[Tage.scala 675:77]
  wire  _GEN_71 = 3'h0 == updateMetas_0_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_72 = 3'h1 == updateMetas_0_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_73 = 3'h2 == updateMetas_0_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_74 = 3'h3 == updateMetas_0_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_75 = 3'h4 == updateMetas_0_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_76 = 3'h5 == updateMetas_0_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_101 = io_update_bits_mispred_mask_0 & updateMetas_0_altpredhit & (updateMetas_0_predcnt == 3'h3 |
    updateMetas_0_predcnt == 3'h4) & _GEN_71; // @[Tage.scala 675:108]
  wire  _GEN_102 = io_update_bits_mispred_mask_0 & updateMetas_0_altpredhit & (updateMetas_0_predcnt == 3'h3 |
    updateMetas_0_predcnt == 3'h4) & _GEN_72; // @[Tage.scala 675:108]
  wire  _GEN_103 = io_update_bits_mispred_mask_0 & updateMetas_0_altpredhit & (updateMetas_0_predcnt == 3'h3 |
    updateMetas_0_predcnt == 3'h4) & _GEN_73; // @[Tage.scala 675:108]
  wire  _GEN_104 = io_update_bits_mispred_mask_0 & updateMetas_0_altpredhit & (updateMetas_0_predcnt == 3'h3 |
    updateMetas_0_predcnt == 3'h4) & _GEN_74; // @[Tage.scala 675:108]
  wire  _GEN_105 = io_update_bits_mispred_mask_0 & updateMetas_0_altpredhit & (updateMetas_0_predcnt == 3'h3 |
    updateMetas_0_predcnt == 3'h4) & _GEN_75; // @[Tage.scala 675:108]
  wire  _GEN_106 = io_update_bits_mispred_mask_0 & updateMetas_0_altpredhit & (updateMetas_0_predcnt == 3'h3 |
    updateMetas_0_predcnt == 3'h4) & _GEN_76; // @[Tage.scala 675:108]
  wire  _GEN_844 = 3'h0 == updateMetas_0_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_131 = 3'h0 == updateMetas_0_prednum_bits | _GEN_101; // @[Tage.scala 683:{37,37}]
  wire  _GEN_845 = 3'h1 == updateMetas_0_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_132 = 3'h1 == updateMetas_0_prednum_bits | _GEN_102; // @[Tage.scala 683:{37,37}]
  wire  _GEN_846 = 3'h2 == updateMetas_0_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_133 = 3'h2 == updateMetas_0_prednum_bits | _GEN_103; // @[Tage.scala 683:{37,37}]
  wire  _GEN_847 = 3'h3 == updateMetas_0_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_134 = 3'h3 == updateMetas_0_prednum_bits | _GEN_104; // @[Tage.scala 683:{37,37}]
  wire  _GEN_848 = 3'h4 == updateMetas_0_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_135 = 3'h4 == updateMetas_0_prednum_bits | _GEN_105; // @[Tage.scala 683:{37,37}]
  wire  _GEN_849 = 3'h5 == updateMetas_0_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_136 = 3'h5 == updateMetas_0_prednum_bits | _GEN_106; // @[Tage.scala 683:{37,37}]
  wire [1:0] _T_282 = updateMetas_0_providerU - 2'h1; // @[Tage.scala 688:112]
  wire [1:0] _T_283 = updateMetas_0_providerU == 2'h0 ? 2'h0 : _T_282; // @[Tage.scala 688:55]
  wire [1:0] _T_286 = updateMetas_0_providerU + 2'h1; // @[Tage.scala 689:93]
  wire [1:0] _T_287 = updateMetas_0_providerU == 2'h3 ? 2'h3 : _T_286; // @[Tage.scala 689:36]
  wire [1:0] _T_288 = io_update_bits_mispred_mask_0 ? _T_283 : _T_287; // @[Tage.scala 688:36]
  wire [1:0] _T_289 = ~updateMetas_0_altDiffers ? updateMetas_0_providerU : _T_288; // @[Tage.scala 687:36]
  wire  _GEN_167 = updateMetas_0_provider_valid & _GEN_131; // @[Tage.scala 674:40]
  wire  _GEN_168 = updateMetas_0_provider_valid & _GEN_132; // @[Tage.scala 674:40]
  wire  _GEN_169 = updateMetas_0_provider_valid & _GEN_133; // @[Tage.scala 674:40]
  wire  _GEN_170 = updateMetas_0_provider_valid & _GEN_134; // @[Tage.scala 674:40]
  wire  _GEN_171 = updateMetas_0_provider_valid & _GEN_135; // @[Tage.scala 674:40]
  wire  _GEN_172 = updateMetas_0_provider_valid & _GEN_136; // @[Tage.scala 674:40]
  wire  _GEN_173 = updateMetas_0_provider_valid & _GEN_844; // @[Tage.scala 674:40]
  wire  _GEN_174 = updateMetas_0_provider_valid & _GEN_845; // @[Tage.scala 674:40]
  wire  _GEN_175 = updateMetas_0_provider_valid & _GEN_846; // @[Tage.scala 674:40]
  wire  _GEN_176 = updateMetas_0_provider_valid & _GEN_847; // @[Tage.scala 674:40]
  wire  _GEN_177 = updateMetas_0_provider_valid & _GEN_848; // @[Tage.scala 674:40]
  wire  _GEN_178 = updateMetas_0_provider_valid & _GEN_849; // @[Tage.scala 674:40]
  wire  _GEN_203 = updateValids_0 & _GEN_167; // @[Tage.scala 673:24]
  wire  _GEN_204 = updateValids_0 & _GEN_168; // @[Tage.scala 673:24]
  wire  _GEN_205 = updateValids_0 & _GEN_169; // @[Tage.scala 673:24]
  wire  _GEN_206 = updateValids_0 & _GEN_170; // @[Tage.scala 673:24]
  wire  _GEN_207 = updateValids_0 & _GEN_171; // @[Tage.scala 673:24]
  wire  _GEN_208 = updateValids_0 & _GEN_172; // @[Tage.scala 673:24]
  wire  _GEN_209 = updateValids_0 & _GEN_173; // @[Tage.scala 673:24]
  wire  _GEN_210 = updateValids_0 & _GEN_174; // @[Tage.scala 673:24]
  wire  _GEN_211 = updateValids_0 & _GEN_175; // @[Tage.scala 673:24]
  wire  _GEN_212 = updateValids_0 & _GEN_176; // @[Tage.scala 673:24]
  wire  _GEN_213 = updateValids_0 & _GEN_177; // @[Tage.scala 673:24]
  wire  _GEN_214 = updateValids_0 & _GEN_178; // @[Tage.scala 673:24]
  wire  _T_295 = ~updateMetas_0_altpredhit & io_update_bits_mispred_mask_0 & _T_277; // @[Tage.scala 700:46]
  wire  _GEN_240 = updateMetas_0_provider_valid ? _T_295 : 1'h1; // @[Tage.scala 699:39 708:23]
  wire  baseupdate_0 = updateValids_0 & _GEN_240; // @[Tage.scala 698:24 712:21]
  wire  _GEN_850 = 3'h0 == updateMetas_0_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_242 = 3'h0 == updateMetas_0_allocate_bits | _GEN_203; // @[Tage.scala 722:{39,39}]
  wire  _GEN_851 = 3'h1 == updateMetas_0_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_243 = 3'h1 == updateMetas_0_allocate_bits | _GEN_204; // @[Tage.scala 722:{39,39}]
  wire  _GEN_852 = 3'h2 == updateMetas_0_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_244 = 3'h2 == updateMetas_0_allocate_bits | _GEN_205; // @[Tage.scala 722:{39,39}]
  wire  _GEN_853 = 3'h3 == updateMetas_0_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_245 = 3'h3 == updateMetas_0_allocate_bits | _GEN_206; // @[Tage.scala 722:{39,39}]
  wire  _GEN_854 = 3'h4 == updateMetas_0_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_246 = 3'h4 == updateMetas_0_allocate_bits | _GEN_207; // @[Tage.scala 722:{39,39}]
  wire  _GEN_855 = 3'h5 == updateMetas_0_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_247 = 3'h5 == updateMetas_0_allocate_bits | _GEN_208; // @[Tage.scala 722:{39,39}]
  wire  _GEN_260 = _GEN_850 | _GEN_209; // @[Tage.scala 725:{39,39}]
  wire  _GEN_261 = _GEN_851 | _GEN_210; // @[Tage.scala 725:{39,39}]
  wire  _GEN_262 = _GEN_852 | _GEN_211; // @[Tage.scala 725:{39,39}]
  wire  _GEN_263 = _GEN_853 | _GEN_212; // @[Tage.scala 725:{39,39}]
  wire  _GEN_264 = _GEN_854 | _GEN_213; // @[Tage.scala 725:{39,39}]
  wire  _GEN_265 = _GEN_855 | _GEN_214; // @[Tage.scala 725:{39,39}]
  wire [7:0] _T_306 = 8'h1 << updateMetas_0_provider_bits; // @[OneHot.scala 58:35]
  wire [7:0] _T_308 = {{1'd0}, _T_306[7:1]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_309 = {{2'd0}, _T_306[7:2]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_310 = {{3'd0}, _T_306[7:3]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_311 = {{4'd0}, _T_306[7:4]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_312 = {{5'd0}, _T_306[7:5]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_313 = _T_308 | _T_309; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_314 = _T_306 | _T_313; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_315 = _T_311 | _T_312; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_316 = _T_310 | _T_315; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_317 = _T_314 | _T_316; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_318 = ~_T_317; // @[Tage.scala 730:44]
  wire [7:0] _T_319 = updateMetas_0_provider_valid ? _T_318 : 8'h0; // @[Tage.scala 730:27]
  wire  _GEN_272 = _T_319[0] | _GEN_209; // @[Tage.scala 732:30 733:31]
  wire  _GEN_274 = _T_319[1] | _GEN_210; // @[Tage.scala 732:30 733:31]
  wire  _GEN_276 = _T_319[2] | _GEN_211; // @[Tage.scala 732:30 733:31]
  wire  _GEN_278 = _T_319[3] | _GEN_212; // @[Tage.scala 732:30 733:31]
  wire  _GEN_280 = _T_319[4] | _GEN_213; // @[Tage.scala 732:30 733:31]
  wire  _GEN_282 = _T_319[5] | _GEN_214; // @[Tage.scala 732:30 733:31]
  wire  _GEN_296 = updateMetas_0_allocate_valid & _GEN_850; // @[Tage.scala 721:29]
  wire  _GEN_297 = updateMetas_0_allocate_valid & _GEN_851; // @[Tage.scala 721:29]
  wire  _GEN_298 = updateMetas_0_allocate_valid & _GEN_852; // @[Tage.scala 721:29]
  wire  _GEN_299 = updateMetas_0_allocate_valid & _GEN_853; // @[Tage.scala 721:29]
  wire  _GEN_300 = updateMetas_0_allocate_valid & _GEN_854; // @[Tage.scala 721:29]
  wire  _GEN_301 = updateMetas_0_allocate_valid & _GEN_855; // @[Tage.scala 721:29]
  wire [63:0] _T_409 = REG_2 + 64'h1; // @[GTimer.scala 24:12]
  wire  _T_412 = ~s1_resps_1_0_valid & s1_resps_1_0_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire  _T_415 = ~s1_resps_1_1_valid & s1_resps_1_1_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire  _T_418 = ~s1_resps_1_2_valid & s1_resps_1_2_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire  _T_421 = ~s1_resps_1_3_valid & s1_resps_1_3_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire  _T_424 = ~s1_resps_1_4_valid & s1_resps_1_4_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire  _T_427 = ~s1_resps_1_5_valid & s1_resps_1_5_bits_u == 2'h0; // @[Tage.scala 653:47]
  wire [5:0] _T_428 = {_T_427,_T_424,_T_421,_T_418,_T_415,_T_412}; // @[Tage.scala 653:69]
  wire [7:0] _T_429 = 8'h1 << s1_providers_1; // @[OneHot.scala 58:35]
  wire [7:0] _T_431 = {{1'd0}, _T_429[7:1]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_432 = {{2'd0}, _T_429[7:2]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_433 = {{3'd0}, _T_429[7:3]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_434 = {{4'd0}, _T_429[7:4]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_435 = {{5'd0}, _T_429[7:5]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_436 = _T_431 | _T_432; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_437 = _T_429 | _T_436; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_438 = _T_434 | _T_435; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_439 = _T_433 | _T_438; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_440 = _T_437 | _T_439; // @[ParallelMux.scala 36:55]
  wire [5:0] _T_442 = s1_provideds_1 ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [7:0] _GEN_872 = {{2'd0}, _T_442}; // @[Tage.scala 654:66]
  wire [7:0] _T_443 = _T_440 & _GEN_872; // @[Tage.scala 654:66]
  wire [7:0] _T_444 = ~_T_443; // @[Tage.scala 654:11]
  wire [7:0] _GEN_873 = {{2'd0}, _T_428}; // @[Tage.scala 653:76]
  wire [7:0] _T_445 = _GEN_873 & _T_444; // @[Tage.scala 653:76]
  wire  _T_452 = REG_3[0] ^ REG_3[1] ^ REG_3[3] ^ REG_3[4]; // @[LFSR64.scala 26:43]
  wire [63:0] _T_455 = {_T_452,REG_3[63:1]}; // @[Cat.scala 30:58]
  wire  updateTaken_1_0 = updateValids_1 & io_update_bits_preds_br_taken_mask_1; // @[Tage.scala 668:37]
  wire  _T_495 = updateMetas_1_predcnt == 3'h3; // @[Tage.scala 675:69]
  wire  _T_496 = updateMetas_1_predcnt == 3'h4; // @[Tage.scala 675:99]
  wire  _T_497 = updateMetas_1_predcnt == 3'h3 | updateMetas_1_predcnt == 3'h4; // @[Tage.scala 675:77]
  wire  _GEN_382 = 3'h0 == updateMetas_1_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_383 = 3'h1 == updateMetas_1_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_384 = 3'h2 == updateMetas_1_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_385 = 3'h3 == updateMetas_1_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_386 = 3'h4 == updateMetas_1_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_387 = 3'h5 == updateMetas_1_altprednum_bits; // @[Tage.scala 676:{40,40}]
  wire  _GEN_412 = io_update_bits_mispred_mask_1 & updateMetas_1_altpredhit & (updateMetas_1_predcnt == 3'h3 |
    updateMetas_1_predcnt == 3'h4) & _GEN_382; // @[Tage.scala 675:108]
  wire  _GEN_413 = io_update_bits_mispred_mask_1 & updateMetas_1_altpredhit & (updateMetas_1_predcnt == 3'h3 |
    updateMetas_1_predcnt == 3'h4) & _GEN_383; // @[Tage.scala 675:108]
  wire  _GEN_414 = io_update_bits_mispred_mask_1 & updateMetas_1_altpredhit & (updateMetas_1_predcnt == 3'h3 |
    updateMetas_1_predcnt == 3'h4) & _GEN_384; // @[Tage.scala 675:108]
  wire  _GEN_415 = io_update_bits_mispred_mask_1 & updateMetas_1_altpredhit & (updateMetas_1_predcnt == 3'h3 |
    updateMetas_1_predcnt == 3'h4) & _GEN_385; // @[Tage.scala 675:108]
  wire  _GEN_416 = io_update_bits_mispred_mask_1 & updateMetas_1_altpredhit & (updateMetas_1_predcnt == 3'h3 |
    updateMetas_1_predcnt == 3'h4) & _GEN_386; // @[Tage.scala 675:108]
  wire  _GEN_417 = io_update_bits_mispred_mask_1 & updateMetas_1_altpredhit & (updateMetas_1_predcnt == 3'h3 |
    updateMetas_1_predcnt == 3'h4) & _GEN_387; // @[Tage.scala 675:108]
  wire  _GEN_874 = 3'h0 == updateMetas_1_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_442 = 3'h0 == updateMetas_1_prednum_bits | _GEN_412; // @[Tage.scala 683:{37,37}]
  wire  _GEN_875 = 3'h1 == updateMetas_1_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_443 = 3'h1 == updateMetas_1_prednum_bits | _GEN_413; // @[Tage.scala 683:{37,37}]
  wire  _GEN_876 = 3'h2 == updateMetas_1_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_444 = 3'h2 == updateMetas_1_prednum_bits | _GEN_414; // @[Tage.scala 683:{37,37}]
  wire  _GEN_877 = 3'h3 == updateMetas_1_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_445 = 3'h3 == updateMetas_1_prednum_bits | _GEN_415; // @[Tage.scala 683:{37,37}]
  wire  _GEN_878 = 3'h4 == updateMetas_1_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_446 = 3'h4 == updateMetas_1_prednum_bits | _GEN_416; // @[Tage.scala 683:{37,37}]
  wire  _GEN_879 = 3'h5 == updateMetas_1_prednum_bits; // @[Tage.scala 683:{37,37}]
  wire  _GEN_447 = 3'h5 == updateMetas_1_prednum_bits | _GEN_417; // @[Tage.scala 683:{37,37}]
  wire [1:0] _T_502 = updateMetas_1_providerU - 2'h1; // @[Tage.scala 688:112]
  wire [1:0] _T_503 = updateMetas_1_providerU == 2'h0 ? 2'h0 : _T_502; // @[Tage.scala 688:55]
  wire [1:0] _T_506 = updateMetas_1_providerU + 2'h1; // @[Tage.scala 689:93]
  wire [1:0] _T_507 = updateMetas_1_providerU == 2'h3 ? 2'h3 : _T_506; // @[Tage.scala 689:36]
  wire [1:0] _T_508 = io_update_bits_mispred_mask_1 ? _T_503 : _T_507; // @[Tage.scala 688:36]
  wire [1:0] _T_509 = ~updateMetas_1_altDiffers ? updateMetas_1_providerU : _T_508; // @[Tage.scala 687:36]
  wire  _GEN_478 = updateMetas_1_provider_valid & _GEN_442; // @[Tage.scala 674:40]
  wire  _GEN_479 = updateMetas_1_provider_valid & _GEN_443; // @[Tage.scala 674:40]
  wire  _GEN_480 = updateMetas_1_provider_valid & _GEN_444; // @[Tage.scala 674:40]
  wire  _GEN_481 = updateMetas_1_provider_valid & _GEN_445; // @[Tage.scala 674:40]
  wire  _GEN_482 = updateMetas_1_provider_valid & _GEN_446; // @[Tage.scala 674:40]
  wire  _GEN_483 = updateMetas_1_provider_valid & _GEN_447; // @[Tage.scala 674:40]
  wire  _GEN_484 = updateMetas_1_provider_valid & _GEN_874; // @[Tage.scala 674:40]
  wire  _GEN_485 = updateMetas_1_provider_valid & _GEN_875; // @[Tage.scala 674:40]
  wire  _GEN_486 = updateMetas_1_provider_valid & _GEN_876; // @[Tage.scala 674:40]
  wire  _GEN_487 = updateMetas_1_provider_valid & _GEN_877; // @[Tage.scala 674:40]
  wire  _GEN_488 = updateMetas_1_provider_valid & _GEN_878; // @[Tage.scala 674:40]
  wire  _GEN_489 = updateMetas_1_provider_valid & _GEN_879; // @[Tage.scala 674:40]
  wire  _GEN_514 = updateValids_1 & _GEN_478; // @[Tage.scala 673:24]
  wire  _GEN_515 = updateValids_1 & _GEN_479; // @[Tage.scala 673:24]
  wire  _GEN_516 = updateValids_1 & _GEN_480; // @[Tage.scala 673:24]
  wire  _GEN_517 = updateValids_1 & _GEN_481; // @[Tage.scala 673:24]
  wire  _GEN_518 = updateValids_1 & _GEN_482; // @[Tage.scala 673:24]
  wire  _GEN_519 = updateValids_1 & _GEN_483; // @[Tage.scala 673:24]
  wire  _GEN_520 = updateValids_1 & _GEN_484; // @[Tage.scala 673:24]
  wire  _GEN_521 = updateValids_1 & _GEN_485; // @[Tage.scala 673:24]
  wire  _GEN_522 = updateValids_1 & _GEN_486; // @[Tage.scala 673:24]
  wire  _GEN_523 = updateValids_1 & _GEN_487; // @[Tage.scala 673:24]
  wire  _GEN_524 = updateValids_1 & _GEN_488; // @[Tage.scala 673:24]
  wire  _GEN_525 = updateValids_1 & _GEN_489; // @[Tage.scala 673:24]
  wire  _T_515 = ~updateMetas_1_altpredhit & io_update_bits_mispred_mask_1 & _T_497; // @[Tage.scala 700:46]
  wire  _GEN_551 = updateMetas_1_provider_valid ? _T_515 : 1'h1; // @[Tage.scala 699:39 708:23]
  wire  baseupdate_1 = updateValids_1 & _GEN_551; // @[Tage.scala 698:24 712:21]
  wire  _GEN_880 = 3'h0 == updateMetas_1_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_553 = 3'h0 == updateMetas_1_allocate_bits | _GEN_514; // @[Tage.scala 722:{39,39}]
  wire  _GEN_881 = 3'h1 == updateMetas_1_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_554 = 3'h1 == updateMetas_1_allocate_bits | _GEN_515; // @[Tage.scala 722:{39,39}]
  wire  _GEN_882 = 3'h2 == updateMetas_1_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_555 = 3'h2 == updateMetas_1_allocate_bits | _GEN_516; // @[Tage.scala 722:{39,39}]
  wire  _GEN_883 = 3'h3 == updateMetas_1_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_556 = 3'h3 == updateMetas_1_allocate_bits | _GEN_517; // @[Tage.scala 722:{39,39}]
  wire  _GEN_884 = 3'h4 == updateMetas_1_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_557 = 3'h4 == updateMetas_1_allocate_bits | _GEN_518; // @[Tage.scala 722:{39,39}]
  wire  _GEN_885 = 3'h5 == updateMetas_1_allocate_bits; // @[Tage.scala 722:{39,39}]
  wire  _GEN_558 = 3'h5 == updateMetas_1_allocate_bits | _GEN_519; // @[Tage.scala 722:{39,39}]
  wire  _GEN_571 = _GEN_880 | _GEN_520; // @[Tage.scala 725:{39,39}]
  wire  _GEN_572 = _GEN_881 | _GEN_521; // @[Tage.scala 725:{39,39}]
  wire  _GEN_573 = _GEN_882 | _GEN_522; // @[Tage.scala 725:{39,39}]
  wire  _GEN_574 = _GEN_883 | _GEN_523; // @[Tage.scala 725:{39,39}]
  wire  _GEN_575 = _GEN_884 | _GEN_524; // @[Tage.scala 725:{39,39}]
  wire  _GEN_576 = _GEN_885 | _GEN_525; // @[Tage.scala 725:{39,39}]
  wire [7:0] _T_526 = 8'h1 << updateMetas_1_provider_bits; // @[OneHot.scala 58:35]
  wire [7:0] _T_528 = {{1'd0}, _T_526[7:1]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_529 = {{2'd0}, _T_526[7:2]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_530 = {{3'd0}, _T_526[7:3]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_531 = {{4'd0}, _T_526[7:4]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_532 = {{5'd0}, _T_526[7:5]}; // @[BitUtils.scala 85:41]
  wire [7:0] _T_533 = _T_528 | _T_529; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_534 = _T_526 | _T_533; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_535 = _T_531 | _T_532; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_536 = _T_530 | _T_535; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_537 = _T_534 | _T_536; // @[ParallelMux.scala 36:55]
  wire [7:0] _T_538 = ~_T_537; // @[Tage.scala 730:44]
  wire [7:0] _T_539 = updateMetas_1_provider_valid ? _T_538 : 8'h0; // @[Tage.scala 730:27]
  wire  _GEN_583 = _T_539[0] | _GEN_520; // @[Tage.scala 732:30 733:31]
  wire  _GEN_585 = _T_539[1] | _GEN_521; // @[Tage.scala 732:30 733:31]
  wire  _GEN_587 = _T_539[2] | _GEN_522; // @[Tage.scala 732:30 733:31]
  wire  _GEN_589 = _T_539[3] | _GEN_523; // @[Tage.scala 732:30 733:31]
  wire  _GEN_591 = _T_539[4] | _GEN_524; // @[Tage.scala 732:30 733:31]
  wire  _GEN_593 = _T_539[5] | _GEN_525; // @[Tage.scala 732:30 733:31]
  wire  _GEN_607 = updateMetas_1_allocate_valid & _GEN_880; // @[Tage.scala 721:29]
  wire  _GEN_608 = updateMetas_1_allocate_valid & _GEN_881; // @[Tage.scala 721:29]
  wire  _GEN_609 = updateMetas_1_allocate_valid & _GEN_882; // @[Tage.scala 721:29]
  wire  _GEN_610 = updateMetas_1_allocate_valid & _GEN_883; // @[Tage.scala 721:29]
  wire  _GEN_611 = updateMetas_1_allocate_valid & _GEN_884; // @[Tage.scala 721:29]
  wire  _GEN_612 = updateMetas_1_allocate_valid & _GEN_885; // @[Tage.scala 721:29]
  reg  REG_4; // @[Tage.scala 748:50]
  reg  REG_5; // @[Tage.scala 749:51]
  reg  REG_6; // @[Tage.scala 750:51]
  reg [2:0] REG_7; // @[Tage.scala 751:52]
  reg  REG_8; // @[Tage.scala 753:51]
  reg [1:0] REG_9; // @[Tage.scala 754:47]
  reg [38:0] REG_10; // @[Tage.scala 755:48]
  reg [63:0] REG_11; // @[Tage.scala 757:50]
  reg  REG_13; // @[Tage.scala 748:50]
  reg  REG_14; // @[Tage.scala 749:51]
  reg  REG_15; // @[Tage.scala 750:51]
  reg [2:0] REG_16; // @[Tage.scala 751:52]
  reg  REG_17; // @[Tage.scala 753:51]
  reg [1:0] REG_18; // @[Tage.scala 754:47]
  reg [38:0] REG_19; // @[Tage.scala 755:48]
  reg [63:0] REG_20; // @[Tage.scala 757:50]
  reg  REG_22; // @[Tage.scala 748:50]
  reg  REG_23; // @[Tage.scala 749:51]
  reg  REG_24; // @[Tage.scala 750:51]
  reg [2:0] REG_25; // @[Tage.scala 751:52]
  reg  REG_26; // @[Tage.scala 753:51]
  reg [1:0] REG_27; // @[Tage.scala 754:47]
  reg [38:0] REG_28; // @[Tage.scala 755:48]
  reg [63:0] REG_29; // @[Tage.scala 757:50]
  reg  REG_31; // @[Tage.scala 748:50]
  reg  REG_32; // @[Tage.scala 749:51]
  reg  REG_33; // @[Tage.scala 750:51]
  reg [2:0] REG_34; // @[Tage.scala 751:52]
  reg  REG_35; // @[Tage.scala 753:51]
  reg [1:0] REG_36; // @[Tage.scala 754:47]
  reg [38:0] REG_37; // @[Tage.scala 755:48]
  reg [63:0] REG_38; // @[Tage.scala 757:50]
  reg  REG_40; // @[Tage.scala 748:50]
  reg  REG_41; // @[Tage.scala 749:51]
  reg  REG_42; // @[Tage.scala 750:51]
  reg [2:0] REG_43; // @[Tage.scala 751:52]
  reg  REG_44; // @[Tage.scala 753:51]
  reg [1:0] REG_45; // @[Tage.scala 754:47]
  reg [38:0] REG_46; // @[Tage.scala 755:48]
  reg [63:0] REG_47; // @[Tage.scala 757:50]
  reg  REG_49; // @[Tage.scala 748:50]
  reg  REG_50; // @[Tage.scala 749:51]
  reg  REG_51; // @[Tage.scala 750:51]
  reg [2:0] REG_52; // @[Tage.scala 751:52]
  reg  REG_53; // @[Tage.scala 753:51]
  reg [1:0] REG_54; // @[Tage.scala 754:47]
  reg [38:0] REG_55; // @[Tage.scala 755:48]
  reg [63:0] REG_56; // @[Tage.scala 757:50]
  reg  REG_58; // @[Tage.scala 748:50]
  reg  REG_59; // @[Tage.scala 749:51]
  reg  REG_60; // @[Tage.scala 750:51]
  reg [2:0] REG_61; // @[Tage.scala 751:52]
  reg  REG_62; // @[Tage.scala 753:51]
  reg [1:0] REG_63; // @[Tage.scala 754:47]
  reg [38:0] REG_64; // @[Tage.scala 755:48]
  reg [64:0] REG_65; // @[Tage.scala 757:50]
  reg  REG_67; // @[Tage.scala 748:50]
  reg  REG_68; // @[Tage.scala 749:51]
  reg  REG_69; // @[Tage.scala 750:51]
  reg [2:0] REG_70; // @[Tage.scala 751:52]
  reg  REG_71; // @[Tage.scala 753:51]
  reg [1:0] REG_72; // @[Tage.scala 754:47]
  reg [38:0] REG_73; // @[Tage.scala 755:48]
  reg [64:0] REG_74; // @[Tage.scala 757:50]
  reg  REG_76; // @[Tage.scala 748:50]
  reg  REG_77; // @[Tage.scala 749:51]
  reg  REG_78; // @[Tage.scala 750:51]
  reg [2:0] REG_79; // @[Tage.scala 751:52]
  reg  REG_80; // @[Tage.scala 753:51]
  reg [1:0] REG_81; // @[Tage.scala 754:47]
  reg [38:0] REG_82; // @[Tage.scala 755:48]
  reg [64:0] REG_83; // @[Tage.scala 757:50]
  reg  REG_85; // @[Tage.scala 748:50]
  reg  REG_86; // @[Tage.scala 749:51]
  reg  REG_87; // @[Tage.scala 750:51]
  reg [2:0] REG_88; // @[Tage.scala 751:52]
  reg  REG_89; // @[Tage.scala 753:51]
  reg [1:0] REG_90; // @[Tage.scala 754:47]
  reg [38:0] REG_91; // @[Tage.scala 755:48]
  reg [64:0] REG_92; // @[Tage.scala 757:50]
  reg  REG_94; // @[Tage.scala 748:50]
  reg  REG_95; // @[Tage.scala 749:51]
  reg  REG_96; // @[Tage.scala 750:51]
  reg [2:0] REG_97; // @[Tage.scala 751:52]
  reg  REG_98; // @[Tage.scala 753:51]
  reg [1:0] REG_99; // @[Tage.scala 754:47]
  reg [38:0] REG_100; // @[Tage.scala 755:48]
  reg [64:0] REG_101; // @[Tage.scala 757:50]
  reg  REG_103; // @[Tage.scala 748:50]
  reg  REG_104; // @[Tage.scala 749:51]
  reg  REG_105; // @[Tage.scala 750:51]
  reg [2:0] REG_106; // @[Tage.scala 751:52]
  reg  REG_107; // @[Tage.scala 753:51]
  reg [1:0] REG_108; // @[Tage.scala 754:47]
  reg [38:0] REG_109; // @[Tage.scala 755:48]
  reg [64:0] REG_110; // @[Tage.scala 757:50]
  reg [38:0] REG_112_bits_pc; // @[Tage.scala 761:27]
  reg  REG_112_bits_preds_br_taken_mask_0; // @[Tage.scala 761:27]
  reg  REG_112_bits_preds_br_taken_mask_1; // @[Tage.scala 761:27]
  reg  REG_112_bits_ftb_entry_brSlots_0_valid; // @[Tage.scala 761:27]
  reg  REG_112_bits_ftb_entry_tailSlot_sharing; // @[Tage.scala 761:27]
  reg  REG_112_bits_ftb_entry_tailSlot_valid; // @[Tage.scala 761:27]
  reg  REG_113; // @[Tage.scala 762:32]
  reg [1:0] REG_114_0; // @[Tage.scala 763:30]
  reg [1:0] REG_114_1; // @[Tage.scala 763:30]
  reg [4:0] REG_115_ctr; // @[SC.scala 245:52]
  reg [7:0] REG_115_thres; // @[SC.scala 245:52]
  reg [4:0] REG_116_ctr; // @[SC.scala 245:52]
  reg [7:0] REG_116_thres; // @[SC.scala 245:52]
  wire [10:0] _T_778 = {REG_115_thres, 3'h0}; // @[SC.scala 247:63]
  wire [11:0] _T_779 = _T_778 + 11'h15; // @[SC.scala 247:69]
  wire [10:0] _T_780 = {REG_116_thres, 3'h0}; // @[SC.scala 247:63]
  wire [11:0] _T_781 = _T_780 + 11'h15; // @[SC.scala 247:69]
  wire [5:0] hetVecWire_0_0_ctr_0 = SCTable_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_782 = {$signed(hetVecWire_0_0_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_785 = $signed(_T_782) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_0_1_ctr_0 = SCTable_1_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_786 = {$signed(hetVecWire_0_1_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_789 = $signed(_T_786) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_0_2_ctr_0 = SCTable_2_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_790 = {$signed(hetVecWire_0_2_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_793 = $signed(_T_790) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_0_3_ctr_0 = SCTable_3_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_794 = {$signed(hetVecWire_0_3_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_797 = $signed(_T_794) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_0_4_ctr_0 = SCTable_4_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_798 = {$signed(hetVecWire_0_4_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_801 = $signed(_T_798) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_0_5_ctr_0 = SCTable_5_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_802 = {$signed(hetVecWire_0_5_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_805 = $signed(_T_802) + 7'sh1; // @[SC.scala 269:58]
  wire [7:0] _T_806 = $signed(_T_789) + $signed(_T_793); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_897 = {{1{_T_785[6]}},_T_785}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_807 = $signed(_GEN_897) + $signed(_T_806); // @[ParallelMux.scala 101:82]
  wire [7:0] _T_808 = $signed(_T_801) + $signed(_T_805); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_898 = {{1{_T_797[6]}},_T_797}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_809 = $signed(_GEN_898) + $signed(_T_808); // @[ParallelMux.scala 101:82]
  wire [9:0] _T_810 = $signed(_T_807) + $signed(_T_809); // @[ParallelMux.scala 101:82]
  wire [5:0] hetVecWire_0_0_ctr_1 = SCTable_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_811 = {$signed(hetVecWire_0_0_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_814 = $signed(_T_811) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_0_1_ctr_1 = SCTable_1_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_815 = {$signed(hetVecWire_0_1_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_818 = $signed(_T_815) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_0_2_ctr_1 = SCTable_2_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_819 = {$signed(hetVecWire_0_2_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_822 = $signed(_T_819) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_0_3_ctr_1 = SCTable_3_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_823 = {$signed(hetVecWire_0_3_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_826 = $signed(_T_823) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_0_4_ctr_1 = SCTable_4_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_827 = {$signed(hetVecWire_0_4_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_830 = $signed(_T_827) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_0_5_ctr_1 = SCTable_5_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_831 = {$signed(hetVecWire_0_5_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_834 = $signed(_T_831) + 7'sh1; // @[SC.scala 269:58]
  wire [7:0] _T_835 = $signed(_T_818) + $signed(_T_822); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_899 = {{1{_T_814[6]}},_T_814}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_836 = $signed(_GEN_899) + $signed(_T_835); // @[ParallelMux.scala 101:82]
  wire [7:0] _T_837 = $signed(_T_830) + $signed(_T_834); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_900 = {{1{_T_826[6]}},_T_826}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_838 = $signed(_GEN_900) + $signed(_T_837); // @[ParallelMux.scala 101:82]
  wire [9:0] _T_839 = $signed(_T_836) + $signed(_T_838); // @[ParallelMux.scala 101:82]
  wire [3:0] _T_840 = {1'b0,$signed(s1_providerCtrs_0)}; // @[SC.scala 271:52]
  wire [4:0] _T_841 = $signed(_T_840) - 4'sh4; // @[SC.scala 271:57]
  wire [5:0] _T_842 = {$signed(_T_841), 1'h0}; // @[SC.scala 271:65]
  wire [5:0] _T_845 = $signed(_T_842) + 6'sh1; // @[SC.scala 271:78]
  wire [8:0] _T_846 = {$signed(_T_845), 3'h0}; // @[SC.scala 271:85]
  wire [9:0] _GEN_901 = {{1{_T_846[8]}},_T_846}; // @[SC.scala 285:56]
  wire [10:0] _T_847 = $signed(_T_810) + $signed(_GEN_901); // @[SC.scala 285:56]
  wire [10:0] _T_848 = $signed(_T_839) + $signed(_GEN_901); // @[SC.scala 285:56]
  wire [10:0] _T_852 = 11'sh0 - $signed(_T_847); // @[SC.scala 286:50]
  wire [10:0] _T_854 = $signed(_T_847) < 11'sh0 ? $signed(_T_852) : $signed(_T_847); // @[SC.scala 286:54]
  wire [10:0] _T_858 = 11'sh0 - $signed(_T_848); // @[SC.scala 286:50]
  wire [10:0] _T_860 = $signed(_T_848) < 11'sh0 ? $signed(_T_858) : $signed(_T_848); // @[SC.scala 286:54]
  wire [10:0] _GEN_903 = {{3'd0}, REG_115_thres}; // @[SC.scala 287:60]
  wire  _T_861 = _T_854 <= _GEN_903; // @[SC.scala 287:60]
  wire  _T_862 = _T_860 <= _GEN_903; // @[SC.scala 287:60]
  wire  _T_863 = $signed(_T_847) >= 11'sh0; // @[SC.scala 288:52]
  wire  _T_864 = $signed(_T_848) >= 11'sh0; // @[SC.scala 288:52]
  reg  r_3_0; // @[Reg.scala 15:16]
  reg  r_3_1; // @[Reg.scala 15:16]
  wire  _GEN_718 = s2_tageTakens_0 ? r_3_1 : r_3_0; // @[SC.scala 303:{22,22}]
  wire  _T_865 = ~_GEN_718; // @[SC.scala 304:23]
  wire  _GEN_721 = _T_865 ? resp_meta_0_scMeta_scPred : s2_tageTakens_0; // @[SC.scala 308:53 314:49 Tage.scala 742:36]
  wire [6:0] _T_881 = {$signed(updateMetas_0_scMeta_ctrs_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_884 = $signed(_T_881) + 7'sh1; // @[SC.scala 269:58]
  wire [6:0] _T_885 = {$signed(updateMetas_0_scMeta_ctrs_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_888 = $signed(_T_885) + 7'sh1; // @[SC.scala 269:58]
  wire [6:0] _T_889 = {$signed(updateMetas_0_scMeta_ctrs_2), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_892 = $signed(_T_889) + 7'sh1; // @[SC.scala 269:58]
  wire [6:0] _T_893 = {$signed(updateMetas_0_scMeta_ctrs_3), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_896 = $signed(_T_893) + 7'sh1; // @[SC.scala 269:58]
  wire [6:0] _T_897 = {$signed(updateMetas_0_scMeta_ctrs_4), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_900 = $signed(_T_897) + 7'sh1; // @[SC.scala 269:58]
  wire [6:0] _T_901 = {$signed(updateMetas_0_scMeta_ctrs_5), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_904 = $signed(_T_901) + 7'sh1; // @[SC.scala 269:58]
  wire [7:0] _T_905 = $signed(_T_888) + $signed(_T_892); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_905 = {{1{_T_884[6]}},_T_884}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_906 = $signed(_GEN_905) + $signed(_T_905); // @[ParallelMux.scala 101:82]
  wire [7:0] _T_907 = $signed(_T_900) + $signed(_T_904); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_906 = {{1{_T_896[6]}},_T_896}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_908 = $signed(_GEN_906) + $signed(_T_907); // @[ParallelMux.scala 101:82]
  wire [9:0] _T_909 = $signed(_T_906) + $signed(_T_908); // @[ParallelMux.scala 101:82]
  wire [3:0] _T_910 = {1'b0,$signed(updateMetas_0_providerCtr)}; // @[SC.scala 271:52]
  wire [4:0] _T_911 = $signed(_T_910) - 4'sh4; // @[SC.scala 271:57]
  wire [5:0] _T_912 = {$signed(_T_911), 1'h0}; // @[SC.scala 271:65]
  wire [5:0] _T_915 = $signed(_T_912) + 6'sh1; // @[SC.scala 271:78]
  wire [8:0] _T_916 = {$signed(_T_915), 3'h0}; // @[SC.scala 271:85]
  wire [9:0] _GEN_907 = {{1{_T_916[8]}},_T_916}; // @[SC.scala 327:74]
  wire [10:0] _T_917 = $signed(_T_909) + $signed(_GEN_907); // @[SC.scala 327:74]
  wire [10:0] _T_921 = 11'sh0 - $signed(_T_917); // @[SC.scala 328:26]
  wire [10:0] _T_923 = $signed(_T_917) < 11'sh0 ? $signed(_T_921) : $signed(_T_917); // @[SC.scala 328:30]
  wire  _T_927 = updateMetas_0_scMeta_scPred != updateMetas_0_scMeta_tageTaken; // @[SC.scala 337:38]
  wire  _T_928 = updateMetas_0_scMeta_scPred == io_update_bits_preds_br_taken_mask_0; // @[SC.scala 338:40]
  wire  _T_932 = updateMetas_0_scMeta_scPred != io_update_bits_preds_br_taken_mask_0; // @[SC.scala 339:40]
  wire [7:0] _T_938 = REG_115_thres - 8'h4; // @[SC.scala 342:54]
  wire [10:0] _GEN_910 = {{3'd0}, _T_938}; // @[SC.scala 342:45]
  wire [7:0] _T_942 = REG_115_thres - 8'h2; // @[SC.scala 342:79]
  wire [10:0] _GEN_911 = {{3'd0}, _T_942}; // @[SC.scala 342:70]
  wire  _T_946 = REG_115_ctr == 5'h1f; // @[BPU.scala 88:27]
  wire  _T_947 = REG_115_ctr == 5'h0; // @[BPU.scala 89:30]
  wire [4:0] _T_952 = REG_115_ctr + 5'h1; // @[BPU.scala 92:24]
  wire [4:0] _T_954 = REG_115_ctr - 5'h1; // @[BPU.scala 92:35]
  wire [4:0] _T_955 = _T_932 ? _T_952 : _T_954; // @[BPU.scala 92:12]
  wire [4:0] _T_956 = _T_947 & ~_T_932 ? 5'h0 : _T_955; // @[BPU.scala 91:10]
  wire [4:0] _T_957 = _T_946 & _T_932 ? 5'h1f : _T_956; // @[BPU.scala 90:8]
  wire [5:0] _T_960 = 6'h20 - 6'h1; // @[SC.scala 195:64]
  wire [5:0] _GEN_912 = {{1'd0}, _T_957}; // @[SC.scala 195:42]
  wire  _T_961 = _GEN_912 == _T_960; // @[SC.scala 195:42]
  wire [7:0] _T_965 = REG_115_thres + 8'h2; // @[SC.scala 205:81]
  wire  _T_966 = _T_957 == 5'h0; // @[SC.scala 196:42]
  wire [7:0] _T_971 = _T_966 & REG_115_thres >= 8'h6 ? _T_942 : REG_115_thres; // @[SC.scala 206:26]
  wire [11:0] _GEN_914 = {{1'd0}, _T_923}; // @[SC.scala 349:42]
  wire  _T_986 = _T_932 | _GEN_914 < _T_779; // @[SC.scala 349:32]
  wire  _GEN_736 = (_T_932 | _GEN_914 < _T_779) & _T_932; // @[SC.scala 349:57 360:32]
  wire  _GEN_737 = (_T_932 | _GEN_914 < _T_779) & _T_928; // @[SC.scala 349:57 361:31]
  wire  update_on_mispred_0 = updateValids_0 & updateMetas_0_scMeta_scUsed & _GEN_736; // @[SC.scala 321:60]
  wire  update_on_unconf_0 = updateValids_0 & updateMetas_0_scMeta_scUsed & _GEN_737; // @[SC.scala 321:60]
  wire [5:0] hetVecWire_1_0_ctr_0 = SCTable_6_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1002 = {$signed(hetVecWire_1_0_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1005 = $signed(_T_1002) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_1_1_ctr_0 = SCTable_7_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1006 = {$signed(hetVecWire_1_1_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1009 = $signed(_T_1006) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_1_2_ctr_0 = SCTable_8_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1010 = {$signed(hetVecWire_1_2_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1013 = $signed(_T_1010) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_1_3_ctr_0 = SCTable_9_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1014 = {$signed(hetVecWire_1_3_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1017 = $signed(_T_1014) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_1_4_ctr_0 = SCTable_10_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1018 = {$signed(hetVecWire_1_4_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1021 = $signed(_T_1018) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_1_5_ctr_0 = SCTable_11_io_resp_ctr_0; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1022 = {$signed(hetVecWire_1_5_ctr_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1025 = $signed(_T_1022) + 7'sh1; // @[SC.scala 269:58]
  wire [7:0] _T_1026 = $signed(_T_1009) + $signed(_T_1013); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_915 = {{1{_T_1005[6]}},_T_1005}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_1027 = $signed(_GEN_915) + $signed(_T_1026); // @[ParallelMux.scala 101:82]
  wire [7:0] _T_1028 = $signed(_T_1021) + $signed(_T_1025); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_916 = {{1{_T_1017[6]}},_T_1017}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_1029 = $signed(_GEN_916) + $signed(_T_1028); // @[ParallelMux.scala 101:82]
  wire [9:0] _T_1030 = $signed(_T_1027) + $signed(_T_1029); // @[ParallelMux.scala 101:82]
  wire [5:0] hetVecWire_1_0_ctr_1 = SCTable_6_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1031 = {$signed(hetVecWire_1_0_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1034 = $signed(_T_1031) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_1_1_ctr_1 = SCTable_7_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1035 = {$signed(hetVecWire_1_1_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1038 = $signed(_T_1035) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_1_2_ctr_1 = SCTable_8_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1039 = {$signed(hetVecWire_1_2_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1042 = $signed(_T_1039) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_1_3_ctr_1 = SCTable_9_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1043 = {$signed(hetVecWire_1_3_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1046 = $signed(_T_1043) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_1_4_ctr_1 = SCTable_10_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1047 = {$signed(hetVecWire_1_4_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1050 = $signed(_T_1047) + 7'sh1; // @[SC.scala 269:58]
  wire [5:0] hetVecWire_1_5_ctr_1 = SCTable_11_io_resp_ctr_1; // @[SC.scala 249:{65,65}]
  wire [6:0] _T_1051 = {$signed(hetVecWire_1_5_ctr_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1054 = $signed(_T_1051) + 7'sh1; // @[SC.scala 269:58]
  wire [7:0] _T_1055 = $signed(_T_1038) + $signed(_T_1042); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_917 = {{1{_T_1034[6]}},_T_1034}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_1056 = $signed(_GEN_917) + $signed(_T_1055); // @[ParallelMux.scala 101:82]
  wire [7:0] _T_1057 = $signed(_T_1050) + $signed(_T_1054); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_918 = {{1{_T_1046[6]}},_T_1046}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_1058 = $signed(_GEN_918) + $signed(_T_1057); // @[ParallelMux.scala 101:82]
  wire [9:0] _T_1059 = $signed(_T_1056) + $signed(_T_1058); // @[ParallelMux.scala 101:82]
  wire [3:0] _T_1060 = {1'b0,$signed(s1_providerCtrs_1)}; // @[SC.scala 271:52]
  wire [4:0] _T_1061 = $signed(_T_1060) - 4'sh4; // @[SC.scala 271:57]
  wire [5:0] _T_1062 = {$signed(_T_1061), 1'h0}; // @[SC.scala 271:65]
  wire [5:0] _T_1065 = $signed(_T_1062) + 6'sh1; // @[SC.scala 271:78]
  wire [8:0] _T_1066 = {$signed(_T_1065), 3'h0}; // @[SC.scala 271:85]
  wire [9:0] _GEN_919 = {{1{_T_1066[8]}},_T_1066}; // @[SC.scala 285:56]
  wire [10:0] _T_1067 = $signed(_T_1030) + $signed(_GEN_919); // @[SC.scala 285:56]
  wire [10:0] _T_1068 = $signed(_T_1059) + $signed(_GEN_919); // @[SC.scala 285:56]
  wire [10:0] _T_1072 = 11'sh0 - $signed(_T_1067); // @[SC.scala 286:50]
  wire [10:0] _T_1074 = $signed(_T_1067) < 11'sh0 ? $signed(_T_1072) : $signed(_T_1067); // @[SC.scala 286:54]
  wire [10:0] _T_1078 = 11'sh0 - $signed(_T_1068); // @[SC.scala 286:50]
  wire [10:0] _T_1080 = $signed(_T_1068) < 11'sh0 ? $signed(_T_1078) : $signed(_T_1068); // @[SC.scala 286:54]
  wire [10:0] _GEN_921 = {{3'd0}, REG_116_thres}; // @[SC.scala 287:60]
  wire  _T_1081 = _T_1074 <= _GEN_921; // @[SC.scala 287:60]
  wire  _T_1082 = _T_1080 <= _GEN_921; // @[SC.scala 287:60]
  wire  _T_1083 = $signed(_T_1067) >= 11'sh0; // @[SC.scala 288:52]
  wire  _T_1084 = $signed(_T_1068) >= 11'sh0; // @[SC.scala 288:52]
  reg  r_7_0; // @[Reg.scala 15:16]
  reg  r_7_1; // @[Reg.scala 15:16]
  wire  _GEN_790 = s2_tageTakens_1 ? r_7_1 : r_7_0; // @[SC.scala 303:{22,22}]
  wire  _T_1085 = ~_GEN_790; // @[SC.scala 304:23]
  wire  _GEN_793 = _T_1085 ? resp_meta_1_scMeta_scPred : s2_tageTakens_1; // @[SC.scala 308:53 314:49 Tage.scala 742:36]
  wire [6:0] _T_1101 = {$signed(updateMetas_1_scMeta_ctrs_0), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1104 = $signed(_T_1101) + 7'sh1; // @[SC.scala 269:58]
  wire [6:0] _T_1105 = {$signed(updateMetas_1_scMeta_ctrs_1), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1108 = $signed(_T_1105) + 7'sh1; // @[SC.scala 269:58]
  wire [6:0] _T_1109 = {$signed(updateMetas_1_scMeta_ctrs_2), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1112 = $signed(_T_1109) + 7'sh1; // @[SC.scala 269:58]
  wire [6:0] _T_1113 = {$signed(updateMetas_1_scMeta_ctrs_3), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1116 = $signed(_T_1113) + 7'sh1; // @[SC.scala 269:58]
  wire [6:0] _T_1117 = {$signed(updateMetas_1_scMeta_ctrs_4), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1120 = $signed(_T_1117) + 7'sh1; // @[SC.scala 269:58]
  wire [6:0] _T_1121 = {$signed(updateMetas_1_scMeta_ctrs_5), 1'h0}; // @[SC.scala 269:45]
  wire [6:0] _T_1124 = $signed(_T_1121) + 7'sh1; // @[SC.scala 269:58]
  wire [7:0] _T_1125 = $signed(_T_1108) + $signed(_T_1112); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_923 = {{1{_T_1104[6]}},_T_1104}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_1126 = $signed(_GEN_923) + $signed(_T_1125); // @[ParallelMux.scala 101:82]
  wire [7:0] _T_1127 = $signed(_T_1120) + $signed(_T_1124); // @[ParallelMux.scala 101:82]
  wire [7:0] _GEN_924 = {{1{_T_1116[6]}},_T_1116}; // @[ParallelMux.scala 101:82]
  wire [8:0] _T_1128 = $signed(_GEN_924) + $signed(_T_1127); // @[ParallelMux.scala 101:82]
  wire [9:0] _T_1129 = $signed(_T_1126) + $signed(_T_1128); // @[ParallelMux.scala 101:82]
  wire [3:0] _T_1130 = {1'b0,$signed(updateMetas_1_providerCtr)}; // @[SC.scala 271:52]
  wire [4:0] _T_1131 = $signed(_T_1130) - 4'sh4; // @[SC.scala 271:57]
  wire [5:0] _T_1132 = {$signed(_T_1131), 1'h0}; // @[SC.scala 271:65]
  wire [5:0] _T_1135 = $signed(_T_1132) + 6'sh1; // @[SC.scala 271:78]
  wire [8:0] _T_1136 = {$signed(_T_1135), 3'h0}; // @[SC.scala 271:85]
  wire [9:0] _GEN_925 = {{1{_T_1136[8]}},_T_1136}; // @[SC.scala 327:74]
  wire [10:0] _T_1137 = $signed(_T_1129) + $signed(_GEN_925); // @[SC.scala 327:74]
  wire [10:0] _T_1141 = 11'sh0 - $signed(_T_1137); // @[SC.scala 328:26]
  wire [10:0] _T_1143 = $signed(_T_1137) < 11'sh0 ? $signed(_T_1141) : $signed(_T_1137); // @[SC.scala 328:30]
  wire  _T_1147 = updateMetas_1_scMeta_scPred != updateMetas_1_scMeta_tageTaken; // @[SC.scala 337:38]
  wire  _T_1148 = updateMetas_1_scMeta_scPred == io_update_bits_preds_br_taken_mask_1; // @[SC.scala 338:40]
  wire  _T_1152 = updateMetas_1_scMeta_scPred != io_update_bits_preds_br_taken_mask_1; // @[SC.scala 339:40]
  wire [7:0] _T_1158 = REG_116_thres - 8'h4; // @[SC.scala 342:54]
  wire [10:0] _GEN_928 = {{3'd0}, _T_1158}; // @[SC.scala 342:45]
  wire [7:0] _T_1162 = REG_116_thres - 8'h2; // @[SC.scala 342:79]
  wire [10:0] _GEN_929 = {{3'd0}, _T_1162}; // @[SC.scala 342:70]
  wire  _T_1166 = REG_116_ctr == 5'h1f; // @[BPU.scala 88:27]
  wire  _T_1167 = REG_116_ctr == 5'h0; // @[BPU.scala 89:30]
  wire [4:0] _T_1172 = REG_116_ctr + 5'h1; // @[BPU.scala 92:24]
  wire [4:0] _T_1174 = REG_116_ctr - 5'h1; // @[BPU.scala 92:35]
  wire [4:0] _T_1175 = _T_1152 ? _T_1172 : _T_1174; // @[BPU.scala 92:12]
  wire [4:0] _T_1176 = _T_1167 & ~_T_1152 ? 5'h0 : _T_1175; // @[BPU.scala 91:10]
  wire [4:0] _T_1177 = _T_1166 & _T_1152 ? 5'h1f : _T_1176; // @[BPU.scala 90:8]
  wire [5:0] _GEN_930 = {{1'd0}, _T_1177}; // @[SC.scala 195:42]
  wire  _T_1181 = _GEN_930 == _T_960; // @[SC.scala 195:42]
  wire [7:0] _T_1185 = REG_116_thres + 8'h2; // @[SC.scala 205:81]
  wire  _T_1186 = _T_1177 == 5'h0; // @[SC.scala 196:42]
  wire [7:0] _T_1191 = _T_1186 & REG_116_thres >= 8'h6 ? _T_1162 : REG_116_thres; // @[SC.scala 206:26]
  wire [11:0] _GEN_932 = {{1'd0}, _T_1143}; // @[SC.scala 349:42]
  wire  _T_1206 = _T_1152 | _GEN_932 < _T_781; // @[SC.scala 349:32]
  wire  _GEN_808 = (_T_1152 | _GEN_932 < _T_781) & _T_1152; // @[SC.scala 349:57 360:32]
  wire  _GEN_809 = (_T_1152 | _GEN_932 < _T_781) & _T_1148; // @[SC.scala 349:57 361:31]
  wire  update_on_mispred_1 = updateValids_1 & updateMetas_1_scMeta_scUsed & _GEN_808; // @[SC.scala 321:60]
  wire  update_on_unconf_1 = updateValids_1 & updateMetas_1_scMeta_scUsed & _GEN_809; // @[SC.scala 321:60]
  reg  REG_117; // @[SC.scala 369:54]
  reg  REG_118; // @[SC.scala 370:58]
  reg  REG_119; // @[SC.scala 371:58]
  reg [5:0] REG_120; // @[SC.scala 372:58]
  reg [38:0] REG_121; // @[SC.scala 373:52]
  reg  REG_123; // @[SC.scala 369:54]
  reg  REG_124; // @[SC.scala 370:58]
  reg  REG_125; // @[SC.scala 371:58]
  reg [5:0] REG_126; // @[SC.scala 372:58]
  reg [38:0] REG_127; // @[SC.scala 373:52]
  reg [63:0] REG_128; // @[SC.scala 374:54]
  reg  REG_129; // @[SC.scala 369:54]
  reg  REG_130; // @[SC.scala 370:58]
  reg  REG_131; // @[SC.scala 371:58]
  reg [5:0] REG_132; // @[SC.scala 372:58]
  reg [38:0] REG_133; // @[SC.scala 373:52]
  reg [63:0] REG_134; // @[SC.scala 374:54]
  reg  REG_135; // @[SC.scala 369:54]
  reg  REG_136; // @[SC.scala 370:58]
  reg  REG_137; // @[SC.scala 371:58]
  reg [5:0] REG_138; // @[SC.scala 372:58]
  reg [38:0] REG_139; // @[SC.scala 373:52]
  reg [63:0] REG_140; // @[SC.scala 374:54]
  reg  REG_141; // @[SC.scala 369:54]
  reg  REG_142; // @[SC.scala 370:58]
  reg  REG_143; // @[SC.scala 371:58]
  reg [5:0] REG_144; // @[SC.scala 372:58]
  reg [38:0] REG_145; // @[SC.scala 373:52]
  reg [63:0] REG_146; // @[SC.scala 374:54]
  reg  REG_147; // @[SC.scala 369:54]
  reg  REG_148; // @[SC.scala 370:58]
  reg  REG_149; // @[SC.scala 371:58]
  reg [5:0] REG_150; // @[SC.scala 372:58]
  reg [38:0] REG_151; // @[SC.scala 373:52]
  reg [63:0] REG_152; // @[SC.scala 374:54]
  reg  REG_153; // @[SC.scala 369:54]
  reg  REG_154; // @[SC.scala 370:58]
  reg  REG_155; // @[SC.scala 371:58]
  reg [5:0] REG_156; // @[SC.scala 372:58]
  reg [38:0] REG_157; // @[SC.scala 373:52]
  reg  REG_159; // @[SC.scala 369:54]
  reg  REG_160; // @[SC.scala 370:58]
  reg  REG_161; // @[SC.scala 371:58]
  reg [5:0] REG_162; // @[SC.scala 372:58]
  reg [38:0] REG_163; // @[SC.scala 373:52]
  reg [64:0] REG_164; // @[SC.scala 374:54]
  reg  REG_165; // @[SC.scala 369:54]
  reg  REG_166; // @[SC.scala 370:58]
  reg  REG_167; // @[SC.scala 371:58]
  reg [5:0] REG_168; // @[SC.scala 372:58]
  reg [38:0] REG_169; // @[SC.scala 373:52]
  reg [64:0] REG_170; // @[SC.scala 374:54]
  reg  REG_171; // @[SC.scala 369:54]
  reg  REG_172; // @[SC.scala 370:58]
  reg  REG_173; // @[SC.scala 371:58]
  reg [5:0] REG_174; // @[SC.scala 372:58]
  reg [38:0] REG_175; // @[SC.scala 373:52]
  reg [64:0] REG_176; // @[SC.scala 374:54]
  reg  REG_177; // @[SC.scala 369:54]
  reg  REG_178; // @[SC.scala 370:58]
  reg  REG_179; // @[SC.scala 371:58]
  reg [5:0] REG_180; // @[SC.scala 372:58]
  reg [38:0] REG_181; // @[SC.scala 373:52]
  reg [64:0] REG_182; // @[SC.scala 374:54]
  reg  REG_183; // @[SC.scala 369:54]
  reg  REG_184; // @[SC.scala 370:58]
  reg  REG_185; // @[SC.scala 371:58]
  reg [5:0] REG_186; // @[SC.scala 372:58]
  reg [38:0] REG_187; // @[SC.scala 373:52]
  reg [64:0] REG_188; // @[SC.scala 374:54]
  reg  REG_189; // @[SC.scala 399:34]
  reg [1:0] REG_190; // @[SC.scala 399:34]
  reg [1:0] REG_191; // @[SC.scala 399:34]
  TageTable bank_tables_0_0 ( // @[Tage.scala 504:25]
    .clock(bank_tables_0_0_clock),
    .reset(bank_tables_0_0_reset),
    .io_req_valid(bank_tables_0_0_io_req_valid),
    .io_req_bits_pc(bank_tables_0_0_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_0_0_io_req_bits_hist),
    .io_resp_valid(bank_tables_0_0_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_0_0_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_0_0_io_resp_bits_u),
    .io_update_pc(bank_tables_0_0_io_update_pc),
    .io_update_hist(bank_tables_0_0_io_update_hist),
    .io_update_mask(bank_tables_0_0_io_update_mask),
    .io_update_taken(bank_tables_0_0_io_update_taken),
    .io_update_alloc(bank_tables_0_0_io_update_alloc),
    .io_update_oldCtr(bank_tables_0_0_io_update_oldCtr),
    .io_update_uMask(bank_tables_0_0_io_update_uMask),
    .io_update_u(bank_tables_0_0_io_update_u)
  );
  TageTable_1 bank_tables_0_1 ( // @[Tage.scala 504:25]
    .clock(bank_tables_0_1_clock),
    .reset(bank_tables_0_1_reset),
    .io_req_valid(bank_tables_0_1_io_req_valid),
    .io_req_bits_pc(bank_tables_0_1_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_0_1_io_req_bits_hist),
    .io_resp_valid(bank_tables_0_1_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_0_1_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_0_1_io_resp_bits_u),
    .io_update_pc(bank_tables_0_1_io_update_pc),
    .io_update_hist(bank_tables_0_1_io_update_hist),
    .io_update_mask(bank_tables_0_1_io_update_mask),
    .io_update_taken(bank_tables_0_1_io_update_taken),
    .io_update_alloc(bank_tables_0_1_io_update_alloc),
    .io_update_oldCtr(bank_tables_0_1_io_update_oldCtr),
    .io_update_uMask(bank_tables_0_1_io_update_uMask),
    .io_update_u(bank_tables_0_1_io_update_u)
  );
  TageTable_2 bank_tables_0_2 ( // @[Tage.scala 504:25]
    .clock(bank_tables_0_2_clock),
    .reset(bank_tables_0_2_reset),
    .io_req_valid(bank_tables_0_2_io_req_valid),
    .io_req_bits_pc(bank_tables_0_2_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_0_2_io_req_bits_hist),
    .io_resp_valid(bank_tables_0_2_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_0_2_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_0_2_io_resp_bits_u),
    .io_update_pc(bank_tables_0_2_io_update_pc),
    .io_update_hist(bank_tables_0_2_io_update_hist),
    .io_update_mask(bank_tables_0_2_io_update_mask),
    .io_update_taken(bank_tables_0_2_io_update_taken),
    .io_update_alloc(bank_tables_0_2_io_update_alloc),
    .io_update_oldCtr(bank_tables_0_2_io_update_oldCtr),
    .io_update_uMask(bank_tables_0_2_io_update_uMask),
    .io_update_u(bank_tables_0_2_io_update_u)
  );
  TageTable_3 bank_tables_0_3 ( // @[Tage.scala 504:25]
    .clock(bank_tables_0_3_clock),
    .reset(bank_tables_0_3_reset),
    .io_req_valid(bank_tables_0_3_io_req_valid),
    .io_req_bits_pc(bank_tables_0_3_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_0_3_io_req_bits_hist),
    .io_resp_valid(bank_tables_0_3_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_0_3_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_0_3_io_resp_bits_u),
    .io_update_pc(bank_tables_0_3_io_update_pc),
    .io_update_hist(bank_tables_0_3_io_update_hist),
    .io_update_mask(bank_tables_0_3_io_update_mask),
    .io_update_taken(bank_tables_0_3_io_update_taken),
    .io_update_alloc(bank_tables_0_3_io_update_alloc),
    .io_update_oldCtr(bank_tables_0_3_io_update_oldCtr),
    .io_update_uMask(bank_tables_0_3_io_update_uMask),
    .io_update_u(bank_tables_0_3_io_update_u)
  );
  TageTable_4 bank_tables_0_4 ( // @[Tage.scala 504:25]
    .clock(bank_tables_0_4_clock),
    .reset(bank_tables_0_4_reset),
    .io_req_valid(bank_tables_0_4_io_req_valid),
    .io_req_bits_pc(bank_tables_0_4_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_0_4_io_req_bits_hist),
    .io_resp_valid(bank_tables_0_4_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_0_4_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_0_4_io_resp_bits_u),
    .io_update_pc(bank_tables_0_4_io_update_pc),
    .io_update_hist(bank_tables_0_4_io_update_hist),
    .io_update_mask(bank_tables_0_4_io_update_mask),
    .io_update_taken(bank_tables_0_4_io_update_taken),
    .io_update_alloc(bank_tables_0_4_io_update_alloc),
    .io_update_oldCtr(bank_tables_0_4_io_update_oldCtr),
    .io_update_uMask(bank_tables_0_4_io_update_uMask),
    .io_update_u(bank_tables_0_4_io_update_u)
  );
  TageTable_5 bank_tables_0_5 ( // @[Tage.scala 504:25]
    .clock(bank_tables_0_5_clock),
    .reset(bank_tables_0_5_reset),
    .io_req_valid(bank_tables_0_5_io_req_valid),
    .io_req_bits_pc(bank_tables_0_5_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_0_5_io_req_bits_hist),
    .io_resp_valid(bank_tables_0_5_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_0_5_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_0_5_io_resp_bits_u),
    .io_update_pc(bank_tables_0_5_io_update_pc),
    .io_update_hist(bank_tables_0_5_io_update_hist),
    .io_update_mask(bank_tables_0_5_io_update_mask),
    .io_update_taken(bank_tables_0_5_io_update_taken),
    .io_update_alloc(bank_tables_0_5_io_update_alloc),
    .io_update_oldCtr(bank_tables_0_5_io_update_oldCtr),
    .io_update_uMask(bank_tables_0_5_io_update_uMask),
    .io_update_u(bank_tables_0_5_io_update_u)
  );
  TageTable_6 bank_tables_1_0 ( // @[Tage.scala 504:25]
    .clock(bank_tables_1_0_clock),
    .reset(bank_tables_1_0_reset),
    .io_req_valid(bank_tables_1_0_io_req_valid),
    .io_req_bits_pc(bank_tables_1_0_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_1_0_io_req_bits_hist),
    .io_resp_valid(bank_tables_1_0_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_1_0_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_1_0_io_resp_bits_u),
    .io_update_pc(bank_tables_1_0_io_update_pc),
    .io_update_hist(bank_tables_1_0_io_update_hist),
    .io_update_mask(bank_tables_1_0_io_update_mask),
    .io_update_taken(bank_tables_1_0_io_update_taken),
    .io_update_alloc(bank_tables_1_0_io_update_alloc),
    .io_update_oldCtr(bank_tables_1_0_io_update_oldCtr),
    .io_update_uMask(bank_tables_1_0_io_update_uMask),
    .io_update_u(bank_tables_1_0_io_update_u)
  );
  TageTable_7 bank_tables_1_1 ( // @[Tage.scala 504:25]
    .clock(bank_tables_1_1_clock),
    .reset(bank_tables_1_1_reset),
    .io_req_valid(bank_tables_1_1_io_req_valid),
    .io_req_bits_pc(bank_tables_1_1_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_1_1_io_req_bits_hist),
    .io_resp_valid(bank_tables_1_1_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_1_1_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_1_1_io_resp_bits_u),
    .io_update_pc(bank_tables_1_1_io_update_pc),
    .io_update_hist(bank_tables_1_1_io_update_hist),
    .io_update_mask(bank_tables_1_1_io_update_mask),
    .io_update_taken(bank_tables_1_1_io_update_taken),
    .io_update_alloc(bank_tables_1_1_io_update_alloc),
    .io_update_oldCtr(bank_tables_1_1_io_update_oldCtr),
    .io_update_uMask(bank_tables_1_1_io_update_uMask),
    .io_update_u(bank_tables_1_1_io_update_u)
  );
  TageTable_8 bank_tables_1_2 ( // @[Tage.scala 504:25]
    .clock(bank_tables_1_2_clock),
    .reset(bank_tables_1_2_reset),
    .io_req_valid(bank_tables_1_2_io_req_valid),
    .io_req_bits_pc(bank_tables_1_2_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_1_2_io_req_bits_hist),
    .io_resp_valid(bank_tables_1_2_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_1_2_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_1_2_io_resp_bits_u),
    .io_update_pc(bank_tables_1_2_io_update_pc),
    .io_update_hist(bank_tables_1_2_io_update_hist),
    .io_update_mask(bank_tables_1_2_io_update_mask),
    .io_update_taken(bank_tables_1_2_io_update_taken),
    .io_update_alloc(bank_tables_1_2_io_update_alloc),
    .io_update_oldCtr(bank_tables_1_2_io_update_oldCtr),
    .io_update_uMask(bank_tables_1_2_io_update_uMask),
    .io_update_u(bank_tables_1_2_io_update_u)
  );
  TageTable_9 bank_tables_1_3 ( // @[Tage.scala 504:25]
    .clock(bank_tables_1_3_clock),
    .reset(bank_tables_1_3_reset),
    .io_req_valid(bank_tables_1_3_io_req_valid),
    .io_req_bits_pc(bank_tables_1_3_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_1_3_io_req_bits_hist),
    .io_resp_valid(bank_tables_1_3_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_1_3_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_1_3_io_resp_bits_u),
    .io_update_pc(bank_tables_1_3_io_update_pc),
    .io_update_hist(bank_tables_1_3_io_update_hist),
    .io_update_mask(bank_tables_1_3_io_update_mask),
    .io_update_taken(bank_tables_1_3_io_update_taken),
    .io_update_alloc(bank_tables_1_3_io_update_alloc),
    .io_update_oldCtr(bank_tables_1_3_io_update_oldCtr),
    .io_update_uMask(bank_tables_1_3_io_update_uMask),
    .io_update_u(bank_tables_1_3_io_update_u)
  );
  TageTable_10 bank_tables_1_4 ( // @[Tage.scala 504:25]
    .clock(bank_tables_1_4_clock),
    .reset(bank_tables_1_4_reset),
    .io_req_valid(bank_tables_1_4_io_req_valid),
    .io_req_bits_pc(bank_tables_1_4_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_1_4_io_req_bits_hist),
    .io_resp_valid(bank_tables_1_4_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_1_4_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_1_4_io_resp_bits_u),
    .io_update_pc(bank_tables_1_4_io_update_pc),
    .io_update_hist(bank_tables_1_4_io_update_hist),
    .io_update_mask(bank_tables_1_4_io_update_mask),
    .io_update_taken(bank_tables_1_4_io_update_taken),
    .io_update_alloc(bank_tables_1_4_io_update_alloc),
    .io_update_oldCtr(bank_tables_1_4_io_update_oldCtr),
    .io_update_uMask(bank_tables_1_4_io_update_uMask),
    .io_update_u(bank_tables_1_4_io_update_u)
  );
  TageTable_11 bank_tables_1_5 ( // @[Tage.scala 504:25]
    .clock(bank_tables_1_5_clock),
    .reset(bank_tables_1_5_reset),
    .io_req_valid(bank_tables_1_5_io_req_valid),
    .io_req_bits_pc(bank_tables_1_5_io_req_bits_pc),
    .io_req_bits_hist(bank_tables_1_5_io_req_bits_hist),
    .io_resp_valid(bank_tables_1_5_io_resp_valid),
    .io_resp_bits_ctr(bank_tables_1_5_io_resp_bits_ctr),
    .io_resp_bits_u(bank_tables_1_5_io_resp_bits_u),
    .io_update_pc(bank_tables_1_5_io_update_pc),
    .io_update_hist(bank_tables_1_5_io_update_hist),
    .io_update_mask(bank_tables_1_5_io_update_mask),
    .io_update_taken(bank_tables_1_5_io_update_taken),
    .io_update_alloc(bank_tables_1_5_io_update_alloc),
    .io_update_oldCtr(bank_tables_1_5_io_update_oldCtr),
    .io_update_uMask(bank_tables_1_5_io_update_uMask),
    .io_update_u(bank_tables_1_5_io_update_u)
  );
  TageBTable bt ( // @[Tage.scala 513:19]
    .clock(bt_clock),
    .reset(bt_reset),
    .io_s0_fire(bt_io_s0_fire),
    .io_s0_pc(bt_io_s0_pc),
    .io_s1_cnt_0(bt_io_s1_cnt_0),
    .io_s1_cnt_1(bt_io_s1_cnt_1),
    .io_update_cnt_0(bt_io_update_cnt_0),
    .io_update_cnt_1(bt_io_update_cnt_1),
    .io_update_valid(bt_io_update_valid),
    .io_update_bits_pc(bt_io_update_bits_pc),
    .io_update_bits_preds_br_taken_mask_0(bt_io_update_bits_preds_br_taken_mask_0),
    .io_update_bits_preds_br_taken_mask_1(bt_io_update_bits_preds_br_taken_mask_1),
    .io_update_bits_ftb_entry_brSlots_0_valid(bt_io_update_bits_ftb_entry_brSlots_0_valid),
    .io_update_bits_ftb_entry_tailSlot_sharing(bt_io_update_bits_ftb_entry_tailSlot_sharing),
    .io_update_bits_ftb_entry_tailSlot_valid(bt_io_update_bits_ftb_entry_tailSlot_valid)
  );
  SCTable SCTable ( // @[SC.scala 232:27]
    .clock(SCTable_clock),
    .reset(SCTable_reset),
    .io_req_valid(SCTable_io_req_valid),
    .io_req_bits_pc(SCTable_io_req_bits_pc),
    .io_resp_ctr_0(SCTable_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_io_resp_ctr_1),
    .io_update_pc(SCTable_io_update_pc),
    .io_update_mask(SCTable_io_update_mask),
    .io_update_oldCtr(SCTable_io_update_oldCtr),
    .io_update_tagePred(SCTable_io_update_tagePred),
    .io_update_taken(SCTable_io_update_taken)
  );
  SCTable_1 SCTable_1 ( // @[SC.scala 232:27]
    .clock(SCTable_1_clock),
    .reset(SCTable_1_reset),
    .io_req_valid(SCTable_1_io_req_valid),
    .io_req_bits_pc(SCTable_1_io_req_bits_pc),
    .io_req_bits_hist(SCTable_1_io_req_bits_hist),
    .io_resp_ctr_0(SCTable_1_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_1_io_resp_ctr_1),
    .io_update_pc(SCTable_1_io_update_pc),
    .io_update_hist(SCTable_1_io_update_hist),
    .io_update_mask(SCTable_1_io_update_mask),
    .io_update_oldCtr(SCTable_1_io_update_oldCtr),
    .io_update_tagePred(SCTable_1_io_update_tagePred),
    .io_update_taken(SCTable_1_io_update_taken)
  );
  SCTable_2 SCTable_2 ( // @[SC.scala 232:27]
    .clock(SCTable_2_clock),
    .reset(SCTable_2_reset),
    .io_req_valid(SCTable_2_io_req_valid),
    .io_req_bits_pc(SCTable_2_io_req_bits_pc),
    .io_req_bits_hist(SCTable_2_io_req_bits_hist),
    .io_resp_ctr_0(SCTable_2_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_2_io_resp_ctr_1),
    .io_update_pc(SCTable_2_io_update_pc),
    .io_update_hist(SCTable_2_io_update_hist),
    .io_update_mask(SCTable_2_io_update_mask),
    .io_update_oldCtr(SCTable_2_io_update_oldCtr),
    .io_update_tagePred(SCTable_2_io_update_tagePred),
    .io_update_taken(SCTable_2_io_update_taken)
  );
  SCTable_3 SCTable_3 ( // @[SC.scala 232:27]
    .clock(SCTable_3_clock),
    .reset(SCTable_3_reset),
    .io_req_valid(SCTable_3_io_req_valid),
    .io_req_bits_pc(SCTable_3_io_req_bits_pc),
    .io_req_bits_hist(SCTable_3_io_req_bits_hist),
    .io_resp_ctr_0(SCTable_3_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_3_io_resp_ctr_1),
    .io_update_pc(SCTable_3_io_update_pc),
    .io_update_hist(SCTable_3_io_update_hist),
    .io_update_mask(SCTable_3_io_update_mask),
    .io_update_oldCtr(SCTable_3_io_update_oldCtr),
    .io_update_tagePred(SCTable_3_io_update_tagePred),
    .io_update_taken(SCTable_3_io_update_taken)
  );
  SCTable_4 SCTable_4 ( // @[SC.scala 232:27]
    .clock(SCTable_4_clock),
    .reset(SCTable_4_reset),
    .io_req_valid(SCTable_4_io_req_valid),
    .io_req_bits_pc(SCTable_4_io_req_bits_pc),
    .io_req_bits_hist(SCTable_4_io_req_bits_hist),
    .io_resp_ctr_0(SCTable_4_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_4_io_resp_ctr_1),
    .io_update_pc(SCTable_4_io_update_pc),
    .io_update_hist(SCTable_4_io_update_hist),
    .io_update_mask(SCTable_4_io_update_mask),
    .io_update_oldCtr(SCTable_4_io_update_oldCtr),
    .io_update_tagePred(SCTable_4_io_update_tagePred),
    .io_update_taken(SCTable_4_io_update_taken)
  );
  SCTable_5 SCTable_5 ( // @[SC.scala 232:27]
    .clock(SCTable_5_clock),
    .reset(SCTable_5_reset),
    .io_req_valid(SCTable_5_io_req_valid),
    .io_req_bits_pc(SCTable_5_io_req_bits_pc),
    .io_req_bits_hist(SCTable_5_io_req_bits_hist),
    .io_resp_ctr_0(SCTable_5_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_5_io_resp_ctr_1),
    .io_update_pc(SCTable_5_io_update_pc),
    .io_update_hist(SCTable_5_io_update_hist),
    .io_update_mask(SCTable_5_io_update_mask),
    .io_update_oldCtr(SCTable_5_io_update_oldCtr),
    .io_update_tagePred(SCTable_5_io_update_tagePred),
    .io_update_taken(SCTable_5_io_update_taken)
  );
  SCTable SCTable_6 ( // @[SC.scala 232:27]
    .clock(SCTable_6_clock),
    .reset(SCTable_6_reset),
    .io_req_valid(SCTable_6_io_req_valid),
    .io_req_bits_pc(SCTable_6_io_req_bits_pc),
    .io_resp_ctr_0(SCTable_6_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_6_io_resp_ctr_1),
    .io_update_pc(SCTable_6_io_update_pc),
    .io_update_mask(SCTable_6_io_update_mask),
    .io_update_oldCtr(SCTable_6_io_update_oldCtr),
    .io_update_tagePred(SCTable_6_io_update_tagePred),
    .io_update_taken(SCTable_6_io_update_taken)
  );
  SCTable_1 SCTable_7 ( // @[SC.scala 232:27]
    .clock(SCTable_7_clock),
    .reset(SCTable_7_reset),
    .io_req_valid(SCTable_7_io_req_valid),
    .io_req_bits_pc(SCTable_7_io_req_bits_pc),
    .io_req_bits_hist(SCTable_7_io_req_bits_hist),
    .io_resp_ctr_0(SCTable_7_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_7_io_resp_ctr_1),
    .io_update_pc(SCTable_7_io_update_pc),
    .io_update_hist(SCTable_7_io_update_hist),
    .io_update_mask(SCTable_7_io_update_mask),
    .io_update_oldCtr(SCTable_7_io_update_oldCtr),
    .io_update_tagePred(SCTable_7_io_update_tagePred),
    .io_update_taken(SCTable_7_io_update_taken)
  );
  SCTable_2 SCTable_8 ( // @[SC.scala 232:27]
    .clock(SCTable_8_clock),
    .reset(SCTable_8_reset),
    .io_req_valid(SCTable_8_io_req_valid),
    .io_req_bits_pc(SCTable_8_io_req_bits_pc),
    .io_req_bits_hist(SCTable_8_io_req_bits_hist),
    .io_resp_ctr_0(SCTable_8_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_8_io_resp_ctr_1),
    .io_update_pc(SCTable_8_io_update_pc),
    .io_update_hist(SCTable_8_io_update_hist),
    .io_update_mask(SCTable_8_io_update_mask),
    .io_update_oldCtr(SCTable_8_io_update_oldCtr),
    .io_update_tagePred(SCTable_8_io_update_tagePred),
    .io_update_taken(SCTable_8_io_update_taken)
  );
  SCTable_3 SCTable_9 ( // @[SC.scala 232:27]
    .clock(SCTable_9_clock),
    .reset(SCTable_9_reset),
    .io_req_valid(SCTable_9_io_req_valid),
    .io_req_bits_pc(SCTable_9_io_req_bits_pc),
    .io_req_bits_hist(SCTable_9_io_req_bits_hist),
    .io_resp_ctr_0(SCTable_9_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_9_io_resp_ctr_1),
    .io_update_pc(SCTable_9_io_update_pc),
    .io_update_hist(SCTable_9_io_update_hist),
    .io_update_mask(SCTable_9_io_update_mask),
    .io_update_oldCtr(SCTable_9_io_update_oldCtr),
    .io_update_tagePred(SCTable_9_io_update_tagePred),
    .io_update_taken(SCTable_9_io_update_taken)
  );
  SCTable_4 SCTable_10 ( // @[SC.scala 232:27]
    .clock(SCTable_10_clock),
    .reset(SCTable_10_reset),
    .io_req_valid(SCTable_10_io_req_valid),
    .io_req_bits_pc(SCTable_10_io_req_bits_pc),
    .io_req_bits_hist(SCTable_10_io_req_bits_hist),
    .io_resp_ctr_0(SCTable_10_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_10_io_resp_ctr_1),
    .io_update_pc(SCTable_10_io_update_pc),
    .io_update_hist(SCTable_10_io_update_hist),
    .io_update_mask(SCTable_10_io_update_mask),
    .io_update_oldCtr(SCTable_10_io_update_oldCtr),
    .io_update_tagePred(SCTable_10_io_update_tagePred),
    .io_update_taken(SCTable_10_io_update_taken)
  );
  SCTable_5 SCTable_11 ( // @[SC.scala 232:27]
    .clock(SCTable_11_clock),
    .reset(SCTable_11_reset),
    .io_req_valid(SCTable_11_io_req_valid),
    .io_req_bits_pc(SCTable_11_io_req_bits_pc),
    .io_req_bits_hist(SCTable_11_io_req_bits_hist),
    .io_resp_ctr_0(SCTable_11_io_resp_ctr_0),
    .io_resp_ctr_1(SCTable_11_io_resp_ctr_1),
    .io_update_pc(SCTable_11_io_update_pc),
    .io_update_hist(SCTable_11_io_update_hist),
    .io_update_mask(SCTable_11_io_update_mask),
    .io_update_oldCtr(SCTable_11_io_update_oldCtr),
    .io_update_tagePred(SCTable_11_io_update_tagePred),
    .io_update_taken(SCTable_11_io_update_taken)
  );
  assign io_out_s3_meta = {{754'd0}, r}; // @[Tage.scala 562:18]
  assign io_out_resp_s1_pc = io_in_bits_resp_in_0_s1_pc; // @[Tage.scala 561:15]
  assign io_out_resp_s1_preds_br_taken_mask_0 = io_in_bits_resp_in_0_s1_preds_br_taken_mask_0; // @[Tage.scala 561:15]
  assign io_out_resp_s1_preds_br_taken_mask_1 = io_in_bits_resp_in_0_s1_preds_br_taken_mask_1; // @[Tage.scala 561:15]
  assign io_out_resp_s1_preds_slot_valids_0 = io_in_bits_resp_in_0_s1_preds_slot_valids_0; // @[Tage.scala 561:15]
  assign io_out_resp_s1_preds_slot_valids_1 = io_in_bits_resp_in_0_s1_preds_slot_valids_1; // @[Tage.scala 561:15]
  assign io_out_resp_s1_preds_targets_0 = io_in_bits_resp_in_0_s1_preds_targets_0; // @[Tage.scala 561:15]
  assign io_out_resp_s1_preds_targets_1 = io_in_bits_resp_in_0_s1_preds_targets_1; // @[Tage.scala 561:15]
  assign io_out_resp_s1_preds_is_br_sharing = io_in_bits_resp_in_0_s1_preds_is_br_sharing; // @[Tage.scala 561:15]
  assign io_out_resp_s1_preds_hit = io_in_bits_resp_in_0_s1_preds_hit; // @[Tage.scala 561:15]
  assign io_out_resp_s1_ftb_entry_brSlots_0_offset = io_in_bits_resp_in_0_s1_ftb_entry_brSlots_0_offset; // @[Tage.scala 561:15]
  assign io_out_resp_s1_ftb_entry_tailSlot_offset = io_in_bits_resp_in_0_s1_ftb_entry_tailSlot_offset; // @[Tage.scala 561:15]
  assign io_out_resp_s1_ftb_entry_pftAddr = io_in_bits_resp_in_0_s1_ftb_entry_pftAddr; // @[Tage.scala 561:15]
  assign io_out_resp_s1_ftb_entry_carry = io_in_bits_resp_in_0_s1_ftb_entry_carry; // @[Tage.scala 561:15]
  assign io_out_resp_s1_ftb_entry_oversize = io_in_bits_resp_in_0_s1_ftb_entry_oversize; // @[Tage.scala 561:15]
  assign io_out_resp_s2_preds_br_taken_mask_0 = s2_provideds_0 ? _GEN_721 : s2_tageTakens_0; // @[SC.scala 301:30 Tage.scala 742:36]
  assign io_out_resp_s2_preds_br_taken_mask_1 = s2_provideds_1 ? _GEN_793 : s2_tageTakens_1; // @[SC.scala 301:30 Tage.scala 742:36]
  assign perfinfo_perfEvents_perf_events_0_incr_step = {{5'd0}, REG_189}; // @[SC.scala 399:24]
  assign perfinfo_perfEvents_perf_events_1_incr_step = {{4'd0}, REG_190}; // @[SC.scala 399:24]
  assign perfinfo_perfEvents_perf_events_2_incr_step = {{4'd0}, REG_191}; // @[SC.scala 399:24]
  assign bank_tables_0_0_clock = clock;
  assign bank_tables_0_0_reset = reset;
  assign bank_tables_0_0_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_0_0_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_0_0_io_req_bits_hist = io_in_bits_ghist; // @[Tage.scala 507:50]
  assign bank_tables_0_0_io_update_pc = REG_10; // @[Tage.scala 755:38]
  assign bank_tables_0_0_io_update_hist = REG_11; // @[Tage.scala 757:40]
  assign bank_tables_0_0_io_update_mask = REG_4; // @[Tage.scala 748:40]
  assign bank_tables_0_0_io_update_taken = REG_5; // @[Tage.scala 749:41]
  assign bank_tables_0_0_io_update_alloc = REG_6; // @[Tage.scala 750:41]
  assign bank_tables_0_0_io_update_oldCtr = REG_7; // @[Tage.scala 751:42]
  assign bank_tables_0_0_io_update_uMask = REG_8; // @[Tage.scala 753:41]
  assign bank_tables_0_0_io_update_u = REG_9; // @[Tage.scala 754:37]
  assign bank_tables_0_1_clock = clock;
  assign bank_tables_0_1_reset = reset;
  assign bank_tables_0_1_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_0_1_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_0_1_io_req_bits_hist = io_in_bits_ghist; // @[Tage.scala 507:50]
  assign bank_tables_0_1_io_update_pc = REG_19; // @[Tage.scala 755:38]
  assign bank_tables_0_1_io_update_hist = REG_20; // @[Tage.scala 757:40]
  assign bank_tables_0_1_io_update_mask = REG_13; // @[Tage.scala 748:40]
  assign bank_tables_0_1_io_update_taken = REG_14; // @[Tage.scala 749:41]
  assign bank_tables_0_1_io_update_alloc = REG_15; // @[Tage.scala 750:41]
  assign bank_tables_0_1_io_update_oldCtr = REG_16; // @[Tage.scala 751:42]
  assign bank_tables_0_1_io_update_uMask = REG_17; // @[Tage.scala 753:41]
  assign bank_tables_0_1_io_update_u = REG_18; // @[Tage.scala 754:37]
  assign bank_tables_0_2_clock = clock;
  assign bank_tables_0_2_reset = reset;
  assign bank_tables_0_2_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_0_2_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_0_2_io_req_bits_hist = io_in_bits_ghist; // @[Tage.scala 507:50]
  assign bank_tables_0_2_io_update_pc = REG_28; // @[Tage.scala 755:38]
  assign bank_tables_0_2_io_update_hist = REG_29; // @[Tage.scala 757:40]
  assign bank_tables_0_2_io_update_mask = REG_22; // @[Tage.scala 748:40]
  assign bank_tables_0_2_io_update_taken = REG_23; // @[Tage.scala 749:41]
  assign bank_tables_0_2_io_update_alloc = REG_24; // @[Tage.scala 750:41]
  assign bank_tables_0_2_io_update_oldCtr = REG_25; // @[Tage.scala 751:42]
  assign bank_tables_0_2_io_update_uMask = REG_26; // @[Tage.scala 753:41]
  assign bank_tables_0_2_io_update_u = REG_27; // @[Tage.scala 754:37]
  assign bank_tables_0_3_clock = clock;
  assign bank_tables_0_3_reset = reset;
  assign bank_tables_0_3_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_0_3_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_0_3_io_req_bits_hist = io_in_bits_ghist; // @[Tage.scala 507:50]
  assign bank_tables_0_3_io_update_pc = REG_37; // @[Tage.scala 755:38]
  assign bank_tables_0_3_io_update_hist = REG_38; // @[Tage.scala 757:40]
  assign bank_tables_0_3_io_update_mask = REG_31; // @[Tage.scala 748:40]
  assign bank_tables_0_3_io_update_taken = REG_32; // @[Tage.scala 749:41]
  assign bank_tables_0_3_io_update_alloc = REG_33; // @[Tage.scala 750:41]
  assign bank_tables_0_3_io_update_oldCtr = REG_34; // @[Tage.scala 751:42]
  assign bank_tables_0_3_io_update_uMask = REG_35; // @[Tage.scala 753:41]
  assign bank_tables_0_3_io_update_u = REG_36; // @[Tage.scala 754:37]
  assign bank_tables_0_4_clock = clock;
  assign bank_tables_0_4_reset = reset;
  assign bank_tables_0_4_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_0_4_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_0_4_io_req_bits_hist = io_in_bits_ghist; // @[Tage.scala 507:50]
  assign bank_tables_0_4_io_update_pc = REG_46; // @[Tage.scala 755:38]
  assign bank_tables_0_4_io_update_hist = REG_47; // @[Tage.scala 757:40]
  assign bank_tables_0_4_io_update_mask = REG_40; // @[Tage.scala 748:40]
  assign bank_tables_0_4_io_update_taken = REG_41; // @[Tage.scala 749:41]
  assign bank_tables_0_4_io_update_alloc = REG_42; // @[Tage.scala 750:41]
  assign bank_tables_0_4_io_update_oldCtr = REG_43; // @[Tage.scala 751:42]
  assign bank_tables_0_4_io_update_uMask = REG_44; // @[Tage.scala 753:41]
  assign bank_tables_0_4_io_update_u = REG_45; // @[Tage.scala 754:37]
  assign bank_tables_0_5_clock = clock;
  assign bank_tables_0_5_reset = reset;
  assign bank_tables_0_5_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_0_5_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_0_5_io_req_bits_hist = io_in_bits_ghist; // @[Tage.scala 507:50]
  assign bank_tables_0_5_io_update_pc = REG_55; // @[Tage.scala 755:38]
  assign bank_tables_0_5_io_update_hist = REG_56; // @[Tage.scala 757:40]
  assign bank_tables_0_5_io_update_mask = REG_49; // @[Tage.scala 748:40]
  assign bank_tables_0_5_io_update_taken = REG_50; // @[Tage.scala 749:41]
  assign bank_tables_0_5_io_update_alloc = REG_51; // @[Tage.scala 750:41]
  assign bank_tables_0_5_io_update_oldCtr = REG_52; // @[Tage.scala 751:42]
  assign bank_tables_0_5_io_update_uMask = REG_53; // @[Tage.scala 753:41]
  assign bank_tables_0_5_io_update_u = REG_54; // @[Tage.scala 754:37]
  assign bank_tables_1_0_clock = clock;
  assign bank_tables_1_0_reset = reset;
  assign bank_tables_1_0_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_1_0_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_1_0_io_req_bits_hist = _T_7[63:0]; // @[Tage.scala 507:30]
  assign bank_tables_1_0_io_update_pc = REG_64; // @[Tage.scala 755:38]
  assign bank_tables_1_0_io_update_hist = REG_65[63:0]; // @[Tage.scala 757:40]
  assign bank_tables_1_0_io_update_mask = REG_58; // @[Tage.scala 748:40]
  assign bank_tables_1_0_io_update_taken = REG_59; // @[Tage.scala 749:41]
  assign bank_tables_1_0_io_update_alloc = REG_60; // @[Tage.scala 750:41]
  assign bank_tables_1_0_io_update_oldCtr = REG_61; // @[Tage.scala 751:42]
  assign bank_tables_1_0_io_update_uMask = REG_62; // @[Tage.scala 753:41]
  assign bank_tables_1_0_io_update_u = REG_63; // @[Tage.scala 754:37]
  assign bank_tables_1_1_clock = clock;
  assign bank_tables_1_1_reset = reset;
  assign bank_tables_1_1_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_1_1_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_1_1_io_req_bits_hist = _T_7[63:0]; // @[Tage.scala 507:30]
  assign bank_tables_1_1_io_update_pc = REG_73; // @[Tage.scala 755:38]
  assign bank_tables_1_1_io_update_hist = REG_74[63:0]; // @[Tage.scala 757:40]
  assign bank_tables_1_1_io_update_mask = REG_67; // @[Tage.scala 748:40]
  assign bank_tables_1_1_io_update_taken = REG_68; // @[Tage.scala 749:41]
  assign bank_tables_1_1_io_update_alloc = REG_69; // @[Tage.scala 750:41]
  assign bank_tables_1_1_io_update_oldCtr = REG_70; // @[Tage.scala 751:42]
  assign bank_tables_1_1_io_update_uMask = REG_71; // @[Tage.scala 753:41]
  assign bank_tables_1_1_io_update_u = REG_72; // @[Tage.scala 754:37]
  assign bank_tables_1_2_clock = clock;
  assign bank_tables_1_2_reset = reset;
  assign bank_tables_1_2_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_1_2_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_1_2_io_req_bits_hist = _T_7[63:0]; // @[Tage.scala 507:30]
  assign bank_tables_1_2_io_update_pc = REG_82; // @[Tage.scala 755:38]
  assign bank_tables_1_2_io_update_hist = REG_83[63:0]; // @[Tage.scala 757:40]
  assign bank_tables_1_2_io_update_mask = REG_76; // @[Tage.scala 748:40]
  assign bank_tables_1_2_io_update_taken = REG_77; // @[Tage.scala 749:41]
  assign bank_tables_1_2_io_update_alloc = REG_78; // @[Tage.scala 750:41]
  assign bank_tables_1_2_io_update_oldCtr = REG_79; // @[Tage.scala 751:42]
  assign bank_tables_1_2_io_update_uMask = REG_80; // @[Tage.scala 753:41]
  assign bank_tables_1_2_io_update_u = REG_81; // @[Tage.scala 754:37]
  assign bank_tables_1_3_clock = clock;
  assign bank_tables_1_3_reset = reset;
  assign bank_tables_1_3_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_1_3_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_1_3_io_req_bits_hist = _T_7[63:0]; // @[Tage.scala 507:30]
  assign bank_tables_1_3_io_update_pc = REG_91; // @[Tage.scala 755:38]
  assign bank_tables_1_3_io_update_hist = REG_92[63:0]; // @[Tage.scala 757:40]
  assign bank_tables_1_3_io_update_mask = REG_85; // @[Tage.scala 748:40]
  assign bank_tables_1_3_io_update_taken = REG_86; // @[Tage.scala 749:41]
  assign bank_tables_1_3_io_update_alloc = REG_87; // @[Tage.scala 750:41]
  assign bank_tables_1_3_io_update_oldCtr = REG_88; // @[Tage.scala 751:42]
  assign bank_tables_1_3_io_update_uMask = REG_89; // @[Tage.scala 753:41]
  assign bank_tables_1_3_io_update_u = REG_90; // @[Tage.scala 754:37]
  assign bank_tables_1_4_clock = clock;
  assign bank_tables_1_4_reset = reset;
  assign bank_tables_1_4_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_1_4_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_1_4_io_req_bits_hist = _T_7[63:0]; // @[Tage.scala 507:30]
  assign bank_tables_1_4_io_update_pc = REG_100; // @[Tage.scala 755:38]
  assign bank_tables_1_4_io_update_hist = REG_101[63:0]; // @[Tage.scala 757:40]
  assign bank_tables_1_4_io_update_mask = REG_94; // @[Tage.scala 748:40]
  assign bank_tables_1_4_io_update_taken = REG_95; // @[Tage.scala 749:41]
  assign bank_tables_1_4_io_update_alloc = REG_96; // @[Tage.scala 750:41]
  assign bank_tables_1_4_io_update_oldCtr = REG_97; // @[Tage.scala 751:42]
  assign bank_tables_1_4_io_update_uMask = REG_98; // @[Tage.scala 753:41]
  assign bank_tables_1_4_io_update_u = REG_99; // @[Tage.scala 754:37]
  assign bank_tables_1_5_clock = clock;
  assign bank_tables_1_5_reset = reset;
  assign bank_tables_1_5_io_req_valid = io_s0_fire; // @[Tage.scala 505:26]
  assign bank_tables_1_5_io_req_bits_pc = io_in_bits_s0_pc; // @[Tage.scala 506:28]
  assign bank_tables_1_5_io_req_bits_hist = _T_7[63:0]; // @[Tage.scala 507:30]
  assign bank_tables_1_5_io_update_pc = REG_109; // @[Tage.scala 755:38]
  assign bank_tables_1_5_io_update_hist = REG_110[63:0]; // @[Tage.scala 757:40]
  assign bank_tables_1_5_io_update_mask = REG_103; // @[Tage.scala 748:40]
  assign bank_tables_1_5_io_update_taken = REG_104; // @[Tage.scala 749:41]
  assign bank_tables_1_5_io_update_alloc = REG_105; // @[Tage.scala 750:41]
  assign bank_tables_1_5_io_update_oldCtr = REG_106; // @[Tage.scala 751:42]
  assign bank_tables_1_5_io_update_uMask = REG_107; // @[Tage.scala 753:41]
  assign bank_tables_1_5_io_update_u = REG_108; // @[Tage.scala 754:37]
  assign bt_clock = clock;
  assign bt_reset = reset;
  assign bt_io_s0_fire = io_s0_fire; // @[Tage.scala 514:17]
  assign bt_io_s0_pc = io_in_bits_s0_pc; // @[Tage.scala 515:17]
  assign bt_io_update_cnt_0 = REG_114_0; // @[Tage.scala 763:20]
  assign bt_io_update_cnt_1 = REG_114_1; // @[Tage.scala 763:20]
  assign bt_io_update_valid = REG_113; // @[Tage.scala 762:22]
  assign bt_io_update_bits_pc = REG_112_bits_pc; // @[Tage.scala 761:17]
  assign bt_io_update_bits_preds_br_taken_mask_0 = REG_112_bits_preds_br_taken_mask_0; // @[Tage.scala 761:17]
  assign bt_io_update_bits_preds_br_taken_mask_1 = REG_112_bits_preds_br_taken_mask_1; // @[Tage.scala 761:17]
  assign bt_io_update_bits_ftb_entry_brSlots_0_valid = REG_112_bits_ftb_entry_brSlots_0_valid; // @[Tage.scala 761:17]
  assign bt_io_update_bits_ftb_entry_tailSlot_sharing = REG_112_bits_ftb_entry_tailSlot_sharing; // @[Tage.scala 761:17]
  assign bt_io_update_bits_ftb_entry_tailSlot_valid = REG_112_bits_ftb_entry_tailSlot_valid; // @[Tage.scala 761:17]
  assign SCTable_clock = clock;
  assign SCTable_reset = reset;
  assign SCTable_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_io_update_pc = REG_121; // @[SC.scala 373:42]
  assign SCTable_io_update_mask = REG_117; // @[SC.scala 369:44]
  assign SCTable_io_update_oldCtr = REG_120; // @[SC.scala 372:48]
  assign SCTable_io_update_tagePred = REG_118; // @[SC.scala 370:48]
  assign SCTable_io_update_taken = REG_119; // @[SC.scala 371:48]
  assign SCTable_1_clock = clock;
  assign SCTable_1_reset = reset;
  assign SCTable_1_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_1_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_1_io_req_bits_hist = io_in_bits_ghist; // @[SC.scala 236:47]
  assign SCTable_1_io_update_pc = REG_127; // @[SC.scala 373:42]
  assign SCTable_1_io_update_hist = REG_128; // @[SC.scala 374:44]
  assign SCTable_1_io_update_mask = REG_123; // @[SC.scala 369:44]
  assign SCTable_1_io_update_oldCtr = REG_126; // @[SC.scala 372:48]
  assign SCTable_1_io_update_tagePred = REG_124; // @[SC.scala 370:48]
  assign SCTable_1_io_update_taken = REG_125; // @[SC.scala 371:48]
  assign SCTable_2_clock = clock;
  assign SCTable_2_reset = reset;
  assign SCTable_2_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_2_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_2_io_req_bits_hist = io_in_bits_ghist; // @[SC.scala 236:47]
  assign SCTable_2_io_update_pc = REG_133; // @[SC.scala 373:42]
  assign SCTable_2_io_update_hist = REG_134; // @[SC.scala 374:44]
  assign SCTable_2_io_update_mask = REG_129; // @[SC.scala 369:44]
  assign SCTable_2_io_update_oldCtr = REG_132; // @[SC.scala 372:48]
  assign SCTable_2_io_update_tagePred = REG_130; // @[SC.scala 370:48]
  assign SCTable_2_io_update_taken = REG_131; // @[SC.scala 371:48]
  assign SCTable_3_clock = clock;
  assign SCTable_3_reset = reset;
  assign SCTable_3_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_3_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_3_io_req_bits_hist = io_in_bits_ghist; // @[SC.scala 236:47]
  assign SCTable_3_io_update_pc = REG_139; // @[SC.scala 373:42]
  assign SCTable_3_io_update_hist = REG_140; // @[SC.scala 374:44]
  assign SCTable_3_io_update_mask = REG_135; // @[SC.scala 369:44]
  assign SCTable_3_io_update_oldCtr = REG_138; // @[SC.scala 372:48]
  assign SCTable_3_io_update_tagePred = REG_136; // @[SC.scala 370:48]
  assign SCTable_3_io_update_taken = REG_137; // @[SC.scala 371:48]
  assign SCTable_4_clock = clock;
  assign SCTable_4_reset = reset;
  assign SCTable_4_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_4_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_4_io_req_bits_hist = io_in_bits_ghist; // @[SC.scala 236:47]
  assign SCTable_4_io_update_pc = REG_145; // @[SC.scala 373:42]
  assign SCTable_4_io_update_hist = REG_146; // @[SC.scala 374:44]
  assign SCTable_4_io_update_mask = REG_141; // @[SC.scala 369:44]
  assign SCTable_4_io_update_oldCtr = REG_144; // @[SC.scala 372:48]
  assign SCTable_4_io_update_tagePred = REG_142; // @[SC.scala 370:48]
  assign SCTable_4_io_update_taken = REG_143; // @[SC.scala 371:48]
  assign SCTable_5_clock = clock;
  assign SCTable_5_reset = reset;
  assign SCTable_5_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_5_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_5_io_req_bits_hist = io_in_bits_ghist; // @[SC.scala 236:47]
  assign SCTable_5_io_update_pc = REG_151; // @[SC.scala 373:42]
  assign SCTable_5_io_update_hist = REG_152; // @[SC.scala 374:44]
  assign SCTable_5_io_update_mask = REG_147; // @[SC.scala 369:44]
  assign SCTable_5_io_update_oldCtr = REG_150; // @[SC.scala 372:48]
  assign SCTable_5_io_update_tagePred = REG_148; // @[SC.scala 370:48]
  assign SCTable_5_io_update_taken = REG_149; // @[SC.scala 371:48]
  assign SCTable_6_clock = clock;
  assign SCTable_6_reset = reset;
  assign SCTable_6_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_6_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_6_io_update_pc = REG_157; // @[SC.scala 373:42]
  assign SCTable_6_io_update_mask = REG_153; // @[SC.scala 369:44]
  assign SCTable_6_io_update_oldCtr = REG_156; // @[SC.scala 372:48]
  assign SCTable_6_io_update_tagePred = REG_154; // @[SC.scala 370:48]
  assign SCTable_6_io_update_taken = REG_155; // @[SC.scala 371:48]
  assign SCTable_7_clock = clock;
  assign SCTable_7_reset = reset;
  assign SCTable_7_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_7_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_7_io_req_bits_hist = _T_7[63:0]; // @[SC.scala 236:27]
  assign SCTable_7_io_update_pc = REG_163; // @[SC.scala 373:42]
  assign SCTable_7_io_update_hist = REG_164[63:0]; // @[SC.scala 374:44]
  assign SCTable_7_io_update_mask = REG_159; // @[SC.scala 369:44]
  assign SCTable_7_io_update_oldCtr = REG_162; // @[SC.scala 372:48]
  assign SCTable_7_io_update_tagePred = REG_160; // @[SC.scala 370:48]
  assign SCTable_7_io_update_taken = REG_161; // @[SC.scala 371:48]
  assign SCTable_8_clock = clock;
  assign SCTable_8_reset = reset;
  assign SCTable_8_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_8_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_8_io_req_bits_hist = _T_7[63:0]; // @[SC.scala 236:27]
  assign SCTable_8_io_update_pc = REG_169; // @[SC.scala 373:42]
  assign SCTable_8_io_update_hist = REG_170[63:0]; // @[SC.scala 374:44]
  assign SCTable_8_io_update_mask = REG_165; // @[SC.scala 369:44]
  assign SCTable_8_io_update_oldCtr = REG_168; // @[SC.scala 372:48]
  assign SCTable_8_io_update_tagePred = REG_166; // @[SC.scala 370:48]
  assign SCTable_8_io_update_taken = REG_167; // @[SC.scala 371:48]
  assign SCTable_9_clock = clock;
  assign SCTable_9_reset = reset;
  assign SCTable_9_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_9_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_9_io_req_bits_hist = _T_7[63:0]; // @[SC.scala 236:27]
  assign SCTable_9_io_update_pc = REG_175; // @[SC.scala 373:42]
  assign SCTable_9_io_update_hist = REG_176[63:0]; // @[SC.scala 374:44]
  assign SCTable_9_io_update_mask = REG_171; // @[SC.scala 369:44]
  assign SCTable_9_io_update_oldCtr = REG_174; // @[SC.scala 372:48]
  assign SCTable_9_io_update_tagePred = REG_172; // @[SC.scala 370:48]
  assign SCTable_9_io_update_taken = REG_173; // @[SC.scala 371:48]
  assign SCTable_10_clock = clock;
  assign SCTable_10_reset = reset;
  assign SCTable_10_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_10_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_10_io_req_bits_hist = _T_7[63:0]; // @[SC.scala 236:27]
  assign SCTable_10_io_update_pc = REG_181; // @[SC.scala 373:42]
  assign SCTable_10_io_update_hist = REG_182[63:0]; // @[SC.scala 374:44]
  assign SCTable_10_io_update_mask = REG_177; // @[SC.scala 369:44]
  assign SCTable_10_io_update_oldCtr = REG_180; // @[SC.scala 372:48]
  assign SCTable_10_io_update_tagePred = REG_178; // @[SC.scala 370:48]
  assign SCTable_10_io_update_taken = REG_179; // @[SC.scala 371:48]
  assign SCTable_11_clock = clock;
  assign SCTable_11_reset = reset;
  assign SCTable_11_io_req_valid = io_s0_fire; // @[SC.scala 234:23]
  assign SCTable_11_io_req_bits_pc = io_in_bits_s0_pc; // @[SC.scala 235:25]
  assign SCTable_11_io_req_bits_hist = _T_7[63:0]; // @[SC.scala 236:27]
  assign SCTable_11_io_update_pc = REG_187; // @[SC.scala 373:42]
  assign SCTable_11_io_update_hist = REG_188[63:0]; // @[SC.scala 374:44]
  assign SCTable_11_io_update_mask = REG_183; // @[SC.scala 369:44]
  assign SCTable_11_io_update_oldCtr = REG_186; // @[SC.scala 372:48]
  assign SCTable_11_io_update_tagePred = REG_184; // @[SC.scala 370:48]
  assign SCTable_11_io_update_taken = REG_185; // @[SC.scala 371:48]
  always @(posedge clock) begin
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_resps_0_5_valid) begin // @[Tage.scala 609:18]
        if (s1_resps_0_5_bits_ctr == 3'h3 | s1_resps_0_5_bits_ctr == 3'h4) begin // @[Tage.scala 610:28]
          if (s1_resps_0_4_valid) begin // @[Tage.scala 616:23]
            s2_tageTakens_0 <= s1_resps_0_4_bits_ctr[2];
          end else begin
            s2_tageTakens_0 <= _T_158;
          end
        end else begin
          s2_tageTakens_0 <= s1_resps_0_5_bits_ctr[2];
        end
      end else if (s1_resps_0_4_valid) begin // @[Tage.scala 609:18]
        if (s1_resps_0_4_bits_ctr == 3'h3 | s1_resps_0_4_bits_ctr == 3'h4) begin // @[Tage.scala 610:28]
          s2_tageTakens_0 <= _T_158;
        end else begin
          s2_tageTakens_0 <= s1_resps_0_4_bits_ctr[2];
        end
      end else if (s1_resps_0_3_valid) begin // @[Tage.scala 609:18]
        s2_tageTakens_0 <= _T_152; // @[Tage.scala 610:22]
      end else begin
        s2_tageTakens_0 <= _GEN_37;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_resps_1_5_valid) begin // @[Tage.scala 609:18]
        if (s1_resps_1_5_bits_ctr == 3'h3 | s1_resps_1_5_bits_ctr == 3'h4) begin // @[Tage.scala 610:28]
          if (s1_resps_1_4_valid) begin // @[Tage.scala 616:23]
            s2_tageTakens_1 <= s1_resps_1_4_bits_ctr[2];
          end else begin
            s2_tageTakens_1 <= _T_378;
          end
        end else begin
          s2_tageTakens_1 <= s1_resps_1_5_bits_ctr[2];
        end
      end else if (s1_resps_1_4_valid) begin // @[Tage.scala 609:18]
        if (s1_resps_1_4_bits_ctr == 3'h3 | s1_resps_1_4_bits_ctr == 3'h4) begin // @[Tage.scala 610:28]
          s2_tageTakens_1 <= _T_378;
        end else begin
          s2_tageTakens_1 <= s1_resps_1_4_bits_ctr[2];
        end
      end else if (s1_resps_1_3_valid) begin // @[Tage.scala 609:18]
        s2_tageTakens_1 <= _T_372; // @[Tage.scala 610:22]
      end else begin
        s2_tageTakens_1 <= _GEN_348;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      s2_provideds_0 <= s1_provideds_0; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      s2_provideds_1 <= s1_provideds_1; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_resps_1_5_valid) begin // @[Tage.scala 615:24]
        s2_providers_1 <= 3'h5;
      end else if (s1_resps_1_4_valid) begin // @[Tage.scala 615:24]
        s2_providers_1 <= 3'h4;
      end else begin
        s2_providers_1 <= {{1'd0}, _T_376};
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_resps_0_5_valid) begin // @[Tage.scala 615:24]
        s2_providers_0 <= 3'h5;
      end else if (s1_resps_0_4_valid) begin // @[Tage.scala 615:24]
        s2_providers_0 <= 3'h4;
      end else begin
        s2_providers_0 <= {{1'd0}, _T_156};
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_resps_0_5_valid) begin // @[Tage.scala 609:18]
        if (s1_resps_0_4_valid) begin // @[Tage.scala 616:23]
          s2_finalAltPreds_0 <= s1_resps_0_4_bits_ctr[2];
        end else begin
          s2_finalAltPreds_0 <= _T_158;
        end
      end else if (s1_resps_0_4_valid) begin // @[Tage.scala 609:18]
        s2_finalAltPreds_0 <= _T_158; // @[Tage.scala 611:25]
      end else if (s1_resps_0_3_valid) begin // @[Tage.scala 609:18]
        s2_finalAltPreds_0 <= _T_145; // @[Tage.scala 611:25]
      end else begin
        s2_finalAltPreds_0 <= _GEN_38;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_resps_1_5_valid) begin // @[Tage.scala 609:18]
        if (s1_resps_1_4_valid) begin // @[Tage.scala 616:23]
          s2_finalAltPreds_1 <= s1_resps_1_4_bits_ctr[2];
        end else begin
          s2_finalAltPreds_1 <= _T_378;
        end
      end else if (s1_resps_1_4_valid) begin // @[Tage.scala 609:18]
        s2_finalAltPreds_1 <= _T_378; // @[Tage.scala 611:25]
      end else if (s1_resps_1_3_valid) begin // @[Tage.scala 609:18]
        s2_finalAltPreds_1 <= _T_365; // @[Tage.scala 611:25]
      end else begin
        s2_finalAltPreds_1 <= _GEN_349;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (3'h5 == s1_providers_0) begin // @[Tage.scala 625:26]
        s2_providerUs_0 <= s1_resps_0_5_bits_u; // @[Tage.scala 625:26]
      end else if (3'h4 == s1_providers_0) begin // @[Tage.scala 625:26]
        s2_providerUs_0 <= s1_resps_0_4_bits_u; // @[Tage.scala 625:26]
      end else if (3'h3 == s1_providers_0) begin // @[Tage.scala 625:26]
        s2_providerUs_0 <= s1_resps_0_3_bits_u; // @[Tage.scala 625:26]
      end else begin
        s2_providerUs_0 <= _GEN_47;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (3'h5 == s1_providers_1) begin // @[Tage.scala 625:26]
        s2_providerUs_1 <= s1_resps_1_5_bits_u; // @[Tage.scala 625:26]
      end else if (3'h4 == s1_providers_1) begin // @[Tage.scala 625:26]
        s2_providerUs_1 <= s1_resps_1_4_bits_u; // @[Tage.scala 625:26]
      end else if (3'h3 == s1_providers_1) begin // @[Tage.scala 625:26]
        s2_providerUs_1 <= s1_resps_1_3_bits_u; // @[Tage.scala 625:26]
      end else begin
        s2_providerUs_1 <= _GEN_358;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (3'h5 == s1_providers_0) begin // @[Tage.scala 626:26]
        s2_providerCtrs_0 <= s1_resps_0_5_bits_ctr; // @[Tage.scala 626:26]
      end else if (3'h4 == s1_providers_0) begin // @[Tage.scala 626:26]
        s2_providerCtrs_0 <= s1_resps_0_4_bits_ctr; // @[Tage.scala 626:26]
      end else if (3'h3 == s1_providers_0) begin // @[Tage.scala 626:26]
        s2_providerCtrs_0 <= s1_resps_0_3_bits_ctr; // @[Tage.scala 626:26]
      end else begin
        s2_providerCtrs_0 <= _GEN_53;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (3'h5 == s1_providers_1) begin // @[Tage.scala 626:26]
        s2_providerCtrs_1 <= s1_resps_1_5_bits_ctr; // @[Tage.scala 626:26]
      end else if (3'h4 == s1_providers_1) begin // @[Tage.scala 626:26]
        s2_providerCtrs_1 <= s1_resps_1_4_bits_ctr; // @[Tage.scala 626:26]
      end else if (3'h3 == s1_providers_1) begin // @[Tage.scala 626:26]
        s2_providerCtrs_1 <= s1_resps_1_3_bits_ctr; // @[Tage.scala 626:26]
      end else begin
        s2_providerCtrs_1 <= _GEN_364;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_resps_1_5_valid) begin // @[Tage.scala 615:24]
        s2_prednums_1 <= 3'h5;
      end else if (s1_resps_1_4_valid) begin // @[Tage.scala 615:24]
        s2_prednums_1 <= 3'h4;
      end else begin
        s2_prednums_1 <= {{1'd0}, _T_376};
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_resps_0_5_valid) begin // @[Tage.scala 615:24]
        s2_prednums_0 <= 3'h5;
      end else if (s1_resps_0_4_valid) begin // @[Tage.scala 615:24]
        s2_prednums_0 <= 3'h4;
      end else begin
        s2_prednums_0 <= {{1'd0}, _T_156};
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_resps_1_5_valid) begin // @[Tage.scala 617:26]
        if (s1_resps_1_4_valid) begin // @[Tage.scala 615:24]
          s2_altprednums_1 <= 3'h4;
        end else begin
          s2_altprednums_1 <= {{1'd0}, _T_376};
        end
      end else begin
        s2_altprednums_1 <= {{1'd0}, _T_392};
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_resps_0_5_valid) begin // @[Tage.scala 617:26]
        if (s1_resps_0_4_valid) begin // @[Tage.scala 615:24]
          s2_altprednums_0 <= 3'h4;
        end else begin
          s2_altprednums_0 <= {{1'd0}, _T_156};
        end
      end else begin
        s2_altprednums_0 <= {{1'd0}, _T_172};
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (3'h5 == s1_providers_0) begin // @[Tage.scala 626:26]
        s2_predcnts_0 <= s1_resps_0_5_bits_ctr; // @[Tage.scala 626:26]
      end else if (3'h4 == s1_providers_0) begin // @[Tage.scala 626:26]
        s2_predcnts_0 <= s1_resps_0_4_bits_ctr; // @[Tage.scala 626:26]
      end else if (3'h3 == s1_providers_0) begin // @[Tage.scala 626:26]
        s2_predcnts_0 <= s1_resps_0_3_bits_ctr; // @[Tage.scala 626:26]
      end else begin
        s2_predcnts_0 <= _GEN_53;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (3'h5 == s1_providers_1) begin // @[Tage.scala 626:26]
        s2_predcnts_1 <= s1_resps_1_5_bits_ctr; // @[Tage.scala 626:26]
      end else if (3'h4 == s1_providers_1) begin // @[Tage.scala 626:26]
        s2_predcnts_1 <= s1_resps_1_4_bits_ctr; // @[Tage.scala 626:26]
      end else if (3'h3 == s1_providers_1) begin // @[Tage.scala 626:26]
        s2_predcnts_1 <= s1_resps_1_3_bits_ctr; // @[Tage.scala 626:26]
      end else begin
        s2_predcnts_1 <= _GEN_364;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (3'h5 == s1_altprednums_0) begin // @[Tage.scala 631:26]
        s2_altpredcnts_0 <= s1_resps_0_5_bits_ctr; // @[Tage.scala 631:26]
      end else if (3'h4 == s1_altprednums_0) begin // @[Tage.scala 631:26]
        s2_altpredcnts_0 <= s1_resps_0_4_bits_ctr; // @[Tage.scala 631:26]
      end else if (3'h3 == s1_altprednums_0) begin // @[Tage.scala 631:26]
        s2_altpredcnts_0 <= s1_resps_0_3_bits_ctr; // @[Tage.scala 631:26]
      end else begin
        s2_altpredcnts_0 <= _GEN_65;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (3'h5 == s1_altprednums_1) begin // @[Tage.scala 631:26]
        s2_altpredcnts_1 <= s1_resps_1_5_bits_ctr; // @[Tage.scala 631:26]
      end else if (3'h4 == s1_altprednums_1) begin // @[Tage.scala 631:26]
        s2_altpredcnts_1 <= s1_resps_1_4_bits_ctr; // @[Tage.scala 631:26]
      end else if (3'h3 == s1_altprednums_1) begin // @[Tage.scala 631:26]
        s2_altpredcnts_1 <= s1_resps_1_3_bits_ctr; // @[Tage.scala 631:26]
      end else begin
        s2_altpredcnts_1 <= _GEN_376;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      s2_altpredhits_0 <= s1_altpredhits_0; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      s2_altpredhits_1 <= s1_altpredhits_1; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      s2_basecnts_0 <= s1_basecnts_0; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      s2_basecnts_1 <= s1_basecnts_1; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_0) begin // @[SC.scala 294:40]
        r_6_0 <= hetVecWire_0_0_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_6_0 <= hetVecWire_0_0_ctr_0;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_0) begin // @[SC.scala 294:40]
        r_6_1 <= hetVecWire_0_1_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_6_1 <= hetVecWire_0_1_ctr_0;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_0) begin // @[SC.scala 294:40]
        r_6_2 <= hetVecWire_0_2_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_6_2 <= hetVecWire_0_2_ctr_0;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_0) begin // @[SC.scala 294:40]
        r_6_3 <= hetVecWire_0_3_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_6_3 <= hetVecWire_0_3_ctr_0;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_0) begin // @[SC.scala 294:40]
        r_6_4 <= hetVecWire_0_4_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_6_4 <= hetVecWire_0_4_ctr_0;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_0) begin // @[SC.scala 294:40]
        r_6_5 <= hetVecWire_0_5_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_6_5 <= hetVecWire_0_5_ctr_0;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_1) begin // @[SC.scala 294:40]
        r_10_0 <= hetVecWire_1_0_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_10_0 <= hetVecWire_1_0_ctr_0;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_1) begin // @[SC.scala 294:40]
        r_10_1 <= hetVecWire_1_1_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_10_1 <= hetVecWire_1_1_ctr_0;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_1) begin // @[SC.scala 294:40]
        r_10_2 <= hetVecWire_1_2_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_10_2 <= hetVecWire_1_2_ctr_0;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_1) begin // @[SC.scala 294:40]
        r_10_3 <= hetVecWire_1_3_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_10_3 <= hetVecWire_1_3_ctr_0;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_1) begin // @[SC.scala 294:40]
        r_10_4 <= hetVecWire_1_4_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_10_4 <= hetVecWire_1_4_ctr_0;
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      if (s1_tageTakens_1) begin // @[SC.scala 294:40]
        r_10_5 <= hetVecWire_1_5_ctr_1; // @[SC.scala 294:40]
      end else begin
        r_10_5 <= hetVecWire_1_5_ctr_0;
      end
    end
    if (reset) begin // @[GTimer.scala 23:20]
      REG <= 64'h0; // @[GTimer.scala 23:20]
    end else begin
      REG <= _T_189; // @[GTimer.scala 24:7]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      r_4_1 <= _T_864; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      r_4_0 <= _T_863; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      r_1 <= _T_225; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[LFSR64.scala 25:23]
      REG_1 <= 64'h1234567887654321; // @[LFSR64.scala 25:23]
    end else if (REG_1 == 64'h0) begin // @[LFSR64.scala 28:18]
      REG_1 <= 64'h1;
    end else begin
      REG_1 <= _T_235;
    end
    if (reset) begin // @[GTimer.scala 23:20]
      REG_2 <= 64'h0; // @[GTimer.scala 23:20]
    end else begin
      REG_2 <= _T_409; // @[GTimer.scala 24:7]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      r_8_1 <= _T_1084; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      r_8_0 <= _T_1083; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      r_2 <= _T_445; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[LFSR64.scala 25:23]
      REG_3 <= 64'h1234567887654321; // @[LFSR64.scala 25:23]
    end else if (REG_3 == 64'h0) begin // @[LFSR64.scala 28:18]
      REG_3 <= 64'h1;
    end else begin
      REG_3 <= _T_455;
    end
    if (io_s2_fire) begin // @[Reg.scala 16:19]
      r <= _T_25; // @[Reg.scala 16:23]
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_4 <= _GEN_242;
      end else begin
        REG_4 <= _GEN_203;
      end
    end else begin
      REG_4 <= _GEN_203;
    end
    REG_5 <= updateValids_0 & io_update_bits_preds_br_taken_mask_0; // @[Tage.scala 668:37]
    REG_6 <= updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0)
       & updateMetas_0_provider_valid) & _GEN_296; // @[Tage.scala 718:170]
    if (3'h0 == updateMetas_0_prednum_bits) begin // @[Tage.scala 692:37]
      REG_7 <= updateMetas_0_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_7 <= updateMetas_0_altpredcnt;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_8 <= _GEN_260;
      end else begin
        REG_8 <= _GEN_272;
      end
    end else begin
      REG_8 <= _GEN_209;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h0 == updateMetas_0_allocate_bits) begin // @[Tage.scala 726:35]
          REG_9 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_9 <= _T_289;
        end
      end else if (_T_319[0]) begin // @[Tage.scala 732:30]
        REG_9 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_9 <= _T_289;
      end
    end else begin
      REG_9 <= _T_289;
    end
    REG_10 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_11 <= io_update_bits_ghist_predHist; // @[Tage.scala 757:71]
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_13 <= _GEN_243;
      end else begin
        REG_13 <= _GEN_204;
      end
    end else begin
      REG_13 <= _GEN_204;
    end
    REG_14 <= updateValids_0 & io_update_bits_preds_br_taken_mask_0; // @[Tage.scala 668:37]
    REG_15 <= updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0)
       & updateMetas_0_provider_valid) & _GEN_297; // @[Tage.scala 718:170]
    if (3'h1 == updateMetas_0_prednum_bits) begin // @[Tage.scala 692:37]
      REG_16 <= updateMetas_0_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_16 <= updateMetas_0_altpredcnt;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_17 <= _GEN_261;
      end else begin
        REG_17 <= _GEN_274;
      end
    end else begin
      REG_17 <= _GEN_210;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h1 == updateMetas_0_allocate_bits) begin // @[Tage.scala 726:35]
          REG_18 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_18 <= _T_289;
        end
      end else if (_T_319[1]) begin // @[Tage.scala 732:30]
        REG_18 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_18 <= _T_289;
      end
    end else begin
      REG_18 <= _T_289;
    end
    REG_19 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_20 <= io_update_bits_ghist_predHist; // @[Tage.scala 757:71]
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_22 <= _GEN_244;
      end else begin
        REG_22 <= _GEN_205;
      end
    end else begin
      REG_22 <= _GEN_205;
    end
    REG_23 <= updateValids_0 & io_update_bits_preds_br_taken_mask_0; // @[Tage.scala 668:37]
    REG_24 <= updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0)
       & updateMetas_0_provider_valid) & _GEN_298; // @[Tage.scala 718:170]
    if (3'h2 == updateMetas_0_prednum_bits) begin // @[Tage.scala 692:37]
      REG_25 <= updateMetas_0_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_25 <= updateMetas_0_altpredcnt;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_26 <= _GEN_262;
      end else begin
        REG_26 <= _GEN_276;
      end
    end else begin
      REG_26 <= _GEN_211;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h2 == updateMetas_0_allocate_bits) begin // @[Tage.scala 726:35]
          REG_27 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_27 <= _T_289;
        end
      end else if (_T_319[2]) begin // @[Tage.scala 732:30]
        REG_27 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_27 <= _T_289;
      end
    end else begin
      REG_27 <= _T_289;
    end
    REG_28 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_29 <= io_update_bits_ghist_predHist; // @[Tage.scala 757:71]
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_31 <= _GEN_245;
      end else begin
        REG_31 <= _GEN_206;
      end
    end else begin
      REG_31 <= _GEN_206;
    end
    REG_32 <= updateValids_0 & io_update_bits_preds_br_taken_mask_0; // @[Tage.scala 668:37]
    REG_33 <= updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0)
       & updateMetas_0_provider_valid) & _GEN_299; // @[Tage.scala 718:170]
    if (3'h3 == updateMetas_0_prednum_bits) begin // @[Tage.scala 692:37]
      REG_34 <= updateMetas_0_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_34 <= updateMetas_0_altpredcnt;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_35 <= _GEN_263;
      end else begin
        REG_35 <= _GEN_278;
      end
    end else begin
      REG_35 <= _GEN_212;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h3 == updateMetas_0_allocate_bits) begin // @[Tage.scala 726:35]
          REG_36 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_36 <= _T_289;
        end
      end else if (_T_319[3]) begin // @[Tage.scala 732:30]
        REG_36 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_36 <= _T_289;
      end
    end else begin
      REG_36 <= _T_289;
    end
    REG_37 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_38 <= io_update_bits_ghist_predHist; // @[Tage.scala 757:71]
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_40 <= _GEN_246;
      end else begin
        REG_40 <= _GEN_207;
      end
    end else begin
      REG_40 <= _GEN_207;
    end
    REG_41 <= updateValids_0 & io_update_bits_preds_br_taken_mask_0; // @[Tage.scala 668:37]
    REG_42 <= updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0)
       & updateMetas_0_provider_valid) & _GEN_300; // @[Tage.scala 718:170]
    if (3'h4 == updateMetas_0_prednum_bits) begin // @[Tage.scala 692:37]
      REG_43 <= updateMetas_0_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_43 <= updateMetas_0_altpredcnt;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_44 <= _GEN_264;
      end else begin
        REG_44 <= _GEN_280;
      end
    end else begin
      REG_44 <= _GEN_213;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h4 == updateMetas_0_allocate_bits) begin // @[Tage.scala 726:35]
          REG_45 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_45 <= _T_289;
        end
      end else if (_T_319[4]) begin // @[Tage.scala 732:30]
        REG_45 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_45 <= _T_289;
      end
    end else begin
      REG_45 <= _T_289;
    end
    REG_46 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_47 <= io_update_bits_ghist_predHist; // @[Tage.scala 757:71]
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_49 <= _GEN_247;
      end else begin
        REG_49 <= _GEN_208;
      end
    end else begin
      REG_49 <= _GEN_208;
    end
    REG_50 <= updateValids_0 & io_update_bits_preds_br_taken_mask_0; // @[Tage.scala 668:37]
    REG_51 <= updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0)
       & updateMetas_0_provider_valid) & _GEN_301; // @[Tage.scala 718:170]
    if (3'h5 == updateMetas_0_prednum_bits) begin // @[Tage.scala 692:37]
      REG_52 <= updateMetas_0_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_52 <= updateMetas_0_altpredcnt;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        REG_53 <= _GEN_265;
      end else begin
        REG_53 <= _GEN_282;
      end
    end else begin
      REG_53 <= _GEN_214;
    end
    if (updateValids_0 & io_update_bits_mispred_mask_0 & ~((_T_275 & ~updateTaken_0_0 | _T_276 & updateTaken_0_0) &
      updateMetas_0_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_0_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h5 == updateMetas_0_allocate_bits) begin // @[Tage.scala 726:35]
          REG_54 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_54 <= _T_289;
        end
      end else if (_T_319[5]) begin // @[Tage.scala 732:30]
        REG_54 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_54 <= _T_289;
      end
    end else begin
      REG_54 <= _T_289;
    end
    REG_55 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_56 <= io_update_bits_ghist_predHist; // @[Tage.scala 757:71]
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_58 <= _GEN_553;
      end else begin
        REG_58 <= _GEN_514;
      end
    end else begin
      REG_58 <= _GEN_514;
    end
    REG_59 <= updateValids_1 & io_update_bits_preds_br_taken_mask_1; // @[Tage.scala 668:37]
    REG_60 <= updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0)
       & updateMetas_1_provider_valid) & _GEN_607; // @[Tage.scala 718:170]
    if (3'h0 == updateMetas_1_prednum_bits) begin // @[Tage.scala 692:37]
      REG_61 <= updateMetas_1_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_61 <= updateMetas_1_altpredcnt;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_62 <= _GEN_571;
      end else begin
        REG_62 <= _GEN_583;
      end
    end else begin
      REG_62 <= _GEN_520;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h0 == updateMetas_1_allocate_bits) begin // @[Tage.scala 726:35]
          REG_63 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_63 <= _T_509;
        end
      end else if (_T_539[0]) begin // @[Tage.scala 732:30]
        REG_63 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_63 <= _T_509;
      end
    end else begin
      REG_63 <= _T_509;
    end
    REG_64 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_65 <= {io_update_bits_ghist_predHist, 1'h0}; // @[Tage.scala 757:71]
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_67 <= _GEN_554;
      end else begin
        REG_67 <= _GEN_515;
      end
    end else begin
      REG_67 <= _GEN_515;
    end
    REG_68 <= updateValids_1 & io_update_bits_preds_br_taken_mask_1; // @[Tage.scala 668:37]
    REG_69 <= updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0)
       & updateMetas_1_provider_valid) & _GEN_608; // @[Tage.scala 718:170]
    if (3'h1 == updateMetas_1_prednum_bits) begin // @[Tage.scala 692:37]
      REG_70 <= updateMetas_1_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_70 <= updateMetas_1_altpredcnt;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_71 <= _GEN_572;
      end else begin
        REG_71 <= _GEN_585;
      end
    end else begin
      REG_71 <= _GEN_521;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h1 == updateMetas_1_allocate_bits) begin // @[Tage.scala 726:35]
          REG_72 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_72 <= _T_509;
        end
      end else if (_T_539[1]) begin // @[Tage.scala 732:30]
        REG_72 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_72 <= _T_509;
      end
    end else begin
      REG_72 <= _T_509;
    end
    REG_73 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_74 <= {io_update_bits_ghist_predHist, 1'h0}; // @[Tage.scala 757:71]
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_76 <= _GEN_555;
      end else begin
        REG_76 <= _GEN_516;
      end
    end else begin
      REG_76 <= _GEN_516;
    end
    REG_77 <= updateValids_1 & io_update_bits_preds_br_taken_mask_1; // @[Tage.scala 668:37]
    REG_78 <= updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0)
       & updateMetas_1_provider_valid) & _GEN_609; // @[Tage.scala 718:170]
    if (3'h2 == updateMetas_1_prednum_bits) begin // @[Tage.scala 692:37]
      REG_79 <= updateMetas_1_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_79 <= updateMetas_1_altpredcnt;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_80 <= _GEN_573;
      end else begin
        REG_80 <= _GEN_587;
      end
    end else begin
      REG_80 <= _GEN_522;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h2 == updateMetas_1_allocate_bits) begin // @[Tage.scala 726:35]
          REG_81 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_81 <= _T_509;
        end
      end else if (_T_539[2]) begin // @[Tage.scala 732:30]
        REG_81 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_81 <= _T_509;
      end
    end else begin
      REG_81 <= _T_509;
    end
    REG_82 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_83 <= {io_update_bits_ghist_predHist, 1'h0}; // @[Tage.scala 757:71]
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_85 <= _GEN_556;
      end else begin
        REG_85 <= _GEN_517;
      end
    end else begin
      REG_85 <= _GEN_517;
    end
    REG_86 <= updateValids_1 & io_update_bits_preds_br_taken_mask_1; // @[Tage.scala 668:37]
    REG_87 <= updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0)
       & updateMetas_1_provider_valid) & _GEN_610; // @[Tage.scala 718:170]
    if (3'h3 == updateMetas_1_prednum_bits) begin // @[Tage.scala 692:37]
      REG_88 <= updateMetas_1_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_88 <= updateMetas_1_altpredcnt;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_89 <= _GEN_574;
      end else begin
        REG_89 <= _GEN_589;
      end
    end else begin
      REG_89 <= _GEN_523;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h3 == updateMetas_1_allocate_bits) begin // @[Tage.scala 726:35]
          REG_90 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_90 <= _T_509;
        end
      end else if (_T_539[3]) begin // @[Tage.scala 732:30]
        REG_90 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_90 <= _T_509;
      end
    end else begin
      REG_90 <= _T_509;
    end
    REG_91 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_92 <= {io_update_bits_ghist_predHist, 1'h0}; // @[Tage.scala 757:71]
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_94 <= _GEN_557;
      end else begin
        REG_94 <= _GEN_518;
      end
    end else begin
      REG_94 <= _GEN_518;
    end
    REG_95 <= updateValids_1 & io_update_bits_preds_br_taken_mask_1; // @[Tage.scala 668:37]
    REG_96 <= updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0)
       & updateMetas_1_provider_valid) & _GEN_611; // @[Tage.scala 718:170]
    if (3'h4 == updateMetas_1_prednum_bits) begin // @[Tage.scala 692:37]
      REG_97 <= updateMetas_1_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_97 <= updateMetas_1_altpredcnt;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_98 <= _GEN_575;
      end else begin
        REG_98 <= _GEN_591;
      end
    end else begin
      REG_98 <= _GEN_524;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h4 == updateMetas_1_allocate_bits) begin // @[Tage.scala 726:35]
          REG_99 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_99 <= _T_509;
        end
      end else if (_T_539[4]) begin // @[Tage.scala 732:30]
        REG_99 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_99 <= _T_509;
      end
    end else begin
      REG_99 <= _T_509;
    end
    REG_100 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_101 <= {io_update_bits_ghist_predHist, 1'h0}; // @[Tage.scala 757:71]
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_103 <= _GEN_558;
      end else begin
        REG_103 <= _GEN_519;
      end
    end else begin
      REG_103 <= _GEN_519;
    end
    REG_104 <= updateValids_1 & io_update_bits_preds_br_taken_mask_1; // @[Tage.scala 668:37]
    REG_105 <= updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0)
       & updateMetas_1_provider_valid) & _GEN_612; // @[Tage.scala 718:170]
    if (3'h5 == updateMetas_1_prednum_bits) begin // @[Tage.scala 692:37]
      REG_106 <= updateMetas_1_predcnt; // @[Tage.scala 692:37]
    end else begin
      REG_106 <= updateMetas_1_altpredcnt;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        REG_107 <= _GEN_576;
      end else begin
        REG_107 <= _GEN_593;
      end
    end else begin
      REG_107 <= _GEN_525;
    end
    if (updateValids_1 & io_update_bits_mispred_mask_1 & ~((_T_495 & ~updateTaken_1_0 | _T_496 & updateTaken_1_0) &
      updateMetas_1_provider_valid)) begin // @[Tage.scala 718:170]
      if (updateMetas_1_allocate_valid) begin // @[Tage.scala 721:29]
        if (3'h5 == updateMetas_1_allocate_bits) begin // @[Tage.scala 726:35]
          REG_108 <= 2'h0; // @[Tage.scala 726:35]
        end else begin
          REG_108 <= _T_509;
        end
      end else if (_T_539[5]) begin // @[Tage.scala 732:30]
        REG_108 <= 2'h0; // @[Tage.scala 734:27]
      end else begin
        REG_108 <= _T_509;
      end
    end else begin
      REG_108 <= _T_509;
    end
    REG_109 <= io_update_bits_pc; // @[Tage.scala 755:48]
    REG_110 <= {io_update_bits_ghist_predHist, 1'h0}; // @[Tage.scala 757:71]
    REG_112_bits_pc <= io_update_bits_pc; // @[Tage.scala 761:27]
    REG_112_bits_preds_br_taken_mask_0 <= io_update_bits_preds_br_taken_mask_0; // @[Tage.scala 761:27]
    REG_112_bits_preds_br_taken_mask_1 <= io_update_bits_preds_br_taken_mask_1; // @[Tage.scala 761:27]
    REG_112_bits_ftb_entry_brSlots_0_valid <= io_update_bits_ftb_entry_brSlots_0_valid; // @[Tage.scala 761:27]
    REG_112_bits_ftb_entry_tailSlot_sharing <= io_update_bits_ftb_entry_tailSlot_sharing; // @[Tage.scala 761:27]
    REG_112_bits_ftb_entry_tailSlot_valid <= io_update_bits_ftb_entry_tailSlot_valid; // @[Tage.scala 761:27]
    REG_113 <= baseupdate_0 | baseupdate_1; // @[Tage.scala 762:52]
    REG_114_0 <= io_update_bits_meta[116:115]; // @[Tage.scala 577:41]
    REG_114_1 <= io_update_bits_meta[251:250]; // @[Tage.scala 577:41]
    if (reset) begin // @[SC.scala 245:52]
      REG_115_ctr <= 5'h10; // @[SC.scala 245:52]
    end else if (updateValids_0 & updateMetas_0_scMeta_scUsed) begin // @[SC.scala 321:60]
      if (_T_927 & _T_923 >= _GEN_910 & _T_923 <= _GEN_911) begin // @[SC.scala 342:86]
        if (_T_961 | _T_966) begin // @[SC.scala 209:19]
          REG_115_ctr <= 5'h10;
        end else begin
          REG_115_ctr <= _T_957;
        end
      end
    end
    if (reset) begin // @[SC.scala 245:52]
      REG_115_thres <= 8'h6; // @[SC.scala 245:52]
    end else if (updateValids_0 & updateMetas_0_scMeta_scUsed) begin // @[SC.scala 321:60]
      if (_T_927 & _T_923 >= _GEN_910 & _T_923 <= _GEN_911) begin // @[SC.scala 342:86]
        if (_T_961 & REG_115_thres <= 8'h1f) begin // @[SC.scala 205:23]
          REG_115_thres <= _T_965;
        end else begin
          REG_115_thres <= _T_971;
        end
      end
    end
    if (reset) begin // @[SC.scala 245:52]
      REG_116_ctr <= 5'h10; // @[SC.scala 245:52]
    end else if (updateValids_1 & updateMetas_1_scMeta_scUsed) begin // @[SC.scala 321:60]
      if (_T_1147 & _T_1143 >= _GEN_928 & _T_1143 <= _GEN_929) begin // @[SC.scala 342:86]
        if (_T_1181 | _T_1186) begin // @[SC.scala 209:19]
          REG_116_ctr <= 5'h10;
        end else begin
          REG_116_ctr <= _T_1177;
        end
      end
    end
    if (reset) begin // @[SC.scala 245:52]
      REG_116_thres <= 8'h6; // @[SC.scala 245:52]
    end else if (updateValids_1 & updateMetas_1_scMeta_scUsed) begin // @[SC.scala 321:60]
      if (_T_1147 & _T_1143 >= _GEN_928 & _T_1143 <= _GEN_929) begin // @[SC.scala 342:86]
        if (_T_1181 & REG_116_thres <= 8'h1f) begin // @[SC.scala 205:23]
          REG_116_thres <= _T_1185;
        end else begin
          REG_116_thres <= _T_1191;
        end
      end
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      r_3_0 <= _T_861; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      r_3_1 <= _T_862; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      r_7_0 <= _T_1081; // @[Reg.scala 16:23]
    end
    if (io_s1_fire) begin // @[Reg.scala 16:19]
      r_7_1 <= _T_1082; // @[Reg.scala 16:23]
    end
    REG_117 <= updateValids_0 & updateMetas_0_scMeta_scUsed & _T_986; // @[SC.scala 321:60]
    REG_118 <= io_update_bits_meta[102]; // @[Tage.scala 577:41]
    REG_119 <= io_update_bits_preds_br_taken_mask_0; // @[SC.scala 321:60 330:27]
    REG_120 <= io_update_bits_meta[69:64]; // @[Tage.scala 577:41]
    REG_121 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_123 <= updateValids_0 & updateMetas_0_scMeta_scUsed & _T_986; // @[SC.scala 321:60]
    REG_124 <= io_update_bits_meta[102]; // @[Tage.scala 577:41]
    REG_125 <= io_update_bits_preds_br_taken_mask_0; // @[SC.scala 321:60 330:27]
    REG_126 <= io_update_bits_meta[75:70]; // @[Tage.scala 577:41]
    REG_127 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_128 <= io_update_bits_ghist_predHist; // @[SC.scala 374:75]
    REG_129 <= updateValids_0 & updateMetas_0_scMeta_scUsed & _T_986; // @[SC.scala 321:60]
    REG_130 <= io_update_bits_meta[102]; // @[Tage.scala 577:41]
    REG_131 <= io_update_bits_preds_br_taken_mask_0; // @[SC.scala 321:60 330:27]
    REG_132 <= io_update_bits_meta[81:76]; // @[Tage.scala 577:41]
    REG_133 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_134 <= io_update_bits_ghist_predHist; // @[SC.scala 374:75]
    REG_135 <= updateValids_0 & updateMetas_0_scMeta_scUsed & _T_986; // @[SC.scala 321:60]
    REG_136 <= io_update_bits_meta[102]; // @[Tage.scala 577:41]
    REG_137 <= io_update_bits_preds_br_taken_mask_0; // @[SC.scala 321:60 330:27]
    REG_138 <= io_update_bits_meta[87:82]; // @[Tage.scala 577:41]
    REG_139 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_140 <= io_update_bits_ghist_predHist; // @[SC.scala 374:75]
    REG_141 <= updateValids_0 & updateMetas_0_scMeta_scUsed & _T_986; // @[SC.scala 321:60]
    REG_142 <= io_update_bits_meta[102]; // @[Tage.scala 577:41]
    REG_143 <= io_update_bits_preds_br_taken_mask_0; // @[SC.scala 321:60 330:27]
    REG_144 <= io_update_bits_meta[93:88]; // @[Tage.scala 577:41]
    REG_145 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_146 <= io_update_bits_ghist_predHist; // @[SC.scala 374:75]
    REG_147 <= updateValids_0 & updateMetas_0_scMeta_scUsed & _T_986; // @[SC.scala 321:60]
    REG_148 <= io_update_bits_meta[102]; // @[Tage.scala 577:41]
    REG_149 <= io_update_bits_preds_br_taken_mask_0; // @[SC.scala 321:60 330:27]
    REG_150 <= io_update_bits_meta[99:94]; // @[Tage.scala 577:41]
    REG_151 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_152 <= io_update_bits_ghist_predHist; // @[SC.scala 374:75]
    REG_153 <= updateValids_1 & updateMetas_1_scMeta_scUsed & _T_1206; // @[SC.scala 321:60]
    REG_154 <= io_update_bits_meta[237]; // @[Tage.scala 577:41]
    REG_155 <= io_update_bits_preds_br_taken_mask_1; // @[SC.scala 321:60 330:27]
    REG_156 <= io_update_bits_meta[204:199]; // @[Tage.scala 577:41]
    REG_157 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_159 <= updateValids_1 & updateMetas_1_scMeta_scUsed & _T_1206; // @[SC.scala 321:60]
    REG_160 <= io_update_bits_meta[237]; // @[Tage.scala 577:41]
    REG_161 <= io_update_bits_preds_br_taken_mask_1; // @[SC.scala 321:60 330:27]
    REG_162 <= io_update_bits_meta[210:205]; // @[Tage.scala 577:41]
    REG_163 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_164 <= {io_update_bits_ghist_predHist, 1'h0}; // @[SC.scala 374:75]
    REG_165 <= updateValids_1 & updateMetas_1_scMeta_scUsed & _T_1206; // @[SC.scala 321:60]
    REG_166 <= io_update_bits_meta[237]; // @[Tage.scala 577:41]
    REG_167 <= io_update_bits_preds_br_taken_mask_1; // @[SC.scala 321:60 330:27]
    REG_168 <= io_update_bits_meta[216:211]; // @[Tage.scala 577:41]
    REG_169 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_170 <= {io_update_bits_ghist_predHist, 1'h0}; // @[SC.scala 374:75]
    REG_171 <= updateValids_1 & updateMetas_1_scMeta_scUsed & _T_1206; // @[SC.scala 321:60]
    REG_172 <= io_update_bits_meta[237]; // @[Tage.scala 577:41]
    REG_173 <= io_update_bits_preds_br_taken_mask_1; // @[SC.scala 321:60 330:27]
    REG_174 <= io_update_bits_meta[222:217]; // @[Tage.scala 577:41]
    REG_175 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_176 <= {io_update_bits_ghist_predHist, 1'h0}; // @[SC.scala 374:75]
    REG_177 <= updateValids_1 & updateMetas_1_scMeta_scUsed & _T_1206; // @[SC.scala 321:60]
    REG_178 <= io_update_bits_meta[237]; // @[Tage.scala 577:41]
    REG_179 <= io_update_bits_preds_br_taken_mask_1; // @[SC.scala 321:60 330:27]
    REG_180 <= io_update_bits_meta[228:223]; // @[Tage.scala 577:41]
    REG_181 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_182 <= {io_update_bits_ghist_predHist, 1'h0}; // @[SC.scala 374:75]
    REG_183 <= updateValids_1 & updateMetas_1_scMeta_scUsed & _T_1206; // @[SC.scala 321:60]
    REG_184 <= io_update_bits_meta[237]; // @[Tage.scala 577:41]
    REG_185 <= io_update_bits_preds_br_taken_mask_1; // @[SC.scala 321:60 330:27]
    REG_186 <= io_update_bits_meta[234:229]; // @[Tage.scala 577:41]
    REG_187 <= io_update_bits_pc; // @[SC.scala 373:52]
    REG_188 <= {io_update_bits_ghist_predHist, 1'h0}; // @[SC.scala 374:75]
    REG_189 <= updateMetas_1_provider_valid + updateMetas_0_provider_valid; // @[SC.scala 394:70]
    REG_190 <= update_on_mispred_0 + update_on_mispred_1; // @[Bitwise.scala 47:55]
    REG_191 <= update_on_unconf_0 + update_on_unconf_1; // @[Bitwise.scala 47:55]
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
  s2_tageTakens_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s2_tageTakens_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s2_provideds_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s2_provideds_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s2_providers_1 = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  s2_providers_0 = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  s2_finalAltPreds_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_finalAltPreds_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s2_providerUs_0 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  s2_providerUs_1 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  s2_providerCtrs_0 = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  s2_providerCtrs_1 = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  s2_prednums_1 = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  s2_prednums_0 = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  s2_altprednums_1 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  s2_altprednums_0 = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  s2_predcnts_0 = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  s2_predcnts_1 = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  s2_altpredcnts_0 = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  s2_altpredcnts_1 = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  s2_altpredhits_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  s2_altpredhits_1 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  s2_basecnts_0 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  s2_basecnts_1 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  r_6_0 = _RAND_24[5:0];
  _RAND_25 = {1{`RANDOM}};
  r_6_1 = _RAND_25[5:0];
  _RAND_26 = {1{`RANDOM}};
  r_6_2 = _RAND_26[5:0];
  _RAND_27 = {1{`RANDOM}};
  r_6_3 = _RAND_27[5:0];
  _RAND_28 = {1{`RANDOM}};
  r_6_4 = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  r_6_5 = _RAND_29[5:0];
  _RAND_30 = {1{`RANDOM}};
  r_10_0 = _RAND_30[5:0];
  _RAND_31 = {1{`RANDOM}};
  r_10_1 = _RAND_31[5:0];
  _RAND_32 = {1{`RANDOM}};
  r_10_2 = _RAND_32[5:0];
  _RAND_33 = {1{`RANDOM}};
  r_10_3 = _RAND_33[5:0];
  _RAND_34 = {1{`RANDOM}};
  r_10_4 = _RAND_34[5:0];
  _RAND_35 = {1{`RANDOM}};
  r_10_5 = _RAND_35[5:0];
  _RAND_36 = {2{`RANDOM}};
  REG = _RAND_36[63:0];
  _RAND_37 = {1{`RANDOM}};
  r_4_1 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  r_4_0 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  r_1 = _RAND_39[7:0];
  _RAND_40 = {2{`RANDOM}};
  REG_1 = _RAND_40[63:0];
  _RAND_41 = {2{`RANDOM}};
  REG_2 = _RAND_41[63:0];
  _RAND_42 = {1{`RANDOM}};
  r_8_1 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  r_8_0 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  r_2 = _RAND_44[7:0];
  _RAND_45 = {2{`RANDOM}};
  REG_3 = _RAND_45[63:0];
  _RAND_46 = {9{`RANDOM}};
  r = _RAND_46[269:0];
  _RAND_47 = {1{`RANDOM}};
  REG_4 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  REG_5 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  REG_6 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  REG_7 = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  REG_8 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  REG_9 = _RAND_52[1:0];
  _RAND_53 = {2{`RANDOM}};
  REG_10 = _RAND_53[38:0];
  _RAND_54 = {2{`RANDOM}};
  REG_11 = _RAND_54[63:0];
  _RAND_55 = {1{`RANDOM}};
  REG_13 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  REG_14 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  REG_15 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  REG_16 = _RAND_58[2:0];
  _RAND_59 = {1{`RANDOM}};
  REG_17 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  REG_18 = _RAND_60[1:0];
  _RAND_61 = {2{`RANDOM}};
  REG_19 = _RAND_61[38:0];
  _RAND_62 = {2{`RANDOM}};
  REG_20 = _RAND_62[63:0];
  _RAND_63 = {1{`RANDOM}};
  REG_22 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  REG_23 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  REG_24 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  REG_25 = _RAND_66[2:0];
  _RAND_67 = {1{`RANDOM}};
  REG_26 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  REG_27 = _RAND_68[1:0];
  _RAND_69 = {2{`RANDOM}};
  REG_28 = _RAND_69[38:0];
  _RAND_70 = {2{`RANDOM}};
  REG_29 = _RAND_70[63:0];
  _RAND_71 = {1{`RANDOM}};
  REG_31 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  REG_32 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  REG_33 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  REG_34 = _RAND_74[2:0];
  _RAND_75 = {1{`RANDOM}};
  REG_35 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  REG_36 = _RAND_76[1:0];
  _RAND_77 = {2{`RANDOM}};
  REG_37 = _RAND_77[38:0];
  _RAND_78 = {2{`RANDOM}};
  REG_38 = _RAND_78[63:0];
  _RAND_79 = {1{`RANDOM}};
  REG_40 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  REG_41 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  REG_42 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  REG_43 = _RAND_82[2:0];
  _RAND_83 = {1{`RANDOM}};
  REG_44 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  REG_45 = _RAND_84[1:0];
  _RAND_85 = {2{`RANDOM}};
  REG_46 = _RAND_85[38:0];
  _RAND_86 = {2{`RANDOM}};
  REG_47 = _RAND_86[63:0];
  _RAND_87 = {1{`RANDOM}};
  REG_49 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  REG_50 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  REG_51 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  REG_52 = _RAND_90[2:0];
  _RAND_91 = {1{`RANDOM}};
  REG_53 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  REG_54 = _RAND_92[1:0];
  _RAND_93 = {2{`RANDOM}};
  REG_55 = _RAND_93[38:0];
  _RAND_94 = {2{`RANDOM}};
  REG_56 = _RAND_94[63:0];
  _RAND_95 = {1{`RANDOM}};
  REG_58 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  REG_59 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  REG_60 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  REG_61 = _RAND_98[2:0];
  _RAND_99 = {1{`RANDOM}};
  REG_62 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  REG_63 = _RAND_100[1:0];
  _RAND_101 = {2{`RANDOM}};
  REG_64 = _RAND_101[38:0];
  _RAND_102 = {3{`RANDOM}};
  REG_65 = _RAND_102[64:0];
  _RAND_103 = {1{`RANDOM}};
  REG_67 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  REG_68 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  REG_69 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  REG_70 = _RAND_106[2:0];
  _RAND_107 = {1{`RANDOM}};
  REG_71 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  REG_72 = _RAND_108[1:0];
  _RAND_109 = {2{`RANDOM}};
  REG_73 = _RAND_109[38:0];
  _RAND_110 = {3{`RANDOM}};
  REG_74 = _RAND_110[64:0];
  _RAND_111 = {1{`RANDOM}};
  REG_76 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  REG_77 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  REG_78 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  REG_79 = _RAND_114[2:0];
  _RAND_115 = {1{`RANDOM}};
  REG_80 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  REG_81 = _RAND_116[1:0];
  _RAND_117 = {2{`RANDOM}};
  REG_82 = _RAND_117[38:0];
  _RAND_118 = {3{`RANDOM}};
  REG_83 = _RAND_118[64:0];
  _RAND_119 = {1{`RANDOM}};
  REG_85 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  REG_86 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  REG_87 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  REG_88 = _RAND_122[2:0];
  _RAND_123 = {1{`RANDOM}};
  REG_89 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  REG_90 = _RAND_124[1:0];
  _RAND_125 = {2{`RANDOM}};
  REG_91 = _RAND_125[38:0];
  _RAND_126 = {3{`RANDOM}};
  REG_92 = _RAND_126[64:0];
  _RAND_127 = {1{`RANDOM}};
  REG_94 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  REG_95 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  REG_96 = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  REG_97 = _RAND_130[2:0];
  _RAND_131 = {1{`RANDOM}};
  REG_98 = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  REG_99 = _RAND_132[1:0];
  _RAND_133 = {2{`RANDOM}};
  REG_100 = _RAND_133[38:0];
  _RAND_134 = {3{`RANDOM}};
  REG_101 = _RAND_134[64:0];
  _RAND_135 = {1{`RANDOM}};
  REG_103 = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  REG_104 = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  REG_105 = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  REG_106 = _RAND_138[2:0];
  _RAND_139 = {1{`RANDOM}};
  REG_107 = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  REG_108 = _RAND_140[1:0];
  _RAND_141 = {2{`RANDOM}};
  REG_109 = _RAND_141[38:0];
  _RAND_142 = {3{`RANDOM}};
  REG_110 = _RAND_142[64:0];
  _RAND_143 = {2{`RANDOM}};
  REG_112_bits_pc = _RAND_143[38:0];
  _RAND_144 = {1{`RANDOM}};
  REG_112_bits_preds_br_taken_mask_0 = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  REG_112_bits_preds_br_taken_mask_1 = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  REG_112_bits_ftb_entry_brSlots_0_valid = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  REG_112_bits_ftb_entry_tailSlot_sharing = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  REG_112_bits_ftb_entry_tailSlot_valid = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  REG_113 = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  REG_114_0 = _RAND_150[1:0];
  _RAND_151 = {1{`RANDOM}};
  REG_114_1 = _RAND_151[1:0];
  _RAND_152 = {1{`RANDOM}};
  REG_115_ctr = _RAND_152[4:0];
  _RAND_153 = {1{`RANDOM}};
  REG_115_thres = _RAND_153[7:0];
  _RAND_154 = {1{`RANDOM}};
  REG_116_ctr = _RAND_154[4:0];
  _RAND_155 = {1{`RANDOM}};
  REG_116_thres = _RAND_155[7:0];
  _RAND_156 = {1{`RANDOM}};
  r_3_0 = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  r_3_1 = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  r_7_0 = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  r_7_1 = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  REG_117 = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  REG_118 = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  REG_119 = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  REG_120 = _RAND_163[5:0];
  _RAND_164 = {2{`RANDOM}};
  REG_121 = _RAND_164[38:0];
  _RAND_165 = {1{`RANDOM}};
  REG_123 = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  REG_124 = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  REG_125 = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  REG_126 = _RAND_168[5:0];
  _RAND_169 = {2{`RANDOM}};
  REG_127 = _RAND_169[38:0];
  _RAND_170 = {2{`RANDOM}};
  REG_128 = _RAND_170[63:0];
  _RAND_171 = {1{`RANDOM}};
  REG_129 = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  REG_130 = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  REG_131 = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  REG_132 = _RAND_174[5:0];
  _RAND_175 = {2{`RANDOM}};
  REG_133 = _RAND_175[38:0];
  _RAND_176 = {2{`RANDOM}};
  REG_134 = _RAND_176[63:0];
  _RAND_177 = {1{`RANDOM}};
  REG_135 = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  REG_136 = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  REG_137 = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  REG_138 = _RAND_180[5:0];
  _RAND_181 = {2{`RANDOM}};
  REG_139 = _RAND_181[38:0];
  _RAND_182 = {2{`RANDOM}};
  REG_140 = _RAND_182[63:0];
  _RAND_183 = {1{`RANDOM}};
  REG_141 = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  REG_142 = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  REG_143 = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  REG_144 = _RAND_186[5:0];
  _RAND_187 = {2{`RANDOM}};
  REG_145 = _RAND_187[38:0];
  _RAND_188 = {2{`RANDOM}};
  REG_146 = _RAND_188[63:0];
  _RAND_189 = {1{`RANDOM}};
  REG_147 = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  REG_148 = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  REG_149 = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  REG_150 = _RAND_192[5:0];
  _RAND_193 = {2{`RANDOM}};
  REG_151 = _RAND_193[38:0];
  _RAND_194 = {2{`RANDOM}};
  REG_152 = _RAND_194[63:0];
  _RAND_195 = {1{`RANDOM}};
  REG_153 = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  REG_154 = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  REG_155 = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  REG_156 = _RAND_198[5:0];
  _RAND_199 = {2{`RANDOM}};
  REG_157 = _RAND_199[38:0];
  _RAND_200 = {1{`RANDOM}};
  REG_159 = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  REG_160 = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  REG_161 = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  REG_162 = _RAND_203[5:0];
  _RAND_204 = {2{`RANDOM}};
  REG_163 = _RAND_204[38:0];
  _RAND_205 = {3{`RANDOM}};
  REG_164 = _RAND_205[64:0];
  _RAND_206 = {1{`RANDOM}};
  REG_165 = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  REG_166 = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  REG_167 = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  REG_168 = _RAND_209[5:0];
  _RAND_210 = {2{`RANDOM}};
  REG_169 = _RAND_210[38:0];
  _RAND_211 = {3{`RANDOM}};
  REG_170 = _RAND_211[64:0];
  _RAND_212 = {1{`RANDOM}};
  REG_171 = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  REG_172 = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  REG_173 = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  REG_174 = _RAND_215[5:0];
  _RAND_216 = {2{`RANDOM}};
  REG_175 = _RAND_216[38:0];
  _RAND_217 = {3{`RANDOM}};
  REG_176 = _RAND_217[64:0];
  _RAND_218 = {1{`RANDOM}};
  REG_177 = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  REG_178 = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  REG_179 = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  REG_180 = _RAND_221[5:0];
  _RAND_222 = {2{`RANDOM}};
  REG_181 = _RAND_222[38:0];
  _RAND_223 = {3{`RANDOM}};
  REG_182 = _RAND_223[64:0];
  _RAND_224 = {1{`RANDOM}};
  REG_183 = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  REG_184 = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  REG_185 = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  REG_186 = _RAND_227[5:0];
  _RAND_228 = {2{`RANDOM}};
  REG_187 = _RAND_228[38:0];
  _RAND_229 = {3{`RANDOM}};
  REG_188 = _RAND_229[64:0];
  _RAND_230 = {1{`RANDOM}};
  REG_189 = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  REG_190 = _RAND_231[1:0];
  _RAND_232 = {1{`RANDOM}};
  REG_191 = _RAND_232[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule