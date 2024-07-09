// Generator : scripts/build.py
// Toplevel : ysyx_210479
// Prefix : ysyx_210479_
// Git hash  : b0f246bd77fa64660459ce3c7d819036db0f8d60

module ysyx_210479_bpu
#(
   parameter                                    CONFIG_PHT_P_NUM = 0,
   parameter                                    CONFIG_BTB_P_NUM = 0,
   parameter                                    CONFIG_AW = 0,
   parameter                                    CONFIG_P_FETCH_WIDTH = 0
)
(
   input                                        clk,
   input                                        rst,
   input                                        re,
   input [(1<<CONFIG_P_FETCH_WIDTH)-1:0]        valid,
   input                                        msr_psr_imme,
   input [(CONFIG_AW-2 )*(1<<CONFIG_P_FETCH_WIDTH)-1:0]  pc,
   output [(CONFIG_AW-2 )*(1<<CONFIG_P_FETCH_WIDTH)-1:0] npc,
   output [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_FETCH_WIDTH)-1:0] upd,
   input                                        bpu_wb,
   input                                        bpu_wb_is_bcc,
   input                                        bpu_wb_is_breg,
   input                                        bpu_wb_is_brel,
   input                                        bpu_wb_taken,
   input [(CONFIG_AW-2 )-1:CONFIG_BTB_P_NUM]             bpu_wb_pc,
   input [(CONFIG_AW-2 )-1:0]                            bpu_wb_npc_act,
   input [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:((CONFIG_AW-2 ) + 1)]    bpu_wb_upd_partial
);
   localparam PHT_DW                            = 2; 
   localparam BTB_DW                            = (1 + 1 + CONFIG_AW-CONFIG_BTB_P_NUM-2 + (CONFIG_AW-2 ) + 1); 
   wire [(CONFIG_AW-2 )-1:0]                             s1i_pc         [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire [(1<<CONFIG_P_FETCH_WIDTH)*CONFIG_PHT_P_NUM-1:0] s1i_pht_addr;
   wire [(1<<CONFIG_P_FETCH_WIDTH)*CONFIG_BTB_P_NUM-1:0] s1i_btb_addr;
   wire                                         s1o_msr_psr_imme;
   wire [(CONFIG_AW-2 )-1:0]                             s1o_pc         [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire [CONFIG_PHT_P_NUM-1:0]                  s1o_pht_addr   [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire [CONFIG_BTB_P_NUM-1:0]                  s1o_btb_addr   [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire [(1<<CONFIG_P_FETCH_WIDTH)*PHT_DW-1:0]  s1o_pht_count;
   wire [PHT_DW-1:0]                            s2i_pht_count  [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire                                         s2i_pht_taken  [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire [(1<<CONFIG_P_FETCH_WIDTH)*BTB_DW-1:0]  s1o_btb_data;
   wire                                         s2i_btb_v      [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire                                         s2i_btb_is_bcc [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire [CONFIG_AW-CONFIG_BTB_P_NUM-3:0]        s2i_btb_tag    [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire                                         s2i_btb_imme   [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire [(CONFIG_AW-2 )-1:0]                             s2i_btb_npc    [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire                                         s2i_btb_hit    [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire                                         s2i_taken      [(1<<CONFIG_P_FETCH_WIDTH)-1:0];
   wire [CONFIG_PHT_P_NUM-1:0]                  wb_pht_addr;
   wire [CONFIG_BTB_P_NUM-1:0]                  wb_btb_addr;
   wire                                         wb_imme;
   wire [PHT_DW-1:0]                            wb_pht_count_org;
   wire                                         wb_pht_we;
   reg [PHT_DW-1:0]                             wb_pht_din;
   wire                                         wb_btb_we;
   wire [BTB_DW-1:0]                            wb_btb_din;
   wire [CONFIG_PHT_P_NUM-1:0]                  GHSR_ff;
   wire [CONFIG_PHT_P_NUM-1:0]                  GHSR_nxt;
   genvar i;
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s1o_msr_psr_imme (.CLK(clk),.RST(rst), .LOAD(re), .D(msr_psr_imme), .Q(s1o_msr_psr_imme) );
   generate for(i=0;i<(1<<CONFIG_P_FETCH_WIDTH);i=i+1)
      begin : gen_fw
         ysyx_210479_mDFF_lr #(.DW((CONFIG_AW-2 ))) ff_s1o_pc (.CLK(clk),.RST(rst), .LOAD(re), .D(s1i_pc[i]), .Q(s1o_pc[i]) );
         ysyx_210479_mDFF_lr #(.DW(CONFIG_PHT_P_NUM)) ff_s1o_pht_addr (.CLK(clk),.RST(rst), .LOAD(re), .D(s1i_pht_addr[i*CONFIG_PHT_P_NUM +: CONFIG_PHT_P_NUM]), .Q(s1o_pht_addr[i]) );
         ysyx_210479_mDFF_lr #(.DW(CONFIG_BTB_P_NUM)) ff_s1o_btb_addr (.CLK(clk),.RST(rst), .LOAD(re), .D(s1i_btb_addr[i*CONFIG_BTB_P_NUM +: CONFIG_BTB_P_NUM]), .Q(s1o_btb_addr[i]) );
         assign s1i_pc[i] = pc[i*(CONFIG_AW-2 ) +: (CONFIG_AW-2 )];
         assign s1i_pht_addr[i*CONFIG_PHT_P_NUM +: CONFIG_PHT_P_NUM] = s1i_pc[i][CONFIG_PHT_P_NUM-1:0] ^ GHSR_ff;
         assign s1i_btb_addr[i*CONFIG_BTB_P_NUM +: CONFIG_BTB_P_NUM] = s1i_pc[i][CONFIG_BTB_P_NUM-1:0];
         assign s2i_pht_count[i] = s1o_pht_count[i*PHT_DW +: PHT_DW];
         assign s2i_pht_taken[i] = s2i_pht_count[i][PHT_DW-1];
         assign {s2i_btb_imme[i], s2i_btb_npc[i], s2i_btb_tag[i], s2i_btb_is_bcc[i], s2i_btb_v[i]} = s1o_btb_data[i*BTB_DW +: BTB_DW];
         assign s2i_btb_hit[i] = (s2i_btb_v[i] & (s2i_btb_tag[i] == s1o_pc[i][(CONFIG_AW-2 )-1:CONFIG_BTB_P_NUM]) & (s2i_btb_imme[i] == s1o_msr_psr_imme));
         assign s2i_taken[i] = (valid[i] & (s2i_btb_hit[i] & (~s2i_btb_is_bcc[i] | s2i_pht_taken[i])));
         assign npc[i*(CONFIG_AW-2 ) +: (CONFIG_AW-2 )] = s2i_btb_npc[i];
         assign upd[i*(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) +: (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)] = {s1o_pht_count[i*PHT_DW +: PHT_DW], s1o_pht_addr[i], s1o_btb_addr[i], s1o_msr_psr_imme, s2i_btb_npc[i], s2i_taken[i]};
      end
   endgenerate
   ysyx_210479_mRF_nwnr_r
      #(
         .DW         (PHT_DW),
         .AW         (CONFIG_PHT_P_NUM),
         .NUM_READ   (1<<CONFIG_P_FETCH_WIDTH),
         .NUM_WRITE  (1)
      )
   U_PHT
      (
         .CLK        (clk),
         .RST        (rst),
         .RE         ({(1<<CONFIG_P_FETCH_WIDTH){re}}),
         .RADDR      (s1i_pht_addr),
         .RDATA      (s1o_pht_count),
         .WE         (wb_btb_we),
         .WADDR      (wb_pht_addr),
         .WDATA      (wb_pht_din)
      );
   ysyx_210479_mRF_nwnr_r
      #(
         .DW         (BTB_DW),
         .AW         (CONFIG_BTB_P_NUM),
         .NUM_READ   (1<<CONFIG_P_FETCH_WIDTH),
         .NUM_WRITE  (1)
      )
   U_BTB
      (
         .CLK        (clk),
         .RST        (rst),
         .RE         ({((1<<CONFIG_P_FETCH_WIDTH)){re}}),
         .RADDR      (s1i_btb_addr),
         .RDATA      (s1o_btb_data),
         .WE         (wb_btb_we),
         .WADDR      (wb_btb_addr),
         .WDATA      (wb_btb_din)
      );
   assign {wb_pht_count_org, wb_pht_addr, wb_btb_addr, wb_imme} = bpu_wb_upd_partial[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:((CONFIG_AW-2 ) + 1)];
   assign wb_pht_we = (bpu_wb & bpu_wb_is_bcc);
   always @(*)
      if (bpu_wb_taken)
         wb_pht_din = (wb_pht_count_org == 2'b11)
                        ? 2'b11
                        : wb_pht_count_org + 'b1;
      else
         wb_pht_din =  (wb_pht_count_org == 2'b00)
                        ? 2'b00
                        : wb_pht_count_org - 'b1;
   assign wb_btb_we = (bpu_wb & (bpu_wb_is_breg | bpu_wb_is_brel));
   assign wb_btb_din = {wb_imme, bpu_wb_npc_act, bpu_wb_pc, bpu_wb_is_bcc, 1'b1};
   assign GHSR_nxt = wb_pht_we ? {GHSR_ff[CONFIG_PHT_P_NUM-2:0], bpu_wb_taken}: GHSR_ff;
   ysyx_210479_mDFF_lr #(.DW(CONFIG_PHT_P_NUM)) ff_GHSR (.CLK(clk), .RST(rst), .LOAD(wb_pht_we), .D(GHSR_nxt), .Q(GHSR_ff) );
endmodule
module ysyx_210479_cmt
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_P_DW = 0,
   parameter                           CONFIG_P_ISSUE_WIDTH = 0,
   parameter                           CONFIG_P_COMMIT_WIDTH = 0,
   parameter                           CONFIG_PHT_P_NUM = 0,
   parameter                           CONFIG_BTB_P_NUM = 0,
   parameter                           CONFIG_NUM_IRQ = 0,
   parameter                           CONFIG_DC_P_WAYS = 0,
   parameter                           CONFIG_DC_P_SETS = 0,
   parameter                           CONFIG_DC_P_LINE = 0,
   parameter                           CONFIG_IC_P_SETS = 0,
   parameter                           CONFIG_IC_P_LINE = 0,
   parameter                           CONFIG_P_PAGE_SIZE = 0,
   parameter                           CONFIG_DMMU_ENABLE_UNCACHED_SEG = 0,
   parameter                           CONFIG_ITLB_P_SETS = 0,
   parameter                           CONFIG_DTLB_P_SETS = 0,
   parameter [8-1:0]        CONFIG_EITM_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EIPF_VECTOR = 0,
   parameter [8-1:0]        CONFIG_ESYSCALL_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EINSN_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EIRQ_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EDTM_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EDPF_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EALIGN_VECTOR = 0,
   parameter                           AXI_P_DW_BYTES    = 0,
   parameter                           AXI_ADDR_WIDTH    = 0,
   parameter                           AXI_ID_WIDTH      = 0,
   parameter                           AXI_USER_WIDTH    = 0
)
(
   input                               clk,
   input                               rst,
   output                              flush,
   output [(CONFIG_AW-2 )-1:0]                  flush_tgt,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_valid,
   input [2*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_epu_opc_bus,
   input [7*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_lsu_opc_bus,
   input [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_bpu_upd,
   input [(CONFIG_AW-2 )*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_pc,
   input [6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_prd,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_prd_we,
   input [6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_pfree,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] cmt_is_bcc,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] cmt_is_brel,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] cmt_is_breg,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_fls,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_exc,
   input [CONFIG_DW*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_opera,
   input [CONFIG_DW*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_operb,
   input [(CONFIG_AW-2 )*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_fls_tgt,
   output [CONFIG_P_COMMIT_WIDTH:0]     cmt_pop_size,
   output [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_fire,
   output                              prf_WE_lsu_epu,
   output [6-1:0]           prf_WADDR_lsu_epu,
   output [CONFIG_DW-1:0]              prf_WDATA_lsu_epu,
   output                              bpu_wb,
   output                              bpu_wb_is_bcc,
   output                              bpu_wb_is_breg,
   output                              bpu_wb_is_brel,
   output                              bpu_wb_taken,
   output [(CONFIG_AW-2 )-1:CONFIG_BTB_P_NUM]   bpu_wb_pc,
   output [(CONFIG_AW-2 )-1:0]                  bpu_wb_npc_act,
   output [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:((CONFIG_AW-2 ) + 1)] bpu_wb_upd_partial,
   input                               dbus_ARREADY,
   output                              dbus_ARVALID,
   output [AXI_ADDR_WIDTH-1:0]         dbus_ARADDR,
   output [2:0]                        dbus_ARPROT,
   output [AXI_ID_WIDTH-1:0]           dbus_ARID,
   output [AXI_USER_WIDTH-1:0]         dbus_ARUSER,
   output [7:0]                        dbus_ARLEN,
   output [2:0]                        dbus_ARSIZE,
   output [1:0]                        dbus_ARBURST,
   output                              dbus_ARLOCK,
   output [3:0]                        dbus_ARCACHE,
   output [3:0]                        dbus_ARQOS,
   output [3:0]                        dbus_ARREGION,
   output                              dbus_RREADY,
   input                               dbus_RVALID,
   input  [(1<<AXI_P_DW_BYTES)*8-1:0]  dbus_RDATA,
   input  [1:0]                        dbus_RRESP,
   input                               dbus_RLAST,
   input  [AXI_ID_WIDTH-1:0]           dbus_RID,
   input  [AXI_USER_WIDTH-1:0]         dbus_RUSER,
   input                               dbus_AWREADY,
   output                              dbus_AWVALID,
   output [AXI_ADDR_WIDTH-1:0]         dbus_AWADDR,
   output [2:0]                        dbus_AWPROT,
   output [AXI_ID_WIDTH-1:0]           dbus_AWID,
   output [AXI_USER_WIDTH-1:0]         dbus_AWUSER,
   output [7:0]                        dbus_AWLEN,
   output [2:0]                        dbus_AWSIZE,
   output [1:0]                        dbus_AWBURST,
   output                              dbus_AWLOCK,
   output [3:0]                        dbus_AWCACHE,
   output [3:0]                        dbus_AWQOS,
   output [3:0]                        dbus_AWREGION,
   input                               dbus_WREADY,
   output                              dbus_WVALID,
   output [(1<<AXI_P_DW_BYTES)*8-1:0]  dbus_WDATA,
   output [(1<<AXI_P_DW_BYTES)-1:0]    dbus_WSTRB,
   output                              dbus_WLAST,
   output [AXI_USER_WIDTH-1:0]         dbus_WUSER,
   output                              dbus_BREADY,
   input                               dbus_BVALID,
   input [1:0]                         dbus_BRESP,
   input [AXI_ID_WIDTH-1:0]            dbus_BID,
   input [AXI_USER_WIDTH-1:0]          dbus_BUSER,
   input [CONFIG_NUM_IRQ-1:0]          irqs,
   output                              irq_async,
   output                              tsc_irq,
   output                              msr_psr_imme,
   output                              msr_psr_rm,
   output                              msr_psr_ice,
   input [CONFIG_DW-1:0]               msr_immid,
   output [CONFIG_ITLB_P_SETS-1:0]     msr_imm_tlbl_idx,
   output [CONFIG_DW-1:0]              msr_imm_tlbl_nxt,
   output                              msr_imm_tlbl_we,
   output [CONFIG_ITLB_P_SETS-1:0]     msr_imm_tlbh_idx,
   output [CONFIG_DW-1:0]              msr_imm_tlbh_nxt,
   output                              msr_imm_tlbh_we,
   input [CONFIG_DW-1:0]               msr_icid,
   output [CONFIG_IC_P_SETS-1:0]       msr_icinv_line_nxt,
   output                              msr_icinv_we,
   input                               msr_icinv_ready
);
   localparam CW                       = (1<<CONFIG_P_COMMIT_WIDTH);
   localparam [1:0]                    S_IDLE = 2'b01;
   localparam [1:0]                    S_PENDING = 2'b10;
   wire [CONFIG_DW-1:0] epu_wb_dout;            
   wire                 epu_wb_dout_sel;        
   wire                 epu_wb_valid;           
   wire                 exc_flush;              
   wire [(CONFIG_AW-2 )-1:0]     exc_flush_tgt;          
   wire                 lsu_EALIGN;             
   wire                 lsu_EDPF;               
   wire                 lsu_EDTM;               
   wire                 lsu_stall_req;          
   wire [CONFIG_AW-1:0] lsu_vaddr;              
   wire [CONFIG_DW-1:0] lsu_wb_dout;            
   wire                 lsu_wb_valid;           
   wire [CONFIG_DW-1:0] msr_coreid;             
   wire [CONFIG_DW-1:0] msr_cpuid;              
   wire [CONFIG_DW-1:0] msr_dcfls_nxt;          
   wire                 msr_dcfls_we;           
   wire [CONFIG_DW-1:0] msr_dcid;               
   wire [CONFIG_DW-1:0] msr_dcinv_nxt;          
   wire                 msr_dcinv_we;           
   wire [CONFIG_DTLB_P_SETS-1:0] msr_dmm_tlbh_idx;
   wire [CONFIG_DW-1:0] msr_dmm_tlbh_nxt;       
   wire                 msr_dmm_tlbh_we;        
   wire [CONFIG_DTLB_P_SETS-1:0] msr_dmm_tlbl_idx;
   wire [CONFIG_DW-1:0] msr_dmm_tlbl_nxt;       
   wire                 msr_dmm_tlbl_we;        
   wire [CONFIG_DW-1:0] msr_dmmid;              
   wire [CONFIG_DW-1:0] msr_elsa;               
   wire [CONFIG_DW-1:0] msr_elsa_nxt;           
   wire                 msr_elsa_we;            
   wire [CONFIG_DW-1:0] msr_epc;                
   wire [CONFIG_DW-1:0] msr_epc_nxt;            
   wire                 msr_epc_we;             
   wire [10-1:0] msr_epsr;            
   wire [10-1:0] msr_epsr_nxt;        
   wire                 msr_epsr_we;            
   wire [CONFIG_DW-1:8] msr_evect;   
   wire [CONFIG_AW-1:8] msr_evect_nxt;
   wire                 msr_evect_we;           
   wire [10-1:0] msr_psr;             
   wire                 msr_psr_dce;            
   wire                 msr_psr_dce_nxt;        
   wire                 msr_psr_dce_we;         
   wire                 msr_psr_dmme;           
   wire                 msr_psr_dmme_nxt;       
   wire                 msr_psr_dmme_we;        
   wire                 msr_psr_ice_nxt;        
   wire                 msr_psr_ice_we;         
   wire                 msr_psr_imme_nxt;       
   wire                 msr_psr_imme_we;        
   wire                 msr_psr_ire;            
   wire                 msr_psr_ire_nxt;        
   wire                 msr_psr_ire_we;         
   wire                 msr_psr_restore;        
   wire                 msr_psr_rm_nxt;         
   wire                 msr_psr_rm_we;          
   wire                 msr_psr_save;           
   wire [CONFIG_DW*4-1:0] msr_sr;    
   wire [CONFIG_DW-1:0] msr_sr_nxt;             
   wire [4-1:0] msr_sr_we;           
   wire                 refetch;                
   wire                                p_ce_s1;
   wire                                p_ce_s2;
   wire                                p_ce_s3;
   wire                                p_ce_s1_no_icinv_stall;
   wire                                icinv_stall_req;
   wire                                cmt_ce;
   wire [CW-1:0]                       lsu_req;
   wire                                lsu_req_valid;
   wire [CW-1:0]                       epu_req;
   wire                                epu_req_valid;
   wire                                pipe_req;
   wire                                pipe_finish;
   wire [CW-1:0]                       single_fu;
   reg [CW-1:0]                        cmt_mask;
   wire [(CONFIG_AW-2 )-1:0]                    cmt_npc_0;
   wire [CW-1:0]                       cmt_b;
   wire [1:0]                          fsm_state_ff;
   reg [1:0]                           fsm_state_nxt;
   wire [CW-1:0]                       cmt_ready_2_fire;
   wire                                s1i_se_fls;
   wire [(CONFIG_AW-2 )-1:0]                    s1i_se_tgt;
   wire                                s1o_se_fls;
   wire [(CONFIG_AW-2 )-1:0]                    s1o_se_tgt;
   genvar i;
   integer j;
   ysyx_210479_mADD
      #(.DW((CONFIG_AW-2 )))
   U_NPC
      (
         .a                   (cmt_pc[0 * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )]),
         .b                   ({{(CONFIG_AW-2 )-1{1'b0}}, 1'b1}),
         .s                   (1'b0),
         .sum                 (cmt_npc_0)
      );
   generate for(i=0;i<CW;i=i+1)
      begin : gen_req
         assign lsu_req[i] = (~s1o_se_fls & (|cmt_lsu_opc_bus[i * 7 +: 7]));
         assign epu_req[i] = (~s1o_se_fls & ((|cmt_epu_opc_bus[i * 2 +: 2]) |
                              cmt_exc[i]));
         assign cmt_b[i] = (cmt_is_bcc[i] | cmt_is_breg[i] | cmt_is_brel[i]);
      end
   endgenerate
   assign single_fu = (lsu_req | epu_req | cmt_fls | cmt_b);
   assign flush = (s1o_se_fls | exc_flush);
   assign flush_tgt = (s1o_se_fls)
                        ? s1o_se_tgt
                        : exc_flush_tgt  ;
   always @(*)
      begin
         fsm_state_nxt = fsm_state_ff;
         case(fsm_state_ff)
            S_IDLE:
               if (pipe_req & p_ce_s1)
                  fsm_state_nxt = S_PENDING;
            S_PENDING:
               if (pipe_finish)
                  fsm_state_nxt = S_IDLE;
            default:
               fsm_state_nxt = fsm_state_ff;
         endcase
      end
   ysyx_210479_mDFF_r #(.DW(2), .RST_VECTOR(S_IDLE)) ff_fsm_state_ff (.CLK(clk), .RST(rst), .D(fsm_state_nxt), .Q(fsm_state_ff) );
   assign s1i_se_fls = (cmt_fls[0] | refetch) & ~s1o_se_fls;
   assign s1i_se_tgt = (cmt_fls[0])
                           ? cmt_fls_tgt[0 * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )]
                           : cmt_npc_0 ;
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s1o_se_fls (.CLK(clk), .RST(rst), .LOAD(cmt_fire[0]|s1o_se_fls), .D(s1i_se_fls), .Q(s1o_se_fls) );
   ysyx_210479_mDFF_lr #(.DW((CONFIG_AW-2 ))) ff_s1o_se_tgt (.CLK(clk),.RST(rst), .LOAD(cmt_fire[0]), .D(s1i_se_tgt), .Q(s1o_se_tgt) );
   assign cmt_ce = (~pipe_req | pipe_finish);
   always @(*)
      begin
         cmt_mask[0] = 1'b1;
         cmt_mask[1] = ~single_fu[0] & ~single_fu[1];
         for(j=2;j<CW;j=j+1)
            cmt_mask[j] = cmt_mask[j-1] & ~single_fu[j];
      end
   assign cmt_ready_2_fire = (cmt_valid & cmt_mask);
   assign cmt_fire = (cmt_ready_2_fire & {CW{cmt_ce & ~flush}});
   assign pipe_req = (cmt_ready_2_fire[0] & (lsu_req[0] | epu_req[0]));
   assign lsu_req_valid = ((fsm_state_ff==S_IDLE) & cmt_ready_2_fire[0] & (lsu_req[0] | epu_req[0]));
   assign epu_req_valid = ((fsm_state_ff==S_IDLE) & cmt_ready_2_fire[0] & epu_req[0]);
   ysyx_210479_popcnt #(.DW(CW), .P_DW(CONFIG_P_COMMIT_WIDTH)) U_CLO (.bitmap(cmt_fire), .count(cmt_pop_size) );
   ysyx_210479_cmt_lsu
      #(
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_P_DW                    (CONFIG_P_DW),
        .CONFIG_P_PAGE_SIZE             (CONFIG_P_PAGE_SIZE),
        .CONFIG_DMMU_ENABLE_UNCACHED_SEG(CONFIG_DMMU_ENABLE_UNCACHED_SEG),
        .CONFIG_DTLB_P_SETS             (CONFIG_DTLB_P_SETS),
        .CONFIG_DC_P_LINE               (CONFIG_DC_P_LINE),
        .CONFIG_DC_P_SETS               (CONFIG_DC_P_SETS),
        .CONFIG_DC_P_WAYS               (CONFIG_DC_P_WAYS),
        .AXI_P_DW_BYTES                 (AXI_P_DW_BYTES),
        .AXI_ADDR_WIDTH                 (AXI_ADDR_WIDTH),
        .AXI_ID_WIDTH                   (AXI_ID_WIDTH),
        .AXI_USER_WIDTH                 (AXI_USER_WIDTH))
   U_LSU
      (
       .lsu_stall_req                   (lsu_stall_req),
       .dbus_ARVALID                    (dbus_ARVALID),
       .dbus_ARADDR                     (dbus_ARADDR[AXI_ADDR_WIDTH-1:0]),
       .dbus_ARPROT                     (dbus_ARPROT[2:0]),
       .dbus_ARID                       (dbus_ARID[AXI_ID_WIDTH-1:0]),
       .dbus_ARUSER                     (dbus_ARUSER[AXI_USER_WIDTH-1:0]),
       .dbus_ARLEN                      (dbus_ARLEN[7:0]),
       .dbus_ARSIZE                     (dbus_ARSIZE[2:0]),
       .dbus_ARBURST                    (dbus_ARBURST[1:0]),
       .dbus_ARLOCK                     (dbus_ARLOCK),
       .dbus_ARCACHE                    (dbus_ARCACHE[3:0]),
       .dbus_ARQOS                      (dbus_ARQOS[3:0]),
       .dbus_ARREGION                   (dbus_ARREGION[3:0]),
       .dbus_RREADY                     (dbus_RREADY),
       .dbus_AWVALID                    (dbus_AWVALID),
       .dbus_AWADDR                     (dbus_AWADDR[AXI_ADDR_WIDTH-1:0]),
       .dbus_AWPROT                     (dbus_AWPROT[2:0]),
       .dbus_AWID                       (dbus_AWID[AXI_ID_WIDTH-1:0]),
       .dbus_AWUSER                     (dbus_AWUSER[AXI_USER_WIDTH-1:0]),
       .dbus_AWLEN                      (dbus_AWLEN[7:0]),
       .dbus_AWSIZE                     (dbus_AWSIZE[2:0]),
       .dbus_AWBURST                    (dbus_AWBURST[1:0]),
       .dbus_AWLOCK                     (dbus_AWLOCK),
       .dbus_AWCACHE                    (dbus_AWCACHE[3:0]),
       .dbus_AWQOS                      (dbus_AWQOS[3:0]),
       .dbus_AWREGION                   (dbus_AWREGION[3:0]),
       .dbus_WVALID                     (dbus_WVALID),
       .dbus_WDATA                      (dbus_WDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .dbus_WSTRB                      (dbus_WSTRB[(1<<AXI_P_DW_BYTES)-1:0]),
       .dbus_WLAST                      (dbus_WLAST),
       .dbus_WUSER                      (dbus_WUSER[AXI_USER_WIDTH-1:0]),
       .dbus_BREADY                     (dbus_BREADY),
       .lsu_EDTM                        (lsu_EDTM),
       .lsu_EDPF                        (lsu_EDPF),
       .lsu_EALIGN                      (lsu_EALIGN),
       .lsu_vaddr                       (lsu_vaddr[CONFIG_AW-1:0]),
       .lsu_wb_dout                     (lsu_wb_dout[CONFIG_DW-1:0]),
       .lsu_wb_valid                    (lsu_wb_valid),
       .msr_dmmid                       (msr_dmmid[CONFIG_DW-1:0]),
       .msr_dcid                        (msr_dcid[CONFIG_DW-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .p_ce_s1                         (p_ce_s1),
       .p_ce_s2                         (p_ce_s2),
       .p_ce_s3                         (p_ce_s3),
       .cmt_req_valid                   (lsu_req_valid),         
       .cmt_lsu_opc_bus                 (cmt_lsu_opc_bus[7-1:0]),
       .cmt_lsa                         (cmt_opera[0 * CONFIG_DW +: CONFIG_DW]), 
       .cmt_wdat                        (cmt_operb[0 * CONFIG_DW +: CONFIG_DW]), 
       .dbus_ARREADY                    (dbus_ARREADY),
       .dbus_RVALID                     (dbus_RVALID),
       .dbus_RDATA                      (dbus_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .dbus_RRESP                      (dbus_RRESP[1:0]),
       .dbus_RLAST                      (dbus_RLAST),
       .dbus_RID                        (dbus_RID[AXI_ID_WIDTH-1:0]),
       .dbus_RUSER                      (dbus_RUSER[AXI_USER_WIDTH-1:0]),
       .dbus_AWREADY                    (dbus_AWREADY),
       .dbus_WREADY                     (dbus_WREADY),
       .dbus_BVALID                     (dbus_BVALID),
       .dbus_BRESP                      (dbus_BRESP[1:0]),
       .dbus_BID                        (dbus_BID[AXI_ID_WIDTH-1:0]),
       .dbus_BUSER                      (dbus_BUSER[AXI_USER_WIDTH-1:0]),
       .msr_psr_dmme                    (msr_psr_dmme),
       .msr_psr_rm                      (msr_psr_rm),
       .msr_psr_dce                     (msr_psr_dce),
       .msr_dmm_tlbl_idx                (msr_dmm_tlbl_idx[CONFIG_DTLB_P_SETS-1:0]),
       .msr_dmm_tlbl_nxt                (msr_dmm_tlbl_nxt[CONFIG_DW-1:0]),
       .msr_dmm_tlbl_we                 (msr_dmm_tlbl_we),
       .msr_dmm_tlbh_idx                (msr_dmm_tlbh_idx[CONFIG_DTLB_P_SETS-1:0]),
       .msr_dmm_tlbh_nxt                (msr_dmm_tlbh_nxt[CONFIG_DW-1:0]),
       .msr_dmm_tlbh_we                 (msr_dmm_tlbh_we),
       .msr_dcinv_nxt                   (msr_dcinv_nxt[CONFIG_DW-1:0]),
       .msr_dcinv_we                    (msr_dcinv_we),
       .msr_dcfls_nxt                   (msr_dcfls_nxt[CONFIG_DW-1:0]),
       .msr_dcfls_we                    (msr_dcfls_we));
   ysyx_210479_cmt_epu
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_EITM_VECTOR             (CONFIG_EITM_VECTOR[8-1:0]),
        .CONFIG_EIPF_VECTOR             (CONFIG_EIPF_VECTOR[8-1:0]),
        .CONFIG_ESYSCALL_VECTOR         (CONFIG_ESYSCALL_VECTOR[8-1:0]),
        .CONFIG_EINSN_VECTOR            (CONFIG_EINSN_VECTOR[8-1:0]),
        .CONFIG_EIRQ_VECTOR             (CONFIG_EIRQ_VECTOR[8-1:0]),
        .CONFIG_EDTM_VECTOR             (CONFIG_EDTM_VECTOR[8-1:0]),
        .CONFIG_EDPF_VECTOR             (CONFIG_EDPF_VECTOR[8-1:0]),
        .CONFIG_EALIGN_VECTOR           (CONFIG_EALIGN_VECTOR[8-1:0]),
        .CONFIG_ITLB_P_SETS             (CONFIG_ITLB_P_SETS),
        .CONFIG_DTLB_P_SETS             (CONFIG_DTLB_P_SETS),
        .CONFIG_IC_P_SETS               (CONFIG_IC_P_SETS),
        .CONFIG_IC_P_LINE               (CONFIG_IC_P_LINE),
        .CONFIG_NUM_IRQ                 (CONFIG_NUM_IRQ))
   U_EPU
      (
       .epu_wb_dout                     (epu_wb_dout[CONFIG_DW-1:0]),
       .epu_wb_dout_sel                 (epu_wb_dout_sel),
       .epu_wb_valid                    (epu_wb_valid),
       .exc_flush                       (exc_flush),
       .exc_flush_tgt                   (exc_flush_tgt[(CONFIG_AW-2 )-1:0]),
       .refetch                         (refetch),
       .irq_async                       (irq_async),
       .tsc_irq                         (tsc_irq),
       .msr_psr_rm_nxt                  (msr_psr_rm_nxt),
       .msr_psr_rm_we                   (msr_psr_rm_we),
       .msr_psr_imme_nxt                (msr_psr_imme_nxt),
       .msr_psr_imme_we                 (msr_psr_imme_we),
       .msr_psr_dmme_nxt                (msr_psr_dmme_nxt),
       .msr_psr_dmme_we                 (msr_psr_dmme_we),
       .msr_psr_ire_nxt                 (msr_psr_ire_nxt),
       .msr_psr_ire_we                  (msr_psr_ire_we),
       .msr_psr_ice_nxt                 (msr_psr_ice_nxt),
       .msr_psr_ice_we                  (msr_psr_ice_we),
       .msr_psr_dce_nxt                 (msr_psr_dce_nxt),
       .msr_psr_dce_we                  (msr_psr_dce_we),
       .msr_psr_save                    (msr_psr_save),
       .msr_psr_restore                 (msr_psr_restore),
       .msr_epc_nxt                     (msr_epc_nxt[CONFIG_DW-1:0]),
       .msr_epc_we                      (msr_epc_we),
       .msr_epsr_nxt                    (msr_epsr_nxt[10-1:0]),
       .msr_epsr_we                     (msr_epsr_we),
       .msr_elsa_nxt                    (msr_elsa_nxt[CONFIG_DW-1:0]),
       .msr_elsa_we                     (msr_elsa_we),
       .msr_evect_nxt                   (msr_evect_nxt[CONFIG_AW-1:8]),
       .msr_evect_we                    (msr_evect_we),
       .msr_imm_tlbl_idx                (msr_imm_tlbl_idx[CONFIG_ITLB_P_SETS-1:0]),
       .msr_imm_tlbl_nxt                (msr_imm_tlbl_nxt[CONFIG_DW-1:0]),
       .msr_imm_tlbl_we                 (msr_imm_tlbl_we),
       .msr_imm_tlbh_idx                (msr_imm_tlbh_idx[CONFIG_ITLB_P_SETS-1:0]),
       .msr_imm_tlbh_nxt                (msr_imm_tlbh_nxt[CONFIG_DW-1:0]),
       .msr_imm_tlbh_we                 (msr_imm_tlbh_we),
       .msr_dmm_tlbl_idx                (msr_dmm_tlbl_idx[CONFIG_DTLB_P_SETS-1:0]),
       .msr_dmm_tlbl_nxt                (msr_dmm_tlbl_nxt[CONFIG_DW-1:0]),
       .msr_dmm_tlbl_we                 (msr_dmm_tlbl_we),
       .msr_dmm_tlbh_idx                (msr_dmm_tlbh_idx[CONFIG_DTLB_P_SETS-1:0]),
       .msr_dmm_tlbh_nxt                (msr_dmm_tlbh_nxt[CONFIG_DW-1:0]),
       .msr_dmm_tlbh_we                 (msr_dmm_tlbh_we),
       .msr_icinv_line_nxt              (msr_icinv_line_nxt[CONFIG_IC_P_SETS-1:0]),
       .msr_icinv_we                    (msr_icinv_we),
       .msr_dcinv_nxt                   (msr_dcinv_nxt[CONFIG_DW-1:0]),
       .msr_dcinv_we                    (msr_dcinv_we),
       .msr_dcfls_nxt                   (msr_dcfls_nxt[CONFIG_DW-1:0]),
       .msr_dcfls_we                    (msr_dcfls_we),
       .msr_sr_nxt                      (msr_sr_nxt[CONFIG_DW-1:0]),
       .msr_sr_we                       (msr_sr_we[4-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .p_ce_s1                         (p_ce_s1),
       .p_ce_s1_no_icinv_stall          (p_ce_s1_no_icinv_stall),
       .p_ce_s2                         (p_ce_s2),
       .cmt_pc                          (cmt_pc[(CONFIG_AW-2 )-1:0]),
       .cmt_npc                         (cmt_npc_0[(CONFIG_AW-2 )-1:0]),  
       .cmt_req_valid                   (epu_req_valid),         
       .cmt_epu_opc_bus                 (cmt_epu_opc_bus[2-1:0]),
       .cmt_exc                         (cmt_exc[0]),            
       .cmt_fe                          (cmt_opera[6-1:0]), 
       .cmt_addr                        (cmt_opera[CONFIG_DW-1:0]), 
       .cmt_wdat                        (cmt_operb[CONFIG_DW-1:0]), 
       .s3i_EDTM                        (lsu_EDTM),              
       .s3i_EDPF                        (lsu_EDPF),              
       .s3i_EALIGN                      (lsu_EALIGN),            
       .s3i_vaddr                       (lsu_vaddr[CONFIG_AW-1:0]), 
       .irqs                            (irqs[CONFIG_NUM_IRQ-1:0]),
       .msr_psr                         (msr_psr[10-1:0]),
       .msr_psr_ire                     (msr_psr_ire),
       .msr_cpuid                       (msr_cpuid[CONFIG_DW-1:0]),
       .msr_epc                         (msr_epc[CONFIG_DW-1:0]),
       .msr_epsr                        (msr_epsr[10-1:0]),
       .msr_elsa                        (msr_elsa[CONFIG_DW-1:0]),
       .msr_evect                       (msr_evect[CONFIG_AW-1:8]),
       .msr_coreid                      (msr_coreid[CONFIG_DW-1:0]),
       .msr_immid                       (msr_immid[CONFIG_DW-1:0]),
       .msr_dmmid                       (msr_dmmid[CONFIG_DW-1:0]),
       .msr_icid                        (msr_icid[CONFIG_DW-1:0]),
       .msr_dcid                        (msr_dcid[CONFIG_DW-1:0]),
       .msr_sr                          (msr_sr[CONFIG_DW*4-1:0]));
   ysyx_210479_cmt_psr
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CPUID_VER                      (1),
        .CPUID_REV                      (0),
        .CPUID_FIMM                     (1),
        .CPUID_FDMM                     (1),
        .CPUID_FICA                     (1),
        .CPUID_FDCA                     (1),
        .CPUID_FDBG                     (0),
        .CPUID_FFPU                     (0),
        .CPUID_FIRQC                    (1),
        .CPUID_FTSC                     (1)
     )
   U_PSR
      (
       .msr_psr                         (msr_psr[10-1:0]),
       .msr_psr_rm                      (msr_psr_rm),
       .msr_psr_ire                     (msr_psr_ire),
       .msr_psr_imme                    (msr_psr_imme),
       .msr_psr_dmme                    (msr_psr_dmme),
       .msr_psr_ice                     (msr_psr_ice),
       .msr_psr_dce                     (msr_psr_dce),
       .msr_cpuid                       (msr_cpuid[CONFIG_DW-1:0]),
       .msr_epsr                        (msr_epsr[10-1:0]),
       .msr_epc                         (msr_epc[CONFIG_DW-1:0]),
       .msr_elsa                        (msr_elsa[CONFIG_DW-1:0]),
       .msr_coreid                      (msr_coreid[CONFIG_DW-1:0]),
       .msr_evect                       (msr_evect[CONFIG_DW-1:8]),
       .msr_sr                          (msr_sr[CONFIG_DW*4-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .msr_psr_save                    (msr_psr_save),
       .msr_psr_restore                 (msr_psr_restore),
       .msr_psr_rm_nxt                  (msr_psr_rm_nxt),
       .msr_psr_rm_we                   (msr_psr_rm_we),
       .msr_psr_ire_nxt                 (msr_psr_ire_nxt),
       .msr_psr_ire_we                  (msr_psr_ire_we),
       .msr_psr_imme_nxt                (msr_psr_imme_nxt),
       .msr_psr_imme_we                 (msr_psr_imme_we),
       .msr_psr_dmme_nxt                (msr_psr_dmme_nxt),
       .msr_psr_dmme_we                 (msr_psr_dmme_we),
       .msr_psr_ice_nxt                 (msr_psr_ice_nxt),
       .msr_psr_ice_we                  (msr_psr_ice_we),
       .msr_psr_dce_nxt                 (msr_psr_dce_nxt),
       .msr_psr_dce_we                  (msr_psr_dce_we),
       .msr_epsr_nxt                    (msr_epsr_nxt[10-1:0]),
       .msr_epsr_we                     (msr_epsr_we),
       .msr_epc_nxt                     (msr_epc_nxt[CONFIG_DW-1:0]),
       .msr_epc_we                      (msr_epc_we),
       .msr_elsa_nxt                    (msr_elsa_nxt[CONFIG_DW-1:0]),
       .msr_elsa_we                     (msr_elsa_we),
       .msr_evect_nxt                   (msr_evect_nxt[CONFIG_DW-1:8]),
       .msr_evect_we                    (msr_evect_we),
       .msr_sr_nxt                      (msr_sr_nxt[CONFIG_DW-1:0]),
       .msr_sr_we                       (msr_sr_we[4-1:0]));
   assign icinv_stall_req = (msr_icinv_we & ~msr_icinv_ready);
   assign bpu_wb = (cmt_fire[0] & cmt_b[0]);
   assign bpu_wb_is_bcc = cmt_is_bcc[0];
   assign bpu_wb_is_breg = cmt_is_breg[0];
   assign bpu_wb_is_brel = cmt_is_brel[0];
   assign bpu_wb_taken = (cmt_bpu_upd[0] ^ cmt_fls[0]); 
   assign bpu_wb_pc = cmt_pc[(CONFIG_AW-2 )-1:CONFIG_BTB_P_NUM]; 
   assign bpu_wb_npc_act = (cmt_fls[0])
                              ? cmt_fls_tgt[0 * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )]
                              : cmt_bpu_upd[(CONFIG_AW-2 ):1]; 
   assign bpu_wb_upd_partial = cmt_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:((CONFIG_AW-2 ) + 1)]; 
   assign p_ce_s1_no_icinv_stall = (~lsu_stall_req | 1'b0);
   assign p_ce_s1 = (p_ce_s1_no_icinv_stall & ~icinv_stall_req);
   assign p_ce_s2 = (~lsu_stall_req);
   assign p_ce_s3 = (~lsu_stall_req);
   assign pipe_finish = (lsu_wb_valid | epu_wb_valid);
   assign prf_WE_lsu_epu = (pipe_finish & ~flush & cmt_prd_we[0]);
   assign prf_WADDR_lsu_epu = cmt_prd[0*6 +: 6];
   assign prf_WDATA_lsu_epu = (epu_wb_dout_sel)
                                 ? epu_wb_dout
                                 : lsu_wb_dout;
endmodule
module ysyx_210479_cmt_epu
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_AW = 0,
   parameter [8-1:0]        CONFIG_EITM_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EIPF_VECTOR = 0,
   parameter [8-1:0]        CONFIG_ESYSCALL_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EINSN_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EIRQ_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EDTM_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EDPF_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EALIGN_VECTOR = 0,
   parameter                           CONFIG_ITLB_P_SETS = 0,
   parameter                           CONFIG_DTLB_P_SETS = 0,
   parameter                           CONFIG_IC_P_SETS = 0,
   parameter                           CONFIG_IC_P_LINE = 0,
   parameter                           CONFIG_NUM_IRQ = 0
)
(
   input                               clk,
   input                               rst,
   input                               p_ce_s1,
   input                               p_ce_s1_no_icinv_stall,
   input                               p_ce_s2,
   input [(CONFIG_AW-2 )-1:0]                   cmt_pc,
   input [(CONFIG_AW-2 )-1:0]                   cmt_npc,
   input                               cmt_req_valid,
   input [2-1:0]          cmt_epu_opc_bus,
   input                               cmt_exc,
   input [6-1:0]              cmt_fe,
   input [CONFIG_DW-1:0]               cmt_addr,
   input [CONFIG_DW-1:0]               cmt_wdat,
   input                               s3i_EDTM,
   input                               s3i_EDPF,
   input                               s3i_EALIGN,
   input [CONFIG_AW-1:0]               s3i_vaddr,
   output [CONFIG_DW-1:0]              epu_wb_dout,
   output                              epu_wb_dout_sel,
   output                              epu_wb_valid,
   output                              exc_flush,
   output [(CONFIG_AW-2 )-1:0]                  exc_flush_tgt,
   output                              refetch,
   input [CONFIG_NUM_IRQ-1:0]          irqs,
   output                              irq_async,
   output                              tsc_irq,
   input [10-1:0]            msr_psr,
   input                               msr_psr_ire,
   output                              msr_psr_rm_nxt,
   output                              msr_psr_rm_we,
   output                              msr_psr_imme_nxt,
   output                              msr_psr_imme_we,
   output                              msr_psr_dmme_nxt,
   output                              msr_psr_dmme_we,
   output                              msr_psr_ire_nxt,
   output                              msr_psr_ire_we,
   output                              msr_psr_ice_nxt,
   output                              msr_psr_ice_we,
   output                              msr_psr_dce_nxt,
   output                              msr_psr_dce_we,
   output                              msr_psr_save,
   output                              msr_psr_restore,
   input [CONFIG_DW-1:0]               msr_cpuid,
   input [CONFIG_DW-1:0]               msr_epc,
   output [CONFIG_DW-1:0]              msr_epc_nxt,
   output                              msr_epc_we,
   input [10-1:0]            msr_epsr,
   output [10-1:0]           msr_epsr_nxt,
   output                              msr_epsr_we,
   input [CONFIG_DW-1:0]               msr_elsa,
   output [CONFIG_DW-1:0]              msr_elsa_nxt,
   output                              msr_elsa_we,
   output [CONFIG_AW-1:8]   msr_evect_nxt,
   input [CONFIG_AW-1:8]    msr_evect,
   output                              msr_evect_we,
   input [CONFIG_DW-1:0]               msr_coreid,
   input [CONFIG_DW-1:0]               msr_immid,
   output [CONFIG_ITLB_P_SETS-1:0]     msr_imm_tlbl_idx,
   output [CONFIG_DW-1:0]              msr_imm_tlbl_nxt,
   output                              msr_imm_tlbl_we,
   output [CONFIG_ITLB_P_SETS-1:0]     msr_imm_tlbh_idx,
   output [CONFIG_DW-1:0]              msr_imm_tlbh_nxt,
   output                              msr_imm_tlbh_we,
   input [CONFIG_DW-1:0]               msr_dmmid,
   output [CONFIG_DTLB_P_SETS-1:0]     msr_dmm_tlbl_idx,
   output [CONFIG_DW-1:0]              msr_dmm_tlbl_nxt,
   output                              msr_dmm_tlbl_we,
   output [CONFIG_DTLB_P_SETS-1:0]     msr_dmm_tlbh_idx,
   output [CONFIG_DW-1:0]              msr_dmm_tlbh_nxt,
   output                              msr_dmm_tlbh_we,
   input [CONFIG_DW-1:0]               msr_icid,
   output [CONFIG_IC_P_SETS-1:0]       msr_icinv_line_nxt,
   output                              msr_icinv_we,
   input [CONFIG_DW-1:0]               msr_dcid,
   output [CONFIG_DW-1:0]              msr_dcinv_nxt,
   output                              msr_dcinv_we,
   output [CONFIG_DW-1:0]              msr_dcfls_nxt,
   output                              msr_dcfls_we,
   input [CONFIG_DW*4-1:0]  msr_sr,
   output [CONFIG_DW-1:0]              msr_sr_nxt,
   output [4-1:0]           msr_sr_we
);
   localparam NCPU_WMSR_WE_W           = (13 + 9);
   wire [CONFIG_DW-1:0] msr_irqc_imr;           
   wire [CONFIG_DW-1:0] msr_irqc_irr;           
   wire [CONFIG_DW-1:0] msr_tsc_tcr;            
   wire [CONFIG_DW-1:0] msr_tsc_tsr;            
   wire [CONFIG_DW-1:0]                msr_irqc_imr_nxt;
   wire                                msr_irqc_imr_we;
   wire [CONFIG_DW-1:0]                msr_tsc_tsr_nxt;
   wire                                msr_tsc_tsr_we;
   wire [CONFIG_DW-1:0]                msr_tsc_tcr_nxt;
   wire                                msr_tsc_tcr_we;
   wire [CONFIG_DW-1:0]                s1i_msr_addr;
   wire [(14-9) -1:0]        s1i_bank_addr;
   wire [9-1:0]    s1i_bank_off;
   wire                                s1i_bank_ps;
   wire                                s1i_bank_imm;
   wire                                s1i_bank_dmm;
   wire                                s1i_bank_ic;
   wire                                s1i_bank_dc;
   wire                                s1i_bank_irqc;
   wire                                s1i_bank_tsc;
   wire                                s1i_bank_sr;
   wire [CONFIG_DW-1:0]                dout_ps;
   wire                                msr_imm_tlbl_sel;
   wire                                msr_imm_tlbh_sel;
   wire [CONFIG_DW-1:0]                dout_imm;
   wire                                msr_dmm_tlbl_sel;
   wire                                msr_dmm_tlbh_sel;
   wire                                msr_ic_id_sel;
   wire                                msr_ic_inv_sel;
   wire                                msr_dc_id_sel;
   wire                                msr_dc_inv_sel;
   wire                                msr_dc_fls_sel;
   wire [CONFIG_DW-1:0]                dout_dmm;
   wire [CONFIG_DW-1:0]                dout_ic;
   wire [CONFIG_DW-1:0]                dout_dc;
   wire                                msr_irqc_imr_sel;
   wire                                msr_irqc_irr_sel;
   wire [CONFIG_DW-1:0]                dout_irqc;
   wire                                msr_tsc_tsr_sel;
   wire                                msr_tsc_tcr_sel;
   wire [CONFIG_DW-1:0]                dout_tsc;
   wire [CONFIG_DW-1:0]                dout_sr;
   wire                                s1i_wmsr_psr_we;
   wire                                s1i_wmsr_epc_we;
   wire                                s1i_wmsr_epsr_we;
   wire                                s1i_wmsr_elsa_we;
   wire                                s1i_wmsr_evect_we;
   wire                                s1i_msr_imm_tlbl_we;
   wire                                s1i_msr_imm_tlbh_we;
   wire                                s1i_msr_dmm_tlbl_we;
   wire                                s1i_msr_dmm_tlbh_we;
   wire                                s1i_msr_ic_inv_we;
   wire                                s1i_msr_dc_inv_we;
   wire                                s1i_msr_dc_fls_we;
   wire                                s1i_msr_irqc_imr_we;
   wire                                s1i_msr_tsc_tsr_we;
   wire                                s1i_msr_tsc_tcr_we;
   wire                                s1i_msr_sr_we;
   wire   [CONFIG_DW-1:0]              s1i_msr_wdat;
   wire   [NCPU_WMSR_WE_W-1:0]         s1i_wmsr_we;
   wire                                s1i_ERET;
   wire                                s1i_ESYSCALL;
   wire                                s1i_EINSN;
   wire                                s1i_EIPF;
   wire                                s1i_EITM;
   wire                                s1i_EIRQ;
   wire                                s1i_refetch;
   wire [CONFIG_DW-1:0]                s1i_wb_dout;
   wire                                s1i_wb_dout_sel;
   wire                                s1i_wb_valid;
   wire                                s1o_wb_valid;
   wire                                s1o_commit_wmsr_psr_we;
   wire                                s1o_commit_wmsr_epc_we;
   wire                                s1o_commit_wmsr_epsr_we;
   wire                                s1o_commit_wmsr_elsa_we;
   wire                                s1o_commit_wmsr_evect_we;
   wire                                s1o_commit_msr_imm_tlbl_we;
   wire                                s1o_commit_msr_imm_tlbh_we;
   wire                                s1o_commit_msr_dmm_tlbl_we;
   wire                                s1o_commit_msr_dmm_tlbh_we;
   wire                                s1o_commit_msr_irqc_imr_we;
   wire                                s1o_commit_msr_tsc_tsr_we;
   wire                                s1o_commit_msr_tsc_tcr_we;
   wire                                s1o_commit_msr_sr_we;
   wire [9-1:0]    s1o_commit_bank_off;
   wire  [(CONFIG_AW-2 )-1:0]                   s1o_commit_epc;
   wire [(CONFIG_AW-2 )-1:0]                    s1o_commit_nepc;
   wire [CONFIG_AW-1:8]     s1o_msr_evect;
   wire                                s1o_commit_ERET;
   wire                                s1o_commit_ESYSCALL;
   wire                                s1o_commit_EINSN;
   wire                                s1o_commit_EIPF;
   wire                                s1o_commit_EITM;
   wire                                s1o_commit_EIRQ;
   wire                                s1o_commit_refetch;
   wire  [NCPU_WMSR_WE_W-1:0]          s1o_commit_wmsr_we;
   wire  [CONFIG_DW-1:0]               s1o_commit_wmsr_dat;
   wire                                s1o_wmsr_psr_rm;
   wire                                s1o_wmsr_psr_ire;
   wire                                s1o_wmsr_psr_imme;
   wire                                s1o_wmsr_psr_dmme;
   wire                                s1o_wmsr_psr_ice;
   wire                                s1o_wmsr_psr_dce;
   wire                                s1o_set_elsa_as_pc;
   wire                                s1o_set_elsa;
   wire [CONFIG_DW-1:0]                s1o_lsa_nxt;
   assign s1i_msr_wdat = cmt_wdat;
   assign s1i_msr_addr = cmt_addr;
   assign s1i_bank_addr = s1i_msr_addr[(14-9) +9-1:9];
   assign s1i_bank_off = s1i_msr_addr[9-1:0];
   assign dout_ps =
      (
         ({CONFIG_DW{s1i_bank_off[0]}} & {{CONFIG_DW-10{1'b0}}, msr_psr[10-1:0]}) |
         ({CONFIG_DW{s1i_bank_off[1]}} & msr_cpuid) |
         ({CONFIG_DW{s1i_bank_off[2]}} & {{CONFIG_DW-10{1'b0}}, msr_epsr[10-1:0]}) |
         ({CONFIG_DW{s1i_bank_off[3]}} & msr_epc) |
         ({CONFIG_DW{s1i_bank_off[4]}} & msr_elsa) |
         ({CONFIG_DW{s1i_bank_off[5]}} & msr_coreid)
      );
   assign msr_imm_tlbl_sel = s1i_bank_off[8] & ~s1i_bank_off[7];
   assign msr_imm_tlbh_sel = s1i_bank_off[8] & s1i_bank_off[7];
   assign dout_imm =
      (
         ({CONFIG_DW{~s1i_bank_off[8]}} & msr_immid)
      );
   assign msr_dmm_tlbl_sel = s1i_bank_off[8] & ~s1i_bank_off[7];
   assign msr_dmm_tlbh_sel = s1i_bank_off[8] & s1i_bank_off[7];
   assign dout_dmm =
      (
         ({CONFIG_DW{~s1i_bank_off[8]}} & msr_dmmid)
      );
   assign msr_ic_id_sel = s1i_bank_off[0];
   assign msr_ic_inv_sel = s1i_bank_off[1];
   assign dout_ic =
      (
         ({CONFIG_DW{msr_ic_id_sel}} & msr_icid)
      );
   assign msr_dc_id_sel = s1i_bank_off[0];
   assign msr_dc_inv_sel = s1i_bank_off[1];
   assign msr_dc_fls_sel = s1i_bank_off[2];
   assign dout_dc =
      (
         ({CONFIG_DW{msr_dc_id_sel}} & msr_dcid)
      );
   assign msr_irqc_imr_sel = s1i_bank_off[0];
   assign msr_irqc_irr_sel = s1i_bank_off[1];
   assign dout_irqc =
      (
         ({CONFIG_DW{msr_irqc_imr_sel}} & msr_irqc_imr) |
         ({CONFIG_DW{msr_irqc_irr_sel}} & msr_irqc_irr)
      );
   assign msr_tsc_tsr_sel = s1i_bank_off[0];
   assign msr_tsc_tcr_sel = s1i_bank_off[1];
   assign dout_tsc =
      (
         ({CONFIG_DW{msr_tsc_tsr_sel}} & msr_tsc_tsr) |
         ({CONFIG_DW{msr_tsc_tcr_sel}} & msr_tsc_tcr)
      );
   ysyx_210479_pmux #(.SELW(4), .DW(CONFIG_DW)) pmux_dout_sr (.sel(s1i_bank_off[4-1:0]), .din(msr_sr), .dout(dout_sr));
   assign s1i_bank_ps = (s1i_bank_addr == 0);
   assign s1i_bank_imm = (s1i_bank_addr == 1);
   assign s1i_bank_dmm = (s1i_bank_addr == 2);
   assign s1i_bank_ic = (s1i_bank_addr == 3);
   assign s1i_bank_dc = (s1i_bank_addr == 4);
   assign s1i_bank_irqc = (s1i_bank_addr == 6);
   assign s1i_bank_tsc = (s1i_bank_addr == 7);
   assign s1i_bank_sr = (s1i_bank_addr == 8);
   assign s1i_wb_dout =
      (
         ({CONFIG_DW{s1i_bank_ps}} & dout_ps) |
         ({CONFIG_DW{s1i_bank_imm}} & dout_imm) |
         ({CONFIG_DW{s1i_bank_dmm}} & dout_dmm) |
         ({CONFIG_DW{s1i_bank_ic}} & dout_ic) |
         ({CONFIG_DW{s1i_bank_dc}} & dout_dc) |
         ({CONFIG_DW{s1i_bank_irqc}} & dout_irqc) |
         ({CONFIG_DW{s1i_bank_tsc}} & dout_tsc) |
         ({CONFIG_DW{s1i_bank_sr}} & dout_sr)
      );
   assign s1i_wb_dout_sel = (cmt_epu_opc_bus[1]);
   assign s1i_ERET = (cmt_req_valid & cmt_exc & cmt_fe[1]);
   assign s1i_ESYSCALL = (cmt_req_valid & cmt_exc & cmt_fe[0]);
   assign s1i_EINSN = (cmt_req_valid & cmt_exc & cmt_fe[(6-1)]);
   assign s1i_EIPF = (cmt_req_valid & cmt_exc & cmt_fe[3]);
   assign s1i_EITM = (cmt_req_valid & cmt_exc & cmt_fe[2]);
   assign s1i_EIRQ = (cmt_req_valid & cmt_exc & cmt_fe[4]);
   assign s1i_refetch = (cmt_req_valid & (s1i_wmsr_psr_we |
                              s1i_msr_imm_tlbl_we |
                              s1i_msr_imm_tlbh_we |
                              s1i_msr_dmm_tlbl_we |
                              s1i_msr_dmm_tlbh_we));
   assign s1i_wmsr_psr_we      = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_ps & s1i_bank_off[0];
   assign s1i_wmsr_epc_we      = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_ps & s1i_bank_off[3];
   assign s1i_wmsr_epsr_we     = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_ps & s1i_bank_off[2];
   assign s1i_wmsr_elsa_we     = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_ps & s1i_bank_off[4];
   assign s1i_wmsr_evect_we    = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_ps & s1i_bank_off[6];
   assign s1i_msr_imm_tlbl_we  = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_imm & msr_imm_tlbl_sel;
   assign s1i_msr_imm_tlbh_we  = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_imm & msr_imm_tlbh_sel;
   assign s1i_msr_dmm_tlbl_we  = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_dmm & msr_dmm_tlbl_sel;
   assign s1i_msr_dmm_tlbh_we  = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_dmm & msr_dmm_tlbh_sel;
   assign s1i_msr_ic_inv_we    = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_ic & msr_ic_inv_sel;
   assign s1i_msr_dc_inv_we    = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_dc & msr_dc_inv_sel;
   assign s1i_msr_dc_fls_we    = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_dc & msr_dc_fls_sel;
   assign s1i_msr_irqc_imr_we  = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_irqc & msr_irqc_imr_sel;
   assign s1i_msr_tsc_tsr_we   = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_tsc & msr_tsc_tsr_sel;
   assign s1i_msr_tsc_tcr_we   = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_tsc & msr_tsc_tcr_sel;
   assign s1i_msr_sr_we        = cmt_req_valid & cmt_epu_opc_bus[0] & s1i_bank_sr;
   assign s1i_wmsr_we = {s1i_wmsr_psr_we,
                        s1i_wmsr_epc_we,
                        s1i_wmsr_epsr_we,
                        s1i_wmsr_elsa_we,
                        s1i_wmsr_evect_we,
                        s1i_msr_imm_tlbl_we,
                        s1i_msr_imm_tlbh_we,
                        s1i_msr_dmm_tlbl_we,
                        s1i_msr_dmm_tlbh_we,
                        s1i_msr_irqc_imr_we,
                        s1i_msr_tsc_tsr_we,
                        s1i_msr_tsc_tcr_we,
                        s1i_msr_sr_we,
                        s1i_bank_off};
   assign s1i_wb_valid = (cmt_req_valid & ~msr_dcfls_we & ~msr_dcinv_we);
   ysyx_210479_mDFF_lr # (.DW(1)) ff_epu_wb_valid (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(s1i_wb_valid), .Q(s1o_wb_valid) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DW)) ff_epu_wb_dout (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(s1i_wb_dout), .Q(epu_wb_dout) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_epu_wb_dout_sel (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(s1i_wb_dout_sel), .Q(epu_wb_dout_sel) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_commit_ERET (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(s1i_ERET), .Q(s1o_commit_ERET) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_commit_ESYSCALL (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(s1i_ESYSCALL), .Q(s1o_commit_ESYSCALL) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_commit_EINSN (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(s1i_EINSN), .Q(s1o_commit_EINSN) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_commit_EIPF (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(s1i_EIPF), .Q(s1o_commit_EIPF) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_commit_EITM (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(s1i_EITM), .Q(s1o_commit_EITM) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_commit_EIRQ (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(s1i_EIRQ), .Q(s1o_commit_EIRQ) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_commit_refetch (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(s1i_refetch), .Q(s1o_commit_refetch) );
   ysyx_210479_mDFF_lr # (.DW(NCPU_WMSR_WE_W)) ff_s1o_commit_wmsr_we (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(s1i_wmsr_we), .Q(s1o_commit_wmsr_we) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DW)) ff_s1o_commit_wmsr_dat (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(s1i_msr_wdat), .Q(s1o_commit_wmsr_dat) );
   ysyx_210479_mDFF_lr # (.DW((CONFIG_AW-2 ))) ff_s1o_commit_epc (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(cmt_pc), .Q(s1o_commit_epc) );
   ysyx_210479_mDFF_lr # (.DW((CONFIG_AW-2 ))) ff_s1o_commit_nepc (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(cmt_npc), .Q(s1o_commit_nepc) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_AW-8)) ff_s1o_msr_evect (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(msr_evect), .Q(s1o_msr_evect) );
   assign {
      s1o_commit_wmsr_psr_we,
      s1o_commit_wmsr_epc_we,
      s1o_commit_wmsr_epsr_we,
      s1o_commit_wmsr_elsa_we,
      s1o_commit_wmsr_evect_we,
      s1o_commit_msr_imm_tlbl_we,
      s1o_commit_msr_imm_tlbh_we,
      s1o_commit_msr_dmm_tlbl_we,
      s1o_commit_msr_dmm_tlbh_we,
      s1o_commit_msr_irqc_imr_we,
      s1o_commit_msr_tsc_tsr_we,
      s1o_commit_msr_tsc_tcr_we,
      s1o_commit_msr_sr_we,
      s1o_commit_bank_off} = ({NCPU_WMSR_WE_W{p_ce_s2}} & s1o_commit_wmsr_we);
   assign {s1o_wmsr_psr_dce,s1o_wmsr_psr_ice,s1o_wmsr_psr_dmme,s1o_wmsr_psr_imme,s1o_wmsr_psr_ire,s1o_wmsr_psr_rm} = s1o_commit_wmsr_dat[9:4];
   assign msr_psr_save = (p_ce_s2 & (s1o_commit_ESYSCALL |
                                    s1o_commit_EITM |
                                    s1o_commit_EIPF |
                                    s1o_commit_EINSN |
                                    s3i_EDTM |
                                    s3i_EDPF |
                                    s3i_EALIGN |
                                    s1o_commit_EIRQ));
   assign msr_psr_restore = (p_ce_s2 & s1o_commit_ERET);
   assign msr_psr_rm_we = s1o_commit_wmsr_psr_we;
   assign msr_psr_rm_nxt = s1o_wmsr_psr_rm;
   assign msr_psr_imme_we = s1o_commit_wmsr_psr_we;
   assign msr_psr_imme_nxt = s1o_wmsr_psr_imme;
   assign msr_psr_dmme_we = s1o_commit_wmsr_psr_we;
   assign msr_psr_dmme_nxt = s1o_wmsr_psr_dmme;
   assign msr_psr_ire_we = s1o_commit_wmsr_psr_we;
   assign msr_psr_ire_nxt = s1o_wmsr_psr_ire;
   assign msr_psr_ice_we = s1o_commit_wmsr_psr_we;
   assign msr_psr_ice_nxt = s1o_wmsr_psr_ice;
   assign msr_psr_dce_we = s1o_commit_wmsr_psr_we;
   assign msr_psr_dce_nxt = s1o_wmsr_psr_dce;
   assign msr_epsr_we = s1o_commit_wmsr_epsr_we;
   assign msr_epsr_nxt = s1o_commit_wmsr_dat[10-1:0];
   assign msr_epc_nxt = (s1o_commit_wmsr_epc_we)
                           ? s1o_commit_wmsr_dat
                           : (s1o_commit_ESYSCALL)
                              ? {s1o_commit_nepc,2'b0}
                              : {s1o_commit_epc,2'b0};
   assign msr_epc_we = (msr_psr_save | s1o_commit_wmsr_epc_we);
   assign s1o_set_elsa_as_pc = (s1o_commit_EITM | s1o_commit_EIPF | s1o_commit_EINSN);
   assign s1o_set_elsa = (s1o_set_elsa_as_pc | s3i_EDTM | s3i_EDPF | s3i_EALIGN);
   assign s1o_lsa_nxt = s1o_set_elsa_as_pc ? {s1o_commit_epc,2'b0} : s3i_vaddr;
   assign msr_elsa_nxt = s1o_set_elsa ? s1o_lsa_nxt : s1o_commit_wmsr_dat;
   assign msr_elsa_we = s1o_set_elsa | s1o_commit_wmsr_elsa_we;
   assign msr_evect_nxt = s1o_commit_wmsr_dat[CONFIG_AW-1:8];
   assign msr_evect_we = s1o_commit_wmsr_evect_we;
   assign msr_imm_tlbl_idx = s1o_commit_bank_off[CONFIG_ITLB_P_SETS-1:0];
   assign msr_imm_tlbl_nxt = s1o_commit_wmsr_dat;
   assign msr_imm_tlbl_we = s1o_commit_msr_imm_tlbl_we;
   assign msr_imm_tlbh_idx = s1o_commit_bank_off[CONFIG_ITLB_P_SETS-1:0];
   assign msr_imm_tlbh_nxt = s1o_commit_wmsr_dat;
   assign msr_imm_tlbh_we = s1o_commit_msr_imm_tlbh_we;
   assign msr_dmm_tlbl_idx = s1o_commit_bank_off[CONFIG_DTLB_P_SETS-1:0];
   assign msr_dmm_tlbl_nxt = s1o_commit_wmsr_dat;
   assign msr_dmm_tlbl_we = s1o_commit_msr_dmm_tlbl_we;
   assign msr_dmm_tlbh_idx = s1o_commit_bank_off[CONFIG_DTLB_P_SETS-1:0];
   assign msr_dmm_tlbh_nxt = s1o_commit_wmsr_dat;
   assign msr_dmm_tlbh_we = s1o_commit_msr_dmm_tlbh_we;
   assign msr_icinv_we = (s1i_msr_ic_inv_we & p_ce_s1_no_icinv_stall);
   assign msr_icinv_line_nxt = s1i_msr_wdat[CONFIG_IC_P_LINE +: CONFIG_IC_P_SETS];
   assign msr_dcinv_we = s1i_msr_dc_inv_we;
   assign msr_dcinv_nxt = s1i_msr_wdat;
   assign msr_dcfls_we = s1i_msr_dc_fls_we;
   assign msr_dcfls_nxt = s1i_msr_wdat;
   assign msr_irqc_imr_we = s1o_commit_msr_irqc_imr_we;
   assign msr_irqc_imr_nxt = s1o_commit_wmsr_dat;
   assign msr_tsc_tsr_we = s1o_commit_msr_tsc_tsr_we;
   assign msr_tsc_tsr_nxt = s1o_commit_wmsr_dat;
   assign msr_tsc_tcr_we = s1o_commit_msr_tsc_tcr_we;
   assign msr_tsc_tcr_nxt = s1o_commit_wmsr_dat;
   assign msr_sr_we = (s1o_commit_bank_off[4-1:0] & {4{s1o_commit_msr_sr_we}});
   assign msr_sr_nxt = s1o_commit_wmsr_dat;
   assign exc_flush_tgt = ({(CONFIG_AW-2 ){s3i_EDTM}} & {s1o_msr_evect, CONFIG_EDTM_VECTOR[8-1:2 ]}) |
                           ({(CONFIG_AW-2 ){s3i_EDPF}} & {s1o_msr_evect, CONFIG_EDPF_VECTOR[8-1:2 ]}) |
                           ({(CONFIG_AW-2 ){s3i_EALIGN}} & {s1o_msr_evect, CONFIG_EALIGN_VECTOR[8-1:2 ]}) |
                           ({(CONFIG_AW-2 ){s1o_commit_ESYSCALL}} & {s1o_msr_evect, CONFIG_ESYSCALL_VECTOR[8-1:2 ]}) |
                           ({(CONFIG_AW-2 ){s1o_commit_ERET}} & msr_epc[2  +: (CONFIG_AW-2 )]) |
                           ({(CONFIG_AW-2 ){s1o_commit_EITM}} & {s1o_msr_evect, CONFIG_EITM_VECTOR[8-1:2 ]}) |
                           ({(CONFIG_AW-2 ){s1o_commit_EIPF}} & {s1o_msr_evect, CONFIG_EIPF_VECTOR[8-1:2 ]}) |
                           ({(CONFIG_AW-2 ){s1o_commit_EIRQ}} & {s1o_msr_evect, CONFIG_EIRQ_VECTOR[8-1:2 ]}) |
                           ({(CONFIG_AW-2 ){s1o_commit_EINSN}} & {s1o_msr_evect, CONFIG_EINSN_VECTOR[8-1:2 ]});
   assign exc_flush = p_ce_s2 & (s3i_EDTM |
                        s3i_EDPF |
                        s3i_EALIGN |
                        s1o_commit_ESYSCALL |
                        s1o_commit_ERET |
                        s1o_commit_EITM |
                        s1o_commit_EIPF |
                        s1o_commit_EIRQ |
                        s1o_commit_EINSN);
   assign refetch = (p_ce_s2 & s1o_commit_refetch);
   assign epu_wb_valid = (s1o_wb_valid & p_ce_s2);
   ysyx_210479_cmt_irqc
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_NUM_IRQ                 (CONFIG_NUM_IRQ))
   U_IRQC
      (
       .irq_async                       (irq_async),
       .msr_irqc_imr                    (msr_irqc_imr[CONFIG_DW-1:0]),
       .msr_irqc_irr                    (msr_irqc_irr[CONFIG_DW-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .irqs                            (irqs[CONFIG_NUM_IRQ-1:0]),
       .msr_psr_ire                     (msr_psr_ire),
       .msr_irqc_imr_nxt                (msr_irqc_imr_nxt[CONFIG_DW-1:0]),
       .msr_irqc_imr_we                 (msr_irqc_imr_we));
   ysyx_210479_cmt_tsc
      #(
        .CONFIG_DW                      (CONFIG_DW))
   U_TSC
      (
       .tsc_irq                         (tsc_irq),
       .msr_tsc_tsr                     (msr_tsc_tsr[CONFIG_DW-1:0]),
       .msr_tsc_tcr                     (msr_tsc_tcr[CONFIG_DW-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .msr_tsc_tsr_nxt                 (msr_tsc_tsr_nxt[CONFIG_DW-1:0]),
       .msr_tsc_tsr_we                  (msr_tsc_tsr_we),
       .msr_tsc_tcr_nxt                 (msr_tsc_tcr_nxt[CONFIG_DW-1:0]),
       .msr_tsc_tcr_we                  (msr_tsc_tcr_we));
endmodule
module ysyx_210479_cmt_irqc
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_NUM_IRQ = 0
)
(
   input                               clk,
   input                               rst,
   input [CONFIG_NUM_IRQ-1:0]          irqs,
   output                              irq_async,
   input                               msr_psr_ire,
   output [CONFIG_DW-1:0]              msr_irqc_imr,
   input [CONFIG_DW-1:0]               msr_irqc_imr_nxt,
   input                               msr_irqc_imr_we,
   output [CONFIG_DW-1:0]              msr_irqc_irr
);
   wire [CONFIG_DW-1:0]                imr_ff;
   wire [CONFIG_NUM_IRQ-1:0]           msr_irqc_irr_0;
   wire [CONFIG_NUM_IRQ-1:0]           irq_masked;
   ysyx_210479_mDFF_r #(CONFIG_NUM_IRQ) dff_msr_irqc_irr_0 (.CLK(clk), .RST(rst), .D(irqs), .Q(msr_irqc_irr_0) );
   ysyx_210479_mDFF_r #(CONFIG_NUM_IRQ) dff_msr_irqc_irr (.CLK(clk), .RST(rst), .D(msr_irqc_irr_0), .Q(msr_irqc_irr) );
   ysyx_210479_mDFF_lr #(.DW(CONFIG_DW), .RST_VECTOR({CONFIG_DW{1'b1}})) ff_imr_ (.CLK(clk), .RST(rst), .LOAD(msr_irqc_imr_we), .D(msr_irqc_imr_nxt), .Q(imr_ff) );
   assign msr_irqc_imr = (msr_irqc_imr_we) ? msr_irqc_imr_nxt : imr_ff;
   assign irq_masked = (msr_irqc_irr & ~msr_irqc_imr);
   assign irq_async = (|irq_masked & msr_psr_ire);
endmodule
module ysyx_210479_cmt_lsu
#(
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_P_DW = 0,
   parameter                           CONFIG_P_PAGE_SIZE = 0,
   parameter                           CONFIG_DMMU_ENABLE_UNCACHED_SEG = 0,
   parameter                           CONFIG_DTLB_P_SETS = 0,
   parameter                           CONFIG_DC_P_LINE = 0,
   parameter                           CONFIG_DC_P_SETS = 0,
   parameter                           CONFIG_DC_P_WAYS = 0,
   parameter                           AXI_P_DW_BYTES    = 0,
   parameter                           AXI_ADDR_WIDTH    = 0,
   parameter                           AXI_ID_WIDTH      = 0,
   parameter                           AXI_USER_WIDTH    = 0
)
(
   input                               clk,
   input                               rst,
   input                               p_ce_s1,
   input                               p_ce_s2,
   input                               p_ce_s3,
   output                              lsu_stall_req,
   input                               cmt_req_valid,
   input [7-1:0]          cmt_lsu_opc_bus,
   input [CONFIG_DW-1:0]               cmt_lsa,
   input [CONFIG_DW-1:0]               cmt_wdat,
   input                               dbus_ARREADY,
   output                              dbus_ARVALID,
   output [AXI_ADDR_WIDTH-1:0]         dbus_ARADDR,
   output [2:0]                        dbus_ARPROT,
   output [AXI_ID_WIDTH-1:0]           dbus_ARID,
   output [AXI_USER_WIDTH-1:0]         dbus_ARUSER,
   output [7:0]                        dbus_ARLEN,
   output [2:0]                        dbus_ARSIZE,
   output [1:0]                        dbus_ARBURST,
   output                              dbus_ARLOCK,
   output [3:0]                        dbus_ARCACHE,
   output [3:0]                        dbus_ARQOS,
   output [3:0]                        dbus_ARREGION,
   output                              dbus_RREADY,
   input                               dbus_RVALID,
   input  [(1<<AXI_P_DW_BYTES)*8-1:0]  dbus_RDATA,
   input  [1:0]                        dbus_RRESP,
   input                               dbus_RLAST,
   input  [AXI_ID_WIDTH-1:0]           dbus_RID,
   input  [AXI_USER_WIDTH-1:0]         dbus_RUSER,
   input                               dbus_AWREADY,
   output                              dbus_AWVALID,
   output [AXI_ADDR_WIDTH-1:0]         dbus_AWADDR,
   output [2:0]                        dbus_AWPROT,
   output [AXI_ID_WIDTH-1:0]           dbus_AWID,
   output [AXI_USER_WIDTH-1:0]         dbus_AWUSER,
   output [7:0]                        dbus_AWLEN,
   output [2:0]                        dbus_AWSIZE,
   output [1:0]                        dbus_AWBURST,
   output                              dbus_AWLOCK,
   output [3:0]                        dbus_AWCACHE,
   output [3:0]                        dbus_AWQOS,
   output [3:0]                        dbus_AWREGION,
   input                               dbus_WREADY,
   output                              dbus_WVALID,
   output [(1<<AXI_P_DW_BYTES)*8-1:0]  dbus_WDATA,
   output [(1<<AXI_P_DW_BYTES)-1:0]    dbus_WSTRB,
   output                              dbus_WLAST,
   output [AXI_USER_WIDTH-1:0]         dbus_WUSER,
   output                              dbus_BREADY,
   input                               dbus_BVALID,
   input [1:0]                         dbus_BRESP,
   input [AXI_ID_WIDTH-1:0]            dbus_BID,
   input [AXI_USER_WIDTH-1:0]          dbus_BUSER,
   output                              lsu_EDTM,
   output                              lsu_EDPF,
   output                              lsu_EALIGN,
   output [CONFIG_AW-1:0]              lsu_vaddr,
   output [CONFIG_DW-1:0]              lsu_wb_dout,
   output                              lsu_wb_valid,
   input                               msr_psr_dmme,
   input                               msr_psr_rm,
   input                               msr_psr_dce,
   output [CONFIG_DW-1:0]              msr_dmmid,
   input [CONFIG_DTLB_P_SETS-1:0]      msr_dmm_tlbl_idx,
   input [CONFIG_DW-1:0]               msr_dmm_tlbl_nxt,
   input                               msr_dmm_tlbl_we,
   input [CONFIG_DTLB_P_SETS-1:0]      msr_dmm_tlbh_idx,
   input [CONFIG_DW-1:0]               msr_dmm_tlbh_nxt,
   input                               msr_dmm_tlbh_we,
   output [CONFIG_DW-1:0]              msr_dcid,
   input [CONFIG_DW-1:0]               msr_dcinv_nxt,
   input                               msr_dcinv_we,
   input [CONFIG_DW-1:0]               msr_dcfls_nxt,
   input                               msr_dcfls_we
);
   wire                 dc_stall_req;           
   wire                                s1i_valid;
   wire                                s1i_load;
   wire                                s1i_store;
   wire                                s1i_sign_ext;
   wire                                s1i_barr;
   wire                                s1i_dcop;
   wire                                s1i_dc_req;
   wire                                s1i_tlb_req;
   wire [CONFIG_AW-1:0]                s1i_dc_vaddr;
   wire [CONFIG_P_PAGE_SIZE-1:0]       s1i_dc_vpo;
   wire [CONFIG_DW/8-1:0]              s1i_dc_wmsk;
   wire [CONFIG_DW-1:0]                s1i_dc_wdat;
   wire                                s1i_misalign;
   wire [CONFIG_DW-1:0]                s1i_din_8b;
   wire [CONFIG_DW-1:0]                s1i_din_16b;
   wire [3:0]                          s1i_we_msk_8b;
   wire [3:0]                          s1i_we_msk_16b;
   wire [2:0]                          s1i_size;
   wire                                s1o_valid;
   wire [2:0]                          s1o_size;
   wire                                s1o_sign_ext;
   wire                                s2i_tlb_uncached;
   wire                                s2i_tlb_exc;
   wire                                s2i_kill_req;
   wire                                s2i_uncached;
   wire [CONFIG_AW-CONFIG_P_PAGE_SIZE-1:0] s2i_tlb_ppn;
   wire [CONFIG_AW-CONFIG_P_PAGE_SIZE-1:0] s2i_dc_ppn;
   wire                                s2i_EDTM;
   wire                                s2i_EDPF;
   wire                                s1o_EALIGN;
   wire [CONFIG_AW-1:0]                s1o_vaddr;
   wire                                s1o_dcop;
   wire                                s1o_msr_psr_dce;
   wire                                s2o_valid;
   wire                                s2o_EDTM;
   wire                                s2o_EDPF;
   wire                                s2o_EALIGN;
   wire [CONFIG_DW-1:0]                s2o_dout_32b;
   wire [7:0]                          s2o_dout_8b;
   wire [15:0]                         s2o_dout_16b;
   wire [CONFIG_AW-1:0]                s2o_vaddr;
   wire [2:0]                          s2o_size;
   wire                                s2o_sign_ext;
   assign s1i_valid = cmt_req_valid & (s1i_load|s1i_store|s1i_dcop);
   assign s1i_load = cmt_lsu_opc_bus[0];
   assign s1i_store = cmt_lsu_opc_bus[1];
   assign s1i_sign_ext = cmt_lsu_opc_bus[3];
   assign s1i_barr = cmt_lsu_opc_bus[2];
   assign s1i_size = cmt_lsu_opc_bus[6:4];
   assign s1i_dcop = (msr_dcinv_we | msr_dcfls_we);
   assign s1i_dc_vaddr = (msr_dcinv_we)
                           ? msr_dcinv_nxt
                           : (msr_dcfls_we)
                              ? msr_dcfls_nxt
                              : cmt_lsa;
   assign s1i_misalign = (s1i_size==3'd2 & |s1i_dc_vaddr[1:0]) |
                           (s1i_size==3'd1 & s1i_dc_vaddr[0]);
   assign s1i_din_8b = {cmt_wdat[7:0], cmt_wdat[7:0], cmt_wdat[7:0], cmt_wdat[7:0]};
   assign s1i_din_16b = {cmt_wdat[15:0], cmt_wdat[15:0]};
   assign s1i_dc_wdat = ({CONFIG_DW{s1i_size==3'd2}} & cmt_wdat) |
                        ({CONFIG_DW{s1i_size==3'd1}} & s1i_din_16b) |
                        ({CONFIG_DW{s1i_size==3'd0}} & s1i_din_8b);
   assign s1i_we_msk_8b = (s1i_dc_vaddr[1:0]==2'b00 ? 4'b0001 :
                           s1i_dc_vaddr[1:0]==2'b01 ? 4'b0010 :
                           s1i_dc_vaddr[1:0]==2'b10 ? 4'b0100 :
                           s1i_dc_vaddr[1:0]==2'b11 ? 4'b1000 : 4'b0000);
   assign s1i_we_msk_16b = s1i_dc_vaddr[1] ? 4'b1100 : 4'b0011;
   assign s1i_dc_wmsk = {CONFIG_DW/8{s1i_store}} & (
                        ({CONFIG_DW/8{s1i_size==3'd2}} & 4'b1111) |
                        ({CONFIG_DW/8{s1i_size==3'd1}} & s1i_we_msk_16b) |
                        ({CONFIG_DW/8{s1i_size==3'd0}} & s1i_we_msk_8b) );
   assign s1i_dc_vpo = s1i_dc_vaddr[CONFIG_P_PAGE_SIZE-1:0];
   assign s1i_dc_req = (p_ce_s1 & s1i_valid);
   assign s1i_tlb_req = (s1i_dc_req & ~s1i_dcop);
   ysyx_210479_dmmu
      #(
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_P_PAGE_SIZE             (CONFIG_P_PAGE_SIZE),
        .CONFIG_DMMU_ENABLE_UNCACHED_SEG(CONFIG_DMMU_ENABLE_UNCACHED_SEG),
        .CONFIG_DTLB_P_SETS             (CONFIG_DTLB_P_SETS))
   U_D_MMU
      (
         .clk                          (clk),
         .rst                          (rst),
         .re                           (s1i_tlb_req),
         .vpn                          (s1i_dc_vaddr[CONFIG_AW-1:CONFIG_P_PAGE_SIZE]),
         .we                           (s1i_store),
         .ppn                          (s2i_tlb_ppn),
         .EDTM                         (s2i_EDTM),
         .EDPF                         (s2i_EDPF),
         .uncached                     (s2i_tlb_uncached),
         .msr_psr_dmme                 (msr_psr_dmme),
         .msr_psr_rm                   (msr_psr_rm),
         .msr_dmmid                    (msr_dmmid),
         .msr_dmm_tlbl_idx             (msr_dmm_tlbl_idx),
         .msr_dmm_tlbl_nxt             (msr_dmm_tlbl_nxt),
         .msr_dmm_tlbl_we              (msr_dmm_tlbl_we),
         .msr_dmm_tlbh_idx             (msr_dmm_tlbh_idx),
         .msr_dmm_tlbh_nxt             (msr_dmm_tlbh_nxt),
         .msr_dmm_tlbh_we              (msr_dmm_tlbh_we)
      );
   assign s2i_tlb_exc = (s2i_EDTM | s2i_EDPF | s1o_EALIGN);
   assign s2i_kill_req = (s2i_tlb_exc);
   assign s2i_uncached = (s2i_tlb_uncached | ~s1o_msr_psr_dce);
   assign s2i_dc_ppn = (s1o_dcop)
                        ? s1o_vaddr[CONFIG_AW-1:CONFIG_P_PAGE_SIZE]
                        : s2i_tlb_ppn;
   ysyx_210479_dcache
      #(
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_P_DW                    (CONFIG_P_DW),
        .CONFIG_P_PAGE_SIZE             (CONFIG_P_PAGE_SIZE),
        .CONFIG_DC_P_LINE               (CONFIG_DC_P_LINE),
        .CONFIG_DC_P_SETS               (CONFIG_DC_P_SETS),
        .CONFIG_DC_P_WAYS               (CONFIG_DC_P_WAYS),
        .AXI_P_DW_BYTES                 (AXI_P_DW_BYTES),
        .AXI_ADDR_WIDTH                 (AXI_ADDR_WIDTH),
        .AXI_ID_WIDTH                   (AXI_ID_WIDTH),
        .AXI_USER_WIDTH                 (AXI_USER_WIDTH))
   U_D_CACHE
      (
       .stall_req                       (dc_stall_req),          
       .dout                            (s2o_dout_32b),          
       .dbus_ARVALID                    (dbus_ARVALID),
       .dbus_ARADDR                     (dbus_ARADDR[AXI_ADDR_WIDTH-1:0]),
       .dbus_ARPROT                     (dbus_ARPROT[2:0]),
       .dbus_ARID                       (dbus_ARID[AXI_ID_WIDTH-1:0]),
       .dbus_ARUSER                     (dbus_ARUSER[AXI_USER_WIDTH-1:0]),
       .dbus_ARLEN                      (dbus_ARLEN[7:0]),
       .dbus_ARSIZE                     (dbus_ARSIZE[2:0]),
       .dbus_ARBURST                    (dbus_ARBURST[1:0]),
       .dbus_ARLOCK                     (dbus_ARLOCK),
       .dbus_ARCACHE                    (dbus_ARCACHE[3:0]),
       .dbus_ARQOS                      (dbus_ARQOS[3:0]),
       .dbus_ARREGION                   (dbus_ARREGION[3:0]),
       .dbus_RREADY                     (dbus_RREADY),
       .dbus_AWVALID                    (dbus_AWVALID),
       .dbus_AWADDR                     (dbus_AWADDR[AXI_ADDR_WIDTH-1:0]),
       .dbus_AWPROT                     (dbus_AWPROT[2:0]),
       .dbus_AWID                       (dbus_AWID[AXI_ID_WIDTH-1:0]),
       .dbus_AWUSER                     (dbus_AWUSER[AXI_USER_WIDTH-1:0]),
       .dbus_AWLEN                      (dbus_AWLEN[7:0]),
       .dbus_AWSIZE                     (dbus_AWSIZE[2:0]),
       .dbus_AWBURST                    (dbus_AWBURST[1:0]),
       .dbus_AWLOCK                     (dbus_AWLOCK),
       .dbus_AWCACHE                    (dbus_AWCACHE[3:0]),
       .dbus_AWQOS                      (dbus_AWQOS[3:0]),
       .dbus_AWREGION                   (dbus_AWREGION[3:0]),
       .dbus_WVALID                     (dbus_WVALID),
       .dbus_WDATA                      (dbus_WDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .dbus_WSTRB                      (dbus_WSTRB[(1<<AXI_P_DW_BYTES)-1:0]),
       .dbus_WLAST                      (dbus_WLAST),
       .dbus_WUSER                      (dbus_WUSER[AXI_USER_WIDTH-1:0]),
       .dbus_BREADY                     (dbus_BREADY),
       .msr_dcid                        (msr_dcid[CONFIG_DW-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .req                             (s1i_dc_req),            
       .size                            (s1i_size),              
       .wmsk                            (s1i_dc_wmsk),           
       .wdat                            (s1i_dc_wdat),           
       .vpo                             (s1i_dc_vpo),            
       .ppn_s2                          (s2i_dc_ppn),            
       .kill_req_s2                     (s2i_kill_req),          
       .uncached_s2                     (s2i_uncached),          
       .inv                             (msr_dcinv_we),          
       .fls                             (msr_dcfls_we),          
       .dbus_ARREADY                    (dbus_ARREADY),
       .dbus_RVALID                     (dbus_RVALID),
       .dbus_RDATA                      (dbus_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .dbus_RLAST                      (dbus_RLAST),
       .dbus_AWREADY                    (dbus_AWREADY),
       .dbus_WREADY                     (dbus_WREADY),
       .dbus_BVALID                     (dbus_BVALID),
       .dbus_RRESP                      (dbus_RRESP[1:0]),
       .dbus_RID                        (dbus_RID[AXI_ID_WIDTH-1:0]),
       .dbus_RUSER                      (dbus_RUSER[AXI_USER_WIDTH-1:0]),
       .dbus_BRESP                      (dbus_BRESP[1:0]),
       .dbus_BID                        (dbus_BID[AXI_ID_WIDTH-1:0]),
       .dbus_BUSER                      (dbus_BUSER[AXI_USER_WIDTH-1:0]));
   ysyx_210479_mDFF_lr #(.DW(3)) ff_s1o_size (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(s1i_size), .Q(s1o_size) );
   ysyx_210479_mDFF_lr #(.DW(CONFIG_AW)) ff_s1o_vaddr (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(s1i_dc_vaddr), .Q(s1o_vaddr) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s1o_sign_ext (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(s1i_sign_ext), .Q(s1o_sign_ext) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s1o_dcop (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(s1i_dcop), .Q(s1o_dcop) );
   ysyx_210479_mDFF_lr #(.DW(CONFIG_AW)) ff_s2o_vaddr (.CLK(clk),.RST(rst), .LOAD(p_ce_s2), .D(s1o_vaddr), .Q(s2o_vaddr) );
   ysyx_210479_mDFF_lr #(.DW(3)) ff_s2o_size (.CLK(clk),.RST(rst), .LOAD(p_ce_s2), .D(s1o_size), .Q(s2o_size) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s2o_sign_ext (.CLK(clk),.RST(rst), .LOAD(p_ce_s2), .D(s1o_sign_ext), .Q(s2o_sign_ext) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s1o_valid (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(s1i_valid), .Q(s1o_valid) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s1o_misalign (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(s1i_misalign), .Q(s1o_EALIGN) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s1o_msr_psr_dce (.CLK(clk), .RST(rst), .LOAD(p_ce_s1), .D(msr_psr_dce), .Q(s1o_msr_psr_dce) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s2o_valid (.CLK(clk), .RST(rst), .LOAD(p_ce_s2), .D(s1o_valid), .Q(s2o_valid) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s2o_EDTM (.CLK(clk), .RST(rst), .LOAD(p_ce_s2), .D(s2i_EDTM), .Q(s2o_EDTM) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s2o_EDPF (.CLK(clk), .RST(rst), .LOAD(p_ce_s2), .D(s2i_EDPF), .Q(s2o_EDPF) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_s2o_EALIGN (.CLK(clk), .RST(rst), .LOAD(p_ce_s2), .D(s1o_EALIGN), .Q(s2o_EALIGN) );
   assign s2o_dout_8b = ({8{s2o_vaddr[1:0]==2'b00}} & s2o_dout_32b[7:0]) |
                          ({8{s2o_vaddr[1:0]==2'b01}} & s2o_dout_32b[15:8]) |
                          ({8{s2o_vaddr[1:0]==2'b10}} & s2o_dout_32b[23:16]) |
                          ({8{s2o_vaddr[1:0]==2'b11}} & s2o_dout_32b[31:24]);
   assign s2o_dout_16b = s2o_vaddr[1] ? s2o_dout_32b[31:16] : s2o_dout_32b[15:0];
   assign lsu_wb_dout =
      ({CONFIG_DW{s2o_size==3'd2}} & s2o_dout_32b) |
      ({CONFIG_DW{s2o_size==3'd1}} & {{16{s2o_sign_ext & s2o_dout_16b[15]}}, s2o_dout_16b[15:0]}) |
      ({CONFIG_DW{s2o_size==3'd0}} & {{24{s2o_sign_ext & s2o_dout_8b[7]}}, s2o_dout_8b[7:0]});
   assign lsu_EDTM = (s2o_valid & s2o_EDTM);
   assign lsu_EDPF = (s2o_valid & s2o_EDPF);
   assign lsu_EALIGN = (s2o_valid & s2o_EALIGN);
   assign lsu_vaddr = s2o_vaddr;
   assign lsu_wb_valid = (s2o_valid & p_ce_s3);
   assign lsu_stall_req = (dc_stall_req);
endmodule
module ysyx_210479_cmt_psr
#(
   parameter                           CONFIG_DW = 0,
   parameter [7:0]                     CPUID_VER = 1,
   parameter [9:0]                     CPUID_REV = 0,
   parameter [0:0]                     CPUID_FIMM = 1,
   parameter [0:0]                     CPUID_FDMM = 1,
   parameter [0:0]                     CPUID_FICA = 0,
   parameter [0:0]                     CPUID_FDCA = 0,
   parameter [0:0]                     CPUID_FDBG = 0,
   parameter [0:0]                     CPUID_FFPU = 0,
   parameter [0:0]                     CPUID_FIRQC = 1,
   parameter [0:0]                     CPUID_FTSC = 1
)
(
   input                               clk,
   input                               rst,
   input                               msr_psr_save,
   input                               msr_psr_restore,
   output [10-1:0]           msr_psr,
   input                               msr_psr_rm_nxt,
   output                              msr_psr_rm,
   input                               msr_psr_rm_we,
   input                               msr_psr_ire_nxt,
   output                              msr_psr_ire,
   input                               msr_psr_ire_we,
   input                               msr_psr_imme_nxt,
   output                              msr_psr_imme,
   input                               msr_psr_imme_we,
   input                               msr_psr_dmme_nxt,
   output                              msr_psr_dmme,
   input                               msr_psr_dmme_we,
   input                               msr_psr_ice_nxt,
   output                              msr_psr_ice,
   input                               msr_psr_ice_we,
   input                               msr_psr_dce_nxt,
   output                              msr_psr_dce,
   input                               msr_psr_dce_we,
   output [CONFIG_DW-1:0]              msr_cpuid,
   input [10-1:0]            msr_epsr_nxt,
   output [10-1:0]           msr_epsr,
   input                               msr_epsr_we,
   input [CONFIG_DW-1:0]               msr_epc_nxt,
   output [CONFIG_DW-1:0]              msr_epc,
   input                               msr_epc_we,
   input [CONFIG_DW-1:0]               msr_elsa_nxt,
   output [CONFIG_DW-1:0]              msr_elsa,
   input                               msr_elsa_we,
   output [CONFIG_DW-1:0]              msr_coreid,
   input [CONFIG_DW-1:8]    msr_evect_nxt,
   output [CONFIG_DW-1:8]   msr_evect,
   input                               msr_evect_we,
   output [CONFIG_DW*4-1:0] msr_sr,
   input [CONFIG_DW-1:0]               msr_sr_nxt,
   input [4-1:0]            msr_sr_we
);
   wire                                msr_psr_rm_ff;
   wire                                msr_psr_ire_ff;
   wire                                msr_psr_imme_ff;
   wire                                msr_psr_dmme_ff;
   wire                                msr_psr_rm_nold;
   wire                                msr_psr_ire_nold;
   wire                                msr_psr_imme_nold;
   wire                                msr_psr_dmme_nold;
   wire                                msr_psr_ice_ff;
   wire                                msr_psr_dce_ff;
   wire [10-1:0]             msr_psr_nold;
   wire [10-1:0]             msr_epsr_ff;
   wire [CONFIG_DW-1:0]                msr_epc_ff;
   wire [CONFIG_DW-1:0]                msr_elsa_ff;
   wire [CONFIG_DW-1:8]     msr_evect_ff;
   wire [CONFIG_DW*4-1:0]   msr_sr_ff;
   wire                                psr_rm_set;
   wire                                psr_imme_msk;
   wire                                psr_dmme_msk;
   wire                                psr_ire_msk;
   wire                                psr_ld;
   wire                                psr_rm_we;
   wire                                psr_rm_nxt;
   wire                                psr_imme_we;
   wire                                psr_imme_nxt;
   wire                                psr_dmme_we;
   wire                                psr_dmme_nxt;
   wire                                psr_ire_we;
   wire                                psr_ire_nxt;
   wire                                epsr_we;
   wire [10-1:0]             epsr_nxt;
   wire                                epsr_rm_nold;
   wire                                epsr_ire_nold;
   wire                                epsr_imme_nold;
   wire                                epsr_dmme_nold;
   genvar                              i;
   assign psr_ld = msr_psr_save;
   assign psr_rm_set = msr_psr_save;
   assign psr_imme_msk = ~msr_psr_save;
   assign psr_dmme_msk = ~msr_psr_save;
   assign psr_ire_msk = ~msr_psr_save;
   assign epsr_we = (msr_epsr_we | msr_psr_save);
   assign epsr_nxt = msr_psr_save ? msr_psr_nold : msr_epsr_nxt;
   assign psr_rm_we = (msr_psr_rm_we | msr_psr_restore);
   assign psr_rm_nxt = (msr_psr_restore) ? epsr_rm_nold : msr_psr_rm_nxt;
   assign psr_imme_we = (msr_psr_imme_we | msr_psr_restore);
   assign psr_imme_nxt = (msr_psr_restore) ? epsr_imme_nold : msr_psr_imme_nxt;
   assign psr_dmme_we = (msr_psr_dmme_we | msr_psr_restore);
   assign psr_dmme_nxt = (msr_psr_restore) ? epsr_dmme_nold : msr_psr_dmme_nxt;
   assign psr_ire_we = (msr_psr_ire_we | msr_psr_restore);
   assign psr_ire_nxt = (msr_psr_restore) ? epsr_ire_nold : msr_psr_ire_nxt;
   ysyx_210479_mDFF_lr #(.DW(1), .RST_VECTOR(1'b1)) ff_msr_psr_rm (.CLK(clk), .RST(rst), .LOAD(psr_rm_we|psr_ld), .D(psr_rm_nxt|psr_rm_set), .Q(msr_psr_rm_ff) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_msr_psr_ire (.CLK(clk), .RST(rst), .LOAD(psr_ire_we|psr_ld), .D(psr_ire_nxt&psr_ire_msk), .Q(msr_psr_ire_ff) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_msr_psr_imme (.CLK(clk), .RST(rst), .LOAD(psr_imme_we|psr_ld), .D(psr_imme_nxt&psr_imme_msk), .Q(msr_psr_imme_ff) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_msr_psr_dmme (.CLK(clk), .RST(rst), .LOAD(psr_dmme_we|psr_ld), .D(psr_dmme_nxt&psr_dmme_msk), .Q(msr_psr_dmme_ff) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_msr_psr_ice (.CLK(clk), .RST(rst), .LOAD(msr_psr_ice_we), .D(msr_psr_ice_nxt), .Q(msr_psr_ice_ff) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_msr_psr_dce (.CLK(clk), .RST(rst), .LOAD(msr_psr_dce_we), .D(msr_psr_dce_nxt), .Q(msr_psr_dce_ff) );
   ysyx_210479_mDFF_lr #(.DW(10)) ff_msr_epsr (.CLK(clk), .RST(rst), .LOAD(epsr_we), .D(epsr_nxt), .Q(msr_epsr_ff) );
   ysyx_210479_mDFF_lr #(.DW(CONFIG_DW)) ff_msr_epc (.CLK(clk), .RST(rst), .LOAD(msr_epc_we), .D(msr_epc_nxt), .Q(msr_epc_ff) );
   ysyx_210479_mDFF_lr #(.DW(CONFIG_DW)) dff_msr_elsa (.CLK(clk), .RST(rst), .LOAD(msr_elsa_we), .D(msr_elsa_nxt), .Q(msr_elsa_ff) );
   ysyx_210479_mDFF_lr #(.DW(CONFIG_DW-8)) dff_msr_evect (.CLK(clk), .RST(rst), .LOAD(msr_evect_we), .D(msr_evect_nxt), .Q(msr_evect_ff) );
   generate for(i=0;i<4;i=i+1)
      begin : gen_sr
         ysyx_210479_mDFF_lr #(.DW(CONFIG_DW)) dff_sr (.CLK(clk),.RST(rst), .LOAD(msr_sr_we[i]), .D(msr_sr_nxt), .Q(msr_sr_ff[i*CONFIG_DW +: CONFIG_DW]) );
      end
   endgenerate
   assign msr_psr_rm = (psr_rm_we|psr_ld) ? (psr_rm_nxt|psr_rm_set) : msr_psr_rm_ff;
   assign msr_psr_ire = (psr_ire_we|psr_ld) ? (psr_ire_nxt&psr_ire_msk) : msr_psr_ire_ff;
   assign msr_psr_imme = (psr_imme_we|psr_ld) ? (psr_imme_nxt&psr_imme_msk) : msr_psr_imme_ff;
   assign msr_psr_dmme = (psr_dmme_we|psr_ld) ? (psr_dmme_nxt&psr_dmme_msk) : msr_psr_dmme_ff;
   assign msr_psr_rm_nold = (psr_rm_we) ? psr_rm_nxt : msr_psr_rm_ff;
   assign msr_psr_ire_nold = (psr_ire_we) ? psr_ire_nxt : msr_psr_ire_ff;
   assign msr_psr_imme_nold = (psr_imme_we) ? psr_imme_nxt : msr_psr_imme_ff;
   assign msr_psr_dmme_nold = (psr_dmme_we) ? psr_dmme_nxt : msr_psr_dmme_ff;
   assign msr_psr_ice = (msr_psr_ice_we) ? (msr_psr_ice_nxt) : msr_psr_ice_ff;
   assign msr_psr_dce = (msr_psr_dce_we) ? (msr_psr_dce_nxt) : msr_psr_dce_ff;
   assign msr_epsr = epsr_we ? epsr_nxt : msr_epsr_ff;
   assign msr_epc = msr_epc_we ? msr_epc_nxt : msr_epc_ff;
   assign msr_elsa = msr_elsa_we ? msr_elsa_nxt : msr_elsa_ff;
   assign msr_evect = msr_evect_we ? msr_evect_nxt : msr_evect_ff;
   generate for(i=0;i<4;i=i+1)
      begin : gen_sr_out
         assign msr_sr[i*CONFIG_DW +: CONFIG_DW] = (msr_sr_we[i]) ? msr_sr_nxt : msr_sr_ff[i*CONFIG_DW +: CONFIG_DW];
      end
   endgenerate
   assign msr_psr = {msr_psr_dce,msr_psr_ice,msr_psr_dmme,msr_psr_imme,msr_psr_ire,msr_psr_rm,1'b0,1'b0,1'b0,1'b0};
   assign msr_psr_nold = {msr_psr_dce,msr_psr_ice,msr_psr_dmme_nold,msr_psr_imme_nold,msr_psr_ire_nold,msr_psr_rm_nold,1'b0,1'b0,1'b0,1'b0};
   assign {epsr_dmme_nold,epsr_imme_nold,epsr_ire_nold,epsr_rm_nold} = msr_epsr_ff[7:4];
   assign msr_cpuid = {{CONFIG_DW-26{1'b0}},CPUID_FTSC,CPUID_FIRQC,CPUID_FFPU,CPUID_FDBG,CPUID_FDCA,CPUID_FICA,CPUID_FDMM,CPUID_FIMM,CPUID_REV[9:0],CPUID_VER[7:0]};
   assign msr_coreid = {CONFIG_DW{1'b0}};
endmodule
module ysyx_210479_cmt_tsc
#(
   parameter                           CONFIG_DW = 0
)
(
   input                               clk,
   input                               rst,
   output                              tsc_irq,
   output [CONFIG_DW-1:0]              msr_tsc_tsr,
   input [CONFIG_DW-1:0]               msr_tsc_tsr_nxt,
   input                               msr_tsc_tsr_we,
   output [CONFIG_DW-1:0]              msr_tsc_tcr,
   input [CONFIG_DW-1:0]               msr_tsc_tcr_nxt,
   input                               msr_tsc_tcr_we
);
   wire [CONFIG_DW-1:0]                tcr_ff;
   wire [CONFIG_DW-1:0]                msr_tsc_tcr_ff;
   wire [28-1:0]         tcr_cnt;
   wire                                tcr_en;
   wire                                tcr_i;
   wire                                tcr_p;
   wire                                count;
   wire                                count_clk;
   wire [CONFIG_DW-1:0]                tsr_nxt;
   wire                                irq_set;
   wire                                irq_clr;
   ysyx_210479_mDFF_lr #(.DW(CONFIG_DW)) ff_tcr (.CLK(clk), .RST(rst), .LOAD(msr_tsc_tcr_we), .D(msr_tsc_tcr_nxt), .Q(tcr_ff) );
   assign msr_tsc_tcr_ff[28-1:0] = tcr_ff[28-1:0];
   assign msr_tsc_tcr_ff[28] = tcr_ff[28];
   assign msr_tsc_tcr_ff[29] = tcr_ff[29];
   assign msr_tsc_tcr_ff[30] = tsc_irq;
   assign msr_tsc_tcr_ff[31] = tcr_ff[31];
   assign msr_tsc_tcr = msr_tsc_tcr_we ? msr_tsc_tcr_nxt : msr_tsc_tcr_ff;
   assign tcr_cnt = msr_tsc_tcr[28-1:0];
   assign tcr_en = msr_tsc_tcr[28];
   assign tcr_i = msr_tsc_tcr[29];
   assign tcr_p = msr_tsc_tcr[30];
   assign count = tcr_en;
   assign count_clk = clk;
   assign tsr_nxt = msr_tsc_tsr_we ? msr_tsc_tsr_nxt : msr_tsc_tsr+1'b1;
   ysyx_210479_mDFF_lr #(.DW(CONFIG_DW)) ff_msr_tsc_tsr (.CLK(count_clk), .RST(rst), .LOAD(msr_tsc_tsr_we|count), .D(tsr_nxt), .Q(msr_tsc_tsr) );
   assign irq_set = (msr_tsc_tsr[28-1:0]==tcr_cnt) & tcr_i;
   assign irq_clr = msr_tsc_tcr_we & ~tcr_p;
   ysyx_210479_mDFF_lr #(1) ff_tsc_irq (.CLK(clk), .RST(rst), .LOAD(irq_set|irq_clr), .D(irq_set & ~irq_clr), .Q(tsc_irq) );
endmodule
module ysyx_210479_dcache
#(
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_P_DW = 0,
   parameter                           CONFIG_P_PAGE_SIZE = 0,
   parameter                           CONFIG_DC_P_LINE = 0,
   parameter                           CONFIG_DC_P_SETS = 0,
   parameter                           CONFIG_DC_P_WAYS = 0,
   parameter                           AXI_P_DW_BYTES    = 0,
   parameter                           AXI_ADDR_WIDTH    = 0,
   parameter                           AXI_ID_WIDTH      = 0,
   parameter                           AXI_USER_WIDTH    = 0
)
(
   input                               clk,
   input                               rst,
   output                              stall_req,
   input                               req,
   input [2:0]                         size,
   input [CONFIG_DW/8-1:0]             wmsk,
   input [CONFIG_DW-1:0]               wdat,
   input [CONFIG_P_PAGE_SIZE-1:0]      vpo,
   input [CONFIG_AW-CONFIG_P_PAGE_SIZE-1:0] ppn_s2,
   input                               kill_req_s2,
   input                               uncached_s2,
   input                               inv,
   input                               fls,
   output [CONFIG_DW-1:0]              dout,
   input                               dbus_ARREADY,
   output                              dbus_ARVALID,
   output [AXI_ADDR_WIDTH-1:0]         dbus_ARADDR,
   output [2:0]                        dbus_ARPROT,
   output [AXI_ID_WIDTH-1:0]           dbus_ARID,
   output [AXI_USER_WIDTH-1:0]         dbus_ARUSER,
   output [7:0]                        dbus_ARLEN,
   output [2:0]                        dbus_ARSIZE,
   output [1:0]                        dbus_ARBURST,
   output                              dbus_ARLOCK,
   output [3:0]                        dbus_ARCACHE,
   output [3:0]                        dbus_ARQOS,
   output [3:0]                        dbus_ARREGION,
   output                              dbus_RREADY,
   input                               dbus_RVALID,
   input  [(1<<AXI_P_DW_BYTES)*8-1:0]  dbus_RDATA,
   input                               dbus_RLAST,
   input                               dbus_AWREADY,
   output                              dbus_AWVALID,
   output [AXI_ADDR_WIDTH-1:0]         dbus_AWADDR,
   output [2:0]                        dbus_AWPROT,
   output [AXI_ID_WIDTH-1:0]           dbus_AWID,
   output [AXI_USER_WIDTH-1:0]         dbus_AWUSER,
   output [7:0]                        dbus_AWLEN,
   output [2:0]                        dbus_AWSIZE,
   output [1:0]                        dbus_AWBURST,
   output                              dbus_AWLOCK,
   output [3:0]                        dbus_AWCACHE,
   output [3:0]                        dbus_AWQOS,
   output [3:0]                        dbus_AWREGION,
   input                               dbus_WREADY,
   output                              dbus_WVALID,
   output [(1<<AXI_P_DW_BYTES)*8-1:0]  dbus_WDATA,
   output [(1<<AXI_P_DW_BYTES)-1:0]    dbus_WSTRB,
   output                              dbus_WLAST,
   output [AXI_USER_WIDTH-1:0]         dbus_WUSER,
   output                              dbus_BREADY,
   input                               dbus_BVALID,
   input  [1:0]                        dbus_RRESP, 
   input  [AXI_ID_WIDTH-1:0]           dbus_RID, 
   input  [AXI_USER_WIDTH-1:0]         dbus_RUSER, 
   input [1:0]                         dbus_BRESP, 
   input [AXI_ID_WIDTH-1:0]            dbus_BID, 
   input [AXI_USER_WIDTH-1:0]          dbus_BUSER, 
   output [CONFIG_DW-1:0]              msr_dcid
);
   localparam TAG_WIDTH                = (CONFIG_AW - CONFIG_DC_P_SETS - CONFIG_DC_P_LINE);
   localparam TAG_V_RAM_AW             = (CONFIG_DC_P_SETS);
   localparam TAG_V_RAM_DW             = (TAG_WIDTH + 1); 
   localparam PAYLOAD_DW               = (CONFIG_DW);
   localparam PAYLOAD_P_DW_BYTES       = (CONFIG_P_DW-3); 
   localparam PAYLOAD_AW               = (CONFIG_DC_P_SETS + CONFIG_DC_P_LINE - PAYLOAD_P_DW_BYTES);
   localparam AXI_FETCH_SIZE           = (PAYLOAD_P_DW_BYTES <= AXI_P_DW_BYTES) ? PAYLOAD_P_DW_BYTES : AXI_P_DW_BYTES;
   reg [CONFIG_DC_P_SETS-1:0]          s1i_line_addr;
   reg [TAG_V_RAM_DW-1:0]              s1i_replace_tag_v;
   wire                                s1i_tag_v_re;
   wire                                s1i_tag_v_we            [(1<<CONFIG_DC_P_WAYS)-1:0];
   wire                                s1o_inv;
   wire                                s1o_fls;
   reg                                 s2i_ready;
   wire                                s2i_d_we                [(1<<CONFIG_DC_P_WAYS)-1:0];
   reg [TAG_V_RAM_AW-1:0]              s2i_d_waddr;
   reg                                 s2i_d_wdat              [(1<<CONFIG_DC_P_WAYS)-1:0];
   wire [PAYLOAD_DW/8-1:0]             s2i_payload_we          [(1<<CONFIG_DC_P_WAYS)-1:0];
   wire [PAYLOAD_DW/8-1:0]             s2i_payload_tgt_we;
   reg [PAYLOAD_DW-1:0]                s2i_payload_din;
   wire [PAYLOAD_DW/8-1:0]             s2i_wb_we;
   wire [PAYLOAD_DW-1:0]               s2i_wb_din;
   wire                                s2i_wb_re;
   wire [2:0]                          s1o_size;
   wire [CONFIG_DW/8-1:0]              s1o_wmsk;
   wire [CONFIG_DW-1:0]                s1o_wdat;
   wire [CONFIG_DC_P_SETS-1:0]         s1o_line_addr;
   reg [PAYLOAD_AW-1:0]                s2i_payload_addr;
   wire                                s2i_payload_re;
   wire                                s1o_valid;
   wire [TAG_V_RAM_DW-1:0]             s1o_tag_v               [(1<<CONFIG_DC_P_WAYS)-1:0];
   wire [(1<<CONFIG_DC_P_WAYS)-1:0]    s1o_d;
   wire                                s1o_free_dirty;
   wire [TAG_WIDTH-1:0]                s2i_free_tag;
   wire [CONFIG_P_PAGE_SIZE-1:0]       s1o_vpo;
   wire [CONFIG_AW-1:0]                s2i_paddr;
   wire [TAG_WIDTH-1:0]                s2i_tag                 [(1<<CONFIG_DC_P_WAYS)-1:0];
   wire [TAG_WIDTH*(1<<CONFIG_DC_P_WAYS)-1:0] s2i_tag_packed;
   wire                                s2i_v                   [(1<<CONFIG_DC_P_WAYS)-1:0];
   wire [(1<<CONFIG_DC_P_WAYS)-1:0]    s2i_hit_vec;
   wire                                s2i_hit;
   wire [(1<<CONFIG_DC_P_WAYS)-1:0]    s2i_match_vec;
   wire                                s2i_match_vec_ce;
   wire [(1<<CONFIG_DC_P_WAYS)-1:0]    s2o_fsm_free_way;
   wire [(1<<CONFIG_DC_P_WAYS)-1:0]    s2i_wb_way;
   wire                                s2o_fls;
   wire [CONFIG_DC_P_SETS-1:0]         s2o_line_addr;
   wire [CONFIG_AW-1:0]                s2o_paddr;
   wire [CONFIG_DW/8-1:0]              s2o_wmsk;
   wire [CONFIG_DW-1:0]                s2o_wdat;
   wire [PAYLOAD_DW*(1<<CONFIG_DC_P_WAYS)-1:0] s2o_payload;
   wire [(1<<CONFIG_DC_P_WAYS)-1:0]    s2o_match_vec;
   wire [PAYLOAD_DW-1:0]               s2o_match_payload;
   wire [PAYLOAD_DW-1:0]               s2o_wb_payload;
   wire                                s2o_free_dirty;
   wire [TAG_WIDTH-1:0]                s2o_free_tag;
   wire [(1<<CONFIG_DC_P_WAYS)-1:0]    s2o_d;
   wire                                s2o_match_dirty;
   wire [PAYLOAD_AW-1:0]               s2o_payload_addr;
   wire [CONFIG_DC_P_LINE-1:0]         s2o_wb_addr;
   wire [2:0]                          s2o_size;
   wire                                s2o_uncached;
   reg [3:0]                           fsm_state_nxt;
   wire [3:0]                          fsm_state_ff;
   wire [(1<<CONFIG_DC_P_WAYS)-1:0]    fsm_free_way, fsm_free_way_nxt;
   wire [CONFIG_DC_P_SETS-1:0]         fsm_boot_cnt;
   wire [CONFIG_DC_P_SETS:0]           fsm_boot_cnt_nxt_carry;
   wire [CONFIG_DC_P_LINE-1:0]         fsm_refill_cnt;
   wire [CONFIG_DC_P_LINE:0]           fsm_refill_cnt_nxt_carry;
   reg [CONFIG_DC_P_LINE-1:0]          fsm_refill_cnt_nxt;
   reg                                 fsm_uncached_req;
   wire                                p_ce;
   wire [CONFIG_AW-1:0]                axi_paddr_nxt;
   reg                                 ar_set, aw_set;
   wire                                ar_clr, aw_clr;
   wire                                wvalid_set, wvalid_clr;
   wire                                wlast_set, wlast_clr;
   wire                                hds_axi_R;
   wire                                hds_axi_R_last;
   wire                                hds_axi_W;
   wire                                hds_axi_W_last;
   wire                                hds_axi_B;
   wire [AXI_ADDR_WIDTH-1:0]           axi_arw_addr_nxt;
   wire [PAYLOAD_DW-1:0]               axi_aligned_rdata_ff;
   wire [PAYLOAD_DW/8-1:0]             axi_aligned_rdata_ff_wmsk;
   wire [PAYLOAD_DW-1:0]               axi_aligned_rdata_nxt;
   wire [(1<<AXI_P_DW_BYTES)-1:0]      axi_align_be;
   wire [(1<<AXI_P_DW_BYTES)*8-1:0]    axi_align_dat;
   wire [(1<<AXI_P_DW_BYTES)-1:0]      axi_uncached_wstrb;
   wire [(1<<AXI_P_DW_BYTES)*8-1:0]    axi_uncached_wdata;
   reg  [(1<<AXI_P_DW_BYTES)*8-1:0]    axi_uncached_wdata8, axi_uncached_wdata16, axi_uncached_wdata32;
   localparam [3:0] S_BOOT             = 4'd0;
   localparam [3:0] S_IDLE             = 4'd1;
   localparam [3:0] S_REPLACE          = 4'd2;
   localparam [3:0] S_REFILL           = 4'd3;
   localparam [3:0] S_WRITEBACK        = 4'd4;
   localparam [3:0] S_INVALIDATE       = 4'd5;
   localparam [3:0] S_RELOAD_S1O_S2O   = 4'd6;
   localparam [3:0] S_FLUSH            = 4'd7;
   localparam [3:0] S_UNCACHED_BOOT    = 4'd8;
   localparam [3:0] S_UNCACHED_READ    = 4'd9;
   localparam [3:0] S_UNCACHED_WRITE   = 4'd10;
   genvar way;
   assign p_ce = (~stall_req);
   generate for(way=0; way<(1<<CONFIG_DC_P_WAYS); way=way+1)
      begin : gen_ways
         wire rf_d, rf_d_ff;
         wire rf_conflict;
         wire rf_bypass;
         ysyx_210479_mRAM_s_s_be
            #(
               .P_DW (PAYLOAD_P_DW_BYTES + 3),
               .AW   (PAYLOAD_AW)
            )
         U_PAYLOAD_RAM
            (
               .CLK  (clk),
               .RST  (rst),
               .ADDR (s2i_payload_addr),
               .RE   (s2i_payload_re),
               .DOUT (s2o_payload[way*PAYLOAD_DW +: PAYLOAD_DW]),
               .WE   (s2i_payload_we[way]),
               .DIN  (s2i_payload_din)
            );
         ysyx_210479_mRF_1wr_r
            #(
               .DW   (TAG_V_RAM_DW),
               .AW   (TAG_V_RAM_AW)
            )
         U_TAG_V_RAM
            (
               .CLK  (clk),
               .RST(rst),
               .ADDR (s1i_line_addr),
               .RE   (s1i_tag_v_re),
               .RDATA (s1o_tag_v[way]),
               .WE   (s1i_tag_v_we[way]),
               .WDATA (s1i_replace_tag_v)
            );
         ysyx_210479_mRF_nwnr_r
            #(
               .DW   (1),
               .AW   (TAG_V_RAM_AW),
               .NUM_READ (1),
               .NUM_WRITE (1)
            )
         U_D_RF
            (
               .CLK     (clk),
               .RST(rst),
               .RE      (s1i_tag_v_re),
               .RADDR   (s1i_line_addr),
               .RDATA   (rf_d),
               .WE      (s2i_d_we[way]),
               .WADDR   (s2i_d_waddr),
               .WDATA   (s2i_d_wdat[way])
            );
         assign rf_conflict = ((s1i_line_addr == s2i_d_waddr) & s2i_d_we[way]);
         ysyx_210479_mDFF_lr #(.DW(1)) ff_bypass (.CLK(clk), .RST(rst), .LOAD(rf_conflict | s1i_tag_v_re), .D(rf_conflict | ~s1i_tag_v_re), .Q(rf_bypass) );
         ysyx_210479_mDFF_lr #(.DW(1)) ff_rd_d (.CLK(clk),.RST(rst), .LOAD(s1i_tag_v_re), .D(s2i_d_wdat[way]), .Q(rf_d_ff) );
         assign s1o_d[way] = rf_bypass ? rf_d_ff : rf_d;
         assign {s2i_tag[way], s2i_v[way]} = s1o_tag_v[way];
         assign s2i_tag_packed[way * TAG_WIDTH +: TAG_WIDTH] = s2i_tag[way];
         assign s2i_hit_vec[way] = (s2i_v[way] & (s2i_tag[way] == s2i_paddr[CONFIG_AW-1:CONFIG_DC_P_LINE+CONFIG_DC_P_SETS]) );
      end
   endgenerate
   assign s2i_hit = (|s2i_hit_vec);
   assign s2i_match_vec = (fsm_state_ff==S_RELOAD_S1O_S2O) ? s2o_fsm_free_way : s2i_hit_vec;
   assign s2i_match_vec_ce = (p_ce | (fsm_state_ff==S_RELOAD_S1O_S2O));
   assign s2i_wb_way = (s2o_fls) ? s2o_match_vec : s2o_fsm_free_way;
   ysyx_210479_pmux #(.SELW(1<<CONFIG_DC_P_WAYS), .DW(PAYLOAD_DW)) pmux_s2o_payload (.sel(s2o_match_vec), .din(s2o_payload), .dout(s2o_match_payload));
   ysyx_210479_pmux #(.SELW(1<<CONFIG_DC_P_WAYS), .DW(1)) pmux_s2o_d (.sel(s2o_match_vec), .din(s2o_d), .dout(s2o_match_dirty));
   ysyx_210479_pmux #(.SELW(1<<CONFIG_DC_P_WAYS), .DW(PAYLOAD_DW)) pmux_s2o_wb_payload (.sel(s2i_wb_way), .din(s2o_payload), .dout(s2o_wb_payload));
   ysyx_210479_pmux #(.SELW(1<<CONFIG_DC_P_WAYS), .DW(1)) pmux_s1o_free_dirty (.sel(fsm_free_way), .din(s1o_d), .dout(s1o_free_dirty));
   ysyx_210479_pmux #(.SELW(1<<CONFIG_DC_P_WAYS), .DW(TAG_WIDTH)) pmux_s2i_free_tag (.sel(fsm_free_way), .din(s2i_tag_packed), .dout(s2i_free_tag));
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_valid (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(req), .Q(s1o_valid) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_inv (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(inv), .Q(s1o_inv) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_fls (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(fls), .Q(s1o_fls) );
   ysyx_210479_mDFF_lr # (.DW(3)) ff_s1o_size (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(size), .Q(s1o_size) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DW/8)) ff_s1o_wmsk (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(wmsk), .Q(s1o_wmsk) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DW)) ff_s1o_wdat (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(wdat), .Q(s1o_wdat) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_P_PAGE_SIZE)) ff_s1o_vpo (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(vpo), .Q(s1o_vpo) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DC_P_SETS)) ff_s1o_line_addr (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_line_addr), .Q(s1o_line_addr) );
   ysyx_210479_mDFF_lr # (.DW(1<<CONFIG_DC_P_WAYS)) ff_s2o_match_vec (.CLK(clk),.RST(rst), .LOAD(s2i_match_vec_ce), .D(s2i_match_vec), .Q(s2o_match_vec) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DC_P_SETS)) ff_s2o_line_addr (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1o_line_addr), .Q(s2o_line_addr) );
   ysyx_210479_mDFF_lr # (.DW(1<<CONFIG_DC_P_WAYS)) ff_s2o_fsm_free_way (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(fsm_free_way), .Q(s2o_fsm_free_way) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s2o_fls (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(s1o_fls), .Q(s2o_fls) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_AW)) ff_s2o_paddr (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s2i_paddr), .Q(s2o_paddr) );
   ysyx_210479_mDFF_lr # (.DW(1<<CONFIG_DC_P_WAYS)) ff_s2o_d (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1o_d), .Q(s2o_d) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s2o_free_dirty (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1o_free_dirty), .Q(s2o_free_dirty) );
   ysyx_210479_mDFF_lr # (.DW(TAG_WIDTH)) ff_s2o_free_tag (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s2i_free_tag), .Q(s2o_free_tag) );
   ysyx_210479_mDFF_lr # (.DW(PAYLOAD_AW)) ff_s2o_payload_addr (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s2i_payload_addr), .Q(s2o_payload_addr) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DC_P_LINE)) ff_s2o_wb_addr (.CLK(clk),.RST(rst), .LOAD(s2i_wb_re), .D(fsm_refill_cnt), .Q(s2o_wb_addr) );
   ysyx_210479_mDFF_lr # (.DW(3)) ff_s2o_size (.CLK(clk), .LOAD(p_ce),.RST(rst), .D(s1o_size), .Q(s2o_size) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DW)) ff_s2o_wdat (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1o_wdat), .Q(s2o_wdat) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DW/8)) ff_s2o_wmsk (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(s1o_wmsk), .Q(s2o_wmsk) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s2o_use_uncached_dout (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(uncached_s2), .Q(s2o_uncached) );
   always @(*)
      begin
         fsm_state_nxt = fsm_state_ff;
         ar_set = 1'b0;
         aw_set = 1'b0;
         fsm_uncached_req = 1'b0;
         s2i_ready = 1'b0;
         case (fsm_state_ff)
            S_BOOT:
               if (fsm_boot_cnt_nxt_carry[CONFIG_DC_P_SETS])
                  fsm_state_nxt = S_IDLE;
            S_IDLE:
               if (s1o_valid)
                  if (s1o_inv)
                     fsm_state_nxt = S_INVALIDATE;
                  else if (s1o_fls)
                     fsm_state_nxt = s2i_hit ? S_FLUSH : S_IDLE;
                  else if (uncached_s2 & ~kill_req_s2) 
                     fsm_state_nxt = S_UNCACHED_BOOT;
                  else if (~s2i_hit & ~uncached_s2 & ~kill_req_s2) 
                     fsm_state_nxt = S_REPLACE;
                  else if (s2i_hit & ~uncached_s2 & ~kill_req_s2) 
                     s2i_ready = 'b1;
            S_REPLACE:
               begin
                  fsm_state_nxt = (s2o_free_dirty) ? S_WRITEBACK : S_REFILL;
                  ar_set = ~s2o_free_dirty;
                  aw_set = s2o_free_dirty;
               end
            S_WRITEBACK:
               if (hds_axi_B)
                  begin
                     fsm_state_nxt = (s2o_fls) ? S_IDLE : S_REFILL;
                     ar_set = ~s2o_fls;
                  end
            S_REFILL:
               if (hds_axi_R_last)
                  fsm_state_nxt = S_RELOAD_S1O_S2O;
            S_INVALIDATE:
               fsm_state_nxt = S_IDLE;
            S_RELOAD_S1O_S2O:
               fsm_state_nxt = S_IDLE;
            S_FLUSH:
               begin
                  fsm_state_nxt = (s2o_match_dirty) ? S_WRITEBACK : S_IDLE;
                  aw_set = s2o_match_dirty;
               end
            S_UNCACHED_BOOT:
               begin
                  fsm_state_nxt = (|s2o_wmsk) ? S_UNCACHED_WRITE : S_UNCACHED_READ;
                  ar_set = ~(|s2o_wmsk);
                  aw_set = (|s2o_wmsk);
                  fsm_uncached_req = 'b1;
               end
            S_UNCACHED_READ:
               if (hds_axi_R)
                  fsm_state_nxt = S_IDLE;
            S_UNCACHED_WRITE:
               if (hds_axi_B)
                  fsm_state_nxt = S_IDLE;
            default:
               fsm_state_nxt = fsm_state_ff;
         endcase
      end
   ysyx_210479_mDFF_r # (.DW(4), .RST_VECTOR(S_BOOT)) ff_state_r (.CLK(clk), .RST(rst), .D(fsm_state_nxt), .Q(fsm_state_ff) );
   assign fsm_free_way_nxt = (fsm_free_way[(1<<CONFIG_DC_P_WAYS)-1])
                              ? {{(1<<CONFIG_DC_P_WAYS)-1{1'b0}}, 1'b1}
                              : {fsm_free_way[(1<<CONFIG_DC_P_WAYS)-2:0], 1'b0};
   ysyx_210479_mDFF_r #(.DW(1<<CONFIG_DC_P_WAYS), .RST_VECTOR({{(1<<CONFIG_DC_P_WAYS)-1{1'b0}}, 1'b1}) ) ff_fsm_free_idx
      (.CLK(clk), .RST(rst), .D(fsm_free_way_nxt), .Q(fsm_free_way) );
   assign fsm_boot_cnt_nxt_carry = fsm_boot_cnt + {{CONFIG_DC_P_SETS-1{1'b0}}, 1'b1};
   ysyx_210479_mDFF_r # (.DW(CONFIG_DC_P_SETS)) ff_fsm_boot_cnt_nxt (.CLK(clk), .RST(rst), .D(fsm_boot_cnt_nxt_carry[CONFIG_DC_P_SETS-1:0]), .Q(fsm_boot_cnt) );
   always @(*)
      if (((fsm_state_ff==S_REFILL) & hds_axi_R) | s2i_wb_re)
         fsm_refill_cnt_nxt = fsm_refill_cnt_nxt_carry[CONFIG_DC_P_LINE-1:0];
      else
         fsm_refill_cnt_nxt = fsm_refill_cnt;
   localparam [CONFIG_DC_P_LINE-1:0] FSM_REFILL_CNT_DELTA = (1<<AXI_FETCH_SIZE);
   assign fsm_refill_cnt_nxt_carry = (fsm_refill_cnt + FSM_REFILL_CNT_DELTA);
   ysyx_210479_mDFF_r # (.DW(CONFIG_DC_P_LINE)) ff_fsm_refill_cnt (.CLK(clk), .RST(rst), .D(fsm_refill_cnt_nxt), .Q(fsm_refill_cnt) );
   always @(*)
      case (fsm_state_ff)
         S_BOOT:
            s1i_line_addr = fsm_boot_cnt;
         S_INVALIDATE,
         S_REPLACE:
            s1i_line_addr = s2o_line_addr;
         S_RELOAD_S1O_S2O:
            s1i_line_addr = s1o_line_addr;
         default:
            s1i_line_addr = vpo[CONFIG_DC_P_LINE +: CONFIG_DC_P_SETS]; 
      endcase
   always @(*)
      case (fsm_state_ff)
         S_REPLACE:
            s1i_replace_tag_v = {s2o_paddr[CONFIG_AW-1:CONFIG_DC_P_LINE+CONFIG_DC_P_SETS], 1'b1};
         default: 
            s1i_replace_tag_v = {TAG_V_RAM_DW{1'b0}};
      endcase
   assign s1i_tag_v_re = (p_ce | (fsm_state_ff==S_RELOAD_S1O_S2O));
   generate for(way=0; way<(1<<CONFIG_DC_P_WAYS); way=way+1)
      begin : gen_tag_v_we
         assign s1i_tag_v_we[way] = (fsm_state_ff==S_BOOT) |
                                    (fsm_state_ff==S_INVALIDATE) |
                                    ((fsm_state_ff==S_REPLACE) & (s2o_fsm_free_way[way]));
      end
   endgenerate
   always @(*)
      case (fsm_state_ff)
         S_IDLE:
            s2i_d_waddr = s1o_line_addr;
         S_RELOAD_S1O_S2O:
            s2i_d_waddr = s2o_line_addr;
         default:
            s2i_d_waddr = s1i_line_addr;
      endcase
   generate for(way=0; way<(1<<CONFIG_DC_P_WAYS); way=way+1)
      begin : gen_d_wdat
         always @(*)
            case (fsm_state_ff)
               S_IDLE:
                  s2i_d_wdat[way] = s1o_d[way] | (|s1o_wmsk);
               S_RELOAD_S1O_S2O:
                  s2i_d_wdat[way] = s2o_d[way] | (|s2o_wmsk);
               default: 
                  s2i_d_wdat[way] = 1'b0;
            endcase
      end
   endgenerate
   generate for(way=0; way<(1<<CONFIG_DC_P_WAYS); way=way+1)
      begin : gen_d_we
         assign s2i_d_we[way] = (fsm_state_ff==S_BOOT) |
                                 (fsm_state_ff==S_INVALIDATE) |
                                 ((fsm_state_ff==S_REPLACE) & (s2o_fsm_free_way[way])) |
                                 ((fsm_state_ff==S_RELOAD_S1O_S2O) & s2o_fsm_free_way[way]) |
                                 (s2i_ready & s2i_hit_vec[way]);
      end
   endgenerate
   assign s2i_paddr = {ppn_s2, s1o_vpo};
   always @(*)
      if (s2i_wb_re)
         s2i_payload_addr = {s2o_paddr[CONFIG_DC_P_LINE +: CONFIG_DC_P_SETS], fsm_refill_cnt[PAYLOAD_P_DW_BYTES +: CONFIG_DC_P_LINE-PAYLOAD_P_DW_BYTES]};
      else
         case (fsm_state_ff)
            S_REFILL:
               s2i_payload_addr = {s2o_paddr[CONFIG_DC_P_LINE +: CONFIG_DC_P_SETS], fsm_refill_cnt[PAYLOAD_P_DW_BYTES +: CONFIG_DC_P_LINE-PAYLOAD_P_DW_BYTES]};
            S_RELOAD_S1O_S2O:
               s2i_payload_addr = s2o_payload_addr;
            default:
               s2i_payload_addr = s1o_vpo[PAYLOAD_P_DW_BYTES +: PAYLOAD_AW]; 
         endcase
   always @(*)
      case (fsm_state_ff)
         S_IDLE:
            s2i_payload_din = s1o_wdat;
         S_RELOAD_S1O_S2O:
            s2i_payload_din = s2o_wdat;
         default:
            s2i_payload_din = s2i_wb_din;
      endcase
   assign s2i_payload_re = (p_ce |
                              s2i_wb_re |
                              (fsm_state_ff==S_RELOAD_S1O_S2O));
   assign s2i_payload_tgt_we = ({CONFIG_DW/8{s2i_ready}} & s1o_wmsk) |
                                 ({CONFIG_DW/8{fsm_state_ff==S_RELOAD_S1O_S2O}} & s2o_wmsk) |
                                 s2i_wb_we;
   generate for(way=0;way<(1<<CONFIG_DC_P_WAYS);way=way+1)
      begin : gen_payload_we
         assign s2i_payload_we[way] = (s2i_payload_tgt_we &
                                       {CONFIG_DW/8{
                                          (s2i_ready & s2i_hit_vec[way]) |
                                          ((fsm_state_ff==S_RELOAD_S1O_S2O) & s2o_fsm_free_way[way]) |
                                          ((fsm_state_ff==S_REFILL) & s2o_fsm_free_way[way])
                                       }});
      end
   endgenerate
   ysyx_210479_align_r
      #(
         .IN_P_DW_BYTES                (AXI_P_DW_BYTES),
         .IN_AW                        (CONFIG_DC_P_LINE),
         .OUT_P_DW_BYTES               (PAYLOAD_P_DW_BYTES)
      )
   U_ALIGN_R
      (
         .i_dat                        (dbus_RDATA),
         .i_be                         ({(1<<AXI_P_DW_BYTES){fsm_state_ff == S_REFILL}}),
         .i_addr                       (fsm_refill_cnt),
         .o_be                         (s2i_wb_we),
         .o_dat                        (s2i_wb_din)
      );
   assign stall_req = (fsm_state_ff != S_IDLE);
   assign dout = (s2o_uncached)
                     ? axi_aligned_rdata_ff
                     : s2o_match_payload;
   assign dbus_ARPROT = 3'b000 | 3'b000 | 3'b000;
   assign dbus_ARID = {AXI_ID_WIDTH{1'b0}};
   assign dbus_ARUSER = {AXI_USER_WIDTH{1'b0}};
   localparam [7:0] ARLEN_CACHED = ((1<<(CONFIG_DC_P_LINE-AXI_FETCH_SIZE))-1);
   assign dbus_ARLEN = (fsm_state_ff==S_UNCACHED_READ) ? 8'b0 : ARLEN_CACHED;
   assign dbus_ARSIZE = (fsm_state_ff==S_UNCACHED_READ) ? s2o_size : AXI_FETCH_SIZE[2:0];
   assign dbus_ARBURST = 2'b01;
   assign dbus_ARLOCK = 1'b0;
   assign dbus_ARCACHE = 4'b0010;
   assign dbus_ARQOS = 4'b0;
   assign dbus_ARREGION = 4'b0;
   assign ar_clr = (dbus_ARREADY & dbus_ARVALID);
   assign axi_paddr_nxt = (fsm_uncached_req)
                           ? 
                              s2o_paddr
                           : ((fsm_state_ff==S_REPLACE) & aw_set)
                              ? 
                                 {s2o_free_tag, s2o_line_addr, {CONFIG_DC_P_LINE{1'b0}}}
                              : 
                                 {s2o_paddr[CONFIG_DC_P_LINE +: CONFIG_AW - CONFIG_DC_P_LINE], {CONFIG_DC_P_LINE{1'b0}}};
   generate
      if (AXI_ADDR_WIDTH > CONFIG_AW)
         assign axi_arw_addr_nxt = {{AXI_ADDR_WIDTH-CONFIG_AW{1'b0}}, axi_paddr_nxt};
      else if (AXI_ADDR_WIDTH < CONFIG_AW)
         assign axi_arw_addr_nxt = axi_paddr_nxt[AXI_ADDR_WIDTH-1:0];
      else
         assign axi_arw_addr_nxt = axi_paddr_nxt;
   endgenerate
   ysyx_210479_mDFF_lr # (.DW(1)) ff_dbus_ARVALID (.CLK(clk), .RST(rst), .LOAD(ar_set|ar_clr), .D(ar_set|~ar_clr), .Q(dbus_ARVALID) );
   ysyx_210479_mDFF_lr # (.DW(AXI_ADDR_WIDTH)) ff_dbus_ARADDR (.CLK(clk), .RST(rst), .LOAD(ar_set), .D(axi_arw_addr_nxt), .Q(dbus_ARADDR) );
   assign dbus_RREADY = (fsm_state_ff == S_REFILL) | (fsm_state_ff == S_UNCACHED_READ);
   assign hds_axi_R = (dbus_RVALID & dbus_RREADY);
   assign hds_axi_R_last = (hds_axi_R & dbus_RLAST);
   generate
      if (PAYLOAD_P_DW_BYTES <= AXI_P_DW_BYTES)
         begin : gen_uncached_align
            ysyx_210479_align_r
               #(
                  .IN_P_DW_BYTES                (AXI_P_DW_BYTES),
                  .OUT_P_DW_BYTES               (PAYLOAD_P_DW_BYTES),
                  .IN_AW                        (AXI_ADDR_WIDTH)
               )
            U_ALIGN_UNUCACHED_R
               (
                  .i_dat                        (dbus_RDATA),
                  .i_be                         ({(1<<AXI_P_DW_BYTES){hds_axi_R}}),
                  .i_addr                       (dbus_ARADDR),
                  .o_be                         (axi_aligned_rdata_ff_wmsk),
                  .o_dat                        (axi_aligned_rdata_nxt)
               );
            ysyx_210479_mDFF_lr # (.DW(PAYLOAD_DW)) ff_axi_aligned_rdata (.CLK(clk),.RST(rst), .LOAD(|axi_aligned_rdata_ff_wmsk), .D(axi_aligned_rdata_nxt), .Q(axi_aligned_rdata_ff) );
         end
   endgenerate
   assign dbus_AWPROT = 3'b000 | 3'b000 | 3'b000;
   assign dbus_AWID = {AXI_ID_WIDTH{1'b0}};
   assign dbus_AWUSER = {AXI_USER_WIDTH{1'b0}};
   localparam [7:0] AWLEN_CACHED = ((1<<(CONFIG_DC_P_LINE-AXI_FETCH_SIZE))-1);
   assign dbus_AWLEN = (fsm_state_ff==S_UNCACHED_WRITE) ? 8'b0 : AWLEN_CACHED;
   assign dbus_AWSIZE = (fsm_state_ff==S_UNCACHED_WRITE) ? s2o_size : AXI_FETCH_SIZE[2:0];
   assign dbus_AWBURST = 2'b01;
   assign dbus_AWLOCK = 1'b0;
   assign dbus_AWCACHE = 4'b0010;
   assign dbus_AWQOS = 4'b0;
   assign dbus_AWREGION = 4'b0;
   assign aw_clr = (dbus_AWREADY & dbus_AWVALID);
   ysyx_210479_mDFF_lr # (.DW(1)) ff_dbus_AWVALID (.CLK(clk), .RST(rst), .LOAD(aw_set|aw_clr), .D(aw_set|~aw_clr), .Q(dbus_AWVALID) );
   ysyx_210479_mDFF_lr # (.DW(AXI_ADDR_WIDTH)) ff_dbus_AWADDR (.CLK(clk), .RST(rst), .LOAD(aw_set), .D(axi_arw_addr_nxt), .Q(dbus_AWADDR) );
   assign dbus_WUSER = {AXI_USER_WIDTH{1'b0}};
   generate
      if (PAYLOAD_P_DW_BYTES == 2 && AXI_P_DW_BYTES == 3)
         begin : gen_uncached_wstrb
            assign axi_uncached_wstrb = (s2o_size == 3'd0)
                                          ? {s2o_paddr[2:0]==3'd7, s2o_paddr[2:0]==3'd6, s2o_paddr[2:0]==3'd5, s2o_paddr[2:0]==3'd4,
                                             s2o_paddr[2:0]==3'd3, s2o_paddr[2:0]==3'd2, s2o_paddr[2:0]==3'd1, s2o_paddr[2:0]==3'd0}
                                          : (s2o_size == 3'd1)
                                             ? {s2o_paddr[2:1]==2'd3, s2o_paddr[2:1]==2'd3, s2o_paddr[2:1]==2'd2, s2o_paddr[2:1]==2'd2,
                                                s2o_paddr[2:1]==2'd1, s2o_paddr[2:1]==2'd1, s2o_paddr[2:1]==2'd0, s2o_paddr[2:1]==2'd0}
                                             : {s2o_paddr[2], s2o_paddr[2], s2o_paddr[2], s2o_paddr[2],
                                                ~s2o_paddr[2], ~s2o_paddr[2], ~s2o_paddr[2], ~s2o_paddr[2]};
            always @(*)
               case(s2o_paddr[2:0])
                  3'd0: axi_uncached_wdata8 = {56'b0, s2o_wdat[0 +: 8]};
                  3'd1: axi_uncached_wdata8 = {48'b0, s2o_wdat[8 +: 8], 8'b0};
                  3'd2: axi_uncached_wdata8 = {40'b0, s2o_wdat[16 +: 8], 16'b0};
                  3'd3: axi_uncached_wdata8 = {32'b0, s2o_wdat[24 +: 8], 24'b0};
                  3'd4: axi_uncached_wdata8 = {24'b0, s2o_wdat[0 +: 8], 32'b0};
                  3'd5: axi_uncached_wdata8 = {16'b0, s2o_wdat[8 +: 8], 40'b0};
                  3'd6: axi_uncached_wdata8 = {8'b0, s2o_wdat[16 +: 8], 48'b0};
                  3'd7: axi_uncached_wdata8 = {s2o_wdat[24 +: 8], 56'b0};
               endcase
            always @(*)
               case (s2o_paddr[2:1])
                 2'd0: axi_uncached_wdata16 = {48'b0, s2o_wdat[0 +: 16]};
                 2'd1: axi_uncached_wdata16 = {32'b0, s2o_wdat[16 +: 16], 16'b0};
                 2'd2: axi_uncached_wdata16 = {16'b0, s2o_wdat[0 +: 16], 32'b0};
                 2'd3: axi_uncached_wdata16 = {s2o_wdat[16 +: 16], 48'b0};
               endcase
            always @(*)
               case (s2o_paddr[2])
                  1'd0: axi_uncached_wdata32 = {32'b0, s2o_wdat[0 +: 32]};
                  1'd1: axi_uncached_wdata32 = {s2o_wdat[0 +: 32], 32'b0};
               endcase
            assign axi_uncached_wdata = (s2o_size == 3'd0)
                                          ? axi_uncached_wdata8
                                          : (s2o_size == 3'd1)
                                             ? axi_uncached_wdata16
                                             : axi_uncached_wdata32 ;
         end
   endgenerate
   generate
      if(AXI_P_DW_BYTES == 3 && PAYLOAD_P_DW_BYTES == 2)
         begin : gen_axi_wdata
            assign dbus_WDATA = (fsm_state_ff == S_WRITEBACK)
                                    ? axi_align_dat
                                    : axi_uncached_wdata ;
            assign dbus_WSTRB = (fsm_state_ff == S_WRITEBACK)
                                    ? axi_align_be
                                    : axi_uncached_wstrb ;
         end
   endgenerate
   ysyx_210479_align_w
      #(
         .IN_P_DW_BYTES                      (AXI_P_DW_BYTES),
         .OUT_P_DW_BYTES                     (PAYLOAD_P_DW_BYTES),
         .IN_AW                              (CONFIG_DC_P_LINE)
      )
   U_ALIGN_W
      (
         .i_dat                              (s2o_wb_payload),
         .i_be                               ({PAYLOAD_DW/8{fsm_state_ff == S_WRITEBACK}}),
         .i_addr                             (s2o_wb_addr),
         .o_be                               (axi_align_be),
         .o_out_wdat                         (axi_align_dat)
      );
   assign s2i_wb_re = (((fsm_state_ff!=S_UNCACHED_BOOT) & wvalid_set) |
                        ((fsm_state_ff==S_WRITEBACK) & hds_axi_W & (|fsm_refill_cnt)));
   assign wvalid_set = (aw_set);
   assign wvalid_clr = (hds_axi_W_last);
   ysyx_210479_mDFF_lr #(.DW(1)) ff_dbus_WVALID (.CLK(clk), .RST(rst), .LOAD(wvalid_set|wvalid_clr), .D(wvalid_set|~wvalid_clr), .Q(dbus_WVALID) );
   assign wlast_set = (((fsm_state_ff==S_WRITEBACK) & hds_axi_W & fsm_refill_cnt_nxt_carry[CONFIG_DC_P_LINE]) | (fsm_uncached_req & aw_set));
   assign wlast_clr = (wvalid_clr);
   ysyx_210479_mDFF_lr #(.DW(1)) ff_dbus_WLAST (.CLK(clk), .RST(rst), .LOAD(wlast_set|wlast_clr), .D(wlast_set|~wlast_clr), .Q(dbus_WLAST) );
   assign hds_axi_W = (dbus_WVALID & dbus_WREADY);
   assign hds_axi_W_last = (hds_axi_W & dbus_WLAST);
   assign dbus_BREADY = (fsm_state_ff == S_WRITEBACK) | (fsm_state_ff == S_UNCACHED_WRITE);
   assign hds_axi_B = (dbus_BREADY & dbus_BVALID);
   assign msr_dcid[3:0] = CONFIG_DC_P_SETS[3:0];
   assign msr_dcid[7:4] = CONFIG_DC_P_LINE[3:0];
   assign msr_dcid[11:8] = CONFIG_DC_P_WAYS[3:0];
   assign msr_dcid[31:12] = 20'b0;
endmodule
module ysyx_210479_dmmu
#(
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_P_PAGE_SIZE = 0,
   parameter                           CONFIG_DMMU_ENABLE_UNCACHED_SEG = 0,
   parameter                           CONFIG_DTLB_P_SETS = 0
)
(
   input                               clk,
   input                               rst,
   input                               re,
   input [CONFIG_AW-CONFIG_P_PAGE_SIZE-1:0] vpn,
   input                               we,
   output [CONFIG_AW-CONFIG_P_PAGE_SIZE-1:0] ppn,
   output                              EDTM,
   output                              EDPF,
   output                              uncached,
   input                               msr_psr_dmme,
   input                               msr_psr_rm,
   output [CONFIG_DW-1:0]              msr_dmmid,
   input [CONFIG_DTLB_P_SETS-1:0]      msr_dmm_tlbl_idx,
   input [CONFIG_DW-1:0]               msr_dmm_tlbl_nxt,
   input                               msr_dmm_tlbl_we,
   input [CONFIG_DTLB_P_SETS-1:0]      msr_dmm_tlbh_idx,
   input [CONFIG_DW-1:0]               msr_dmm_tlbh_nxt,
   input                               msr_dmm_tlbh_we
);
   localparam VPN_SHIFT                = CONFIG_P_PAGE_SIZE;
   localparam PPN_SHIFT                = VPN_SHIFT;
   localparam VPN_DW                   = CONFIG_AW-VPN_SHIFT;
   localparam PPN_DW                   = CONFIG_AW-PPN_SHIFT;
   assign msr_dmmid = {{32-3{1'b0}}, CONFIG_DTLB_P_SETS[2:0]};
   wire                                msr_psr_dmme_ff;
   wire                                msr_psr_rm_ff;
   wire                                we_ff;
   wire [VPN_DW-1:0]                   tgt_vpn_ff;
   wire [CONFIG_DW-1:0]                tlb_l_ff;
   wire [CONFIG_DW-1:0]                tlb_h_ff;
   wire [CONFIG_DTLB_P_SETS-1:0] tgt_index_nxt = vpn[CONFIG_DTLB_P_SETS-1:0];
   ysyx_210479_mDFF_lr #(.DW(1)) ff_msr_psr_dmme (.CLK(clk),.RST(rst), .LOAD(re), .D(msr_psr_dmme), .Q(msr_psr_dmme_ff) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_msr_psr_rm (.CLK(clk),.RST(rst), .LOAD(re), .D(msr_psr_rm), .Q(msr_psr_rm_ff) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_we (.CLK(clk),.RST(rst), .LOAD(re), .D(we), .Q(we_ff) );
   ysyx_210479_mDFF_lr #(.DW(VPN_DW)) ff_tgt_vpn (.CLK(clk), .RST(rst), .LOAD(re), .D(vpn), .Q(tgt_vpn_ff) );
   ysyx_210479_mRF_nwnr_r
      #(
         .DW      (CONFIG_DW),
         .AW      (CONFIG_DTLB_P_SETS),
         .NUM_READ (1),
         .NUM_WRITE (1)
      )
   U_TLB_L
      (
         .CLK     (clk),
         .RST     (rst),
         .RE      (re),
         .RADDR   (tgt_index_nxt),
         .RDATA   (tlb_l_ff),
         .WE      (msr_dmm_tlbl_we),
         .WADDR   (msr_dmm_tlbl_idx),
         .WDATA   (msr_dmm_tlbl_nxt)
      );
   ysyx_210479_mRF_nwnr_r
      #(
         .DW      (CONFIG_DW),
         .AW      (CONFIG_DTLB_P_SETS),
         .NUM_READ (1),
         .NUM_WRITE (1)
      )
   U_TLB_H
      (
         .CLK     (clk),
         .RST     (rst),
         .RE      (re),
         .RADDR   (tgt_index_nxt),
         .RDATA   (tlb_h_ff),
         .WE      (msr_dmm_tlbh_we),
         .WADDR   (msr_dmm_tlbh_idx),
         .WDATA   (msr_dmm_tlbh_nxt)
      );
   wire tlb_v = tlb_l_ff[0];
   wire [VPN_DW-1:0] tlb_vpn = tlb_l_ff[CONFIG_DW-1:CONFIG_DW-VPN_DW];
   wire tlb_uw = tlb_h_ff[3];
   wire tlb_ur = tlb_h_ff[4];
   wire tlb_rw = tlb_h_ff[5];
   wire tlb_rr = tlb_h_ff[6];
   wire tlb_unc = tlb_h_ff[7];
   wire [PPN_DW-1:0] tlb_ppn = tlb_h_ff[CONFIG_DW-1:CONFIG_DW-PPN_DW];
   wire perm_denied;
   wire tlb_miss;
   assign perm_denied =
      (
         (msr_psr_rm_ff & ((we_ff & ~tlb_rw) | (~we_ff & ~tlb_rr)) ) |
         (~msr_psr_rm_ff & ((we_ff & ~tlb_uw) | (~we_ff & ~tlb_ur)) )
       );
   assign tlb_miss = ~(tlb_v & (tlb_vpn == tgt_vpn_ff));
   assign EDTM = tlb_miss & msr_psr_dmme_ff;
   assign EDPF = perm_denied & ~tlb_miss & msr_psr_dmme_ff;
   assign ppn = msr_psr_dmme_ff ? tlb_ppn : tgt_vpn_ff;
generate
   if (CONFIG_DMMU_ENABLE_UNCACHED_SEG)
      assign uncached = (msr_psr_dmme_ff & ~tlb_miss & ~perm_denied & tlb_unc) | (~EDTM & ~EDPF & ~ppn[CONFIG_AW-CONFIG_P_PAGE_SIZE-1]);
   else
      assign uncached = (msr_psr_dmme_ff & ~tlb_miss & ~perm_denied & tlb_unc);
endgenerate
endmodule
module ysyx_210479_ex
#(
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_P_ISSUE_WIDTH = 0,
   parameter                           CONFIG_P_COMMIT_WIDTH = 0,
   parameter                           CONFIG_P_ROB_DEPTH = 0,
   parameter                           CONFIG_ENABLE_ASR = 0
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*9 -1:0] ex_alu_opc_bus,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_bpu_pred_taken,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0] ex_bpu_pred_tgt,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*8-1:0] ex_bru_opc_bus,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_epu_op,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ex_imm,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_lsu_op,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ex_fe,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0] ex_pc,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ex_prd,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_prd_we,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ex_operand1,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ex_operand2,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] ex_rob_id,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] ex_rob_bank,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_valid,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_ready,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_valid,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] wb_rob_id,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] wb_rob_bank,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_fls,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_exc,
   output [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_opera,
   output [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_operb,
   output [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_fls_tgt,
   output [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] prf_WADDR_ex,
   output [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] prf_WDATA_ex,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] prf_WE_ex,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_ready
);
   localparam IW                       = (1<<CONFIG_P_ISSUE_WIDTH);
   genvar i;
   generate for(i=0;i<IW;i=i+1)
      begin : gen_FUs
         ysyx_210479_ex_pipe
            #(
              .CONFIG_AW             (CONFIG_AW),
              .CONFIG_DW             (CONFIG_DW),
              .CONFIG_P_ROB_DEPTH    (CONFIG_P_ROB_DEPTH),
              .CONFIG_P_COMMIT_WIDTH (CONFIG_P_COMMIT_WIDTH),
              .CONFIG_ENABLE_ASR     (CONFIG_ENABLE_ASR))
         U_PIPE
            (
             .ex_ready               (ex_ready[i]),           
             .wb_valid               (wb_valid[i]),           
             .wb_rob_id              (wb_rob_id[i * CONFIG_P_ROB_DEPTH +: CONFIG_P_ROB_DEPTH]), 
             .wb_rob_bank            (wb_rob_bank[i * CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH]), 
             .prf_WE_ex              (prf_WE_ex[i]),          
             .prf_WADDR_ex           (prf_WADDR_ex[i * 6 +: 6]), 
             .prf_WDATA_ex           (prf_WDATA_ex[i * CONFIG_DW +: CONFIG_DW]), 
             .wb_fls                 (wb_fls[i]),             
             .wb_exc                 (wb_exc[i]),             
             .wb_opera               (wb_opera[i * CONFIG_AW +: CONFIG_AW]), 
             .wb_operb               (wb_operb[i * CONFIG_DW +: CONFIG_DW]), 
             .wb_fls_tgt             (wb_fls_tgt[i * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )]), 
             .clk                    (clk),
             .rst                    (rst),
             .flush                  (flush),
             .ex_valid               (ex_valid[i]),           
             .ex_alu_opc_bus         (ex_alu_opc_bus[i * 9  +: 9 ]), 
             .ex_epu_op              (ex_epu_op[i]),          
             .ex_lsu_op              (ex_lsu_op[i]),          
             .ex_bru_opc_bus         (ex_bru_opc_bus[i * 8 +: 8]), 
             .ex_fe                  (ex_fe[i * 6 +: 6]), 
             .ex_bpu_pred_taken      (ex_bpu_pred_taken[i]),  
             .ex_bpu_pred_tgt        (ex_bpu_pred_tgt[i * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )]), 
             .ex_pc                  (ex_pc[i * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )]), 
             .ex_imm                 (ex_imm[i * CONFIG_DW +: CONFIG_DW]), 
             .ex_operand1            (ex_operand1[i * CONFIG_DW +: CONFIG_DW]), 
             .ex_operand2            (ex_operand2[i * CONFIG_DW +: CONFIG_DW]), 
             .ex_prd                 (ex_prd[i * 6 +: 6]), 
             .ex_prd_we              (ex_prd_we[i]),          
             .ex_rob_id              (ex_rob_id[i * CONFIG_P_ROB_DEPTH +: CONFIG_P_ROB_DEPTH]), 
             .ex_rob_bank            (ex_rob_bank[i * CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH]), 
             .wb_ready               (wb_ready[i]));           
      end
   endgenerate
endmodule
module ysyx_210479_ex_agu
#(
   parameter                           CONFIG_AW = 0
)
(
   input                               ex_lsu_op,
   input                               ex_epu_op,
   output                              agu_en,
   input [CONFIG_AW-1:0]               add_sum,
   output [CONFIG_AW-1:0]              wb_lsa
);
   assign agu_en = (ex_lsu_op | ex_epu_op);
   assign wb_lsa = add_sum;
endmodule
module ysyx_210479_ex_alu
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_ENABLE_ASR = 0
)
(
   input [9 -1:0]          ex_alu_opc_bus,
   input [CONFIG_DW-1:0]               ex_operand1,
   input [CONFIG_DW-1:0]               ex_operand2,
   input [CONFIG_DW-1:0]               add_sum,
   output [CONFIG_DW-1:0]              alu_result
);
   wire [CONFIG_DW-1:0]                dat_adder;
   wire [CONFIG_DW-1:0]                dat_and;
   wire [CONFIG_DW-1:0]                dat_or;
   wire [CONFIG_DW-1:0]                dat_xor;
   wire [CONFIG_DW-1:0]                dat_shifter;
   wire [CONFIG_DW-1:0]                dat_move;
   wire                                sel_adder;
   wire                                sel_and;
   wire                                sel_or;
   wire                                sel_xor;
   wire                                sel_shifter;
   wire                                sel_move;
   assign dat_adder = add_sum;
   assign sel_adder = (ex_alu_opc_bus[0] | ex_alu_opc_bus[1]);
   assign dat_and = (ex_operand1 & ex_operand2);
   assign dat_or = (ex_operand1 | ex_operand2);
   assign dat_xor = (ex_operand1 ^ ex_operand2);
   assign sel_and = ex_alu_opc_bus[3];
   assign sel_or = ex_alu_opc_bus[4];
   assign sel_xor = ex_alu_opc_bus[5];
   wire [CONFIG_DW-1:0] shift_right;
   wire [CONFIG_DW-1:0] shift_lsw;
   function [CONFIG_DW-1:0] reverse_bits;
      input [CONFIG_DW-1:0] a;
	   integer 			       i;
	   begin
         for(i=0; i<CONFIG_DW; i=i+1)
            reverse_bits[CONFIG_DW-1-i] = a[i];
      end
   endfunction
   assign shift_lsw = ex_alu_opc_bus[6] ? reverse_bits(ex_operand1) : ex_operand1;
   generate
      if (CONFIG_ENABLE_ASR)
         begin : gen_asr
            wire [CONFIG_DW-1:0] shift_msw;
            wire [CONFIG_DW*2-1:0] shift_wide;
            assign shift_msw = ex_alu_opc_bus[8] ? {CONFIG_DW{ex_operand1[CONFIG_DW-1]}} : {CONFIG_DW{1'b0}};
            assign shift_wide = {shift_msw, shift_lsw} >> ex_operand2[4:0];
            assign shift_right = shift_wide[CONFIG_DW-1:0];
         end
      else
         assign shift_right = shift_lsw >> ex_operand2[4:0];
   endgenerate
   assign dat_shifter = ex_alu_opc_bus[6] ? reverse_bits(shift_right) : shift_right;
   assign sel_shifter = ex_alu_opc_bus[6] | ex_alu_opc_bus[7] | ex_alu_opc_bus[8];
   assign sel_move = ex_alu_opc_bus[2];
   assign dat_move = {ex_operand2[16:0], 15'b0};
   assign alu_result =
      ({CONFIG_DW{sel_adder}} & dat_adder) |
      ({CONFIG_DW{sel_and}} & dat_and) |
      ({CONFIG_DW{sel_or}} & dat_or) |
      ({CONFIG_DW{sel_xor}} & dat_xor) |
      ({CONFIG_DW{sel_shifter}} & dat_shifter) |
      ({CONFIG_DW{sel_move}} & dat_move);
endmodule
module ysyx_210479_ex_bru
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_AW = 0
)
(
   input                               ex_valid,
   input [8-1:0]          ex_bru_opc_bus,
   input [(CONFIG_AW-2 )-1:0]                   ex_pc,
   input [CONFIG_AW-1:2 ] ex_imm,
   input [CONFIG_DW-1:0]               ex_operand1,
   input [CONFIG_DW-1:0]               ex_operand2,
   input                               ex_rf_we,
   input [(CONFIG_AW-2 )-1:0]                   npc,
   input [CONFIG_DW-1:0]               add_sum,
   input                               add_carry,
   input                               add_overflow,
   output                              b_taken,
   output [(CONFIG_AW-2 )-1:0]                  b_tgt,
   output [CONFIG_DW-1:0]              bru_dout,
   output                              bru_dout_valid
);
   wire                                cmp_eq;
   wire                                cmp_lt_s;
   wire                                cmp_lt_u;
   wire                                bcc_taken;
   wire                                b_lnk;
   wire                                is_breg;
   wire                                is_brel;
   assign cmp_eq = (ex_operand1 == ex_operand2);
   assign cmp_lt_s = (add_sum[CONFIG_DW-1] ^ add_overflow);
   assign cmp_lt_u = ~add_carry;
   assign is_breg = (ex_bru_opc_bus[6]);
   assign is_brel = (ex_bru_opc_bus[7]);
   assign bcc_taken = (ex_bru_opc_bus[0] & cmp_eq) |
                        (ex_bru_opc_bus[1] & ~cmp_eq) |
                        (ex_bru_opc_bus[3] & (~cmp_lt_u & ~cmp_eq)) |
                        (ex_bru_opc_bus[2] & (~cmp_lt_s & ~cmp_eq)) |
                        (ex_bru_opc_bus[5] & (cmp_lt_u | cmp_eq)) |
                        (ex_bru_opc_bus[4] & (cmp_lt_s | cmp_eq));
   assign b_taken = (ex_valid & (bcc_taken | is_breg | is_brel));
   assign b_tgt =
      ({(CONFIG_AW-2 ){bcc_taken}} & (ex_pc + ex_imm)) |
      ({(CONFIG_AW-2 ){is_brel}} & (ex_pc + ex_operand2[CONFIG_AW-1:2 ])) |
      ({(CONFIG_AW-2 ){is_breg}} & ex_operand1[CONFIG_AW-1:2 ]);
   assign b_lnk = ((is_brel | is_breg) & ex_rf_we);
   assign bru_dout = {npc, {2 {1'b0}}};
   assign bru_dout_valid = b_lnk;
endmodule
module ysyx_210479_ex_pipe
#(
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_P_ROB_DEPTH = 0,
   parameter                           CONFIG_P_COMMIT_WIDTH = 0,
   parameter                           CONFIG_ENABLE_ASR = 0
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input                               ex_valid,
   input [9 -1:0]          ex_alu_opc_bus,
   input                               ex_epu_op,
   input                               ex_lsu_op,
   input [8-1:0]          ex_bru_opc_bus,
   input [6-1:0]              ex_fe,
   input                               ex_bpu_pred_taken,
   input [(CONFIG_AW-2 )-1:0]                   ex_bpu_pred_tgt,
   input [(CONFIG_AW-2 )-1:0]                   ex_pc,
   input [CONFIG_DW-1:0]               ex_imm,
   input [CONFIG_DW-1:0]               ex_operand1,
   input [CONFIG_DW-1:0]               ex_operand2,
   input [6-1:0]            ex_prd,
   input                               ex_prd_we,
   input [CONFIG_P_ROB_DEPTH-1:0]      ex_rob_id,
   input [CONFIG_P_COMMIT_WIDTH-1:0]   ex_rob_bank,
   output                              ex_ready,
   input                               wb_ready,
   output                              wb_valid,
   output [CONFIG_P_ROB_DEPTH-1:0]     wb_rob_id,
   output [CONFIG_P_COMMIT_WIDTH-1:0]  wb_rob_bank,
   output                              prf_WE_ex,
   output [6-1:0]           prf_WADDR_ex,
   output [CONFIG_DW-1:0]              prf_WDATA_ex,
   output                              wb_fls,
   output                              wb_exc,
   output [CONFIG_AW-1:0]              wb_opera,
   output [CONFIG_DW-1:0]              wb_operb,
   output [(CONFIG_AW-2 )-1:0]                  wb_fls_tgt
);
   wire                                p_ce;
   wire [CONFIG_DW-1:0]                bru_dout;
   wire                                bru_dout_valid;
   wire                                add_s;
   wire [CONFIG_DW-1:0]                add_sum;
   wire                                add_carry;
   wire                                add_overflow;
   wire                                b_taken;
   wire [(CONFIG_AW-2 )-1:0]                    b_tgt;
   wire                                agu_en;
   wire                                s1i_se_fail;
   wire [(CONFIG_AW-2 )-1:0]                    s1i_se_tgt;
   wire                                s1i_wb_fls;
   wire                                s1i_wb_exc;
   wire [CONFIG_AW-1:0]                s1i_wb_lsa;
   wire [CONFIG_DW-1:0]                s1i_wb_opera, s1i_wb_operb;
   wire [CONFIG_DW-1:0]                alu_dout;
   wire [CONFIG_DW-1:0]                s1i_rf_dout;
   wire                                s1i_prf_we;
   wire                                s1i_prf_wdat_valid;
   wire [(CONFIG_AW-2 )-1:0]                    s1i_npc;
   wire                                s1o_prf_we;
   ysyx_210479_mADD
      #(.DW((CONFIG_AW-2 )))
   U_NPC
      (
         .a                            (ex_pc),
         .b                            ({{(CONFIG_AW-2 )-1{1'b0}}, 1'b1}),
         .s                            (1'b0),
         .sum                          (s1i_npc)
      );
   ysyx_210479_mADD_c_o
      #(.DW(CONFIG_DW))
   U_ADD_AGU
      (
         .a                            (ex_operand1),
         .b                            ((agu_en) ? ex_imm : ex_operand2),
         .s                            (add_s),
         .sum                          (add_sum),
         .carry                        (add_carry),
         .overflow                     (add_overflow)
      );
   ysyx_210479_ex_alu
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_ENABLE_ASR              (CONFIG_ENABLE_ASR))
   U_ALU
      (
         .ex_alu_opc_bus               (ex_alu_opc_bus),
         .ex_operand1                  (ex_operand1),
         .ex_operand2                  (ex_operand2),
         .add_sum                      (add_sum),
         .alu_result                   (alu_dout)
      );
   ysyx_210479_ex_bru
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_AW                      (CONFIG_AW))
   U_BRU
      (
         .ex_valid                     (ex_valid),
         .ex_bru_opc_bus               (ex_bru_opc_bus),
         .ex_pc                        (ex_pc),
         .ex_imm                       (ex_imm[CONFIG_AW-1:2 ]),
         .ex_operand1                  (ex_operand1),
         .ex_operand2                  (ex_operand2),
         .ex_rf_we                     (ex_prd_we),
         .npc                          (s1i_npc),
         .add_sum                      (add_sum),
         .add_carry                    (add_carry),
         .add_overflow                 (add_overflow),
         .b_taken                      (b_taken),
         .b_tgt                        (b_tgt),
         .bru_dout                     (bru_dout),
         .bru_dout_valid               (bru_dout_valid)
      );
   ysyx_210479_ex_agu
      #(
        .CONFIG_AW                      (CONFIG_AW))
   U_AGU
      (
         .ex_lsu_op                    (ex_lsu_op),
         .ex_epu_op                    (ex_epu_op),
         .agu_en                       (agu_en),
         .add_sum                      (add_sum),
         .wb_lsa                       (s1i_wb_lsa)
      );
   assign s1i_wb_opera = (s1i_wb_exc)
                           ? {{CONFIG_DW-6{1'b0}}, ex_fe}
                           : s1i_wb_lsa;
   assign s1i_wb_operb = ex_operand2;
   assign add_s =
      (
         ex_alu_opc_bus[1] |
         ex_bru_opc_bus[0] |
         ex_bru_opc_bus[1] |
         ex_bru_opc_bus[3] |
         ex_bru_opc_bus[2] |
         ex_bru_opc_bus[5] |
         ex_bru_opc_bus[4]
      );
   assign s1i_rf_dout =
         (bru_dout_valid)
            ? bru_dout
            : alu_dout;
   assign s1i_prf_wdat_valid = ex_valid & ~(ex_epu_op | ex_lsu_op);
   assign s1i_prf_we = (s1i_prf_wdat_valid & ex_prd_we);
   assign s1i_se_fail = ((b_taken ^ ex_bpu_pred_taken) | (b_taken & (b_tgt != ex_bpu_pred_tgt))); 
   assign s1i_se_tgt = (b_taken) ? b_tgt : s1i_npc;
   assign s1i_wb_fls = (ex_valid & s1i_se_fail);
   assign s1i_wb_exc = (ex_valid & (|ex_fe));
   ysyx_210479_hds_buf
      #(.BYPASS(1))
   U_BUF
      (
         .clk  (clk),
         .rst  (rst),
         .flush (flush),
         .A_en (1'b1),    
         .AVALID (ex_valid),
         .AREADY (ex_ready),
         .B_en (1'b1),    
         .BVALID (wb_valid),
         .BREADY (wb_ready),
         .p_ce (p_ce)
      );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_P_ROB_DEPTH)) ff_wb_rob_id (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(ex_rob_id), .Q(wb_rob_id) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_P_COMMIT_WIDTH)) ff_wb_rob_bank (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(ex_rob_bank), .Q(wb_rob_bank) );
   ysyx_210479_mDFF_lr # (.DW(6)) ff_prf_WADDR_ex (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(ex_prd), .Q(prf_WADDR_ex) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_prf_WE_ex (.CLK(clk), .RST(rst), .LOAD(p_ce|flush), .D(s1i_prf_we & ~flush), .Q(s1o_prf_we) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DW)) ff_prf_WDATA_ex (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_rf_dout), .Q(prf_WDATA_ex) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_wb_fls (.CLK(clk),.RST(rst), .LOAD(p_ce|flush), .D(s1i_wb_fls), .Q(wb_fls) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_wb_exc (.CLK(clk),.RST(rst), .LOAD(p_ce|flush), .D(s1i_wb_exc), .Q(wb_exc) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_AW)) ff_wb_opera (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_wb_opera), .Q(wb_opera) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DW)) ff_wb_operb (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_wb_operb), .Q(wb_operb) );
   ysyx_210479_mDFF_lr # (.DW((CONFIG_AW-2 ))) ff_wb_se_tgt (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_se_tgt), .Q(wb_fls_tgt) );
   assign prf_WE_ex = (s1o_prf_we & wb_valid);
endmodule
module ysyx_210479_frontend
#(
   parameter                           CONFIG_AW = 32,
   parameter                           CONFIG_DW = 32,
   parameter                           CONFIG_P_FETCH_WIDTH = 1,
   parameter                           CONFIG_P_ISSUE_WIDTH = 1,
   parameter                           CONFIG_P_IQ_DEPTH = 4,
   parameter                           CONFIG_P_PAGE_SIZE = 13,
   parameter                           CONFIG_ITLB_P_SETS = 0,
   parameter                           CONFIG_IC_P_LINE = 6,
   parameter                           CONFIG_IC_P_SETS = 6,
   parameter                           CONFIG_IC_P_WAYS = 2,
   parameter                           CONFIG_PHT_P_NUM = 9,
   parameter                           CONFIG_BTB_P_NUM = 9,
   parameter [CONFIG_AW-1:0]           CONFIG_PC_RST = 0,
   parameter                           CONFIG_IMMU_ENABLE_UNCACHED_SEG = 0,
   parameter                           AXI_P_DW_BYTES = 3,
   parameter                           AXI_UNCACHED_P_DW_BYTES = 2,
   parameter                           AXI_ADDR_WIDTH = 64,
   parameter                           AXI_ID_WIDTH = 4,
   parameter                           AXI_USER_WIDTH = 1
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input [(CONFIG_AW-2 )-1:0]                   flush_tgt,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_valid,
   input [CONFIG_P_ISSUE_WIDTH:0]      id_pop_cnt,
   output [((2 <<1)*8) * (1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_ins,
   output [(CONFIG_AW-2 ) * (1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_pc,
   output [2 * (1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_exc,
   output [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_bpu_upd,
   input                               bpu_wb,
   input                               bpu_wb_is_bcc,
   input                               bpu_wb_is_breg,
   input                               bpu_wb_is_brel,
   input                               bpu_wb_taken,
   input [(CONFIG_AW-2 )-1:CONFIG_BTB_P_NUM]    bpu_wb_pc,
   input [(CONFIG_AW-2 )-1:0]                   bpu_wb_npc_act,
   input [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:((CONFIG_AW-2 ) + 1)] bpu_wb_upd_partial,
   input                               msr_psr_imme,
   input                               msr_psr_rm,
   input                               msr_psr_ice,
   output [CONFIG_DW-1:0]              msr_immid,
   input [CONFIG_ITLB_P_SETS-1:0]      msr_imm_tlbl_idx,
   input [CONFIG_DW-1:0]               msr_imm_tlbl_nxt,
   input                               msr_imm_tlbl_we,
   input [CONFIG_ITLB_P_SETS-1:0]      msr_imm_tlbh_idx,
   input [CONFIG_DW-1:0]               msr_imm_tlbh_nxt,
   input                               msr_imm_tlbh_we,
   output [CONFIG_DW-1:0]              msr_icid,
   input [CONFIG_IC_P_SETS-1:0]        msr_icinv_line_nxt,
   input                               msr_icinv_we,
   output                              msr_icinv_ready,
   input                               ibus_ARREADY,
   output                              ibus_ARVALID,
   output [AXI_ADDR_WIDTH-1:0]         ibus_ARADDR,
   output [2:0]                        ibus_ARPROT,
   output [AXI_ID_WIDTH-1:0]           ibus_ARID,
   output [AXI_USER_WIDTH-1:0]         ibus_ARUSER,
   output [7:0]                        ibus_ARLEN,
   output [2:0]                        ibus_ARSIZE,
   output [1:0]                        ibus_ARBURST,
   output                              ibus_ARLOCK,
   output [3:0]                        ibus_ARCACHE,
   output [3:0]                        ibus_ARQOS,
   output [3:0]                        ibus_ARREGION,
   output                              ibus_RREADY,
   input                               ibus_RVALID,
   input  [(1<<AXI_P_DW_BYTES)*8-1:0]  ibus_RDATA,
   input  [1:0]                        ibus_RRESP,
   input                               ibus_RLAST,
   input  [AXI_ID_WIDTH-1:0]           ibus_RID,
   input  [AXI_USER_WIDTH-1:0]         ibus_RUSER
);
   localparam P_FETCH_DW_BYTES         = (2  + CONFIG_P_FETCH_WIDTH);
   localparam FW                       = (1<<CONFIG_P_FETCH_WIDTH);
   wire                 ic_stall_req;           
   wire [((2 <<1)*8)*(1<<CONFIG_P_FETCH_WIDTH)-1:0] iq_ins;
   wire                 iq_ready;               
   wire                                p_ce;
   wire [CONFIG_P_PAGE_SIZE-1:0]       vpo;
   wire                                pred_branch_taken;
   wire [(CONFIG_AW-2 )-1:0]                    pred_branch_tgt;
   wire [CONFIG_AW-1:0]                pc;
   reg [CONFIG_AW-1:0]                 pc_nxt;
   wire [CONFIG_AW-1:0]                s1i_fetch_vaddr;
   wire [FW-1:0]                       s1i_fetch_aligned;
   wire [(CONFIG_AW-2 )-1:0]                    s1i_pc                           [FW-1:0];
   wire [(CONFIG_AW-2 )*FW-1:0]                 s1i_bpu_pc;
   wire [CONFIG_P_FETCH_WIDTH:0]       s1i_push_offset;
   wire [(CONFIG_AW-2 )-1:0]                    s1o_pc                           [FW-1:0];
   wire [2-1:0]               s1o_exc;
   wire [FW-1:0]                       s1o_fetch_aligned;
   wire [CONFIG_AW-CONFIG_P_PAGE_SIZE-1:0] s1o_tlb_ppn;
   wire                                s1o_tlb_uncached;
   wire                                s1o_msr_psr_ice;
   wire                                s2i_kill_req;
   wire                                s2i_uncached;
   wire [CONFIG_P_FETCH_WIDTH:0]       s1o_push_cnt;
   wire [CONFIG_P_FETCH_WIDTH:0]       s1o_push_offset;
   wire [(CONFIG_AW-2 )*FW-1:0]                 s1o_bpu_npc_packed;
   wire [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*FW-1:0]            s1o_bpu_upd_packed;
   wire [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:0]               s1o_bpu_upd                      [FW-1:0];
   wire [FW-1:0]                       s1o_bpu_taken;
   reg [FW-1:0]                        s2i_valid_msk;
   wire [(CONFIG_AW-2 )-1:0]                    s2o_pc                           [FW-1:0];
   wire [2-1:0]               s2o_exc;
   wire [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:0]               s2o_bpu_upd                      [FW-1:0];
   wire                                s2o_valid;
   wire [CONFIG_P_FETCH_WIDTH:0]       s2o_push_cnt;
   wire [CONFIG_P_FETCH_WIDTH:0]       s2o_push_offset;
   wire [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_FETCH_WIDTH)-1:0] iq_bpu_upd;
   wire [2*(1<<CONFIG_P_FETCH_WIDTH)-1:0] iq_exc;
   wire [(CONFIG_AW-2 )*(1<<CONFIG_P_FETCH_WIDTH)-1:0] iq_pc;
   wire [CONFIG_P_FETCH_WIDTH:0] iq_push_cnt;  
   wire [CONFIG_P_FETCH_WIDTH:0] iq_push_offset;
   genvar i;
   integer j;
   ysyx_210479_icache
      #(
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_P_FETCH_WIDTH           (CONFIG_P_FETCH_WIDTH),
        .CONFIG_P_PAGE_SIZE             (CONFIG_P_PAGE_SIZE),
        .CONFIG_IC_P_LINE               (CONFIG_IC_P_LINE),
        .CONFIG_IC_P_SETS               (CONFIG_IC_P_SETS),
        .CONFIG_IC_P_WAYS               (CONFIG_IC_P_WAYS),
        .AXI_P_DW_BYTES                 (AXI_P_DW_BYTES),
        .AXI_UNCACHED_P_DW_BYTES        (AXI_UNCACHED_P_DW_BYTES),
        .AXI_ADDR_WIDTH                 (AXI_ADDR_WIDTH),
        .AXI_ID_WIDTH                   (AXI_ID_WIDTH),
        .AXI_USER_WIDTH                 (AXI_USER_WIDTH))
   U_I_CACHE
      (
       .stall_req                       (ic_stall_req),          
       .ins                             (iq_ins[((2 <<1)*8)*(1<<CONFIG_P_FETCH_WIDTH)-1:0]), 
       .valid                           (s2o_valid),             
       .msr_icid                        (msr_icid[CONFIG_DW-1:0]),
       .msr_icinv_ready                 (msr_icinv_ready),
       .ibus_ARVALID                    (ibus_ARVALID),
       .ibus_ARADDR                     (ibus_ARADDR[AXI_ADDR_WIDTH-1:0]),
       .ibus_ARPROT                     (ibus_ARPROT[2:0]),
       .ibus_ARID                       (ibus_ARID[AXI_ID_WIDTH-1:0]),
       .ibus_ARUSER                     (ibus_ARUSER[AXI_USER_WIDTH-1:0]),
       .ibus_ARLEN                      (ibus_ARLEN[7:0]),
       .ibus_ARSIZE                     (ibus_ARSIZE[2:0]),
       .ibus_ARBURST                    (ibus_ARBURST[1:0]),
       .ibus_ARLOCK                     (ibus_ARLOCK),
       .ibus_ARCACHE                    (ibus_ARCACHE[3:0]),
       .ibus_ARQOS                      (ibus_ARQOS[3:0]),
       .ibus_ARREGION                   (ibus_ARREGION[3:0]),
       .ibus_RREADY                     (ibus_RREADY),
       .clk                             (clk),
       .rst                             (rst),
       .p_ce                            (p_ce),                  
       .vpo                             (vpo[CONFIG_P_PAGE_SIZE-1:0]),
       .ppn_s2                          (s1o_tlb_ppn),           
       .uncached_s2                     (s2i_uncached),          
       .kill_req_s2                     (s2i_kill_req),          
       .msr_icinv_line_nxt              (msr_icinv_line_nxt[CONFIG_IC_P_SETS-1:0]),
       .msr_icinv_we                    (msr_icinv_we),
       .ibus_ARREADY                    (ibus_ARREADY),
       .ibus_RVALID                     (ibus_RVALID),
       .ibus_RDATA                      (ibus_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .ibus_RLAST                      (ibus_RLAST),
       .ibus_RRESP                      (ibus_RRESP[1:0]),
       .ibus_RID                        (ibus_RID[AXI_ID_WIDTH-1:0]),
       .ibus_RUSER                      (ibus_RUSER[AXI_USER_WIDTH-1:0]));
   ysyx_210479_bpu
      #(
        .CONFIG_PHT_P_NUM               (CONFIG_PHT_P_NUM),
        .CONFIG_BTB_P_NUM               (CONFIG_BTB_P_NUM),
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_P_FETCH_WIDTH           (CONFIG_P_FETCH_WIDTH))
   U_BPU
      (
         .clk                           (clk),
         .rst                           (rst),
         .re                            (p_ce),
         .valid                         (s1o_fetch_aligned),
         .msr_psr_imme                  (msr_psr_imme),
         .pc                            (s1i_bpu_pc),
         .npc                           (s1o_bpu_npc_packed),
         .upd                           (s1o_bpu_upd_packed),
         .bpu_wb                        (bpu_wb),
         .bpu_wb_is_bcc                 (bpu_wb_is_bcc),
         .bpu_wb_is_breg                (bpu_wb_is_breg),
         .bpu_wb_is_brel                (bpu_wb_is_brel),
         .bpu_wb_taken                  (bpu_wb_taken),
         .bpu_wb_pc                     (bpu_wb_pc),
         .bpu_wb_npc_act                (bpu_wb_npc_act),
         .bpu_wb_upd_partial            (bpu_wb_upd_partial)
      );
   ysyx_210479_immu
      #(
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_IMMU_ENABLE_UNCACHED_SEG(CONFIG_IMMU_ENABLE_UNCACHED_SEG),
        .CONFIG_P_PAGE_SIZE             (CONFIG_P_PAGE_SIZE),
        .CONFIG_ITLB_P_SETS             (CONFIG_ITLB_P_SETS))
   U_I_MMU
      (
         .clk                             (clk),
         .rst                             (rst),
         .re                              (p_ce),
         .vpn                             (s1i_fetch_vaddr[CONFIG_P_PAGE_SIZE +: CONFIG_AW-CONFIG_P_PAGE_SIZE]),
         .ppn                             (s1o_tlb_ppn),
         .EITM                            (s1o_exc[0]),
         .EIPF                            (s1o_exc[1]),
         .uncached                        (s1o_tlb_uncached),
         .msr_psr_imme                    (msr_psr_imme),
         .msr_psr_rm                      (msr_psr_rm),
         .msr_immid                       (msr_immid),
         .msr_imm_tlbl_idx                (msr_imm_tlbl_idx),
         .msr_imm_tlbl_nxt                (msr_imm_tlbl_nxt),
         .msr_imm_tlbl_we                 (msr_imm_tlbl_we),
         .msr_imm_tlbh_idx                (msr_imm_tlbh_idx),
         .msr_imm_tlbh_nxt                (msr_imm_tlbh_nxt),
         .msr_imm_tlbh_we                 (msr_imm_tlbh_we)
      );
   assign s2i_kill_req = (|s1o_exc);
   assign s2i_uncached = (s1o_tlb_uncached | ~s1o_msr_psr_ice);
   generate for(i=0;i<FW;i=i+1)
      begin : gen_bpi
         assign s1i_bpu_pc[i*(CONFIG_AW-2 ) +: (CONFIG_AW-2 )] = s1i_pc[i];
         assign s1o_bpu_upd[i] = s1o_bpu_upd_packed[i*(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) +: (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)];
         assign s1o_bpu_taken[i] = s1o_bpu_upd[i][0];
      end
   endgenerate
   always @(*)
      begin
         s2i_valid_msk[0] = 'b1;
         for(j=1;j<FW;j=j+1)
            s2i_valid_msk[j] = s2i_valid_msk[j-1] & ~s1o_bpu_taken[j-1];
      end
   generate for(i=0;i<FW;i=i+1)
      begin : gen_fetch_aligned
         assign s1i_fetch_aligned[i] = (pc_nxt[2  +: CONFIG_P_FETCH_WIDTH] <= i);
      end
   endgenerate
   ysyx_210479_pmux_v #(.SELW(FW), .DW((CONFIG_AW-2 ))) pmux_s1o_bpu_npc (.sel(s1o_bpu_taken), .din(s1o_bpu_npc_packed), .dout(pred_branch_tgt), .valid(pred_branch_taken) );
   always @(*)
      if (flush)
         pc_nxt = {flush_tgt, {2 {1'b0}}};
      else if (~p_ce)
         pc_nxt = pc;
      else if (pred_branch_taken)
         pc_nxt = {pred_branch_tgt, {2 {1'b0}}};
      else
         pc_nxt = pc + {{CONFIG_AW-CONFIG_P_FETCH_WIDTH-1-2 {1'b0}}, s1o_push_cnt, {2 {1'b0}}};
   ysyx_210479_mDFF_r # (.DW(CONFIG_AW), .RST_VECTOR(CONFIG_PC_RST)) ff_pc (.CLK(clk), .RST(rst), .D(pc_nxt), .Q(pc) );
   assign p_ce = (~ic_stall_req & iq_ready);
   assign s1i_fetch_vaddr = {pc_nxt[CONFIG_AW-1:P_FETCH_DW_BYTES], {P_FETCH_DW_BYTES{1'b0}}}; 
   ysyx_210479_popcnt #(.DW(FW), .P_DW(CONFIG_P_FETCH_WIDTH)) popc_1 (.bitmap(~s1i_fetch_aligned), .count(s1i_push_offset) );
   ysyx_210479_popcnt #(.DW(FW), .P_DW(CONFIG_P_FETCH_WIDTH)) popc_2 (.bitmap(s1o_fetch_aligned & s2i_valid_msk), .count(s1o_push_cnt) );
   assign vpo = s1i_fetch_vaddr[CONFIG_P_PAGE_SIZE-1:0];
   ysyx_210479_mDFF_lr # (.DW(FW)) ff_s1o_fetch_aligned (.CLK(clk), .RST(rst), .LOAD(p_ce|flush), .D(s1i_fetch_aligned & {FW{~flush}}), .Q(s1o_fetch_aligned) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_P_FETCH_WIDTH+1)) ff_s2o_push_cnt (.CLK(clk), .RST(rst), .LOAD(p_ce|flush), .D(s1o_push_cnt & {CONFIG_P_FETCH_WIDTH+1{~flush}}), .Q(s2o_push_cnt) );
   ysyx_210479_mDFF_lr # (.DW(2)) ff_s2o_exc (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(s1o_exc), .Q(s2o_exc) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_msr_psr_ice (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(msr_psr_ice), .Q(s1o_msr_psr_ice) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_P_FETCH_WIDTH+1)) ff_s1o_push_offset (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_push_offset), .Q(s1o_push_offset) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_P_FETCH_WIDTH+1)) ff_s2o_push_offset (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1o_push_offset), .Q(s2o_push_offset) );
   generate for(i=0;i<FW;i=i+1)
      begin : gen_iq_din
         assign s1i_pc[i] = (pc_nxt[CONFIG_AW-1: 2 ] + i[(CONFIG_AW-2 )-1:0] - {{(CONFIG_AW-2 )-CONFIG_P_FETCH_WIDTH-1{1'b0}}, s1i_push_offset});
         ysyx_210479_mDFF_lr # (.DW((CONFIG_AW-2 ))) ff_s1o_pc (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(s1i_pc[i]), .Q(s1o_pc[i]) );
         ysyx_210479_mDFF_lr # (.DW((CONFIG_AW-2 ))) ff_s2o_pc (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(s1o_pc[i]), .Q(s2o_pc[i]) );
         ysyx_210479_mDFF_lr # (.DW((2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1))) ff_s2o_bpu_upd (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(s1o_bpu_upd[i]), .Q(s2o_bpu_upd[i]) );
         assign iq_pc[i*(CONFIG_AW-2 ) +: (CONFIG_AW-2 )] = s2o_pc[i];
         assign iq_exc[i*2 +: 2] = s2o_exc;
         assign iq_bpu_upd[i*(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) +: (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)] = s2o_bpu_upd[i];
      end
   endgenerate
   assign iq_push_cnt = (s2o_push_cnt & {CONFIG_P_FETCH_WIDTH+1{s2o_valid & p_ce}});
   assign iq_push_offset = (s2o_push_offset);
   ysyx_210479_prefetch_buf
      #(
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_P_FETCH_WIDTH           (CONFIG_P_FETCH_WIDTH),
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_IQ_DEPTH              (CONFIG_P_IQ_DEPTH),
        .CONFIG_PHT_P_NUM               (CONFIG_PHT_P_NUM),
        .CONFIG_BTB_P_NUM               (CONFIG_BTB_P_NUM))
   U_PREFETCH_BUF
      (
       .iq_ready                        (iq_ready),
       .id_valid                        (id_valid[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_ins                          (id_ins[((2 <<1)*8)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_pc                           (id_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_exc                          (id_exc[2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_bpu_upd                      (id_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .flush                           (flush),
       .iq_ins                          (iq_ins[((2 <<1)*8)*(1<<CONFIG_P_FETCH_WIDTH)-1:0]),
       .iq_pc                           (iq_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_FETCH_WIDTH)-1:0]),
       .iq_exc                          (iq_exc[2*(1<<CONFIG_P_FETCH_WIDTH)-1:0]),
       .iq_bpu_upd                      (iq_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_FETCH_WIDTH)-1:0]),
       .iq_push_cnt                     (iq_push_cnt[CONFIG_P_FETCH_WIDTH:0]),
       .iq_push_offset                  (iq_push_offset[CONFIG_P_FETCH_WIDTH:0]),
       .id_pop_cnt                      (id_pop_cnt[CONFIG_P_ISSUE_WIDTH:0]));
endmodule
module ysyx_210479_icache
#(
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_P_FETCH_WIDTH = 0,
   parameter                           CONFIG_P_PAGE_SIZE = 0,
   parameter                           CONFIG_IC_P_LINE = 0,
   parameter                           CONFIG_IC_P_SETS = 0,
   parameter                           CONFIG_IC_P_WAYS = 0,
   parameter                           AXI_P_DW_BYTES  = 3,
   parameter                           AXI_UNCACHED_P_DW_BYTES = 2,
   parameter                           AXI_ADDR_WIDTH    = 64,
   parameter                           AXI_ID_WIDTH      = 4,
   parameter                           AXI_USER_WIDTH    = 1
)
(
   input                               clk,
   input                               rst,
   input                               p_ce,
   output                              stall_req,
   input [CONFIG_P_PAGE_SIZE-1:0]      vpo,
   input [CONFIG_AW-CONFIG_P_PAGE_SIZE-1:0] ppn_s2,
   input                               uncached_s2,
   input                               kill_req_s2,
   output [((2 <<1)*8) * (1<<CONFIG_P_FETCH_WIDTH)-1:0] ins,
   output                              valid,
   output [CONFIG_DW-1:0]              msr_icid,
   input [CONFIG_IC_P_SETS-1:0]        msr_icinv_line_nxt,
   input                               msr_icinv_we,
   output                              msr_icinv_ready,
   input                               ibus_ARREADY,
   output                              ibus_ARVALID,
   output [AXI_ADDR_WIDTH-1:0]         ibus_ARADDR,
   output [2:0]                        ibus_ARPROT,
   output [AXI_ID_WIDTH-1:0]           ibus_ARID,
   output [AXI_USER_WIDTH-1:0]         ibus_ARUSER,
   output [7:0]                        ibus_ARLEN,
   output [2:0]                        ibus_ARSIZE,
   output [1:0]                        ibus_ARBURST,
   output                              ibus_ARLOCK,
   output [3:0]                        ibus_ARCACHE,
   output [3:0]                        ibus_ARQOS,
   output [3:0]                        ibus_ARREGION,
   output                              ibus_RREADY,
   input                               ibus_RVALID,
   input  [(1<<AXI_P_DW_BYTES)*8-1:0]  ibus_RDATA,
   input                               ibus_RLAST,
   input  [1:0]                        ibus_RRESP, 
   input  [AXI_ID_WIDTH-1:0]           ibus_RID, 
   input  [AXI_USER_WIDTH-1:0]         ibus_RUSER 
);
   localparam TAG_WIDTH                = (CONFIG_AW - CONFIG_IC_P_SETS - CONFIG_IC_P_LINE);
   localparam TAG_V_RAM_AW             = (CONFIG_IC_P_SETS);
   localparam TAG_V_RAM_DW             = (TAG_WIDTH + 1); 
   localparam PAYLOAD_DW               = (((2 <<1)*8) * (1<<CONFIG_P_FETCH_WIDTH));
   localparam PAYLOAD_P_DW_BYTES       = (2  + CONFIG_P_FETCH_WIDTH); 
   localparam PAYLOAD_AW               = (CONFIG_IC_P_SETS + CONFIG_IC_P_LINE - PAYLOAD_P_DW_BYTES);
   localparam AXI_FETCH_SIZE           = (PAYLOAD_P_DW_BYTES <= AXI_P_DW_BYTES) ? PAYLOAD_P_DW_BYTES : AXI_P_DW_BYTES;
   localparam AXI_UNCACHED_DW          = (1<<AXI_UNCACHED_P_DW_BYTES)*8;
   reg [CONFIG_IC_P_SETS-1:0]          s1i_line_addr;
   reg [TAG_V_RAM_DW-1:0]              s1i_replace_tag_v;
   wire                                s1i_tag_v_re;
   wire                                s1i_tag_v_we            [(1<<CONFIG_IC_P_WAYS)-1:0];
   wire                                s1i_payload_re;
   reg [PAYLOAD_AW-1:0]                s1i_payload_addr;
   wire [PAYLOAD_DW/8-1:0]             s1i_payload_we          [(1<<CONFIG_IC_P_WAYS)-1:0];
   wire [PAYLOAD_DW-1:0]               s1i_payload_din;
   wire [AXI_UNCACHED_DW/8-1:0]        s1i_uncached_align_we;
   wire [AXI_UNCACHED_DW-1:0]          s1i_uncached_align_din;
   wire [PAYLOAD_DW/8-1:0]             s1i_uncached_we;
   wire [PAYLOAD_DW-1:0]               s1i_uncached_din;
   wire [PAYLOAD_DW/8-1:0]             s1i_payload_tgt_we;
   wire [CONFIG_IC_P_SETS-1:0]         s1o_line_addr;
   wire [PAYLOAD_AW-1:0]               s1o_payload_addr;
   wire                                s1o_valid;
   wire [PAYLOAD_DW*(1<<CONFIG_IC_P_WAYS)-1:0] s1o_payload;
   wire [PAYLOAD_DW-1:0]               s1o_match_payload;
   wire [TAG_V_RAM_DW-1:0]             s1o_tag_v               [(1<<CONFIG_IC_P_WAYS)-1:0];
   wire [CONFIG_P_PAGE_SIZE-1:0]       s1o_vpo;
   wire [CONFIG_AW-1:0]                s2i_paddr;
   wire [TAG_WIDTH-1:0]                s2i_tag                 [(1<<CONFIG_IC_P_WAYS)-1:0];
   wire                                s2i_v                   [(1<<CONFIG_IC_P_WAYS)-1:0];
   wire [(1<<CONFIG_IC_P_WAYS)-1:0]    s2i_hit_vec;
   wire                                s2i_hit;
   wire                                s2i_refill_get_dat;
   wire                                s2i_uncached_get_dat;
   reg [PAYLOAD_DW-1:0]                s2i_ins;
   wire [CONFIG_IC_P_SETS-1:0]         s1o_op_inv_line;
   wire                                s2i_uncached_inflight;
   wire                                s2i_miss_inflight;
   wire [CONFIG_IC_P_SETS-1:0]         s2o_line_addr;
   wire                                s2o_valid;
   wire [CONFIG_AW-1:0]                s2o_paddr;
   wire [(1<<CONFIG_IC_P_WAYS)-1:0]    s2o_fsm_free_way;
   wire                                s2o_uncached_inflight;
   wire                                s2o_miss_inflight;
   reg [2:0]                           fsm_state_nxt;
   wire [2:0]                          fsm_state_ff;
   wire [(1<<CONFIG_IC_P_WAYS)-1:0]    fsm_free_way, fsm_free_way_nxt;
   wire [CONFIG_IC_P_SETS-1:0]         fsm_boot_cnt;
   wire [CONFIG_IC_P_SETS:0]           fsm_boot_cnt_nxt_carry;
   wire [CONFIG_IC_P_LINE-1:0]         fsm_refill_cnt;
   reg [CONFIG_IC_P_LINE-1:0]          fsm_refill_cnt_nxt;
   wire [PAYLOAD_P_DW_BYTES-1:0]       fsm_uncached_cnt;
   reg [PAYLOAD_P_DW_BYTES-1:0]        fsm_uncached_cnt_nxt;
   wire [PAYLOAD_P_DW_BYTES:0]         fsm_uncached_cnt_nxt_carry;
   reg                                 fsm_uncached_rd_req;
   wire                                fsm_idle;
   wire                                ar_set, ar_clr;
   wire                                hds_axi_R;
   wire                                hds_axi_R_last;
   wire [CONFIG_AW-1:0]                axi_paddr_nxt;
   wire [AXI_ADDR_WIDTH-1:0]           axi_ar_addr_nxt;
   localparam [2:0] S_BOOT             = 3'd0;
   localparam [2:0] S_IDLE             = 3'd1;
   localparam [2:0] S_REPLACE          = 3'd2;
   localparam [2:0] S_REFILL           = 3'd3;
   localparam [2:0] S_INVALIDATE       = 3'd4;
   localparam [2:0] S_RELOAD_S1O       = 3'd5;
   localparam [2:0] S_UNCACHED_BOOT    = 3'd6;
   localparam [2:0] S_UNCACHED_READ    = 3'd7;
   genvar way, j;
   assign s2i_paddr = {ppn_s2, s1o_vpo};
   generate for(way=0; way<(1<<CONFIG_IC_P_WAYS); way=way+1)
      begin : gen_ways
         ysyx_210479_mRAM_s_s_be
            #(
               .P_DW (PAYLOAD_P_DW_BYTES + 3),
               .AW   (PAYLOAD_AW)
            )
         U_PAYLOAD_RAM
            (
               .CLK  (clk),
               .RST  (rst),
               .ADDR (s1i_payload_addr),
               .RE   (s1i_payload_re),
               .DOUT (s1o_payload[way*PAYLOAD_DW +: PAYLOAD_DW]),
               .WE   (s1i_payload_we[way]),
               .DIN  (s1i_payload_din)
            );
         ysyx_210479_mRF_1wr_r
            #(
               .DW   (TAG_V_RAM_DW),
               .AW   (TAG_V_RAM_AW)
            )
         U_TAG_V_RAM
            (
               .CLK  (clk),
               .RST(rst),
               .ADDR (s1i_line_addr),
               .RE   (s1i_tag_v_re),
               .RDATA (s1o_tag_v[way]),
               .WE   (s1i_tag_v_we[way]),
               .WDATA (s1i_replace_tag_v)
            );
         assign {s2i_tag[way], s2i_v[way]} = s1o_tag_v[way];
         assign s2i_hit_vec[way] = (s2i_v[way] & (s2i_tag[way] == s2i_paddr[CONFIG_AW-1:CONFIG_IC_P_LINE+CONFIG_IC_P_SETS]) );
      end
   endgenerate
   ysyx_210479_pmux_v #(.SELW(1<<CONFIG_IC_P_WAYS), .DW(PAYLOAD_DW)) pmux_s1o_payload (.sel(s2i_hit_vec), .din(s1o_payload), .dout(s1o_match_payload), .valid(s2i_hit) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_valid (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(1'b1), .Q(s1o_valid) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_P_PAGE_SIZE)) ff_s1o_vpo (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(vpo), .Q(s1o_vpo) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_IC_P_SETS)) ff_s1o_op_inv_paddr (.CLK(clk),.RST(rst), .LOAD(fsm_idle), .D(msr_icinv_line_nxt), .Q(s1o_op_inv_line) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_IC_P_SETS)) ff_s1o_line_addr (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_line_addr), .Q(s1o_line_addr) );
   ysyx_210479_mDFF_lr # (.DW(PAYLOAD_AW)) ff_s1o_payload_addr (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_payload_addr), .Q(s1o_payload_addr) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_IC_P_SETS)) ff_s2o_line_addr (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1o_line_addr), .Q(s2o_line_addr) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s2o_valid (.CLK(clk), .RST(rst), .LOAD(p_ce), .D(s1o_valid), .Q(s2o_valid) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_AW)) ff_s2o_paddr (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s2i_paddr), .Q(s2o_paddr) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s2o_uncached_inflight (.CLK(clk), .RST(rst), .LOAD(fsm_idle), .D(s2i_uncached_inflight), .Q(s2o_uncached_inflight) );
   ysyx_210479_mDFF_lr # (.DW(1)) ff_s2o_miss_inflight (.CLK(clk), .RST(rst), .LOAD(fsm_idle), .D(s2i_miss_inflight), .Q(s2o_miss_inflight) );
   always @(*)
      begin
         fsm_state_nxt = fsm_state_ff;
         fsm_uncached_rd_req = 1'b0;
         case (fsm_state_ff)
            S_BOOT:
               if (fsm_boot_cnt_nxt_carry[CONFIG_IC_P_SETS])
                  fsm_state_nxt = S_IDLE;
            S_IDLE:
               if (msr_icinv_we) 
                  fsm_state_nxt = S_INVALIDATE;
               else if (s2i_uncached_inflight) 
                  fsm_state_nxt = S_UNCACHED_BOOT;
               else if (s2i_miss_inflight) 
                  fsm_state_nxt = S_REPLACE;
            S_REPLACE:
               fsm_state_nxt = S_REFILL;
            S_REFILL:
               if (hds_axi_R_last)
                  fsm_state_nxt = S_RELOAD_S1O;
            S_INVALIDATE:
               fsm_state_nxt = (s2o_uncached_inflight)
                                 ? S_UNCACHED_BOOT
                                 : (s2o_miss_inflight)
                                    ? S_REPLACE
                                    : S_IDLE;
            S_RELOAD_S1O:
               fsm_state_nxt = S_IDLE;
            S_UNCACHED_BOOT:
               begin
                  fsm_state_nxt = S_UNCACHED_READ;
                  fsm_uncached_rd_req = 'b1;
               end
            S_UNCACHED_READ:
               if (fsm_uncached_cnt_nxt_carry[PAYLOAD_P_DW_BYTES] & hds_axi_R)
                  fsm_state_nxt = S_IDLE;
               else if (hds_axi_R)
                  fsm_uncached_rd_req = 'b1; 
            default:
               fsm_state_nxt = fsm_state_ff;
         endcase
      end
   assign s2i_uncached_inflight = (p_ce & s1o_valid & uncached_s2 & ~kill_req_s2);
   assign s2i_miss_inflight = (p_ce & s1o_valid & ~s2i_hit & ~uncached_s2 & ~kill_req_s2);
   ysyx_210479_mDFF_r # (.DW(3), .RST_VECTOR(S_BOOT)) ff_state_r (.CLK(clk), .RST(rst), .D(fsm_state_nxt), .Q(fsm_state_ff) );
   assign fsm_free_way_nxt = (fsm_free_way[(1<<CONFIG_IC_P_WAYS)-1])
                              ? {{(1<<CONFIG_IC_P_WAYS)-1{1'b0}}, 1'b1}
                              : {fsm_free_way[(1<<CONFIG_IC_P_WAYS)-2:0], 1'b0};
   ysyx_210479_mDFF_r #(.DW(1<<CONFIG_IC_P_WAYS), .RST_VECTOR({{(1<<CONFIG_IC_P_WAYS)-1{1'b0}}, 1'b1}) ) ff_fsm_free_idx
      (.CLK(clk), .RST(rst), .D(fsm_free_way_nxt), .Q(fsm_free_way) );
   assign fsm_boot_cnt_nxt_carry = fsm_boot_cnt + {{CONFIG_IC_P_SETS-1{1'b0}}, 1'b1};
   ysyx_210479_mDFF_r # (.DW(CONFIG_IC_P_SETS)) ff_fsm_boot_cnt_nxt (.CLK(clk), .RST(rst), .D(fsm_boot_cnt_nxt_carry[CONFIG_IC_P_SETS-1:0]), .Q(fsm_boot_cnt) );
   localparam [CONFIG_IC_P_LINE-1:0] FSM_REFILL_CNT_DELTA = (1<<AXI_FETCH_SIZE);
   always @(*)
      if ((fsm_state_ff == S_REFILL) & hds_axi_R)
         fsm_refill_cnt_nxt = fsm_refill_cnt + FSM_REFILL_CNT_DELTA;
      else
         fsm_refill_cnt_nxt = fsm_refill_cnt;
   ysyx_210479_mDFF_r # (.DW(CONFIG_IC_P_LINE)) ff_fsm_refill_cnt (.CLK(clk), .RST(rst), .D(fsm_refill_cnt_nxt), .Q(fsm_refill_cnt) );
   always @(*)
      if ((fsm_state_ff == S_UNCACHED_READ) & hds_axi_R)
         fsm_uncached_cnt_nxt = fsm_uncached_cnt_nxt_carry[PAYLOAD_P_DW_BYTES-1:0];
      else
         fsm_uncached_cnt_nxt = fsm_uncached_cnt;
   localparam [PAYLOAD_P_DW_BYTES-1:0] FSM_UNCACHED_CNT_DELTA = (1<<AXI_UNCACHED_P_DW_BYTES);
   assign fsm_uncached_cnt_nxt_carry = fsm_uncached_cnt + FSM_UNCACHED_CNT_DELTA;
   ysyx_210479_mDFF_r # (.DW(PAYLOAD_P_DW_BYTES)) ff_fsm_uncached_cnt (.CLK(clk), .RST(rst), .D(fsm_uncached_cnt_nxt), .Q(fsm_uncached_cnt) );
   always @(*)
      case (fsm_state_ff)
         S_BOOT:
            s1i_line_addr = fsm_boot_cnt;
         S_INVALIDATE:
            s1i_line_addr = s1o_op_inv_line;
         S_REPLACE:
            s1i_line_addr = s2o_line_addr;
         S_RELOAD_S1O:
            s1i_line_addr = s1o_line_addr;
         default:
            s1i_line_addr = vpo[CONFIG_IC_P_LINE +: CONFIG_IC_P_SETS]; 
      endcase
   always @(*)
      case (fsm_state_ff)
         S_REPLACE:
            s1i_replace_tag_v = {s2o_paddr[CONFIG_AW-1:CONFIG_IC_P_LINE+CONFIG_IC_P_SETS], 1'b1};
         default: 
            s1i_replace_tag_v = {TAG_V_RAM_DW{1'b0}};
      endcase
   assign s1i_tag_v_re = (p_ce | (fsm_state_ff==S_RELOAD_S1O));
   generate for(way=0; way<(1<<CONFIG_IC_P_WAYS); way=way+1)
      begin : gen_tag_v_we
         assign s1i_tag_v_we[way] = (fsm_state_ff==S_BOOT) |
                                    (fsm_state_ff==S_INVALIDATE) |
                                    ((fsm_state_ff==S_REPLACE) & (fsm_free_way[way]));
      end
   endgenerate
   ysyx_210479_mDFF_lr #(.DW(1<<CONFIG_IC_P_WAYS)) ff_s2o_fsm_free_way(.CLK(clk),.RST(rst), .LOAD(fsm_state_ff==S_REPLACE), .D(fsm_free_way), .Q(s2o_fsm_free_way));
   always @(*)
      case (fsm_state_ff)
         S_REFILL:
            s1i_payload_addr = {s2o_paddr[CONFIG_IC_P_LINE +: CONFIG_IC_P_SETS], fsm_refill_cnt[PAYLOAD_P_DW_BYTES +: CONFIG_IC_P_LINE-PAYLOAD_P_DW_BYTES]};
         S_RELOAD_S1O:
            s1i_payload_addr = s1o_payload_addr;
         default:
            s1i_payload_addr = vpo[PAYLOAD_P_DW_BYTES +: PAYLOAD_AW]; 
      endcase
   assign s1i_payload_re = s1i_tag_v_re;
   ysyx_210479_align_r
      #(
         .IN_P_DW_BYTES                (AXI_P_DW_BYTES),
         .OUT_P_DW_BYTES               (PAYLOAD_P_DW_BYTES),
         .IN_AW                        (CONFIG_IC_P_LINE)
      )
   U_ALIGN_R
      (
         .i_dat                        (ibus_RDATA),
         .i_be                         ({(1<<AXI_P_DW_BYTES){fsm_state_ff == S_REFILL}}),
         .i_addr                       (fsm_refill_cnt),
         .o_be                         (s1i_payload_tgt_we),
         .o_dat                        (s1i_payload_din)
      );
   generate for(way=0; way<(1<<CONFIG_IC_P_WAYS); way=way+1)
      begin : gen_payload_we
         assign s1i_payload_we[way] = (s1i_payload_tgt_we & {PAYLOAD_DW/8{s2o_fsm_free_way[way]}});
      end
   endgenerate
   ysyx_210479_align_r
      #(
         .IN_P_DW_BYTES                (AXI_P_DW_BYTES),
         .OUT_P_DW_BYTES               (AXI_UNCACHED_P_DW_BYTES),
         .IN_AW                        (AXI_ADDR_WIDTH)
      )
   U_ALIGN_R_UNCACHED_A
      (
         .i_dat                        (ibus_RDATA),
         .i_be                         ({(1<<AXI_P_DW_BYTES){fsm_state_ff == S_UNCACHED_READ}}),
         .i_addr                       (ibus_ARADDR),
         .o_be                         (s1i_uncached_align_we),
         .o_dat                        (s1i_uncached_align_din)
      );
   ysyx_210479_align_r
      #(
         .IN_P_DW_BYTES                (AXI_UNCACHED_P_DW_BYTES),
         .OUT_P_DW_BYTES               (PAYLOAD_P_DW_BYTES),
         .IN_AW                        (AXI_ADDR_WIDTH)
      )
   U_ALIGN_R_UNCACHED_B
      (
         .i_dat                        (s1i_uncached_align_din),
         .i_be                         (s1i_uncached_align_we),
         .i_addr                       (ibus_ARADDR),
         .o_be                         (s1i_uncached_we),
         .o_dat                        (s1i_uncached_din)
      );
   assign fsm_idle = (fsm_state_ff == S_IDLE);
   assign stall_req = ~fsm_idle;
   assign msr_icinv_ready = (~fsm_idle); 
   assign s2i_refill_get_dat = (s2o_paddr[PAYLOAD_P_DW_BYTES +: CONFIG_IC_P_LINE-PAYLOAD_P_DW_BYTES] ==
                                 fsm_refill_cnt[PAYLOAD_P_DW_BYTES +: CONFIG_IC_P_LINE-PAYLOAD_P_DW_BYTES]);
   assign s2i_uncached_get_dat = (s2o_paddr[PAYLOAD_P_DW_BYTES +: CONFIG_IC_P_LINE-PAYLOAD_P_DW_BYTES] ==
                                 ibus_ARADDR[PAYLOAD_P_DW_BYTES +: CONFIG_IC_P_LINE-PAYLOAD_P_DW_BYTES]);
   generate for(j=0;j<PAYLOAD_DW/8;j=j+1)
      begin : gen_output_inner
         always @(*)
            case (fsm_state_ff)
               S_REFILL:
                  if (s2i_refill_get_dat & s1i_payload_tgt_we[j])
                     s2i_ins[j*8 +: 8] = s1i_payload_din[j*8 +: 8]; 
                  else
                     s2i_ins[j*8 +: 8] = ins[j*8 +: 8];
               S_UNCACHED_READ:
                  if (s2i_uncached_get_dat & s1i_uncached_we[j])
                     s2i_ins[j*8 +: 8] = s1i_uncached_din[j*8 +: 8]; 
                  else
                     s2i_ins[j*8 +: 8] = ins[j*8 +: 8];
               default:
                  s2i_ins[j*8 +: 8] = s1o_match_payload[j*8 +: 8]; 
            endcase
      end
   endgenerate
   ysyx_210479_mDFF_lr # (.DW(PAYLOAD_DW)) ff_ins (.CLK(clk), .RST(rst), .LOAD(p_ce|(fsm_state_ff==S_REFILL)|(fsm_state_ff==S_UNCACHED_READ)), .D(s2i_ins), .Q(ins) );
   assign valid = s2o_valid;
   assign ibus_ARPROT = 3'b000 | 3'b000 | 3'b000;
   assign ibus_ARID = {AXI_ID_WIDTH{1'b0}};
   assign ibus_ARUSER = {AXI_USER_WIDTH{1'b0}};
   localparam [7:0] ARLEN_S_REFILL = ((1<<(CONFIG_IC_P_LINE-AXI_FETCH_SIZE))-1);
   assign ibus_ARLEN = (fsm_state_ff==S_REFILL) ? ARLEN_S_REFILL : 8'b0;
   assign ibus_ARSIZE = (fsm_state_ff==S_REFILL) ? AXI_FETCH_SIZE[2:0] : AXI_UNCACHED_P_DW_BYTES[2:0];
   assign ibus_ARBURST = 2'b01;
   assign ibus_ARLOCK = 1'b0;
   assign ibus_ARCACHE = 4'b0010;
   assign ibus_ARQOS = 4'b0;
   assign ibus_ARREGION = 4'b0;
   assign ar_set = ((fsm_state_ff==S_REPLACE) | fsm_uncached_rd_req);
   assign ar_clr = (ibus_ARREADY & ibus_ARVALID);
   assign axi_paddr_nxt = (fsm_uncached_rd_req)
                           ? {s2o_paddr[PAYLOAD_P_DW_BYTES +: CONFIG_AW - PAYLOAD_P_DW_BYTES], fsm_uncached_cnt_nxt}
                           : {s2o_paddr[CONFIG_IC_P_LINE +: CONFIG_AW - CONFIG_IC_P_LINE], {CONFIG_IC_P_LINE{1'b0}}};
   generate
      if (AXI_ADDR_WIDTH > CONFIG_AW)
         assign axi_ar_addr_nxt = {{AXI_ADDR_WIDTH-CONFIG_AW{1'b0}}, axi_paddr_nxt};
      else if (AXI_ADDR_WIDTH < CONFIG_AW)
         assign axi_ar_addr_nxt = axi_paddr_nxt[AXI_ADDR_WIDTH-1:0];
      else
         assign axi_ar_addr_nxt = axi_paddr_nxt;
   endgenerate
   ysyx_210479_mDFF_lr # (.DW(1)) ff_axi_ar_valid (.CLK(clk), .RST(rst), .LOAD(ar_set|ar_clr), .D(ar_set|~ar_clr), .Q(ibus_ARVALID) );
   ysyx_210479_mDFF_lr # (.DW(AXI_ADDR_WIDTH)) ff_axi_ar_addr (.CLK(clk), .RST(rst), .LOAD(ar_set), .D(axi_ar_addr_nxt), .Q(ibus_ARADDR) );
   assign ibus_RREADY = (fsm_state_ff == S_REFILL) | (fsm_state_ff == S_UNCACHED_READ);
   assign hds_axi_R = (ibus_RVALID & ibus_RREADY);
   assign hds_axi_R_last = (hds_axi_R & ibus_RLAST);
   assign msr_icid[3:0] = CONFIG_IC_P_SETS[3:0];
   assign msr_icid[7:4] = CONFIG_IC_P_LINE[3:0];
   assign msr_icid[11:8] = CONFIG_IC_P_WAYS[3:0];
   assign msr_icid[31:12] = 20'b0;
endmodule
module ysyx_210479_id
#(
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_P_ISSUE_WIDTH = 0,
   parameter                           CONFIG_PHT_P_NUM = 0,
   parameter                           CONFIG_BTB_P_NUM = 0,
   parameter                           CONFIG_ENABLE_ASR = 0
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input                               rn_stall_req,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_valid,
   output [CONFIG_P_ISSUE_WIDTH:0]      id_pop_cnt,
   input [((2 <<1)*8) * (1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_ins,
   input [(CONFIG_AW-2 ) * (1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_pc,
   input [2 * (1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_exc,
   input [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) * (1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_bpu_upd,
   input                               irq_async,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0]                rn_valid,
   output [9 *(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_alu_opc_bus,
   output [2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_epu_opc_bus,
   output [8*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_bru_opc_bus,
   output [7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lsu_opc_bus,
   output [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_fe,
   output [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_bpu_upd,
   output [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_pc,
   output [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_imm,
   output [5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrs1,
   output [5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrs2,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrs1_re,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrs2_re,
   output [5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrd,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrd_we,
   output [CONFIG_P_ISSUE_WIDTH:0] rn_push_size
);
   localparam IW                       = (1<<CONFIG_P_ISSUE_WIDTH);
   wire                                p_ce;
   wire [IW-1:0]                       valid;
   wire [9 *IW-1:0]        s1i_alu_opc_bus;
   wire [2*IW-1:0]        s1i_epu_opc_bus;
   wire [8*IW-1:0]        s1i_bru_opc_bus;
   wire [7*IW-1:0]        s1i_lsu_opc_bus;
   wire [CONFIG_DW*IW-1:0]             s1i_imm;
   wire [6*IW-1:0]            s1i_fe;
   wire [IW-1:0]                       rf_we;
   wire [5*IW-1:0]          rf_waddr;
   wire [IW-1:0]                       rf_rs1_re;
   wire [5*IW-1:0]          rf_rs1_addr;
   wire [IW-1:0]                       rf_rs2_re;
   wire [5*IW-1:0]          rf_rs2_addr;
   genvar i;
   generate for(i=0;i<IW;i=i+1)
      begin : gen_dec
         ysyx_210479_id_dec
            #(
              .CONFIG_DW             (CONFIG_DW),
              .CONFIG_ENABLE_ASR     (CONFIG_ENABLE_ASR))
         U_DEC
            (
               .id_valid            (id_valid[i]),
               .id_ins              (id_ins[i*((2 <<1)*8) +: ((2 <<1)*8)]),
               .id_exc              (id_exc[i*2 +: 2]),
               .irq_async           (irq_async),
               .alu_opc_bus         (s1i_alu_opc_bus[i*9  +: 9 ]),
               .epu_opc_bus         (s1i_epu_opc_bus[i*2 +: 2]),
               .bru_opc_bus         (s1i_bru_opc_bus[i*8 +: 8]),
               .lsu_opc_bus         (s1i_lsu_opc_bus[i*7 +: 7]),
               .fe                  (s1i_fe[i*6 +: 6]),
               .imm                 (s1i_imm[i*CONFIG_DW +: CONFIG_DW]),
               .rf_we               (rf_we[i]),
               .rf_waddr            (rf_waddr[i*5 +:5]),
               .rf_rs1_re           (rf_rs1_re[i]),
               .rf_rs1_addr         (rf_rs1_addr[i*5 +:5]),
               .rf_rs2_re           (rf_rs2_re[i]),
               .rf_rs2_addr         (rf_rs2_addr[i*5 +:5])
            );
      end
   endgenerate
   assign p_ce = (~rn_stall_req);
   assign valid = (id_valid);
   ysyx_210479_popcnt #(.DW(IW), .P_DW(CONFIG_P_ISSUE_WIDTH)) U_CLO (.bitmap(valid & {IW{p_ce}}), .count(id_pop_cnt) );
   ysyx_210479_mDFF_lr # (.DW(IW)) ff_rn_valid (.CLK(clk), .RST(rst), .LOAD(p_ce|flush), .D(valid & {IW{~flush}}), .Q(rn_valid) );
   ysyx_210479_mDFF_lr # (.DW(9 *IW)) ff_rn_alu_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_alu_opc_bus), .Q(rn_alu_opc_bus) );
   ysyx_210479_mDFF_lr # (.DW(2*IW)) ff_rn_epu_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_epu_opc_bus), .Q(rn_epu_opc_bus) );
   ysyx_210479_mDFF_lr # (.DW(8*IW)) ff_rn_bru_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_bru_opc_bus), .Q(rn_bru_opc_bus) );
   ysyx_210479_mDFF_lr # (.DW(7*IW)) ff_rn_lsu_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_lsu_opc_bus), .Q(rn_lsu_opc_bus) );
   ysyx_210479_mDFF_lr # (.DW(6*IW)) ff_rn_fe (.CLK(clk), .LOAD(p_ce),.RST(rst), .D(s1i_fe), .Q(rn_fe) );
   ysyx_210479_mDFF_lr # (.DW((2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*IW)) ff_rn_bpu_upd (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(id_bpu_upd), .Q(rn_bpu_upd) );
   ysyx_210479_mDFF_lr # (.DW((CONFIG_AW-2 )*IW)) ff_rn_pc (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(id_pc), .Q(rn_pc) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DW*IW)) ff_rn_imm (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(s1i_imm), .Q(rn_imm) );
   ysyx_210479_mDFF_lr # (.DW(5*IW)) ff_rn_lrs1 (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(rf_rs1_addr), .Q(rn_lrs1) );
   ysyx_210479_mDFF_lr # (.DW(5*IW)) ff_rn_lrs2 (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(rf_rs2_addr), .Q(rn_lrs2) );
   ysyx_210479_mDFF_lr # (.DW(IW)) ff_rn_lrs1_re (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(rf_rs1_re), .Q(rn_lrs1_re) );
   ysyx_210479_mDFF_lr # (.DW(IW)) ff_rn_lrs2_re (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(rf_rs2_re), .Q(rn_lrs2_re) );
   ysyx_210479_mDFF_lr # (.DW(IW)) ff_rn_lrd_we (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(rf_we), .Q(rn_lrd_we) );
   ysyx_210479_mDFF_lr # (.DW(5*IW)) ff_rn_lrd (.CLK(clk),.RST(rst), .LOAD(p_ce), .D(rf_waddr), .Q(rn_lrd) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_P_ISSUE_WIDTH+1)) ff_rn_push_size (.CLK(clk), .RST(rst), .LOAD(p_ce|flush), .D(id_pop_cnt & {CONFIG_P_ISSUE_WIDTH+1{~flush}}), .Q(rn_push_size) );
endmodule
module ysyx_210479_id_dec
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_ENABLE_ASR = 0
)
(
   input                               id_valid,
   input [((2 <<1)*8)-1:0]           id_ins,
   input [2-1:0]              id_exc,
   input                               irq_async,
   output [9 -1:0]         alu_opc_bus,
   output [2-1:0]         epu_opc_bus,
   output [8-1:0]         bru_opc_bus,
   output [7-1:0]         lsu_opc_bus,
   output [6-1:0]             fe,
   output [CONFIG_DW-1:0]              imm,
   output                              rf_we,
   output [5-1:0]           rf_waddr,
   output                              rf_rs1_re,
   output [5-1:0]           rf_rs1_addr,
   output                              rf_rs2_re,
   output [5-1:0]           rf_rs2_addr
);
   wire                                msk;
   wire [6:0]                          f_opcode;
   wire [4:0]                          f_rd;
   wire [4:0]                          f_rs1;
   wire [4:0]                          f_rs2;
   wire [14:0]                         f_imm15;
   wire [16:0]                         f_imm17;
   wire [14:0]                         f_rel15;
   wire [24:0]                         f_rel25;
   wire                                enable_asr;
   wire                                enable_asr_i;
   wire                                op_ldb;
   wire                                op_ldbu;
   wire                                op_ldh;
   wire                                op_ldhu;
   wire                                op_ldwu;
   wire                                op_stb;
   wire                                op_sth;
   wire                                op_stw;
   wire                                op_and;
   wire                                op_and_i;
   wire                                op_or;
   wire                                op_or_i;
   wire                                op_xor;
   wire                                op_xor_i;
   wire                                op_lsl;
   wire                                op_lsl_i;
   wire                                op_lsr;
   wire                                op_lsr_i;
   wire                                op_asr;
   wire                                op_asr_i;
   wire                                op_add;
   wire                                op_add_i;
   wire                                op_sub;
   wire                                op_mhi;
   wire                                op_jmp_i;
   wire                                op_jmp_lnk_i;
   wire                                op_jmpreg;
   wire                                op_beq;
   wire                                op_bne;
   wire                                op_bgt;
   wire                                op_bgtu;
   wire                                op_ble;
   wire                                op_bleu;
   wire                                op_syscall;
   wire                                op_ret;
   wire                                op_wmsr;
   wire                                op_rmsr;
   wire                                is_bcc;
   wire                                insn_rs1_imm15;
   wire                                insn_rd_rs1_imm15;
   wire                                insn_rd_rs1_rel15;
   wire                                insn_uimm17;
   wire                                insn_rel25;
   wire                                insn_no_rops;
   wire                                use_simm15;
   wire                                not_wb;
   wire                                read_rd_as_rs2;
   wire [CONFIG_DW-1:0]                imm15;
   wire [CONFIG_DW-1:0]                uimm17;
   wire [CONFIG_DW-1:0]                rel15;
   wire [CONFIG_DW-1:0]                rel25;
   wire [((2 <<1)*8)-1:0]            inst;
   assign msk = ((~|id_exc) & ~irq_async & id_valid);
   assign inst = (id_ins & {((2 <<1)*8){msk}}); 
   assign f_opcode = inst[11:5]; 
   assign f_rd = inst[4:0];
   assign f_rs1 = inst[16:12];
   assign f_rs2 = inst[21:17];
   assign f_imm15 = inst[31:17];
   assign f_imm17 = inst[31:15];
   assign f_rel15 = inst[31:17];
   assign f_rel25 = {inst[31:12], inst[4:0]};
   assign enable_asr = 1'b1;
   assign enable_asr_i = 1'b1;
   assign op_ldb = (f_opcode == 7'h1d);
   assign op_ldbu = (f_opcode == 7'h1c);
   assign op_ldh = (f_opcode == 7'h1a);
   assign op_ldhu = (f_opcode == 7'h19);
   assign op_ldwu = (f_opcode == 7'h17);
   assign op_stb = (f_opcode == 7'h1e);
   assign op_sth = (f_opcode == 7'h1b);
   assign op_stw = (f_opcode == 7'h18);
   assign op_and = (f_opcode == 7'h0);
   assign op_and_i = (f_opcode == 7'h1);
   assign op_or = (f_opcode == 7'h2);
   assign op_or_i = (f_opcode == 7'h3);
   assign op_xor = (f_opcode == 7'h4);
   assign op_xor_i = (f_opcode == 7'h5);
   assign op_lsl = (f_opcode == 7'h6);
   assign op_lsl_i = (f_opcode == 7'h7);
   assign op_lsr = (f_opcode == 7'h8);
   assign op_lsr_i = (f_opcode == 7'h9);
   assign op_add = (f_opcode == 7'ha);
   assign op_add_i = (f_opcode == 7'hb);
   assign op_sub = (f_opcode == 7'hc);
   generate
      if (CONFIG_ENABLE_ASR)
         begin : gen_op_asr
            assign op_asr = (f_opcode == 7'h30) & enable_asr;
            assign op_asr_i = (f_opcode == 7'h31) & enable_asr_i;
         end
      else
         begin : gen_op_asr_disabled
            assign op_asr = 1'b0;
            assign op_asr_i = 1'b0;
         end
   endgenerate
   assign op_mhi = (f_opcode == 7'h37);
   assign op_jmp_i = (f_opcode == 7'he);
   assign op_jmp_lnk_i = (f_opcode == 7'hf);
   assign op_jmpreg = (f_opcode == 7'hd);
   assign op_beq = (f_opcode == 7'h10);
   assign op_bne = (f_opcode == 7'h11);
   assign op_bgt = (f_opcode == 7'h12);
   assign op_bgtu = (f_opcode == 7'h13);
   assign op_ble = (f_opcode == 7'h14);
   assign op_bleu = (f_opcode == 7'h15);
   assign op_syscall = (f_opcode == 7'h21);
   assign op_ret = (f_opcode == 7'h22);
   assign op_wmsr = (f_opcode == 7'h23);
   assign op_rmsr = (f_opcode == 7'h24);
   assign alu_opc_bus[3] = (op_and | op_and_i);
   assign alu_opc_bus[4] = (op_or | op_or_i);
   assign alu_opc_bus[5] = (op_xor | op_xor_i);
   assign alu_opc_bus[6] = (op_lsl | op_lsl_i);
   assign alu_opc_bus[7] = (op_lsr | op_lsr_i);
   assign alu_opc_bus[8] = (op_asr | op_asr_i);
   assign alu_opc_bus[0] = (op_add | op_add_i);
   assign alu_opc_bus[1] = (op_sub);
   assign alu_opc_bus[2] = (op_mhi);
   assign bru_opc_bus[0] = (op_beq);
   assign bru_opc_bus[1] = (op_bne);
   assign bru_opc_bus[2] = (op_bgt);
   assign bru_opc_bus[3] = (op_bgtu);
   assign bru_opc_bus[4] = (op_ble);
   assign bru_opc_bus[5] = (op_bleu);
   assign bru_opc_bus[7] = (op_jmp_lnk_i | op_jmp_i);
   assign bru_opc_bus[6] = op_jmpreg;
   assign is_bcc = (op_beq | op_bne | op_bgt | op_bgtu | op_ble | op_bleu);
   assign lsu_opc_bus[6:4] = (op_ldb|op_ldbu|op_stb)
                                          ? 3'd0
                                          : (op_ldh|op_ldhu|op_sth)
                                             ? 3'd1
                                             : (op_ldwu|op_stw)
                                                ? 3'd2
                                                : 3'd0;
   assign lsu_opc_bus[3] = (op_ldb | op_ldh);
   assign lsu_opc_bus[0] = (op_ldb|op_ldbu|op_ldh|op_ldhu|op_ldwu);
   assign lsu_opc_bus[1] = (op_stb|op_sth|op_stw);
   assign lsu_opc_bus[2] = (f_opcode == 7'h20);
   assign epu_opc_bus[0] = op_wmsr;
   assign epu_opc_bus[1] = op_rmsr;
   assign fe[0] = op_syscall;
   assign fe[1] = op_ret;
   assign fe[2] = (id_exc[0] & ~irq_async);
   assign fe[3] = (id_exc[1] & ~irq_async);
   assign fe[4] = irq_async;
   assign fe[(6-1)] =
      ~(
         (|alu_opc_bus) |
         (|bru_opc_bus) |
         (lsu_opc_bus[0] | lsu_opc_bus[1] | lsu_opc_bus[2]) |
         (|epu_opc_bus) | op_syscall | op_ret
      );
   assign insn_rs1_imm15 =
      (
         op_and_i | op_or_i | op_xor_i | op_lsl_i | op_lsr_i | op_asr_i |
         op_add_i |
         lsu_opc_bus[0] |
         op_rmsr
      );
   assign insn_rd_rs1_imm15 =
      (
         lsu_opc_bus[1] |
         op_wmsr
      );
   assign insn_rd_rs1_rel15 = is_bcc;
   assign insn_uimm17 = op_mhi;
   assign insn_rel25 = (op_jmp_i | op_jmp_lnk_i);
   assign use_simm15 = (op_xor_i | op_add_i | lsu_opc_bus[0] | lsu_opc_bus[1]);
   assign insn_no_rops = (op_mhi | lsu_opc_bus[2] | op_syscall | op_ret | op_jmp_i | op_jmp_lnk_i);
   assign not_wb =
      (
         op_jmp_i | is_bcc | 
         lsu_opc_bus[1] | lsu_opc_bus[2] |
         op_wmsr | (|fe)
      );
   assign rf_we = ~not_wb & (|rf_waddr);
   assign rf_waddr = (op_jmp_lnk_i) ? (5'd1)  : f_rd;
   assign read_rd_as_rs2 = (lsu_opc_bus[1] | op_wmsr | is_bcc);
   assign rf_rs1_re = ~insn_no_rops;
   assign rf_rs1_addr = f_rs1;
   assign rf_rs2_re = ((~insn_rs1_imm15 & ~insn_uimm17 & ~insn_rel25 & ~insn_no_rops) | read_rd_as_rs2);
   assign rf_rs2_addr = read_rd_as_rs2 ? f_rd : f_rs2;
   assign imm15 = {{CONFIG_DW-15{use_simm15 & f_imm15[14]}}, f_imm15[14:0]};
   assign uimm17 = {{CONFIG_DW-17{1'b0}}, f_imm17[16:0]};
   assign rel15 = {{CONFIG_DW-2-15{f_rel15[14]}}, f_rel15[14:0], 2'b00};
   assign rel25 = {{CONFIG_DW-2-25{f_rel25[24]}}, f_rel25[24:0], 2'b00};
   assign imm = ({CONFIG_DW{insn_rs1_imm15|insn_rd_rs1_imm15}} & imm15) |
                  ({CONFIG_DW{insn_rd_rs1_rel15}} & rel15) |
                  ({CONFIG_DW{insn_rel25}} & rel25) |
                  ({CONFIG_DW{insn_uimm17}} & uimm17);
endmodule
module ysyx_210479_immu
#(
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_IMMU_ENABLE_UNCACHED_SEG = 0,
   parameter                           CONFIG_P_PAGE_SIZE = 0,
   parameter                           CONFIG_ITLB_P_SETS = 0
)
(
   input                               clk,
   input                               rst,
   input                               re,
   input [CONFIG_AW-CONFIG_P_PAGE_SIZE-1:0] vpn,
   output [CONFIG_AW-CONFIG_P_PAGE_SIZE-1:0] ppn,
   output                              EITM,
   output                              EIPF,
   output                              uncached,
   input                               msr_psr_imme,
   input                               msr_psr_rm,
   output [CONFIG_DW-1:0]              msr_immid,
   input [CONFIG_ITLB_P_SETS-1:0]      msr_imm_tlbl_idx,
   input [CONFIG_DW-1:0]               msr_imm_tlbl_nxt,
   input                               msr_imm_tlbl_we,
   input [CONFIG_ITLB_P_SETS-1:0]      msr_imm_tlbh_idx,
   input [CONFIG_DW-1:0]               msr_imm_tlbh_nxt,
   input                               msr_imm_tlbh_we
);
   localparam VPN_SHIFT                = CONFIG_P_PAGE_SIZE;
   localparam PPN_SHIFT                = VPN_SHIFT;
   localparam VPN_DW                   = CONFIG_AW-VPN_SHIFT;
   localparam PPN_DW                   = CONFIG_AW-PPN_SHIFT;
   assign msr_immid = {{32-3{1'b0}}, CONFIG_ITLB_P_SETS[2:0]};
   wire                                msr_psr_imme_ff;
   wire                                msr_psr_rm_ff;
   wire [VPN_DW-1:0]                   tgt_vpn_ff;
   wire [CONFIG_DW-1:0]                tlb_l_ff;
   wire [CONFIG_DW-1:0]                tlb_h_ff;
   wire [VPN_DW-1:0] tgt_vpn_nxt = vpn[VPN_DW-1:0];
   wire [CONFIG_ITLB_P_SETS-1:0] tgt_index_nxt = tgt_vpn_nxt[CONFIG_ITLB_P_SETS-1:0];
   ysyx_210479_mDFF_lr #(.DW(1)) ff_msr_psr_imme (.CLK(clk),.RST(rst), .LOAD(re), .D(msr_psr_imme), .Q(msr_psr_imme_ff) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_msr_psr_rm (.CLK(clk),.RST(rst), .LOAD(re), .D(msr_psr_rm), .Q(msr_psr_rm_ff) );
   ysyx_210479_mDFF_lr #(.DW(VPN_DW)) ff_tgt_vpn (.CLK(clk),.RST(rst), .LOAD(re), .D(tgt_vpn_nxt), .Q(tgt_vpn_ff) );
   ysyx_210479_mRF_nwnr_r
      #(
         .DW      (CONFIG_DW),
         .AW      (CONFIG_ITLB_P_SETS),
         .NUM_READ (1),
         .NUM_WRITE (1)
      )
   U_TLB_L
      (
         .CLK     (clk),
         .RST     (rst),
         .RE      (re),
         .RADDR   (tgt_index_nxt),
         .RDATA   (tlb_l_ff),
         .WE      (msr_imm_tlbl_we),
         .WADDR   (msr_imm_tlbl_idx),
         .WDATA   (msr_imm_tlbl_nxt)
      );
   ysyx_210479_mRF_nwnr_r
      #(
         .DW      (CONFIG_DW),
         .AW      (CONFIG_ITLB_P_SETS),
         .NUM_READ (1),
         .NUM_WRITE (1)
      )
   U_TLB_H
      (
         .CLK     (clk),
         .RST     (rst),
         .RE      (re),
         .RADDR   (tgt_index_nxt),
         .RDATA   (tlb_h_ff),
         .WE      (msr_imm_tlbh_we),
         .WADDR   (msr_imm_tlbh_idx),
         .WDATA   (msr_imm_tlbh_nxt)
      );
   wire tlb_v = tlb_l_ff[0];
   wire [VPN_DW-1:0] tlb_vpn = tlb_l_ff[CONFIG_DW-1:CONFIG_DW-VPN_DW];
   wire tlb_ux = tlb_h_ff[3];
   wire tlb_rx = tlb_h_ff[4];
   wire tlb_unc = tlb_h_ff[7];
   wire [PPN_DW-1:0] tlb_ppn = tlb_h_ff[CONFIG_DW-1:CONFIG_DW-PPN_DW];
   wire perm_denied;
   wire tlb_miss;
   assign perm_denied =
      (
         (msr_psr_rm_ff & ~tlb_rx) |
         (~msr_psr_rm_ff & ~tlb_ux)
      );
   assign tlb_miss = ~(tlb_v & tlb_vpn == tgt_vpn_ff);
   assign EITM = (tlb_miss & msr_psr_imme_ff);
   assign EIPF = (perm_denied & ~tlb_miss & msr_psr_imme_ff);
   assign ppn = msr_psr_imme_ff ? tlb_ppn : tgt_vpn_ff;
generate
   if (CONFIG_IMMU_ENABLE_UNCACHED_SEG)
      assign uncached = (msr_psr_imme_ff & ~tlb_miss & ~perm_denied & tlb_unc) | (~EITM & ~EIPF & ~ppn[CONFIG_AW-CONFIG_P_PAGE_SIZE-1]);
   else
      assign uncached = (msr_psr_imme_ff & ~tlb_miss & ~perm_denied & tlb_unc);
endgenerate
endmodule
module ysyx_210479_issue
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_P_ISSUE_WIDTH = 0,
   parameter                           CONFIG_P_COMMIT_WIDTH = 0,
   parameter                           CONFIG_P_ROB_DEPTH = 0,
   parameter                           CONFIG_P_RS_DEPTH = 0,
   parameter                           CONFIG_PHT_P_NUM = 0,
   parameter                           CONFIG_BTB_P_NUM = 0
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input                               issue_p_ce,
   input [9 *(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_alu_opc_bus,
   input [2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_epu_opc_bus,
   input [8*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_bru_opc_bus,
   input [7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_lsu_opc_bus,
   input [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_fe,
   input [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_bpu_upd,
   input [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_pc,
   input [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_imm,
   input [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs1,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs1_re,
   input [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs2,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs2_re,
   input [5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_lrd,
   input [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prd,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prd_we,
   input [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_pfree,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_push,
   input [CONFIG_P_ISSUE_WIDTH:0]      issue_push_size,
   input [(1<<6)-1:0]       busytable,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_ready,
   input                               rob_ready,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] rob_free_id,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] rob_free_bank, 
   output [2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_epu_opc_bus,
   output [7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_lsu_opc_bus,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:0] rob_push_bpu_upd,
   output [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_pc,
   output [5*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] rob_push_lrd,
   output [6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] rob_push_prd,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_prd_we,
   output [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_pfree,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_is_bcc,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_is_brel,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_is_breg,
   output [CONFIG_P_COMMIT_WIDTH:0]    rob_push_size,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_ready,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*9 -1:0] ro_alu_opc_bus,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_bpu_pred_taken,
   output [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_bpu_pred_tgt,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*8-1:0] ro_bru_opc_bus,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_epu_op,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ro_imm,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_lsu_op,
   output [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_fe,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0] ro_pc,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ro_prd,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_prd_we,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ro_prs1,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_prs1_re,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ro_prs2,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_prs2_re,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] ro_rob_id,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] ro_rob_bank,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_valid
);
   localparam  IW                      = (1<<CONFIG_P_ISSUE_WIDTH);
   wire [IW-1:0]                       issue_rs_full;          
   wire [IW-1:0]                       ro_rs_pop;
   wire [IW-1:0]                       rs_push;
   genvar i;
   generate for(i=0;i<IW;i=i+1)
      begin : gen_RS
         wire [((CONFIG_AW-2 ) + 1)-1:0] bpu_upd_bundle;
         assign bpu_upd_bundle = issue_bpu_upd[i * (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) +: ((CONFIG_AW-2 ) + 1)];
         ysyx_210479_issue_rs
            #(
              .CONFIG_DW             (CONFIG_DW),
              .CONFIG_AW             (CONFIG_AW),
              .CONFIG_P_COMMIT_WIDTH (CONFIG_P_COMMIT_WIDTH),
              .CONFIG_P_ROB_DEPTH    (CONFIG_P_ROB_DEPTH),
              .CONFIG_P_RS_DEPTH     (CONFIG_P_RS_DEPTH))
         U_RS
            (
             .issue_rs_full          (issue_rs_full[i]),      
             .ro_valid               (ro_valid[i]),           
             .ro_alu_opc_bus         (ro_alu_opc_bus[i*9  +: 9 ]), 
             .ro_epu_op              (ro_epu_op[i]),          
             .ro_bru_opc_bus         (ro_bru_opc_bus[i*8 +: 8]), 
             .ro_bpu_pred_taken      (ro_bpu_pred_taken[i]),  
             .ro_bpu_pred_tgt        (ro_bpu_pred_tgt[i * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )]), 
             .ro_lsu_op              (ro_lsu_op[i]),          
             .ro_fe                  (ro_fe[i*6 +: 6]), 
             .ro_pc                  (ro_pc[i*(CONFIG_AW-2 ) +: (CONFIG_AW-2 )]), 
             .ro_imm                 (ro_imm[i*CONFIG_DW +: CONFIG_DW]), 
             .ro_prs1                (ro_prs1[i*6 +: 6]), 
             .ro_prs1_re             (ro_prs1_re[i]),         
             .ro_prs2                (ro_prs2[i*6 +: 6]), 
             .ro_prs2_re             (ro_prs2_re[i]),         
             .ro_prd                 (ro_prd[i*6 +: 6]), 
             .ro_prd_we              (ro_prd_we[i]),          
             .ro_rob_id              (ro_rob_id[i*CONFIG_P_ROB_DEPTH +: CONFIG_P_ROB_DEPTH]), 
             .ro_rob_bank            (ro_rob_bank[i*CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH]), 
             .clk                    (clk),
             .rst                    (rst),
             .flush                  (flush),
             .issue_alu_opc_bus      (issue_alu_opc_bus[i*9  +: 9 ]), 
             .issue_epu_op           (|issue_epu_opc_bus[i*2 +: 2]), 
             .issue_bru_opc_bus      (issue_bru_opc_bus[i*8 +: 8]), 
             .issue_lsu_op           (|issue_lsu_opc_bus[i*7 +: 7]), 
             .issue_fe               (issue_fe[i*6 +: 6]), 
             .issue_bpu_pred_taken   (bpu_upd_bundle[0]), 
             .issue_bpu_pred_tgt     (bpu_upd_bundle[(CONFIG_AW-2 ):1]), 
             .issue_pc               (issue_pc[i*(CONFIG_AW-2 ) +: (CONFIG_AW-2 )]), 
             .issue_imm              (issue_imm[i*CONFIG_DW +: CONFIG_DW]), 
             .issue_prs1             (issue_prs1[i*6 +: 6]), 
             .issue_prs1_re          (issue_prs1_re[i]),      
             .issue_prs2             (issue_prs2[i*6 +: 6]), 
             .issue_prs2_re          (issue_prs2_re[i]),      
             .issue_prd              (issue_prd[i*6 +: 6]), 
             .issue_prd_we           (issue_prd_we[i]),       
             .issue_rob_id           (rob_free_id[i*CONFIG_P_ROB_DEPTH +: CONFIG_P_ROB_DEPTH]), 
             .issue_rob_bank         (rob_free_bank[i*CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH]), 
             .issue_push             (rs_push[i]),            
             .busytable              (busytable[(1<<6)-1:0]),
             .ro_rs_pop              (ro_rs_pop[i]));          
      end
   endgenerate
   assign issue_ready = (~issue_rs_full & {IW{rob_ready}});
   assign rs_push = (issue_push & {IW{issue_p_ce}});
   assign rob_push_epu_opc_bus = issue_epu_opc_bus;
   assign rob_push_lsu_opc_bus = issue_lsu_opc_bus;
   assign rob_push_bpu_upd = issue_bpu_upd;
   assign rob_push_pc = issue_pc;
   assign rob_push_lrd = issue_lrd;
   assign rob_push_prd = issue_prd;
   assign rob_push_prd_we = issue_prd_we;
   assign rob_push_pfree = issue_pfree;
   assign rob_push_size = (issue_push_size & {CONFIG_P_ISSUE_WIDTH+1{issue_p_ce}});
   generate for(i=0;i<IW;i=i+1)
      begin : gen_dec_br
         assign rob_push_is_bcc[i] = (issue_bru_opc_bus[i*8 + 0] |
                                       issue_bru_opc_bus[i*8 + 1] |
                                       issue_bru_opc_bus[i*8 + 2] |
                                       issue_bru_opc_bus[i*8 + 3] |
                                       issue_bru_opc_bus[i*8 + 4] |
                                       issue_bru_opc_bus[i*8 + 5]);
         assign rob_push_is_brel[i] = issue_bru_opc_bus[i*8 + 7];
         assign rob_push_is_breg[i] = issue_bru_opc_bus[i*8 + 6];
      end
   endgenerate
   assign ro_rs_pop = (ro_valid & ro_ready);
endmodule
module ysyx_210479_issue_rs
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_P_COMMIT_WIDTH = 0,
   parameter                           CONFIG_P_ROB_DEPTH = 0,
   parameter                           CONFIG_P_RS_DEPTH = 0
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   output                              issue_rs_full,
   input [9 -1:0]          issue_alu_opc_bus,
   input                               issue_epu_op,
   input [8-1:0]          issue_bru_opc_bus,
   input                               issue_lsu_op,
   input [6-1:0]              issue_fe,
   input                               issue_bpu_pred_taken,
   input [(CONFIG_AW-2 )-1:0]                   issue_bpu_pred_tgt,
   input [(CONFIG_AW-2 )-1:0]                   issue_pc,
   input [CONFIG_DW-1:0]               issue_imm,
   input [6-1:0]            issue_prs1,
   input                               issue_prs1_re,
   input [6-1:0]            issue_prs2,
   input                               issue_prs2_re,
   input [6-1:0]            issue_prd,
   input                               issue_prd_we,
   input [CONFIG_P_ROB_DEPTH-1:0]      issue_rob_id,
   input [CONFIG_P_COMMIT_WIDTH-1:0]   issue_rob_bank,
   input                               issue_push,
   input [(1<<6)-1:0]       busytable,
   output                              ro_valid,
   input                               ro_rs_pop,
   output [9 -1:0]         ro_alu_opc_bus,
   output                              ro_epu_op,
   output [8-1:0]         ro_bru_opc_bus,
   output                              ro_bpu_pred_taken,
   output [(CONFIG_AW-2 )-1:0]                  ro_bpu_pred_tgt,
   output                              ro_lsu_op,
   output [6-1:0]             ro_fe,
   output [(CONFIG_AW-2 )-1:0]                  ro_pc,
   output [CONFIG_DW-1:0]              ro_imm,
   output [6-1:0]           ro_prs1,
   output                              ro_prs1_re,
   output [6-1:0]           ro_prs2,
   output                              ro_prs2_re,
   output [6-1:0]           ro_prd,
   output                              ro_prd_we,
   output [CONFIG_P_ROB_DEPTH-1:0]     ro_rob_id,
   output [CONFIG_P_COMMIT_WIDTH-1:0]  ro_rob_bank
);
   localparam RS_DEPTH                 = (1<<CONFIG_P_RS_DEPTH);
   localparam OPP_W                    = (9  +
                                          1 +
                                          8 +
                                          1 +
                                          6 +
                                          1 +
                                          (CONFIG_AW-2 ) +
                                          (CONFIG_AW-2 ) +
                                          CONFIG_DW +
                                          6 +
                                          1 +
                                          CONFIG_P_ROB_DEPTH +
                                          CONFIG_P_COMMIT_WIDTH);
   localparam [RS_DEPTH-1:0] FL_1      = {{RS_DEPTH-1{1'b0}}, 1'b1};
   wire [OPP_W-1:0]                    opp_wdat, opp_rdat;
   wire [RS_DEPTH*6-1:0]    prs1_rf;
   wire [RS_DEPTH*6-1:0]    prs2_rf;
   wire [RS_DEPTH-1:0]                 prs1_re_rf;
   wire [RS_DEPTH-1:0]                 prs2_re_rf;
   wire [6-1:0]             prs1_rf_mux [RS_DEPTH-1:0];
   wire [6-1:0]             prs2_rf_mux [RS_DEPTH-1:0];
   wire [RS_DEPTH-1:0]                 free_vec_ff;
   reg [RS_DEPTH-1:0]                  free_vec_nxt, free_vec_ff_byp;
   wire                                has_free;
   wire [CONFIG_P_RS_DEPTH-1:0]        free_addr;
   wire [RS_DEPTH-1:0]                 rdy_vec;
   wire                                has_rdy, has_rdy_ff;
   wire [CONFIG_P_RS_DEPTH-1:0]        rdy_addr, rdy_addr_ff;
   genvar                              i;
   assign opp_wdat = {
      issue_alu_opc_bus,
      issue_epu_op,
      issue_bru_opc_bus,
      issue_lsu_op,
      issue_fe,
      issue_bpu_pred_taken,
      issue_bpu_pred_tgt,
      issue_pc,
      issue_imm,
      issue_prd,
      issue_prd_we,
      issue_rob_id,
      issue_rob_bank
   };
   ysyx_210479_mRF_nwnr_r
      #(
         .DW   (OPP_W),
         .AW   (CONFIG_P_RS_DEPTH),
         .NUM_READ (1),
         .NUM_WRITE (1)
      )
   U_PAYLOAD
      (
         .CLK     (clk),
         .RST(rst),
         .RE      (has_rdy),
         .RADDR   (rdy_addr),
         .RDATA   (opp_rdat),
         .WE      (issue_push),
         .WADDR   (free_addr),
         .WDATA   (opp_wdat)
      );
   ysyx_210479_mRF_nw_do_r
      #(
         .DW (6),
         .AW (CONFIG_P_RS_DEPTH),
         .NUM_WRITE(1)
      )
   U_RF_RS1
      (
         .CLK     (clk),
         .RST(rst),
         .WE      (issue_push),
         .WADDR   (free_addr),
         .WDATA   (issue_prs1),
         .DO      (prs1_rf)
      );
   ysyx_210479_mRF_nw_do_r
      #(
         .DW (6),
         .AW (CONFIG_P_RS_DEPTH),
         .NUM_WRITE(1)
      )
   U_RF_RS2
      (
         .CLK     (clk),
         .RST(rst),
         .WE      (issue_push),
         .WADDR   (free_addr),
         .WDATA   (issue_prs2),
         .DO      (prs2_rf)
      );
   ysyx_210479_mRF_nw_do_r
      #(
         .DW (1),
         .AW (CONFIG_P_RS_DEPTH),
         .NUM_WRITE(1)
      )
   U_RF_RS1_RE
      (
         .CLK     (clk),
         .RST(rst),
         .WE      (issue_push),
         .WADDR   (free_addr),
         .WDATA   (issue_prs1_re),
         .DO      (prs1_re_rf)
      );
   ysyx_210479_mRF_nw_do_r
      #(
         .DW (1),
         .AW (CONFIG_P_RS_DEPTH),
         .NUM_WRITE(1)
      )
   U_RF_RS2_RE
      (
         .CLK     (clk),
         .RST(rst),
         .WE      (issue_push),
         .WADDR   (free_addr),
         .WDATA   (issue_prs2_re),
         .DO      (prs2_re_rf)
      );
   always @(*)
      begin
         free_vec_nxt = free_vec_ff;
         if (issue_push)
            free_vec_nxt = free_vec_nxt & ~(FL_1<<free_addr);
         if (ro_rs_pop)
            free_vec_nxt = free_vec_nxt | (FL_1<<rdy_addr_ff);
         if (flush)
            free_vec_nxt = {RS_DEPTH{1'b1}};
      end
   always @(*)
      begin
         free_vec_ff_byp = free_vec_ff;
         if (ro_rs_pop)
               free_vec_ff_byp = free_vec_ff_byp | (FL_1<<rdy_addr_ff);
      end
   ysyx_210479_mDFF_r #(.DW(RS_DEPTH), .RST_VECTOR({RS_DEPTH{1'b1}})) ff_free_vec (.CLK(clk), .RST(rst), .D(free_vec_nxt), .Q(free_vec_ff) );
   ysyx_210479_priority_encoder_gs #(.P_DW(CONFIG_P_RS_DEPTH)) penc_free (.din(free_vec_ff), .dout (free_addr), .gs(has_free) );
   assign issue_rs_full = ~has_free;
   generate for(i=0;i<RS_DEPTH;i=i+1)
      begin : gen_mux
         assign prs1_rf_mux[i] = prs1_rf[i * 6 +: 6];
         assign prs2_rf_mux[i] = prs2_rf[i * 6 +: 6];
      end
   endgenerate
   generate for(i=0;i<RS_DEPTH;i=i+1)
      begin : gen_rdy_vec
         assign rdy_vec[i] = ~free_vec_ff_byp[i] &
                              (~prs1_re_rf[i] | ~busytable[prs1_rf_mux[i]]) &
                              (~prs2_re_rf[i] | ~busytable[prs2_rf_mux[i]]);
      end
   endgenerate
   ysyx_210479_priority_encoder_gs #(.P_DW(CONFIG_P_RS_DEPTH)) penc_rdy (.din(rdy_vec), .dout(rdy_addr), .gs(has_rdy) );
   ysyx_210479_mDFF_r #(.DW(1)) ff_has_rdy (.CLK(clk), .RST(rst), .D(has_rdy & ~flush), .Q(has_rdy_ff) );
   ysyx_210479_mDFF_lr #(.DW(CONFIG_P_RS_DEPTH)) ff_rdy_addr (.CLK(clk),.RST(rst), .LOAD(has_rdy), .D(rdy_addr), .Q(rdy_addr_ff) );
   ysyx_210479_mDFF_lr #(.DW(6)) ff_issue_prs1 (.CLK(clk),.RST(rst), .LOAD(has_rdy), .D(prs1_rf_mux[rdy_addr]), .Q(ro_prs1) );
   ysyx_210479_mDFF_lr #(.DW(6)) ff_issue_prs2 (.CLK(clk),.RST(rst), .LOAD(has_rdy), .D(prs2_rf_mux[rdy_addr]), .Q(ro_prs2) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_issue_prs1_re (.CLK(clk),.RST(rst), .LOAD(has_rdy), .D(prs1_re_rf[rdy_addr]), .Q(ro_prs1_re) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_issue_prs2_re (.CLK(clk),.RST(rst), .LOAD(has_rdy), .D(prs2_re_rf[rdy_addr]), .Q(ro_prs2_re) );
   assign ro_valid = has_rdy_ff;
   assign {
      ro_alu_opc_bus,
      ro_epu_op,
      ro_bru_opc_bus,
      ro_lsu_op,
      ro_fe,
      ro_bpu_pred_taken,
      ro_bpu_pred_tgt,
      ro_pc,
      ro_imm,
      ro_prd,
      ro_prd_we,
      ro_rob_id,
      ro_rob_bank
   } = opp_rdat;
endmodule
module ysyx_210479_ncpu64k
#(
   parameter                           CONFIG_AW = 32,
   parameter                           CONFIG_DW = 32,
   parameter                           CONFIG_P_DW = 5,
   parameter                           CONFIG_P_FETCH_WIDTH = 1,
   parameter                           CONFIG_P_ISSUE_WIDTH = 1,
   parameter                           CONFIG_P_PAGE_SIZE = 13,
   parameter                           CONFIG_IC_P_LINE = 6,
   parameter                           CONFIG_IC_P_SETS = 6,
   parameter                           CONFIG_IC_P_WAYS = 2,
   parameter                           CONFIG_DC_P_LINE = 6,
   parameter                           CONFIG_DC_P_SETS = 6,
   parameter                           CONFIG_DC_P_WAYS = 2,
   parameter                           CONFIG_PHT_P_NUM = 9,
   parameter                           CONFIG_BTB_P_NUM = 9,
   parameter                           CONFIG_P_IQ_DEPTH = 4,
   parameter                           CONFIG_ENABLE_ASR = 0,
   parameter                           CONFIG_IMMU_ENABLE_UNCACHED_SEG = 0,
   parameter                           CONFIG_DMMU_ENABLE_UNCACHED_SEG = 0,
   parameter                           CONFIG_DTLB_P_SETS = 7,
   parameter                           CONFIG_ITLB_P_SETS = 7,
   parameter [CONFIG_AW-1:0]           CONFIG_PC_RST = 0,
   parameter [8-1:0]        CONFIG_EITM_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EIPF_VECTOR = 0,
   parameter [8-1:0]        CONFIG_ESYSCALL_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EINSN_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EIRQ_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EDTM_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EDPF_VECTOR = 0,
   parameter [8-1:0]        CONFIG_EALIGN_VECTOR = 0,
   parameter                           CONFIG_NUM_IRQ = 32,
   parameter                           CONFIG_P_RS_DEPTH = 2,
   parameter                           CONFIG_P_ROB_DEPTH = 3,
   parameter                           AXI_P_DW_BYTES    = 3,
   parameter                           AXI_UNCACHED_P_DW_BYTES = 2,
   parameter                           AXI_ADDR_WIDTH    = 64,
   parameter                           AXI_ID_WIDTH      = 4,
   parameter                           AXI_USER_WIDTH    = 1
)
(
   input                               clk,
   input                               rst,
   input                               ibus_ARREADY,
   output                              ibus_ARVALID,
   output [AXI_ADDR_WIDTH-1:0]         ibus_ARADDR,
   output [2:0]                        ibus_ARPROT,
   output [AXI_ID_WIDTH-1:0]           ibus_ARID,
   output [AXI_USER_WIDTH-1:0]         ibus_ARUSER,
   output [7:0]                        ibus_ARLEN,
   output [2:0]                        ibus_ARSIZE,
   output [1:0]                        ibus_ARBURST,
   output                              ibus_ARLOCK,
   output [3:0]                        ibus_ARCACHE,
   output [3:0]                        ibus_ARQOS,
   output [3:0]                        ibus_ARREGION,
   output                              ibus_RREADY,
   input                               ibus_RVALID,
   input  [(1<<AXI_P_DW_BYTES)*8-1:0]  ibus_RDATA,
   input                               ibus_RLAST,
   input  [1:0]                        ibus_RRESP,
   input  [AXI_ID_WIDTH-1:0]           ibus_RID,
   input  [AXI_USER_WIDTH-1:0]         ibus_RUSER,
   input                               dbus_ARREADY,
   output                              dbus_ARVALID,
   output [AXI_ADDR_WIDTH-1:0]         dbus_ARADDR,
   output [2:0]                        dbus_ARPROT,
   output [AXI_ID_WIDTH-1:0]           dbus_ARID,
   output [AXI_USER_WIDTH-1:0]         dbus_ARUSER,
   output [7:0]                        dbus_ARLEN,
   output [2:0]                        dbus_ARSIZE,
   output [1:0]                        dbus_ARBURST,
   output                              dbus_ARLOCK,
   output [3:0]                        dbus_ARCACHE,
   output [3:0]                        dbus_ARQOS,
   output [3:0]                        dbus_ARREGION,
   output                              dbus_RREADY,
   input                               dbus_RVALID,
   input  [(1<<AXI_P_DW_BYTES)*8-1:0]  dbus_RDATA,
   input  [1:0]                        dbus_RRESP,
   input                               dbus_RLAST,
   input  [AXI_ID_WIDTH-1:0]           dbus_RID,
   input  [AXI_USER_WIDTH-1:0]         dbus_RUSER,
   input                               dbus_AWREADY,
   output                              dbus_AWVALID,
   output [AXI_ADDR_WIDTH-1:0]         dbus_AWADDR,
   output [2:0]                        dbus_AWPROT,
   output [AXI_ID_WIDTH-1:0]           dbus_AWID,
   output [AXI_USER_WIDTH-1:0]         dbus_AWUSER,
   output [7:0]                        dbus_AWLEN,
   output [2:0]                        dbus_AWSIZE,
   output [1:0]                        dbus_AWBURST,
   output                              dbus_AWLOCK,
   output [3:0]                        dbus_AWCACHE,
   output [3:0]                        dbus_AWQOS,
   output [3:0]                        dbus_AWREGION,
   input                               dbus_WREADY,
   output                              dbus_WVALID,
   output [(1<<AXI_P_DW_BYTES)*8-1:0]  dbus_WDATA,
   output [(1<<AXI_P_DW_BYTES)-1:0]    dbus_WSTRB,
   output                              dbus_WLAST,
   output [AXI_USER_WIDTH-1:0]         dbus_WUSER,
   output                              dbus_BREADY,
   input                               dbus_BVALID,
   input [1:0]                         dbus_BRESP,
   input [AXI_ID_WIDTH-1:0]            dbus_BID,
   input [AXI_USER_WIDTH-1:0]          dbus_BUSER,
   input [CONFIG_NUM_IRQ-1:0]          irqs,
   output                              tsc_irq
);
   localparam                          CONFIG_P_WRITEBACK_WIDTH = CONFIG_P_ISSUE_WIDTH;
   localparam                          CONFIG_P_COMMIT_WIDTH = CONFIG_P_ISSUE_WIDTH;
   wire                 bpu_wb;                 
   wire                 bpu_wb_is_bcc;          
   wire                 bpu_wb_is_breg;         
   wire                 bpu_wb_is_brel;         
   wire [(CONFIG_AW-2 )-1:0]     bpu_wb_npc_act;         
   wire [(CONFIG_AW-2 )-1:CONFIG_BTB_P_NUM] bpu_wb_pc;   
   wire                 bpu_wb_taken;           
   wire [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:((CONFIG_AW-2 ) + 1)] bpu_wb_upd_partial;
   wire [(1<<6)-1:0] busytable;      
   wire [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_bpu_upd;
   wire [2*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_epu_opc_bus;
   wire [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_exc;
   wire [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_fire;
   wire [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_fls;
   wire [(CONFIG_AW-2 )*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_fls_tgt;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] cmt_is_bcc;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] cmt_is_breg;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] cmt_is_brel;
   wire [5*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_lrd;
   wire [7*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_lsu_opc_bus;
   wire [CONFIG_DW*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_opera;
   wire [CONFIG_DW*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_operb;
   wire [(CONFIG_AW-2 )*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_pc;
   wire [6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_pfree;
   wire [CONFIG_P_COMMIT_WIDTH:0] cmt_pop_size; 
   wire [6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_prd;
   wire [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_prd_we;
   wire [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_valid;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*9 -1:0] ex_alu_opc_bus;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_bpu_pred_taken;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0] ex_bpu_pred_tgt;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*8-1:0] ex_bru_opc_bus;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_epu_op;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ex_fe;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ex_imm;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_lsu_op;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ex_operand1;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ex_operand2;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0] ex_pc;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ex_prd;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_prd_we;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_ready;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] ex_rob_bank;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] ex_rob_id;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_valid;
   wire [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_bpu_upd;
   wire [2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_exc;
   wire [((2 <<1)*8)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_ins;
   wire [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_pc;
   wire [CONFIG_P_ISSUE_WIDTH:0] id_pop_cnt;    
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_valid;
   wire                 irq_async;              
   wire [9 *(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_alu_opc_bus;
   wire [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_bpu_upd;
   wire [8*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_bru_opc_bus;
   wire [2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_epu_opc_bus;
   wire [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_fe;
   wire [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_imm;
   wire [5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_lrd;
   wire [7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_lsu_opc_bus;
   wire                 issue_p_ce;             
   wire [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_pc;
   wire [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_pfree;
   wire [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prd;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prd_we;
   wire [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs1;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs1_re;
   wire [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs2;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs2_re;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_push;
   wire [CONFIG_P_ISSUE_WIDTH:0] issue_push_size;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_ready;
   wire [CONFIG_DW-1:0] msr_icid;               
   wire [CONFIG_IC_P_SETS-1:0] msr_icinv_line_nxt;
   wire                 msr_icinv_ready;        
   wire                 msr_icinv_we;           
   wire [CONFIG_ITLB_P_SETS-1:0] msr_imm_tlbh_idx;
   wire [CONFIG_DW-1:0] msr_imm_tlbh_nxt;       
   wire                 msr_imm_tlbh_we;        
   wire [CONFIG_ITLB_P_SETS-1:0] msr_imm_tlbl_idx;
   wire [CONFIG_DW-1:0] msr_imm_tlbl_nxt;       
   wire                 msr_imm_tlbl_we;        
   wire [CONFIG_DW-1:0] msr_immid;              
   wire                 msr_psr_ice;            
   wire                 msr_psr_imme;           
   wire                 msr_psr_rm;             
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*2*6-1:0] prf_RADDR;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*2*CONFIG_DW-1:0] prf_RDATA;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*2-1:0] prf_RE;
   wire [6*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WADDR;
   wire [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] prf_WADDR_ex;
   wire [6-1:0] prf_WADDR_lsu_epu;   
   wire [CONFIG_DW*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WDATA;
   wire [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] prf_WDATA_ex;
   wire [CONFIG_DW-1:0] prf_WDATA_lsu_epu;      
   wire [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WE;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] prf_WE_ex;
   wire                 prf_WE_lsu_epu;         
   wire [9 *(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_alu_opc_bus;
   wire [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_bpu_upd;
   wire [8*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_bru_opc_bus;
   wire [2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_epu_opc_bus;
   wire [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_fe;
   wire [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_imm;
   wire [5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrd;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrd_we;
   wire [5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrs1;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrs1_re;
   wire [5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrs2;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrs2_re;
   wire [7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lsu_opc_bus;
   wire [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_pc;
   wire [CONFIG_P_ISSUE_WIDTH:0] rn_push_size;  
   wire                 rn_stall_req;           
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_valid;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*9 -1:0] ro_alu_opc_bus;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_bpu_pred_taken;
   wire [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_bpu_pred_tgt;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*8-1:0] ro_bru_opc_bus;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_epu_op;
   wire [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_fe;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ro_imm;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_lsu_op;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0] ro_pc;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ro_prd;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_prd_we;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ro_prs1;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_prs1_re;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ro_prs2;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_prs2_re;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_ready;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] ro_rob_bank;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] ro_rob_id;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_valid;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] rob_free_bank;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] rob_free_id;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:0] rob_push_bpu_upd;
   wire [2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_epu_opc_bus;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_is_bcc;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_is_breg;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_is_brel;
   wire [5*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] rob_push_lrd;
   wire [7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_lsu_opc_bus;
   wire [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_pc;
   wire [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_pfree;
   wire [6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] rob_push_prd;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_prd_we;
   wire [CONFIG_P_COMMIT_WIDTH:0] rob_push_size;
   wire                 rob_ready;              
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_exc; 
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_fls; 
   wire [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_fls_tgt;
   wire [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_opera;
   wire [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_operb;
   wire [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] wb_ready;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] wb_rob_bank;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] wb_rob_id;
   wire [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] wb_rob_ready;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] wb_valid;
   wire                                flush;                  
   wire [(CONFIG_AW-2 )-1:0]                    flush_tgt;             
   ysyx_210479_frontend
      #(
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_P_FETCH_WIDTH           (CONFIG_P_FETCH_WIDTH),
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_IQ_DEPTH              (CONFIG_P_IQ_DEPTH),
        .CONFIG_P_PAGE_SIZE             (CONFIG_P_PAGE_SIZE),
        .CONFIG_ITLB_P_SETS             (CONFIG_ITLB_P_SETS),
        .CONFIG_IC_P_LINE               (CONFIG_IC_P_LINE),
        .CONFIG_IC_P_SETS               (CONFIG_IC_P_SETS),
        .CONFIG_IC_P_WAYS               (CONFIG_IC_P_WAYS),
        .CONFIG_PHT_P_NUM               (CONFIG_PHT_P_NUM),
        .CONFIG_BTB_P_NUM               (CONFIG_BTB_P_NUM),
        .CONFIG_PC_RST                  (CONFIG_PC_RST[CONFIG_AW-1:0]),
        .CONFIG_IMMU_ENABLE_UNCACHED_SEG(CONFIG_IMMU_ENABLE_UNCACHED_SEG),
        .AXI_P_DW_BYTES                 (AXI_P_DW_BYTES),
        .AXI_UNCACHED_P_DW_BYTES        (AXI_UNCACHED_P_DW_BYTES),
        .AXI_ADDR_WIDTH                 (AXI_ADDR_WIDTH),
        .AXI_ID_WIDTH                   (AXI_ID_WIDTH),
        .AXI_USER_WIDTH                 (AXI_USER_WIDTH))
   U_FNT
      (
       .id_valid                        (id_valid[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_ins                          (id_ins[((2 <<1)*8)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_pc                           (id_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_exc                          (id_exc[2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_bpu_upd                      (id_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .msr_immid                       (msr_immid[CONFIG_DW-1:0]),
       .msr_icid                        (msr_icid[CONFIG_DW-1:0]),
       .msr_icinv_ready                 (msr_icinv_ready),
       .ibus_ARVALID                    (ibus_ARVALID),
       .ibus_ARADDR                     (ibus_ARADDR[AXI_ADDR_WIDTH-1:0]),
       .ibus_ARPROT                     (ibus_ARPROT[2:0]),
       .ibus_ARID                       (ibus_ARID[AXI_ID_WIDTH-1:0]),
       .ibus_ARUSER                     (ibus_ARUSER[AXI_USER_WIDTH-1:0]),
       .ibus_ARLEN                      (ibus_ARLEN[7:0]),
       .ibus_ARSIZE                     (ibus_ARSIZE[2:0]),
       .ibus_ARBURST                    (ibus_ARBURST[1:0]),
       .ibus_ARLOCK                     (ibus_ARLOCK),
       .ibus_ARCACHE                    (ibus_ARCACHE[3:0]),
       .ibus_ARQOS                      (ibus_ARQOS[3:0]),
       .ibus_ARREGION                   (ibus_ARREGION[3:0]),
       .ibus_RREADY                     (ibus_RREADY),
       .clk                             (clk),
       .rst                             (rst),
       .flush                           (flush),
       .flush_tgt                       (flush_tgt[(CONFIG_AW-2 )-1:0]),
       .id_pop_cnt                      (id_pop_cnt[CONFIG_P_ISSUE_WIDTH:0]),
       .bpu_wb                          (bpu_wb),
       .bpu_wb_is_bcc                   (bpu_wb_is_bcc),
       .bpu_wb_is_breg                  (bpu_wb_is_breg),
       .bpu_wb_is_brel                  (bpu_wb_is_brel),
       .bpu_wb_taken                    (bpu_wb_taken),
       .bpu_wb_pc                       (bpu_wb_pc[(CONFIG_AW-2 )-1:CONFIG_BTB_P_NUM]),
       .bpu_wb_npc_act                  (bpu_wb_npc_act[(CONFIG_AW-2 )-1:0]),
       .bpu_wb_upd_partial              (bpu_wb_upd_partial[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:((CONFIG_AW-2 ) + 1)]),
       .msr_psr_imme                    (msr_psr_imme),
       .msr_psr_rm                      (msr_psr_rm),
       .msr_psr_ice                     (msr_psr_ice),
       .msr_imm_tlbl_idx                (msr_imm_tlbl_idx[CONFIG_ITLB_P_SETS-1:0]),
       .msr_imm_tlbl_nxt                (msr_imm_tlbl_nxt[CONFIG_DW-1:0]),
       .msr_imm_tlbl_we                 (msr_imm_tlbl_we),
       .msr_imm_tlbh_idx                (msr_imm_tlbh_idx[CONFIG_ITLB_P_SETS-1:0]),
       .msr_imm_tlbh_nxt                (msr_imm_tlbh_nxt[CONFIG_DW-1:0]),
       .msr_imm_tlbh_we                 (msr_imm_tlbh_we),
       .msr_icinv_line_nxt              (msr_icinv_line_nxt[CONFIG_IC_P_SETS-1:0]),
       .msr_icinv_we                    (msr_icinv_we),
       .ibus_ARREADY                    (ibus_ARREADY),
       .ibus_RVALID                     (ibus_RVALID),
       .ibus_RDATA                      (ibus_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .ibus_RRESP                      (ibus_RRESP[1:0]),
       .ibus_RLAST                      (ibus_RLAST),
       .ibus_RID                        (ibus_RID[AXI_ID_WIDTH-1:0]),
       .ibus_RUSER                      (ibus_RUSER[AXI_USER_WIDTH-1:0]));
   ysyx_210479_id
      #(
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_PHT_P_NUM               (CONFIG_PHT_P_NUM),
        .CONFIG_BTB_P_NUM               (CONFIG_BTB_P_NUM),
        .CONFIG_ENABLE_ASR              (CONFIG_ENABLE_ASR))
   U_ID
      (
       .id_pop_cnt                      (id_pop_cnt[CONFIG_P_ISSUE_WIDTH:0]),
       .rn_valid                        (rn_valid[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_alu_opc_bus                  (rn_alu_opc_bus[9 *(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_epu_opc_bus                  (rn_epu_opc_bus[2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_bru_opc_bus                  (rn_bru_opc_bus[8*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_lsu_opc_bus                  (rn_lsu_opc_bus[7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_fe                           (rn_fe[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_bpu_upd                      (rn_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_pc                           (rn_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_imm                          (rn_imm[CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_lrs1                         (rn_lrs1[5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_lrs2                         (rn_lrs2[5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_lrs1_re                      (rn_lrs1_re[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_lrs2_re                      (rn_lrs2_re[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_lrd                          (rn_lrd[5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_lrd_we                       (rn_lrd_we[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_push_size                    (rn_push_size[CONFIG_P_ISSUE_WIDTH:0]),
       .clk                             (clk),
       .rst                             (rst),
       .flush                           (flush),
       .rn_stall_req                    (rn_stall_req),
       .id_valid                        (id_valid[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_ins                          (id_ins[((2 <<1)*8)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_pc                           (id_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_exc                          (id_exc[2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .id_bpu_upd                      (id_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .irq_async                       (irq_async));
   ysyx_210479_rn
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_PHT_P_NUM               (CONFIG_PHT_P_NUM),
        .CONFIG_BTB_P_NUM               (CONFIG_BTB_P_NUM),
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_COMMIT_WIDTH          (CONFIG_P_COMMIT_WIDTH),
        .CONFIG_P_WRITEBACK_WIDTH       (CONFIG_P_WRITEBACK_WIDTH))
   U_RN
      (
       .rn_stall_req                    (rn_stall_req),
       .issue_p_ce                      (issue_p_ce),
       .issue_alu_opc_bus               (issue_alu_opc_bus[9 *(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_epu_opc_bus               (issue_epu_opc_bus[2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_bru_opc_bus               (issue_bru_opc_bus[8*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_lsu_opc_bus               (issue_lsu_opc_bus[7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_fe                        (issue_fe[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_bpu_upd                   (issue_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_pc                        (issue_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_imm                       (issue_imm[CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prs1                      (issue_prs1[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prs1_re                   (issue_prs1_re[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prs2                      (issue_prs2[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prs2_re                   (issue_prs2_re[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_lrd                       (issue_lrd[5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prd                       (issue_prd[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prd_we                    (issue_prd_we[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_pfree                     (issue_pfree[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_push                      (issue_push[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_push_size                 (issue_push_size[CONFIG_P_ISSUE_WIDTH:0]),
       .busytable                       (busytable[(1<<6)-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .flush                           (flush),
       .rn_valid                        (rn_valid[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_alu_opc_bus                  (rn_alu_opc_bus[9 *(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_epu_opc_bus                  (rn_epu_opc_bus[2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_bru_opc_bus                  (rn_bru_opc_bus[8*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_lsu_opc_bus                  (rn_lsu_opc_bus[7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_fe                           (rn_fe[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_bpu_upd                      (rn_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_pc                           (rn_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_imm                          (rn_imm[CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_lrs1                         (rn_lrs1[(1<<CONFIG_P_COMMIT_WIDTH)*5-1:0]),
       .rn_lrs1_re                      (rn_lrs1_re[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .rn_lrs2                         (rn_lrs2[(1<<CONFIG_P_COMMIT_WIDTH)*5-1:0]),
       .rn_lrs2_re                      (rn_lrs2_re[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .rn_lrd                          (rn_lrd[5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_lrd_we                       (rn_lrd_we[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rn_push_size                    (rn_push_size[CONFIG_P_ISSUE_WIDTH:0]),
       .cmt_fire                        (cmt_fire[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_lrd                         (cmt_lrd[(1<<CONFIG_P_COMMIT_WIDTH)*5-1:0]),
       .cmt_pfree                       (cmt_pfree[(1<<CONFIG_P_COMMIT_WIDTH)*6-1:0]),
       .cmt_prd                         (cmt_prd[(1<<CONFIG_P_COMMIT_WIDTH)*6-1:0]),
       .cmt_prd_we                      (cmt_prd_we[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .prf_WADDR                       (prf_WADDR[(1<<CONFIG_P_WRITEBACK_WIDTH)*6-1:0]),
       .prf_WE                          (prf_WE[(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .issue_ready                     (issue_ready[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]));
   ysyx_210479_issue
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_COMMIT_WIDTH          (CONFIG_P_COMMIT_WIDTH),
        .CONFIG_P_ROB_DEPTH             (CONFIG_P_ROB_DEPTH),
        .CONFIG_P_RS_DEPTH              (CONFIG_P_RS_DEPTH),
        .CONFIG_PHT_P_NUM               (CONFIG_PHT_P_NUM),
        .CONFIG_BTB_P_NUM               (CONFIG_BTB_P_NUM))
   U_ISSUE
      (
       .issue_ready                     (issue_ready[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_epu_opc_bus            (rob_push_epu_opc_bus[2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_lsu_opc_bus            (rob_push_lsu_opc_bus[7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_bpu_upd                (rob_push_bpu_upd[(1<<CONFIG_P_ISSUE_WIDTH)*(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:0]),
       .rob_push_pc                     (rob_push_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_lrd                    (rob_push_lrd[5*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .rob_push_prd                    (rob_push_prd[6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .rob_push_prd_we                 (rob_push_prd_we[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_pfree                  (rob_push_pfree[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_is_bcc                 (rob_push_is_bcc[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_is_brel                (rob_push_is_brel[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_is_breg                (rob_push_is_breg[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_size                   (rob_push_size[CONFIG_P_COMMIT_WIDTH:0]),
       .ro_alu_opc_bus                  (ro_alu_opc_bus[(1<<CONFIG_P_ISSUE_WIDTH)*9 -1:0]),
       .ro_bpu_pred_taken               (ro_bpu_pred_taken[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_bpu_pred_tgt                 (ro_bpu_pred_tgt[(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_bru_opc_bus                  (ro_bru_opc_bus[(1<<CONFIG_P_ISSUE_WIDTH)*8-1:0]),
       .ro_epu_op                       (ro_epu_op[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_imm                          (ro_imm[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0]),
       .ro_lsu_op                       (ro_lsu_op[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_fe                           (ro_fe[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_pc                           (ro_pc[(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0]),
       .ro_prd                          (ro_prd[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .ro_prd_we                       (ro_prd_we[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_prs1                         (ro_prs1[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .ro_prs1_re                      (ro_prs1_re[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_prs2                         (ro_prs2[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .ro_prs2_re                      (ro_prs2_re[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_rob_id                       (ro_rob_id[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0]),
       .ro_rob_bank                     (ro_rob_bank[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0]),
       .ro_valid                        (ro_valid[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .flush                           (flush),
       .issue_p_ce                      (issue_p_ce),
       .issue_alu_opc_bus               (issue_alu_opc_bus[9 *(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_epu_opc_bus               (issue_epu_opc_bus[2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_bru_opc_bus               (issue_bru_opc_bus[8*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_lsu_opc_bus               (issue_lsu_opc_bus[7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_fe                        (issue_fe[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_bpu_upd                   (issue_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_pc                        (issue_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_imm                       (issue_imm[CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prs1                      (issue_prs1[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prs1_re                   (issue_prs1_re[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prs2                      (issue_prs2[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prs2_re                   (issue_prs2_re[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_lrd                       (issue_lrd[5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prd                       (issue_prd[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_prd_we                    (issue_prd_we[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_pfree                     (issue_pfree[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_push                      (issue_push[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .issue_push_size                 (issue_push_size[CONFIG_P_ISSUE_WIDTH:0]),
       .busytable                       (busytable[(1<<6)-1:0]),
       .rob_ready                       (rob_ready),
       .rob_free_id                     (rob_free_id[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0]),
       .rob_free_bank                   (rob_free_bank[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0]),
       .ro_ready                        (ro_ready[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]));
   ysyx_210479_ro
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_COMMIT_WIDTH          (CONFIG_P_COMMIT_WIDTH),
        .CONFIG_P_ROB_DEPTH             (CONFIG_P_ROB_DEPTH))
   U_RO
      (
       .ro_ready                        (ro_ready[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .prf_RE                          (prf_RE[(1<<CONFIG_P_ISSUE_WIDTH)*2-1:0]),
       .prf_RADDR                       (prf_RADDR[(1<<CONFIG_P_ISSUE_WIDTH)*2*6-1:0]),
       .ex_alu_opc_bus                  (ex_alu_opc_bus[(1<<CONFIG_P_ISSUE_WIDTH)*9 -1:0]),
       .ex_bpu_pred_taken               (ex_bpu_pred_taken[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ex_bpu_pred_tgt                 (ex_bpu_pred_tgt[(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0]),
       .ex_bru_opc_bus                  (ex_bru_opc_bus[(1<<CONFIG_P_ISSUE_WIDTH)*8-1:0]),
       .ex_epu_op                       (ex_epu_op[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ex_imm                          (ex_imm[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0]),
       .ex_lsu_op                       (ex_lsu_op[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ex_fe                           (ex_fe[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .ex_pc                           (ex_pc[(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0]),
       .ex_prd                          (ex_prd[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .ex_prd_we                       (ex_prd_we[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ex_operand1                     (ex_operand1[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0]),
       .ex_operand2                     (ex_operand2[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0]),
       .ex_rob_id                       (ex_rob_id[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0]),
       .ex_rob_bank                     (ex_rob_bank[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0]),
       .ex_valid                        (ex_valid[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .flush                           (flush),
       .ro_alu_opc_bus                  (ro_alu_opc_bus[(1<<CONFIG_P_ISSUE_WIDTH)*9 -1:0]),
       .ro_bpu_pred_taken               (ro_bpu_pred_taken[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_bpu_pred_tgt                 (ro_bpu_pred_tgt[(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0]),
       .ro_bru_opc_bus                  (ro_bru_opc_bus[(1<<CONFIG_P_ISSUE_WIDTH)*8-1:0]),
       .ro_epu_op                       (ro_epu_op[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_imm                          (ro_imm[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0]),
       .ro_lsu_op                       (ro_lsu_op[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_fe                           (ro_fe[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .ro_pc                           (ro_pc[(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0]),
       .ro_prd                          (ro_prd[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .ro_prd_we                       (ro_prd_we[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_prs1                         (ro_prs1[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .ro_prs1_re                      (ro_prs1_re[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_prs2                         (ro_prs2[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .ro_prs2_re                      (ro_prs2_re[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ro_rob_id                       (ro_rob_id[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0]),
       .ro_rob_bank                     (ro_rob_bank[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0]),
       .ro_valid                        (ro_valid[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .prf_RDATA                       (prf_RDATA[(1<<CONFIG_P_ISSUE_WIDTH)*2*CONFIG_DW-1:0]),
       .ex_ready                        (ex_ready[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]));
   ysyx_210479_ex
      #(
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_COMMIT_WIDTH          (CONFIG_P_COMMIT_WIDTH),
        .CONFIG_P_ROB_DEPTH             (CONFIG_P_ROB_DEPTH),
        .CONFIG_ENABLE_ASR              (CONFIG_ENABLE_ASR))
   U_EX
      (
       .ex_ready                        (ex_ready[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .wb_valid                        (wb_valid[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .wb_rob_id                       (wb_rob_id[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0]),
       .wb_rob_bank                     (wb_rob_bank[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0]),
       .wb_fls                          (wb_fls[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .wb_exc                          (wb_exc[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .wb_opera                        (wb_opera[CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .wb_operb                        (wb_operb[CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .wb_fls_tgt                      (wb_fls_tgt[(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .prf_WADDR_ex                    (prf_WADDR_ex[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .prf_WDATA_ex                    (prf_WDATA_ex[CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .prf_WE_ex                       (prf_WE_ex[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .flush                           (flush),
       .ex_alu_opc_bus                  (ex_alu_opc_bus[(1<<CONFIG_P_ISSUE_WIDTH)*9 -1:0]),
       .ex_bpu_pred_taken               (ex_bpu_pred_taken[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ex_bpu_pred_tgt                 (ex_bpu_pred_tgt[(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0]),
       .ex_bru_opc_bus                  (ex_bru_opc_bus[(1<<CONFIG_P_ISSUE_WIDTH)*8-1:0]),
       .ex_epu_op                       (ex_epu_op[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ex_imm                          (ex_imm[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0]),
       .ex_lsu_op                       (ex_lsu_op[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ex_fe                           (ex_fe[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .ex_pc                           (ex_pc[(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0]),
       .ex_prd                          (ex_prd[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .ex_prd_we                       (ex_prd_we[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .ex_operand1                     (ex_operand1[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0]),
       .ex_operand2                     (ex_operand2[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0]),
       .ex_rob_id                       (ex_rob_id[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0]),
       .ex_rob_bank                     (ex_rob_bank[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0]),
       .ex_valid                        (ex_valid[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .wb_ready                        (wb_ready[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]));
   ysyx_210479_wb_mux
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_P_WRITEBACK_WIDTH       (CONFIG_P_WRITEBACK_WIDTH))
   U_WB_MUX
      (
       .wb_ready                        (wb_ready[(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .prf_WE                          (prf_WE[(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .prf_WADDR                       (prf_WADDR[6*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .prf_WDATA                       (prf_WDATA[CONFIG_DW*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .prf_WE_ex                       (prf_WE_ex[(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .prf_WADDR_ex                    (prf_WADDR_ex[6*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .prf_WDATA_ex                    (prf_WDATA_ex[CONFIG_DW*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .prf_WE_lsu_epu                  (prf_WE_lsu_epu),
       .prf_WADDR_lsu_epu               (prf_WADDR_lsu_epu[6-1:0]),
       .prf_WDATA_lsu_epu               (prf_WDATA_lsu_epu[CONFIG_DW-1:0]),
       .wb_rob_ready                    (wb_rob_ready[(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]));
   ysyx_210479_cmt
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_P_DW                    (CONFIG_P_DW),
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_COMMIT_WIDTH          (CONFIG_P_COMMIT_WIDTH),
        .CONFIG_PHT_P_NUM               (CONFIG_PHT_P_NUM),
        .CONFIG_BTB_P_NUM               (CONFIG_BTB_P_NUM),
        .CONFIG_NUM_IRQ                 (CONFIG_NUM_IRQ),
        .CONFIG_DC_P_WAYS               (CONFIG_DC_P_WAYS),
        .CONFIG_DC_P_SETS               (CONFIG_DC_P_SETS),
        .CONFIG_DC_P_LINE               (CONFIG_DC_P_LINE),
        .CONFIG_IC_P_SETS               (CONFIG_IC_P_SETS),
        .CONFIG_IC_P_LINE               (CONFIG_IC_P_LINE),
        .CONFIG_P_PAGE_SIZE             (CONFIG_P_PAGE_SIZE),
        .CONFIG_DMMU_ENABLE_UNCACHED_SEG(CONFIG_DMMU_ENABLE_UNCACHED_SEG),
        .CONFIG_ITLB_P_SETS             (CONFIG_ITLB_P_SETS),
        .CONFIG_DTLB_P_SETS             (CONFIG_DTLB_P_SETS),
        .CONFIG_EITM_VECTOR             (CONFIG_EITM_VECTOR[8-1:0]),
        .CONFIG_EIPF_VECTOR             (CONFIG_EIPF_VECTOR[8-1:0]),
        .CONFIG_ESYSCALL_VECTOR         (CONFIG_ESYSCALL_VECTOR[8-1:0]),
        .CONFIG_EINSN_VECTOR            (CONFIG_EINSN_VECTOR[8-1:0]),
        .CONFIG_EIRQ_VECTOR             (CONFIG_EIRQ_VECTOR[8-1:0]),
        .CONFIG_EDTM_VECTOR             (CONFIG_EDTM_VECTOR[8-1:0]),
        .CONFIG_EDPF_VECTOR             (CONFIG_EDPF_VECTOR[8-1:0]),
        .CONFIG_EALIGN_VECTOR           (CONFIG_EALIGN_VECTOR[8-1:0]),
        .AXI_P_DW_BYTES                 (AXI_P_DW_BYTES),
        .AXI_ADDR_WIDTH                 (AXI_ADDR_WIDTH),
        .AXI_ID_WIDTH                   (AXI_ID_WIDTH),
        .AXI_USER_WIDTH                 (AXI_USER_WIDTH))
   U_CMT
      (
       .flush                           (flush),
       .flush_tgt                       (flush_tgt[(CONFIG_AW-2 )-1:0]),
       .cmt_pop_size                    (cmt_pop_size[CONFIG_P_COMMIT_WIDTH:0]),
       .cmt_fire                        (cmt_fire[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .prf_WE_lsu_epu                  (prf_WE_lsu_epu),
       .prf_WADDR_lsu_epu               (prf_WADDR_lsu_epu[6-1:0]),
       .prf_WDATA_lsu_epu               (prf_WDATA_lsu_epu[CONFIG_DW-1:0]),
       .bpu_wb                          (bpu_wb),
       .bpu_wb_is_bcc                   (bpu_wb_is_bcc),
       .bpu_wb_is_breg                  (bpu_wb_is_breg),
       .bpu_wb_is_brel                  (bpu_wb_is_brel),
       .bpu_wb_taken                    (bpu_wb_taken),
       .bpu_wb_pc                       (bpu_wb_pc[(CONFIG_AW-2 )-1:CONFIG_BTB_P_NUM]),
       .bpu_wb_npc_act                  (bpu_wb_npc_act[(CONFIG_AW-2 )-1:0]),
       .bpu_wb_upd_partial              (bpu_wb_upd_partial[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:((CONFIG_AW-2 ) + 1)]),
       .dbus_ARVALID                    (dbus_ARVALID),
       .dbus_ARADDR                     (dbus_ARADDR[AXI_ADDR_WIDTH-1:0]),
       .dbus_ARPROT                     (dbus_ARPROT[2:0]),
       .dbus_ARID                       (dbus_ARID[AXI_ID_WIDTH-1:0]),
       .dbus_ARUSER                     (dbus_ARUSER[AXI_USER_WIDTH-1:0]),
       .dbus_ARLEN                      (dbus_ARLEN[7:0]),
       .dbus_ARSIZE                     (dbus_ARSIZE[2:0]),
       .dbus_ARBURST                    (dbus_ARBURST[1:0]),
       .dbus_ARLOCK                     (dbus_ARLOCK),
       .dbus_ARCACHE                    (dbus_ARCACHE[3:0]),
       .dbus_ARQOS                      (dbus_ARQOS[3:0]),
       .dbus_ARREGION                   (dbus_ARREGION[3:0]),
       .dbus_RREADY                     (dbus_RREADY),
       .dbus_AWVALID                    (dbus_AWVALID),
       .dbus_AWADDR                     (dbus_AWADDR[AXI_ADDR_WIDTH-1:0]),
       .dbus_AWPROT                     (dbus_AWPROT[2:0]),
       .dbus_AWID                       (dbus_AWID[AXI_ID_WIDTH-1:0]),
       .dbus_AWUSER                     (dbus_AWUSER[AXI_USER_WIDTH-1:0]),
       .dbus_AWLEN                      (dbus_AWLEN[7:0]),
       .dbus_AWSIZE                     (dbus_AWSIZE[2:0]),
       .dbus_AWBURST                    (dbus_AWBURST[1:0]),
       .dbus_AWLOCK                     (dbus_AWLOCK),
       .dbus_AWCACHE                    (dbus_AWCACHE[3:0]),
       .dbus_AWQOS                      (dbus_AWQOS[3:0]),
       .dbus_AWREGION                   (dbus_AWREGION[3:0]),
       .dbus_WVALID                     (dbus_WVALID),
       .dbus_WDATA                      (dbus_WDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .dbus_WSTRB                      (dbus_WSTRB[(1<<AXI_P_DW_BYTES)-1:0]),
       .dbus_WLAST                      (dbus_WLAST),
       .dbus_WUSER                      (dbus_WUSER[AXI_USER_WIDTH-1:0]),
       .dbus_BREADY                     (dbus_BREADY),
       .irq_async                       (irq_async),
       .tsc_irq                         (tsc_irq),
       .msr_psr_imme                    (msr_psr_imme),
       .msr_psr_rm                      (msr_psr_rm),
       .msr_psr_ice                     (msr_psr_ice),
       .msr_imm_tlbl_idx                (msr_imm_tlbl_idx[CONFIG_ITLB_P_SETS-1:0]),
       .msr_imm_tlbl_nxt                (msr_imm_tlbl_nxt[CONFIG_DW-1:0]),
       .msr_imm_tlbl_we                 (msr_imm_tlbl_we),
       .msr_imm_tlbh_idx                (msr_imm_tlbh_idx[CONFIG_ITLB_P_SETS-1:0]),
       .msr_imm_tlbh_nxt                (msr_imm_tlbh_nxt[CONFIG_DW-1:0]),
       .msr_imm_tlbh_we                 (msr_imm_tlbh_we),
       .msr_icinv_line_nxt              (msr_icinv_line_nxt[CONFIG_IC_P_SETS-1:0]),
       .msr_icinv_we                    (msr_icinv_we),
       .clk                             (clk),
       .rst                             (rst),
       .cmt_valid                       (cmt_valid[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_epu_opc_bus                 (cmt_epu_opc_bus[2*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_lsu_opc_bus                 (cmt_lsu_opc_bus[7*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_bpu_upd                     (cmt_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_pc                          (cmt_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_prd                         (cmt_prd[6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_prd_we                      (cmt_prd_we[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_pfree                       (cmt_pfree[6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_is_bcc                      (cmt_is_bcc[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .cmt_is_brel                     (cmt_is_brel[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .cmt_is_breg                     (cmt_is_breg[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .cmt_fls                         (cmt_fls[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_exc                         (cmt_exc[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_opera                       (cmt_opera[CONFIG_DW*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_operb                       (cmt_operb[CONFIG_DW*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_fls_tgt                     (cmt_fls_tgt[(CONFIG_AW-2 )*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .dbus_ARREADY                    (dbus_ARREADY),
       .dbus_RVALID                     (dbus_RVALID),
       .dbus_RDATA                      (dbus_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .dbus_RRESP                      (dbus_RRESP[1:0]),
       .dbus_RLAST                      (dbus_RLAST),
       .dbus_RID                        (dbus_RID[AXI_ID_WIDTH-1:0]),
       .dbus_RUSER                      (dbus_RUSER[AXI_USER_WIDTH-1:0]),
       .dbus_AWREADY                    (dbus_AWREADY),
       .dbus_WREADY                     (dbus_WREADY),
       .dbus_BVALID                     (dbus_BVALID),
       .dbus_BRESP                      (dbus_BRESP[1:0]),
       .dbus_BID                        (dbus_BID[AXI_ID_WIDTH-1:0]),
       .dbus_BUSER                      (dbus_BUSER[AXI_USER_WIDTH-1:0]),
       .irqs                            (irqs[CONFIG_NUM_IRQ-1:0]),
       .msr_immid                       (msr_immid[CONFIG_DW-1:0]),
       .msr_icid                        (msr_icid[CONFIG_DW-1:0]),
       .msr_icinv_ready                 (msr_icinv_ready));
   ysyx_210479_rob
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_PHT_P_NUM               (CONFIG_PHT_P_NUM),
        .CONFIG_BTB_P_NUM               (CONFIG_BTB_P_NUM),
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_COMMIT_WIDTH          (CONFIG_P_COMMIT_WIDTH),
        .CONFIG_P_WRITEBACK_WIDTH       (CONFIG_P_WRITEBACK_WIDTH),
        .CONFIG_P_ROB_DEPTH             (CONFIG_P_ROB_DEPTH))
   U_ROB
      (
       .rob_ready                       (rob_ready),
       .rob_free_id                     (rob_free_id[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0]),
       .rob_free_bank                   (rob_free_bank[(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0]),
       .wb_rob_ready                    (wb_rob_ready[(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .cmt_valid                       (cmt_valid[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_epu_opc_bus                 (cmt_epu_opc_bus[2*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_lsu_opc_bus                 (cmt_lsu_opc_bus[7*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_bpu_upd                     (cmt_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_pc                          (cmt_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_lrd                         (cmt_lrd[5*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_prd                         (cmt_prd[6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_prd_we                      (cmt_prd_we[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_pfree                       (cmt_pfree[6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_is_bcc                      (cmt_is_bcc[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .cmt_is_brel                     (cmt_is_brel[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .cmt_is_breg                     (cmt_is_breg[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .cmt_fls                         (cmt_fls[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_exc                         (cmt_exc[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_opera                       (cmt_opera[CONFIG_DW*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_operb                       (cmt_operb[CONFIG_DW*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_fls_tgt                     (cmt_fls_tgt[(CONFIG_AW-2 )*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .flush                           (flush),
       .rob_push_size                   (rob_push_size[CONFIG_P_ISSUE_WIDTH:0]),
       .rob_push_epu_opc_bus            (rob_push_epu_opc_bus[2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_lsu_opc_bus            (rob_push_lsu_opc_bus[7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_bpu_upd                (rob_push_bpu_upd[(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_pc                     (rob_push_pc[(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_lrd                    (rob_push_lrd[5*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .rob_push_prd                    (rob_push_prd[6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .rob_push_prd_we                 (rob_push_prd_we[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_pfree                  (rob_push_pfree[6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_is_bcc                 (rob_push_is_bcc[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_is_brel                (rob_push_is_brel[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .rob_push_is_breg                (rob_push_is_breg[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]),
       .wb_valid                        (wb_valid[(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .wb_rob_id                       (wb_rob_id[(1<<CONFIG_P_WRITEBACK_WIDTH)*CONFIG_P_ROB_DEPTH-1:0]),
       .wb_rob_bank                     (wb_rob_bank[(1<<CONFIG_P_WRITEBACK_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0]),
       .wb_fls                          (wb_fls[(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .wb_exc                          (wb_exc[(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .wb_opera                        (wb_opera[CONFIG_DW*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .wb_operb                        (wb_operb[CONFIG_DW*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .wb_fls_tgt                      (wb_fls_tgt[(CONFIG_AW-2 )*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .cmt_pop_size                    (cmt_pop_size[CONFIG_P_COMMIT_WIDTH:0]));
   ysyx_210479_prf
      #(
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_WRITEBACK_WIDTH       (CONFIG_P_WRITEBACK_WIDTH))
   U_PRF
      (
       .prf_RDATA                       (prf_RDATA[(1<<CONFIG_P_ISSUE_WIDTH)*2*CONFIG_DW-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .prf_RE                          (prf_RE[(1<<CONFIG_P_ISSUE_WIDTH)*2-1:0]),
       .prf_RADDR                       (prf_RADDR[(1<<CONFIG_P_ISSUE_WIDTH)*2*6-1:0]),
       .prf_WE                          (prf_WE[(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .prf_WADDR                       (prf_WADDR[6*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]),
       .prf_WDATA                       (prf_WDATA[CONFIG_DW*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]));
endmodule
module ysyx_210479_prefetch_buf
#(
   parameter                           CONFIG_AW = 32,
   parameter                           CONFIG_P_FETCH_WIDTH = 2,
   parameter                           CONFIG_P_ISSUE_WIDTH = 2,
   parameter                           CONFIG_P_IQ_DEPTH = 4, 
   parameter                           CONFIG_PHT_P_NUM = 0,
   parameter                           CONFIG_BTB_P_NUM = 0
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input [((2 <<1)*8) * (1<<CONFIG_P_FETCH_WIDTH)-1:0] iq_ins,
   input [(CONFIG_AW-2 ) * (1<<CONFIG_P_FETCH_WIDTH)-1:0] iq_pc,
   input [2 * (1<<CONFIG_P_FETCH_WIDTH)-1:0] iq_exc,
   input [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) * (1<<CONFIG_P_FETCH_WIDTH)-1:0] iq_bpu_upd,
   input [CONFIG_P_FETCH_WIDTH:0]      iq_push_cnt,
   input [CONFIG_P_FETCH_WIDTH:0]      iq_push_offset,
   output                              iq_ready,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_valid,
   input [CONFIG_P_ISSUE_WIDTH:0]      id_pop_cnt,
   output [((2 <<1)*8) * (1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_ins,
   output [(CONFIG_AW-2 ) * (1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_pc,
   output [2 * (1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_exc,
   output [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) * (1<<CONFIG_P_ISSUE_WIDTH)-1:0] id_bpu_upd
);
   localparam FW                       = (1<<CONFIG_P_FETCH_WIDTH);
   localparam FIFO_DW                  = (((2 <<1)*8) + (CONFIG_AW-2 ) + 2 + (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)); 
   localparam P_BANKS                  = (CONFIG_P_FETCH_WIDTH);
   localparam BANKS                    = (1<<P_BANKS);
   wire [P_BANKS-1:0]                  head_ff, tail_ff;
   wire [P_BANKS-1:0]                  head_nxt, tail_nxt;
   wire [P_BANKS-1:0]                  head_l                        [FW-1:0];
   wire [P_BANKS-1:0]                  head_r                        [FW-1:0];
   wire [P_BANKS-1:0]                  tail_r                        [FW-1:0];
   wire [P_BANKS-1:0]                  tail_inv                      [FW-1:0];
   wire [FIFO_DW-1:0]                  que_din                       [BANKS-1:0];
   wire [FIFO_DW-1:0]                  que_dout                      [BANKS-1:0];
   wire                                que_valid                     [BANKS-1:0];
   wire [BANKS-1:0]                    que_ready;
   wire                                que_push                      [BANKS-1:0];
   wire                                que_pop                       [BANKS-1:0];
   wire [((2 <<1)*8)-1:0]            iq_ins_unpacked               [FW-1:0];
   wire [(CONFIG_AW-2 )-1:0]                    iq_pc_unpacked                [FW-1:0];
   wire [2-1:0]               iq_exc_unpacked               [FW-1:0];
   wire [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)-1:0]               iq_bpu_upd_unpacked           [FW-1:0];
   wire [P_BANKS:0]                    pop_cnt_adapt;
   genvar i;
   generate for(i=0;i<BANKS;i=i+1)
      begin : gen_ptr
         assign head_l[i] = i[P_BANKS-1:0] + head_ff;
         assign head_r[i] = i[P_BANKS-1:0] - head_ff;
         assign tail_r[i] = i[P_BANKS-1:0] - tail_ff;
         assign tail_inv[i] = i[P_BANKS-1:0] - tail_ff + iq_push_offset[P_BANKS-1:0];
      end
   endgenerate
   generate for(i=0;i<FW;i=i+1)
      begin : gen_iq_bundle
         assign iq_ins_unpacked[i] = iq_ins[i*((2 <<1)*8) +: ((2 <<1)*8)];
         assign iq_pc_unpacked[i] = iq_pc[i*(CONFIG_AW-2 ) +: (CONFIG_AW-2 )];
         assign iq_exc_unpacked[i] = iq_exc[i*2 +: 2];
         assign iq_bpu_upd_unpacked[i] = iq_bpu_upd[i*(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) +: (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)];
      end
   endgenerate
   generate
      if (P_BANKS == CONFIG_P_ISSUE_WIDTH)
         assign pop_cnt_adapt = id_pop_cnt;
      else
         assign pop_cnt_adapt = {{P_BANKS-CONFIG_P_ISSUE_WIDTH{1'b0}}, id_pop_cnt};
   endgenerate
   generate for(i=0;i<BANKS;i=i+1)
      begin : gen_bank_ctrl
         assign que_din[i] = {iq_ins_unpacked[tail_inv[i]],
                              iq_pc_unpacked[tail_inv[i]],
                              iq_exc_unpacked[tail_inv[i]],
                              iq_bpu_upd_unpacked[tail_inv[i]]};
         assign que_pop[i]  = ({1'b0, head_r[i]} < pop_cnt_adapt);
         assign que_push[i] = ({1'b0, tail_r[i]} < iq_push_cnt);
      end
   endgenerate
   assign head_nxt = (head_ff + pop_cnt_adapt[P_BANKS-1:0]) & {P_BANKS{~flush}};
   assign tail_nxt = (tail_ff + iq_push_cnt[P_BANKS-1:0]) & {P_BANKS{~flush}};
   ysyx_210479_mDFF_r #(.DW(P_BANKS)) ff_head (.CLK(clk), .RST(rst), .D(head_nxt), .Q(head_ff) );
   ysyx_210479_mDFF_r #(.DW(P_BANKS)) ff_tail (.CLK(clk), .RST(rst), .D(tail_nxt), .Q(tail_ff) );
   generate for(i=0;i<BANKS;i=i+1)
      begin : gen_banks
         ysyx_210479_fifo_fwft
            #(
               .DW            (FIFO_DW),
               .DEPTH_WIDTH   (CONFIG_P_IQ_DEPTH)
            )
         U_FIFO
            (
               .clk           (clk),
               .rst           (rst),
               .flush         (flush),
               .push          (que_push[i]),
               .din           (que_din[i]),
               .ready         (que_ready[i]),
               .pop           (que_pop[i]),
               .dout          (que_dout[i]),
               .valid         (que_valid[i])
            );
      end
   endgenerate
   generate for(i=0;i<(1<<CONFIG_P_ISSUE_WIDTH);i=i+1)
      begin : gen_pop
         assign {id_ins[i*((2 <<1)*8) +: ((2 <<1)*8)],
                  id_pc[i*(CONFIG_AW-2 ) +: (CONFIG_AW-2 )],
                  id_exc[i*2 +: 2],
                  id_bpu_upd[i*(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) +: (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)] } = que_dout[head_l[i]];
         assign id_valid[i] = que_valid[head_l[i]];
      end
   endgenerate
   assign iq_ready = &que_ready;
endmodule
module ysyx_210479_prf
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_P_ISSUE_WIDTH = 0,
   parameter                           CONFIG_P_WRITEBACK_WIDTH = 0
)
(
   input                               clk,
   input                               rst,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*2-1:0] prf_RE,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*2*6-1:0] prf_RADDR,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*2*CONFIG_DW-1:0] prf_RDATA,
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WE,
   input [6*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WADDR,
   input [CONFIG_DW*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WDATA
);
   localparam IW                       = (1<<CONFIG_P_ISSUE_WIDTH);
   wire [IW*2-1:0]                     prf_RADDR_zero_ff;
   wire [IW*2*CONFIG_DW-1:0]           prf_RDATA_1;
   genvar i;
   ysyx_210479_mRF_nwnr_r
      #(
         .DW                           (CONFIG_DW),
         .AW                           (6),
         .NUM_READ                     (2*IW), 
         .NUM_WRITE                    (IW)
      )
   U_PRF
      (
         .CLK                          (clk),
         .RST(rst),
         .RE                           (prf_RE),
         .RADDR                        (prf_RADDR),
         .RDATA                        (prf_RDATA_1),
         .WE                           (prf_WE),
         .WADDR                        (prf_WADDR),
         .WDATA                        (prf_WDATA)
      );
   generate for(i=0;i<IW*2;i=i+1)
      begin : gen_zero_dec
         ysyx_210479_mDFF_lr #(.DW(1)) ff_prf_zero_RADDR (.CLK(clk),.RST(rst), .LOAD(prf_RE[i]), .D(|prf_RADDR[i*6 +: 6]), .Q(prf_RADDR_zero_ff[i]) );
         assign prf_RDATA[i*CONFIG_DW +: CONFIG_DW] =
            (prf_RDATA_1[i*CONFIG_DW +: CONFIG_DW] & {CONFIG_DW{prf_RADDR_zero_ff[i]}});
      end
   endgenerate
endmodule
module ysyx_210479_rn
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_PHT_P_NUM = 0,
   parameter                           CONFIG_BTB_P_NUM = 0,
   parameter                           CONFIG_P_ISSUE_WIDTH = 0,
   parameter                           CONFIG_P_COMMIT_WIDTH = 0,
   parameter                           CONFIG_P_WRITEBACK_WIDTH = 0
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   output                              rn_stall_req,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0]                rn_valid,
   input [9 *(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_alu_opc_bus,
   input [2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_epu_opc_bus,
   input [8*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_bru_opc_bus,
   input [7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lsu_opc_bus,
   input [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_fe,
   input [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_bpu_upd,
   input [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_pc,
   input [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_imm,
   input [(1<<CONFIG_P_COMMIT_WIDTH)*5-1:0] rn_lrs1,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] rn_lrs1_re,
   input [(1<<CONFIG_P_COMMIT_WIDTH)*5-1:0] rn_lrs2,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] rn_lrs2_re,
   input [5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrd,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rn_lrd_we,
   input [CONFIG_P_ISSUE_WIDTH:0] rn_push_size,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_fire,
   input [(1<<CONFIG_P_COMMIT_WIDTH)*5-1:0] cmt_lrd,
   input [(1<<CONFIG_P_COMMIT_WIDTH)*6-1:0] cmt_pfree,
   input [(1<<CONFIG_P_COMMIT_WIDTH)*6-1:0] cmt_prd,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_prd_we,
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)*6-1:0] prf_WADDR,
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WE,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_ready,
   output                              issue_p_ce,
   output [9 *(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_alu_opc_bus,
   output [2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_epu_opc_bus,
   output [8*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_bru_opc_bus,
   output [7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_lsu_opc_bus,
   output [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_fe,
   output [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_bpu_upd,
   output [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_pc,
   output [CONFIG_DW*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_imm,
   output [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs1,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs1_re,
   output [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs2,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prs2_re,
   output [5*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_lrd,
   output [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prd,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_prd_we,
   output [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_pfree,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] issue_push,
   output [CONFIG_P_ISSUE_WIDTH:0] issue_push_size,
   output [(1<<6)-1:0]       busytable
);
   localparam IW                       = (1<<CONFIG_P_ISSUE_WIDTH);
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] fl_prd;
   wire                 fl_stall_req;           
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] rat_pfree;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] rat_prs1;
   wire [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] rat_prs2;
   wire                                p_ce_s1;
   wire                                p_ce_s2;
   wire [IW-1:0]                       fl_pop;                    
   wire                                rollback;               
   wire [IW-1:0]                       rat_we;                     
   wire [IW-1:0]                       s1o_valid;
   ysyx_210479_rn_fl
      #(
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_COMMIT_WIDTH          (CONFIG_P_COMMIT_WIDTH))
   U_FL
      (
       .fl_stall_req                    (fl_stall_req),
       .fl_prd                          (fl_prd[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .pop                             (fl_pop[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]), 
       .rollback                        (rollback),
       .lrd_we                          (rn_lrd_we),             
       .cmt_fire                        (cmt_fire[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_prd_we                      (cmt_prd_we[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_prd                         (cmt_prd[(1<<CONFIG_P_COMMIT_WIDTH)*6-1:0]),
       .cmt_pfree                       (cmt_pfree[(1<<CONFIG_P_COMMIT_WIDTH)*6-1:0]));
   ysyx_210479_rn_rat
      #(
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_COMMIT_WIDTH          (CONFIG_P_COMMIT_WIDTH))
   U_RAT
      (
       .rat_prs1                        (rat_prs1[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .rat_prs2                        (rat_prs2[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .rat_pfree                       (rat_pfree[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .we                              (rat_we),                
       .rollback                        (rollback),
       .lrs1                            (rn_lrs1[(1<<CONFIG_P_ISSUE_WIDTH)*5-1:0]), 
       .lrs2                            (rn_lrs2[(1<<CONFIG_P_ISSUE_WIDTH)*5-1:0]), 
       .lrd                             (rn_lrd[(1<<CONFIG_P_ISSUE_WIDTH)*5-1:0]), 
       .lrd_we                          (rn_lrd_we),             
       .fl_prd                          (fl_prd[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]),
       .cmt_fire                        (cmt_fire[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]),
       .cmt_lrd                         (cmt_lrd[(1<<CONFIG_P_COMMIT_WIDTH)*5-1:0]),
       .cmt_prd                         (cmt_prd[(1<<CONFIG_P_COMMIT_WIDTH)*6-1:0]),
       .cmt_prd_we                      (cmt_prd_we[(1<<CONFIG_P_COMMIT_WIDTH)-1:0]));
   ysyx_210479_rn_busytable
      #(
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_WRITEBACK_WIDTH       (CONFIG_P_WRITEBACK_WIDTH))
   U_BUSYTABLE
      (
       .busytable                       (busytable[(1<<6)-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .flush                           (flush),
       .prd                             (fl_prd[(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0]), 
       .prd_we                          (rn_lrd_we[(1<<CONFIG_P_ISSUE_WIDTH)-1:0]), 
       .prf_WADDR                       (prf_WADDR[(1<<CONFIG_P_WRITEBACK_WIDTH)*6-1:0]),
       .prf_WE                          (prf_WE[(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0]));
   assign rn_stall_req = (fl_stall_req | ~(&issue_ready));
   assign p_ce_s1 = ~(rn_stall_req);
   assign p_ce_s2 = ~(rn_stall_req);
   assign fl_pop = (rn_valid & {IW{p_ce_s1}});
   assign rat_we = fl_pop;
   assign rollback = flush;
   ysyx_210479_mDFF_lr # (.DW(IW)) ff_s1o_valid (.CLK(clk), .RST(rst), .LOAD(p_ce_s1|flush), .D(rn_valid & {IW{~flush}}), .Q(s1o_valid) );
   ysyx_210479_mDFF_lr # (.DW(9 *IW)) ff_issue_alu_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rn_alu_opc_bus), .Q(issue_alu_opc_bus) );
   ysyx_210479_mDFF_lr # (.DW(2*IW)) ff_issue_epu_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rn_epu_opc_bus), .Q(issue_epu_opc_bus) );
   ysyx_210479_mDFF_lr # (.DW(8*IW)) ff_issue_bru_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rn_bru_opc_bus), .Q(issue_bru_opc_bus) );
   ysyx_210479_mDFF_lr # (.DW(7*IW)) ff_issue_lsu_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rn_lsu_opc_bus), .Q(issue_lsu_opc_bus) );
   ysyx_210479_mDFF_lr # (.DW(6*IW)) ff_issue_fe (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rn_fe), .Q(issue_fe) );
   ysyx_210479_mDFF_lr # (.DW((2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*IW)) ff_issue_bpu_upd (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rn_bpu_upd), .Q(issue_bpu_upd) );
   ysyx_210479_mDFF_lr # (.DW((CONFIG_AW-2 )*IW)) ff_issue_pc (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rn_pc), .Q(issue_pc) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_DW*IW)) ff_issue_imm (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rn_imm), .Q(issue_imm) );
   ysyx_210479_mDFF_lr # (.DW(6*IW)) ff_issue_prs1 (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rat_prs1), .Q(issue_prs1) );
   ysyx_210479_mDFF_lr # (.DW(6*IW)) ff_issue_prs2 (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rat_prs2), .Q(issue_prs2) );
   ysyx_210479_mDFF_lr # (.DW(IW)) ff_issue_prs1_re (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rn_lrs1_re), .Q(issue_prs1_re) );
   ysyx_210479_mDFF_lr # (.DW(IW)) ff_issue_prs2_re (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rn_lrs2_re), .Q(issue_prs2_re) );
   ysyx_210479_mDFF_lr # (.DW(6*IW)) ff_issue_prd (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(fl_prd), .Q(issue_prd) );
   ysyx_210479_mDFF_lr # (.DW(6*IW)) ff_issue_pfree (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rat_pfree), .Q(issue_pfree) );
   ysyx_210479_mDFF_lr # (.DW(IW)) ff_issue_prd_we (.CLK(clk), .LOAD(p_ce_s1),.RST(rst), .D(rn_lrd_we), .Q(issue_prd_we) );
   ysyx_210479_mDFF_lr # (.DW(5*IW)) ff_issue_lrd (.CLK(clk),.RST(rst), .LOAD(p_ce_s1), .D(rn_lrd), .Q(issue_lrd) );
   ysyx_210479_mDFF_lr # (.DW(CONFIG_P_ISSUE_WIDTH+1)) ff_issue_push_size (.CLK(clk), .RST(rst), .LOAD(p_ce_s1|flush), .D(rn_push_size & {CONFIG_P_ISSUE_WIDTH+1{~flush}}), .Q(issue_push_size) );
   assign issue_push = s1o_valid;
   assign issue_p_ce = p_ce_s2;
endmodule
module ysyx_210479_rn_busytable
#(
   parameter                           CONFIG_P_ISSUE_WIDTH = 0,
   parameter                           CONFIG_P_WRITEBACK_WIDTH = 0
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] prd,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] prd_we,
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)*6-1:0] prf_WADDR,
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WE,
   output [(1<<6)-1:0]      busytable
);
   localparam IW                       = (1<<CONFIG_P_ISSUE_WIDTH);
   localparam WW                       = (1<<CONFIG_P_WRITEBACK_WIDTH);
   ysyx_210479_mRF_nw_dio_r
      #(
         .DW         (1),
         .AW         (6),
         .RST_VECTOR ({(1<<6){1'b0}}),
         .NUM_WRITE  (IW+WW)
      )
   U_BUSYTABLE
      (
         .CLK     (clk),
         .RST     (rst),
         .WE      ({prd_we, prf_WE}),
         .WADDR   ({prd, prf_WADDR}),
         .WDATA   ({{IW{1'b1}}, {WW{1'b0}}}),
         .REP     (flush),
         .DO      (busytable),
         .DI      ({(1<<6){1'b0}})
      );
endmodule
module ysyx_210479_rn_fl
#(
   parameter                           CONFIG_P_ISSUE_WIDTH = 0,
   parameter                           CONFIG_P_COMMIT_WIDTH = 0
)
(
   input                               clk,
   input                               rst,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] pop,
   input                               rollback,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] lrd_we,
   output                              fl_stall_req,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] fl_prd,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_fire,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_prd_we,
   input [(1<<CONFIG_P_COMMIT_WIDTH)*6-1:0] cmt_prd,
   input [(1<<CONFIG_P_COMMIT_WIDTH)*6-1:0] cmt_pfree
);
   localparam IW                       = (1<<CONFIG_P_ISSUE_WIDTH);
   localparam CW                       = (1<<CONFIG_P_COMMIT_WIDTH);
   localparam N_PRF                    = (1<<6);
   localparam [N_PRF-1:0] FL_1         = {{N_PRF-1{1'b0}}, 1'b1};
   wire [N_PRF-2:0]                    fl_ff;
   reg [N_PRF-1:0]                     fl_nxt;
   wire [N_PRF-2:0]                    afl_ff;
   reg [N_PRF-1:0]                     afl_nxt;
   wire                                gs                            [IW-1:0];
   reg                                 no_free;
   genvar i;
   integer j;
   generate
      if (IW==2)
         begin : gen_sel_2
            wire [6-1:0] fl_prd_0, fl_prd_1;
            wire [N_PRF-1:0] fl_0, fl_1;
            wire gs_0, gs_1;
            assign fl_0 = {fl_ff, 1'b0};
            for(i=0;i<N_PRF;i=i+1)
               begin : gen_fl_1
                  assign fl_1[i] = fl_0[N_PRF-i-1]; 
               end
            ysyx_210479_priority_encoder_gs #(.P_DW(6)) PENC_FL_0 (
               .din     (fl_0),
               .dout    (fl_prd_0),
               .gs      (gs_0)
            );
            ysyx_210479_priority_encoder_rev_gs #(.P_DW(6)) PENC_FL_1 (
               .din     (fl_1),
               .dout    (fl_prd_1),
               .gs      (gs_1)
            );
            assign gs[0] = (gs_0);
            assign gs[1] = (gs_1 & (fl_prd_1!=fl_prd_0));
            assign fl_prd = {fl_prd_1, fl_prd_0};
         end
   endgenerate
   always @(*)
      begin
         no_free = 'b0;
         for(j=0;j<IW;j=j+1)
            no_free = no_free | (lrd_we[j] & ~gs[j]);
      end
   assign fl_stall_req = no_free;
   always @(*)
      begin
         fl_nxt = {fl_ff, 1'b0};
         for(j=0;j<IW;j=j+1)
            if (pop[j] & lrd_we[j])
               fl_nxt = fl_nxt & ~(FL_1<<fl_prd[j * 6 +: 6]); 
         for(j=0;j<CW;j=j+1)   
            if (cmt_prd_we[j] & cmt_fire[j])
               fl_nxt = fl_nxt | (FL_1<<cmt_pfree[j * 6 +: 6]); 
      end
   ysyx_210479_mDFF_r #(.DW(N_PRF-1), .RST_VECTOR({N_PRF-1{1'b1}})) ff_fl (.CLK(clk), .RST(rst), .D(rollback ? afl_ff : fl_nxt[N_PRF-1:1]), .Q(fl_ff) );
   always @(*)
      begin
         afl_nxt = {afl_ff, 1'b0};
         for(j=0;j<CW;j=j+1)
            if (cmt_prd_we[j] & cmt_fire[j])
               begin
                  afl_nxt = afl_nxt & ~(FL_1<<cmt_prd[j * 6 +: 6]); 
                  afl_nxt = afl_nxt | (FL_1<<cmt_pfree[j * 6 +: 6]); 
               end
      end
   ysyx_210479_mDFF_r #(.DW(N_PRF-1), .RST_VECTOR({N_PRF-1{1'b1}})) ff_afl (.CLK(clk), .RST(rst), .D(afl_nxt[N_PRF-1:1]), .Q(afl_ff) );
endmodule
module ysyx_210479_rn_rat
#(
   parameter                           CONFIG_P_ISSUE_WIDTH = 0,
   parameter                           CONFIG_P_COMMIT_WIDTH = 0
)
(
   input                               clk,
   input                               rst,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] we,
   input                               rollback,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*5-1:0] lrs1,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*5-1:0] lrs2,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*5-1:0] lrd,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] lrd_we,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] fl_prd,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] rat_prs1,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] rat_prs2,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] rat_pfree,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_fire,
   input [(1<<CONFIG_P_COMMIT_WIDTH)*5-1:0] cmt_lrd,
   input [(1<<CONFIG_P_COMMIT_WIDTH)*6-1:0] cmt_prd,
   input [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_prd_we
);
   localparam N_LRF                    = (1<<5);
   localparam IW                       = (1<<CONFIG_P_ISSUE_WIDTH);
   localparam CW                       = (1<<CONFIG_P_COMMIT_WIDTH);
   wire [N_LRF*6-1:0]       rat_ff;
   wire [N_LRF*6-1:0]       arat_ff;
   wire [6-1:0]             rat_mux [N_LRF-1:0];
   wire [6*CW-1:0]          prs1_nobyp;
   wire [6*CW-1:0]          prs2_nobyp;
   wire [6*CW-1:0]          pfree_nobyp;
   genvar i, k;
   integer x;
   ysyx_210479_mRF_nw_dio_r
      #(
         .DW (6),
         .AW (5),
         .RST_VECTOR ({6*(1<<5){1'b0}}),
         .NUM_WRITE (IW)
      )
   U_RAT
      (
         .CLK (clk),
         .RST (rst),
         .WE  (lrd_we & we),
         .WADDR (lrd),
         .WDATA (fl_prd),
         .REP (rollback),
         .DI  (arat_ff),
         .DO  (rat_ff)
      );
   ysyx_210479_mRF_nw_do_r
      #(
         .DW (6),
         .AW (5),
         .RST_VECTOR ({6*(1<<5){1'b0}}),
         .NUM_WRITE (IW)
      )
   U_aRAT
      (
         .CLK (clk),
         .RST (rst),
         .WE  (cmt_prd_we & cmt_fire),
         .WADDR (cmt_lrd),
         .WDATA (cmt_prd),
         .DO  (arat_ff)
      );
   generate for(i=0;i<N_LRF;i=i+1)
      begin : gen_rat_mux
         assign rat_mux[i] = rat_ff[i * 6 +: 6];
      end
   endgenerate
   generate for(i=0;i<IW;i=i+1)
      begin : gen_readout
         assign prs1_nobyp[i * 6 +: 6] = rat_mux[lrs1[i * 5 +: 5]];
         assign prs2_nobyp[i * 6 +: 6] = rat_mux[lrs2[i * 5 +: 5]];
         assign pfree_nobyp[i * 6 +: 6] = rat_mux[lrd[i * 5 +: 5]];
      end
   endgenerate
   generate for(i=1;i<IW;i=i+1)
      begin : gen_raw_waw
         reg [i-1:0] raw_rs1_rev;
         reg [i-1:0] raw_rs2_rev;
         reg [i-1:0] waw_rev;
         wire [6*i-1:0] fl_prd_rev;
         always @(*)
            begin
               raw_rs1_rev[i-1] = 'b0;
               for(x=0;x<i;x=x+1)
                  raw_rs1_rev[i-x-1] = raw_rs1_rev[i-x-1] |
                                          (lrd_we[x] &
                                          (lrs1[i*5 +:5]==lrd[x*5 +:5 ]));
            end
         always @(*)
            begin
               raw_rs2_rev[i-1] = 'b0;
               for(x=0;x<i;x=x+1)
                  raw_rs2_rev[i-x-1] = raw_rs2_rev[i-x-1] |
                                          (lrd_we[x] &
                                          (lrs2[i*5 +:5]==lrd[x*5 +:5 ]));
            end
         always @(*)
            begin
               waw_rev[i-1] = 'b0;
               for(x=0;x<i;x=x+1)
                  waw_rev[i-x-1] = waw_rev[i-x-1] | (lrd_we[x] &
                                             ((lrd_we[i] & (lrd[i*5 +:5]==lrd[x*5 +:5]))));
            end
         for(k=0;k<i;k=k+1)
            begin : gen_fl_prd_rev
               assign fl_prd_rev[k * 6 +: 6] = fl_prd[(i-k-1) * 6 +: 6];
            end
         ysyx_210479_pmux #(.SELW(i+1), .DW(6)) pmux_prs1 (
            .sel({1'b1, raw_rs1_rev}),
            .din({prs1_nobyp[i * 6 +: 6], fl_prd_rev[0 +: i*6]}),
            .dout(rat_prs1[i * 6 +: 6])
         );
         ysyx_210479_pmux #(.SELW(i+1), .DW(6)) pmux_prs2 (
            .sel({1'b1, raw_rs2_rev}),
            .din({prs2_nobyp[i * 6 +: 6], fl_prd_rev[0 +: i*6]}),
            .dout(rat_prs2[i * 6 +: 6])
         );
         ysyx_210479_pmux #(.SELW(i+1), .DW(6)) pmux_pfree (
            .sel({1'b1, waw_rev}),
            .din({pfree_nobyp[i * 6 +: 6], fl_prd_rev[0 +: i*6]}),
            .dout(rat_pfree[i * 6 +: 6])
         );
      end
   endgenerate
   assign rat_prs1[0 * 6 +: 6] = prs1_nobyp[0 * 6 +: 6];
   assign rat_prs2[0 * 6 +: 6] = prs2_nobyp[0 * 6 +: 6];
   assign rat_pfree[0 * 6 +: 6] = pfree_nobyp[0 * 6 +: 6];
endmodule
module ysyx_210479_ro
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_P_ISSUE_WIDTH = 0,
   parameter                           CONFIG_P_COMMIT_WIDTH = 0,
   parameter                           CONFIG_P_ROB_DEPTH = 0
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*9 -1:0] ro_alu_opc_bus,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_bpu_pred_taken,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0] ro_bpu_pred_tgt,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*8-1:0] ro_bru_opc_bus,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_epu_op,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ro_imm,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_lsu_op,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ro_fe,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0] ro_pc,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ro_prd,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_prd_we,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ro_prs1,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_prs1_re,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ro_prs2,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_prs2_re,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] ro_rob_id,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] ro_rob_bank,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_valid,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ro_ready,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*2-1:0] prf_RE,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*2*6-1:0] prf_RADDR,
   input [(1<<CONFIG_P_ISSUE_WIDTH)*2*CONFIG_DW-1:0] prf_RDATA,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*9 -1:0] ex_alu_opc_bus,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_bpu_pred_taken,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0] ex_bpu_pred_tgt,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*8-1:0] ex_bru_opc_bus,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_epu_op,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ex_imm,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_lsu_op,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ex_fe,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*(CONFIG_AW-2 )-1:0] ex_pc,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*6-1:0] ex_prd,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_prd_we,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ex_operand1,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_DW-1:0] ex_operand2,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] ex_rob_id,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] ex_rob_bank,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_valid,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] ex_ready
);
   localparam IW                       = (1<<CONFIG_P_ISSUE_WIDTH);
   wire [IW-1:0]                       p_ce;
   wire [IW-1:0]                       s1o_prs1_re;
   wire [IW-1:0]                       s1o_prs2_re;
   genvar                              i;
   generate for(i=0;i<IW;i=i+1)
      begin : gen_ro
         ysyx_210479_hds_buf
            #(.BYPASS(1))
         U_BUF
            (
               .clk  (clk),
               .rst  (rst),
               .flush (flush),
               .A_en (1'b1),    
               .AVALID (ro_valid[i]),
               .AREADY (ro_ready[i]),
               .B_en (1'b1),    
               .BVALID (ex_valid[i]),
               .BREADY (ex_ready[i]),
               .p_ce (p_ce[i])
            );
         ysyx_210479_mDFF_lr # (.DW(9 )) ff_ex_alu_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce[i]),
                  .D(ro_alu_opc_bus[i * 9  +: 9 ]), .Q(ex_alu_opc_bus[i * 9  +: 9 ]) );
         ysyx_210479_mDFF_lr # (.DW(1)) ff_ex_epu_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce[i]), .D(ro_epu_op[i]), .Q(ex_epu_op[i]) );
         ysyx_210479_mDFF_lr # (.DW(8)) ff_ex_bru_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce[i]),
                  .D(ro_bru_opc_bus[i * 8 +: 8]), .Q(ex_bru_opc_bus[i * 8 +: 8]) );
         ysyx_210479_mDFF_lr # (.DW(1)) ff_ex_lsu_opc_bus (.CLK(clk),.RST(rst), .LOAD(p_ce[i]), .D(ro_lsu_op[i]), .Q(ex_lsu_op[i]) );
         ysyx_210479_mDFF_lr # (.DW(6)) ff_ex_fe (.CLK(clk),.RST(rst), .LOAD(p_ce[i]),
                  .D(ro_fe[i * 6 +: 6]), .Q(ex_fe[i * 6 +: 6]) );
         ysyx_210479_mDFF_lr # (.DW(1)) ff_ex_bpu_pred_taken (.CLK(clk),.RST(rst), .LOAD(p_ce[i]), .D(ro_bpu_pred_taken[i]), .Q(ex_bpu_pred_taken[i]) );
         ysyx_210479_mDFF_lr # (.DW((CONFIG_AW-2 ))) ff_ex_bpu_pred_tgt (.CLK(clk),.RST(rst), .LOAD(p_ce[i]),
                  .D(ro_bpu_pred_tgt[i * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )]), .Q(ex_bpu_pred_tgt[i * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )]) );
         ysyx_210479_mDFF_lr # (.DW((CONFIG_AW-2 ))) ff_ex_pc (.CLK(clk),.RST(rst), .LOAD(p_ce[i]),
                  .D(ro_pc[i * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )]), .Q(ex_pc[i * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )]) );
         ysyx_210479_mDFF_lr # (.DW(CONFIG_DW)) ff_ex_imm (.CLK(clk),.RST(rst), .LOAD(p_ce[i]),
                  .D(ro_imm[i * CONFIG_DW +: CONFIG_DW]), .Q(ex_imm[i * CONFIG_DW +: CONFIG_DW]) );
         ysyx_210479_mDFF_lr # (.DW(1)) ff_ex_prd_we (.CLK(clk),.RST(rst), .LOAD(p_ce[i]), .D(ro_prd_we[i]), .Q(ex_prd_we[i]) );
         ysyx_210479_mDFF_lr # (.DW(6)) ff_ex_prd (.CLK(clk),.RST(rst), .LOAD(p_ce[i]),
                  .D(ro_prd[i * 6 +: 6]), .Q(ex_prd[i * 6 +: 6]) );
         ysyx_210479_mDFF_lr # (.DW(CONFIG_P_ROB_DEPTH)) ff_ex_rob_id (.CLK(clk),.RST(rst), .LOAD(p_ce[i]),
                  .D(ro_rob_id[i * CONFIG_P_ROB_DEPTH +: CONFIG_P_ROB_DEPTH]), .Q(ex_rob_id[i * CONFIG_P_ROB_DEPTH +: CONFIG_P_ROB_DEPTH]) );
         ysyx_210479_mDFF_lr # (.DW(CONFIG_P_COMMIT_WIDTH)) ff_ex_rob_bank (.CLK(clk),.RST(rst), .LOAD(p_ce[i]),
                  .D(ro_rob_bank[i * CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH]), .Q(ex_rob_bank[i * CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH]) );
         ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_prs1_re (.CLK(clk),.RST(rst), .LOAD(p_ce[i]), .D(ro_prs1_re[i]), .Q(s1o_prs1_re[i]) );
         ysyx_210479_mDFF_lr # (.DW(1)) ff_s1o_prs2_re (.CLK(clk),.RST(rst), .LOAD(p_ce[i]), .D(ro_prs2_re[i]), .Q(s1o_prs2_re[i]) );
         assign prf_RE[(i<<1)] = (p_ce[i] & ro_prs1_re[i]);
         assign prf_RE[(i<<1)+1] = (p_ce[i] & ro_prs2_re[i]);
         assign prf_RADDR[(i<<1)*6 +: 6] = ro_prs1[i * 6 +: 6];
         assign prf_RADDR[((i<<1)+1)*6 +: 6] = ro_prs2[i * 6 +: 6];
         assign ex_operand1[i*CONFIG_DW +: CONFIG_DW] = (s1o_prs1_re[i])
                                                            ? prf_RDATA[(i<<1)*CONFIG_DW +: CONFIG_DW]
                                                            : ex_imm[i*CONFIG_DW +: CONFIG_DW];
         assign ex_operand2[i*CONFIG_DW +: CONFIG_DW] = (s1o_prs2_re[i])
                                                            ? prf_RDATA[((i<<1)+1)*CONFIG_DW +: CONFIG_DW]
                                                            : ex_imm[i*CONFIG_DW +: CONFIG_DW];
      end
   endgenerate
endmodule
module ysyx_210479_rob
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_AW = 0,
   parameter                           CONFIG_PHT_P_NUM = 0,
   parameter                           CONFIG_BTB_P_NUM = 0,
   parameter                           CONFIG_P_ISSUE_WIDTH = 0,
   parameter                           CONFIG_P_COMMIT_WIDTH = 0,
   parameter                           CONFIG_P_WRITEBACK_WIDTH = 0,
   parameter                           CONFIG_P_ROB_DEPTH = 0
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input [CONFIG_P_ISSUE_WIDTH:0]     rob_push_size,
   input [2*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_epu_opc_bus,
   input [7*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_lsu_opc_bus,
   input [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_bpu_upd,
   input [(CONFIG_AW-2 )*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_pc,
   input [5*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] rob_push_lrd,
   input [6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] rob_push_prd,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_prd_we,
   input [6*(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_pfree,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_is_bcc,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_is_brel,
   input [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] rob_push_is_breg,
   output                              rob_ready,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] rob_free_id,
   output [(1<<CONFIG_P_ISSUE_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] rob_free_bank, 
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] wb_valid,
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)*CONFIG_P_ROB_DEPTH-1:0] wb_rob_id,
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)*CONFIG_P_COMMIT_WIDTH-1:0] wb_rob_bank,
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] wb_fls,
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] wb_exc,
   input [CONFIG_DW*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] wb_opera,
   input [CONFIG_DW*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] wb_operb,
   input [(CONFIG_AW-2 )*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] wb_fls_tgt,
   output [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] wb_rob_ready,
   output [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_valid,
   output [2*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_epu_opc_bus,
   output [7*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_lsu_opc_bus,
   output [(2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_bpu_upd,
   output [(CONFIG_AW-2 )*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_pc,
   output [5*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_lrd,
   output [6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_prd,
   output [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_prd_we,
   output [6*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_pfree,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] cmt_is_bcc,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] cmt_is_brel,
   output [(1<<CONFIG_P_ISSUE_WIDTH)-1:0] cmt_is_breg,
   output [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_fls,
   output [(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_exc,
   output [CONFIG_DW*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_opera,
   output [CONFIG_DW*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_operb,
   output [(CONFIG_AW-2 )*(1<<CONFIG_P_COMMIT_WIDTH)-1:0] cmt_fls_tgt,
   input [CONFIG_P_COMMIT_WIDTH:0]     cmt_pop_size
);
   localparam CW                       = (1<<CONFIG_P_COMMIT_WIDTH);
   localparam WW                       = (1<<CONFIG_P_WRITEBACK_WIDTH);
   localparam ROB_DEPTH                = (1<<CONFIG_P_ROB_DEPTH);
   localparam uBANK_DW                 = (2 +
                                          7 +
                                          (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) +
                                          (CONFIG_AW-2 ) +
                                          5 +
                                          6 +
                                          1 +
                                          6 +
                                          1 +
                                          1 +
                                          1);
   localparam P_BANKS                  = (CONFIG_P_COMMIT_WIDTH);
   localparam BANKS                    = (1<<P_BANKS);
   localparam vBANK_DW                 = (CONFIG_DW +
                                          CONFIG_DW +
                                          (CONFIG_AW-2 ));
   wire [P_BANKS-1:0]                  head_ff, tail_ff;
   wire [P_BANKS-1:0]                  head_nxt, tail_nxt;
   wire [P_BANKS-1:0]                  head_l                        [CW-1:0];
   wire [P_BANKS-1:0]                  head_r                        [CW-1:0];
   wire [P_BANKS-1:0]                  tail_l                        [CW-1:0];
   wire [P_BANKS-1:0]                  tail_r                        [CW-1:0];
   wire [uBANK_DW-1:0]                 que_din_mux                   [BANKS-1:0];
   wire [uBANK_DW-1:0]                 que_din                       [BANKS-1:0];
   wire [uBANK_DW-1:0]                 que_dout                      [BANKS-1:0];
   wire                                que_valid                     [BANKS-1:0];
   wire [BANKS-1:0]                    que_ready;
   wire                                que_push                      [BANKS-1:0];
   wire                                que_pop                       [BANKS-1:0];
   reg                                 que_wb                        [BANKS-1:0];
   reg [CONFIG_P_ROB_DEPTH-1:0]        que_wb_id                     [BANKS-1:0];
   reg                                 que_wb_fls                    [BANKS-1:0];
   reg                                 que_wb_exc                    [BANKS-1:0];
   reg [vBANK_DW-1:0]                  que_wb_vbank                  [BANKS-1:0];
   wire [P_BANKS:0]                    pop_cnt_adapt;
   wire [CONFIG_P_ROB_DEPTH-1:0]       que_rptr                      [BANKS-1:0];
   wire [CONFIG_P_ROB_DEPTH-1:0]       que_wptr                      [BANKS-1:0];
   wire                                que_rdy                       [BANKS-1:0];
   wire                                que_fls                       [BANKS-1:0];
   wire                                que_exc                       [BANKS-1:0];
   wire [vBANK_DW-1:0]                 que_vbank                     [BANKS-1:0];
   wire [CW-1:0]                       ent_valid;
   reg [CW-1:0]                        cmt_valid_;
   reg [WW-1:0]                        wb_ready;
   genvar i, k;
   integer j;
   generate for(i=0;i<BANKS;i=i+1)
      begin : gen_ptr
         assign head_l[i]  = i[P_BANKS-1:0] + head_ff;
         assign head_r[i]  = i[P_BANKS-1:0] - head_ff;
         assign tail_l[i] = i[P_BANKS-1:0] + tail_ff;
         assign tail_r[i] = i[P_BANKS-1:0] - tail_ff;
      end
   endgenerate
   generate
      if (P_BANKS == CONFIG_P_ISSUE_WIDTH)
         assign pop_cnt_adapt = cmt_pop_size;
      else
         assign pop_cnt_adapt = {{P_BANKS-CONFIG_P_ISSUE_WIDTH{1'b0}}, cmt_pop_size};
   endgenerate
   generate for(i=0;i<BANKS;i=i+1)
      begin : gen_bank_ctrl
         assign que_din_mux[i] = {rob_push_epu_opc_bus[i * 2 +: 2],
                                    rob_push_lsu_opc_bus[i * 7 +: 7],
                                    rob_push_bpu_upd[i * (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) +: (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)],
                                    rob_push_pc[i * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )],
                                    rob_push_lrd[i * 5 +: 5],
                                    rob_push_prd[i * 6 +: 6],
                                    rob_push_prd_we[i],
                                    rob_push_pfree[i * 6 +: 6],
                                    rob_push_is_bcc[i],
                                    rob_push_is_brel[i],
                                    rob_push_is_breg[i]};
         assign que_din[i] = que_din_mux[tail_r[i]];
         assign que_pop[i]  = ({1'b0, head_r[i]} < pop_cnt_adapt);
         assign que_push[i] = ({1'b0, tail_r[i]} < rob_push_size);
      end
   endgenerate
   assign head_nxt = (head_ff + pop_cnt_adapt[P_BANKS-1:0]) & {P_BANKS{~flush}};
   assign tail_nxt = (tail_ff + rob_push_size[P_BANKS-1:0]) & {P_BANKS{~flush}};
   ysyx_210479_mDFF_r #(.DW(P_BANKS)) ff_head (.CLK(clk), .RST(rst), .D(head_nxt), .Q(head_ff) );
   ysyx_210479_mDFF_r #(.DW(P_BANKS)) ff_tail (.CLK(clk), .RST(rst), .D(tail_nxt), .Q(tail_ff) );
   generate for(i=0;i<BANKS;i=i+1)
      begin : gen_BANKS
         wire                       payload_re;
         wire [CONFIG_P_ROB_DEPTH-1:0] payload_raddr;
         wire [CONFIG_P_ROB_DEPTH-1:0] payload_waddr;
         wire [uBANK_DW-1:0]        payload_rdata;
         wire                       payload_we;
         wire [uBANK_DW-1:0]        payload_wdata;
         wire [ROB_DEPTH-1:0]       tag_rdy;
         wire [ROB_DEPTH-1:0]       tag_fls;
         wire [ROB_DEPTH-1:0]       tag_exc;
         wire [vBANK_DW*ROB_DEPTH-1:0] tag_vbank;
         wire [vBANK_DW-1:0]        tag_vbank_mux [ROB_DEPTH-1:0];
         ysyx_210479_fifo_fwft_ctrl_rp_wp
            #(
               .DW            (uBANK_DW),
               .DEPTH_WIDTH   (CONFIG_P_ROB_DEPTH)
            )
         U_FIFO_CTRL
            (
               .clk           (clk),
               .rst           (rst),
               .flush         (flush),
               .push          (que_push[i]),
               .din           (que_din[i]),
               .ready         (que_ready[i]),
               .pop           (que_pop[i]),
               .dout          (que_dout[i]),
               .valid         (que_valid[i]),
               .rptr          (que_rptr[i]),
               .wptr          (que_wptr[i]),
               .payload_re    (payload_re),
               .payload_raddr (payload_raddr),
               .payload_rdata (payload_rdata),
               .payload_we    (payload_we),
               .payload_waddr (payload_waddr),
               .payload_wdata (payload_wdata)
            );
         ysyx_210479_mRF_nwnr_r
            #(
               .DW (uBANK_DW),
               .AW (CONFIG_P_ROB_DEPTH),
               .NUM_READ   (1),
               .NUM_WRITE  (1)
            )
         U_uBANK
            (
               .CLK     (clk),
               .RST(rst),
               .RE      (payload_re),
               .RADDR   (payload_raddr),
               .RDATA   (payload_rdata),
               .WE      (payload_we),
               .WADDR   (payload_waddr),
               .WDATA   (payload_wdata)
            );
         ysyx_210479_mRF_nw_do_r
            #(
               .DW (1),
               .AW (CONFIG_P_ROB_DEPTH),
               .RST_VECTOR ({(1<<CONFIG_P_ROB_DEPTH){1'b0}}),
               .NUM_WRITE (2)
            )
         U_TAG_RDY
            (
               .CLK  (clk),
               .RST  (rst),
               .WE   ({que_wb[i], que_push[i]}),
               .WADDR ({que_wb_id[i], payload_waddr}),
               .WDATA ({1'b1, 1'b0}),
               .DO   (tag_rdy)
            );
         ysyx_210479_mRF_nw_do_r
            #(
               .DW (1),
               .AW (CONFIG_P_ROB_DEPTH),
               .RST_VECTOR ({(1<<CONFIG_P_ROB_DEPTH){1'b0}}),
               .NUM_WRITE (2)
            )
         U_TAG_FLS
            (
               .CLK  (clk),
               .RST  (rst),
               .WE   ({que_wb[i], que_push[i]}),
               .WADDR ({que_wb_id[i], payload_waddr}),
               .WDATA ({que_wb_fls[i], 1'b0}),
               .DO   (tag_fls)
            );
         ysyx_210479_mRF_nw_do_r
            #(
               .DW (1),
               .AW (CONFIG_P_ROB_DEPTH),
               .RST_VECTOR ({(1<<CONFIG_P_ROB_DEPTH){1'b0}}),
               .NUM_WRITE (2)
            )
         U_TAG_EXC
            (
               .CLK  (clk),
               .RST  (rst),
               .WE   ({que_wb[i], que_push[i]}),
               .WADDR ({que_wb_id[i], payload_waddr}),
               .WDATA ({que_wb_exc[i], 1'b0}),
               .DO   (tag_exc)
            );
         ysyx_210479_mRF_nw_do_r
            #(
               .DW (vBANK_DW),
               .AW (CONFIG_P_ROB_DEPTH),
               .NUM_WRITE (1)
            )
         U_vBANK
            (
               .CLK  (clk),
               .RST(rst),
               .WE   (que_wb[i]),
               .WADDR (que_wb_id[i]),
               .WDATA (que_wb_vbank[i]),
               .DO   (tag_vbank)
            );
         assign que_rdy[i] = tag_rdy[que_rptr[i]];
         assign que_fls[i] = tag_fls[que_rptr[i]];
         assign que_exc[i] = tag_exc[que_rptr[i]];
         for(k=0;k<ROB_DEPTH;k=k+1)
            begin : gen_tag_vbank_mux
               assign tag_vbank_mux[k] = tag_vbank[k * vBANK_DW +: vBANK_DW];
            end
         assign que_vbank[i] = tag_vbank_mux[que_rptr[i]];
      end
   endgenerate
   generate for(i=0;i<BANKS;i=i+1)
      begin : gen_que_wb
         always @(*)
            begin
               que_wb[i] = 1'b0;
               for(j=0;j<CW;j=j+1)
                  que_wb[i] = que_wb[i] | (wb_valid[j]&wb_ready[j] & (i==wb_rob_bank[j*CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH]));
            end
      end
   endgenerate
   generate for(i=0;i<BANKS;i=i+1)
      begin : gen_que_wb_din
         always @(*)
            begin : gen_wb_id_mux
               que_wb_id[i] = {CONFIG_P_ROB_DEPTH{1'b0}};
               que_wb_fls[i] = 1'b0;
               que_wb_exc[i] = 1'b0;
               que_wb_vbank[i] = {vBANK_DW{1'b0}};
               for(j=0;j<WW;j=j+1)
                  begin
                     que_wb_id[i] = que_wb_id[i] |
                                       ({CONFIG_P_ROB_DEPTH{wb_valid[j]&wb_ready[j] & (i==wb_rob_bank[j*CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH])}} &
                                       wb_rob_id[j*CONFIG_P_ROB_DEPTH +: CONFIG_P_ROB_DEPTH]);
                     que_wb_fls[i] = que_wb_fls[i] |
                                       (wb_valid[j]&wb_ready[j] & (i==wb_rob_bank[j*CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH]) &
                                       wb_fls[j]);
                     que_wb_exc[i] = que_wb_exc[i] |
                                       (wb_valid[j]&wb_ready[j] & (i==wb_rob_bank[j*CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH]) &
                                       wb_exc[j]);
                     que_wb_vbank[i] = que_wb_vbank[i] |
                                       ({vBANK_DW{wb_valid[j]&wb_ready[j] & (i==wb_rob_bank[j*CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH])}} &
                                       {wb_fls_tgt[j*(CONFIG_AW-2 ) +: (CONFIG_AW-2 )], wb_operb[j*CONFIG_DW +: CONFIG_DW], wb_opera[j*CONFIG_DW +: CONFIG_DW]});
                  end
            end
      end
   endgenerate
   generate for(i=0;i<WW;i=i+1)
      begin : gen_conflict_dec
         always @(*)
            begin
               wb_ready[i] = 'b1;
               for(j=0;j<i;j=j+1)
                  wb_ready[i] = wb_ready[i] & ~(wb_valid[j] &
                     (wb_rob_bank[i*CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH]==wb_rob_bank[j*CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH]));
            end
      end
   endgenerate
   assign wb_rob_ready = wb_ready;
   generate for(i=0;i<BANKS;i=i+1)
      begin : gen_rob_free
         assign rob_free_id[i*CONFIG_P_ROB_DEPTH +: CONFIG_P_ROB_DEPTH] = que_wptr[tail_l[i]];
         assign rob_free_bank[i*CONFIG_P_COMMIT_WIDTH +: CONFIG_P_COMMIT_WIDTH] = tail_l[i];
      end
   endgenerate
   generate for(i=0;i<CW;i=i+1)
      begin : gen_pop
         assign {cmt_epu_opc_bus[i * 2 +: 2],
                  cmt_lsu_opc_bus[i * 7 +: 7],
                  cmt_bpu_upd[i * (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1) +: (2 + CONFIG_PHT_P_NUM + CONFIG_BTB_P_NUM + 1 + (CONFIG_AW-2 ) + 1)],
                  cmt_pc[i * (CONFIG_AW-2 ) +: (CONFIG_AW-2 )],
                  cmt_lrd[i * 5 +: 5],
                  cmt_prd[i * 6 +: 6],
                  cmt_prd_we[i],
                  cmt_pfree[i * 6 +: 6],
                  cmt_is_bcc[i],
                  cmt_is_brel[i],
                  cmt_is_breg[i] } = que_dout[head_l[i]];
         assign cmt_fls[i] = que_fls[head_l[i]];
         assign cmt_exc[i] = que_exc[head_l[i]];
         assign {cmt_fls_tgt[i*(CONFIG_AW-2 ) +: (CONFIG_AW-2 )],
                  cmt_operb[i*CONFIG_DW +: CONFIG_DW],
                  cmt_opera[i*CONFIG_DW +: CONFIG_DW]} = que_vbank[head_l[i]];
         assign ent_valid[i] = (que_valid[head_l[i]] & que_rdy[head_l[i]]);
      end
   endgenerate
   always @(*)
      begin
         cmt_valid_[0] = ent_valid[0];
         for(j=1;j<CW;j=j+1)
            cmt_valid_[j] = cmt_valid_[j-1] & ent_valid[j];
      end
   assign cmt_valid = cmt_valid_;
   assign rob_ready = &que_ready;
endmodule
module ysyx_210479_wb_mux
#(
   parameter                           CONFIG_DW = 0,
   parameter                           CONFIG_P_WRITEBACK_WIDTH = 0
)
(
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WE_ex,
   input [6*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WADDR_ex,
   input [CONFIG_DW*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WDATA_ex,
   input                               prf_WE_lsu_epu,
   input [6-1:0]            prf_WADDR_lsu_epu,
   input [CONFIG_DW-1:0]               prf_WDATA_lsu_epu,
   input [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] wb_rob_ready,
   output [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] wb_ready,
   output [(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WE,
   output [6*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WADDR,
   output [CONFIG_DW*(1<<CONFIG_P_WRITEBACK_WIDTH)-1:0] prf_WDATA
);
   localparam WW                       = (1<<CONFIG_P_WRITEBACK_WIDTH);
   genvar i;
   assign wb_ready[0] = (~prf_WE_lsu_epu) & wb_rob_ready[0];
   assign prf_WE[0] = (prf_WE_lsu_epu) ? 1'b1 : prf_WE_ex[0];
   assign prf_WADDR[0*6 +: 6] = (prf_WE_lsu_epu)
                                                            ? prf_WADDR_lsu_epu
                                                            : prf_WADDR_ex[0*6 +: 6];
   assign prf_WDATA[0*CONFIG_DW +: CONFIG_DW] = (prf_WE_lsu_epu)
                                                      ? prf_WDATA_lsu_epu
                                                      : prf_WDATA_ex[0*CONFIG_DW +: CONFIG_DW];
   generate
      for(i=1;i<WW;i=i+1)
         begin : gen_bundle
            assign wb_ready[i] = wb_rob_ready[i];
            assign prf_WE[i] = prf_WE_ex[i];
            assign prf_WADDR[i*6 +: 6] = prf_WADDR_ex[i*6 +: 6];
            assign prf_WDATA[i*CONFIG_DW +: CONFIG_DW] = prf_WDATA_ex[i*CONFIG_DW +: CONFIG_DW];
         end
   endgenerate
endmodule
module ysyx_210479_mADD
#(
   parameter                           DW = 0
)
(
   input [DW-1:0]                      a,
   input [DW-1:0]                      b,
   input                               s,
   output [DW-1:0]                     sum
);
   wire                                ci;
   wire [DW-1:0]                       op2;
   assign op2 = (s) ? ~b : b;
   assign ci = (s);
   assign sum = a + op2 + {{DW-1{1'b0}}, ci};
endmodule
module ysyx_210479_mADD_c_o
#(
   parameter                           DW = 0
)
(
   input [DW-1:0]                      a,
   input [DW-1:0]                      b,
   input                               s,
   output [DW-1:0]                     sum,
   output                              carry,
   output                              overflow
);
   wire                                ci;
   wire [DW-1:0]                       op2;
   assign op2 = (s) ? ~b : b;
   assign ci = (s);
   assign {carry, sum} = a + op2 + {{DW-1{1'b0}}, ci};
   assign overflow = ((a[DW-1] == op2[DW-1]) &
                        (a[DW-1] ^ sum[DW-1]));
endmodule
module ysyx_210479_mDFF_lr # (
   parameter DW = 1, 
   parameter RST_VECTOR = {DW{1'b0}}
)
(
   input CLK,
   input RST,
   input LOAD,
   input [DW-1:0] D, 
   output reg [DW-1:0] Q 
);
   always @(posedge CLK) begin
      if (RST)
         Q <= RST_VECTOR;
      else if (LOAD)
         Q <= D;
   end
endmodule
module ysyx_210479_mDFF_r # (
   parameter DW = 1, 
   parameter RST_VECTOR = {DW{1'b0}}
)
(
   input CLK,
   input RST,
   input [DW-1:0] D, 
   output reg [DW-1:0] Q 
);
   always @(posedge CLK) begin
      if (RST)
         Q <= RST_VECTOR;
      else
         Q <= D;
   end
endmodule
module ysyx_210479_mRAM_s_s_be
#(
   parameter P_DW = 0,
   parameter AW = 0
)
(
   input CLK,
   input RST, 
   input [AW-1:0] ADDR,
   input RE,
   output [(1<<P_DW)-1:0] DOUT,
   input [(1<<P_DW)/8-1:0] WE,
   input [(1<<P_DW)-1:0] DIN
);
   localparam P_DW_BYTES = (P_DW-3);
   localparam SRAM_DW = 128;
   localparam SRAM_AW = 6;
   localparam SRAM_P_DW_BYTES = 4; 
   localparam WIN_P_NUM = (SRAM_P_DW_BYTES - P_DW_BYTES);
   localparam WIN_NUM = (1<<WIN_P_NUM);
   localparam WIN_DW = (1<<P_DW);
   wire [(1<<P_DW)-1:0] we_bmsk;
   wire [AW-1:0] re_addr_ff;
   wire [AW-1:0] addr_w;
   genvar i;
   ysyx_210479_mDFF_lr #(.DW(AW)) ff_re_addr (.CLK(CLK), .RST(RST), .LOAD(RE), .D(ADDR), .Q(re_addr_ff) );
   assign addr_w = (RE | (|WE)) ? ADDR : re_addr_ff;
   generate for(i=0;i<(1<<P_DW_BYTES);i=i+1)
      begin : gen_we_bmsk
         assign we_bmsk[i*8 +: 8] = {8{WE[i]}};
      end
   endgenerate
   generate
      if (((1<<P_DW) == SRAM_DW) && (AW == SRAM_AW))
         begin : gen_1
            S011HD1P_X32Y2D128_BW U_S011HD1P_X32Y2D128_BW
               (
                  .Q                      (DOUT),
                  .CLK                    (CLK),
                  .CEN                    (1'b0),     
                  .WEN                    (~|WE),     
                  .BWEN                   (~we_bmsk), 
                  .A                      (addr_w),
                  .D                      (DIN)
               );
         end
      else if (((1<<P_DW) < SRAM_DW) && ((AW-(SRAM_P_DW_BYTES - P_DW_BYTES)) == SRAM_AW))
         begin : gen_2
            wire [SRAM_DW-1:0] sram_q;
            wire [SRAM_DW-1:0] sram_bwen;
            wire [SRAM_DW-1:0] sram_d;
            wire [WIN_DW-1:0] DOUT_win [WIN_NUM-1:0];
            for(i=0;i<WIN_NUM;i=i+1)
               begin : gen_addr_enc
                  assign sram_bwen[i*WIN_DW +: WIN_DW] = (we_bmsk & {WIN_DW{addr_w[WIN_P_NUM-1:0] == i}});
                  assign sram_d[i*WIN_DW +: WIN_DW] = DIN;
               end
            S011HD1P_X32Y2D128_BW S011HD1P_X32Y2D128_BW
               (
                  .Q                      (sram_q),
                  .CLK                    (CLK),
                  .CEN                    (1'b0),        
                  .WEN                    (~|WE),        
                  .BWEN                   (~sram_bwen),  
                  .A                      (addr_w[WIN_P_NUM +: SRAM_AW]),
                  .D                      (sram_d)
               );
            for(i=0;i<WIN_NUM;i=i+1)
               begin : gen_addr_dec
                  assign DOUT_win[i] = sram_q[i*WIN_DW +: WIN_DW];
               end
            assign DOUT = DOUT_win[re_addr_ff[WIN_P_NUM-1:0]];
         end
   endgenerate
endmodule
module ysyx_210479_mRF_1wr_r
#(
   parameter DW = 1,
   parameter AW = 0,
   parameter [DW*(1<<AW)-1:0] RST_VECTOR = {DW*(1<<AW){1'b0}}
)
(
   input CLK,
   input RST,
   input [AW-1:0] ADDR,
   input RE,
   output [DW-1:0] RDATA,
   input WE,
   input [DW-1:0] WDATA
);
   reg [DW-1:0] regfile [(1<<AW)-1:0];
   reg [DW-1:0] ff_dout;
   integer j;
   always @(posedge CLK) begin
      if (RST)
         begin
            for(j=0;j<(1<<AW);j=j+1)
               regfile[j] <= RST_VECTOR[j*DW +: DW];
            ff_dout <= {DW{1'b0}};
         end
      else
         begin
            if (WE)
               regfile[ADDR] <= WDATA;
            if (RE)
               ff_dout <= regfile[ADDR];
         end
   end
   assign RDATA = ff_dout;
endmodule
module ysyx_210479_mRF_nw_dio_r
#(
   parameter DW = 1,
   parameter AW = 0,
   parameter [DW*(1<<AW)-1:0] RST_VECTOR = {DW*(1<<AW){1'b0}},
   parameter NUM_WRITE = 0
)
(
   input CLK,
   input RST,
   input [NUM_WRITE-1:0] WE,
   input [AW*NUM_WRITE-1:0] WADDR,
   input [DW*NUM_WRITE-1:0] WDATA,
   input REP,
   input [DW*(1<<AW)-1:0] DI,
   output [DW*(1<<AW)-1:0] DO
);
   reg [DW-1:0] regfile [(1<<AW)-1:0];
   genvar i;
   integer j;
   always @(posedge CLK) begin
      if (RST)
         begin
            for(j=0;j<(1<<AW);j=j+1)
               regfile[j] <= RST_VECTOR[j*DW +: DW];
         end
      else if (REP)
         begin
            for(j=0;j<(1<<AW);j=j+1)
               regfile[j] <= DI[j * DW +: DW];
         end
      else
         for(j=0;j<NUM_WRITE;j=j+1) 
            if (WE[j])
               regfile[WADDR[j*AW +: AW]] <= WDATA[j*DW +: DW];
   end
   generate for(i=0;i<(1<<AW);i=i+1)
      begin : gen_do
         assign DO[i * DW +: DW] = regfile[i];
      end
   endgenerate
endmodule
module ysyx_210479_mRF_nw_do_r
#(
   parameter DW = 1,
   parameter AW = 0,
   parameter [DW*(1<<AW)-1:0] RST_VECTOR = {DW*(1<<AW){1'b0}},
   parameter NUM_WRITE = 0
)
(
   input CLK,
   input RST,
   input [NUM_WRITE-1:0] WE,
   input [AW*NUM_WRITE-1:0] WADDR,
   input [DW*NUM_WRITE-1:0] WDATA,
   output [DW*(1<<AW)-1:0] DO
);
   reg [DW-1:0] regfile [(1<<AW)-1:0];
   genvar i;
   integer j;
   always @(posedge CLK) begin
      if (RST)
         begin
            for(j=0;j<(1<<AW);j=j+1)
               regfile[j] <= RST_VECTOR[j*DW +: DW];
         end
      else
         for(j=0;j<NUM_WRITE;j=j+1) 
            if (WE[j])
               regfile[WADDR[j*AW +: AW]] <= WDATA[j*DW +: DW];
   end
   generate for(i=0;i<(1<<AW);i=i+1)
      begin : gen_do
         assign DO[i * DW +: DW] = regfile[i];
      end
   endgenerate
endmodule
module ysyx_210479_mRF_nwnr_r
#(
   parameter DW = 1,
   parameter AW = 0,
   parameter NUM_READ = 0,
   parameter NUM_WRITE = 0,
   parameter [DW*(1<<AW)-1:0] RST_VECTOR = {DW*(1<<AW){1'b0}}
)
(
   input CLK,
   input RST,
   input [NUM_READ-1:0] RE,
   input [NUM_READ*AW-1:0] RADDR,
   output [NUM_READ*DW-1:0] RDATA,
   input [NUM_WRITE-1:0] WE,
   input [AW*NUM_WRITE-1:0] WADDR,
   input [DW*NUM_WRITE-1:0] WDATA
);
   reg [DW-1:0] regfile [(1<<AW)-1:0];
   reg [DW-1:0] ff_dout [NUM_READ-1:0];
   genvar i;
   integer j;
   always @(posedge CLK) begin
      if (RST)
         for(j=0;j<(1<<AW);j=j+1)
            regfile[j] <= RST_VECTOR[j*DW +: DW];
      else
         for(j=0;j<NUM_WRITE;j=j+1) 
            if (WE[j])
               regfile[WADDR[j*AW +: AW]] <= WDATA[j*DW +: DW];
   end
   generate for(i=0;i<NUM_READ;i=i+1)
      begin : gen_rdata
   always @(posedge CLK) begin
      if (RST)
         ff_dout[i] <= {DW{1'b0}};
      else
         if (RE[i])
            ff_dout[i] <= regfile[RADDR[i*AW +: AW]];
   end
         assign RDATA[i*DW +: DW] = ff_dout[i];
      end
   endgenerate
endmodule
module ysyx_210479_align_r
#(
   parameter                           IN_P_DW_BYTES = 0,
   parameter                           IN_AW = 0,
   parameter                           OUT_P_DW_BYTES = 0
)
(
   input [(1<<IN_P_DW_BYTES)*8-1:0]    i_dat,
   input [(1<<IN_P_DW_BYTES)-1:0]      i_be,
   input [IN_AW-1:0]                   i_addr,
   output [(1<<OUT_P_DW_BYTES)-1:0]    o_be,
   output [(1<<OUT_P_DW_BYTES)*8-1:0]  o_dat
);
   localparam IN_BYTES                 = (1<<IN_P_DW_BYTES);
   localparam OUT_BYTES                = (1<<OUT_P_DW_BYTES);
   localparam WIN_NUM                  = (OUT_P_DW_BYTES < IN_P_DW_BYTES) ? (IN_BYTES/OUT_BYTES)               : (OUT_BYTES/IN_BYTES);
   localparam WIN_P_NUM                = (OUT_P_DW_BYTES < IN_P_DW_BYTES) ? (IN_P_DW_BYTES - OUT_P_DW_BYTES)   : (OUT_P_DW_BYTES - IN_P_DW_BYTES);
   localparam WIN_DW                   = (OUT_P_DW_BYTES < IN_P_DW_BYTES) ? (OUT_BYTES*8)                      : (IN_BYTES*8);
   localparam WIN_P_DW_BYTES           = (OUT_P_DW_BYTES < IN_P_DW_BYTES) ? (OUT_P_DW_BYTES)                   : (IN_P_DW_BYTES);
   genvar i;
   generate
      if (OUT_P_DW_BYTES == IN_P_DW_BYTES)
         begin : gen_1
            assign o_dat = i_dat;
            assign o_be = i_be;
         end
      else if (OUT_P_DW_BYTES < IN_P_DW_BYTES)
         begin : gen_2
            wire [WIN_DW-1:0] rdat_win [WIN_NUM-1:0];
            wire [WIN_DW/8-1:0] rbe_win [WIN_NUM-1:0];
            for(i=0;i<WIN_NUM;i=i+1)
               begin : gen_r
                  assign rdat_win[i] = i_dat[i*WIN_DW +: WIN_DW];
                  assign rbe_win[i] = i_be[i*(WIN_DW/8) +: WIN_DW/8];
               end
            assign o_dat = rdat_win[i_addr[WIN_P_DW_BYTES +: WIN_P_NUM]];
            assign o_be = rbe_win[i_addr[WIN_P_DW_BYTES +: WIN_P_NUM]];
         end
      else
         begin : gen_3
            for(i=0;i<WIN_NUM;i=i+1)
               begin : gen_o
                  assign o_be[i*(WIN_DW/8) +: (WIN_DW/8)] = {(WIN_DW/8){i_addr[WIN_P_DW_BYTES +: WIN_P_NUM] == i}} & i_be;
                  assign o_dat[i*WIN_DW +: WIN_DW] = i_dat;
               end
            end
      endgenerate
endmodule
module ysyx_210479_align_w
#(
   parameter                           IN_P_DW_BYTES = 0,
   parameter                           OUT_P_DW_BYTES = 0,
   parameter                           IN_AW = 0
)
(
   input [(1<<OUT_P_DW_BYTES)*8-1:0]   i_dat,
   input [(1<<OUT_P_DW_BYTES)-1:0]     i_be,
   input [IN_AW-1:0]                   i_addr,
   output [(1<<IN_P_DW_BYTES)-1:0]     o_be,
   output [(1<<IN_P_DW_BYTES)*8-1:0]   o_out_wdat
);
   localparam IN_BYTES                 = (1<<IN_P_DW_BYTES);
   localparam OUT_BYTES                = (1<<OUT_P_DW_BYTES);
   localparam WIN_NUM                  = (OUT_P_DW_BYTES <= IN_P_DW_BYTES) ? (IN_BYTES/OUT_BYTES)              : (OUT_BYTES/IN_BYTES);
   localparam WIN_P_NUM                = (OUT_P_DW_BYTES <= IN_P_DW_BYTES) ? (IN_P_DW_BYTES - OUT_P_DW_BYTES)  : (OUT_P_DW_BYTES - IN_P_DW_BYTES);
   localparam WIN_DW                   = (OUT_P_DW_BYTES <= IN_P_DW_BYTES) ? (OUT_BYTES*8)                     : (IN_BYTES*8);
   localparam WIN_P_DW_BYTES           = (OUT_P_DW_BYTES <= IN_P_DW_BYTES) ? (OUT_P_DW_BYTES)                  : (IN_P_DW_BYTES);
   genvar i;
   generate
      if (OUT_P_DW_BYTES == IN_P_DW_BYTES)
         begin : gen_1
            assign o_be = i_be;
            assign o_out_wdat = i_dat;
         end
      else if (OUT_P_DW_BYTES <= IN_P_DW_BYTES)
         begin : gen_2
            for(i=0;i<WIN_NUM;i=i+1)
               begin : gen_o
                  assign o_be[i*(WIN_DW/8) +: (WIN_DW/8)] = ({(WIN_DW/8){i_addr[WIN_P_DW_BYTES +: WIN_P_NUM] == i}} & i_be);
                  assign o_out_wdat[i*WIN_DW +: WIN_DW] = i_dat;
               end
         end
      else
         begin : gen_3
            wire [WIN_DW-1:0] i_axi_din_win [WIN_NUM-1:0];
            wire [WIN_DW/8-1:0] i_be_win [WIN_NUM-1:0];
            for(i=0;i<WIN_NUM;i=i+1)
               begin : gen_i
                  assign i_axi_din_win[i] = i_dat[i*WIN_DW +: WIN_DW];
                  assign i_be_win[i] = i_be[i*(WIN_DW/8) +: (WIN_DW/8)];
               end
            assign o_be = i_be_win[i_addr[WIN_P_DW_BYTES +: WIN_P_NUM]];
            assign o_out_wdat = i_axi_din_win[i_addr[WIN_P_DW_BYTES +: WIN_P_NUM]];
         end
   endgenerate
endmodule
module ysyx_210479_fifo_fwft
#(
   parameter DW = 8, 
   parameter DEPTH_WIDTH = 4 
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input                               push,
   input [DW-1:0]                      din,
   output                              ready,
   input                               pop,
   output [DW-1:0]                     dout,
   output                              valid
);
   wire [DEPTH_WIDTH-1:0] payload_raddr;        
   wire                 payload_re;             
   wire [DEPTH_WIDTH-1:0] payload_waddr;        
   wire [DW-1:0]        payload_wdata;          
   wire                 payload_we;             
   wire [DW-1:0]        payload_rdata;          
   ysyx_210479_fifo_fwft_ctrl
      #(
        .DW                             (DW),
        .DEPTH_WIDTH                    (DEPTH_WIDTH))
   U_CTRL
      (
       .ready                           (ready),
       .dout                            (dout[DW-1:0]),
       .valid                           (valid),
       .payload_re                      (payload_re),
       .payload_raddr                   (payload_raddr[DEPTH_WIDTH-1:0]),
       .payload_we                      (payload_we),
       .payload_waddr                   (payload_waddr[DEPTH_WIDTH-1:0]),
       .payload_wdata                   (payload_wdata[DW-1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .flush                           (flush),
       .push                            (push),
       .din                             (din[DW-1:0]),
       .pop                             (pop),
       .payload_rdata                   (payload_rdata[DW-1:0]));
   ysyx_210479_mRF_nwnr_r
      #(
         .DW (DW),
         .AW (DEPTH_WIDTH),
         .NUM_READ   (1),
         .NUM_WRITE  (1)
      )
   U_RF
      (
         .CLK     (clk),
         .RST(rst),
         .RE      (payload_re),
         .RADDR   (payload_raddr),
         .RDATA   (payload_rdata),
         .WE      (payload_we),
         .WADDR   (payload_waddr),
         .WDATA   (payload_wdata)
      );
endmodule
module ysyx_210479_fifo_fwft_ctrl
#(
   parameter DW = 8, 
   parameter DEPTH_WIDTH = 4 
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input                               push,
   input [DW-1:0]                      din,
   output                              ready,
   input                               pop,
   output [DW-1:0]                     dout,
   output                              valid,
   output                              payload_re,
   output [DEPTH_WIDTH-1:0]            payload_raddr,
   input [DW-1:0]                      payload_rdata,
   output                              payload_we,
   output [DEPTH_WIDTH-1:0]            payload_waddr,
   output [DW-1:0]                     payload_wdata
);
   wire [DEPTH_WIDTH:0]                ff_w_ptr;
   wire [DEPTH_WIDTH:0]                w_ptr_nxt;
   wire [DEPTH_WIDTH:0]                ff_r_ptr;
   wire [DEPTH_WIDTH:0]                r_ptr_nxt;
   wire [DW-1:0]                       rf_dout, rf_dout_byp;
   wire                                state_r;
   wire                                fwft_nxt;
   wire                                clr_state;
   wire [DW-1:0]                       dat_r, din_r;
   wire                                rf_conflict;
   wire                                rf_bypass;
   assign w_ptr_nxt = (ff_w_ptr + 1'd1) & {DEPTH_WIDTH+1{~flush}};
   assign r_ptr_nxt = (ff_r_ptr + 1'd1) & {DEPTH_WIDTH+1{~flush}};
   ysyx_210479_mDFF_lr #(.DW(DEPTH_WIDTH + 1)) ff_w_ptr_r (.CLK(clk), .RST(rst), .LOAD(push|flush), .D(w_ptr_nxt), .Q(ff_w_ptr) );
   ysyx_210479_mDFF_lr #(.DW(DEPTH_WIDTH + 1)) ff_r_ptr_r (.CLK(clk), .RST(rst), .LOAD(pop|flush), .D(r_ptr_nxt), .Q(ff_r_ptr) );
   assign ready = (ff_w_ptr[DEPTH_WIDTH] == ff_r_ptr[DEPTH_WIDTH]) |
                  (ff_w_ptr[DEPTH_WIDTH-1:0] != ff_r_ptr[DEPTH_WIDTH-1:0]); 
   assign valid = (ff_w_ptr != ff_r_ptr); 
   assign fwft_nxt = (~state_r & ~valid & push);
   assign clr_state = (state_r & pop);
   ysyx_210479_mDFF_lr #(.DW(DW)) ff_dat (.CLK(clk), .RST(rst), .LOAD(fwft_nxt), .D(din), .Q(dat_r) );
   ysyx_210479_mDFF_lr #(.DW(DW)) ff_din (.CLK(clk), .RST(rst), .LOAD(pop), .D(din), .Q(din_r) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_state (.CLK(clk),.RST(rst), .LOAD(fwft_nxt|clr_state|flush), .D((fwft_nxt|~clr_state) & ~flush), .Q(state_r) );
   assign dout = state_r ? dat_r : rf_dout_byp;
   assign payload_re = pop;
   assign payload_raddr = r_ptr_nxt[DEPTH_WIDTH-1:0];
   assign rf_dout = payload_rdata;
   assign payload_we = push;
   assign payload_waddr = ff_w_ptr[DEPTH_WIDTH-1:0];
   assign payload_wdata = din;
   assign rf_conflict = ((ff_w_ptr[DEPTH_WIDTH-1:0] == r_ptr_nxt[DEPTH_WIDTH-1:0]) & push & pop);
   ysyx_210479_mDFF_lr #(.DW(1)) ff_bypass (.CLK(clk), .RST(rst), .LOAD(rf_conflict | pop), .D(rf_conflict | ~pop), .Q(rf_bypass) );
   assign rf_dout_byp = rf_bypass ? din_r : rf_dout;
endmodule
module ysyx_210479_fifo_fwft_ctrl_rp_wp
#(
   parameter DW = 8, 
   parameter DEPTH_WIDTH = 4 
)
(
   input                               clk,
   input                               rst,
   input                               flush,
   input                               push,
   input [DW-1:0]                      din,
   output                              ready,
   input                               pop,
   output [DW-1:0]                     dout,
   output                              valid,
   output [DEPTH_WIDTH-1:0]            rptr,
   output [DEPTH_WIDTH-1:0]            wptr,
   output                              payload_re,
   output [DEPTH_WIDTH-1:0]            payload_raddr,
   input [DW-1:0]                      payload_rdata,
   output                              payload_we,
   output [DEPTH_WIDTH-1:0]            payload_waddr,
   output [DW-1:0]                     payload_wdata
);
   wire [DEPTH_WIDTH:0]                ff_w_ptr;
   wire [DEPTH_WIDTH:0]                w_ptr_nxt;
   wire [DEPTH_WIDTH:0]                ff_r_ptr;
   wire [DEPTH_WIDTH:0]                r_ptr_nxt;
   wire [DW-1:0]                       rf_dout, rf_dout_byp;
   wire                                state_r;
   wire                                fwft_nxt;
   wire                                clr_state;
   wire [DW-1:0]                       dat_r, din_r;
   wire                                rf_conflict;
   wire                                rf_bypass;
   assign w_ptr_nxt = (ff_w_ptr + 1'd1) & {DEPTH_WIDTH+1{~flush}};
   assign r_ptr_nxt = (ff_r_ptr + 1'd1) & {DEPTH_WIDTH+1{~flush}};
   ysyx_210479_mDFF_lr #(.DW(DEPTH_WIDTH + 1)) ff_w_ptr_r (.CLK(clk), .RST(rst), .LOAD(push|flush), .D(w_ptr_nxt), .Q(ff_w_ptr) );
   ysyx_210479_mDFF_lr #(.DW(DEPTH_WIDTH + 1)) ff_r_ptr_r (.CLK(clk), .RST(rst), .LOAD(pop|flush), .D(r_ptr_nxt), .Q(ff_r_ptr) );
   assign ready = (ff_w_ptr[DEPTH_WIDTH] == ff_r_ptr[DEPTH_WIDTH]) |
                  (ff_w_ptr[DEPTH_WIDTH-1:0] != ff_r_ptr[DEPTH_WIDTH-1:0]); 
   assign valid = (ff_w_ptr != ff_r_ptr); 
   assign fwft_nxt = (~state_r & ~valid & push);
   assign clr_state = (state_r & pop);
   ysyx_210479_mDFF_lr #(.DW(DW)) ff_dat (.CLK(clk), .RST(rst), .LOAD(fwft_nxt), .D(din), .Q(dat_r) );
   ysyx_210479_mDFF_lr #(.DW(DW)) ff_din (.CLK(clk), .RST(rst), .LOAD(pop), .D(din), .Q(din_r) );
   ysyx_210479_mDFF_lr #(.DW(1)) ff_state (.CLK(clk),.RST(rst), .LOAD(fwft_nxt|clr_state|flush), .D((fwft_nxt|~clr_state) & ~flush), .Q(state_r) );
   assign dout = state_r ? dat_r : rf_dout_byp;
   assign payload_re = pop;
   assign payload_raddr = r_ptr_nxt[DEPTH_WIDTH-1:0];
   assign rf_dout = payload_rdata;
   assign payload_we = push;
   assign payload_waddr = ff_w_ptr[DEPTH_WIDTH-1:0];
   assign payload_wdata = din;
   assign rf_conflict = ((ff_w_ptr[DEPTH_WIDTH-1:0] == r_ptr_nxt[DEPTH_WIDTH-1:0]) & push & pop);
   ysyx_210479_mDFF_lr #(.DW(1)) ff_bypass (.CLK(clk), .RST(rst), .LOAD(rf_conflict | pop), .D(rf_conflict | ~pop), .Q(rf_bypass) );
   assign rf_dout_byp = rf_bypass ? din_r : rf_dout;
   assign rptr = ff_r_ptr[DEPTH_WIDTH-1:0];
   assign wptr = ff_w_ptr[DEPTH_WIDTH-1:0];
endmodule
module ysyx_210479_hds_buf
#(
   parameter BYPASS = 1
)
(
   input clk,
   input rst,
   input flush,
   input A_en,    
   input AVALID,
   output AREADY,
   input B_en,    
   output BVALID,
   input BREADY,
   output p_ce
);
   wire push, pop;
   wire pending;
   wire valid_nxt;
   assign push = (AVALID & AREADY);
   assign pop = (BVALID & BREADY);
   assign valid_nxt = (push | ~pop) & ~flush;
   ysyx_210479_mDFF_lr #(.DW(1)) ff_pending (.CLK(clk),.RST(rst), .LOAD(push | pop | flush), .D(valid_nxt), .Q(pending) );
   assign BVALID = B_en & pending;
   generate
      if (BYPASS)
         assign AREADY = A_en & (~pending | pop);
      else
         assign AREADY = A_en & (~pending);
   endgenerate
   assign p_ce = push;
endmodule
module ysyx_210479_mul_booth
#(
   parameter DW = 8
)
(
   input                               clk,
   input                               rst,
   input [DW-1:0]                      ina,
   input [DW-1:0]                      inb,
   input                               in_valid,
   output                              in_ready,
   output [DW*2-1:0]                   out,
   output                              out_valid,
   input                               out_ready
);
endmodule
module ysyx_210479_pmux
#(
   parameter SELW = 0,
   parameter DW = 0
)
(
   input [SELW-1:0] sel,
   input [DW*SELW-1:0] din,
   output reg [DW-1:0] dout
);
   generate
      if (SELW==2)
         begin : gen_enc_2
            always @(*)
                begin
                    casez(sel)
                       2'b?1: dout = din[0*DW +: DW];
                       2'b10: dout = din[1*DW +: DW];
                       default: begin dout = din[0 +: DW]; end
                    endcase
                end
         end
      else
      if (SELW==3)
         begin : gen_enc_3
            always @(*)
                begin
                    casez(sel)
                       3'b??1: dout = din[0*DW +: DW];
                       3'b?10: dout = din[1*DW +: DW];
                       3'b100: dout = din[2*DW +: DW];
                       default: begin dout = din[0 +: DW]; end
                    endcase
                end
         end
      else
      if (SELW==4)
         begin : gen_enc_4
            always @(*)
                begin
                    casez(sel)
                       4'b???1: dout = din[0*DW +: DW];
                       4'b??10: dout = din[1*DW +: DW];
                       4'b?100: dout = din[2*DW +: DW];
                       4'b1000: dout = din[3*DW +: DW];
                       default: begin dout = din[0 +: DW]; end
                    endcase
                end
         end
      else
      if (SELW==5)
         begin : gen_enc_5
            always @(*)
                begin
                    casez(sel)
                       5'b????1: dout = din[0*DW +: DW];
                       5'b???10: dout = din[1*DW +: DW];
                       5'b??100: dout = din[2*DW +: DW];
                       5'b?1000: dout = din[3*DW +: DW];
                       5'b10000: dout = din[4*DW +: DW];
                       default: begin dout = din[0 +: DW]; end
                    endcase
                end
         end
      else
      if (SELW==6)
         begin : gen_enc_6
            always @(*)
                begin
                    casez(sel)
                       6'b?????1: dout = din[0*DW +: DW];
                       6'b????10: dout = din[1*DW +: DW];
                       6'b???100: dout = din[2*DW +: DW];
                       6'b??1000: dout = din[3*DW +: DW];
                       6'b?10000: dout = din[4*DW +: DW];
                       6'b100000: dout = din[5*DW +: DW];
                       default: begin dout = din[0 +: DW]; end
                    endcase
                end
         end
      else
      if (SELW==7)
         begin : gen_enc_7
            always @(*)
                begin
                    casez(sel)
                       7'b??????1: dout = din[0*DW +: DW];
                       7'b?????10: dout = din[1*DW +: DW];
                       7'b????100: dout = din[2*DW +: DW];
                       7'b???1000: dout = din[3*DW +: DW];
                       7'b??10000: dout = din[4*DW +: DW];
                       7'b?100000: dout = din[5*DW +: DW];
                       7'b1000000: dout = din[6*DW +: DW];
                       default: begin dout = din[0 +: DW]; end
                    endcase
                end
         end
      else
      if (SELW==8)
         begin : gen_enc_8
            always @(*)
                begin
                    casez(sel)
                       8'b???????1: dout = din[0*DW +: DW];
                       8'b??????10: dout = din[1*DW +: DW];
                       8'b?????100: dout = din[2*DW +: DW];
                       8'b????1000: dout = din[3*DW +: DW];
                       8'b???10000: dout = din[4*DW +: DW];
                       8'b??100000: dout = din[5*DW +: DW];
                       8'b?1000000: dout = din[6*DW +: DW];
                       8'b10000000: dout = din[7*DW +: DW];
                       default: begin dout = din[0 +: DW]; end
                    endcase
                end
         end
      else
      if (SELW==9)
         begin : gen_enc_9
            always @(*)
                begin
                    casez(sel)
                       9'b????????1: dout = din[0*DW +: DW];
                       9'b???????10: dout = din[1*DW +: DW];
                       9'b??????100: dout = din[2*DW +: DW];
                       9'b?????1000: dout = din[3*DW +: DW];
                       9'b????10000: dout = din[4*DW +: DW];
                       9'b???100000: dout = din[5*DW +: DW];
                       9'b??1000000: dout = din[6*DW +: DW];
                       9'b?10000000: dout = din[7*DW +: DW];
                       9'b100000000: dout = din[8*DW +: DW];
                       default: begin dout = din[0 +: DW]; end
                    endcase
                end
         end
    endgenerate
endmodule
module ysyx_210479_pmux_v
#(
   parameter SELW = 0,
   parameter DW = 0
)
(
   input [SELW-1:0] sel,
   input [DW*SELW-1:0] din,
   output reg [DW-1:0] dout
   , output reg valid
);
   generate
      if (SELW==2)
         begin : gen_enc_2
            always @(*)
                begin
                    valid = 1'b1;
                    casez(sel)
                       2'b?1: dout = din[0*DW +: DW];
                       2'b10: dout = din[1*DW +: DW];
                       default: begin dout = din[0 +: DW]; valid = 1'b0; end
                    endcase
                end
         end
      else
      if (SELW==3)
         begin : gen_enc_3
            always @(*)
                begin
                    valid = 1'b1;
                    casez(sel)
                       3'b??1: dout = din[0*DW +: DW];
                       3'b?10: dout = din[1*DW +: DW];
                       3'b100: dout = din[2*DW +: DW];
                       default: begin dout = din[0 +: DW]; valid = 1'b0; end
                    endcase
                end
         end
      else
      if (SELW==4)
         begin : gen_enc_4
            always @(*)
                begin
                    valid = 1'b1;
                    casez(sel)
                       4'b???1: dout = din[0*DW +: DW];
                       4'b??10: dout = din[1*DW +: DW];
                       4'b?100: dout = din[2*DW +: DW];
                       4'b1000: dout = din[3*DW +: DW];
                       default: begin dout = din[0 +: DW]; valid = 1'b0; end
                    endcase
                end
         end
      else
      if (SELW==5)
         begin : gen_enc_5
            always @(*)
                begin
                    valid = 1'b1;
                    casez(sel)
                       5'b????1: dout = din[0*DW +: DW];
                       5'b???10: dout = din[1*DW +: DW];
                       5'b??100: dout = din[2*DW +: DW];
                       5'b?1000: dout = din[3*DW +: DW];
                       5'b10000: dout = din[4*DW +: DW];
                       default: begin dout = din[0 +: DW]; valid = 1'b0; end
                    endcase
                end
         end
      else
      if (SELW==6)
         begin : gen_enc_6
            always @(*)
                begin
                    valid = 1'b1;
                    casez(sel)
                       6'b?????1: dout = din[0*DW +: DW];
                       6'b????10: dout = din[1*DW +: DW];
                       6'b???100: dout = din[2*DW +: DW];
                       6'b??1000: dout = din[3*DW +: DW];
                       6'b?10000: dout = din[4*DW +: DW];
                       6'b100000: dout = din[5*DW +: DW];
                       default: begin dout = din[0 +: DW]; valid = 1'b0; end
                    endcase
                end
         end
      else
      if (SELW==7)
         begin : gen_enc_7
            always @(*)
                begin
                    valid = 1'b1;
                    casez(sel)
                       7'b??????1: dout = din[0*DW +: DW];
                       7'b?????10: dout = din[1*DW +: DW];
                       7'b????100: dout = din[2*DW +: DW];
                       7'b???1000: dout = din[3*DW +: DW];
                       7'b??10000: dout = din[4*DW +: DW];
                       7'b?100000: dout = din[5*DW +: DW];
                       7'b1000000: dout = din[6*DW +: DW];
                       default: begin dout = din[0 +: DW]; valid = 1'b0; end
                    endcase
                end
         end
      else
      if (SELW==8)
         begin : gen_enc_8
            always @(*)
                begin
                    valid = 1'b1;
                    casez(sel)
                       8'b???????1: dout = din[0*DW +: DW];
                       8'b??????10: dout = din[1*DW +: DW];
                       8'b?????100: dout = din[2*DW +: DW];
                       8'b????1000: dout = din[3*DW +: DW];
                       8'b???10000: dout = din[4*DW +: DW];
                       8'b??100000: dout = din[5*DW +: DW];
                       8'b?1000000: dout = din[6*DW +: DW];
                       8'b10000000: dout = din[7*DW +: DW];
                       default: begin dout = din[0 +: DW]; valid = 1'b0; end
                    endcase
                end
         end
      else
      if (SELW==9)
         begin : gen_enc_9
            always @(*)
                begin
                    valid = 1'b1;
                    casez(sel)
                       9'b????????1: dout = din[0*DW +: DW];
                       9'b???????10: dout = din[1*DW +: DW];
                       9'b??????100: dout = din[2*DW +: DW];
                       9'b?????1000: dout = din[3*DW +: DW];
                       9'b????10000: dout = din[4*DW +: DW];
                       9'b???100000: dout = din[5*DW +: DW];
                       9'b??1000000: dout = din[6*DW +: DW];
                       9'b?10000000: dout = din[7*DW +: DW];
                       9'b100000000: dout = din[8*DW +: DW];
                       default: begin dout = din[0 +: DW]; valid = 1'b0; end
                    endcase
                end
         end
    endgenerate
endmodule
module ysyx_210479_popcnt
#(
   parameter DW = 0,
   parameter P_DW = 0 
)
(
   input [DW-1:0] bitmap,
   output reg [P_DW:0] count
);
   integer j;
   always @(*)
      begin
         count = {P_DW+1{1'b0}};
         for(j=0;j<(1<<P_DW);j=j+1)
            count = count + {{P_DW{1'b0}}, bitmap[j]};
      end
endmodule
module ysyx_210479_priority_encoder_gs
#(
   parameter P_DW = 0
)
(
   input [(1<<P_DW)-1:0] din,
   output reg [P_DW-1:0] dout
   , output reg gs
);
   generate
      if (P_DW==1)
            begin : gen_enc_1
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       2'b?1: dout = 1'd0;
                       2'b10: dout = 1'd1;
                       default: begin gs = 1'b0; dout = 1'd0; end
                    endcase
                end
        end
      else if (P_DW==2)
            begin : gen_enc_2
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       4'b???1: dout = 2'd0;
                       4'b??10: dout = 2'd1;
                       4'b?100: dout = 2'd2;
                       4'b1000: dout = 2'd3;
                       default: begin gs = 1'b0; dout = 2'd0; end
                    endcase
                end
        end
      else if (P_DW==3)
            begin : gen_enc_3
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       8'b???????1: dout = 3'd0;
                       8'b??????10: dout = 3'd1;
                       8'b?????100: dout = 3'd2;
                       8'b????1000: dout = 3'd3;
                       8'b???10000: dout = 3'd4;
                       8'b??100000: dout = 3'd5;
                       8'b?1000000: dout = 3'd6;
                       8'b10000000: dout = 3'd7;
                       default: begin gs = 1'b0; dout = 3'd0; end
                    endcase
                end
        end
      else if (P_DW==4)
            begin : gen_enc_4
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       16'b???????????????1: dout = 4'd0;
                       16'b??????????????10: dout = 4'd1;
                       16'b?????????????100: dout = 4'd2;
                       16'b????????????1000: dout = 4'd3;
                       16'b???????????10000: dout = 4'd4;
                       16'b??????????100000: dout = 4'd5;
                       16'b?????????1000000: dout = 4'd6;
                       16'b????????10000000: dout = 4'd7;
                       16'b???????100000000: dout = 4'd8;
                       16'b??????1000000000: dout = 4'd9;
                       16'b?????10000000000: dout = 4'd10;
                       16'b????100000000000: dout = 4'd11;
                       16'b???1000000000000: dout = 4'd12;
                       16'b??10000000000000: dout = 4'd13;
                       16'b?100000000000000: dout = 4'd14;
                       16'b1000000000000000: dout = 4'd15;
                       default: begin gs = 1'b0; dout = 4'd0; end
                    endcase
                end
        end
      else if (P_DW==5)
            begin : gen_enc_5
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       32'b???????????????????????????????1: dout = 5'd0;
                       32'b??????????????????????????????10: dout = 5'd1;
                       32'b?????????????????????????????100: dout = 5'd2;
                       32'b????????????????????????????1000: dout = 5'd3;
                       32'b???????????????????????????10000: dout = 5'd4;
                       32'b??????????????????????????100000: dout = 5'd5;
                       32'b?????????????????????????1000000: dout = 5'd6;
                       32'b????????????????????????10000000: dout = 5'd7;
                       32'b???????????????????????100000000: dout = 5'd8;
                       32'b??????????????????????1000000000: dout = 5'd9;
                       32'b?????????????????????10000000000: dout = 5'd10;
                       32'b????????????????????100000000000: dout = 5'd11;
                       32'b???????????????????1000000000000: dout = 5'd12;
                       32'b??????????????????10000000000000: dout = 5'd13;
                       32'b?????????????????100000000000000: dout = 5'd14;
                       32'b????????????????1000000000000000: dout = 5'd15;
                       32'b???????????????10000000000000000: dout = 5'd16;
                       32'b??????????????100000000000000000: dout = 5'd17;
                       32'b?????????????1000000000000000000: dout = 5'd18;
                       32'b????????????10000000000000000000: dout = 5'd19;
                       32'b???????????100000000000000000000: dout = 5'd20;
                       32'b??????????1000000000000000000000: dout = 5'd21;
                       32'b?????????10000000000000000000000: dout = 5'd22;
                       32'b????????100000000000000000000000: dout = 5'd23;
                       32'b???????1000000000000000000000000: dout = 5'd24;
                       32'b??????10000000000000000000000000: dout = 5'd25;
                       32'b?????100000000000000000000000000: dout = 5'd26;
                       32'b????1000000000000000000000000000: dout = 5'd27;
                       32'b???10000000000000000000000000000: dout = 5'd28;
                       32'b??100000000000000000000000000000: dout = 5'd29;
                       32'b?1000000000000000000000000000000: dout = 5'd30;
                       32'b10000000000000000000000000000000: dout = 5'd31;
                       default: begin gs = 1'b0; dout = 5'd0; end
                    endcase
                end
        end
      else if (P_DW==6)
            begin : gen_enc_6
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       64'b???????????????????????????????????????????????????????????????1: dout = 6'd0;
                       64'b??????????????????????????????????????????????????????????????10: dout = 6'd1;
                       64'b?????????????????????????????????????????????????????????????100: dout = 6'd2;
                       64'b????????????????????????????????????????????????????????????1000: dout = 6'd3;
                       64'b???????????????????????????????????????????????????????????10000: dout = 6'd4;
                       64'b??????????????????????????????????????????????????????????100000: dout = 6'd5;
                       64'b?????????????????????????????????????????????????????????1000000: dout = 6'd6;
                       64'b????????????????????????????????????????????????????????10000000: dout = 6'd7;
                       64'b???????????????????????????????????????????????????????100000000: dout = 6'd8;
                       64'b??????????????????????????????????????????????????????1000000000: dout = 6'd9;
                       64'b?????????????????????????????????????????????????????10000000000: dout = 6'd10;
                       64'b????????????????????????????????????????????????????100000000000: dout = 6'd11;
                       64'b???????????????????????????????????????????????????1000000000000: dout = 6'd12;
                       64'b??????????????????????????????????????????????????10000000000000: dout = 6'd13;
                       64'b?????????????????????????????????????????????????100000000000000: dout = 6'd14;
                       64'b????????????????????????????????????????????????1000000000000000: dout = 6'd15;
                       64'b???????????????????????????????????????????????10000000000000000: dout = 6'd16;
                       64'b??????????????????????????????????????????????100000000000000000: dout = 6'd17;
                       64'b?????????????????????????????????????????????1000000000000000000: dout = 6'd18;
                       64'b????????????????????????????????????????????10000000000000000000: dout = 6'd19;
                       64'b???????????????????????????????????????????100000000000000000000: dout = 6'd20;
                       64'b??????????????????????????????????????????1000000000000000000000: dout = 6'd21;
                       64'b?????????????????????????????????????????10000000000000000000000: dout = 6'd22;
                       64'b????????????????????????????????????????100000000000000000000000: dout = 6'd23;
                       64'b???????????????????????????????????????1000000000000000000000000: dout = 6'd24;
                       64'b??????????????????????????????????????10000000000000000000000000: dout = 6'd25;
                       64'b?????????????????????????????????????100000000000000000000000000: dout = 6'd26;
                       64'b????????????????????????????????????1000000000000000000000000000: dout = 6'd27;
                       64'b???????????????????????????????????10000000000000000000000000000: dout = 6'd28;
                       64'b??????????????????????????????????100000000000000000000000000000: dout = 6'd29;
                       64'b?????????????????????????????????1000000000000000000000000000000: dout = 6'd30;
                       64'b????????????????????????????????10000000000000000000000000000000: dout = 6'd31;
                       64'b???????????????????????????????100000000000000000000000000000000: dout = 6'd32;
                       64'b??????????????????????????????1000000000000000000000000000000000: dout = 6'd33;
                       64'b?????????????????????????????10000000000000000000000000000000000: dout = 6'd34;
                       64'b????????????????????????????100000000000000000000000000000000000: dout = 6'd35;
                       64'b???????????????????????????1000000000000000000000000000000000000: dout = 6'd36;
                       64'b??????????????????????????10000000000000000000000000000000000000: dout = 6'd37;
                       64'b?????????????????????????100000000000000000000000000000000000000: dout = 6'd38;
                       64'b????????????????????????1000000000000000000000000000000000000000: dout = 6'd39;
                       64'b???????????????????????10000000000000000000000000000000000000000: dout = 6'd40;
                       64'b??????????????????????100000000000000000000000000000000000000000: dout = 6'd41;
                       64'b?????????????????????1000000000000000000000000000000000000000000: dout = 6'd42;
                       64'b????????????????????10000000000000000000000000000000000000000000: dout = 6'd43;
                       64'b???????????????????100000000000000000000000000000000000000000000: dout = 6'd44;
                       64'b??????????????????1000000000000000000000000000000000000000000000: dout = 6'd45;
                       64'b?????????????????10000000000000000000000000000000000000000000000: dout = 6'd46;
                       64'b????????????????100000000000000000000000000000000000000000000000: dout = 6'd47;
                       64'b???????????????1000000000000000000000000000000000000000000000000: dout = 6'd48;
                       64'b??????????????10000000000000000000000000000000000000000000000000: dout = 6'd49;
                       64'b?????????????100000000000000000000000000000000000000000000000000: dout = 6'd50;
                       64'b????????????1000000000000000000000000000000000000000000000000000: dout = 6'd51;
                       64'b???????????10000000000000000000000000000000000000000000000000000: dout = 6'd52;
                       64'b??????????100000000000000000000000000000000000000000000000000000: dout = 6'd53;
                       64'b?????????1000000000000000000000000000000000000000000000000000000: dout = 6'd54;
                       64'b????????10000000000000000000000000000000000000000000000000000000: dout = 6'd55;
                       64'b???????100000000000000000000000000000000000000000000000000000000: dout = 6'd56;
                       64'b??????1000000000000000000000000000000000000000000000000000000000: dout = 6'd57;
                       64'b?????10000000000000000000000000000000000000000000000000000000000: dout = 6'd58;
                       64'b????100000000000000000000000000000000000000000000000000000000000: dout = 6'd59;
                       64'b???1000000000000000000000000000000000000000000000000000000000000: dout = 6'd60;
                       64'b??10000000000000000000000000000000000000000000000000000000000000: dout = 6'd61;
                       64'b?100000000000000000000000000000000000000000000000000000000000000: dout = 6'd62;
                       64'b1000000000000000000000000000000000000000000000000000000000000000: dout = 6'd63;
                       default: begin gs = 1'b0; dout = 6'd0; end
                    endcase
                end
        end
    endgenerate
endmodule
module ysyx_210479_priority_encoder_rev_gs
#(
   parameter P_DW = 0
)
(
   input [(1<<P_DW)-1:0] din,
   output reg [P_DW-1:0] dout
   , output reg gs
);
   generate
      if (P_DW==1)
            begin : gen_enc_1
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       2'b?1: dout = 1'd1;
                       2'b10: dout = 1'd0;
                       default: begin gs = 1'b0; dout = 1'd0; end
                    endcase
                end
        end
      else if (P_DW==2)
            begin : gen_enc_2
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       4'b???1: dout = 2'd3;
                       4'b??10: dout = 2'd2;
                       4'b?100: dout = 2'd1;
                       4'b1000: dout = 2'd0;
                       default: begin gs = 1'b0; dout = 2'd0; end
                    endcase
                end
        end
      else if (P_DW==3)
            begin : gen_enc_3
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       8'b???????1: dout = 3'd7;
                       8'b??????10: dout = 3'd6;
                       8'b?????100: dout = 3'd5;
                       8'b????1000: dout = 3'd4;
                       8'b???10000: dout = 3'd3;
                       8'b??100000: dout = 3'd2;
                       8'b?1000000: dout = 3'd1;
                       8'b10000000: dout = 3'd0;
                       default: begin gs = 1'b0; dout = 3'd0; end
                    endcase
                end
        end
      else if (P_DW==4)
            begin : gen_enc_4
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       16'b???????????????1: dout = 4'd15;
                       16'b??????????????10: dout = 4'd14;
                       16'b?????????????100: dout = 4'd13;
                       16'b????????????1000: dout = 4'd12;
                       16'b???????????10000: dout = 4'd11;
                       16'b??????????100000: dout = 4'd10;
                       16'b?????????1000000: dout = 4'd9;
                       16'b????????10000000: dout = 4'd8;
                       16'b???????100000000: dout = 4'd7;
                       16'b??????1000000000: dout = 4'd6;
                       16'b?????10000000000: dout = 4'd5;
                       16'b????100000000000: dout = 4'd4;
                       16'b???1000000000000: dout = 4'd3;
                       16'b??10000000000000: dout = 4'd2;
                       16'b?100000000000000: dout = 4'd1;
                       16'b1000000000000000: dout = 4'd0;
                       default: begin gs = 1'b0; dout = 4'd0; end
                    endcase
                end
        end
      else if (P_DW==5)
            begin : gen_enc_5
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       32'b???????????????????????????????1: dout = 5'd31;
                       32'b??????????????????????????????10: dout = 5'd30;
                       32'b?????????????????????????????100: dout = 5'd29;
                       32'b????????????????????????????1000: dout = 5'd28;
                       32'b???????????????????????????10000: dout = 5'd27;
                       32'b??????????????????????????100000: dout = 5'd26;
                       32'b?????????????????????????1000000: dout = 5'd25;
                       32'b????????????????????????10000000: dout = 5'd24;
                       32'b???????????????????????100000000: dout = 5'd23;
                       32'b??????????????????????1000000000: dout = 5'd22;
                       32'b?????????????????????10000000000: dout = 5'd21;
                       32'b????????????????????100000000000: dout = 5'd20;
                       32'b???????????????????1000000000000: dout = 5'd19;
                       32'b??????????????????10000000000000: dout = 5'd18;
                       32'b?????????????????100000000000000: dout = 5'd17;
                       32'b????????????????1000000000000000: dout = 5'd16;
                       32'b???????????????10000000000000000: dout = 5'd15;
                       32'b??????????????100000000000000000: dout = 5'd14;
                       32'b?????????????1000000000000000000: dout = 5'd13;
                       32'b????????????10000000000000000000: dout = 5'd12;
                       32'b???????????100000000000000000000: dout = 5'd11;
                       32'b??????????1000000000000000000000: dout = 5'd10;
                       32'b?????????10000000000000000000000: dout = 5'd9;
                       32'b????????100000000000000000000000: dout = 5'd8;
                       32'b???????1000000000000000000000000: dout = 5'd7;
                       32'b??????10000000000000000000000000: dout = 5'd6;
                       32'b?????100000000000000000000000000: dout = 5'd5;
                       32'b????1000000000000000000000000000: dout = 5'd4;
                       32'b???10000000000000000000000000000: dout = 5'd3;
                       32'b??100000000000000000000000000000: dout = 5'd2;
                       32'b?1000000000000000000000000000000: dout = 5'd1;
                       32'b10000000000000000000000000000000: dout = 5'd0;
                       default: begin gs = 1'b0; dout = 5'd0; end
                    endcase
                end
        end
      else if (P_DW==6)
            begin : gen_enc_6
                always @(*)
                    begin
gs = 1'b1;
                        casez(din)
                       64'b???????????????????????????????????????????????????????????????1: dout = 6'd63;
                       64'b??????????????????????????????????????????????????????????????10: dout = 6'd62;
                       64'b?????????????????????????????????????????????????????????????100: dout = 6'd61;
                       64'b????????????????????????????????????????????????????????????1000: dout = 6'd60;
                       64'b???????????????????????????????????????????????????????????10000: dout = 6'd59;
                       64'b??????????????????????????????????????????????????????????100000: dout = 6'd58;
                       64'b?????????????????????????????????????????????????????????1000000: dout = 6'd57;
                       64'b????????????????????????????????????????????????????????10000000: dout = 6'd56;
                       64'b???????????????????????????????????????????????????????100000000: dout = 6'd55;
                       64'b??????????????????????????????????????????????????????1000000000: dout = 6'd54;
                       64'b?????????????????????????????????????????????????????10000000000: dout = 6'd53;
                       64'b????????????????????????????????????????????????????100000000000: dout = 6'd52;
                       64'b???????????????????????????????????????????????????1000000000000: dout = 6'd51;
                       64'b??????????????????????????????????????????????????10000000000000: dout = 6'd50;
                       64'b?????????????????????????????????????????????????100000000000000: dout = 6'd49;
                       64'b????????????????????????????????????????????????1000000000000000: dout = 6'd48;
                       64'b???????????????????????????????????????????????10000000000000000: dout = 6'd47;
                       64'b??????????????????????????????????????????????100000000000000000: dout = 6'd46;
                       64'b?????????????????????????????????????????????1000000000000000000: dout = 6'd45;
                       64'b????????????????????????????????????????????10000000000000000000: dout = 6'd44;
                       64'b???????????????????????????????????????????100000000000000000000: dout = 6'd43;
                       64'b??????????????????????????????????????????1000000000000000000000: dout = 6'd42;
                       64'b?????????????????????????????????????????10000000000000000000000: dout = 6'd41;
                       64'b????????????????????????????????????????100000000000000000000000: dout = 6'd40;
                       64'b???????????????????????????????????????1000000000000000000000000: dout = 6'd39;
                       64'b??????????????????????????????????????10000000000000000000000000: dout = 6'd38;
                       64'b?????????????????????????????????????100000000000000000000000000: dout = 6'd37;
                       64'b????????????????????????????????????1000000000000000000000000000: dout = 6'd36;
                       64'b???????????????????????????????????10000000000000000000000000000: dout = 6'd35;
                       64'b??????????????????????????????????100000000000000000000000000000: dout = 6'd34;
                       64'b?????????????????????????????????1000000000000000000000000000000: dout = 6'd33;
                       64'b????????????????????????????????10000000000000000000000000000000: dout = 6'd32;
                       64'b???????????????????????????????100000000000000000000000000000000: dout = 6'd31;
                       64'b??????????????????????????????1000000000000000000000000000000000: dout = 6'd30;
                       64'b?????????????????????????????10000000000000000000000000000000000: dout = 6'd29;
                       64'b????????????????????????????100000000000000000000000000000000000: dout = 6'd28;
                       64'b???????????????????????????1000000000000000000000000000000000000: dout = 6'd27;
                       64'b??????????????????????????10000000000000000000000000000000000000: dout = 6'd26;
                       64'b?????????????????????????100000000000000000000000000000000000000: dout = 6'd25;
                       64'b????????????????????????1000000000000000000000000000000000000000: dout = 6'd24;
                       64'b???????????????????????10000000000000000000000000000000000000000: dout = 6'd23;
                       64'b??????????????????????100000000000000000000000000000000000000000: dout = 6'd22;
                       64'b?????????????????????1000000000000000000000000000000000000000000: dout = 6'd21;
                       64'b????????????????????10000000000000000000000000000000000000000000: dout = 6'd20;
                       64'b???????????????????100000000000000000000000000000000000000000000: dout = 6'd19;
                       64'b??????????????????1000000000000000000000000000000000000000000000: dout = 6'd18;
                       64'b?????????????????10000000000000000000000000000000000000000000000: dout = 6'd17;
                       64'b????????????????100000000000000000000000000000000000000000000000: dout = 6'd16;
                       64'b???????????????1000000000000000000000000000000000000000000000000: dout = 6'd15;
                       64'b??????????????10000000000000000000000000000000000000000000000000: dout = 6'd14;
                       64'b?????????????100000000000000000000000000000000000000000000000000: dout = 6'd13;
                       64'b????????????1000000000000000000000000000000000000000000000000000: dout = 6'd12;
                       64'b???????????10000000000000000000000000000000000000000000000000000: dout = 6'd11;
                       64'b??????????100000000000000000000000000000000000000000000000000000: dout = 6'd10;
                       64'b?????????1000000000000000000000000000000000000000000000000000000: dout = 6'd9;
                       64'b????????10000000000000000000000000000000000000000000000000000000: dout = 6'd8;
                       64'b???????100000000000000000000000000000000000000000000000000000000: dout = 6'd7;
                       64'b??????1000000000000000000000000000000000000000000000000000000000: dout = 6'd6;
                       64'b?????10000000000000000000000000000000000000000000000000000000000: dout = 6'd5;
                       64'b????100000000000000000000000000000000000000000000000000000000000: dout = 6'd4;
                       64'b???1000000000000000000000000000000000000000000000000000000000000: dout = 6'd3;
                       64'b??10000000000000000000000000000000000000000000000000000000000000: dout = 6'd2;
                       64'b?100000000000000000000000000000000000000000000000000000000000000: dout = 6'd1;
                       64'b1000000000000000000000000000000000000000000000000000000000000000: dout = 6'd0;
                       default: begin gs = 1'b0; dout = 6'd0; end
                    endcase
                end
        end
    endgenerate
endmodule
module ysyx_210479_rte64_gs
(
   input [63:0] din,
   output [5:0] dout,
   output gs
);
   wire leaf_dout [31:0];
   wire leaf_gs [31:0];
   wire [1:0] n1_dout [15:0];
   wire n1_gs [15:0];
   wire [2:0] n2_dout [7:0];
   wire n2_gs [7:0];
   wire [3:0] n3_dout [3:0];
   wire n3_gs [3:0];
   wire [4:0] n4_dout [1:0];
   wire n4_gs [1:0];
   genvar i;
   generate
      for(i=0;i<32;i=i+1)
         begin : gen_leaf
            assign leaf_dout[i] = (~din[2*i] & din[2*i+1]);
            assign leaf_gs[i] = (din[2*i] | din[2*i+1]);
         end
   endgenerate
   generate
      for(i=0;i<16;i=i+1)
         begin : gen_n1
            assign n1_dout[i] = leaf_gs[2*i] ? {1'b0, leaf_dout[2*i]} : {leaf_gs[2*i+1], leaf_dout[2*i+1]};
            assign n1_gs[i] = (leaf_gs[2*i] | leaf_gs[2*i+1]);
         end
   endgenerate
   generate
      for(i=0;i<8;i=i+1)
         begin : gen_n2
            assign n2_dout[i] = n1_gs[2*i] ? {1'b0, n1_dout[2*i]} : {n1_gs[2*i+1], n1_dout[2*i+1]};
            assign n2_gs[i] = (n1_gs[2*i] | n1_gs[2*i+1]);
         end
   endgenerate
   generate
      for(i=0;i<4;i=i+1)
         begin : gen_n3
            assign n3_dout[i] = n2_gs[2*i] ? {1'b0, n2_dout[2*i]} : {n2_gs[2*i+1], n2_dout[2*i+1]};
            assign n3_gs[i] = (n2_gs[2*i] | n2_gs[2*i+1]);
         end
   endgenerate
   generate
      for(i=0;i<2;i=i+1)
         begin : gen_n4
            assign n4_dout[i] = n3_gs[2*i] ? {1'b0, n3_dout[2*i]} : {n3_gs[2*i+1], n3_dout[2*i+1]};
            assign n4_gs[i] = (n3_gs[2*i] | n3_gs[2*i+1]);
         end
   endgenerate
   assign dout = n4_gs[0] ? {1'b0, n4_dout[0]} : {n4_gs[1], n4_dout[1]};
   assign gs = (n4_gs[0] | n4_gs[1]);
endmodule
module ysyx_210479_axi4_arbiter
#(
   parameter AXI_P_DW_BYTES  = 0,
   parameter AXI_ADDR_WIDTH = 0,
   parameter AXI_ID_WIDTH = 0,
   parameter AXI_USER_WIDTH = 0
)
(
   input                               clk,
   input                               rst,
   output                              s0_ARREADY,
   input                               s0_ARVALID,
   input [AXI_ADDR_WIDTH-1:0]          s0_ARADDR,
   input [2:0]                         s0_ARPROT,
   input [AXI_ID_WIDTH-1:0]            s0_ARID,
   input [AXI_USER_WIDTH-1:0]          s0_ARUSER,
   input [7:0]                         s0_ARLEN,
   input [2:0]                         s0_ARSIZE,
   input [1:0]                         s0_ARBURST,
   input                               s0_ARLOCK,
   input [3:0]                         s0_ARCACHE,
   input [3:0]                         s0_ARQOS,
   input [3:0]                         s0_ARREGION,
   input                               s0_RREADY,
   output                              s0_RVALID,
   output  [(1<<AXI_P_DW_BYTES)*8-1:0] s0_RDATA,
   output  [1:0]                       s0_RRESP,
   output                              s0_RLAST,
   output  [AXI_ID_WIDTH-1:0]          s0_RID,
   output  [AXI_USER_WIDTH-1:0]        s0_RUSER,
   output                              s0_AWREADY,
   input                               s0_AWVALID,
   input [AXI_ADDR_WIDTH-1:0]          s0_AWADDR,
   input [2:0]                         s0_AWPROT,
   input [AXI_ID_WIDTH-1:0]            s0_AWID,
   input [AXI_USER_WIDTH-1:0]          s0_AWUSER,
   input [7:0]                         s0_AWLEN,
   input [2:0]                         s0_AWSIZE,
   input [1:0]                         s0_AWBURST,
   input                               s0_AWLOCK,
   input [3:0]                         s0_AWCACHE,
   input [3:0]                         s0_AWQOS,
   input [3:0]                         s0_AWREGION,
   output                              s0_WREADY,
   input                               s0_WVALID,
   input [(1<<AXI_P_DW_BYTES)*8-1:0]   s0_WDATA,
   input [(1<<AXI_P_DW_BYTES)-1:0]     s0_WSTRB,
   input                               s0_WLAST,
   input [AXI_USER_WIDTH-1:0]          s0_WUSER,
   input                               s0_BREADY,
   output                              s0_BVALID,
   output [1:0]                        s0_BRESP,
   output [AXI_ID_WIDTH-1:0]           s0_BID,
   output [AXI_USER_WIDTH-1:0]         s0_BUSER,
   output                              s1_ARREADY,
   input                               s1_ARVALID,
   input [AXI_ADDR_WIDTH-1:0]          s1_ARADDR,
   input [2:0]                         s1_ARPROT,
   input [AXI_ID_WIDTH-1:0]            s1_ARID,
   input [AXI_USER_WIDTH-1:0]          s1_ARUSER,
   input [7:0]                         s1_ARLEN,
   input [2:0]                         s1_ARSIZE,
   input [1:0]                         s1_ARBURST,
   input                               s1_ARLOCK,
   input [3:0]                         s1_ARCACHE,
   input [3:0]                         s1_ARQOS,
   input [3:0]                         s1_ARREGION,
   input                               s1_RREADY,
   output                              s1_RVALID,
   output  [(1<<AXI_P_DW_BYTES)*8-1:0] s1_RDATA,
   output  [1:0]                       s1_RRESP,
   output                              s1_RLAST,
   output  [AXI_ID_WIDTH-1:0]          s1_RID,
   output  [AXI_USER_WIDTH-1:0]        s1_RUSER,
   output                              s1_AWREADY,
   input                               s1_AWVALID,
   input [AXI_ADDR_WIDTH-1:0]          s1_AWADDR,
   input [2:0]                         s1_AWPROT,
   input [AXI_ID_WIDTH-1:0]            s1_AWID,
   input [AXI_USER_WIDTH-1:0]          s1_AWUSER,
   input [7:0]                         s1_AWLEN,
   input [2:0]                         s1_AWSIZE,
   input [1:0]                         s1_AWBURST,
   input                               s1_AWLOCK,
   input [3:0]                         s1_AWCACHE,
   input [3:0]                         s1_AWQOS,
   input [3:0]                         s1_AWREGION,
   output                              s1_WREADY,
   input                               s1_WVALID,
   input [(1<<AXI_P_DW_BYTES)*8-1:0]   s1_WDATA,
   input [(1<<AXI_P_DW_BYTES)-1:0]     s1_WSTRB,
   input                               s1_WLAST,
   input [AXI_USER_WIDTH-1:0]          s1_WUSER,
   input                               s1_BREADY,
   output                              s1_BVALID,
   output [1:0]                        s1_BRESP,
   output [AXI_ID_WIDTH-1:0]           s1_BID,
   output [AXI_USER_WIDTH-1:0]         s1_BUSER,
   input                               m_ARREADY,
   output                              m_ARVALID,
   output [AXI_ADDR_WIDTH-1:0]         m_ARADDR,
   output [2:0]                        m_ARPROT,
   output [AXI_ID_WIDTH-1:0]           m_ARID,
   output [AXI_USER_WIDTH-1:0]         m_ARUSER,
   output [7:0]                        m_ARLEN,
   output [2:0]                        m_ARSIZE,
   output [1:0]                        m_ARBURST,
   output                              m_ARLOCK,
   output [3:0]                        m_ARCACHE,
   output [3:0]                        m_ARQOS,
   output [3:0]                        m_ARREGION,
   output                              m_RREADY,
   input                               m_RVALID,
   input  [(1<<AXI_P_DW_BYTES)*8-1:0]  m_RDATA,
   input  [1:0]                        m_RRESP,
   input                               m_RLAST,
   input  [AXI_ID_WIDTH-1:0]           m_RID,
   input  [AXI_USER_WIDTH-1:0]         m_RUSER,
   input                               m_AWREADY,
   output                              m_AWVALID,
   output [AXI_ADDR_WIDTH-1:0]         m_AWADDR,
   output [2:0]                        m_AWPROT,
   output [AXI_ID_WIDTH-1:0]           m_AWID,
   output [AXI_USER_WIDTH-1:0]         m_AWUSER,
   output [7:0]                        m_AWLEN,
   output [2:0]                        m_AWSIZE,
   output [1:0]                        m_AWBURST,
   output                              m_AWLOCK,
   output [3:0]                        m_AWCACHE,
   output [3:0]                        m_AWQOS,
   output [3:0]                        m_AWREGION,
   input                               m_WREADY,
   output                              m_WVALID,
   output [(1<<AXI_P_DW_BYTES)*8-1:0]  m_WDATA,
   output [(1<<AXI_P_DW_BYTES)-1:0]    m_WSTRB,
   output                              m_WLAST,
   output [AXI_USER_WIDTH-1:0]         m_WUSER,
   output                              m_BREADY,
   input                               m_BVALID,
   input [1:0]                         m_BRESP,
   input [AXI_ID_WIDTH-1:0]            m_BID,
   input [AXI_USER_WIDTH-1:0]          m_BUSER
);
   wire [1:0]           m_RGRNT;                
   wire [1:0]           m_WGRNT;                
   ysyx_210479_axi4_arbiter_r U_ARBITER_R
      (
       .m_RGRNT                         (m_RGRNT[1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .s0_ARVALID                      (s0_ARVALID),
       .s0_RREADY                       (s0_RREADY),
       .s1_ARVALID                      (s1_ARVALID),
       .s1_RREADY                       (s1_RREADY),
       .m_RVALID                        (m_RVALID),
       .m_RLAST                         (m_RLAST));
   ysyx_210479_axi4_arbiter_w U_ARBITER_W
      (
       .m_WGRNT                         (m_WGRNT[1:0]),
       .clk                             (clk),
       .rst                             (rst),
       .s0_AWVALID                      (s0_AWVALID),
       .s0_BREADY                       (s0_BREADY),
       .s1_AWVALID                      (s1_AWVALID),
       .s1_BREADY                       (s1_BREADY),
       .m_BVALID                        (m_BVALID));
   ysyx_210479_axi4_mux_r
      #(
        .AXI_P_DW_BYTES                 (AXI_P_DW_BYTES),
        .AXI_ADDR_WIDTH                 (AXI_ADDR_WIDTH),
        .AXI_ID_WIDTH                   (AXI_ID_WIDTH),
        .AXI_USER_WIDTH                 (AXI_USER_WIDTH))
   U_MUX_R
      (
       .s0_ARREADY                      (s0_ARREADY),
       .s0_RVALID                       (s0_RVALID),
       .s0_RDATA                        (s0_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .s0_RRESP                        (s0_RRESP[1:0]),
       .s0_RLAST                        (s0_RLAST),
       .s0_RID                          (s0_RID[AXI_ID_WIDTH-1:0]),
       .s0_RUSER                        (s0_RUSER[AXI_USER_WIDTH-1:0]),
       .s1_ARREADY                      (s1_ARREADY),
       .s1_RVALID                       (s1_RVALID),
       .s1_RDATA                        (s1_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .s1_RRESP                        (s1_RRESP[1:0]),
       .s1_RLAST                        (s1_RLAST),
       .s1_RID                          (s1_RID[AXI_ID_WIDTH-1:0]),
       .s1_RUSER                        (s1_RUSER[AXI_USER_WIDTH-1:0]),
       .m_ARVALID                       (m_ARVALID),
       .m_ARADDR                        (m_ARADDR[AXI_ADDR_WIDTH-1:0]),
       .m_ARPROT                        (m_ARPROT[2:0]),
       .m_ARID                          (m_ARID[AXI_ID_WIDTH-1:0]),
       .m_ARUSER                        (m_ARUSER[AXI_USER_WIDTH-1:0]),
       .m_ARLEN                         (m_ARLEN[7:0]),
       .m_ARSIZE                        (m_ARSIZE[2:0]),
       .m_ARBURST                       (m_ARBURST[1:0]),
       .m_ARLOCK                        (m_ARLOCK),
       .m_ARCACHE                       (m_ARCACHE[3:0]),
       .m_ARQOS                         (m_ARQOS[3:0]),
       .m_ARREGION                      (m_ARREGION[3:0]),
       .m_RREADY                        (m_RREADY),
       .m_RGRNT                         (m_RGRNT[1:0]),
       .s0_ARVALID                      (s0_ARVALID),
       .s0_ARADDR                       (s0_ARADDR[AXI_ADDR_WIDTH-1:0]),
       .s0_ARPROT                       (s0_ARPROT[2:0]),
       .s0_ARID                         (s0_ARID[AXI_ID_WIDTH-1:0]),
       .s0_ARUSER                       (s0_ARUSER[AXI_USER_WIDTH-1:0]),
       .s0_ARLEN                        (s0_ARLEN[7:0]),
       .s0_ARSIZE                       (s0_ARSIZE[2:0]),
       .s0_ARBURST                      (s0_ARBURST[1:0]),
       .s0_ARLOCK                       (s0_ARLOCK),
       .s0_ARCACHE                      (s0_ARCACHE[3:0]),
       .s0_ARQOS                        (s0_ARQOS[3:0]),
       .s0_ARREGION                     (s0_ARREGION[3:0]),
       .s0_RREADY                       (s0_RREADY),
       .s1_ARVALID                      (s1_ARVALID),
       .s1_ARADDR                       (s1_ARADDR[AXI_ADDR_WIDTH-1:0]),
       .s1_ARPROT                       (s1_ARPROT[2:0]),
       .s1_ARID                         (s1_ARID[AXI_ID_WIDTH-1:0]),
       .s1_ARUSER                       (s1_ARUSER[AXI_USER_WIDTH-1:0]),
       .s1_ARLEN                        (s1_ARLEN[7:0]),
       .s1_ARSIZE                       (s1_ARSIZE[2:0]),
       .s1_ARBURST                      (s1_ARBURST[1:0]),
       .s1_ARLOCK                       (s1_ARLOCK),
       .s1_ARCACHE                      (s1_ARCACHE[3:0]),
       .s1_ARQOS                        (s1_ARQOS[3:0]),
       .s1_ARREGION                     (s1_ARREGION[3:0]),
       .s1_RREADY                       (s1_RREADY),
       .m_ARREADY                       (m_ARREADY),
       .m_RVALID                        (m_RVALID),
       .m_RDATA                         (m_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .m_RRESP                         (m_RRESP[1:0]),
       .m_RLAST                         (m_RLAST),
       .m_RID                           (m_RID[AXI_ID_WIDTH-1:0]),
       .m_RUSER                         (m_RUSER[AXI_USER_WIDTH-1:0]));
   ysyx_210479_axi4_mux_w
      #(
        .AXI_P_DW_BYTES                 (AXI_P_DW_BYTES),
        .AXI_ADDR_WIDTH                 (AXI_ADDR_WIDTH),
        .AXI_ID_WIDTH                   (AXI_ID_WIDTH),
        .AXI_USER_WIDTH                 (AXI_USER_WIDTH))
   U_MUX_W
      (
       .s0_AWREADY                      (s0_AWREADY),
       .s0_WREADY                       (s0_WREADY),
       .s0_BVALID                       (s0_BVALID),
       .s0_BRESP                        (s0_BRESP[1:0]),
       .s0_BID                          (s0_BID[AXI_ID_WIDTH-1:0]),
       .s0_BUSER                        (s0_BUSER[AXI_USER_WIDTH-1:0]),
       .s1_AWREADY                      (s1_AWREADY),
       .s1_WREADY                       (s1_WREADY),
       .s1_BVALID                       (s1_BVALID),
       .s1_BRESP                        (s1_BRESP[1:0]),
       .s1_BID                          (s1_BID[AXI_ID_WIDTH-1:0]),
       .s1_BUSER                        (s1_BUSER[AXI_USER_WIDTH-1:0]),
       .m_AWVALID                       (m_AWVALID),
       .m_AWADDR                        (m_AWADDR[AXI_ADDR_WIDTH-1:0]),
       .m_AWPROT                        (m_AWPROT[2:0]),
       .m_AWID                          (m_AWID[AXI_ID_WIDTH-1:0]),
       .m_AWUSER                        (m_AWUSER[AXI_USER_WIDTH-1:0]),
       .m_AWLEN                         (m_AWLEN[7:0]),
       .m_AWSIZE                        (m_AWSIZE[2:0]),
       .m_AWBURST                       (m_AWBURST[1:0]),
       .m_AWLOCK                        (m_AWLOCK),
       .m_AWCACHE                       (m_AWCACHE[3:0]),
       .m_AWQOS                         (m_AWQOS[3:0]),
       .m_AWREGION                      (m_AWREGION[3:0]),
       .m_WVALID                        (m_WVALID),
       .m_WDATA                         (m_WDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .m_WSTRB                         (m_WSTRB[(1<<AXI_P_DW_BYTES)-1:0]),
       .m_WLAST                         (m_WLAST),
       .m_WUSER                         (m_WUSER[AXI_USER_WIDTH-1:0]),
       .m_BREADY                        (m_BREADY),
       .m_WGRNT                         (m_WGRNT[1:0]),
       .s0_AWVALID                      (s0_AWVALID),
       .s0_AWADDR                       (s0_AWADDR[AXI_ADDR_WIDTH-1:0]),
       .s0_AWPROT                       (s0_AWPROT[2:0]),
       .s0_AWID                         (s0_AWID[AXI_ID_WIDTH-1:0]),
       .s0_AWUSER                       (s0_AWUSER[AXI_USER_WIDTH-1:0]),
       .s0_AWLEN                        (s0_AWLEN[7:0]),
       .s0_AWSIZE                       (s0_AWSIZE[2:0]),
       .s0_AWBURST                      (s0_AWBURST[1:0]),
       .s0_AWLOCK                       (s0_AWLOCK),
       .s0_AWCACHE                      (s0_AWCACHE[3:0]),
       .s0_AWQOS                        (s0_AWQOS[3:0]),
       .s0_AWREGION                     (s0_AWREGION[3:0]),
       .s0_WVALID                       (s0_WVALID),
       .s0_WDATA                        (s0_WDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .s0_WSTRB                        (s0_WSTRB[(1<<AXI_P_DW_BYTES)-1:0]),
       .s0_WLAST                        (s0_WLAST),
       .s0_WUSER                        (s0_WUSER[AXI_USER_WIDTH-1:0]),
       .s0_BREADY                       (s0_BREADY),
       .s1_AWVALID                      (s1_AWVALID),
       .s1_AWADDR                       (s1_AWADDR[AXI_ADDR_WIDTH-1:0]),
       .s1_AWPROT                       (s1_AWPROT[2:0]),
       .s1_AWID                         (s1_AWID[AXI_ID_WIDTH-1:0]),
       .s1_AWUSER                       (s1_AWUSER[AXI_USER_WIDTH-1:0]),
       .s1_AWLEN                        (s1_AWLEN[7:0]),
       .s1_AWSIZE                       (s1_AWSIZE[2:0]),
       .s1_AWBURST                      (s1_AWBURST[1:0]),
       .s1_AWLOCK                       (s1_AWLOCK),
       .s1_AWCACHE                      (s1_AWCACHE[3:0]),
       .s1_AWQOS                        (s1_AWQOS[3:0]),
       .s1_AWREGION                     (s1_AWREGION[3:0]),
       .s1_WVALID                       (s1_WVALID),
       .s1_WDATA                        (s1_WDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .s1_WSTRB                        (s1_WSTRB[(1<<AXI_P_DW_BYTES)-1:0]),
       .s1_WLAST                        (s1_WLAST),
       .s1_WUSER                        (s1_WUSER[AXI_USER_WIDTH-1:0]),
       .s1_BREADY                       (s1_BREADY),
       .m_AWREADY                       (m_AWREADY),
       .m_WREADY                        (m_WREADY),
       .m_BVALID                        (m_BVALID),
       .m_BRESP                         (m_BRESP[1:0]),
       .m_BID                           (m_BID[AXI_ID_WIDTH-1:0]),
       .m_BUSER                         (m_BUSER[AXI_USER_WIDTH-1:0]));
endmodule
module ysyx_210479_axi4_arbiter_r
(
   input                               clk,
   input                               rst,
   input                               s0_ARVALID,
   input                               s0_RREADY,
   input                               s1_ARVALID,
   input                               s1_RREADY,
   input                               m_RVALID,
   input                               m_RLAST,
   output [1:0]                        m_RGRNT
);
   localparam [1:0] S_S0               = 2'b01;
   localparam [1:0] S_S1               = 2'b10;
   wire [1:0]                          fsm_state_ff;
   reg [1:0]                           fsm_state_nxt;
   wire                                s0_sel;
   wire                                s1_sel;
   wire                                s0_pending, s0_pending_clr;
   wire                                s1_pending, s1_pending_clr;
   reg                                 s0_pending_set, s1_pending_set;
   always @(*)
      begin
         fsm_state_nxt = fsm_state_ff;
         s0_pending_set = 1'b0;
         s1_pending_set = 1'b0;
         case (fsm_state_ff)
            S_S0:
               begin
                  if (s0_ARVALID)
                     begin
                        fsm_state_nxt = S_S0;
                        s0_pending_set = 1'b1;
                     end
                  else if (s0_pending & ~s0_pending_clr)
                    fsm_state_nxt = S_S0; 
                  else if (s0_pending & s0_pending_clr)
                    fsm_state_nxt = S_S1;  
                  else if (s1_ARVALID)
                     begin
                        fsm_state_nxt = S_S1;
                        s1_pending_set = 1'b1;
                     end
                  else
                    fsm_state_nxt = S_S0;
               end
            S_S1:
               begin
                  if (s1_ARVALID)
                     begin
                        fsm_state_nxt = S_S1;
                        s1_pending_set = 1'b1;
                     end
                  else if (s1_pending & ~s1_pending_clr)
                    fsm_state_nxt = S_S1; 
                  else if (s1_pending & s1_pending_clr)
                    fsm_state_nxt = S_S0;  
                  else if (s0_ARVALID)
                     begin
                        fsm_state_nxt = S_S0;
                        s0_pending_set = 1'b1;
                     end
                  else
                    fsm_state_nxt = S_S1;
               end
            default:
               fsm_state_nxt = fsm_state_ff;
         endcase
      end
   ysyx_210479_mDFF_r #(.DW(2), .RST_VECTOR(S_S0)) ff_fsm_state (.CLK(clk), .RST(rst), .D(fsm_state_nxt), .Q(fsm_state_ff));
   assign s0_sel = (fsm_state_ff == S_S0);
   assign s1_sel = (fsm_state_ff == S_S1);
   assign s0_pending_clr = (s0_sel & m_RLAST & m_RVALID & s0_RREADY);
   assign s1_pending_clr = (s1_sel & m_RLAST & m_RVALID & s1_RREADY);
   ysyx_210479_mDFF_lr #(.DW(1)) s0_pending_ff (.CLK(clk), .RST(rst), .LOAD(s0_pending_set|s0_pending_clr), .D(s0_pending_set|~s0_pending_clr), .Q(s0_pending) );
   ysyx_210479_mDFF_lr #(.DW(1)) s1_pending_ff (.CLK(clk), .RST(rst), .LOAD(s1_pending_set|s1_pending_clr), .D(s1_pending_set|~s1_pending_clr), .Q(s1_pending) );
   assign m_RGRNT = {s1_sel, s0_sel};
endmodule
module ysyx_210479_axi4_arbiter_w
(
   input                               clk,
   input                               rst,
   input                               s0_AWVALID,
   input                               s0_BREADY,
   input                               s1_AWVALID,
   input                               s1_BREADY,
   input                               m_BVALID,
   output [1:0]                        m_WGRNT
);
   localparam [1:0] S_S0               = 2'b01;
   localparam [1:0] S_S1               = 2'b10;
   wire [1:0]                          fsm_state_ff;
   reg [1:0]                           fsm_state_nxt;
   wire                                s0_sel;
   wire                                s1_sel;
   wire                                s0_pending, s0_pending_clr;
   wire                                s1_pending, s1_pending_clr;
   reg                                 s0_pending_set, s1_pending_set;
   always @(*)
      begin
         fsm_state_nxt = fsm_state_ff;
         s0_pending_set = 1'b0;
         s1_pending_set = 1'b1;
         case (fsm_state_ff)
            S_S0:
               begin
                  if (s0_AWVALID)
                     begin
                        fsm_state_nxt = S_S0;
                        s0_pending_set = 1'b1;
                     end
                  else if (s0_pending & ~s0_pending_clr)
                    fsm_state_nxt = S_S0; 
                  else if (s0_pending & s0_pending_clr)
                    fsm_state_nxt = S_S1;  
                  else if (s1_AWVALID)
                     begin
                        fsm_state_nxt = S_S1;
                        s1_pending_set = 1'b1;
                     end
                  else
                    fsm_state_nxt = S_S0;
               end
            S_S1:
               begin
                  if (s1_AWVALID)
                     begin
                        fsm_state_nxt = S_S1;
                        s1_pending_set = 1'b1;
                     end
                  else if (s1_pending & ~s1_pending_clr)
                    fsm_state_nxt = S_S1; 
                  else if (s1_pending & s1_pending_clr)
                    fsm_state_nxt = S_S0;  
                  else if (s0_AWVALID)
                     begin
                        fsm_state_nxt = S_S0;
                        s0_pending_set = 1'b1;
                     end
                  else
                    fsm_state_nxt = S_S1;
               end
            default:
               fsm_state_nxt = fsm_state_ff;
         endcase
      end
   ysyx_210479_mDFF_r #(.DW(2), .RST_VECTOR(S_S0)) ff_fsm_state (.CLK(clk), .RST(rst), .D(fsm_state_nxt), .Q(fsm_state_ff));
   assign s0_sel = (fsm_state_ff == S_S0);
   assign s1_sel = (fsm_state_ff == S_S1);
   assign s0_pending_clr = (s0_sel & m_BVALID & s0_BREADY);
   assign s1_pending_clr = (s1_sel & m_BVALID & s1_BREADY);
   ysyx_210479_mDFF_lr #(.DW(1)) s0_pending_ff (.CLK(clk), .RST(rst), .LOAD(s0_pending_set|s0_pending_clr), .D(s0_pending_set|~s0_pending_clr), .Q(s0_pending) );
   ysyx_210479_mDFF_lr #(.DW(1)) s1_pending_ff (.CLK(clk), .RST(rst), .LOAD(s1_pending_set|s1_pending_clr), .D(s1_pending_set|~s1_pending_clr), .Q(s1_pending) );
   assign m_WGRNT = {s1_sel, s0_sel};
endmodule
module ysyx_210479_axi4_buf_r
#(
   parameter AXI_P_DW_BYTES  = 0,
   parameter AXI_ADDR_WIDTH = 0,
   parameter AXI_ID_WIDTH = 0,
   parameter AXI_USER_WIDTH = 0
)
(
   input                               clk,
   input                               rst,
   output                              s_ARREADY,
   input                               s_ARVALID,
   input [AXI_ADDR_WIDTH-1:0]          s_ARADDR,
   input [2:0]                         s_ARPROT,
   input [AXI_ID_WIDTH-1:0]            s_ARID,
   input [AXI_USER_WIDTH-1:0]          s_ARUSER,
   input [7:0]                         s_ARLEN,
   input [2:0]                         s_ARSIZE,
   input [1:0]                         s_ARBURST,
   input                               s_ARLOCK,
   input [3:0]                         s_ARCACHE,
   input [3:0]                         s_ARQOS,
   input [3:0]                         s_ARREGION,
   input                               s_RREADY,
   output                              s_RVALID,
   output  [(1<<AXI_P_DW_BYTES)*8-1:0] s_RDATA,
   output  [1:0]                       s_RRESP,
   output                              s_RLAST,
   output  [AXI_ID_WIDTH-1:0]          s_RID,
   output  [AXI_USER_WIDTH-1:0]        s_RUSER,
   input                               m_ARREADY,
   output                              m_ARVALID,
   output [AXI_ADDR_WIDTH-1:0]         m_ARADDR,
   output [2:0]                        m_ARPROT,
   output [AXI_ID_WIDTH-1:0]           m_ARID,
   output [AXI_USER_WIDTH-1:0]         m_ARUSER,
   output [7:0]                        m_ARLEN,
   output [2:0]                        m_ARSIZE,
   output [1:0]                        m_ARBURST,
   output                              m_ARLOCK,
   output [3:0]                        m_ARCACHE,
   output [3:0]                        m_ARQOS,
   output [3:0]                        m_ARREGION,
   output                              m_RREADY,
   input                               m_RVALID,
   input  [(1<<AXI_P_DW_BYTES)*8-1:0]  m_RDATA,
   input  [1:0]                        m_RRESP,
   input                               m_RLAST,
   input  [AXI_ID_WIDTH-1:0]           m_RID,
   input  [AXI_USER_WIDTH-1:0]         m_RUSER
);
   wire                                cke_ar;
   wire                                cke_r;
   ysyx_210479_hds_buf
      #(.BYPASS(0) )
   U_HDS_AR
      (
         .clk     (clk),
         .rst     (rst),
         .flush   (1'b0),
         .A_en    (1'b1),
         .AVALID  (s_ARVALID),
         .AREADY  (s_ARREADY),
         .B_en    (1'b1),
         .BVALID  (m_ARVALID),
         .BREADY  (m_ARREADY),
         .p_ce    (cke_ar)
      );
   ysyx_210479_mDFF_lr #(.DW(AXI_ADDR_WIDTH)) dff_m_ARADDR (.CLK(clk), .RST(rst), .LOAD(cke_ar), .D(s_ARADDR), .Q(m_ARADDR) );
   ysyx_210479_mDFF_lr #(.DW(3)) dff_m_ARPROT (.CLK(clk), .RST(rst), .LOAD(cke_ar), .D(s_ARPROT), .Q(m_ARPROT) );
   ysyx_210479_mDFF_lr #(.DW(AXI_ID_WIDTH)) dff_m_ARID (.CLK(clk), .RST(rst), .LOAD(cke_ar), .D(s_ARID), .Q(m_ARID) );
   ysyx_210479_mDFF_lr #(.DW(AXI_USER_WIDTH)) dff_m_ARUSER (.CLK(clk), .RST(rst), .LOAD(cke_ar), .D(s_ARUSER), .Q(m_ARUSER) );
   ysyx_210479_mDFF_lr #(.DW(8)) dff_m_ARLEN (.CLK(clk), .RST(rst), .LOAD(cke_ar), .D(s_ARLEN), .Q(m_ARLEN) );
   ysyx_210479_mDFF_lr #(.DW(3)) dff_m_ARSIZE (.CLK(clk), .RST(rst), .LOAD(cke_ar), .D(s_ARSIZE), .Q(m_ARSIZE) );
   ysyx_210479_mDFF_lr #(.DW(2)) dff_m_ARBURST (.CLK(clk), .RST(rst), .LOAD(cke_ar), .D(s_ARBURST), .Q(m_ARBURST) );
   ysyx_210479_mDFF_lr #(.DW(1)) dff_m_ARLOCK (.CLK(clk), .RST(rst), .LOAD(cke_ar), .D(s_ARLOCK), .Q(m_ARLOCK) );
   ysyx_210479_mDFF_lr #(.DW(4)) dff_m_ARCACHE (.CLK(clk), .RST(rst), .LOAD(cke_ar), .D(s_ARCACHE), .Q(m_ARCACHE) );
   ysyx_210479_mDFF_lr #(.DW(4)) dff_m_ARQOS (.CLK(clk), .RST(rst), .LOAD(cke_ar), .D(s_ARQOS), .Q(m_ARQOS) );
   ysyx_210479_mDFF_lr #(.DW(4)) dff_m_ARREGION (.CLK(clk), .RST(rst), .LOAD(cke_ar), .D(s_ARREGION), .Q(m_ARREGION) );
   ysyx_210479_hds_buf
      #(.BYPASS(0) )
   U_HDS_R
      (
         .clk     (clk),
         .rst     (rst),
         .flush   (1'b0),
         .A_en    (1'b1),
         .AVALID  (m_RVALID),
         .AREADY  (m_RREADY),
         .B_en    (1'b1),
         .BVALID  (s_RVALID),
         .BREADY  (s_RREADY),
         .p_ce    (cke_r)
      );
   ysyx_210479_mDFF_lr #(.DW((1<<AXI_P_DW_BYTES)*8)) dff_s_RDATA (.CLK(clk), .RST(rst), .LOAD(cke_r), .D(m_RDATA), .Q(s_RDATA) );
   ysyx_210479_mDFF_lr #(.DW(2)) dff_s_RRESP (.CLK(clk), .RST(rst), .LOAD(cke_r), .D(m_RRESP), .Q(s_RRESP) );
   ysyx_210479_mDFF_lr #(.DW(1)) dff_s_RLAST (.CLK(clk), .RST(rst), .LOAD(cke_r), .D(m_RLAST), .Q(s_RLAST) );
   ysyx_210479_mDFF_lr #(.DW(AXI_ID_WIDTH)) dff_s_RID (.CLK(clk), .RST(rst), .LOAD(cke_r), .D(m_RID), .Q(s_RID) );
   ysyx_210479_mDFF_lr #(.DW(AXI_USER_WIDTH)) dff_s_RUSER (.CLK(clk), .RST(rst), .LOAD(cke_r), .D(m_RUSER), .Q(s_RUSER) );
endmodule
module ysyx_210479_axi4_buf_w
#(
   parameter AXI_P_DW_BYTES  = 0,
   parameter AXI_ADDR_WIDTH = 0,
   parameter AXI_ID_WIDTH = 0,
   parameter AXI_USER_WIDTH = 0
)
(
   input                               clk,
   input                               rst,
   output                              s_AWREADY,
   input                               s_AWVALID,
   input [AXI_ADDR_WIDTH-1:0]          s_AWADDR,
   input [2:0]                         s_AWPROT,
   input [AXI_ID_WIDTH-1:0]            s_AWID,
   input [AXI_USER_WIDTH-1:0]          s_AWUSER,
   input [7:0]                         s_AWLEN,
   input [2:0]                         s_AWSIZE,
   input [1:0]                         s_AWBURST,
   input                               s_AWLOCK,
   input [3:0]                         s_AWCACHE,
   input [3:0]                         s_AWQOS,
   input [3:0]                         s_AWREGION,
   output                              s_WREADY,
   input                               s_WVALID,
   input [(1<<AXI_P_DW_BYTES)*8-1:0]   s_WDATA,
   input [(1<<AXI_P_DW_BYTES)-1:0]     s_WSTRB,
   input                               s_WLAST,
   input [AXI_USER_WIDTH-1:0]          s_WUSER,
   input                               s_BREADY,
   output                              s_BVALID,
   output [1:0]                        s_BRESP,
   output [AXI_ID_WIDTH-1:0]           s_BID,
   output [AXI_USER_WIDTH-1:0]         s_BUSER,
   input                               m_AWREADY,
   output                              m_AWVALID,
   output [AXI_ADDR_WIDTH-1:0]         m_AWADDR,
   output [2:0]                        m_AWPROT,
   output [AXI_ID_WIDTH-1:0]           m_AWID,
   output [AXI_USER_WIDTH-1:0]         m_AWUSER,
   output [7:0]                        m_AWLEN,
   output [2:0]                        m_AWSIZE,
   output [1:0]                        m_AWBURST,
   output                              m_AWLOCK,
   output [3:0]                        m_AWCACHE,
   output [3:0]                        m_AWQOS,
   output [3:0]                        m_AWREGION,
   input                               m_WREADY,
   output                              m_WVALID,
   output [(1<<AXI_P_DW_BYTES)*8-1:0]  m_WDATA,
   output [(1<<AXI_P_DW_BYTES)-1:0]    m_WSTRB,
   output                              m_WLAST,
   output [AXI_USER_WIDTH-1:0]         m_WUSER,
   output                              m_BREADY,
   input                               m_BVALID,
   input [1:0]                         m_BRESP,
   input [AXI_ID_WIDTH-1:0]            m_BID,
   input [AXI_USER_WIDTH-1:0]          m_BUSER
);
   wire                                cke_aw;
   wire                                cke_w;
   wire                                cke_b;
   ysyx_210479_hds_buf
      #(.BYPASS(0) )
   U_HDS_AW
      (
         .clk     (clk),
         .rst     (rst),
         .flush   (1'b0),
         .A_en    (1'b1),
         .AVALID  (s_AWVALID),
         .AREADY  (s_AWREADY),
         .B_en    (1'b1),
         .BVALID  (m_AWVALID),
         .BREADY  (m_AWREADY),
         .p_ce    (cke_aw)
      );
   ysyx_210479_mDFF_lr #(.DW(AXI_ADDR_WIDTH)) dff_m_AWADDR (.CLK(clk), .RST(rst), .LOAD(cke_aw), .D(s_AWADDR), .Q(m_AWADDR) );
   ysyx_210479_mDFF_lr #(.DW(3)) dff_m_AWPROT (.CLK(clk), .RST(rst), .LOAD(cke_aw), .D(s_AWPROT), .Q(m_AWPROT) );
   ysyx_210479_mDFF_lr #(.DW(AXI_ID_WIDTH)) dff_m_AWID (.CLK(clk), .RST(rst), .LOAD(cke_aw), .D(s_AWID), .Q(m_AWID) );
   ysyx_210479_mDFF_lr #(.DW(AXI_USER_WIDTH)) dff_m_AWUSER (.CLK(clk), .RST(rst), .LOAD(cke_aw), .D(s_AWUSER), .Q(m_AWUSER) );
   ysyx_210479_mDFF_lr #(.DW(8)) dff_m_AWLEN (.CLK(clk), .RST(rst), .LOAD(cke_aw), .D(s_AWLEN), .Q(m_AWLEN) );
   ysyx_210479_mDFF_lr #(.DW(3)) dff_m_AWSIZE (.CLK(clk), .RST(rst), .LOAD(cke_aw), .D(s_AWSIZE), .Q(m_AWSIZE) );
   ysyx_210479_mDFF_lr #(.DW(2)) dff_m_AWBURST (.CLK(clk), .RST(rst), .LOAD(cke_aw), .D(s_AWBURST), .Q(m_AWBURST) );
   ysyx_210479_mDFF_lr #(.DW(1)) dff_m_AWLOCK (.CLK(clk), .RST(rst), .LOAD(cke_aw), .D(s_AWLOCK), .Q(m_AWLOCK) );
   ysyx_210479_mDFF_lr #(.DW(4)) dff_m_AWCACHE (.CLK(clk), .RST(rst), .LOAD(cke_aw), .D(s_AWCACHE), .Q(m_AWCACHE) );
   ysyx_210479_mDFF_lr #(.DW(4)) dff_m_AWQOS (.CLK(clk), .RST(rst), .LOAD(cke_aw), .D(s_AWQOS), .Q(m_AWQOS) );
   ysyx_210479_mDFF_lr #(.DW(4)) dff_m_AWREGION (.CLK(clk), .RST(rst), .LOAD(cke_aw), .D(s_AWREGION), .Q(m_AWREGION) );
   ysyx_210479_hds_buf
      #(.BYPASS(0) )
   U_HDS_W
      (
         .clk     (clk),
         .rst     (rst),
         .flush   (1'b0),
         .A_en    (1'b1),
         .AVALID  (s_WVALID),
         .AREADY  (s_WREADY),
         .B_en    (1'b1),
         .BVALID  (m_WVALID),
         .BREADY  (m_WREADY),
         .p_ce    (cke_w)
      );
   ysyx_210479_mDFF_lr #(.DW((1<<AXI_P_DW_BYTES)*8)) dff_m_WDATA (.CLK(clk), .RST(rst), .LOAD(cke_w), .D(s_WDATA), .Q(m_WDATA) );
   ysyx_210479_mDFF_lr #(.DW((1<<AXI_P_DW_BYTES))) dff_m_WSTRB (.CLK(clk), .RST(rst), .LOAD(cke_w), .D(s_WSTRB), .Q(m_WSTRB) );
   ysyx_210479_mDFF_lr #(.DW(1)) dff_m_WLAST (.CLK(clk), .RST(rst), .LOAD(cke_w), .D(s_WLAST), .Q(m_WLAST) );
   ysyx_210479_mDFF_lr #(.DW(AXI_USER_WIDTH)) dff_m_WUSER (.CLK(clk), .RST(rst), .LOAD(cke_w), .D(s_WUSER), .Q(m_WUSER) );
   ysyx_210479_hds_buf
      #(.BYPASS(0) )
   U_HDS_B
      (
         .clk     (clk),
         .rst     (rst),
         .flush   (1'b0),
         .A_en    (1'b1),
         .AVALID  (m_BVALID),
         .AREADY  (m_BREADY),
         .B_en    (1'b1),
         .BVALID  (s_BVALID),
         .BREADY  (s_BREADY),
         .p_ce    (cke_b)
      );
   ysyx_210479_mDFF_lr #(.DW(2)) dff_s_BRESP (.CLK(clk), .RST(rst), .LOAD(cke_b), .D(m_BRESP), .Q(s_BRESP) );
   ysyx_210479_mDFF_lr #(.DW(AXI_ID_WIDTH)) dff_s_BID (.CLK(clk), .RST(rst), .LOAD(cke_b), .D(m_BID), .Q(s_BID) );
   ysyx_210479_mDFF_lr #(.DW(AXI_USER_WIDTH)) dff_s_BUSER (.CLK(clk), .RST(rst), .LOAD(cke_b), .D(m_BUSER), .Q(s_BUSER) );
endmodule
module ysyx_210479_axi4_mux_r
#(
   parameter AXI_P_DW_BYTES  = 0,
   parameter AXI_ADDR_WIDTH = 0,
   parameter AXI_ID_WIDTH = 0,
   parameter AXI_USER_WIDTH = 0
)
(
   input [1:0]                         m_RGRNT,
   output                              s0_ARREADY,
   input                               s0_ARVALID,
   input [AXI_ADDR_WIDTH-1:0]          s0_ARADDR,
   input [2:0]                         s0_ARPROT,
   input [AXI_ID_WIDTH-1:0]            s0_ARID,
   input [AXI_USER_WIDTH-1:0]          s0_ARUSER,
   input [7:0]                         s0_ARLEN,
   input [2:0]                         s0_ARSIZE,
   input [1:0]                         s0_ARBURST,
   input                               s0_ARLOCK,
   input [3:0]                         s0_ARCACHE,
   input [3:0]                         s0_ARQOS,
   input [3:0]                         s0_ARREGION,
   input                               s0_RREADY,
   output                              s0_RVALID,
   output  [(1<<AXI_P_DW_BYTES)*8-1:0] s0_RDATA,
   output  [1:0]                       s0_RRESP,
   output                              s0_RLAST,
   output  [AXI_ID_WIDTH-1:0]          s0_RID,
   output  [AXI_USER_WIDTH-1:0]        s0_RUSER,
   output                              s1_ARREADY,
   input                               s1_ARVALID,
   input [AXI_ADDR_WIDTH-1:0]          s1_ARADDR,
   input [2:0]                         s1_ARPROT,
   input [AXI_ID_WIDTH-1:0]            s1_ARID,
   input [AXI_USER_WIDTH-1:0]          s1_ARUSER,
   input [7:0]                         s1_ARLEN,
   input [2:0]                         s1_ARSIZE,
   input [1:0]                         s1_ARBURST,
   input                               s1_ARLOCK,
   input [3:0]                         s1_ARCACHE,
   input [3:0]                         s1_ARQOS,
   input [3:0]                         s1_ARREGION,
   input                               s1_RREADY,
   output                              s1_RVALID,
   output  [(1<<AXI_P_DW_BYTES)*8-1:0] s1_RDATA,
   output  [1:0]                       s1_RRESP,
   output                              s1_RLAST,
   output  [AXI_ID_WIDTH-1:0]          s1_RID,
   output  [AXI_USER_WIDTH-1:0]        s1_RUSER,
   input                               m_ARREADY,
   output reg                          m_ARVALID,
   output reg  [AXI_ADDR_WIDTH-1:0]    m_ARADDR,
   output reg  [2:0]                   m_ARPROT,
   output reg  [AXI_ID_WIDTH-1:0]      m_ARID,
   output reg  [AXI_USER_WIDTH-1:0]    m_ARUSER,
   output reg  [7:0]                   m_ARLEN,
   output reg  [2:0]                   m_ARSIZE,
   output reg  [1:0]                   m_ARBURST,
   output reg                          m_ARLOCK,
   output reg  [3:0]                   m_ARCACHE,
   output reg  [3:0]                   m_ARQOS,
   output reg  [3:0]                   m_ARREGION,
   output reg                          m_RREADY,
   input                               m_RVALID,
   input  [(1<<AXI_P_DW_BYTES)*8-1:0]  m_RDATA,
   input  [1:0]                        m_RRESP,
   input                               m_RLAST,
   input  [AXI_ID_WIDTH-1:0]           m_RID,
   input  [AXI_USER_WIDTH-1:0]         m_RUSER
);
   always @(*)
      case (m_RGRNT)
         2'b01:
            begin
               m_ARVALID = s0_ARVALID;
               m_ARADDR = s0_ARADDR;
               m_ARPROT = s0_ARPROT;
               m_ARID = s0_ARID;
               m_ARUSER = s0_ARUSER;
               m_ARLEN = s0_ARLEN;
               m_ARSIZE = s0_ARSIZE;
               m_ARBURST = s0_ARBURST;
               m_ARLOCK = s0_ARLOCK;
               m_ARCACHE = s0_ARCACHE;
               m_ARQOS = s0_ARQOS;
               m_ARREGION = s0_ARREGION;
               m_RREADY = s0_RREADY;
            end
         default:
            begin
               m_ARVALID = s1_ARVALID;
               m_ARADDR = s1_ARADDR;
               m_ARPROT = s1_ARPROT;
               m_ARID = s1_ARID;
               m_ARUSER = s1_ARUSER;
               m_ARLEN = s1_ARLEN;
               m_ARSIZE = s1_ARSIZE;
               m_ARBURST = s1_ARBURST;
               m_ARLOCK = s1_ARLOCK;
               m_ARCACHE = s1_ARCACHE;
               m_ARQOS = s1_ARQOS;
               m_ARREGION = s1_ARREGION;
               m_RREADY = s1_RREADY;
            end
      endcase
   assign s0_ARREADY = (m_RGRNT[0] & m_ARREADY);
   assign s0_RVALID = (m_RGRNT[0] & m_RVALID);
   assign s0_RDATA = m_RDATA;
   assign s0_RRESP = m_RRESP;
   assign s0_RLAST = m_RLAST;
   assign s0_RID = m_RID;
   assign s0_RUSER = m_RUSER;
   assign s1_ARREADY = (m_RGRNT[1] & m_ARREADY);
   assign s1_RVALID = (m_RGRNT[1] & m_RVALID);
   assign s1_RDATA = m_RDATA;
   assign s1_RRESP = m_RRESP;
   assign s1_RLAST = m_RLAST;
   assign s1_RID = m_RID;
   assign s1_RUSER = m_RUSER;
endmodule
module ysyx_210479_axi4_mux_w
#(
   parameter AXI_P_DW_BYTES  = 0,
   parameter AXI_ADDR_WIDTH = 0,
   parameter AXI_ID_WIDTH = 0,
   parameter AXI_USER_WIDTH = 0
)
(
   input [1:0]                         m_WGRNT,
   output                              s0_AWREADY,
   input                               s0_AWVALID,
   input [AXI_ADDR_WIDTH-1:0]          s0_AWADDR,
   input [2:0]                         s0_AWPROT,
   input [AXI_ID_WIDTH-1:0]            s0_AWID,
   input [AXI_USER_WIDTH-1:0]          s0_AWUSER,
   input [7:0]                         s0_AWLEN,
   input [2:0]                         s0_AWSIZE,
   input [1:0]                         s0_AWBURST,
   input                               s0_AWLOCK,
   input [3:0]                         s0_AWCACHE,
   input [3:0]                         s0_AWQOS,
   input [3:0]                         s0_AWREGION,
   output                              s0_WREADY,
   input                               s0_WVALID,
   input [(1<<AXI_P_DW_BYTES)*8-1:0]   s0_WDATA,
   input [(1<<AXI_P_DW_BYTES)-1:0]     s0_WSTRB,
   input                               s0_WLAST,
   input [AXI_USER_WIDTH-1:0]          s0_WUSER,
   input                               s0_BREADY,
   output                              s0_BVALID,
   output [1:0]                        s0_BRESP,
   output [AXI_ID_WIDTH-1:0]           s0_BID,
   output [AXI_USER_WIDTH-1:0]         s0_BUSER,
   output                              s1_AWREADY,
   input                               s1_AWVALID,
   input [AXI_ADDR_WIDTH-1:0]          s1_AWADDR,
   input [2:0]                         s1_AWPROT,
   input [AXI_ID_WIDTH-1:0]            s1_AWID,
   input [AXI_USER_WIDTH-1:0]          s1_AWUSER,
   input [7:0]                         s1_AWLEN,
   input [2:0]                         s1_AWSIZE,
   input [1:0]                         s1_AWBURST,
   input                               s1_AWLOCK,
   input [3:0]                         s1_AWCACHE,
   input [3:0]                         s1_AWQOS,
   input [3:0]                         s1_AWREGION,
   output                              s1_WREADY,
   input                               s1_WVALID,
   input [(1<<AXI_P_DW_BYTES)*8-1:0]   s1_WDATA,
   input [(1<<AXI_P_DW_BYTES)-1:0]     s1_WSTRB,
   input                               s1_WLAST,
   input [AXI_USER_WIDTH-1:0]          s1_WUSER,
   input                               s1_BREADY,
   output                              s1_BVALID,
   output [1:0]                        s1_BRESP,
   output [AXI_ID_WIDTH-1:0]           s1_BID,
   output [AXI_USER_WIDTH-1:0]         s1_BUSER,
   input                               m_AWREADY,
   output reg                          m_AWVALID,
   output reg  [AXI_ADDR_WIDTH-1:0]    m_AWADDR,
   output reg  [2:0]                   m_AWPROT,
   output reg  [AXI_ID_WIDTH-1:0]      m_AWID,
   output reg  [AXI_USER_WIDTH-1:0]    m_AWUSER,
   output reg  [7:0]                   m_AWLEN,
   output reg  [2:0]                   m_AWSIZE,
   output reg  [1:0]                   m_AWBURST,
   output reg                          m_AWLOCK,
   output reg  [3:0]                   m_AWCACHE,
   output reg  [3:0]                   m_AWQOS,
   output reg  [3:0]                   m_AWREGION,
   input                               m_WREADY,
   output reg                          m_WVALID,
   output reg  [(1<<AXI_P_DW_BYTES)*8-1:0] m_WDATA,
   output reg  [(1<<AXI_P_DW_BYTES)-1:0]  m_WSTRB,
   output reg                          m_WLAST,
   output reg  [AXI_USER_WIDTH-1:0]    m_WUSER,
   output reg                          m_BREADY,
   input                               m_BVALID,
   input [1:0]                         m_BRESP,
   input [AXI_ID_WIDTH-1:0]            m_BID,
   input [AXI_USER_WIDTH-1:0]          m_BUSER
);
   always @(*)
      case (m_WGRNT)
         2'b01:
            begin
               m_AWVALID = s0_AWVALID;
               m_AWADDR = s0_AWADDR;
               m_AWPROT = s0_AWPROT;
               m_AWID = s0_AWID;
               m_AWUSER = s0_AWUSER;
               m_AWLEN = s0_AWLEN;
               m_AWSIZE = s0_AWSIZE;
               m_AWBURST = s0_AWBURST;
               m_AWLOCK = s0_AWLOCK;
               m_AWCACHE = s0_AWCACHE;
               m_AWQOS = s0_AWQOS;
               m_AWREGION = s0_AWREGION;
               m_WVALID = s0_WVALID;
               m_WDATA = s0_WDATA;
               m_WSTRB = s0_WSTRB;
               m_WLAST = s0_WLAST;
               m_WUSER = s0_WUSER;
               m_BREADY = s0_BREADY;
            end
         default:
            begin
               m_AWVALID = s1_AWVALID;
               m_AWADDR = s1_AWADDR;
               m_AWPROT = s1_AWPROT;
               m_AWID = s1_AWID;
               m_AWUSER = s1_AWUSER;
               m_AWLEN = s1_AWLEN;
               m_AWSIZE = s1_AWSIZE;
               m_AWBURST = s1_AWBURST;
               m_AWLOCK = s1_AWLOCK;
               m_AWCACHE = s1_AWCACHE;
               m_AWQOS = s1_AWQOS;
               m_AWREGION = s1_AWREGION;
               m_WVALID = s1_WVALID;
               m_WDATA = s1_WDATA;
               m_WSTRB = s1_WSTRB;
               m_WLAST = s1_WLAST;
               m_WUSER = s1_WUSER;
               m_BREADY = s1_BREADY;
            end
      endcase
   assign s0_AWREADY = (m_WGRNT[0] & m_AWREADY);
   assign s0_WREADY = (m_WGRNT[0] & m_WREADY);
   assign s0_BVALID = (m_WGRNT[0] & m_BVALID);
   assign s0_BRESP = m_BRESP;
   assign s0_BID = m_BID;
   assign s0_BUSER = m_BUSER;
   assign s1_AWREADY = (m_WGRNT[1] & m_AWREADY);
   assign s1_WREADY = (m_WGRNT[1] & m_WREADY);
   assign s1_BVALID = (m_WGRNT[1] & m_BVALID);
   assign s1_BRESP = m_BRESP;
   assign s1_BID = m_BID;
   assign s1_BUSER = m_BUSER;
endmodule
module ysyx_210479
(
   input	clock,
   input	reset,
   input	io_interrupt,
   input io_master_awready,
   output io_master_awvalid,
   output [31:0]	io_master_awaddr,
   output [3:0]	io_master_awid,
   output [7:0]	io_master_awlen,
   output [2:0]	io_master_awsize,
   output [1:0]	io_master_awburst,
   input io_master_wready,
   output io_master_wvalid,
   output [63:0]	io_master_wdata,
   output [7:0]	io_master_wstrb,
   output io_master_wlast,
   output io_master_bready,
   input io_master_bvalid,
   input	[1:0]	io_master_bresp,
   input	[3:0]	io_master_bid,
   input io_master_arready,
   output io_master_arvalid,
   output [31:0]	io_master_araddr,
   output [3:0]	io_master_arid,
   output [7:0]	io_master_arlen,
   output [2:0]	io_master_arsize,
   output io_master_rready,
   input io_master_rvalid,
   input	[1:0]	io_master_rresp,
   input	[63:0]	io_master_rdata,
   input io_master_rlast,
   input	[3:0]	io_master_rid,
   output io_slave_awready,
	input io_slave_awvalid,
	input	[31:0]	io_slave_awaddr,
	input	[3:0]	io_slave_awid,
	input	[7:0]	io_slave_awlen,
	input	[2:0]	io_slave_awsize,
	input	[1:0]	io_slave_awburst,
	output io_slave_wready,
   input io_slave_wvalid,
	input	[63:0]	io_slave_wdata,
	input	[7:0]	io_slave_wstrb,
	input io_slave_wlast,
	input io_slave_bready,
	output io_slave_bvalid,
	output [1:0]	io_slave_bresp,
	output [3:0]	io_slave_bid,
	output io_slave_arready,
	input io_slave_arvalid,
	input	[31:0]	io_slave_araddr,
	input	[3:0]	io_slave_arid,
	input	[7:0]	io_slave_arlen,
	input	[2:0]	io_slave_arsize,
   output [1:0]	io_master_arburst,
	input	[1:0]	io_slave_arburst,
	input io_slave_rready,
	output io_slave_rvalid,
	output [1:0]	io_slave_rresp,
	output [63:0]	io_slave_rdata,
	output io_slave_rlast,
	output [3:0]	io_slave_rid
);
   localparam                           CONFIG_AW = 32;
   localparam                           CONFIG_DW = 32;
   localparam                           CONFIG_P_DW = 5;
   localparam                           CONFIG_P_FETCH_WIDTH = 2;
   localparam                           CONFIG_P_ISSUE_WIDTH = 1;
   localparam                           CONFIG_P_PAGE_SIZE = 13;
   localparam                           CONFIG_IC_P_LINE = 6;
   localparam                           CONFIG_IC_P_SETS = 4;
   localparam                           CONFIG_IC_P_WAYS = 1;
   localparam                           CONFIG_DC_P_LINE = 6;
   localparam                           CONFIG_DC_P_SETS = 4;
   localparam                           CONFIG_DC_P_WAYS = 1;
   localparam                           CONFIG_PHT_P_NUM = 3;
   localparam                           CONFIG_BTB_P_NUM = 3;
   localparam                           CONFIG_P_IQ_DEPTH = 2;
   localparam                           CONFIG_ENABLE_ASR = 1;
   localparam                           CONFIG_IMMU_ENABLE_UNCACHED_SEG = 1;
   localparam                           CONFIG_DMMU_ENABLE_UNCACHED_SEG = 1;
   localparam                           CONFIG_DTLB_P_SETS = 4;
   localparam                           CONFIG_ITLB_P_SETS = 4;
   localparam [CONFIG_AW-1:0]           CONFIG_PC_RST = 32'h30000000;
   localparam [8-1:0]        CONFIG_EITM_VECTOR = 8'h1c;
   localparam [8-1:0]        CONFIG_EIPF_VECTOR = 8'h14;
   localparam [8-1:0]        CONFIG_ESYSCALL_VECTOR = 8'hc;
   localparam [8-1:0]        CONFIG_EINSN_VECTOR = 8'h4;
   localparam [8-1:0]        CONFIG_EIRQ_VECTOR = 8'h8;
   localparam [8-1:0]        CONFIG_EDTM_VECTOR = 8'h20;
   localparam [8-1:0]        CONFIG_EDPF_VECTOR = 8'h18;
   localparam [8-1:0]        CONFIG_EALIGN_VECTOR = 8'h24;
   localparam                           CONFIG_NUM_IRQ = 32;
   localparam                           CONFIG_P_RS_DEPTH = 2;
   localparam                           CONFIG_P_ROB_DEPTH = 3;
   localparam AXI_P_DW_BYTES   = 3; 
   localparam AXI_UNCACHED_P_DW_BYTES = 2; 
   localparam AXI_ADDR_WIDTH    = 32;
   localparam AXI_ID_WIDTH      = 4;
   localparam AXI_USER_WIDTH    = 1;
   wire [AXI_ADDR_WIDTH-1:0] dbus_ARADDR;       
   wire [1:0]           dbus_ARBURST;           
   wire [3:0]           dbus_ARCACHE;           
   wire [AXI_ID_WIDTH-1:0] dbus_ARID;           
   wire [7:0]           dbus_ARLEN;             
   wire                 dbus_ARLOCK;            
   wire [2:0]           dbus_ARPROT;            
   wire [3:0]           dbus_ARQOS;             
   wire                 dbus_ARREADY;           
   wire [3:0]           dbus_ARREGION;          
   wire [2:0]           dbus_ARSIZE;            
   wire [AXI_USER_WIDTH-1:0] dbus_ARUSER;       
   wire                 dbus_ARVALID;           
   wire [AXI_ADDR_WIDTH-1:0] dbus_AWADDR;       
   wire [1:0]           dbus_AWBURST;           
   wire [3:0]           dbus_AWCACHE;           
   wire [AXI_ID_WIDTH-1:0] dbus_AWID;           
   wire [7:0]           dbus_AWLEN;             
   wire                 dbus_AWLOCK;            
   wire [2:0]           dbus_AWPROT;            
   wire [3:0]           dbus_AWQOS;             
   wire                 dbus_AWREADY;           
   wire [3:0]           dbus_AWREGION;          
   wire [2:0]           dbus_AWSIZE;            
   wire [AXI_USER_WIDTH-1:0] dbus_AWUSER;       
   wire                 dbus_AWVALID;           
   wire [AXI_ID_WIDTH-1:0] dbus_BID;            
   wire                 dbus_BREADY;            
   wire [1:0]           dbus_BRESP;             
   wire [AXI_USER_WIDTH-1:0] dbus_BUSER;        
   wire                 dbus_BVALID;            
   wire [(1<<AXI_P_DW_BYTES)*8-1:0] dbus_RDATA; 
   wire [AXI_ID_WIDTH-1:0] dbus_RID;            
   wire                 dbus_RLAST;             
   wire                 dbus_RREADY;            
   wire [1:0]           dbus_RRESP;             
   wire [AXI_USER_WIDTH-1:0] dbus_RUSER;        
   wire                 dbus_RVALID;            
   wire [(1<<AXI_P_DW_BYTES)*8-1:0] dbus_WDATA; 
   wire                 dbus_WLAST;             
   wire                 dbus_WREADY;            
   wire [(1<<AXI_P_DW_BYTES)-1:0] dbus_WSTRB;   
   wire [AXI_USER_WIDTH-1:0] dbus_WUSER;        
   wire                 dbus_WVALID;            
   wire [AXI_ADDR_WIDTH-1:0] ibus_ARADDR;       
   wire [1:0]           ibus_ARBURST;           
   wire [3:0]           ibus_ARCACHE;           
   wire [AXI_ID_WIDTH-1:0] ibus_ARID;           
   wire [7:0]           ibus_ARLEN;             
   wire                 ibus_ARLOCK;            
   wire [2:0]           ibus_ARPROT;            
   wire [3:0]           ibus_ARQOS;             
   wire                 ibus_ARREADY;           
   wire [3:0]           ibus_ARREGION;          
   wire [2:0]           ibus_ARSIZE;            
   wire [AXI_USER_WIDTH-1:0] ibus_ARUSER;       
   wire                 ibus_ARVALID;           
   wire                 ibus_AWREADY;           
   wire [AXI_ID_WIDTH-1:0] ibus_BID;            
   wire [1:0]           ibus_BRESP;             
   wire [AXI_USER_WIDTH-1:0] ibus_BUSER;        
   wire                 ibus_BVALID;            
   wire [(1<<AXI_P_DW_BYTES)*8-1:0] ibus_RDATA; 
   wire [AXI_ID_WIDTH-1:0] ibus_RID;            
   wire                 ibus_RLAST;             
   wire                 ibus_RREADY;            
   wire [1:0]           ibus_RRESP;             
   wire [AXI_USER_WIDTH-1:0] ibus_RUSER;        
   wire                 ibus_RVALID;            
   wire                 ibus_WREADY;            
   wire [AXI_ADDR_WIDTH-1:0] inner_ARADDR;      
   wire [1:0]           inner_ARBURST;          
   wire [3:0]           inner_ARCACHE;          
   wire [AXI_ID_WIDTH-1:0] inner_ARID;          
   wire [7:0]           inner_ARLEN;            
   wire                 inner_ARLOCK;           
   wire [2:0]           inner_ARPROT;           
   wire [3:0]           inner_ARQOS;            
   wire                 inner_ARREADY;          
   wire [3:0]           inner_ARREGION;         
   wire [2:0]           inner_ARSIZE;           
   wire [AXI_USER_WIDTH-1:0] inner_ARUSER;      
   wire                 inner_ARVALID;          
   wire [AXI_ADDR_WIDTH-1:0] inner_AWADDR;      
   wire [1:0]           inner_AWBURST;          
   wire [3:0]           inner_AWCACHE;          
   wire [AXI_ID_WIDTH-1:0] inner_AWID;          
   wire [7:0]           inner_AWLEN;            
   wire                 inner_AWLOCK;           
   wire [2:0]           inner_AWPROT;           
   wire [3:0]           inner_AWQOS;            
   wire                 inner_AWREADY;          
   wire [3:0]           inner_AWREGION;         
   wire [2:0]           inner_AWSIZE;           
   wire [AXI_USER_WIDTH-1:0] inner_AWUSER;      
   wire                 inner_AWVALID;          
   wire [AXI_ID_WIDTH-1:0] inner_BID;           
   wire                 inner_BREADY;           
   wire [1:0]           inner_BRESP;            
   wire [AXI_USER_WIDTH-1:0] inner_BUSER;       
   wire                 inner_BVALID;           
   wire [(1<<AXI_P_DW_BYTES)*8-1:0] inner_RDATA;
   wire [AXI_ID_WIDTH-1:0] inner_RID;           
   wire                 inner_RLAST;            
   wire                 inner_RREADY;           
   wire [1:0]           inner_RRESP;            
   wire [AXI_USER_WIDTH-1:0] inner_RUSER;       
   wire                 inner_RVALID;           
   wire [(1<<AXI_P_DW_BYTES)*8-1:0] inner_WDATA;
   wire                 inner_WLAST;            
   wire                 inner_WREADY;           
   wire [(1<<AXI_P_DW_BYTES)-1:0] inner_WSTRB;  
   wire [AXI_USER_WIDTH-1:0] inner_WUSER;       
   wire                 inner_WVALID;           
   wire                 tsc_irq;                
   wire [3:0]           io_master_arcache;      
   wire                 io_master_arlock;       
   wire [2:0]           io_master_arprot;       
   wire [3:0]           io_master_arqos;        
   wire [3:0]           io_master_arregion;     
   wire [AXI_USER_WIDTH-1:0] io_master_aruser;  
   wire [3:0]           io_master_awcache;      
   wire                 io_master_awlock;       
   wire [2:0]           io_master_awprot;       
   wire [3:0]           io_master_awqos;        
   wire [3:0]           io_master_awregion;     
   wire [AXI_USER_WIDTH-1:0] io_master_awuser;  
   wire [AXI_USER_WIDTH-1:0] io_master_wuser;   
   wire                 clk;                    
   wire                 rst;                    
   wire  [CONFIG_NUM_IRQ-1:0] irqs;             
   wire  [AXI_ADDR_WIDTH-1:0] ibus_AWADDR;      
   wire  [1:0]          ibus_AWBURST;           
   wire  [3:0]          ibus_AWCACHE;           
   wire  [AXI_ID_WIDTH-1:0] ibus_AWID;          
   wire  [7:0]          ibus_AWLEN;             
   wire                 ibus_AWLOCK;            
   wire  [2:0]          ibus_AWPROT;            
   wire  [3:0]          ibus_AWQOS;             
   wire  [3:0]          ibus_AWREGION;          
   wire  [2:0]          ibus_AWSIZE;            
   wire  [AXI_USER_WIDTH-1:0] ibus_AWUSER;      
   wire                 ibus_AWVALID;           
   wire                 ibus_BREADY;            
   wire  [(1<<AXI_P_DW_BYTES)*8-1:0] ibus_WDATA;
   wire                 ibus_WLAST;             
   wire  [(1<<AXI_P_DW_BYTES)-1:0] ibus_WSTRB;  
   wire  [AXI_USER_WIDTH-1:0] ibus_WUSER;       
   wire                 ibus_WVALID;            
   wire  [AXI_USER_WIDTH-1:0] io_master_buser;  
   wire  [AXI_USER_WIDTH-1:0] io_master_ruser;  
   assign clk = clock;
   assign rst = reset;
   ysyx_210479_ncpu64k
      #(
        .CONFIG_AW                      (CONFIG_AW),
        .CONFIG_DW                      (CONFIG_DW),
        .CONFIG_P_DW                    (CONFIG_P_DW),
        .CONFIG_P_FETCH_WIDTH           (CONFIG_P_FETCH_WIDTH),
        .CONFIG_P_ISSUE_WIDTH           (CONFIG_P_ISSUE_WIDTH),
        .CONFIG_P_PAGE_SIZE             (CONFIG_P_PAGE_SIZE),
        .CONFIG_IC_P_LINE               (CONFIG_IC_P_LINE),
        .CONFIG_IC_P_SETS               (CONFIG_IC_P_SETS),
        .CONFIG_IC_P_WAYS               (CONFIG_IC_P_WAYS),
        .CONFIG_DC_P_LINE               (CONFIG_DC_P_LINE),
        .CONFIG_DC_P_SETS               (CONFIG_DC_P_SETS),
        .CONFIG_DC_P_WAYS               (CONFIG_DC_P_WAYS),
        .CONFIG_PHT_P_NUM               (CONFIG_PHT_P_NUM),
        .CONFIG_BTB_P_NUM               (CONFIG_BTB_P_NUM),
        .CONFIG_P_IQ_DEPTH              (CONFIG_P_IQ_DEPTH),
        .CONFIG_ENABLE_ASR              (CONFIG_ENABLE_ASR),
        .CONFIG_IMMU_ENABLE_UNCACHED_SEG(CONFIG_IMMU_ENABLE_UNCACHED_SEG),
        .CONFIG_DMMU_ENABLE_UNCACHED_SEG(CONFIG_DMMU_ENABLE_UNCACHED_SEG),
        .CONFIG_DTLB_P_SETS             (CONFIG_DTLB_P_SETS),
        .CONFIG_ITLB_P_SETS             (CONFIG_ITLB_P_SETS),
        .CONFIG_PC_RST                  (CONFIG_PC_RST[CONFIG_AW-1:0]),
        .CONFIG_EITM_VECTOR             (CONFIG_EITM_VECTOR[8-1:0]),
        .CONFIG_EIPF_VECTOR             (CONFIG_EIPF_VECTOR[8-1:0]),
        .CONFIG_ESYSCALL_VECTOR         (CONFIG_ESYSCALL_VECTOR[8-1:0]),
        .CONFIG_EINSN_VECTOR            (CONFIG_EINSN_VECTOR[8-1:0]),
        .CONFIG_EIRQ_VECTOR             (CONFIG_EIRQ_VECTOR[8-1:0]),
        .CONFIG_EDTM_VECTOR             (CONFIG_EDTM_VECTOR[8-1:0]),
        .CONFIG_EDPF_VECTOR             (CONFIG_EDPF_VECTOR[8-1:0]),
        .CONFIG_EALIGN_VECTOR           (CONFIG_EALIGN_VECTOR[8-1:0]),
        .CONFIG_NUM_IRQ                 (CONFIG_NUM_IRQ),
        .CONFIG_P_RS_DEPTH              (CONFIG_P_RS_DEPTH),
        .CONFIG_P_ROB_DEPTH             (CONFIG_P_ROB_DEPTH),
        .AXI_P_DW_BYTES                 (AXI_P_DW_BYTES),
        .AXI_UNCACHED_P_DW_BYTES        (AXI_UNCACHED_P_DW_BYTES),
        .AXI_ADDR_WIDTH                 (AXI_ADDR_WIDTH),
        .AXI_ID_WIDTH                   (AXI_ID_WIDTH),
        .AXI_USER_WIDTH                 (AXI_USER_WIDTH))
   U_CORE
      (
       .ibus_ARVALID                    (ibus_ARVALID),
       .ibus_ARADDR                     (ibus_ARADDR[AXI_ADDR_WIDTH-1:0]),
       .ibus_ARPROT                     (ibus_ARPROT[2:0]),
       .ibus_ARID                       (ibus_ARID[AXI_ID_WIDTH-1:0]),
       .ibus_ARUSER                     (ibus_ARUSER[AXI_USER_WIDTH-1:0]),
       .ibus_ARLEN                      (ibus_ARLEN[7:0]),
       .ibus_ARSIZE                     (ibus_ARSIZE[2:0]),
       .ibus_ARBURST                    (ibus_ARBURST[1:0]),
       .ibus_ARLOCK                     (ibus_ARLOCK),
       .ibus_ARCACHE                    (ibus_ARCACHE[3:0]),
       .ibus_ARQOS                      (ibus_ARQOS[3:0]),
       .ibus_ARREGION                   (ibus_ARREGION[3:0]),
       .ibus_RREADY                     (ibus_RREADY),
       .dbus_ARVALID                    (dbus_ARVALID),
       .dbus_ARADDR                     (dbus_ARADDR[AXI_ADDR_WIDTH-1:0]),
       .dbus_ARPROT                     (dbus_ARPROT[2:0]),
       .dbus_ARID                       (dbus_ARID[AXI_ID_WIDTH-1:0]),
       .dbus_ARUSER                     (dbus_ARUSER[AXI_USER_WIDTH-1:0]),
       .dbus_ARLEN                      (dbus_ARLEN[7:0]),
       .dbus_ARSIZE                     (dbus_ARSIZE[2:0]),
       .dbus_ARBURST                    (dbus_ARBURST[1:0]),
       .dbus_ARLOCK                     (dbus_ARLOCK),
       .dbus_ARCACHE                    (dbus_ARCACHE[3:0]),
       .dbus_ARQOS                      (dbus_ARQOS[3:0]),
       .dbus_ARREGION                   (dbus_ARREGION[3:0]),
       .dbus_RREADY                     (dbus_RREADY),
       .dbus_AWVALID                    (dbus_AWVALID),
       .dbus_AWADDR                     (dbus_AWADDR[AXI_ADDR_WIDTH-1:0]),
       .dbus_AWPROT                     (dbus_AWPROT[2:0]),
       .dbus_AWID                       (dbus_AWID[AXI_ID_WIDTH-1:0]),
       .dbus_AWUSER                     (dbus_AWUSER[AXI_USER_WIDTH-1:0]),
       .dbus_AWLEN                      (dbus_AWLEN[7:0]),
       .dbus_AWSIZE                     (dbus_AWSIZE[2:0]),
       .dbus_AWBURST                    (dbus_AWBURST[1:0]),
       .dbus_AWLOCK                     (dbus_AWLOCK),
       .dbus_AWCACHE                    (dbus_AWCACHE[3:0]),
       .dbus_AWQOS                      (dbus_AWQOS[3:0]),
       .dbus_AWREGION                   (dbus_AWREGION[3:0]),
       .dbus_WVALID                     (dbus_WVALID),
       .dbus_WDATA                      (dbus_WDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .dbus_WSTRB                      (dbus_WSTRB[(1<<AXI_P_DW_BYTES)-1:0]),
       .dbus_WLAST                      (dbus_WLAST),
       .dbus_WUSER                      (dbus_WUSER[AXI_USER_WIDTH-1:0]),
       .dbus_BREADY                     (dbus_BREADY),
       .tsc_irq                         (tsc_irq),
       .clk                             (clk),
       .rst                             (rst),
       .ibus_ARREADY                    (ibus_ARREADY),
       .ibus_RVALID                     (ibus_RVALID),
       .ibus_RDATA                      (ibus_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .ibus_RLAST                      (ibus_RLAST),
       .ibus_RRESP                      (ibus_RRESP[1:0]),
       .ibus_RID                        (ibus_RID[AXI_ID_WIDTH-1:0]),
       .ibus_RUSER                      (ibus_RUSER[AXI_USER_WIDTH-1:0]),
       .dbus_ARREADY                    (dbus_ARREADY),
       .dbus_RVALID                     (dbus_RVALID),
       .dbus_RDATA                      (dbus_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]),
       .dbus_RRESP                      (dbus_RRESP[1:0]),
       .dbus_RLAST                      (dbus_RLAST),
       .dbus_RID                        (dbus_RID[AXI_ID_WIDTH-1:0]),
       .dbus_RUSER                      (dbus_RUSER[AXI_USER_WIDTH-1:0]),
       .dbus_AWREADY                    (dbus_AWREADY),
       .dbus_WREADY                     (dbus_WREADY),
       .dbus_BVALID                     (dbus_BVALID),
       .dbus_BRESP                      (dbus_BRESP[1:0]),
       .dbus_BID                        (dbus_BID[AXI_ID_WIDTH-1:0]),
       .dbus_BUSER                      (dbus_BUSER[AXI_USER_WIDTH-1:0]),
       .irqs                            (irqs[CONFIG_NUM_IRQ-1:0]));
   ysyx_210479_axi4_arbiter
      #(
        .AXI_P_DW_BYTES                 (AXI_P_DW_BYTES),
        .AXI_ADDR_WIDTH                 (AXI_ADDR_WIDTH),
        .AXI_ID_WIDTH                   (AXI_ID_WIDTH),
        .AXI_USER_WIDTH                 (AXI_USER_WIDTH))
   U_AXI4_ARBITER
      (
       .s0_ARREADY                      (ibus_ARREADY),          
       .s0_RVALID                       (ibus_RVALID),           
       .s0_RDATA                        (ibus_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]), 
       .s0_RRESP                        (ibus_RRESP[1:0]),       
       .s0_RLAST                        (ibus_RLAST),            
       .s0_RID                          (ibus_RID[AXI_ID_WIDTH-1:0]), 
       .s0_RUSER                        (ibus_RUSER[AXI_USER_WIDTH-1:0]), 
       .s0_AWREADY                      (ibus_AWREADY),          
       .s0_WREADY                       (ibus_WREADY),           
       .s0_BVALID                       (ibus_BVALID),           
       .s0_BRESP                        (ibus_BRESP[1:0]),       
       .s0_BID                          (ibus_BID[AXI_ID_WIDTH-1:0]), 
       .s0_BUSER                        (ibus_BUSER[AXI_USER_WIDTH-1:0]), 
       .s1_ARREADY                      (dbus_ARREADY),          
       .s1_RVALID                       (dbus_RVALID),           
       .s1_RDATA                        (dbus_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]), 
       .s1_RRESP                        (dbus_RRESP[1:0]),       
       .s1_RLAST                        (dbus_RLAST),            
       .s1_RID                          (dbus_RID[AXI_ID_WIDTH-1:0]), 
       .s1_RUSER                        (dbus_RUSER[AXI_USER_WIDTH-1:0]), 
       .s1_AWREADY                      (dbus_AWREADY),          
       .s1_WREADY                       (dbus_WREADY),           
       .s1_BVALID                       (dbus_BVALID),           
       .s1_BRESP                        (dbus_BRESP[1:0]),       
       .s1_BID                          (dbus_BID[AXI_ID_WIDTH-1:0]), 
       .s1_BUSER                        (dbus_BUSER[AXI_USER_WIDTH-1:0]), 
       .m_ARVALID                       (inner_ARVALID),         
       .m_ARADDR                        (inner_ARADDR[AXI_ADDR_WIDTH-1:0]), 
       .m_ARPROT                        (inner_ARPROT[2:0]),     
       .m_ARID                          (inner_ARID[AXI_ID_WIDTH-1:0]), 
       .m_ARUSER                        (inner_ARUSER[AXI_USER_WIDTH-1:0]), 
       .m_ARLEN                         (inner_ARLEN[7:0]),      
       .m_ARSIZE                        (inner_ARSIZE[2:0]),     
       .m_ARBURST                       (inner_ARBURST[1:0]),    
       .m_ARLOCK                        (inner_ARLOCK),          
       .m_ARCACHE                       (inner_ARCACHE[3:0]),    
       .m_ARQOS                         (inner_ARQOS[3:0]),      
       .m_ARREGION                      (inner_ARREGION[3:0]),   
       .m_RREADY                        (inner_RREADY),          
       .m_AWVALID                       (inner_AWVALID),         
       .m_AWADDR                        (inner_AWADDR[AXI_ADDR_WIDTH-1:0]), 
       .m_AWPROT                        (inner_AWPROT[2:0]),     
       .m_AWID                          (inner_AWID[AXI_ID_WIDTH-1:0]), 
       .m_AWUSER                        (inner_AWUSER[AXI_USER_WIDTH-1:0]), 
       .m_AWLEN                         (inner_AWLEN[7:0]),      
       .m_AWSIZE                        (inner_AWSIZE[2:0]),     
       .m_AWBURST                       (inner_AWBURST[1:0]),    
       .m_AWLOCK                        (inner_AWLOCK),          
       .m_AWCACHE                       (inner_AWCACHE[3:0]),    
       .m_AWQOS                         (inner_AWQOS[3:0]),      
       .m_AWREGION                      (inner_AWREGION[3:0]),   
       .m_WVALID                        (inner_WVALID),          
       .m_WDATA                         (inner_WDATA[(1<<AXI_P_DW_BYTES)*8-1:0]), 
       .m_WSTRB                         (inner_WSTRB[(1<<AXI_P_DW_BYTES)-1:0]), 
       .m_WLAST                         (inner_WLAST),           
       .m_WUSER                         (inner_WUSER[AXI_USER_WIDTH-1:0]), 
       .m_BREADY                        (inner_BREADY),          
       .clk                             (clk),
       .rst                             (rst),
       .s0_ARVALID                      (ibus_ARVALID),          
       .s0_ARADDR                       (ibus_ARADDR[AXI_ADDR_WIDTH-1:0]), 
       .s0_ARPROT                       (ibus_ARPROT[2:0]),      
       .s0_ARID                         (ibus_ARID[AXI_ID_WIDTH-1:0]), 
       .s0_ARUSER                       (ibus_ARUSER[AXI_USER_WIDTH-1:0]), 
       .s0_ARLEN                        (ibus_ARLEN[7:0]),       
       .s0_ARSIZE                       (ibus_ARSIZE[2:0]),      
       .s0_ARBURST                      (ibus_ARBURST[1:0]),     
       .s0_ARLOCK                       (ibus_ARLOCK),           
       .s0_ARCACHE                      (ibus_ARCACHE[3:0]),     
       .s0_ARQOS                        (ibus_ARQOS[3:0]),       
       .s0_ARREGION                     (ibus_ARREGION[3:0]),    
       .s0_RREADY                       (ibus_RREADY),           
       .s0_AWVALID                      (ibus_AWVALID),          
       .s0_AWADDR                       (ibus_AWADDR[AXI_ADDR_WIDTH-1:0]), 
       .s0_AWPROT                       (ibus_AWPROT[2:0]),      
       .s0_AWID                         (ibus_AWID[AXI_ID_WIDTH-1:0]), 
       .s0_AWUSER                       (ibus_AWUSER[AXI_USER_WIDTH-1:0]), 
       .s0_AWLEN                        (ibus_AWLEN[7:0]),       
       .s0_AWSIZE                       (ibus_AWSIZE[2:0]),      
       .s0_AWBURST                      (ibus_AWBURST[1:0]),     
       .s0_AWLOCK                       (ibus_AWLOCK),           
       .s0_AWCACHE                      (ibus_AWCACHE[3:0]),     
       .s0_AWQOS                        (ibus_AWQOS[3:0]),       
       .s0_AWREGION                     (ibus_AWREGION[3:0]),    
       .s0_WVALID                       (ibus_WVALID),           
       .s0_WDATA                        (ibus_WDATA[(1<<AXI_P_DW_BYTES)*8-1:0]), 
       .s0_WSTRB                        (ibus_WSTRB[(1<<AXI_P_DW_BYTES)-1:0]), 
       .s0_WLAST                        (ibus_WLAST),            
       .s0_WUSER                        (ibus_WUSER[AXI_USER_WIDTH-1:0]), 
       .s0_BREADY                       (ibus_BREADY),           
       .s1_ARVALID                      (dbus_ARVALID),          
       .s1_ARADDR                       (dbus_ARADDR[AXI_ADDR_WIDTH-1:0]), 
       .s1_ARPROT                       (dbus_ARPROT[2:0]),      
       .s1_ARID                         (dbus_ARID[AXI_ID_WIDTH-1:0]), 
       .s1_ARUSER                       (dbus_ARUSER[AXI_USER_WIDTH-1:0]), 
       .s1_ARLEN                        (dbus_ARLEN[7:0]),       
       .s1_ARSIZE                       (dbus_ARSIZE[2:0]),      
       .s1_ARBURST                      (dbus_ARBURST[1:0]),     
       .s1_ARLOCK                       (dbus_ARLOCK),           
       .s1_ARCACHE                      (dbus_ARCACHE[3:0]),     
       .s1_ARQOS                        (dbus_ARQOS[3:0]),       
       .s1_ARREGION                     (dbus_ARREGION[3:0]),    
       .s1_RREADY                       (dbus_RREADY),           
       .s1_AWVALID                      (dbus_AWVALID),          
       .s1_AWADDR                       (dbus_AWADDR[AXI_ADDR_WIDTH-1:0]), 
       .s1_AWPROT                       (dbus_AWPROT[2:0]),      
       .s1_AWID                         (dbus_AWID[AXI_ID_WIDTH-1:0]), 
       .s1_AWUSER                       (dbus_AWUSER[AXI_USER_WIDTH-1:0]), 
       .s1_AWLEN                        (dbus_AWLEN[7:0]),       
       .s1_AWSIZE                       (dbus_AWSIZE[2:0]),      
       .s1_AWBURST                      (dbus_AWBURST[1:0]),     
       .s1_AWLOCK                       (dbus_AWLOCK),           
       .s1_AWCACHE                      (dbus_AWCACHE[3:0]),     
       .s1_AWQOS                        (dbus_AWQOS[3:0]),       
       .s1_AWREGION                     (dbus_AWREGION[3:0]),    
       .s1_WVALID                       (dbus_WVALID),           
       .s1_WDATA                        (dbus_WDATA[(1<<AXI_P_DW_BYTES)*8-1:0]), 
       .s1_WSTRB                        (dbus_WSTRB[(1<<AXI_P_DW_BYTES)-1:0]), 
       .s1_WLAST                        (dbus_WLAST),            
       .s1_WUSER                        (dbus_WUSER[AXI_USER_WIDTH-1:0]), 
       .s1_BREADY                       (dbus_BREADY),           
       .m_ARREADY                       (inner_ARREADY),         
       .m_RVALID                        (inner_RVALID),          
       .m_RDATA                         (inner_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]), 
       .m_RRESP                         (inner_RRESP[1:0]),      
       .m_RLAST                         (inner_RLAST),           
       .m_RID                           (inner_RID[AXI_ID_WIDTH-1:0]), 
       .m_RUSER                         (inner_RUSER[AXI_USER_WIDTH-1:0]), 
       .m_AWREADY                       (inner_AWREADY),         
       .m_WREADY                        (inner_WREADY),          
       .m_BVALID                        (inner_BVALID),          
       .m_BRESP                         (inner_BRESP[1:0]),      
       .m_BID                           (inner_BID[AXI_ID_WIDTH-1:0]), 
       .m_BUSER                         (inner_BUSER[AXI_USER_WIDTH-1:0])); 
   ysyx_210479_axi4_buf_r
      #(
        .AXI_P_DW_BYTES                 (AXI_P_DW_BYTES),
        .AXI_ADDR_WIDTH                 (AXI_ADDR_WIDTH),
        .AXI_ID_WIDTH                   (AXI_ID_WIDTH),
        .AXI_USER_WIDTH                 (AXI_USER_WIDTH))
   U_AXI4_reg_slice_R
      (
       .s_ARREADY                       (inner_ARREADY),         
       .s_RVALID                        (inner_RVALID),          
       .s_RDATA                         (inner_RDATA[(1<<AXI_P_DW_BYTES)*8-1:0]), 
       .s_RRESP                         (inner_RRESP[1:0]),      
       .s_RLAST                         (inner_RLAST),           
       .s_RID                           (inner_RID[AXI_ID_WIDTH-1:0]), 
       .s_RUSER                         (inner_RUSER[AXI_USER_WIDTH-1:0]), 
       .m_ARVALID                       (io_master_arvalid),     
       .m_ARADDR                        (io_master_araddr[AXI_ADDR_WIDTH-1:0]), 
       .m_ARPROT                        (io_master_arprot[2:0]), 
       .m_ARID                          (io_master_arid[AXI_ID_WIDTH-1:0]), 
       .m_ARUSER                        (io_master_aruser[AXI_USER_WIDTH-1:0]), 
       .m_ARLEN                         (io_master_arlen[7:0]),  
       .m_ARSIZE                        (io_master_arsize[2:0]), 
       .m_ARBURST                       (io_master_arburst[1:0]), 
       .m_ARLOCK                        (io_master_arlock),      
       .m_ARCACHE                       (io_master_arcache[3:0]), 
       .m_ARQOS                         (io_master_arqos[3:0]),  
       .m_ARREGION                      (io_master_arregion[3:0]), 
       .m_RREADY                        (io_master_rready),      
       .clk                             (clk),
       .rst                             (rst),
       .s_ARVALID                       (inner_ARVALID),         
       .s_ARADDR                        (inner_ARADDR[AXI_ADDR_WIDTH-1:0]), 
       .s_ARPROT                        (inner_ARPROT[2:0]),     
       .s_ARID                          (inner_ARID[AXI_ID_WIDTH-1:0]), 
       .s_ARUSER                        (inner_ARUSER[AXI_USER_WIDTH-1:0]), 
       .s_ARLEN                         (inner_ARLEN[7:0]),      
       .s_ARSIZE                        (inner_ARSIZE[2:0]),     
       .s_ARBURST                       (inner_ARBURST[1:0]),    
       .s_ARLOCK                        (inner_ARLOCK),          
       .s_ARCACHE                       (inner_ARCACHE[3:0]),    
       .s_ARQOS                         (inner_ARQOS[3:0]),      
       .s_ARREGION                      (inner_ARREGION[3:0]),   
       .s_RREADY                        (inner_RREADY),          
       .m_ARREADY                       (io_master_arready),     
       .m_RVALID                        (io_master_rvalid),      
       .m_RDATA                         (io_master_rdata[(1<<AXI_P_DW_BYTES)*8-1:0]), 
       .m_RRESP                         (io_master_rresp[1:0]),  
       .m_RLAST                         (io_master_rlast),       
       .m_RID                           (io_master_rid[AXI_ID_WIDTH-1:0]), 
       .m_RUSER                         (io_master_ruser[AXI_USER_WIDTH-1:0])); 
   ysyx_210479_axi4_buf_w
      #(
        .AXI_P_DW_BYTES                 (AXI_P_DW_BYTES),
        .AXI_ADDR_WIDTH                 (AXI_ADDR_WIDTH),
        .AXI_ID_WIDTH                   (AXI_ID_WIDTH),
        .AXI_USER_WIDTH                 (AXI_USER_WIDTH))
   U_AXI4_reg_slice_W
      (
       .s_AWREADY                       (inner_AWREADY),         
       .s_WREADY                        (inner_WREADY),          
       .s_BVALID                        (inner_BVALID),          
       .s_BRESP                         (inner_BRESP[1:0]),      
       .s_BID                           (inner_BID[AXI_ID_WIDTH-1:0]), 
       .s_BUSER                         (inner_BUSER[AXI_USER_WIDTH-1:0]), 
       .m_AWVALID                       (io_master_awvalid),     
       .m_AWADDR                        (io_master_awaddr[AXI_ADDR_WIDTH-1:0]), 
       .m_AWPROT                        (io_master_awprot[2:0]), 
       .m_AWID                          (io_master_awid[AXI_ID_WIDTH-1:0]), 
       .m_AWUSER                        (io_master_awuser[AXI_USER_WIDTH-1:0]), 
       .m_AWLEN                         (io_master_awlen[7:0]),  
       .m_AWSIZE                        (io_master_awsize[2:0]), 
       .m_AWBURST                       (io_master_awburst[1:0]), 
       .m_AWLOCK                        (io_master_awlock),      
       .m_AWCACHE                       (io_master_awcache[3:0]), 
       .m_AWQOS                         (io_master_awqos[3:0]),  
       .m_AWREGION                      (io_master_awregion[3:0]), 
       .m_WVALID                        (io_master_wvalid),      
       .m_WDATA                         (io_master_wdata[(1<<AXI_P_DW_BYTES)*8-1:0]), 
       .m_WSTRB                         (io_master_wstrb[(1<<AXI_P_DW_BYTES)-1:0]), 
       .m_WLAST                         (io_master_wlast),       
       .m_WUSER                         (io_master_wuser[AXI_USER_WIDTH-1:0]), 
       .m_BREADY                        (io_master_bready),      
       .clk                             (clk),
       .rst                             (rst),
       .s_AWVALID                       (inner_AWVALID),         
       .s_AWADDR                        (inner_AWADDR[AXI_ADDR_WIDTH-1:0]), 
       .s_AWPROT                        (inner_AWPROT[2:0]),     
       .s_AWID                          (inner_AWID[AXI_ID_WIDTH-1:0]), 
       .s_AWUSER                        (inner_AWUSER[AXI_USER_WIDTH-1:0]), 
       .s_AWLEN                         (inner_AWLEN[7:0]),      
       .s_AWSIZE                        (inner_AWSIZE[2:0]),     
       .s_AWBURST                       (inner_AWBURST[1:0]),    
       .s_AWLOCK                        (inner_AWLOCK),          
       .s_AWCACHE                       (inner_AWCACHE[3:0]),    
       .s_AWQOS                         (inner_AWQOS[3:0]),      
       .s_AWREGION                      (inner_AWREGION[3:0]),   
       .s_WVALID                        (inner_WVALID),          
       .s_WDATA                         (inner_WDATA[(1<<AXI_P_DW_BYTES)*8-1:0]), 
       .s_WSTRB                         (inner_WSTRB[(1<<AXI_P_DW_BYTES)-1:0]), 
       .s_WLAST                         (inner_WLAST),           
       .s_WUSER                         (inner_WUSER[AXI_USER_WIDTH-1:0]), 
       .s_BREADY                        (inner_BREADY),          
       .m_AWREADY                       (io_master_awready),     
       .m_WREADY                        (io_master_wready),      
       .m_BVALID                        (io_master_bvalid),      
       .m_BRESP                         (io_master_bresp[1:0]),  
       .m_BID                           (io_master_bid[AXI_ID_WIDTH-1:0]), 
       .m_BUSER                         (io_master_buser[AXI_USER_WIDTH-1:0])); 
   assign ibus_AWADDR = {AXI_ADDR_WIDTH{1'b0}};
   assign ibus_AWBURST = 2'b0;
   assign ibus_AWCACHE = 4'b0;
   assign ibus_AWID = {AXI_ID_WIDTH{1'b0}};
   assign ibus_AWLEN = 8'b0;
   assign ibus_AWLOCK = 1'b0;
   assign ibus_AWPROT = 3'b0;
   assign ibus_AWQOS = 4'b0;
   assign ibus_AWREGION = 4'b0;
   assign ibus_AWSIZE = 3'b0;
   assign ibus_AWUSER = {AXI_USER_WIDTH{1'b0}};
   assign ibus_AWVALID = 1'b0;
   assign ibus_BREADY = 1'b0;
   assign ibus_WDATA = {(1<<AXI_P_DW_BYTES)*8{1'b0}};
   assign ibus_WLAST = 1'b0;
   assign ibus_WSTRB = {(1<<AXI_P_DW_BYTES){1'b0}};
   assign ibus_WUSER = {AXI_USER_WIDTH{1'b0}};
   assign ibus_WVALID = 1'b0;
   assign io_master_buser = {AXI_USER_WIDTH{1'b0}};
   assign io_master_ruser = {AXI_USER_WIDTH{1'b0}};
   assign irqs[0] = tsc_irq;
   assign irqs[1] = io_interrupt;
   assign irqs[31:2] = 30'b0;
   assign io_slave_awready = 1'b0;
	assign io_slave_wready = 1'b0;
	assign io_slave_bvalid = 1'b0;
	assign io_slave_bresp = 2'b0;
	assign io_slave_bid = 4'b0;
	assign io_slave_arready = 1'b0;
	assign io_slave_rvalid = 1'b0;
	assign io_slave_rresp = 2'b0;
	assign io_slave_rdata = 64'b0;
	assign io_slave_rlast = 1'b0;
	assign io_slave_rid = 4'b0;
endmodule
