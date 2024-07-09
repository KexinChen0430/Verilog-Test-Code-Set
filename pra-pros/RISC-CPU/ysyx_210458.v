//////difine////////
    // `define YSYX210458_ENAENABLE_DFT
    `define YSYX210458_ENAENABLE_SoC
    // `define YSYX210458_ENAENABLE_SIMBPU
    `define YSYX210458_ENAENABLE_NEXT
    // `define YSYX210458_PREFCOUNT
    `define YSYX210458_ENAENABLE_IVIC
    // `define YSYX210458_ENAENABLE_NIVIC
    `define YSYX210458_COUNT   25
   `define YSYX210458_BR_BUS_WD       66 //64+1+1//第一个，Error_01
    `define YSYX210458_FS_TO_DS_BUS_WD 128//97
    `define YSYX210458_DS_TO_ES_BUS_WD 452//451 //为了xori
    `define YSYX210458_ES_TO_MS_BUS_WD 268//267 
    `define YSYX210458_MS_TO_WS_BUS_WD 267//259
    `define YSYX210458_WS_TO_C0_BUS_WD 180//179 
    `define YSYX210458_WS_TO_RF_BUS_WD 70
    `define YSYX210458_ES_TO_RF_BUS_WD 65 
    `define   YSYX210458_TO_DS_BUS_WD 71 
    `define YSYX210458_ES_TO_DS_BUS_WD 72 //比其他两个增加了一个inst_lw位
    `define YSYX210458_DS_TO_TH_BUS_WD 12
    `define   YSYX210458_TO_TH_BUS_WD 7
    `define YSYX210458_ES_TO_TH_BUS_WD 9
    `define YSYX210458_MS_TO_TH_BUS_WD 10 
    `define  YSYX210458_OUT_TH_BUS_WD 2
    `define  YSYX210458_BPU_TO_DS_BUS_WD 5
    `define  YSYX210458_DS_TO_BPU_BUS_WD 129
    `define  YSYX210458_ES_FLUSH_BUS_WD 65
    `define  YSYX210458_WS_TO_CSR_BUS_WD 156

    `define YSYX210458_AXI_ADDR_WIDTH      64
    `define YSYX210458_AXI_DATA_WIDTH      64
    `define YSYX210458_AXI_ID_WIDTH        4
    `define YSYX210458_AXI_USER_WIDTH      1

    `define   YSYX210458_ADDR_WIDTH  32
    `define   YSYX210458_DATA_WIDTH  64
    `define   YSYX210458_OFFSET_W    5 
    `define   YSYX210458_INDEX_W   6
    `define    YSYX210458_TAG_W    21
    `define   YSYX210458_LINE_W    256
    `define  YSYX210458_WSTRB_W   8
    `define  YSYX210458_INST_W 32
    

//    `timescale 1ns / 1ps
    `define YSYX210458_ZERO_WORD  64'h00000000_00000000
    `define YSYX210458_PC_START   64'h00000000_80000000  
    `define YSYX210458_REG_BUS    63 : 0     


`ifdef  YSYX210458_ENAENABLE_SoC
module ysyx_210458(
  input         clock,
  input         reset,
  input         io_interrupt,
  input         io_master_awready,
  output        io_master_awvalid,
  output [31:0] io_master_awaddr,
  output [3:0]  io_master_awid,
  output [7:0]  io_master_awlen,
  output [2:0]  io_master_awsize,
  output [1:0]  io_master_awburst,
  input         io_master_wready,
  output        io_master_wvalid,
  output [63:0] io_master_wdata,
  output [7:0]  io_master_wstrb,
  output        io_master_wlast,
  output        io_master_bready,
  input         io_master_bvalid,
  input  [1:0]  io_master_bresp,
  input  [3:0]  io_master_bid,
  input         io_master_arready,
  output        io_master_arvalid,
  output [31:0] io_master_araddr,
  output [3:0]  io_master_arid,
  output [7:0]  io_master_arlen,
  output [2:0]  io_master_arsize,
  output [1:0]  io_master_arburst,
  output        io_master_rready,
  input         io_master_rvalid,
  input  [1:0]  io_master_rresp,
  input  [63:0] io_master_rdata,
  input         io_master_rlast,
  input  [3:0]  io_master_rid,
  output        io_slave_awready,
  input         io_slave_awvalid,
  input  [31:0] io_slave_awaddr,
  input  [3:0]  io_slave_awid,
  input  [7:0]  io_slave_awlen,
  input  [2:0]  io_slave_awsize,
  input  [1:0]  io_slave_awburst,
  output        io_slave_wready,
  input         io_slave_wvalid,
  input  [63:0] io_slave_wdata,
  input  [7:0]  io_slave_wstrb,
  input         io_slave_wlast,
  input         io_slave_bready,
  output        io_slave_bvalid,
  output [1:0]  io_slave_bresp,
  output [3:0]  io_slave_bid,
  output        io_slave_arready,
  input         io_slave_arvalid,
  input  [31:0] io_slave_araddr,
  input  [3:0]  io_slave_arid,
  input  [7:0]  io_slave_arlen,
  input  [2:0]  io_slave_arsize,
  input  [1:0]  io_slave_arburst,
  input         io_slave_rready,
  output        io_slave_rvalid,
  output [1:0]  io_slave_rresp,
  output [63:0] io_slave_rdata,
  output        io_slave_rlast,
  output [3:0]  io_slave_rid
);

ysyx_210458_SimTop u_simtop(
  .clock              (clock),
  .reset              (reset),

`ifdef  YSYX210458_ENAENABLE_DFT
 .io_logCtrl_log_begin                  (),
 .io_logCtrl_log_end                    (),
 .io_logCtrl_log_level                  (),
 .io_perfInfo_clean                     (),
 .io_perfInfo_dump                      (),

 .io_uart_out_valid                     (),
 .io_uart_out_ch                        (),
 .io_uart_in_valid                      (),
 .io_uart_in_ch                         (),
 `endif

.io_memAXI_0_aw_ready          (io_master_awready),
.io_memAXI_0_aw_valid          (io_master_awvalid),
.io_memAXI_0_aw_bits_addr      (io_master_awaddr),    
.io_memAXI_0_aw_bits_prot      (),
.io_memAXI_0_aw_bits_id        (io_master_awid),
.io_memAXI_0_aw_bits_user      (),
.io_memAXI_0_aw_bits_len       (io_master_awlen),
.io_memAXI_0_aw_bits_size      (io_master_awsize),
.io_memAXI_0_aw_bits_burst     (io_master_awburst),
.io_memAXI_0_aw_bits_lock      (),
.io_memAXI_0_aw_bits_cache     (),
.io_memAXI_0_aw_bits_qos       (),
    
.io_memAXI_0_w_ready           (io_master_wready),
.io_memAXI_0_w_valid           (io_master_wvalid),
.io_memAXI_0_w_bits_data       (io_master_wdata),
.io_memAXI_0_w_bits_strb       (io_master_wstrb), 
.io_memAXI_0_w_bits_last       (io_master_wlast),
.io_memAXI_0_w_bits_id         (),
    
.io_memAXI_0_b_ready           (io_master_bready),
.io_memAXI_0_b_valid           (io_master_bvalid),
.io_memAXI_0_b_bits_resp       (io_master_bresp),
.io_memAXI_0_b_bits_id         (io_master_bid),
`ifdef  YSYX210458_ENAENABLE_DFT
.io_memAXI_0_b_bits_user       (),
`endif

.io_memAXI_0_ar_ready          (io_master_arready),
.io_memAXI_0_ar_valid          (io_master_arvalid),
.io_memAXI_0_ar_bits_addr      (io_master_araddr),
.io_memAXI_0_ar_bits_prot      (),
.io_memAXI_0_ar_bits_id        (io_master_arid),
.io_memAXI_0_ar_bits_user      (),
.io_memAXI_0_ar_bits_len       (io_master_arlen),
.io_memAXI_0_ar_bits_size      (io_master_arsize),
.io_memAXI_0_ar_bits_burst     (io_master_arburst),
.io_memAXI_0_ar_bits_lock      (),
.io_memAXI_0_ar_bits_cache     (),
.io_memAXI_0_ar_bits_qos       (),
    
.io_memAXI_0_r_ready           (io_master_rready),
.io_memAXI_0_r_valid           (io_master_rvalid),
.io_memAXI_0_r_bits_resp       (io_master_rresp),
.io_memAXI_0_r_bits_data       (io_master_rdata),
.io_memAXI_0_r_bits_last       (io_master_rlast),
`ifdef  YSYX210458_ENAENABLE_DFT
.io_memAXI_0_r_bits_user       (),
`endif
.io_memAXI_0_r_bits_id         (io_master_rid)



);

endmodule

`endif


////////Simtop////////
`ifdef  YSYX210458_ENAENABLE_SoC
module ysyx_210458_SimTop
`endif

`ifdef  YSYX210458_ENAENABLE_DFT
 mod_ule SimTop
`endif
(
    input                               clock,
    input                               reset,
`ifdef  YSYX210458_ENAENABLE_DFT
    input  [63:0]                       io_logCtrl_log_begin,
    input  [63:0]                       io_logCtrl_log_end,
    input  [63:0]                       io_logCtrl_log_level,
    input                               io_perfInfo_clean,
    input                               io_perfInfo_dump,

    output                              io_uart_out_valid,
    output [7:0]                        io_uart_out_ch,
    output                              io_uart_in_valid,
    input  [7:0]                        io_uart_in_ch,
`endif

    input                               io_memAXI_0_aw_ready ,
    output                              io_memAXI_0_aw_valid ,
    output [`YSYX210458_ADDR_WIDTH-1:0]            io_memAXI_0_aw_bits_addr ,
    output [2:0]                        io_memAXI_0_aw_bits_prot ,
    output [`YSYX210458_AXI_ID_WIDTH-1:0]          io_memAXI_0_aw_bits_id ,
    output [`YSYX210458_AXI_USER_WIDTH-1:0]        io_memAXI_0_aw_bits_user ,
    output [7:0]                        io_memAXI_0_aw_bits_len ,
    output [2:0]                        io_memAXI_0_aw_bits_size ,
    output [1:0]                        io_memAXI_0_aw_bits_burst ,
    output                              io_memAXI_0_aw_bits_lock ,
    output [3:0]                        io_memAXI_0_aw_bits_cache ,
    output [3:0]                        io_memAXI_0_aw_bits_qos ,
    
    input                               io_memAXI_0_w_ready ,
    output                              io_memAXI_0_w_valid ,
    `ifdef YSYX210458_ENAENABLE_SoC
    output [`YSYX210458_AXI_DATA_WIDTH-1:0]        io_memAXI_0_w_bits_data ,
    `endif

    `ifdef YSYX210458_ENAENABLE_DFT
    output [`YSYX210458_AXI_DATA_WIDTH-1:0]        io_memAXI_0_w_bits_data[3:0] ,
    `endif

    output [`YSYX210458_AXI_DATA_WIDTH/8-1:0]      io_memAXI_0_w_bits_strb ,
    output                              io_memAXI_0_w_bits_last ,
    output [`YSYX210458_AXI_ID_WIDTH-1:0]          io_memAXI_0_w_bits_id ,
    
    output                              io_memAXI_0_b_ready ,
    input                               io_memAXI_0_b_valid ,
    input  [1:0]                        io_memAXI_0_b_bits_resp ,
    input  [`YSYX210458_AXI_ID_WIDTH-1:0]          io_memAXI_0_b_bits_id ,
    `ifdef  YSYX210458_ENAENABLE_DFT
    input  [`YSYX210458_AXI_USER_WIDTH-1:0]        io_memAXI_0_b_bits_user ,
    `endif
    input                               io_memAXI_0_ar_ready ,
    output                              io_memAXI_0_ar_valid ,
    output [`YSYX210458_ADDR_WIDTH-1:0]            io_memAXI_0_ar_bits_addr ,
    output [2:0]                        io_memAXI_0_ar_bits_prot ,
    output [`YSYX210458_AXI_ID_WIDTH-1:0]          io_memAXI_0_ar_bits_id ,
    output [`YSYX210458_AXI_USER_WIDTH-1:0]        io_memAXI_0_ar_bits_user ,
    output [7:0]                        io_memAXI_0_ar_bits_len ,
    output [2:0]                        io_memAXI_0_ar_bits_size ,
    output [1:0]                        io_memAXI_0_ar_bits_burst ,
    output                              io_memAXI_0_ar_bits_lock ,
    output [3:0]                        io_memAXI_0_ar_bits_cache ,
    output [3:0]                        io_memAXI_0_ar_bits_qos ,
    
    output                              io_memAXI_0_r_ready ,
    input                               io_memAXI_0_r_valid ,
    input  [1:0]                        io_memAXI_0_r_bits_resp ,

    `ifdef YSYX210458_ENAENABLE_DFT
    output [`YSYX210458_AXI_DATA_WIDTH-1:0]        io_memAXI_0_r_bits_data[3:0] ,
    input  [`YSYX210458_AXI_USER_WIDTH-1:0]        io_memAXI_0_r_bits_user  ,
    `endif

    `ifdef YSYX210458_ENAENABLE_SoC
    input  [`YSYX210458_AXI_DATA_WIDTH-1:0]        io_memAXI_0_r_bits_data  ,
    `endif
    input                               io_memAXI_0_r_bits_last ,
    input  [`YSYX210458_AXI_ID_WIDTH-1:0]          io_memAXI_0_r_bits_id 
    

    
);
wire         clk;
assign clk = clock;
wire         ds_allowin;
wire         es_allowin;
wire         ms_allowin;
wire         ws_allowin;
wire         fs_to_ds_valid;
wire         ds_to_es_valid;
wire         es_to_ms_valid;
wire         ms_to_ws_valid;
// wire         ms_to_es_ex;
// wire         ws_to_es_ex;
wire         cr_flush_o;
wire         ms_will_to_ws;
wire         es_to_ms_cancel_first_back;
wire         ms_to_es_data_alok;
wire         ms_to_es_data_alok2;
wire         queue_almost_full;


wire [`YSYX210458_FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus;
wire [`YSYX210458_DS_TO_ES_BUS_WD -1:0] ds_to_es_bus;
wire [`YSYX210458_ES_TO_MS_BUS_WD -1:0] es_to_ms_bus;
wire [`YSYX210458_MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus;
wire [`YSYX210458_WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus;
wire [`YSYX210458_BR_BUS_WD       -1:0] br_bus;
wire [`YSYX210458_BPU_TO_DS_BUS_WD -1:0] bpu_to_ds_bus ;
wire [`YSYX210458_DS_TO_BPU_BUS_WD -1:0] ds_to_bpu_bus;

wire [`YSYX210458_WS_TO_CSR_BUS_WD -1:0] ws_to_csr_bus;
wire  [63:0]                  csr_rdata;
wire  [63:0]                  csr_flush_pc;
wire                          csr_MIE;
wire                          csr_MTIE;
wire                          time_int;
wire                          ws_to_es_flush;
wire                          ms_to_es_flush;

//forward
wire [`YSYX210458_DS_TO_TH_BUS_WD -1:0] ds_to_th_bus;
wire [`YSYX210458_ES_TO_TH_BUS_WD   -1:0] es_to_th_bus;
wire [`YSYX210458_MS_TO_TH_BUS_WD   -1:0] ms_to_th_bus;
wire [`YSYX210458_TO_TH_BUS_WD   -1:0] ws_to_th_bus;

wire [`YSYX210458_ES_TO_DS_BUS_WD -1:0] es_to_ds_bus;
wire [`YSYX210458_TO_DS_BUS_WD -1:0] ms_to_ds_bus;
wire [`YSYX210458_TO_DS_BUS_WD -1:0] ws_to_ds_bus;
wire [`YSYX210458_ES_FLUSH_BUS_WD -1:0] es_flush_bus;


wire [`YSYX210458_OUT_TH_BUS_WD  -1:0] data_haza_bus;

//wire [`YSYX210458_ES_TO_RF_BUS_WD -1:0] es_to_rfo_bus;
wire [`YSYX210458_WS_TO_C0_BUS_WD -1:0]  ws_to_c0_bus;
wire [31:0]                   mfc0_out_data;
wire [32:0]                   cr_to_fs_bus;
// wire [32:0]                   ms_to_cr_bus;
wire  csr_flush_o;
wire  data_sram_data_ok_axi;
wire  mem_to_mtime;
wire  mem_to_cmp;

`ifdef  YSYX210458_ENAENABLE_DFT
////difftest
wire [63:0]     regs [31:0];
wire [63:0] debug_wb_pc;
wire [31:0] debug_wb_inst;
wire        debug_wb_valid;
wire        debug_wb_rf_wen;
wire [ 4:0] debug_wb_rf_wnum;
wire [63:0] debug_wb_rf_wdata;
wire [63:0] a0_value;
wire        ws_skip;


wire [63:0] diff_mstatus;
wire [63:0] diff_mepc   ;
wire [63:0] diff_mtvec  ;
wire [63:0] diff_mcause ;
wire [63:0] diff_mip    ;
wire [63:0] diff_mie    ;
wire [63:0] data_sram_rdata_m;
wire [3:0] diff_intrNO;
wire [3:0] diff_cause;
assign a0_value =regs[10];
assign io_uart_out_ch = a0_value[7:0];

`endif



/////////I_CACHE PORT//////////
wire        i_valid;
wire        i_uncache;
wire        i_op;
wire        i_fence;
wire [2:0]  i_size;
wire [`YSYX210458_INDEX_W -1:0]  i_index;
wire [`YSYX210458_TAG_W -1:0] i_tag;
wire [`YSYX210458_OFFSET_W -1:0]  i_offset;
wire        i_addr_ok;
wire        i_data_ok;
wire        i_data_ok2;
wire[`YSYX210458_INST_W -1:0]  i_rdata;

wire          rd_req   ;
wire [2:0]    rd_type  ;
wire [`YSYX210458_ADDR_WIDTH -1:0]   rd_addr  ;
wire          rd_rdy   ;
wire          ret_valid;
wire          ret_last ;
wire[`YSYX210458_DATA_WIDTH -1:0]    ret_data;

/////////D_CACHE PORT//////////
wire        d_valid;
wire        d_op;
wire        d_uncache;
wire        d_fence;
wire [2:0]  d_size;
wire [`YSYX210458_INDEX_W -1  :0]  d_index;
wire [`YSYX210458_TAG_W   -1  :0] d_tag;
wire [`YSYX210458_OFFSET_W -1 :0]  d_offset;
wire [`YSYX210458_WSTRB_W -1  :0]  d_wstrb;
wire [`YSYX210458_DATA_WIDTH -1:0] d_wdata;
wire        d_addr_ok;
wire        d_data_ok;
wire        d_data_ok2;
wire[`YSYX210458_DATA_WIDTH -1:0]  d_rdata;

wire         d_rd_req   ;
wire [2:0]   d_rd_type  ;
wire [`YSYX210458_ADDR_WIDTH -1:0]  d_rd_addr  ;
wire         d_rd_rdy   ;
wire         d_ret_valid;
wire         d_ret_last ;
wire[`YSYX210458_DATA_WIDTH -1:0]   d_ret_data;
wire         d_wr_rdy;

wire            d_wr_req;
wire [2:0]      d_wr_type;
wire [`YSYX210458_ADDR_WIDTH -1:0]     d_wr_addr;
wire [`YSYX210458_WSTRB_W -1  :0]      d_wr_wstrb;
wire [`YSYX210458_LINE_W -1:0]    d_wr_data;

ysyx_210458_cache #(
    .IS_ICACHE      (1'b1)
) 
u_Icache(
    .clk           (clk         ),
    .reset         (reset       ),
    .uncache       (i_uncache   ),
    .valid         (i_valid     ),
    .op            (i_op        ),
    .fence_valid   (i_fence     ),
    .size          (i_size      ),
    .index         (i_index     ),
    .tag           (i_tag       ),
    .offset        (i_offset    ),
    .wstrb         ({`YSYX210458_WSTRB_W{1'b0}}  ),
    .wdata         ({`YSYX210458_DATA_WIDTH{1'b0}}  ),
    .addr_ok       (i_addr_ok   ),
    .data_ok       (i_data_ok   ),
    .data_ok2      (i_data_ok2  ),
    .rdata         ( ),
    .inst          (i_rdata     ),
    .rd_req        (rd_req      ),
    .rd_type       (rd_type     ),
    .rd_addr       (rd_addr     ),
    .rd_rdy        (rd_rdy      ),
    .ret_valid     (ret_valid   ),
    .ret_last      (ret_last    ),
    .ret_data      (ret_data    ),
    //
    .wr_rdy         (1'b1),
    .wr_req             (),
    .wr_type            (),
    .wr_addr            (),
    .wr_wstrb           (),
    .wr_data            ()

    
);

ysyx_210458_cache u_Dcache(
    .clk          (clk),
    .reset         (reset),
    .uncache       (d_uncache),
    .valid         (d_valid),
    .op            (d_op        ),
    .fence_valid   (d_fence     ),
    .size          (d_size      ),
    .index         (d_index     ),
    .tag           (d_tag       ),
    .offset        (d_offset    ),
    .wstrb         (d_wstrb     ),
    .wdata         (d_wdata     ),
    .addr_ok       (d_addr_ok   ),
    .data_ok       (d_data_ok   ),
    .data_ok2      (d_data_ok2  ),
    .rdata         (d_rdata     ),
    .inst          (),
    .rd_req        (d_rd_req),
    .rd_type       (d_rd_type),
    .rd_addr        (d_rd_addr),
    .rd_rdy         (d_rd_rdy),
    .ret_valid      (d_ret_valid),
    .ret_last       (d_ret_last),
    .ret_data      (d_ret_data),
    
    .wr_req             (d_wr_req),
    .wr_type            (d_wr_type),
    .wr_addr            (d_wr_addr),
    .wr_wstrb           (d_wr_wstrb),
    .wr_data            (d_wr_data),
    .wr_rdy             (d_wr_rdy)
    //
);


ysyx_210458_AXI_bridge axi_bridge(
    .clk            (clk            ),
    .reset          (reset          ),
    
    .cpu_arid      (io_memAXI_0_ar_bits_id      ),
    .cpu_araddr    (io_memAXI_0_ar_bits_addr    ),
    .cpu_arlen     (io_memAXI_0_ar_bits_len     ),
    .cpu_arsize    (io_memAXI_0_ar_bits_size    ),
    .cpu_arburst   (io_memAXI_0_ar_bits_burst   ),
    .cpu_arlock    (io_memAXI_0_ar_bits_lock    ),
    .cpu_arcache   (io_memAXI_0_ar_bits_cache   ),
    .cpu_arprot    (io_memAXI_0_ar_bits_prot   ),
    .cpu_arvalid   (io_memAXI_0_ar_valid  ),
    .cpu_arready   (io_memAXI_0_ar_ready   ),
                
    .cpu_rid       (io_memAXI_0_r_bits_id       ),
    `ifdef YSYX210458_ENAENABLE_DFT
    .cpu_rdata     (io_memAXI_0_r_bits_data[0]     ),
    `endif

    `ifdef YSYX210458_ENAENABLE_SoC
    .cpu_rdata     (io_memAXI_0_r_bits_data     ),
    `endif

    .cpu_rresp     (io_memAXI_0_r_bits_resp     ),
    .cpu_rlast     (io_memAXI_0_r_bits_last     ),
    .cpu_rvalid    (io_memAXI_0_r_valid    ),
    .cpu_rready    (io_memAXI_0_r_ready    ),
               
    .cpu_awid      (io_memAXI_0_aw_bits_id      ),
    .cpu_awaddr    (io_memAXI_0_aw_bits_addr    ),
    .cpu_awlen     (io_memAXI_0_aw_bits_len     ),
    .cpu_awsize    (io_memAXI_0_aw_bits_size    ),
    .cpu_awburst   (io_memAXI_0_aw_bits_burst   ),
    .cpu_awlock    (io_memAXI_0_aw_bits_lock    ),
    .cpu_awcache   (io_memAXI_0_aw_bits_cache   ),
    .cpu_awprot    (io_memAXI_0_aw_bits_prot    ),
    .cpu_awvalid   (io_memAXI_0_aw_valid   ),
    .cpu_awready   (io_memAXI_0_aw_ready   ),
    
    .cpu_wid       (io_memAXI_0_w_bits_id       ),
    `ifdef YSYX210458_ENAENABLE_DFT
    .cpu_wdata     (io_memAXI_0_w_bits_data[0]  ),
    `endif

    `ifdef YSYX210458_ENAENABLE_SoC
    .cpu_wdata     (io_memAXI_0_w_bits_data  ),
    `endif
    
    .cpu_wstrb     (io_memAXI_0_w_bits_strb     ),
    .cpu_wlast     (io_memAXI_0_w_bits_last     ),
    .cpu_wvalid    (io_memAXI_0_w_valid   ),
    .cpu_wready    (io_memAXI_0_w_ready    ),
    
    .cpu_bid       (io_memAXI_0_b_bits_id       ),
    .cpu_bresp     (io_memAXI_0_b_bits_resp     ),
    .cpu_bvalid    (io_memAXI_0_b_valid    ),
    .cpu_bready    (io_memAXI_0_b_ready    ),
   
   

    //  // inst sram interface
    .rd_req             (rd_req),
    .rd_type            (rd_type),
    .rd_addr            (rd_addr),
    .rd_rdy             (rd_rdy),
    .ret_valid          (ret_valid),
    .ret_last           (ret_last),
    .ret_data           (ret_data),

    // data sram interface
    
    .d_rd_req             (d_rd_req),
    .d_rd_type            (d_rd_type),
    .d_rd_addr            (d_rd_addr),
    .d_rd_rdy             (d_rd_rdy),
    .d_ret_valid          (d_ret_valid),
    .d_ret_last           (d_ret_last),
    .d_ret_data           (d_ret_data),

    .d_wr_req             (d_wr_req),
    .d_wr_type            (d_wr_type),
    .d_wr_addr            (d_wr_addr),
    .d_wr_wstrb           (d_wr_wstrb),
    .d_wr_data            (d_wr_data),
    .d_wr_rdy             (d_wr_rdy)

);

// IF stage
ysyx_210458_IF_stage if_stage(
    .clk            (clk            ),
    .reset          (reset          ),

    //allowin
    .ds_allowin     (ds_allowin     ),
    //br_bus
    .br_bus         (br_bus         ),
    .queue_almost_full (queue_almost_full),
    // .cr_to_fs_bus   (cr_to_fs_bus),
    .ds_to_bpu_bus  (ds_to_bpu_bus),
    .es_flush_bus   (es_flush_bus),
    // .ms_to_fs_ex    (ms_to_fs_ex),
    // .ws_to_fs_ex    (ws_to_fs_ex),
    //outputs
    .fs_to_ds_valid (fs_to_ds_valid ),
    .fs_to_ds_bus   (fs_to_ds_bus   ),
    .bpu_to_ds_bus  (bpu_to_ds_bus),
    //csr_flush
    .csr_flush_o    (csr_flush_o),
    .csr_flush_pc   (csr_flush_pc),
    // inst sram interface
    .i_valid         (i_valid),
    .i_uncache       (i_uncache),
    .i_op            (i_op     ),
    .i_size          (i_size   ),
    .i_index         (i_index  ),
    .i_tag           (i_tag    ),
    .i_offset        (i_offset ),
    .i_addr_ok       (i_addr_ok),
    .i_data_ok       (i_data_ok)
    // .i_rdata         (i_rdata  )

    
);


// ID stage
ysyx_210458_ID_stage id_stage(
    .clk            (clk            ),
    .reset          (reset          ),

    //allowin
    .es_allowin     (es_allowin     ),
    .ds_allowin     (ds_allowin     ),
    //from fs
    .fs_to_ds_valid (fs_to_ds_valid ),
    .fs_to_ds_bus   (fs_to_ds_bus   ),
    .bpu_to_ds_bus  (bpu_to_ds_bus),
    //from I$
    .ds_inst_dir       (i_rdata        ),
    .data_ok2       (i_data_ok2     ),
    //to es
    .ds_to_es_valid (ds_to_es_valid ),
    .ds_to_es_bus   (ds_to_es_bus   ),
    //to fs
    .br_bus         (br_bus         ),
    .ds_to_bpu_bus  (ds_to_bpu_bus),
    .queue_almost_full (queue_almost_full),

    //to rf: for write back
    .ws_to_rf_bus   (ws_to_rf_bus   ),
    .ds_to_th_bus   (ds_to_th_bus   ),

    .es_to_ds_bus   (es_to_ds_bus   ),
    .ms_to_ds_bus   (ms_to_ds_bus   ),
    .ws_to_ds_bus   (ws_to_ds_bus   ),
    .data_haza_bus  (data_haza_bus  ),
    //time_int//
    .time_int       (time_int       ),
    .csr_MIE        (csr_MIE        ),
    .csr_MTIE       (csr_MTIE       ),

    //.es_to_rfo_bus  (es_to_rfo_bus),
    .cr_flush_o     (es_flush_bus[64] | csr_flush_o)

    `ifdef YSYX210458_ENAENABLE_DFT 
    ,
    .regs_o         (regs)

    `endif

);


// EXE stage
ysyx_210458_EXE_stage exe_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ms_allowin     (ms_allowin     ),
    .es_allowin     (es_allowin     ),
    .ms_will_to_ws  (ms_will_to_ws  ),
    //from ds
    .ds_to_es_valid (ds_to_es_valid ),
    .ds_to_es_bus   (ds_to_es_bus   ),
    //flush
    .es_flush_bus   (es_flush_bus),
    //to ms
    .es_to_ms_valid (es_to_ms_valid ),
    .es_to_ms_bus   (es_to_ms_bus   ),
    .es_to_ms_cancel_first_back (es_to_ms_cancel_first_back),
    // data sram interface

    .es_to_ds_bus   (es_to_ds_bus   ),
    .es_to_th_bus    (es_to_th_bus),
    .ms_to_es_data_alok2 (ms_to_es_data_alok2),
    .ms_to_es_data_alok  (ms_to_es_data_alok),
    .mem_to_cmp         (mem_to_cmp),
    .mem_to_mtime       (mem_to_mtime),
    //
    .d_valid         (d_valid),
    .d_op            (d_op),
    .d_fence         (d_fence),
    .d_uncache       (d_uncache),
    .d_size          (d_size   ),
    .d_index         (d_index  ),
    .d_tag           (d_tag    ),
    .d_offset        (d_offset ),
    .d_wstrb         (d_wstrb  ),
    .d_wdata         (d_wdata  ),
    .d_addr_ok       (d_addr_ok),
    .d_data_ok       (d_data_ok),
    // .d_rdata         (d_rdata  ),

    //.es_to_rfo_bus      (es_to_rfo_bus),
    .ms_to_es_flush        (ms_to_es_flush),
    .ws_to_es_flush        (ws_to_es_flush),
    .cr_flush_o     (csr_flush_o)
);


wire        clint_data_ok;
wire [`YSYX210458_DATA_WIDTH -1:0]        clint_rdata;

// CLINT //
ysyx_210458_clint u_clint (
    .clk          (clk),
    .reset        (reset),
    .mem_to_cmp    (mem_to_cmp),
    .mem_to_mtime  (mem_to_mtime),
    .wr           (d_op),
    .wstrb        (d_wstrb),
    .wdata        (d_wdata),
    .clint_data_ok (clint_data_ok),
    .time_int      (time_int),
    .clint_rdata  (clint_rdata)
);
wire [`YSYX210458_DATA_WIDTH -1:0] mem_rdata;
wire                    mem_data_ok,mem_data_ok2;
reg clint_data_ok2;
reg [`YSYX210458_DATA_WIDTH -1:0] clint_rdata_buf2;
always @(posedge clk) begin
    if (reset) begin
        clint_data_ok2 <= 1'b0;
    end
    else clint_data_ok2 <= clint_data_ok;

    if (reset) begin
        clint_rdata_buf2 <= {`YSYX210458_DATA_WIDTH{1'b0}};
    end
    else clint_rdata_buf2 <= clint_rdata;
    
end
assign mem_rdata =clint_data_ok2 ? clint_rdata_buf2 : d_rdata;
assign mem_data_ok = clint_data_ok ? 1'b1 : d_data_ok;
assign mem_data_ok2 = clint_data_ok2 ? 1'b1 : d_data_ok2;


// MEM stage
ysyx_210458_MEM_stage mem_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ws_allowin     (ws_allowin     ),
    .ms_allowin     (ms_allowin     ),
    .ms_will_to_ws  (ms_will_to_ws ),
    //from es
    .es_to_ms_valid (es_to_ms_valid ),
    .es_to_ms_bus   (es_to_ms_bus   ),
    .es_to_ms_cancel_first_back (es_to_ms_cancel_first_back),
    //to ws
    .ms_to_ws_valid (ms_to_ws_valid ),
    .ms_to_ws_bus   (ms_to_ws_bus   ),
    //from data-sram
    // .data_sram_data_ok (data_sram_data_ok),
    // .data_sram_rdata(data_sram_rdata),
    // .data_sram_addr_ok (data_sram_addr_ok),
    // .data_sram_req      (data_sram_req),
    .d_rdata        (mem_rdata),
    .d_data_ok      (mem_data_ok ),
    .d_data_ok2     (mem_data_ok2),

    .ms_to_es_data_alok2 (ms_to_es_data_alok2),
    .ms_to_es_data_alok  (ms_to_es_data_alok),



    .ms_to_ds_bus   (ms_to_ds_bus   ),
    .ms_to_th_bus    (ms_to_th_bus),
    .ms_to_es_flush  (ms_to_es_flush),
    .cr_flush_o     (csr_flush_o)
    // .ms_to_cr_bus    (ms_to_cr_bus)
);
// WB stage
//assign debug_wb_pc <=32'bfffffffe;
ysyx_210458_WB_stage wb_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ws_allowin     (ws_allowin     ),
    .data_ok2       (mem_data_ok2   ),
    .rdata          (mem_rdata),
    //from ms
    .ms_to_ws_valid (ms_to_ws_valid ),
    .ms_to_ws_bus   (ms_to_ws_bus   ),
    //to fs
    // .ws_to_fs_ex    (ws_to_fs_ex),
    //to rf: for write back
    .ws_to_rf_bus   (ws_to_rf_bus   ),

  


    .ws_to_ds_bus   (ws_to_ds_bus   ),
    .ws_to_th_bus    (ws_to_th_bus  ),
    .ws_to_es_flush   (ws_to_es_flush),
    .csr_rdata      (csr_rdata),
    .ws_to_csr_bus  (ws_to_csr_bus),
    .i_fence        (i_fence),
    // .ws_to_c0_bus    (ws_to_c0_bus),
    `ifdef  YSYX210458_ENAENABLE_DFT

    //trace debug interface
    .debug_wb_inst    (debug_wb_inst   ),
    .debug_wb_valid   (debug_wb_valid  ),
    .debug_wb_pc      (debug_wb_pc      ),
    .debug_wb_rf_wen  (debug_wb_rf_wen  ),
    .debug_wb_rf_wnum (debug_wb_rf_wnum ),
    .debug_wb_rf_wdata(debug_wb_rf_wdata),
    .ws_io_uart_out_valid (io_uart_out_valid),
    .ws_skip        (ws_skip        ),

    `endif 
    .cr_flush_o    (csr_flush_o)
);

// //TH stage
ysyx_210458_TH_stage th_stage(
    .ds_to_th_bus    (ds_to_th_bus),
    .es_to_th_bus    (es_to_th_bus),
    .ms_to_th_bus    (ms_to_th_bus),
    .ws_to_th_bus    (ws_to_th_bus),
    //冲突检测单元返回的信号
    .data_haza_bus    (data_haza_bus)
    
);




ysyx_210458_csr u_csr (
    .clk            (clk),
    .reset          (reset),
    .ws_to_csr_bus  (ws_to_csr_bus),
    .csr_rdata      (csr_rdata),
    .csr_flush_pc   (csr_flush_pc),
    .csr_flush_o    (csr_flush_o),
    .csr_MIE        (csr_MIE),
    .csr_MTIE       (csr_MTIE)

    `ifdef  YSYX210458_ENAENABLE_DFT
    ,
    ////diff_test////
    .diff_intrNO    (diff_intrNO),
    .diff_cause     (diff_cause),
    .diff_mstatus   (diff_mstatus),
    .diff_mepc      (diff_mepc),
    .diff_mtvec     (diff_mtvec),
    .diff_mcause    (diff_mcause),
    .diff_mip       (diff_mip),
    .diff_mie       (diff_mie)

    `endif

);

`ifdef  YSYX210458_ENAENABLE_DFT

reg [63:0]    mstatus;
reg [63:0]    mepc;
reg [63:0]    mtvec;
reg [63:0]    mcause;
reg [63:0]    mip;
reg [63:0]    mie;
reg [3:0]     intrNO;
reg [3:0]     cause;
wire[63:0]    diff_sstatus;

always @( posedge clk) begin
  if (reset) begin
    mstatus <= 64'b0;
    mepc    <= 64'b0;
    mtvec   <= 64'b0;
    mcause  <= 64'b0;
    mip     <= 64'b0;
    mie     <= 64'b0;
    intrNO  <= 4'h0;
    cause   <= 4'h0;
  end
  else begin
    mstatus <= diff_mstatus;
    mepc    <= diff_mepc   ;
    mtvec   <= diff_mtvec  ;
    mcause  <= diff_mcause ;
    mip     <= diff_mip    ;
    mie     <= diff_mie    ;
    intrNO  <= diff_intrNO ;
    cause   <= diff_cause  ;

  end
  
end
assign diff_sstatus = diff_mstatus & 64'h8000_0003_000D_E122;

// Difftest
reg cmt_wen;
reg cmt_skip;
reg [7:0] cmt_wdest;
reg [`YSYX210458_REG_BUS] cmt_wdata;
reg [`YSYX210458_REG_BUS] cmt_pc;
reg [31:0] cmt_inst;
reg cmt_valid;
reg trap;
reg [7:0] trap_code;
reg [63:0] cycleCnt;
reg [63:0] instrCnt;
reg [`YSYX210458_REG_BUS] regs_diff [31 : 0];

wire inst_valid = (debug_wb_pc != `YSYX210458_PC_START) | (debug_wb_inst != 0);

always @(negedge clk) begin
  if (reset) begin
    {cmt_wen, cmt_wdest, cmt_wdata, cmt_pc, cmt_inst, cmt_valid, trap, trap_code, cycleCnt, instrCnt,cmt_skip} <= 0;
  end
  else if (~trap) begin
    cmt_wen <= debug_wb_rf_wen;
    cmt_wdest <= {3'd0, debug_wb_rf_wnum};
    cmt_wdata <= debug_wb_rf_wdata;
    cmt_pc <= debug_wb_pc;
    cmt_inst <= debug_wb_inst;
    cmt_valid <= debug_wb_valid;

		regs_diff <= regs;

    trap <= debug_wb_inst[6:0] == 7'h6b ;
    trap_code <= regs[10][7:0];
    cycleCnt <= cycleCnt + 1;
    instrCnt <= instrCnt + inst_valid;
    cmt_skip <= ws_skip;
  end
end

DifftestInstrCommit DifftestInstrCommit(
  //我的情况是这个需要延时一拍提交
  //也就是过一个寄存器
  .clock              (clk),
  .coreid             (0),
  .index              (0),
  .valid              (cmt_valid),
  .pc                 (cmt_pc),
  .instr              (cmt_inst),
  .skip               (cmt_skip),
  .isRVC              (0),
  .scFailed           (0),
  .wen                (cmt_wen),
  .wdest              (cmt_wdest),
  .wdata              (cmt_wdata)
);

DifftestArchIntRegState DifftestArchIntRegState (
  ////我的情况是这个需要延时一拍提交
  //也就是过一个寄存器
  .clock              (clk),
  .coreid             (0),
  .gpr_0              (regs_diff[0]),
  .gpr_1              (regs_diff[1]),
  .gpr_2              (regs_diff[2]),
  .gpr_3              (regs_diff[3]),
  .gpr_4              (regs_diff[4]),
  .gpr_5              (regs_diff[5]),
  .gpr_6              (regs_diff[6]),
  .gpr_7              (regs_diff[7]),
  .gpr_8              (regs_diff[8]),
  .gpr_9              (regs_diff[9]),
  .gpr_10             (regs_diff[10]),
  .gpr_11             (regs_diff[11]),
  .gpr_12             (regs_diff[12]),
  .gpr_13             (regs_diff[13]),
  .gpr_14             (regs_diff[14]),
  .gpr_15             (regs_diff[15]),
  .gpr_16             (regs_diff[16]),
  .gpr_17             (regs_diff[17]),
  .gpr_18             (regs_diff[18]),
  .gpr_19             (regs_diff[19]),
  .gpr_20             (regs_diff[20]),
  .gpr_21             (regs_diff[21]),
  .gpr_22             (regs_diff[22]),
  .gpr_23             (regs_diff[23]),
  .gpr_24             (regs_diff[24]),
  .gpr_25             (regs_diff[25]),
  .gpr_26             (regs_diff[26]),
  .gpr_27             (regs_diff[27]),
  .gpr_28             (regs_diff[28]),
  .gpr_29             (regs_diff[29]),
  .gpr_30             (regs_diff[30]),
  .gpr_31             (regs_diff[31])
);

DifftestTrapEvent DifftestTrapEvent(
  //////我的情况是这个  不  需要延时一拍提交
  //直接从写回接出来就行（wire类型
  .clock              (clk),
  .coreid             (0),
  .valid              (trap),
  .code               (trap_code),
  .pc                 (cmt_pc),
  .cycleCnt           (cycleCnt),
  .instrCnt           (instrCnt)
);

DifftestArchEvent DifftestArchEvent (
  //////我的情况是这个  不  需要延时一拍提交
  //直接从写回接出来就行（wire类型
    .clock              (clk),
    .coreid             (0),  
    .intrNO             (diff_intrNO),//中断号
    .cause              (diff_cause),//例外号，非中断号
    .exceptionPC        (debug_wb_pc ),
    .exceptionInst     (debug_wb_inst)
);

DifftestCSRState DifftestCSRState(
  .clock              (clk),
  .coreid             (0),
  .priviledgeMode     (3),
  .mstatus            (diff_mstatus),
  .sstatus            (diff_sstatus),
  .mepc               (diff_mepc),
  .sepc               (0),
  .mtval              (0),
  .stval              (0),
  .mtvec              (diff_mtvec),
  .stvec              (0),
  .mcause             (diff_mcause),
  .scause             (0),
  .satp               (0),
  .mip                (diff_mip),
  .mie                (diff_mie),
  .mscratch           (0),
  .sscratch           (0),
  .mideleg            (0),
  .medeleg            (0)
);

DifftestArchFpRegState DifftestArchFpRegState(
  .clock              (clk),
  .coreid             (0),
  .fpr_0              (0),
  .fpr_1              (0),
  .fpr_2              (0),
  .fpr_3              (0),
  .fpr_4              (0),
  .fpr_5              (0),
  .fpr_6              (0),
  .fpr_7              (0),
  .fpr_8              (0),
  .fpr_9              (0),
  .fpr_10             (0),
  .fpr_11             (0),
  .fpr_12             (0),
  .fpr_13             (0),
  .fpr_14             (0),
  .fpr_15             (0),
  .fpr_16             (0),
  .fpr_17             (0),
  .fpr_18             (0),
  .fpr_19             (0),
  .fpr_20             (0),
  .fpr_21             (0),
  .fpr_22             (0),
  .fpr_23             (0),
  .fpr_24             (0),
  .fpr_25             (0),
  .fpr_26             (0),
  .fpr_27             (0),
  .fpr_28             (0),
  .fpr_29             (0),
  .fpr_30             (0),
  .fpr_31             (0)
);

`endif


endmodule

////////IF_stage//////
module ysyx_210458_IF_stage(
    input                          clk            ,
    // (*mark_debug = "true"*)  input                          reset,
    input                          reset,
    //allwoin
    input                           ds_allowin,
    // input                           cancel_s,
    //brbus
    input  [`YSYX210458_BR_BUS_WD       -1:0] br_bus         ,
    input                                     queue_almost_full,
    input   [63:0]                  csr_flush_pc,
    input                           csr_flush_o,
    input   [`YSYX210458_DS_TO_BPU_BUS_WD -1:0] ds_to_bpu_bus, 
    //flush
    input  [`YSYX210458_ES_FLUSH_BUS_WD -1:0] es_flush_bus,
    
    //to ds
    output                         fs_to_ds_valid ,
    output [`YSYX210458_FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus   ,
    output [`YSYX210458_BPU_TO_DS_BUS_WD -1:0] bpu_to_ds_bus ,
    // inst sram interface
    output        i_valid,
    output        i_uncache,
    output        i_op,
    output [2:0]  i_size,
    output [`YSYX210458_INDEX_W -1:0]  i_index,
    output [`YSYX210458_TAG_W  -1:0] i_tag,
    output [`YSYX210458_OFFSET_W -1:0]  i_offset,
    input         i_addr_ok,
    input         i_data_ok
    // input [`YSYX210458_INST_W -1:0]  i_rdata
);
//修改内容
//一次读取的内容为64位，但是指令码只是32位
//PC与地址变成了64位
//RV取消了转移延迟槽，需要使用转移预测或者是隔拍停止的策略
//RV取消了转移延迟槽，对应的取指逻辑需要修改一下。
reg         cr_flush_o_reg;
reg         fs_valid;
reg         addr_alok;
reg         data_alok;
reg         data_alok2;
reg [31:0]  rdata_buf2;  
reg         cancel_first_back;
reg         br_bus_buf_s;
reg  [1:0]  count;
// (*mark_debug = "true"*) reg  [31:0] fs_pc;
reg  [63:0] fs_pc;
reg  [63:0] cr_to_fs_pc_reg;
reg  [63:0] br_target_buf;
reg  [31:0] rdata_buf;
reg         req;
wire        req_can;
wire        req_pre_is_target;
wire        br_bus_dir_valid;
wire        pre_is_target;
wire        br_ds_will_to_es;
wire        br_stall_dir;
wire        br_taken_dir;
wire        pre_ready_go;
wire        br_taken;
wire        fs_ready_go;
wire        fs_allowin;
wire        to_fs_valid;
wire        fs_ex;
wire        cr_flush_o;
wire        count_add;
wire        count_sub;
// wire [63:0] seq_pc;
/////
wire        inst_sram_req   ;
// wire        inst_sram_wr;
// wire [ 3:0] inst_sram_wstrb  ;
wire [63:0] inst_sram_addr ;
// wire [31:0] inst_sram_wdata;
wire        inst_sram_addr_ok;
wire        inst_sram_data_ok;
wire [`YSYX210458_INST_W -1:0] inst_sram_rdata;

// (*mark_debug = "true"*) wire [31:0] nextpc;
wire [63:0] nextpc;
wire [63:0] cr_to_fs_pc;
wire [63:0] br_target;
wire [63:0] br_target_dir;
wire [31:0] fs_inst;
wire [31:0] rdata;
wire        es_flush;
wire [63:0] es_flush_pc;
////LiteBPU////
wire [63:0] x1_value;
wire [63:0] xn_value;
wire [63:0] bpu_pc;
wire [4:0]  rxn;
wire        bpu_taken;
wire        bpu_may_wait;
wire        ds_may_wait;
wire        req_wait;
reg [63:0]  bpu_pc_buf;
reg         bpu_buf_s;
wire[63:0]  bpu_pc_to_ds;
// assign rdata = {inst_sram_rdata[7:0],inst_sram_rdata[15:8],inst_sram_rdata[23:16],inst_sram_rdata[31:24]};
assign rdata = inst_sram_rdata;

assign {
            br_stall_dir,
            br_taken_dir,
            br_target_dir
                } = br_bus;
// assign {    
//             cr_flush_o,
//             cr_to_fs_pc
//                 } = cr_to_fs_bus;
assign cr_flush_o = es_flush || csr_flush_o;
assign cr_to_fs_pc = csr_flush_o ? csr_flush_pc : es_flush_pc;
assign {es_flush,es_flush_pc} =es_flush_bus;
assign fs_to_ds_bus = {
                      // fs_inst ,
                       bpu_pc_to_ds  ,
                       fs_pc   };//1+32+64+64=161
`ifdef YSYX210458_ENAENABLE_SIMBPU
assign bpu_pc_to_ds = bpu_buf_s ? bpu_pc_buf :bpu_pc;
`endif

`ifdef YSYX210458_ENAENABLE_NEXT
assign bpu_pc_to_ds =bpu_pc;
`endif

assign    br_bus_dir_valid = ~br_stall_dir && br_taken_dir;
assign    pre_is_target    = ( br_bus_dir_valid || br_bus_buf_s) ;
assign    br_target        = br_bus_buf_s  ? br_target_buf    : br_target_dir;
                             
// pre-IF stage
assign pre_ready_go     = addr_alok && ~req_wait || inst_sram_req && inst_sram_addr_ok;
assign to_fs_valid      = pre_ready_go ;//�?
// assign seq_pc           = fs_pc + 3'h4;
assign fs_ex            = fs_pc[1:0] != 2'h0 ;
assign br_ds_will_to_es = br_taken_dir && ds_allowin;
assign nextpc           =  cr_flush_o_reg    ? cr_to_fs_pc_reg : bpu_pc;
                        // (br_bus_buf_s || br_bus_dir_valid) && ~fs_valid ? seq_pc :
                        // bpu_taken              ? bpu_pc : 
                        //                                                   seq_pc;
assign count_add = inst_sram_req && inst_sram_addr_ok && !inst_sram_data_ok;
assign count_sub = inst_sram_data_ok && !( inst_sram_req && inst_sram_addr_ok);
// assign count_add = cancel_s && !inst_sram_data_ok;
// assign count_sub = inst_sram_data_ok && !cancel_s;
always @(posedge clk ) begin
    if (reset) begin
        cr_to_fs_pc_reg <= 64'b0;
    end
    else if (cr_flush_o) begin
        cr_to_fs_pc_reg <= cr_to_fs_pc;
    end

    if (reset || cr_flush_o || pre_is_target && pre_ready_go && fs_allowin && ds_allowin )    begin
        br_bus_buf_s <= 1'b0;//cr_flush_o 清空流水线的信号
    end
    else if ( br_ds_will_to_es  )  begin//转移指令即将离开ID进入EXE
        br_bus_buf_s     <= 1'b1;
        br_target_buf       <= br_target_dir;
    end


    if (cr_flush_o) begin
        cr_flush_o_reg <= 1'b1;
    end
    else if(reset || pre_ready_go && fs_allowin ) begin
        cr_flush_o_reg <= 1'b0;
    end

    if (fs_allowin && pre_ready_go || reset || cr_flush_o) begin
        addr_alok <= 1'b0;
    end
    else if (inst_sram_addr_ok && inst_sram_req ) begin
        addr_alok <= 1'b1;
    end

    if (reset || count == 2'b0 && !count_add || count == 2'h1 && count_sub || cancel_first_back && inst_sram_data_ok) begin
        cancel_first_back <= 1'b0;
    end
    else if ( cr_flush_o && !(  count == 2'b0 && !count_add || count == 2'h1 && count_sub)) begin
        cancel_first_back <= 1'b1;
    end

    if (reset) begin
        count <= 2'b0;
    end
    else if (count_add) begin
        count <= count + 1'b1;
    end
    else if (count_sub)begin
        count <= count -1'b1;
    end

end

// IF stage
assign fs_ready_go    = (data_alok || inst_sram_data_ok|| data_alok2 ) && ~cancel_first_back;
                //  &&  !(( br_bus_dir_valid || br_bus_buf_s) && ~pre_ready_go);
assign fs_allowin     = !fs_valid || fs_ready_go && ds_allowin;
assign fs_to_ds_valid =  fs_valid && fs_ready_go; //要进fs与fs准备，就可以出发�?
always @(posedge clk) begin
    if (reset || cr_flush_o ) begin
        fs_valid <= 1'b0;
    end
    else if (fs_allowin ) begin
        fs_valid <= to_fs_valid;
    end
    
    if (reset) begin
        // fs_pc <= 32'hbfbffffc;  //trick: to make nextpc be 0xbfc00000 during reset 
        // fs_pc <= 32'h7FFF_FFFc;
        `ifdef  YSYX210458_ENAENABLE_DFT
        fs_pc   <= 64'h00000000_7FFF_FFFc;
        `endif
        `ifdef  YSYX210458_ENAENABLE_SoC
        fs_pc   <= 64'h00000000_2FFF_FFFc;
        `endif
    end
    else if (to_fs_valid && fs_allowin ) begin
        fs_pc <= nextpc;
    end
    
    if ( fs_ready_go && ds_allowin || cr_flush_o || reset) begin
        data_alok <= 1'b0;
    end

    else  if (inst_sram_data_ok && !fs_allowin &&~cancel_first_back && !data_alok2) begin
        data_alok <= 1'b1;
        // rdata_buf <= inst_sram_rdata;
    end
    if (reset || data_alok2 && fs_ready_go  && ds_allowin && !data_alok||  cr_flush_o) begin
        data_alok2 <= 1'b0;
    end
    else if (data_alok  && inst_sram_data_ok) begin
        data_alok2 <= 1'b1;
        rdata_buf2 <= rdata;

    end
    if (reset || pre_ready_go && !fs_allowin  || cr_flush_o ) begin
        req <= 1'b0;
    end
    else if (req_can) begin
        req <= 1'b1;
    end

    
    if (inst_sram_data_ok  && !fs_allowin && !data_alok ) begin
        rdata_buf <= rdata;
        
    end

    if (reset || fs_to_ds_valid) begin
        bpu_buf_s <= 1'b0;
    end
    else if (!fs_valid && inst_sram_req && inst_sram_addr_ok) begin
        bpu_buf_s <= 1'b1;
        bpu_pc_buf <= nextpc;
    end

end

// assign req_pre_is_target = !data_alok && data_alok2 && count == 2'b0 && pre_is_target;

assign req_can =  (!pre_ready_go && !fs_allowin || !pre_ready_go && fs_allowin || pre_ready_go && fs_allowin)
		&& !inst_sram_data_ok
                && (!data_alok2 )  
                && (!data_alok || data_alok && count == 2'b0) 
                && !cancel_first_back
                && fs_allowin 
                && !fs_valid;
////LiteBPU////
// wire [63:0] x1_value;
// wire [63:0] xn_value;
// wire [4:0]  rxn;
// wire        bpu_taken;
// wire        bpu_may_wait;
// wire        ds_may_wait;
// wire        req_wait;

assign bpu_to_ds_bus = rxn;
assign {ds_may_wait,xn_value,x1_value} = ds_to_bpu_bus;

ysyx_210458_LiteBPU u_bpu(
    .clk        (clk),
    .reset      (reset),
    .inst       (inst_sram_rdata),
    .x1_value   (x1_value),
    .xn_value   (xn_value),
    .pc         (fs_pc),
    .rxn        (rxn),
    .bpu_pc     (bpu_pc),
    .bpu_taken  (bpu_taken),
    .bpu_may_wait (bpu_may_wait)
);

`ifdef  YSYX210458_ENAENABLE_SIMBPU
assign req_wait      = ds_may_wait && bpu_may_wait;
assign inst_sram_req = req && !req_wait && fs_allowin;
`endif 
reg reset_reg;
always @(posedge clk) begin
    if (reset) begin
        reset_reg <= 1'b0;
    end
    else reset_reg <= 1'b1;
end
`ifdef  YSYX210458_ENAENABLE_DFT
assign inst_sram_req = !queue_almost_full && reset_count == 3'h0;//req && fs_allowin;
`endif

`ifdef  YSYX210458_ENAENABLE_SoC
assign inst_sram_req = !queue_almost_full && reset_reg;//req && fs_allowin;
`endif

`ifdef  YSYX210458_ENAENABLE_NEXT
assign req_wait = 1'b0;
`endif
// assign inst_sram_wr     = 1'b0;
// assign inst_sram_wstrb  = 4'h0;
assign inst_sram_addr   = inst_sram_req ?  nextpc : 64'b0;
// assign inst_sram_wdata  = 32'b0;
assign fs_inst =data_alok ? rdata_buf: 
                data_alok2? rdata_buf2 : rdata;
reg [2:0] reset_count;
always @(posedge clk) begin
    if (reset ) begin
        reset_count <= 3'h1;
    end
    else if ( reset_count == 3'h0) begin
        reset_count <= 3'h0;
    end
    else reset_count  <= reset_count + 1'h1;
end
`ifdef  YSYX210458_ENAENABLE_DFT
assign i_valid = inst_sram_req && reset_count == 3'h0;
`endif
`ifdef  YSYX210458_ENAENABLE_SoC
assign i_valid = inst_sram_req && reset_reg;
`endif
assign i_op    = 1'b0;
assign inst_sram_addr_ok = i_addr_ok;
assign inst_sram_data_ok = i_data_ok ;//&& !cancel_stall;
// assign inst_sram_rdata    = i_rdata;

assign i_tag   = inst_sram_addr[31:11];
assign i_index = nextpc[10:5];
assign i_offset= nextpc[4:0];
assign i_size  = 3'h2;
`ifdef  YSYX210458_ENAENABLE_DFT
assign i_uncache = 1'b0;
`endif

`ifdef  YSYX210458_ENAENABLE_SoC
assign i_uncache = nextpc[31:28] < 4'h8;
`endif

`ifdef YSYX210458_PREFCOUNT
////////pref_count////////
reg [63:0] inst_req_count;


always @(posedge clk) begin
    if (reset) begin
        inst_req_count <= 64'b0;
    end
    else if (inst_sram_req && inst_sram_addr_ok) begin
        inst_req_count <= inst_req_count + 64'h1;
    end
    
end


reg [63:0] clk_count;
always @(posedge clk)
begin
    if(clk_count[`YSYX210458_COUNT -1:0] == {`YSYX210458_COUNT{1'b1}}  ) begin
	    $display("clk_count:");
        $display(clk_count);
        $display(inst_req_count);
        // $finish; 
    end
    if (reset )begin
        clk_count <= 64'h0;
    end
    else begin
        clk_count <= clk_count + 64'h1;
    end 
end

`endif

endmodule

////////ID_stage//////
module ysyx_210458_ID_stage(
    input                          clk           ,
    input                          reset         ,
    //allowin
    input                          es_allowin    ,
    output                         ds_allowin    ,
    //from fs
    input                          fs_to_ds_valid,
    input  [`YSYX210458_FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus  ,//64
    input [`YSYX210458_BPU_TO_DS_BUS_WD -1:0] bpu_to_ds_bus ,
    //to es
    output                         ds_to_es_valid,
    output [`YSYX210458_DS_TO_ES_BUS_WD -1:0] ds_to_es_bus  ,//136
    //to fs
    output [`YSYX210458_BR_BUS_WD       -1:0] br_bus        ,//32
    output                                    queue_almost_full,
    output [`YSYX210458_DS_TO_BPU_BUS_WD -1:0] ds_to_bpu_bus,
    //to rf: for write back
    input  [`YSYX210458_WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus  , //38
    output [`YSYX210458_DS_TO_TH_BUS_WD  -1:0] ds_to_th_bus ,
    input  [`YSYX210458_ES_TO_DS_BUS_WD  -1:0] es_to_ds_bus ,
    input  [`YSYX210458_TO_DS_BUS_WD  -1:0] ms_to_ds_bus ,
    input  [`YSYX210458_TO_DS_BUS_WD  -1:0] ws_to_ds_bus ,
    input                         cr_flush_o,
    //time_int//
    input                           time_int,
    input                           csr_MTIE,
    input                           csr_MIE,
    //
    input                           data_ok2,
    input [`YSYX210458_INST_W -1:0] ds_inst_dir,
    // input  [17:0]                 cr_to_ds_bus,
    input  [`YSYX210458_OUT_TH_BUS_WD   -1:0] data_haza_bus
    
    `ifdef  YSYX210458_ENAENABLE_DFT
    , 
    output wire [`YSYX210458_REG_BUS] regs_o[ 31 :0]

    `endif

);


//RV64I与mips32
//译码：同为32位指令码，但不同的位置有着不同的意义
//跳转：由于少了转移延迟槽，跳转基于的PC有可能会不同，立即数译码不一样了
//PC；32bits => 64bits
//寄存器堆：32bits*32 => 64bits*32
//寄存器堆：取消寄存器写使能，采用一位寄存器写使能
//前递：前递数据变成64bits，取消寄存器字节写使能，全变成一位的写使能

// reg                          ds_valid;
wire ds_valid;
reg  ds_valid_0;
reg  [`YSYX210458_FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus_r;
wire                         ds_ready_go;
wire                         fs_to_ds_ex;



wire                         rf_we;
wire [ 4                 :0] rf_waddr;
wire [63                 :0] fs_pc;
// (*mark_debug = "true"*) wire [31                 :0] ds_inst;
wire [31:0] ds_inst;
// (*mark_debug = "true"*) wire [31                 :0] ds_pc  ;
wire [63:0] ds_pc;
wire [63                 :0] rf_wdata;
wire [63                 :0] br_target;
wire [15:0] alu_op;

// wire        hi_lo_to_com;
wire        rs_eq_rt;
wire        data_haza;
wire        ds_br_stall;  
wire        com_to_hi_lo;
wire        hi_lo_wen;
wire        br_inst;
wire        br_taken;
wire        load_op;
wire        src2_is_sa;

wire [63:0] ds_bpu_pc;
wire [63:0] real_npc;

wire        src1_is_pc;
wire        src2_is_imm;
wire        src2_is_imm_0;
wire        src2_is_8;
wire        res_from_mem;
wire        gr_we;
wire        inst_jump;
wire        ds_bd;
wire        ds_ri;
wire        mem_we;
wire  inst_lui    ;
wire  inst_auipc  ;
wire  inst_jal    ;
wire  inst_jalr   ;
wire  inst_beq    ;
wire  inst_bne    ;
wire  inst_blt    ;
wire  inst_bge    ;
wire  inst_bltu   ;
wire  inst_bgeu   ;
wire  inst_lb     ;
wire  inst_lh     ;
wire  inst_lw     ;
wire  inst_lbu    ;
wire  inst_lhu    ;
wire  inst_sb     ;
wire  inst_sh     ;
wire  inst_sw     ;
wire  inst_addi   ;
wire  inst_slti   ;
wire  inst_sltiu  ;
wire  inst_xori   ;
wire  inst_ori    ;
wire  inst_andi   ;
wire  inst_slli   ;
wire  inst_srli   ;
wire  inst_srai   ;
wire  inst_add    ;
wire  inst_sub    ;
wire  inst_sll    ;
wire  inst_slt    ;
wire  inst_sltu   ;
wire  inst_xor    ;
wire  inst_srl    ;
wire  inst_sra    ;
wire  inst_or     ;
wire  inst_and    ;
wire  inst_fence  ;
wire  inst_ecall  ;
wire  inst_ebreak ;
//RV64I//
wire  inst_lwu;
wire  inst_ld;
wire  inst_sd;
wire  inst_rv64_slli;
wire  inst_rv64_srli;
wire  inst_rv64_srai;
wire  inst_addiw;
wire  inst_slliw;
wire  inst_srliw;
wire  inst_sraiw;
wire  inst_addw;
wire  inst_subw;
wire  inst_sllw;
wire  inst_srlw;
wire  inst_sraw;
//csr
wire  inst_csrrw ; 
wire  inst_csrrs ;
wire  inst_csrrc ;
wire  inst_csrrwi;
wire  inst_csrrsi;
wire  inst_csrrci;
wire  inst_mret;

wire[11:0] csr_addr;
wire[4:0] zimm;
wire        ds_int;
wire        ds_ex;

assign ds_ex = ds_int || inst_ecall;

wire        src2_rv64_sa;
wire        src2_rv32_sa;
wire        es_load_op;
wire        ms_valid;
wire        es_valid;
wire        ws_valid;
wire        ds_can_ov;   
wire        c0_status_ie;
wire        c0_status_exl;
wire        ds_bp;
wire        ds_sys;
wire        f_fs_adel;
wire        es_gr_we;
wire        ms_gr_we;
wire        ws_gr_we;
wire [ 4:0] rf_raddr1;
wire [ 4:0] rf_raddr2;
wire [ 4:0] dest;
wire [ 4:0] rs;
wire [ 4:0] rt;
wire [ 4:0] rd;
wire [ 4:0] sa;
wire [ 3:0] mem_op;
wire [4:0 ] es_dest;
wire [4:0 ] ms_dest;
wire [4:0 ] ws_dest;
wire [ 6:0] op;
wire [6:0 ] load_op_clear;
wire [63:0] rs_value;
wire [63:0] rt_value;

wire [31:0] I_imm;
wire [31:0] S_imm;
wire [31:0] B_imm;
wire [31:0] U_imm;
wire [31:0] J_imm;
wire [31:0] imm;
wire is_J_imm;
wire is_I_imm;
wire is_B_imm;
wire is_S_imm;
wire is_U_imm;

wire [63:0] rf_rdata1;
wire [63:0] rf_rdata2;
wire [63:0] es_fw_data;
wire [63:0] ms_fw_data;
wire [63:0] ws_fw_data;
wire [63:0] next_pc;
wire [127:0] op_d;
wire [63:0] func_d;

wire [63:0] add_src1;
wire [63:0] add_src2;
wire src2_is_4;
///////FOR_BPU////
wire [63:0] x1_value;
wire [63:0] xn_value;
wire [4:0]  rxn;
wire        ds_may_wait;
wire        need_rs2;
wire        inst_0x7b;

assign inst_0x7b = ds_inst[6:0] == 7'h7B;
assign rxn = bpu_to_ds_bus;
assign ds_to_bpu_bus = {ds_may_wait,xn_value,x1_value};
assign need_rs2 =
|  inst_beq    |  inst_bne    |  inst_blt    |  inst_bge    |  inst_bltu   
|  inst_bgeu   |  inst_sb     |  inst_sh     |  inst_sw     |  inst_add    
|  inst_sub    |  inst_sll    |  inst_slt    |  inst_sltu   |  inst_xor    
|  inst_srl    |  inst_sra    |  inst_or     |  inst_and    |  inst_sd
|  inst_addw   |  inst_subw|  inst_sllw|  inst_srlw|  inst_sraw;

assign ds_may_wait = ds_valid && need_rs2 
                  || es_valid && rxn == es_dest && es_gr_we
                  || ms_valid && rxn == ms_dest && ms_gr_we
                  || ws_valid && rxn == ws_dest && ws_gr_we; 

assign {rf_we   ,  //69:69
        rf_waddr,  //68:64
        rf_wdata   //63:0
       } = ws_to_rf_bus;

assign {ds_br_stall,data_haza}  = data_haza_bus;
wire  [`YSYX210458_DATA_WIDTH -1:0] ds_bpu_pc_dir,ds_pc_dir,ds_bpu_pc_q,ds_pc_q;
wire  [`YSYX210458_INST_W     -1:0] ds_inst_q;
wire  queue_empty,queue_full,queue_rd_en,queue_wr_en,ds_ce;
assign {
        ds_bpu_pc_dir,
        ds_pc_dir   } = fs_to_ds_bus_r;
assign ds_pc = !queue_empty ? ds_pc_q : ds_pc_dir;
assign ds_inst = !queue_empty ? ds_inst_q : ds_inst_dir;
assign ds_bpu_pc = !queue_empty ? ds_bpu_pc_q : ds_bpu_pc_dir; 

assign fs_pc = fs_to_ds_bus[63:0];

assign ds_ce = cr_flush_o;
assign queue_wr_en = data_ok2 && ds_valid;
assign queue_rd_en = ds_ready_go && es_allowin;

ysyx_210458_queue u_queue (
    .clk            (clk),
    .reset          (reset),
    .clear_en       (ds_ce),

    .empty          (queue_empty),
    .full           (queue_full),
    .almost_full    (queue_almost_full),

    .rd_en          (queue_rd_en),
    .wr_en          (queue_wr_en),
    .wdata          ({ds_inst_dir,ds_pc_dir,ds_bpu_pc_dir}),
    .rdata          ({ds_inst_q,ds_pc_q,ds_bpu_pc_q})


);
assign f_fs_adel =  1'b0;//fs_to_ds_ex;
assign ds_sys = 1'b0;
assign ds_bp =  1'b0;


assign ds_ri  = 
~inst_lui     & ~inst_auipc   & ~inst_jal     & ~inst_jalr    & 
~inst_beq     & ~inst_bne     & ~inst_blt     & ~inst_bge     & ~inst_bltu    & ~inst_bgeu    & 
~inst_lb      & ~inst_lh      & ~inst_lw      & ~inst_lbu     & ~inst_lhu     & ~inst_sb      & 
~inst_sh      & ~inst_sw      & ~inst_addi    & ~inst_slti    & ~inst_sltiu   & ~inst_xori    & 
~inst_ori     & ~inst_andi    & ~inst_slli    & ~inst_srli    & ~inst_srai    & ~inst_add     & 
~inst_sub     & ~inst_sll     & ~inst_slt     & ~inst_sltu    & ~inst_xor     & ~inst_srl     & 
~inst_sra     & ~inst_or      & ~inst_and     & ~inst_fence   & ~inst_ecall   & ~inst_ebreak   ;

// assign  {c0_status_exl,c0_status_ie,c0_status_im,c0_cause_ip} = cr_to_ds_bus;

// assign ds_int = ((c0_cause_ip[7:0] & c0_status_im[7:0]) != 8'h00) && c0_status_ie ==1'b1 && c0_status_exl == 1'b0 ;
// assign ds_ex    = ds_ri || ds_bp || ds_int || ds_sys || f_fs_adel;
assign br_bus  = {ds_br_stall,br_taken,br_target};
assign ds_int  = time_int && csr_MTIE && csr_MIE;

assign ds_to_es_bus = {
                        ds_int,
                        ds_ex,
                        inst_fence,
                        inst_mret,
                        inst_csrrw ,
                        inst_csrrs ,
                        inst_csrrc ,
                        inst_csrrwi,
                        inst_csrrsi,
                        inst_csrrci,                        
                        zimm,
                        csr_addr,
                        inst_0x7b, 
                        mem_op, //363:360
                        load_op_clear,//359:353
                        alu_op      ,  //352:337
                        load_op     ,  //336  //少了load_op造成后面�?系列的Z
                        src2_rv64_sa     ,//335
                        src2_rv32_sa     ,//334
                        src1_is_pc  ,  //333:333
                        src2_is_imm ,  //332:332
                        src2_is_4   ,  //331:331
                        gr_we       ,  //330:330
                        mem_we      ,  //229:229
                        dest        ,  //228:224
                        imm         ,  //223:129
                        rs_value    ,  //191 : 128
                        rt_value    ,  //127 :64
                        ds_inst     ,
                        ds_bpu_pc   ,
                        br_target   ,
                        ds_pc          //63 :0
                      };
    
assign ds_to_th_bus = { 
                        ds_valid , //11:11
                        br_inst,  //10:10
                        rt,//9:5
                        rs //4:0
                    };
assign ds_ready_go    =  ~data_haza && (data_ok2 || !queue_empty);
// assign ds_allowin     =  !ds_valid || ds_ready_go && es_allowin;//ds_vaild出现了X，最后发现ds_vaild没赋�?//Error_03
assign ds_allowin     = !ds_valid || !queue_full;
assign ds_to_es_valid = ds_valid && ds_ready_go;
assign ds_valid = ds_valid_0 || !queue_empty;
always @(posedge clk) begin
    if (reset | cr_flush_o) begin
        ds_valid_0 <= 1'b0;
    end
    else if (ds_allowin) begin
        ds_valid_0 <= fs_to_ds_valid;
    end
    if (fs_to_ds_valid && ds_allowin) begin
        fs_to_ds_bus_r <= fs_to_ds_bus;
    end
end
wire [2:0] func3;
wire [7:0] func3_d;
wire [6:0] func7;
wire [127:0] func7_d;
wire [4:0]  rs1;
wire [4:0]  rs2;
wire [31:0] rs2_d;


assign is_J_imm = inst_jal;
assign is_S_imm = inst_sb   | inst_sw | inst_sh | inst_sd;
assign is_I_imm = inst_jalr | inst_lb | inst_lh | inst_lw | inst_lbu | inst_lhu 
                | inst_addi | inst_slti         | inst_sltiu         | inst_xori
                | inst_ori  | inst_andi         | inst_lwu           | inst_ld | inst_addiw
                | inst_slli |  inst_srli | inst_srai  | inst_slliw|  inst_srliw| inst_sraiw;
assign is_B_imm = inst_beq || inst_bne || inst_blt || inst_bge || inst_bltu || inst_bgeu;
assign is_U_imm = inst_lui | inst_auipc;

assign imm      = ({32{inst_jal}}   & J_imm)
                | ({32{is_I_imm}}   & I_imm)
                | ({32{is_B_imm}}   & B_imm)
                | ({32{is_S_imm}}   & S_imm)
                | ({32{is_U_imm}}   & U_imm);

assign I_imm = {{21{ds_inst[31]}},ds_inst[30:20]};
assign S_imm = {{21{ds_inst[31]}},ds_inst[30:25],ds_inst[11:7]};
assign B_imm = {{20{ds_inst[31]}},ds_inst[7],ds_inst[30:25],ds_inst[11:8],1'b0};
assign U_imm = {ds_inst[31:12],12'b0};
assign J_imm = {{12{ds_inst[31]}},ds_inst[19:12],ds_inst[20],ds_inst[30:21],1'b0};

assign op   = ds_inst[6:0];
assign rd   = ds_inst[11:7];
assign func3= ds_inst[14:12];
assign rs1  = ds_inst[19:15];
assign rs2  = ds_inst[24:20];
assign func7= ds_inst[31:25];
assign rs   = rs1;
assign rt   = rs2;
assign csr_addr = ds_inst[31:20];
assign zimm = rs1;


ysyx_210458_decoder_7_128 u_dec0(.in(op  ),     .out(op_d  ));
ysyx_210458_decoder_3_8   u_dec1(.in(func3),    .out(func3_d));
ysyx_210458_decoder_7_128 u_dec2(.in(func7  ),  .out(func7_d));
ysyx_210458_decoder_5_32  u_dec3(.in(rs2  ),    .out(rs2_d  ));

assign inst_lui     = op_d[7'h37];
assign inst_auipc   = op_d[7'h17];
assign inst_jal     = op_d[7'h6f];
assign inst_jalr    = op_d[7'h67] & func3_d[3'h0];
assign inst_beq     = op_d[7'h63] & func3_d[3'h0];
assign inst_bne     = op_d[7'h63] & func3_d[3'h1];
assign inst_blt     = op_d[7'h63] & func3_d[3'h4];
assign inst_bge     = op_d[7'h63] & func3_d[3'h5];
assign inst_bltu    = op_d[7'h63] & func3_d[3'h6];
assign inst_bgeu    = op_d[7'h63] & func3_d[3'h7];
assign inst_lb      = op_d[7'h03] & func3_d[3'h0];
assign inst_lh      = op_d[7'h03] & func3_d[3'h1];
assign inst_lw      = op_d[7'h03] & func3_d[3'h2];
assign inst_lbu     = op_d[7'h03] & func3_d[3'h4];
assign inst_lhu     = op_d[7'h03] & func3_d[3'h5];
assign inst_sb      = op_d[7'h23] & func3_d[3'h0];
assign inst_sh      = op_d[7'h23] & func3_d[3'h1];
assign inst_sw      = op_d[7'h23] & func3_d[3'h2];
assign inst_addi    = op_d[7'h13] & func3_d[3'h0];
assign inst_slti    = op_d[7'h13] & func3_d[3'h2];
assign inst_sltiu   = op_d[7'h13] & func3_d[3'h3];
assign inst_xori    = op_d[7'h13] & func3_d[3'h4];
assign inst_ori     = op_d[7'h13] & func3_d[3'h6];
assign inst_andi    = op_d[7'h13] & func3_d[3'h7];
// assign inst_slli    = op_d[7'h13] & func3_d[3'h1] & func7_d[7'h00];
// assign inst_srli    = op_d[7'h13] & func3_d[3'h5] & func7_d[7'h00];
// assign inst_srai    = op_d[7'h13] & func3_d[3'h5] & func7_d[7'h20];
assign inst_slli    = op_d[7'h13] & func3_d[3'h1] & ds_inst[31:26] == 6'h00;
assign inst_srli    = op_d[7'h13] & func3_d[3'h5] & ds_inst[31:26] == 6'h00;
assign inst_srai    = op_d[7'h13] & func3_d[3'h5] & ds_inst[31:26] == 6'h10;

assign inst_add     = op_d[7'h33] & func3_d[3'h0] & func7_d[7'h00];
assign inst_sub     = op_d[7'h33] & func3_d[3'h0] & func7_d[7'h20];
assign inst_sll     = op_d[7'h33] & func3_d[3'h1] & func7_d[7'h00];
assign inst_slt     = op_d[7'h33] & func3_d[3'h2] & func7_d[7'h00];
assign inst_sltu    = op_d[7'h33] & func3_d[3'h3] & func7_d[7'h00];
assign inst_xor     = op_d[7'h33] & func3_d[3'h4] & func7_d[7'h00];
assign inst_srl     = op_d[7'h33] & func3_d[3'h5] & func7_d[7'h00];
assign inst_sra     = op_d[7'h33] & func3_d[3'h5] & func7_d[7'h20];
assign inst_or      = op_d[7'h33] & func3_d[3'h6] & func7_d[7'h00];
assign inst_and     = op_d[7'h33] & func3_d[3'h7] & func7_d[7'h00];

assign inst_fence   = op_d[7'h0f] & func3_d[3'h1];
assign inst_ecall   = op_d[7'h73] & func3_d[3'h0] & func7_d[7'h00] & rs2_d[5'h00];
assign inst_ebreak  = op_d[7'h73] & func3_d[3'h0] & func7_d[7'h01] & rs2_d[5'h01];
//RV64I//
assign inst_lwu     = op_d[7'h03] & func3_d[3'h6];
assign inst_ld      = op_d[7'h03] & func3_d[3'h3];
assign inst_sd      = op_d[7'h23] & func3_d[3'h3];
assign inst_rv64_slli = op_d[7'h13] & func3_d[3'h1] & ds_inst[31:26] == 6'h00;
assign inst_rv64_srli = op_d[7'h13] & func3_d[3'h5] & ds_inst[31:26] == 6'h00;
assign inst_rv64_srai = op_d[7'h13] & func3_d[3'h5] & ds_inst[31:26] == 6'h10;
assign inst_addiw  = op_d[7'h1b] & func3_d[3'h0];
assign inst_slliw  = op_d[7'h1b] & func3_d[3'h1] & func7_d[7'h00];
assign inst_srliw  = op_d[7'h1b] & func3_d[3'h5] & func7_d[7'h00];
assign inst_sraiw  = op_d[7'h1b] & func3_d[3'h5] & func7_d[7'h20];
assign inst_addw   = op_d[7'h3b] & func3_d[3'h0] & func7_d[7'h00];
assign inst_subw   = op_d[7'h3b] & func3_d[3'h0] & func7_d[7'h20];
assign inst_sllw   = op_d[7'h3b] & func3_d[3'h1] & func7_d[7'h00];
assign inst_srlw   = op_d[7'h3b] & func3_d[3'h5] & func7_d[7'h00];
assign inst_sraw   = op_d[7'h3b] & func3_d[3'h5] & func7_d[7'h20];

////CSR////
assign inst_csrrw  = op_d[7'h73] & func3_d[3'h1];
assign inst_csrrs  = op_d[7'h73] & func3_d[3'h2];
assign inst_csrrc  = op_d[7'h73] & func3_d[3'h3];
assign inst_csrrwi = op_d[7'h73] & func3_d[3'h5];
assign inst_csrrsi = op_d[7'h73] & func3_d[3'h6];
assign inst_csrrci = op_d[7'h73] & func3_d[3'h7];
assign inst_mret   = op_d[7'h73] & func3_d[3'h0] & func7_d[7'h18];


assign alu_op[ 0] = inst_add | inst_addi| inst_lw | inst_sw | inst_jal | inst_jalr
                  | inst_lb  | inst_lbu   | inst_lh | inst_lhu | inst_sb | inst_sh 
                  | inst_lwu | inst_ld  | inst_sd | inst_addiw | inst_addw | inst_auipc  ;
assign alu_op[ 1] = inst_sub | inst_subw;
assign alu_op[ 2] = inst_slt  | inst_slti;
assign alu_op[ 3] = inst_sltiu| inst_sltu;
assign alu_op[ 4] = inst_and  | inst_andi;
assign alu_op[ 5] = 1'b0;//inst_nor  ;
assign alu_op[ 6] = inst_or   | inst_ori;
assign alu_op[ 7] = inst_xor | inst_xori;
assign alu_op[ 8] = inst_sll | inst_slliw | inst_sllw | inst_rv64_slli;
assign alu_op[ 9] = inst_srl | inst_srliw | inst_srlw | inst_rv64_srli;
assign alu_op[10] = inst_sra | inst_sraiw | inst_sraw | inst_rv64_srai;
assign alu_op[11] = inst_lui;
assign alu_op[12] = inst_addiw | inst_slliw| inst_srliw| inst_sraiw| inst_addw | inst_subw | inst_sllw | inst_srlw | inst_sraw ;    //inst_mult;
assign alu_op[13] = 1'b0;   //inst_multu;
assign alu_op[14] = 1'b0;   //inst_div;
assign alu_op[15] = 1'b0;   //inst_divu;

assign load_op_clear[ 0] = inst_lw;
assign load_op_clear[ 1] = inst_lb;
assign load_op_clear[ 2] = inst_lbu;
assign load_op_clear[ 3] = inst_lh;
assign load_op_clear[ 4] = inst_lhu;
assign load_op_clear[ 5] = inst_lwu;
assign load_op_clear[ 6] = inst_ld;
assign mem_op[ 0]        = inst_sw;
assign mem_op[ 1]        = inst_sh;
assign mem_op[ 2]        = inst_sb;
assign mem_op[ 3]        = inst_sd;


//Error_04
   //load_op//不是寄存器写使能，�?�是内存的写使能//es_res_from_mem
assign load_op      = inst_lw    | inst_lb  | inst_lbu  | inst_lh    |inst_lhu | inst_lwu | inst_ld;
assign src2_is_sa   = inst_sll | inst_slliw | inst_sllw | inst_rv64_slli | inst_srl | inst_srliw | inst_srlw | inst_rv64_srli 
                    | inst_sra | inst_sraiw | inst_sraw | inst_rv64_srai;

assign src1_is_pc   = inst_jal   | inst_jalr| inst_auipc;
assign src2_is_imm =( inst_addi | inst_slti | inst_sltiu |inst_lui | inst_xori | inst_ori | inst_andi  | inst_addiw 
                    | inst_lw   | inst_lb   | inst_lbu   | inst_lh | inst_lhu | inst_lwu | inst_ld
                    | inst_sw   | inst_sh   | inst_sb    | inst_sd | inst_auipc
                    | inst_slli |  inst_srli | inst_srai  | inst_slliw|  inst_srliw| inst_sraiw );
// assign src2_is_imm  = is_J_imm | is_S_imm | is_I_imm | is_B_imm | is_U_imm;
assign src2_is_imm_0=  1'b0  ;
assign src2_is_4    = inst_jal   | inst_jalr| inst_auipc ;

//hi,lo寄存器的写使�?
assign hi_lo_wen = 1'b0;//inst_mtlo    ||inst_mthi || inst_divu  || inst_div || inst_mult || inst_multu;
//jal也是有目的寄存器的，当时弄混了以为jal没有目的寄存�?
assign src2_rv64_sa      = inst_sll   | inst_srl | inst_sra;
assign src2_rv32_sa      = inst_slliw | inst_srliw | inst_sraiw ;

assign res_from_mem = inst_lw    | inst_lb  | inst_lbu  | inst_lh | inst_lhu | inst_lwu | inst_ld;
assign gr_we		= ~inst_sw  & ~inst_sh & ~inst_sb    & ~inst_beq  & ~inst_bne     &~inst_blt & ~inst_bge &~inst_bltu & ~inst_bgeu      
                    & ~inst_fence & ~inst_ecall & ~inst_ebreak & ~inst_sd & ~inst_0x7b & ~inst_mret;
                                                                                                                      
assign mem_we       = inst_sw| inst_sh       | inst_sb  | inst_sd;
assign br_inst     =    inst_beq | inst_bne | inst_blt | inst_bltu| inst_bge | inst_bgeu| inst_jalr| inst_jal;
assign dest         =  rd;
                                    
assign ds_can_ov    = inst_add | inst_addi | inst_sub;


/////

assign rf_raddr1 = rs;
assign rf_raddr2 = ds_valid && need_rs2 ? rt : rxn;
assign xn_value  = rf_rdata2;

ysyx_210458_regfile u_regfile(
    .clk    (clk      ),
    .reset  (reset    ),
    .raddr1 (rf_raddr1),
    .rdata1 (rf_rdata1),
    .raddr2 (rf_raddr2),
    .rdata2 (rf_rdata2),
    .we     (rf_we    ),
    .waddr  (rf_waddr ),
    .wdata  (rf_wdata ),
    .x1_value   (x1_value)
    
    `ifdef  YSYX210458_ENAENABLE_DFT
    ,
    .regs_o (regs_o)
    `endif 
    );


assign {    
            ms_valid, 
            ms_gr_we ,
            ms_dest,
            ms_fw_data
                } = ms_to_ds_bus ;
assign  {
            es_load_op,//42:42
            es_valid,//41:41  
            es_gr_we  ,//~es_inst_lw,//40:37
            es_dest,         //32:36
            es_fw_data    //31:0
                } = es_to_ds_bus  ;
assign  {
            ws_valid, 
             ws_gr_we,
             ws_dest,
             ws_fw_data
                } = ws_to_ds_bus ;


//rs forward
assign rs_value =    es_valid  && es_gr_we && rs == es_dest && rs != 5'h00 ? es_fw_data:
                     ms_valid  && ms_gr_we && rs == ms_dest && rs != 5'h00 ? ms_fw_data:
                     ws_valid  && ws_gr_we && rs == ws_dest && rs != 5'h00 ? ws_fw_data:
                                                               rf_rdata1;
                            

                            
//rt forward
assign rt_value =    es_valid && es_gr_we && rt == es_dest && rt != 5'h00 ? es_fw_data:
                     ms_valid && ms_gr_we && rt == ms_dest && rt != 5'h00 ? ms_fw_data:
                     ws_valid && ws_gr_we && rt == ws_dest && rt != 5'h00 ? ws_fw_data:
                                                             rf_rdata2;
                  
                  
wire rs1_g_rs2;
wire rs2_g_rs1;
wire [64:0] rs_u;
wire [64:0] rt_u;
wire [64:0] rs_s;
wire [64:0] rt_s;
wire [64:0] rs_v;
wire [64:0] rt_v;
wire  rs1_l_rs2;

assign rs_u = {1'b0,rs_value};
assign rt_u = {1'b0,rt_value};
assign rs_s = {rs_value[63],rs_value};
assign rt_s = {rt_value[63],rt_value};
assign rs_v = inst_bgeu|| inst_bltu ? rs_u : rs_s;
assign rt_v = inst_bgeu|| inst_bltu ? rt_u : rt_s; 

assign rs1_g_rs2 = $signed(rs_v)  >  $signed(rt_v);
assign rs2_g_rs1 = ~rs1_g_rs2 && ~rs_eq_rt;

assign rs1_l_rs2 = ~rs1_g_rs2 & ~rs_eq_rt;
assign rs_eq_rt = (rs_value == rt_value);
//bge 大于或者等于才跳转
//blt 小于才跳转
//assign rs_eq_0 = (rs_value == 32'b0);
//计算机中数据以补码的形式存入,0表示正数�?1表示负数
// assign rs_g_0 =  ~rs_value[31:31] ;
assign br_taken = (   inst_beq    && rs_eq_rt
                   || inst_bne    && !rs_eq_rt
                   || inst_blt    && rs1_l_rs2
                   || inst_bltu   && rs1_l_rs2
                   || inst_bge    && !rs1_l_rs2
                   || inst_bgeu   && !rs1_l_rs2
                   || inst_jalr
                   || inst_jal

) && ds_valid ;
// wire  [63:0] nop_pc;
// assign          nop_pc = ds_pc + 3'h4;
// wire [63:0] add_result;

assign add_src1 = inst_jalr ? rs_value :  ds_pc;
//assign add_src2 = (inst_beq || inst_bne || inst_blt || inst_bltu || inst_bge || inst_bgeu || inst_jal || inst_jalr) ? {{32{imm[31]}},imm} : 4;
assign add_src2 = br_taken ? {{32{imm[31]}},imm} : 4;
assign br_target = add_src1 + add_src2;

// assign  = add_result;
endmodule

////////EXE_stage//////
module ysyx_210458_EXE_stage(
    input                          clk           ,
    input                          reset         ,
    //allowin
    input                          ms_allowin    ,
    input                          ms_will_to_ws ,
    output                         es_allowin    ,
    //from ds
    input                          ds_to_es_valid,
    input  [`YSYX210458_DS_TO_ES_BUS_WD -1:0] ds_to_es_bus  ,//136

    // input                           ws_to_es_ex,
    // input                           ms_to_es_ex,
    input                           ms_to_es_data_alok2,
    input                           ms_to_es_data_alok,
    //to fs
    output  [`YSYX210458_ES_FLUSH_BUS_WD -1:0] es_flush_bus,
    //to ds
    output [`YSYX210458_ES_TO_DS_BUS_WD   -1:0] es_to_ds_bus ,//
    //to ms
    output                         es_to_ms_valid,
    output                         es_to_ms_cancel_first_back,
    output [`YSYX210458_ES_TO_MS_BUS_WD -1:0] es_to_ms_bus  ,//71
    //to_rfo
    //output [`YSYX210458_ES_TO_RF_BUS_WD -1:0]  es_to_rfo_bus  ,
    //
    input                           ws_to_es_flush,
    input                           ms_to_es_flush,
    //to TH test_hazard
    output [`YSYX210458_ES_TO_TH_BUS_WD -1:0]    es_to_th_bus  ,
    input                             cr_flush_o,
    // data sram interface
    //clint 
    output                      mem_to_cmp,
    output                      mem_to_mtime,
    //d_cache////
    output      d_valid,
    output      d_op,
    output      d_uncache,
    output      d_fence,
    output [2:0]d_size  ,
    output[`YSYX210458_INDEX_W -1:0]       d_index,
    output[`YSYX210458_TAG_W -1:0]         d_tag,
    output[`YSYX210458_OFFSET_W -1:0]      d_offset,
    output[`YSYX210458_WSTRB_W -1:0]       d_wstrb,
    output[`YSYX210458_DATA_WIDTH -1:0]    d_wdata,
    input                       d_addr_ok,
    input                       d_data_ok
);

wire        data_sram_req   ;
wire        data_sram_wr;
wire [ 1:0] data_sram_size;
wire [ 7:0] data_sram_wstrb  ;
wire [63:0] data_sram_addr ;
wire [63:0] data_sram_wdata;
wire         data_sram_addr_ok;
wire         data_sram_data_ok;
wire  [63:0] data_sram_rdata;



reg  [`YSYX210458_DS_TO_ES_BUS_WD -1:0] ds_to_es_bus_r;
reg         es_valid      ;
reg         addr_alok;
reg         cancel_first_back; 
reg   [1:0] count;
reg         req;

wire        req_can;
wire        count_add;
wire        count_sub;
wire        data_alok2;
wire        data_alok;
assign  data_alok = ms_to_es_data_alok;
assign  data_alok2= ms_to_es_data_alok2;


wire        addr_is_same;
wire        es_ready_go   ;
wire        es_bd;
wire        load_or_store_op;
wire        es_load_op    ;
wire        es_src1_is_sa ;  
wire        es_src1_is_pc ;
wire        es_src2_is_imm_0;
wire        es_src2_is_imm; 
wire        es_src2_is_4  ;
wire        es_gr_we      ;
wire        es_mem_we     ;
wire        alu_stall;
wire        es_res_from_mem;
// wire        ds_to_es_ex;
// wire        es_can_ov;
wire        es_ades;
wire        es_adel;
// wire        es_ex;
wire        es_ov;
wire        es_bp;
wire        op_sh;
wire        op_sb;
wire        op_sw;
wire        op_lw;
wire        op_lh;
wire        op_lhu;
wire        mem_op;
wire        op_lb;
wire        op_lbu;

wire [7:0]  sram_wen;
wire [4:0]  es_dest       ;
wire [3:0]  es_mem_op;
wire [6:0]  es_load_op_clear;
wire [15:0] es_alu_op     ;
wire [31:0] es_imm        ;
wire [63:0] es_rs1_value   ;
wire [63:0] es_rs2_value   ;
wire [63:0] es_pc         ;
wire [63:0] es_alu_src1   ;
wire [63:0] es_alu_src2   ;
wire [63:0] es_alu_result ;

wire [31:0] es_inst;
wire        es_src2_rv32_sa;
wire        es_src2_rv64_sa;
wire        src1_is_pc;
wire        src2_is_imm;
wire        src2_is_4;
wire        op_sd;
wire        op_lwu;
wire        op_ld;
wire        es_0x7b;
wire        es_fence;

//
wire[11:0] csr_addr;
wire[4:0] es_zimm;
wire        es_int;
wire        es_ex;
wire  es_csrrw ; 
wire  es_csrrs ;
wire  es_csrrc ;
wire  es_csrrwi;
wire  es_csrrsi;
wire  es_csrrci;
wire  es_mret;
wire  es_op_csr;


reg  es_flush_reg;
wire [63:0] es_bpu_pc;
wire [63:0] es_br_target;

wire        es_flush;
assign es_flush = es_bpu_pc != es_br_target && es_valid;
assign es_flush_bus = {es_flush , es_br_target};
assign es_op_csr =   es_csrrw   ||  es_csrrs  ||  es_csrrc  ||  es_csrrwi ||  es_csrrsi ||  es_csrrci ;


//这个错误我弄了好久就因为变成4位宽
// wire [4:0]  es_op_eret;

//修改
//去掉非对齐访问指令
//修改alu以便于支持64为运算
//去掉乘法与除法
//注意alu_src的不同RV64与MIPS32的区别



assign {
                        es_int,
                        es_ex,
                        es_fence,
                        es_mret,
                        es_csrrw ,
                        es_csrrs ,
                        es_csrrc ,
                        es_csrrwi,
                        es_csrrsi,
                        es_csrrci,                        
                        es_zimm,
                        csr_addr,
        es_0x7b,
        es_mem_op, //360:358
       es_load_op_clear,//357:353
       es_alu_op      ,  //352:337
       es_load_op     ,  //336  //少了load_op造成后面�?系列的Z
       es_src2_rv64_sa     ,//335
       es_src2_rv32_sa     ,//334
       es_src1_is_pc  ,  //333:333
       es_src2_is_imm ,  //332:332
       es_src2_is_4   ,  //331:331
       es_gr_we       ,  //330:330
       es_mem_we      ,  //229:229
       es_dest        ,  //228:224
       es_imm         ,  //223:129
       es_rs1_value    ,  //191 : 128
       es_rs2_value    ,  //127 :64
       es_inst         ,
       es_bpu_pc        ,
       es_br_target    ,
       es_pc               //63 :0
       } = ds_to_es_bus_r;


//

assign es_to_ms_bus = { 
                        es_int,
                        es_ex,
                        es_fence,
                        es_mret,
                        es_csrrw ,
                        es_csrrs ,
                        es_csrrc ,
                        es_csrrwi,
                        es_csrrsi,
                        es_csrrci,                        
                        es_zimm,
                        csr_addr,
                        es_0x7b,
                        es_load_op, //141
                        load_or_store_op,//140
                        es_load_op_clear,//139:135
                        es_res_from_mem,  //134:134
                        es_gr_we       ,  //133:133
                        es_dest        ,  //132:128
                        es_rs1_value   ,
                        es_alu_result  ,  //127:64
                        es_inst         ,
                        es_pc             //63:0
                      };

//
assign es_to_th_bus = { 
                        es_op_csr, //8:8
                        es_load_op,//7:7
                        es_valid ,//6:6
                         es_gr_we ,  //5:5
                        es_dest    //4:0
};
assign es_to_ds_bus = {es_load_op,//71:71
                       es_valid ,//70:70  
                       es_gr_we,//~es_inst_lw,//69:69
                       es_dest,         //68:64
                       es_alu_result    //63:0
                       };

assign count_add = data_sram_req && data_sram_addr_ok && !data_sram_data_ok;
assign count_sub = data_sram_data_ok && !( data_sram_req && data_sram_addr_ok);

assign es_res_from_mem = es_load_op;


assign load_or_store_op = mem_op || es_load_op;
assign es_ready_go    = (load_or_store_op || es_fence && es_valid)  && (data_sram_req && data_sram_addr_ok ||  addr_alok ) && ~alu_stall
                      || !alu_stall   && ~es_load_op    &&  ~mem_op && ~es_fence 
                      || es_ex && es_valid; 
                     
assign es_allowin     = !es_valid || es_ready_go && ms_allowin ;
assign es_to_ms_valid =  es_valid && es_ready_go;
always @(posedge clk) begin
    if (reset ||cr_flush_o || es_flush && es_ready_go && ms_allowin ||es_flush_reg && es_ready_go && ms_allowin ) begin
        es_valid <= 1'b0;
    end
    else if (es_allowin) begin
        es_valid <= ds_to_es_valid;
    end

    if (ds_to_es_valid && es_allowin) begin
        ds_to_es_bus_r <= ds_to_es_bus;
    end

    if (reset || cr_flush_o || es_ready_go) begin
        es_flush_reg <= 1'b0;
    end
    else if (!es_ready_go && es_valid && es_flush) begin
        es_flush_reg <= 1'b1;
    end
end

always @(posedge clk) begin

  if (ms_allowin && es_ready_go || reset || cr_flush_o) begin
        addr_alok <= 1'b0;
    end
    else if (data_sram_addr_ok && data_sram_req ) begin
        addr_alok <= 1'b1;
    end

    if (reset || count == 2'b0 && !count_add || count == 2'h1 && count_sub ) begin
        cancel_first_back <= 1'b0;
    end
    else if ( cr_flush_o && !(  count == 2'b0 && !count_add || count == 2'h1 && count_sub)) begin
        cancel_first_back <= 1'b1;
    end

    if (reset) begin
        count <= 2'b0;
    end
    else if (count_add) begin
        count <= count + 1'b1;
    end
    else if (count_sub)begin
        count <= count -1'b1;
    end
  
  
    if (reset || es_ready_go && !ms_allowin  || cr_flush_o || !load_or_store_op && !es_fence || data_sram_req && data_sram_addr_ok ) begin
        req <= 1'b0;
    end
    else if (req_can ) begin
        req <= 1'b1;
    end
  
end
// assign es_to_ms_cancel_first_back = cancel_first_back;
// wire   mem_to_clint;
wire   is_to_cmp;
wire   is_to_mtime;
assign is_to_cmp = es_alu_result[31:0] == 32'h0200_4000;
assign is_to_mtime =es_alu_result[31:0] ==32'h0200_bff8;
assign es_to_ms_cancel_first_back = 1'b0;
// assign req_can = (mem_op || es_load_op) 
//                 && (!es_ready_go && !ms_allowin || !es_ready_go && ms_allowin || es_ready_go && ms_allowin) 
//                 && (!data_alok2 )  
//                 && (!data_alok || data_alok && count == 2'b0) 
//                 && !cancel_first_back
//                 && !alu_stall
//                 && es_valid
//                 && ms_allowin;
assign req_can = (mem_op || es_load_op || es_fence)  && ms_allowin && !es_ex && !es_int && !ws_to_es_flush && !ms_to_es_flush && es_valid;


assign es_alu_src1 = es_src1_is_pc    ? es_pc:
                                      es_rs1_value;
                     
assign es_alu_src2 = es_src2_is_imm   ? {{32{es_imm[31]}}, es_imm} : 
                     es_src2_is_4     ? 64'h4 :
                                        es_rs2_value;
                        

ysyx_210458_alu u_alu(
    .clk        (clk            ),
    .reset      (reset          ),
    // .alu_can_ov (es_can_ov      ),
    .alu_op     (es_alu_op    ),
    .alu_src1   (es_alu_src1  ),//两个es_alu_src2
    .alu_src2   (es_alu_src2  ),//Error_05
    .alu_result (es_alu_result),
    .alu_stall  (alu_stall),
    .alu_ex     (es_ov)
    );


assign mem_op       = op_sw || op_sh || op_sb || op_sd ;

assign op_sw        = es_mem_op[0];
assign op_sh        = es_mem_op[1];
assign op_sb        = es_mem_op[2];
assign op_sd        = es_mem_op[3];
assign op_lw        = es_load_op_clear[ 0];
assign op_lb        = es_load_op_clear[ 1];
assign op_lbu       = es_load_op_clear[ 2];
assign op_lh        = es_load_op_clear[ 3];
assign op_lhu       = es_load_op_clear[ 4];
assign op_lwu       = es_load_op_clear[ 5];
assign op_ld        = es_load_op_clear[ 6];

//下面这一大串& 2'h2 与 && 2'h2 不一样
//& 2'h2 可以得2
// && 2'h2 在上面得情况下会是1而不是期待得2
`ifdef  YSYX210458_ENAENABLE_SoC
assign data_sram_size = ({2{op_ld || op_sd }}              & 2'h3)
                      | ({2{op_sw || op_lwu   || op_lw }}  & 2'h2)
                      | ({2{op_sh || op_lhu   || op_lh }}  & 2'h1)
                      | ({2{op_lb || op_lbu   || op_sb }}  & 2'h0);
`endif
`ifdef  YSYX210458_ENAENABLE_DFT
// assign data_sram_size = ({2{op_ld || op_sd    || op_lwu   || op_lw || op_lhu || op_lh  || op_lb || op_lbu}}              & 2'h3)
//                       | ({2{op_sw  }}  & 2'h2)
//                       | ({2{op_sh  }}  & 2'h1)
//                       | ({2{ op_sb }}  & 2'h0);

assign data_sram_size = 2'h3;
`endif 
assign es_adel      = op_lw  && es_alu_result[1:0] != 2'b0
                   || (op_lh  || op_lhu  ) && es_alu_result [0] != 1'b0;
assign es_ades      = op_sw  && es_alu_result[1:0] != 2'b0   || op_sh && es_alu_result [0] != 1'b0;

// assign es_ex        = es_valid && (ds_to_es_ex || es_adel || es_ades  || es_ov);
wire  [2:0] offset;
wire  [7:0] sel;
assign   offset = es_alu_result[2:0];
ysyx_210458_decoder_3_8   u_dec1(.in(offset),    .out(sel));

wire  [63:0] wdata;
// assign wdata    = ({64{op_sb & sel[3'h0]} }  & {8{es_rs2_value[07:00]}} )
//                 | ({64{op_sb & sel[3'h1]} }  & {8{es_rs2_value[15:08]}} )
//                 | ({64{op_sb & sel[3'h2]} }  & {8{es_rs2_value[23:16]}} )
//                 | ({64{op_sb & sel[3'h3]} }  & {8{es_rs2_value[31:24]}} )
//                 | ({64{op_sb & sel[3'h4]} }  & {8{es_rs2_value[39:32]}} )
//                 | ({64{op_sb & sel[3'h5]} }  & {8{es_rs2_value[47:40]}} )
//                 | ({64{op_sb & sel[3'h6]} }  & {8{es_rs2_value[55:48]}} )
//                 | ({64{op_sb & sel[3'h7]} }  & {8{es_rs2_value[63:56]}} )
//                 | ({64{op_sh & sel[3'h0]}}   & {4{es_rs2_value[15:00]}})
//                 | ({64{op_sh & sel[3'h2]}}   & {4{es_rs2_value[31:16]}})
//                 | ({64{op_sh & sel[3'h4]}}   & {4{es_rs2_value[48:32]}})
//                 | ({64{op_sh & sel[3'h6]}}   & {4{es_rs2_value[63:49]}})
//                 | ({64{op_sw & sel[3'h0]}}   & {2{es_rs2_value[31:00]}})
//                 | ({64{op_sw & sel[3'h4]}}   & {2{es_rs2_value[63:32]}})
//                 | ({64{op_sd}}                & es_rs2_value           );

assign wdata    = ({64{op_sb  } }  & {8{es_rs2_value[07:00]}} )
                | ({64{op_sh  }}   & {4{es_rs2_value[15:00]}})
                | ({64{op_sw  }}   & {2{es_rs2_value[31:00]}})
                | ({64{op_sd  }}   & es_rs2_value           );

assign sram_wen = ({8{op_sb & sel[3'h0]} }  & 8'b0000_0001 )
                | ({8{op_sb & sel[3'h1]} }  & 8'b0000_0010 )
                | ({8{op_sb & sel[3'h2]} }  & 8'b0000_0100 )
                | ({8{op_sb & sel[3'h3]} }  & 8'b0000_1000 )
                | ({8{op_sb & sel[3'h4]} }  & 8'b0001_0000 )
                | ({8{op_sb & sel[3'h5]} }  & 8'b0010_0000 )
                | ({8{op_sb & sel[3'h6]} }  & 8'b0100_0000 )
                | ({8{op_sb & sel[3'h7]} }  & 8'b1000_0000 )
                | ({8{op_sh & sel[3'h0]}}   & 8'b0000_0011 )
                | ({8{op_sh & sel[3'h2]}}   & 8'b0000_1100)
                | ({8{op_sh & sel[3'h4]}}   & 8'b0011_0000)
                | ({8{op_sh & sel[3'h6]}}   & 8'b1100_0000)
                | ({8{op_sw & sel[3'h0]}}   & 8'h0f       )
                | ({8{op_sw & sel[3'h4]}}   & 8'hf0       )
                | ({8{op_sd}}               & 8'hff     );
// assign sram_wen = ({8{op_sd}}  & 8'b1111_1111)
                // | ({8{op_sw}}  & 8'b0000_1111)
                // | ({8{op_sh}}  & 8'b0000_0011)
                // | ({8{op_sb}}  & 8'b0000_0001);

assign data_sram_req = req_can && es_valid;

                                                
wire [7:0]  wstrb;
assign data_sram_wr    =  mem_op && es_valid && !es_ex && !es_int && !ws_to_es_flush && !ms_to_es_flush ;
assign wstrb   =es_mem_we&&es_valid && data_sram_wr   ? sram_wen : 8'h00;
assign data_sram_wstrb = wstrb;
`ifdef  YSYX210458_ENAENABLE_DFT
assign data_sram_addr  = req_can ? {es_alu_result[63:3],3'b0} : 64'b0;
`endif 
`ifdef  YSYX210458_ENAENABLE_SoC
assign data_sram_addr  = req_can ? {es_alu_result[63:0]} : 64'b0;
`endif 
assign data_sram_wdata = wdata;

//
assign d_valid = req_can && !is_to_cmp && !is_to_mtime;  //data_sram_req && !is_to_cmp && !is_to_mtime;
assign d_offset= es_alu_result[4:0];
assign d_index = es_alu_result[10:5];
assign d_tag   = es_alu_result[31:11];
assign d_wstrb = data_sram_wstrb;
assign d_wdata = data_sram_wdata;
assign data_sram_addr_ok = d_addr_ok;
assign data_sram_data_ok = d_data_ok;
assign d_op    = data_sram_wr;
assign d_uncache = es_valid && es_fence ? 1'b0 :  es_alu_result[31:28] < 4'h8;
// assign d_uncache = 1'b1;
assign d_size  = {1'b0,data_sram_size};
assign d_fence = es_fence && es_valid; 

assign mem_to_cmp = data_sram_req && is_to_cmp;
assign mem_to_mtime = data_sram_req && is_to_mtime;

////////pref_count////////
`ifdef  YSYX210458_PREFCOUNT
reg [63:0] flush_count;
reg [63:0] pc_buf;
wire  flush_add;
assign flush_add = pc_buf != es_pc && es_valid && es_flush;
always @(posedge clk ) begin
    if (reset) begin 
        flush_count <= 64'h0;
    end
    else if (flush_add) begin
        flush_count <= flush_count + 1'h1;
    end

    if (reset) begin
        pc_buf <= 64'h0;
    end
    else pc_buf <= es_pc & {64{es_valid}};
end

reg [63:0] clk_count;
always @(posedge clk)
begin
    if(clk_count[`YSYX210458_COUNT -1:0] == {`YSYX210458_COUNT{1'b1}}  ) begin
	    $display("flush_count:");
        // $display(clk_count);
        $display(flush_count);
        // $finish; 
    end
    if (reset )begin
        clk_count <= 64'h0;
    end
    else begin
        clk_count <= clk_count + 64'h1;
    end 
end
`endif
endmodule

////////MEM_stage//////
module ysyx_210458_MEM_stage(
    input                          clk           ,
    input                          reset         ,
    //allowin
    input                          ws_allowin    ,
    output                         ms_allowin    ,
    output                         ms_will_to_ws  ,
    //from es
    input                          es_to_ms_valid,
    input                          es_to_ms_cancel_first_back,
    output                         ms_to_es_flush,
    input  [`YSYX210458_ES_TO_MS_BUS_WD -1:0] es_to_ms_bus  ,//71
    // input  [32:0]                  es_to_ms_data_bus,
    output                         ms_to_es_data_alok,
    output                         ms_to_es_data_alok2,      
    //to ws
    output                         ms_to_ws_valid,
    output [`YSYX210458_MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus  ,//70
    //to ds
    output [`YSYX210458_TO_DS_BUS_WD   -1:0] ms_to_ds_bus ,
    // output [32:0]                   ms_to_cr_bus,
    //from data-sram
    // input  [63                 :0] data_sram_rdata,
    // input                          data_sram_data_ok,
    input                       d_data_ok,
    input                       d_data_ok2,
    input [`YSYX210458_DATA_WIDTH -1:0]    d_rdata,
    output [`YSYX210458_MS_TO_TH_BUS_WD -1:0]   ms_to_th_bus,
    // output                         ms_to_es_ex,
    // output                         ms_to_fs_ex,
    input                           cr_flush_o
);



reg         ms_valid;
reg         data_alok;
wire [`YSYX210458_DATA_WIDTH -1:0] data_sram_rdata;
wire        data_sram_data_ok;
// reg         cancel_first_back;
reg [1:0]        count;
reg         data_alok2;
// reg [31:0]  rdata_buf;
// reg [31:0]  rdata_buf2;
reg [`YSYX210458_ES_TO_MS_BUS_WD -1:0] es_to_ms_bus_r;

wire       cancel_first_back;
assign     cancel_first_back = es_to_ms_cancel_first_back;

wire        ms_ready_go;
wire        ms_res_from_mem;
wire        ms_gr_we;
wire        op_lw;
wire        op_lb;
wire        op_lbu;
wire        op_lh;
wire        op_lhu;
wire        op_lwu;
wire        op_ld;
wire        ms_load_or_store;
wire [4:0]  ms_dest;
wire [6:0]  ms_load_op_clear;
wire [63:0] ms_alu_result;
wire [63:0] ms_rs1_value;
wire [63:0] ms_pc;

wire [63:0] mem_result;
wire [63:0] ms_final_result;
wire [63:0] rdata;
wire [31:0] ms_inst;
wire        ms_load_op;
wire        ms_0x7b;
wire        ms_fence;

////csr////
wire[11:0] csr_addr;
wire[4:0] ms_zimm;
wire        ms_int;
wire        ms_ex;
wire  ms_csrrw ; 
wire  ms_csrrs ;
wire  ms_csrrc ;
wire  ms_csrrwi;
wire  ms_csrrsi;
wire  ms_csrrci;
wire  ms_mret;
wire  ms_skip_clint;
wire  ms_op_csr;

assign ms_op_csr  = ms_csrrw   ||  ms_csrrs  ||  ms_csrrc  ||  ms_csrrwi ||  ms_csrrsi ||  ms_csrrci; 
assign ms_to_es_flush =(ms_ex || ms_int || ms_mret || ms_fence) && ms_valid;

assign rdata = data_sram_rdata;
assign {
                        ms_int,
                        ms_ex,
                        ms_fence,
                        ms_mret,
                        ms_csrrw ,
                        ms_csrrs ,
                        ms_csrrc ,
                        ms_csrrwi,
                        ms_csrrsi,
                        ms_csrrci,                        
                        ms_zimm,
                        csr_addr,
        ms_0x7b,
        ms_load_op, //141
        ms_load_or_store,//140
        ms_load_op_clear,
        ms_res_from_mem,  //70:70
        ms_gr_we       ,  //69:69
        ms_dest        ,  //68:64
        ms_rs1_value   ,
        ms_alu_result  ,  //63:32
        ms_inst        ,
        ms_pc             //31:0
       } = es_to_ms_bus_r;
assign ms_to_ws_bus = {
                        ms_skip_clint,
                        ms_int,
                        ms_ex,
                        ms_fence,
                        ms_mret,
                        ms_csrrw ,
                        ms_csrrs ,
                        ms_csrrc ,
                        ms_csrrwi,
                        ms_csrrsi,
                        ms_csrrci,                        
                        ms_zimm,
                        csr_addr,
                        ms_load_op,
                        ms_load_op_clear, 
                        ms_0x7b,
                        ms_gr_we       ,  //133:133
                        ms_dest        ,  //132:128
                        ms_rs1_value   ,
                        ms_final_result,  //127:64
			            ms_inst,
                        ms_pc             //63:0
                      };

//
assign ms_to_th_bus = {
                        ms_op_csr,//9
                        ms_ready_go,//8
                        ms_load_op,//7
                        ms_valid,//6:6
                        ms_gr_we, //5:5
                        ms_dest    //4:0
                        };


assign ms_to_ds_bus ={
                        ms_to_ws_valid, //70:70
                        ms_gr_we , //69:69
                        ms_dest,        //68:64
                        ms_final_result //63:0
                        };



// assign ms_ready_go    = (~ms_load_or_store && ~ms_fence   
//                       ||  (ms_load_or_store && !ms_load_op || ms_fence && ms_valid) && d_data_ok && ~cancel_first_back
//                       ||  ms_load_op && d_data_ok2 && ~cancel_first_back
//                       || ms_ex )&& ms_valid;
assign ms_ready_go    = (~ms_load_or_store && ~ms_fence   
                      ||  (ms_load_or_store || ms_fence && ms_valid) && d_data_ok && ~cancel_first_back
                      || ms_ex )&& ms_valid;
assign ms_allowin     = !ms_valid || ms_ready_go && ws_allowin;
assign ms_to_ws_valid = ms_valid && ms_ready_go;
assign ms_will_to_ws  = ms_ready_go && ws_allowin;

// assign count_add = data_sram_req && data_sram_addr_ok && !data_sram_data_ok;
// assign count_sub = data_sram_data_ok && !( data_sram_req && data_sram_addr_ok);
assign ms_to_es_data_alok         = data_alok;
assign ms_to_es_data_alok2         =data_alok2;
always @(posedge clk) begin
    if (reset | cr_flush_o) begin
        ms_valid <= 1'b0;
    end
    else if (ms_allowin) begin
        ms_valid <= es_to_ms_valid;
    end

    if (es_to_ms_valid && ms_allowin) begin
        es_to_ms_bus_r  <= es_to_ms_bus; //要非阻塞赋�?�，本来是阻塞赋�??//Error_06
    end
    //////////////////////
    if ( ms_ready_go && ws_allowin || cr_flush_o || reset) begin
        data_alok <= 1'b0;
    end

    else  if (data_sram_data_ok && !ms_allowin &&~cancel_first_back && !data_alok2) begin
        data_alok <= 1'b1;
        // rdata_buf <= inst_sram_rdata;
    end
    if (reset || data_alok2 && ms_ready_go  && ws_allowin && !data_alok||  cr_flush_o) begin
        data_alok2 <= 1'b0;
    end
    else if (data_alok  && data_sram_data_ok) begin
        data_alok2 <= 1'b1;
        // rdata_buf2 <= rdata;

    end

    //  if (data_sram_data_ok || !ms_allowin &&  !data_alok)
    //  rdata_buf <= rdata;
end

assign   op_lw  = ms_load_op_clear [0];
assign   op_lb  = ms_load_op_clear [1];
assign   op_lbu = ms_load_op_clear [2];
assign   op_lh  = ms_load_op_clear [3];
assign   op_lhu = ms_load_op_clear [4];
assign   op_lwu = ms_load_op_clear [5];
assign   op_ld  = ms_load_op_clear [6];
wire  [2:0] offset;
wire  [7:0] sel;
assign   offset = ms_alu_result[2:0];
ysyx_210458_decoder_3_8   u_dec1(.in(offset),    .out(sel));

                    
assign mem_result = ({64{op_ld  }}     & rdata)
                  | ({64{op_lw  &  sel[3'h0]}}     & {{32{rdata[31]}},rdata[31:00]})
                  | ({64{op_lw  &  sel[3'h4]}}     & {{32{rdata[63]}},rdata[63:32]})
                  | ({64{op_lwu &  sel[3'h0]}}     & {{32'b0        },rdata[31:00]})
                  | ({64{op_lwu &  sel[3'h4]}}     & {{32'b0        },rdata[63:32]})
                  | ({64{op_lh  &  sel[3'h0]}}     & {{48{rdata[15]}},rdata[15:00]})
                  | ({64{op_lh  &  sel[3'h2]}}     & {{48{rdata[31]}},rdata[31:16]})
                  | ({64{op_lh  &  sel[3'h4]}}     & {{48{rdata[47]}},rdata[47:32]})
                  | ({64{op_lh  &  sel[3'h6]}}     & {{48{rdata[63]}},rdata[63:48]})
                  | ({64{op_lhu &  sel[3'h0]}}     & {{48'b0        },rdata[15:00]})
                  | ({64{op_lhu &  sel[3'h2]}}     & {{48'b0        },rdata[31:16]})
                  | ({64{op_lhu &  sel[3'h4]}}     & {{48'b0        },rdata[47:32]})
                  | ({64{op_lhu &  sel[3'h6]}}     & {{48'b0        },rdata[63:48]})
                  | ({64{op_lb  &  sel[3'h0]}}     & {{56{rdata[07]}},rdata[07:00]})
                  | ({64{op_lb  &  sel[3'h1]}}     & {{56{rdata[15]}},rdata[15:08]})
                  | ({64{op_lb  &  sel[3'h2]}}     & {{56{rdata[23]}},rdata[23:16]})
                  | ({64{op_lb  &  sel[3'h3]}}     & {{56{rdata[31]}},rdata[31:24]})
                  | ({64{op_lb  &  sel[3'h4]}}     & {{56{rdata[39]}},rdata[39:32]})
                  | ({64{op_lb  &  sel[3'h5]}}     & {{56{rdata[47]}},rdata[47:40]})
                  | ({64{op_lb  &  sel[3'h6]}}     & {{56{rdata[55]}},rdata[55:48]})
                  | ({64{op_lb  &  sel[3'h7]}}     & {{56{rdata[63]}},rdata[63:56]})
                  | ({64{op_lbu &  sel[3'h0]}}     & {{56'b0        },rdata[07:00]})
                  | ({64{op_lbu &  sel[3'h1]}}     & {{56'b0        },rdata[15:08]})
                  | ({64{op_lbu &  sel[3'h2]}}     & {{56'b0        },rdata[23:16]})
                  | ({64{op_lbu &  sel[3'h3]}}     & {{56'b0        },rdata[31:24]})
                  | ({64{op_lbu &  sel[3'h4]}}     & {{56'b0        },rdata[39:32]})
                  | ({64{op_lbu &  sel[3'h5]}}     & {{56'b0        },rdata[47:40]})
                  | ({64{op_lbu &  sel[3'h6]}}     & {{56'b0        },rdata[55:48]})
                  | ({64{op_lbu &  sel[3'h7]}}     & {{56'b0        },rdata[63:56]});
                //   | ({64{op_lbu }}     & {{56'b0        },rdata[07:0]})

assign ms_final_result = ms_alu_result;//ms_res_from_mem ? mem_result:ms_alu_result;
`ifdef YSYX210458_ENAENABLE_DFT
assign ms_skip_clint   = ms_valid && ms_load_or_store 
                        && (ms_alu_result == 64'h0000_0000_0200_4000 
                        || ms_alu_result == 64'h0000_0000_0200_bff8 
                        || ms_alu_result[63:4] == 60'h0000_0000_1000_000);
`endif

`ifdef  ENAENABLE_SoC
assign ms_skip_clint = 1'b0;
`endif
                
assign data_sram_rdata = d_rdata;
assign data_sram_data_ok = d_data_ok;
                                                

endmodule

////////WB_stage//////

module ysyx_210458_WB_stage(
    input                           clk           ,
    input                           reset         ,
    //allowin
    output                          ws_allowin    ,
    //from ms
    input                           ms_to_ws_valid,
    input  [`YSYX210458_MS_TO_WS_BUS_WD -1:0]  ms_to_ws_bus  ,//70
    // input  [31:0]                   mfc0_out_data,
    //to rf: for write back
    output [`YSYX210458_WS_TO_RF_BUS_WD -1:0]  ws_to_rf_bus  ,//38
    //to ds
    output [`YSYX210458_TO_DS_BUS_WD   -1:0]  ws_to_ds_bus,
    //to th (test_hazard)
    output [`YSYX210458_TO_TH_BUS_WD -1:0]   ws_to_th_bus,

    output                         ws_to_es_flush,
    output                          i_fence,
    input                          cr_flush_o,
    //mem
    input                           data_ok2,
    input [`YSYX210458_DATA_WIDTH -1:0] rdata,
    
    ////
    output  [`YSYX210458_WS_TO_CSR_BUS_WD -1:0] ws_to_csr_bus,
    input   [63:0]                  csr_rdata
    //trace debug interface
    
`ifdef  YSYX210458_ENAENABLE_DFT
    ,
    output                          ws_io_uart_out_valid,
    output                          ws_skip,
    output [63:0] debug_wb_pc     ,
    output [31:0] debug_wb_inst,
    output        debug_wb_valid,
    output        debug_wb_rf_wen ,
    output [ 4:0] debug_wb_rf_wnum,
    output [63:0] debug_wb_rf_wdata
`endif 
    

);

reg         ws_valid;
reg [`YSYX210458_MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus_r;

wire        ws_ready_go;
wire        ws_gr_we;
wire        rf_we;
wire [4 :0] rf_waddr;
wire [4:0]  ws_dest;
wire [63:0] ws_final_result;
wire [63:0] ws_pc;
wire [63:0] ws_rt_value;
wire [63:0] rf_wdata;
wire [63:0] ws_rs1_value;
wire [63:0] alu_result;
wire [63:0] mem_result;
wire        ws_load_op;
wire [6:0]  ws_load_op_clear;

wire [31:0] ws_inst;
wire        ws_0x7b;
wire        ws_fence;

wire        op_lw;
wire        op_lb;
wire        op_lbu;
wire        op_lh;
wire        op_lhu;
wire        op_lwu;
wire        op_ld;

////csr////
wire[11:0] csr_addr;
wire[4:0]   ws_zimm;
wire        ws_int;
wire        ws_ex;
wire  ws_csrrw ; 
wire  ws_csrrs ;
wire  ws_csrrc ;
wire  ws_csrrwi;
wire  ws_csrrsi;
wire  ws_csrrci;
wire  ws_mret;
wire  ws_skip_clint;
wire  op_csr;
wire  csr_op;

wire   is_mstatus;
wire   is_mtvec;
wire   is_mepc;
wire   is_mcause;
wire   is_mip;
wire   is_mie;
wire   is_mcycle;
wire csrw_mstatus_xs_fs;
wire   illegal_csr;

assign illegal_csr = !(is_mstatus || is_mie || is_mtvec || is_mepc || is_mcause || is_mip || is_mcycle);
assign is_mstatus  = csr_addr == 12'h300;
assign is_mie      = csr_addr == 12'h304;
assign is_mtvec    = csr_addr == 12'h305;
assign is_mepc     = csr_addr == 12'h341;
assign is_mcause   = csr_addr == 12'h342;
assign is_mip      = csr_addr == 12'h344;
assign is_mcycle   = csr_addr == 12'hB00;


assign csrw_mstatus_xs_fs = is_mstatus &&  ws_csrrw |  ws_csrrs |  ws_csrrc && ws_valid 
                         && ws_rs1_value[14:13] != 2'b0 | ws_rs1_value[12:11] != 2'b0;
assign op_csr =  ws_csrrw   ||  ws_csrrs  ||  ws_csrrc  ||  ws_csrrwi ||  ws_csrrsi ||  ws_csrrci ;


assign {
                        ws_skip_clint,
                        ws_int,
                        ws_ex,
                        ws_fence,
                        ws_mret,
                        ws_csrrw ,
                        ws_csrrs ,
                        ws_csrrc ,
                        ws_csrrwi,
                        ws_csrrsi,
                        ws_csrrci,                        
                        ws_zimm,
                        csr_addr,
                        ws_load_op,
                        ws_load_op_clear,
       ws_0x7b,
       ws_gr_we       ,  //133:133
       ws_dest        ,  //132:128
       ws_rs1_value   ,
       alu_result,  //127:64
       ws_inst        ,
       ws_pc       //63:0
       } = ms_to_ws_bus_r;

assign ws_to_csr_bus = {

    ws_int,
    ws_ex,
    ws_fence,
    ws_valid,
    ws_mret,
    ws_csrrw ,
    ws_csrrs ,
    ws_csrrc ,
    ws_csrrwi,
    ws_csrrsi,
    ws_csrrci,                        
    ws_zimm,
    csr_addr,
    ws_pc,
    ws_rs1_value
};

assign ws_to_es_flush = (ws_ex || ws_int || ws_mret || ws_fence) && ws_valid;
assign ws_to_rf_bus = {rf_we   ,  //37:37
                       rf_waddr,  //36:32
                       rf_wdata   //31:0
                      };


assign ws_to_th_bus = { 
                        ws_gr_we  , //6:6
                        ws_valid , //5:5
                        ws_dest    //4:0
};
assign ws_to_ds_bus = {
                        ws_valid, 
                        ws_gr_we,
                        ws_dest,
                        ws_final_result
};

assign   op_lw  = ws_load_op_clear [0];
assign   op_lb  = ws_load_op_clear [1];
assign   op_lbu = ws_load_op_clear [2];
assign   op_lh  = ws_load_op_clear [3];
assign   op_lhu = ws_load_op_clear [4];
assign   op_lwu = ws_load_op_clear [5];
assign   op_ld  = ws_load_op_clear [6];
wire  [2:0] offset;
wire  [7:0] sel;
assign   offset = alu_result[2:0];
ysyx_210458_decoder_3_8   u_dec_wb(.in(offset),    .out(sel));

                    
assign mem_result = ({64{op_ld  }}     & rdata)
                  | ({64{op_lw  &  sel[3'h0]}}     & {{32{rdata[31]}},rdata[31:00]})
                  | ({64{op_lw  &  sel[3'h4]}}     & {{32{rdata[63]}},rdata[63:32]})
                  | ({64{op_lwu &  sel[3'h0]}}     & {{32'b0        },rdata[31:00]})
                  | ({64{op_lwu &  sel[3'h4]}}     & {{32'b0        },rdata[63:32]})
                  | ({64{op_lh  &  sel[3'h0]}}     & {{48{rdata[15]}},rdata[15:00]})
                  | ({64{op_lh  &  sel[3'h2]}}     & {{48{rdata[31]}},rdata[31:16]})
                  | ({64{op_lh  &  sel[3'h4]}}     & {{48{rdata[47]}},rdata[47:32]})
                  | ({64{op_lh  &  sel[3'h6]}}     & {{48{rdata[63]}},rdata[63:48]})
                  | ({64{op_lhu &  sel[3'h0]}}     & {{48'b0        },rdata[15:00]})
                  | ({64{op_lhu &  sel[3'h2]}}     & {{48'b0        },rdata[31:16]})
                  | ({64{op_lhu &  sel[3'h4]}}     & {{48'b0        },rdata[47:32]})
                  | ({64{op_lhu &  sel[3'h6]}}     & {{48'b0        },rdata[63:48]})
                  | ({64{op_lb  &  sel[3'h0]}}     & {{56{rdata[07]}},rdata[07:00]})
                  | ({64{op_lb  &  sel[3'h1]}}     & {{56{rdata[15]}},rdata[15:08]})
                  | ({64{op_lb  &  sel[3'h2]}}     & {{56{rdata[23]}},rdata[23:16]})
                  | ({64{op_lb  &  sel[3'h3]}}     & {{56{rdata[31]}},rdata[31:24]})
                  | ({64{op_lb  &  sel[3'h4]}}     & {{56{rdata[39]}},rdata[39:32]})
                  | ({64{op_lb  &  sel[3'h5]}}     & {{56{rdata[47]}},rdata[47:40]})
                  | ({64{op_lb  &  sel[3'h6]}}     & {{56{rdata[55]}},rdata[55:48]})
                  | ({64{op_lb  &  sel[3'h7]}}     & {{56{rdata[63]}},rdata[63:56]})
                  | ({64{op_lbu &  sel[3'h0]}}     & {{56'b0        },rdata[07:00]})
                  | ({64{op_lbu &  sel[3'h1]}}     & {{56'b0        },rdata[15:08]})
                  | ({64{op_lbu &  sel[3'h2]}}     & {{56'b0        },rdata[23:16]})
                  | ({64{op_lbu &  sel[3'h3]}}     & {{56'b0        },rdata[31:24]})
                  | ({64{op_lbu &  sel[3'h4]}}     & {{56'b0        },rdata[39:32]})
                  | ({64{op_lbu &  sel[3'h5]}}     & {{56'b0        },rdata[47:40]})
                  | ({64{op_lbu &  sel[3'h6]}}     & {{56'b0        },rdata[55:48]})
                  | ({64{op_lbu &  sel[3'h7]}}     & {{56'b0        },rdata[63:56]});

assign ws_ready_go = 1'b1;
assign ws_allowin  = !ws_valid || ws_ready_go;
always @(posedge clk) begin
    if (reset | cr_flush_o) begin
        ws_valid <= 1'b0;
    end
    else if (ws_allowin) begin
        ws_valid <= ms_to_ws_valid;
    end

    if (ms_to_ws_valid && ws_allowin) begin
        ms_to_ws_bus_r <= ms_to_ws_bus;
    end
end

assign ws_final_result = ws_load_op ? mem_result : alu_result;
assign csr_op =  ws_csrrw  || ws_csrrs || ws_csrrc || ws_csrrwi || ws_csrrsi || ws_csrrci;

assign rf_we    = ws_gr_we && ws_valid && !ws_ex;
assign rf_waddr = ws_dest;
assign rf_wdata = csr_op ? csr_rdata : ws_final_result;
                //   ws_load_op ? mem_result : 
assign i_fence = ws_fence && ws_valid;

`ifdef  YSYX210458_ENAENABLE_DFT
// debug info generate
assign debug_wb_pc       = ws_pc;
assign debug_wb_rf_wen   = rf_we;
assign debug_wb_rf_wnum  = ws_dest;
assign debug_wb_rf_wdata = rf_wdata;
assign debug_wb_inst     = ws_inst;
assign debug_wb_valid    = ws_valid && !ws_ex;
assign ws_io_uart_out_valid = ws_valid && ws_0x7b;
assign ws_skip = (ws_skip_clint || ws_0x7b || op_csr && csr_addr == 12'hB00  || illegal_csr && op_csr) &&ws_valid;
`endif

`ifdef YSYX210458_PREFCOUNT
reg [63:0] cmt_count;
always @(posedge clk) begin
    if (reset ) begin
        cmt_count <= 64'h0;
    end
    else if (ws_valid) begin
        cmt_count <= cmt_count + 1'h1;
    end
end

reg [63:0] clk_count;
always @(posedge clk)
begin
    if(clk_count[`YSYX210458_COUNT -1:0] == {`YSYX210458_COUNT{1'b1}}  ) begin
	    $display("cmt_count:");
        // $display(clk_count);
        $display(cmt_count);
        // $finish; 
    end
    if (reset )begin
        clk_count <= 64'h0;
    end
    else begin
        clk_count <= clk_count + 64'h1;
    end 
end
`endif
endmodule

////////AXI_bridge////
module ysyx_210458_AXI_bridge(
    input                          clk            ,
    input                          reset          ,

    input          rd_req   ,
    input [2:0]    rd_type  ,
    input [`YSYX210458_ADDR_WIDTH -1:0] rd_addr  ,
    output           rd_rdy   ,
    output           ret_valid,
    output           ret_last ,
    output [`YSYX210458_DATA_WIDTH -1:0]    ret_data,


    input            d_rd_req   ,
    input [2:0]      d_rd_type  ,
    input [`YSYX210458_ADDR_WIDTH -1:0]     d_rd_addr  ,
    output           d_rd_rdy   ,
    output           d_ret_valid,
    output           d_ret_last ,
    output [`YSYX210458_DATA_WIDTH -1:0]    d_ret_data,
    output           d_wr_rdy,

    input            d_wr_req,
    input [2:0]      d_wr_type,
    input [`YSYX210458_ADDR_WIDTH -1:0]     d_wr_addr,
    input [`YSYX210458_WSTRB_W -1:0]      d_wr_wstrb,
    input [`YSYX210458_LINE_W -1:0]    d_wr_data,

    output  [3:0]   cpu_arid,
    output  [`YSYX210458_ADDR_WIDTH -1:0]  cpu_araddr,
    output  [2:0]   cpu_arsize,
    output  [7:0]   cpu_arlen,
    output  [1:0]   cpu_arburst,
    output          cpu_arlock,
    output  [3:0]   cpu_arcache,
    output  [2:0]   cpu_arprot,   
    output          cpu_arvalid,
    input           cpu_arready,

    input   [3:0]   cpu_rid,
    input   [63:0]  cpu_rdata,
    input   [1:0]   cpu_rresp,
    input           cpu_rlast,
    input           cpu_rvalid,
    output          cpu_rready,

    output  [3:0]   cpu_awid,
    output  [`YSYX210458_ADDR_WIDTH -1:0]  cpu_awaddr,
    output  [7:0]   cpu_awlen,

    output  [2:0]   cpu_awsize,
    output  [1:0]   cpu_awburst,
    output          cpu_awlock,
    output  [3:0]   cpu_awcache,
    output  [2:0]   cpu_awprot,
    output          cpu_awvalid,
    input           cpu_awready,

    output  [3:0]   cpu_wid,
    output  [63:0]  cpu_wdata,
    output  [7:0]   cpu_wstrb,
    output          cpu_wlast,
    output          cpu_wvalid,
    input          cpu_wready,

    input  [3:0]    cpu_bid,
    input  [1:0]    cpu_bresp,
    input           cpu_bvalid,
    output          cpu_bready


);

reg             i_arvalid;
reg             d_arvalid;

reg             awvalid;
reg             wvalid;

wire            data_haza;
wire            Iaddr_Rptr_add;
wire            Iaddr_Wptr_add;

wire [`YSYX210458_ADDR_WIDTH -1:0] Df_araddr;
wire [2:0]              Df_artype;

wire            Iaddr_FULL;
wire            Iaddr_EMPTY;
wire            Irdata_FULL;
wire            Irdata_EMPTY;
wire            Iaddr_re;
wire            Daddr_re;

wire            Iaddr_buf_we;
wire            Irdata_buf_we;

wire    haza_EMPTY;
wire    haza_FULL;
wire    haza_ce;//clear_ENABLE
wire    haza_we;//write_ENANLE
wire    haza_uncache;
wire    Ir_haza;
wire    Dr_haza;
wire    uncache_haza;
wire    Dr_haza_ing;
wire    Ir_haza_ing;

   //aw && w 
wire       AWaddr_EMPTY;
wire       AWaddr_FULL;
wire        Wdata_EMPTY;
wire        Wdata_FULL;

assign Iaddr_buf_we      = rd_req && rd_rdy && !Iaddr_FULL && AWaddr_EMPTY; 
assign Irdata_buf_we     = cpu_rid == 4'h0 && cpu_rvalid && !Irdata_FULL;
assign Iaddr_Wptr_add    = rd_req && rd_rdy && !Iaddr_FULL && AWaddr_EMPTY;
assign Iaddr_Rptr_add    = i_arvalid && cpu_arready && !Iaddr_EMPTY;


///////////////////////////////////



wire            Daddr_FULL;
wire            Daddr_EMPTY;
wire            Drdata_FULL;
wire            Drdata_EMPTY;
wire            Draxi_valid;
wire            Draxi_last;
wire  [`YSYX210458_DATA_WIDTH -1:0] Drdata;

assign  Draxi_valid = cpu_rid == 4'h1 && cpu_rvalid;
assign  Draxi_last  = cpu_rid == 4'h1 && cpu_rvalid && cpu_rlast;

wire            Daddr_buf_we;
wire            Drdata_buf_we;
wire            Dr_cache;
assign Dr_cache         = Df_artype == 3'h7;
assign Daddr_buf_we     = d_rd_req &&  !Daddr_FULL && d_rd_rdy && AWaddr_EMPTY;
assign Drdata_buf_we    = cpu_rid == 4'h1 && cpu_rvalid;


//////////////////////Daddr////////////////////////
wire        d_arvalid_1;
assign Daddr_re = d_arvalid && cpu_arready; 
ysyx_210458_fifo #(
    .DEPTH_WIDTH    (4),
    .YSYX210458_DATA_WIDTH     (35)
    )
Daddr_fifo (
    .clk        (clk),
    .reset      (reset),
    .empty      (Daddr_EMPTY),
    .full       (Daddr_FULL),
    .rd_en      (Daddr_re ),
    .wr_en      (Daddr_buf_we),
    .wdata      ({d_rd_type,d_rd_addr}),
    .rdata      ({Df_artype,Df_araddr})
);
////{rlast,rvalid,rdata}////
///Df => Data_fifo///
wire        Df_rlast;
wire        Df_rvalid;

wire [`YSYX210458_DATA_WIDTH -1:0] Df_rdata;
ysyx_210458_fifo#(
    .DEPTH_WIDTH    (8),
    .YSYX210458_DATA_WIDTH     (66),
    .WIDTH_CNT      (4)
    )
Drdata_fifo(
    .clk        (clk),
    .reset      (reset),
    .empty      (Drdata_EMPTY),
    .full       (Drdata_FULL),
    .rd_en      (!Drdata_EMPTY  ),
    .wr_en      (Drdata_buf_we),
    .wdata      ({Draxi_last,Draxi_valid,cpu_rdata}),
    .rdata      ({Df_rlast,Df_rvalid,Df_rdata})
);


////////////////////Iaddr///////////////////////////
wire   i_arvalid_1;
wire   Iraxi_last;
wire   Iraxi_valid;

wire [2:0]              If_artype;
wire [`YSYX210458_ADDR_WIDTH -1:0] If_araddr;
wire   Ir_cache;

assign Ir_cache = If_artype == 3'h7;
assign Iaddr_re = i_arvalid && cpu_arready;
ysyx_210458_fifo #(
    .DEPTH_WIDTH    (4),
    .YSYX210458_DATA_WIDTH     (35)
    )
Iaddr_fifo (
    .clk        (clk),
    .reset      (reset),
    .empty      (Iaddr_EMPTY),
    .full       (Iaddr_FULL),
    .rd_en      (Iaddr_re),
    .wr_en      (Iaddr_buf_we),
    .wdata      ({rd_type,rd_addr}),
    .rdata      ({If_artype,If_araddr})
);

////{rlast,rvalid,rdata}////
///If => Inst_fifo///
wire        If_rlast;
wire        If_rvalid;

assign  Iraxi_valid = cpu_rid == 4'h0 && cpu_rvalid;
assign  Iraxi_last  = cpu_rid == 4'h0 && cpu_rvalid && cpu_rlast;

wire [`YSYX210458_DATA_WIDTH -1:0] If_rdata;
ysyx_210458_fifo#(
    .DEPTH_WIDTH    (8),
    .YSYX210458_DATA_WIDTH     (66),
    .WIDTH_CNT      (4)
    )
Irdata_fifo(
    .clk        (clk),
    .reset      (reset),
    .empty      (Irdata_EMPTY),
    .full       (Irdata_FULL),
    .rd_en      (!Irdata_EMPTY  ),
    .wr_en      (Irdata_buf_we),
    .wdata      ({Iraxi_last,Iraxi_valid,cpu_rdata}),
    .rdata      ({If_rlast,If_rvalid,If_rdata})
);



// aread && read
assign i_arvalid_1 = !Ir_haza  && (!Iaddr_EMPTY || Iaddr_EMPTY && Iaddr_Rptr_add) && !d_arvalid && Daddr_EMPTY && !uncache_haza && !Ir_haza_ing;
//!data_haza  && (!Iaddr_EMPTY || Iaddr_EMPTY && Iaddr_Rptr_add) && !d_arvalid && Daddr_EMPTY;
assign d_arvalid_1 = !Daddr_EMPTY && !data_haza && (!i_arvalid || i_arvalid && cpu_arready) && !Dr_haza && !uncache_haza && !Dr_haza_ing;
    //!Daddr_EMPTY && !data_haza && (!i_arvalid || i_arvalid && cpu_arready);
always @( posedge clk) begin
//d_arvalid 需要当作输出的的选择控制信号
    if (reset || cpu_arready && d_arvalid) begin
        d_arvalid <= 1'b0;
    end
    else if ( !Daddr_EMPTY && !data_haza && (!i_arvalid || i_arvalid && cpu_arready) && !Dr_haza && !uncache_haza && !Dr_haza_ing) begin
        d_arvalid <= 1'b1;
    end
    

    if (reset || cpu_arready && i_arvalid && Iaddr_EMPTY && !Iaddr_Wptr_add || cpu_arready &&  !Daddr_EMPTY && !data_haza || Iaddr_EMPTY && !Iaddr_Wptr_add || i_arvalid && cpu_arready) begin
        i_arvalid <= 1'b0;
    end
    else if (  !Ir_haza  && (!Iaddr_EMPTY || Iaddr_EMPTY && Iaddr_Rptr_add) && !d_arvalid && Daddr_EMPTY && !uncache_haza && !Ir_haza_ing ) begin
        i_arvalid <= 1'b1;
    end

   
 end   
    

assign d_ret_data = Df_rdata;
assign d_ret_valid = Df_rvalid && !Drdata_EMPTY;
assign d_ret_last  = Df_rlast && !Drdata_EMPTY;
assign cpu_arid      = d_arvalid ? 4'h1 : 4'h0;
assign cpu_araddr    = d_arvalid ? {Df_araddr} : {If_araddr};
assign cpu_arlen     = d_arvalid && Dr_cache || i_arvalid && Ir_cache ? 8'h7 :8'h0; 
                     //   d_arvalid ?  4'h0 : 4'h0; //8'h0;
assign cpu_arsize    = 
                       d_arvalid && !Dr_cache ? Df_artype :  //3'h3;
                       i_arvalid && !Ir_cache ? If_artype : 3'h3;   //3'h3;//d_arvalid ? Dsize_buf[Daddr_Rptr_count] : 2'h3;
assign cpu_arburst   = 2'b01;
assign cpu_arlock    = 1'b0;
assign cpu_arcache   = 4'b0;
assign cpu_arprot    = 3'b0;
assign cpu_arvalid   = d_arvalid ? d_arvalid : i_arvalid ;//&& !Iaddr_EMPTY;
assign cpu_rready    = cpu_rid == 4'h0 && !Irdata_FULL || cpu_rid == 4'h1 && !Drdata_FULL;//rready;



assign rd_rdy    = !Iaddr_FULL && AWaddr_EMPTY;//&& AWaddr_EMPTY;
assign ret_data  = If_rdata;
assign ret_valid = If_rvalid && !Irdata_EMPTY;
assign ret_last  = If_rlast  && !Irdata_EMPTY;


wire            AWaddr_buf_we;
wire            Wdata_buf_we;
wire            wvalid_1;
wire            awvalid_1;
wire            AWaddr_re;
wire            Wdata_re;

wire  [2:0]     AWaddr_awsize;
wire [`YSYX210458_DATA_WIDTH -1 :0] Wdata_data;
wire  [7:0]      Wdata_wstrb;
wire [2:0]      AWtype;
wire [`YSYX210458_ADDR_WIDTH -1:0] AWaddr;


assign AWaddr_buf_we     = d_wr_req &&  !AWaddr_FULL && d_wr_rdy;
assign AWaddr_re         = cpu_awready && cpu_awvalid;

assign Wdata_buf_we     = d_wr_req && !Wdata_FULL && d_wr_rdy;
assign Wdata_re         = cpu_wvalid && cpu_wready && cpu_wlast;

ysyx_210458_fifo #(
    .DEPTH_WIDTH (4),
    .YSYX210458_DATA_WIDTH (35))
AWaddr_fifo (
    .clk        (clk),
    .reset      (reset),
    .empty      (AWaddr_EMPTY),
    .full       (AWaddr_FULL),
    .rd_en      (AWaddr_re ),
    .wr_en      (AWaddr_buf_we),
    .wdata      ({d_wr_type,d_wr_addr}),
    .rdata      ({AWtype,AWaddr})
);

wire [`YSYX210458_LINE_W -1:0] Wdata;

wire [`YSYX210458_WSTRB_W -1:0]    Wstrb;
wire      wlast;
wire      w_uncahe;
wire      o_w_uncahe;
assign    w_uncahe = d_wr_type != 3'h4;
ysyx_210458_fifo #(
    .DEPTH_WIDTH    (4),
    .YSYX210458_DATA_WIDTH     (265)
    )
Wdata_fifo (
    .clk        (clk),
    .reset      (reset),
    .empty      (Wdata_EMPTY),
    .full       (Wdata_FULL),
    .rd_en      (Wdata_re),
    .wr_en      (Wdata_buf_we),
    .wdata      ({w_uncahe,d_wr_wstrb ,d_wr_data}),
    .rdata      ({o_w_uncahe,Wstrb, Wdata})
);

reg [1:0] Wdata_count;
reg       need_count;

wire    w_sel0;
wire    w_sel1;
wire    w_sel2;
wire    w_sel3;

assign w_sel0 = Wdata_count == 2'h0;
assign w_sel1 = Wdata_count == 2'h1;
assign w_sel2 = Wdata_count == 2'h2;
assign w_sel3 = Wdata_count == 2'h3;

assign Wdata_data = ({`YSYX210458_DATA_WIDTH{ w_sel0 } } & Wdata[063:000]) 
                  | ({`YSYX210458_DATA_WIDTH{ w_sel1 } } & Wdata[127:064])
                  | ({`YSYX210458_DATA_WIDTH{ w_sel2 } } & Wdata[191:128])
                  | ({`YSYX210458_DATA_WIDTH{ w_sel3 } } & Wdata[255:192]);

assign wlast = Wdata_count == 2'h3 || o_w_uncahe; //|| !need_count &&  AWtype == 3'h2;

always @( posedge clk) begin
    if (reset || wlast && wvalid && cpu_wready) begin
        Wdata_count <= 2'h0;
    end
    else if ( wvalid && cpu_wready ) begin//&& need_count
        Wdata_count <= Wdata_count + 1'b1;
    end
    if (reset || cpu_wvalid && cpu_wlast && cpu_wready) begin
        need_count <= 1'b0;
    end
    else if (awvalid && AWtype != 3'h2) begin
        need_count <= 1'b1;
    end
end


////////////////
always @( posedge clk) begin
    if (reset || cpu_awready && awvalid) begin
        awvalid <= 1'b0;
    end
    else if (!AWaddr_EMPTY && !uncache_haza) begin
        awvalid <= 1'b1;
    end

    if (reset || cpu_wready && wvalid && wlast )begin
        wvalid <= 1'b0;
    end
    else if (!Wdata_EMPTY && !uncache_haza) begin
        wvalid <= 1'b1;
    end
    
end
////////////////////
wire    aw_cache;
wire    haza_wr_uncache;
assign aw_cache  = AWtype == 3'h4;
assign haza_we = cpu_awvalid && cpu_awready;
// assign haza_we = d_wr_req && d_wr_rdy;
assign haza_ce = cpu_bvalid && cpu_bready;
assign haza_wr_uncache = !aw_cache;
assign Dr_haza_ing = Df_araddr[31:6] == AWaddr[31:6] && !AWaddr_EMPTY;
assign Ir_haza_ing = If_araddr[31:6] == AWaddr[31:6] && !AWaddr_EMPTY;
ysyx_210458_axi_haza u_axi_haza(
    .clk        (clk),
    .reset      (reset),

    .empty      (haza_EMPTY),
    .full       (haza_FULL),
    .rd_en      (haza_ce),
    .wr_en      (haza_we),
    .wr_uncahe  (haza_wr_uncache),
    .compare_addr1  (If_araddr[31:6]),
    .compare_addr2  (Df_araddr[31:6]),
    .haza1      (Ir_haza),
    .haza2      (Dr_haza),
    .haza_uncache (uncache_haza),
    .wdata      (AWaddr[31:6])
    // .wdata      (d_wr_addr[31:6])

);




assign d_wr_rdy = !AWaddr_FULL && !Wdata_FULL && !haza_FULL;
// assign d_rd_rdy = !AWaddr_FULL ;
assign d_rd_rdy = !Daddr_FULL && AWaddr_EMPTY;//AWaddr_EMPTY && !Daddr_FULL;


assign cpu_awid     = 4'h1;
assign cpu_awaddr   = {AWaddr};
assign cpu_awlen    = aw_cache ? 8'h3 : 8'h0;
assign cpu_awsize   = aw_cache ? 3'h3 : AWtype; //3'h3;  //AWaddr_awsize;
assign cpu_awburst  = 2'b01;
assign cpu_awlock   = 1'b0;
assign cpu_awcache  = 4'h0;
assign cpu_awprot   = 3'h0;
assign cpu_awvalid  = awvalid;

assign cpu_wid      = 4'h1;
assign cpu_wdata    = Wdata_data;
assign cpu_wstrb    = Wstrb;
assign cpu_wlast    = wlast;
assign cpu_wvalid   = wvalid;
assign cpu_bready   = 1'b1;//!haza_FULL;不应该是!haza_full，这个相当于读指针
assign data_haza = (cpu_awaddr == cpu_araddr) && cpu_arvalid && (cpu_awvalid || cpu_wvalid);

endmodule

////////CSR///////
module ysyx_210458_csr (
    input clk,
    input  reset ,
    input [`YSYX210458_WS_TO_CSR_BUS_WD-1:0] ws_to_csr_bus,
    output [63:0] csr_rdata,
    output [63:0] csr_flush_pc,
    output        csr_flush_o,
    output        csr_MIE,
    output        csr_MTIE
    `ifdef  YSYX210458_ENAENABLE_DFT
    ,
    ////diff_test////
    output [3:0]  diff_intrNO,
    output [3:0]  diff_cause,
    output [63:0] diff_mstatus,
    output [63:0] diff_mepc,
    output [63:0] diff_mtvec,
    output [63:0] diff_mcause,
    output [63:0] diff_mip,
    output [63:0] diff_mie   

    `endif     
);

reg [1:0]   csr_mstatus_MPP;
reg         csr_mstatus_MPIE;
reg         csr_mstatus_MIE;
reg         csr_mstatus_SD;
reg  [1:0]  csr_mstatus_XS;
reg  [1:0]  csr_mstatus_FS;
reg [1:0]   csr_mtvec_MODE;
reg [61:0]  csr_mtvec_BASE;
reg [63:0]  csr_mepc;
reg         csr_mcause_int;
reg [62:0]  csr_mcause_excode;
wire [63:0] csr_mip;
reg  [63:0] csr_mcycle;
reg         csr_mie_MTIE;


wire[11:0] csr_addr;
wire[4:0]   ws_zimm;
wire        ws_int;
wire        ws_ex;
wire  ws_valid;
wire  op_csrrw ; 
wire  op_csrrs ;
wire  op_csrrc ;
wire  op_csrrwi;
wire  op_csrrsi;
wire  op_csrrci;
wire  op_mret;
wire  ws_fence;
wire [63:0] csr_wdata;
wire [63:0] ws_pc;
wire [3:0] excode;
reg tick;
wire [63:0] csr_mstatus;
wire [63:0] csr_mtvec;
// wire [63:0] csr_mepc;
wire [63:0] csr_mcause;
// wire [63:0] csr_mip;
wire [63:0] csr_mie;
wire [63:0] ws_rs1_value;

////we==>write_enable////
wire    mtvec_we;
wire    mepc_we;
wire    mstatus_we;
wire    mcause_we;
wire    mcycle_we;
wire    mie_we;
////se==>set_enable////
wire    mtvec_se;
wire    mepc_se;
wire    mstatus_se;
wire    mcause_se;
wire    mcycle_se;
wire    mie_se;
////ce==>set_enable////
wire    mtvec_ce;
wire    mepc_ce;
wire    mstatus_ce;
wire    mcause_ce;
wire    mcycle_ce;
wire    mie_ce;
//
wire    csrrwe;
wire    csrrse;
wire    csrrce;
//
wire    int_we;
wire   is_mstatus;
wire   is_mtvec;
wire   is_mepc;
wire   is_mcause;
wire   is_mip;
wire   is_mie;
wire   is_mcycle;
wire   is_mimpid;//64'h 4D31_5452_7878_937C
wire [`YSYX210458_DATA_WIDTH -1:0] csr_mimpid;



assign csrrwe      = ws_valid && (op_csrrw || op_csrrwi);
assign csrrse      = ws_valid && (op_csrrs || op_csrrsi) && ws_zimm != 5'h0;
assign csrrce      = ws_valid && (op_csrrc || op_csrrci) && ws_zimm != 5'h0;

assign csr_mstatus = {csr_mstatus_SD, 46'b0,csr_mstatus_XS,csr_mstatus_FS,csr_mstatus_MPP,3'b0,csr_mstatus_MPIE,3'b0,csr_mstatus_MIE,3'b0};
assign csr_mtvec   = {csr_mtvec_BASE,2'b0};
assign csr_mcause  = {csr_mcause_int,csr_mcause_excode};
assign csr_mip     = 64'b0;
assign csr_mie     = {56'b0,csr_mie_MTIE,7'b0};
assign csr_mimpid = 64'h4D31_5452_7878_937C;

assign is_mstatus  = csr_addr == 12'h300;
assign is_mie      = csr_addr == 12'h304;
assign is_mtvec    = csr_addr == 12'h305;
assign is_mepc     = csr_addr == 12'h341;
assign is_mcause   = csr_addr == 12'h342;
assign is_mip      = csr_addr == 12'h344;
assign is_mcycle   = csr_addr == 12'hB00;
assign is_mimpid   = csr_addr == 12'hF13;


assign mstatus_we = csrrwe && is_mstatus;
assign mtvec_we   = csrrwe && is_mtvec;
assign mepc_we    = csrrwe && is_mepc;
assign mie_we     = csrrwe && is_mie;
assign mcause_we  = csrrwe && is_mcause;
assign mcycle_we  = csrrwe && is_mcycle;

assign mstatus_se = csrrse && is_mstatus;
assign mtvec_se   = csrrse && is_mtvec;
assign mepc_se    = csrrse && is_mepc;
assign mie_se     = csrrse && is_mie;
assign mcause_se  = csrrse && is_mcause;
assign mcycle_se  = csrrse && is_mcycle;

assign mstatus_ce = csrrce && is_mstatus;
assign mtvec_ce   = csrrce && is_mtvec;
assign mepc_ce    = csrrce && is_mepc;
assign mie_ce     = csrrce && is_mie;
assign mcause_ce  = csrrce && is_mcause;
assign mcycle_ce  = csrrce && is_mcycle;



assign excode     = ws_int ? 4'd07 :4'd11;

assign csr_rdata  = ({64{is_mstatus  } }  & csr_mstatus )
                  | ({64{is_mie      }}   & csr_mie )
                  | ({64{is_mtvec    }}   & csr_mtvec )
                  | ({64{is_mepc     }}   & csr_mepc )
                  | ({64{is_mcause   }}   & csr_mcause )
                  | ({64{is_mip      }}   & csr_mip )
                  | ({64{is_mcycle   }}   & csr_mcycle )
                  | ({64{is_mimpid   }}   & csr_mimpid );
assign csr_flush_pc = ws_fence && ws_valid ? ws_pc + 64'h4 : op_mret && ws_valid ? csr_mepc : csr_mtvec;
assign csr_flush_o  = ( op_mret || ws_ex || op_mret || ws_fence) && ws_valid;



always @(posedge clk) begin
    ////MIE////
    if (reset) begin
        csr_mstatus_MIE  <= 1'b0;
    end
    else if (mstatus_we ) begin
        csr_mstatus_MIE  <= csr_wdata[3];
    end
    else if (mstatus_se) begin
        csr_mstatus_MIE <= csr_wdata[3] | csr_mstatus_MIE;
    end
    else if (mstatus_ce ) begin
        csr_mstatus_MIE  <= csr_wdata[3] ? 1'b0 : csr_mstatus_MIE;
    end
    else if (ws_ex && ws_valid) begin
        csr_mstatus_MIE  <= 1'b0;
    end
    else if (op_mret && ws_valid) begin
        csr_mstatus_MIE  <=  csr_mstatus_MPIE;
    end
    ////MPIE////
    if (reset ) begin
        csr_mstatus_MPIE <= 1'b0;
    end
    else if (mstatus_we ) begin
        csr_mstatus_MPIE <= csr_wdata[7];
    end
    else if (mstatus_se ) begin
        csr_mstatus_MPIE <= csr_wdata[7] | csr_mstatus_MPIE;
    end
    else if (mstatus_ce  ) begin
        csr_mstatus_MPIE <= csr_wdata[7] ? 1'b0 : csr_mstatus_MPIE;
    end
    else if (ws_ex && ws_valid ) begin
        csr_mstatus_MPIE <= csr_mstatus_MIE;
    end
    else if (op_mret && ws_valid) begin
        csr_mstatus_MPIE <= 1'b1;
    end
    ////MPP////
    if (reset )begin
        csr_mstatus_MPP <= 2'h0;
    end
    else if (mstatus_we ) begin
        csr_mstatus_MPP <= csr_wdata[12:11];
    end
    else if (mstatus_se ) begin
        csr_mstatus_MPP <= csr_wdata[12:11] | csr_mstatus_MPP;
    end
    else if (mstatus_ce ) begin
        csr_mstatus_MPP <= ~csr_wdata[12:11] & csr_mstatus_MPP;
    end
    else if (ws_ex && ws_valid) begin
        csr_mstatus_MPP <= 2'h3;
    end
    else if (op_mret && ws_valid) begin
        csr_mstatus_MPP <= 2'h3;
    end
    ////XS////
    if (reset) begin
        csr_mstatus_XS <= 2'b0;
    end
    else if (mstatus_we ) begin
        csr_mstatus_XS <= csr_wdata[16:15];
    end
    else if (mstatus_se) begin
        csr_mstatus_XS <= csr_wdata[16:15] | csr_mstatus_XS;
    end
    else if (mstatus_ce) begin
        csr_mstatus_XS <= ~csr_wdata[16:15] & csr_mstatus_XS;
    end
    ////FS////
    if (reset) begin
        csr_mstatus_FS <= 2'b0;
    end
    else if (mstatus_we ) begin
        csr_mstatus_FS <= csr_wdata[14:13];
    end
     else if (mstatus_se) begin
        csr_mstatus_FS <=  csr_wdata[14:13] | csr_mstatus_FS;
    end
    else if (mstatus_ce) begin
        csr_mstatus_FS <= ~csr_wdata[14:13] & csr_mstatus_FS;
    end
    ////SD////
    if (reset  ) begin
        csr_mstatus_SD <= 1'b0;
    end
    else if (mstatus_we ) begin
        csr_mstatus_SD <= csr_wdata[14:13] == 2'b11 || csr_wdata[16:15] == 2'b11;
    end
    else if (mstatus_se ) begin
       csr_mstatus_SD <= ( csr_wdata[14:13] | csr_mstatus_FS) == 2'b11 || ( csr_wdata[16:15] | csr_mstatus_XS)  == 2'b11;
    end
    else if (mstatus_ce ) begin
       csr_mstatus_SD <= (~csr_wdata[14:13] & csr_mstatus_FS) == 2'b11 || (~csr_wdata[16:15] & csr_mstatus_XS)  == 2'b11;
    end
    else if ( csr_mstatus_FS != 2'b11 && csr_mstatus_XS != 2'b11) begin
        csr_mstatus_SD <= 1'b0;
    end
end

always @(posedge clk) begin 
    ////MTVEC_BASE////
     if (mtvec_we ) begin
        csr_mtvec_BASE <= csr_wdata[63:2];
    end
   else if (mtvec_se ) begin
        csr_mtvec_BASE <= csr_wdata[63:2] | csr_mtvec_BASE;
    end 
    else if (mtvec_ce ) begin
        csr_mtvec_BASE <= ~csr_wdata[63:2] & csr_mtvec_BASE;
    end
end

always @(posedge clk) begin
    //////mepc//////
   if (mepc_we ) begin
        csr_mepc    <= csr_wdata;
    end
    else if (mepc_se ) begin
        csr_mepc    <= csr_wdata | csr_mepc;
    end
    else if (mepc_ce ) begin
        csr_mepc    <= ~csr_wdata & csr_mepc;
    end
    else if (ws_ex && ws_valid) begin
        csr_mepc    <= ws_pc;
    end   
    
end
////int////
assign int_we = ws_valid && ws_int;
always @(posedge clk) begin
    if (reset) begin
        csr_mcause_int <= 1'b0;
    end
    else if (int_we) begin
        csr_mcause_int <= 1'b1;
    end
    else if (ws_ex && !ws_int && ws_valid ) begin
        csr_mcause_int <= 1'b0;
    end
    
    ////mcause_codew////
    if (reset) begin
        csr_mcause_excode <= 63'b0;
    end
    else if (mcause_we ) begin
        csr_mcause_excode <= csr_wdata[63:1];
    end
     else if (mcause_se ) begin
        csr_mcause_excode <= csr_wdata[63:1] | csr_mcause_excode;
    end
     else if (mcause_ce ) begin
        csr_mcause_excode <= ~csr_wdata[63:1] & csr_mcause_excode;
    end
    else if (ws_ex && ws_valid) begin
        csr_mcause_excode <= {59'b0,excode};
    end
end
////mie_MTIE////

always @(posedge clk) begin
    if (reset )begin
        csr_mie_MTIE <= 1'b0;
    end
    else if (mie_we) begin
        csr_mie_MTIE <= csr_wdata[7];
    end
    else if (mie_se ) begin
        csr_mie_MTIE <=  csr_wdata[7] | csr_mie_MTIE;
    end
    else if (mie_ce ) begin
        csr_mie_MTIE <= ~csr_wdata[7] & csr_mie_MTIE;
    end
end
assign csr_MIE  = csr_mstatus_MIE;
assign csr_MTIE = csr_mie_MTIE;
////mcycle//
always @(posedge clk) begin
    if (reset) tick <= 1'b0;
        else tick <= ~tick;
    if (reset ) begin
        csr_mcycle <= 64'h0;
    end  
    else if (mcycle_we ) begin
        csr_mcycle <= csr_wdata;
    end
    else if (mcycle_se ) begin
        csr_mcycle <=  csr_wdata | csr_mcycle;
    end
    else if (mcycle_ce ) begin
        csr_mcycle <= ~csr_wdata & csr_mcycle;
    end
    else  begin
        csr_mcycle <= csr_mcycle + 1'b1;
    end
end



assign csr_wdata = (op_csrrci || op_csrrsi || op_csrrwi) ? {59'b0,ws_zimm} : ws_rs1_value;
assign {
    ws_int,
    ws_ex,
    ws_fence,
    ws_valid,
    op_mret,
    op_csrrw ,
    op_csrrs ,
    op_csrrc ,
    op_csrrwi,
    op_csrrsi,
    op_csrrci,                        
    ws_zimm,
    csr_addr,
    ws_pc,
    ws_rs1_value
} = ws_to_csr_bus;

`ifdef  YSYX210458_ENAENABLE_DFT
///////////////////////////difftest//////////////////////////////

/////CSR_diff////
assign  diff_mstatus    = ws_ex && ws_valid ?  {csr_mstatus_SD, 46'b0,csr_mstatus_XS,csr_mstatus_FS, 2'd3,3'd0,csr_mstatus_MIE,3'h0,4'b0} :
                          mstatus_we   ? { (csr_wdata[14:13] == 2'b11 || csr_wdata[16:15] == 2'b11 ),csr_wdata[62:0] } :
                          mstatus_se   ? csr_wdata | csr_mstatus :
                          mstatus_ce   ? ~csr_wdata & csr_mstatus :          
                          op_mret && ws_valid ? {csr_mstatus_SD, 46'b0,csr_mstatus_XS,csr_mstatus_FS,2'h3,3'b0,1'b1,3'b0,csr_mstatus_MPIE,3'b0} :
                                                 csr_mstatus;//| {51'b0,2'd3,11'b0}
assign  diff_mepc       = ws_ex && ws_valid ? ws_pc : 
                          mepc_we  ? csr_wdata:
                          mepc_se  ? csr_wdata | csr_mepc : 
                          mepc_ce  ? ~csr_wdata & csr_mepc :  csr_mepc;
assign  diff_mtvec      = mtvec_we ? {csr_wdata[63:2] ,2'b0} : 
                          mtvec_se ? csr_wdata | csr_mtvec :
                          mtvec_ce ? ~csr_wdata & csr_mtvec : csr_mtvec;

assign  diff_mcause     = ws_ex && ws_valid ? {ws_int,59'b0,excode} : 
                         mcause_we ? csr_wdata :
                         mcause_se ? csr_wdata | csr_mcause :
                         mcause_ce ? ~csr_wdata & csr_mcause :  csr_mcause;
assign  diff_mip        = csr_mip ;
assign  diff_mie        = mie_we  ?  csr_wdata :
                          mie_se  ?  csr_wdata | csr_mie :
                          mie_ce  ?   ~csr_wdata & csr_mie : csr_mie ;
//////ARCH_EVENT_diff/////  
assign diff_cause  = ws_ex && !ws_int && ws_valid ? 4'd11 : 4'h0;
assign diff_intrNO = ws_int && ws_valid  ? 4'd7 : 4'h0;
            
///////////////////////////////////////////////////////////////////////////////////////////////
`endif 



endmodule

/////////CACHE_MODULE////////
module ysyx_210458_cache 
#(
parameter   YSYX210458_ADDR_WIDTH = 32,
parameter   YSYX210458_DATA_WIDTH = 64,
parameter   YSYX210458_OFFSET_W   = 5 ,
parameter   YSYX210458_INDEX_W =  6,
parameter  TAGV_W = 33 - YSYX210458_OFFSET_W - YSYX210458_INDEX_W,
parameter  YSYX210458_TAG_W =  32 - YSYX210458_OFFSET_W - YSYX210458_INDEX_W,
parameter  YSYX210458_LINE_W = 256 ,
parameter  SRAM_WIDTH = 128,
parameter  YSYX210458_WSTRB_W = 8,
parameter  DEPTH = 64   ,
parameter  SRAM_WE_WITH = 16,
parameter IS_ICACHE = 0  
)

(
    input           reset,
    input           clk,
    //
input           uncache,
input           valid ,
input           op,
input           fence_valid,   
input [2:0]     size, 
input [YSYX210458_INDEX_W - 1  :0]     index, 
input [YSYX210458_TAG_W - 1    :0]       tag,   
input [YSYX210458_OFFSET_W -1  :0]     offset,
input [YSYX210458_WSTRB_W -1   :0]     wstrb, 
input [YSYX210458_DATA_WIDTH -1:0]    wdata, 
output          addr_ok,
output          data_ok,
output          data_ok2,
output[YSYX210458_DATA_WIDTH -1:0]    rdata,
output[`YSYX210458_INST_W -1   :0]    inst,

//
output                          rd_req,   
output [2               :0]     rd_type,  
output [YSYX210458_ADDR_WIDTH -1   :0]     rd_addr,  
input                           rd_rdy,   
input                           ret_valid,
input                           ret_last, 
input [YSYX210458_DATA_WIDTH -1    :0]     ret_data,
output                          wr_req  ,
output [2:0]                    wr_type ,
output [YSYX210458_ADDR_WIDTH -1   :0]     wr_addr ,
output [YSYX210458_WSTRB_W -1      :0]     wr_wstrb,
output [YSYX210458_LINE_W -1       :0]     wr_data, 
input                           wr_rdy
);
//


// reg  CACHE_valid;
reg  IDLE,LKUP_valid,MISS_valid,REP_valid,REF_valid;
wire LKUP_to_MISS,MISS_to_REP,REP_to_REF,REF_to_0,no_need_wr_rdy,REP_to_LKUP;
wire SMB_wdone;
///////////FENCE//////////////////
wire [DEPTH -1:0] way0_vd_list,way1_vd_list;
wire              way0_clear,way1_clear;
wire [YSYX210458_INDEX_W -1 :0] way0_fence_index,way1_fence_index;
wire              way0_valid,way1_valid;
wire REP_to_IDLE;

////////////LOOK UP////////////
//RQB=>Request Buffer
reg             RQB_op,RQB_cache,RQB_rep_way,RQB_fence;
reg [2:0]       RQB_size;


// reg             RQB_valid;
reg [YSYX210458_INDEX_W -1 :0]         RQB_index;
reg [YSYX210458_TAG_W -1   :0]         RQB_tag;
reg [YSYX210458_OFFSET_W -1:0]         RQB_offset;
reg [YSYX210458_WSTRB_W -1 :0]         RQB_wstrb;
reg [YSYX210458_DATA_WIDTH -1:0]       RQB_wdata;
reg [YSYX210458_ADDR_WIDTH -1:0]       RQB_addr;
wire                        way0_v;
wire                        way1_v;
wire            RAW_haza;
wire [YSYX210458_TAG_W -1  :0]     way0_tag;
wire [YSYX210458_TAG_W -1  :0]     way1_tag;
wire                    way0_d;
wire                    way1_d;
wire                    way0_hit;
wire                    way1_hit;
wire                    cache_hit;
wire [YSYX210458_DATA_WIDTH -1:0]  way0_rdata;
wire [YSYX210458_DATA_WIDTH -1:0]  way1_rdata;
wire [YSYX210458_DATA_WIDTH -1:0]  cache_rdata;

wire            bank_sel_0_4,bank_sel_1_5,bank_sel_2_6, bank_sel_3_7;

wire            inst_sel_hi;
reg             sel_hi;
assign          inst_sel_hi = RQB_offset[2];

//
////////////REFILL////////////
reg [YSYX210458_DATA_WIDTH -1:0]  RFB_data0_buf;
reg [YSYX210458_DATA_WIDTH -1:0]  RFB_data1_buf;
reg [YSYX210458_DATA_WIDTH -1:0]  RFB_data2_buf;
wire[YSYX210458_DATA_WIDTH -1:0]  RFB_data3;
wire                   REF_cache_last;
wire                   REF_last;


wire        RFB_we0,RFB_we1,RFB_we2,RFB_we3,RFB_we4,RFB_we5,RFB_we6,RFB_we7;


wire[YSYX210458_DATA_WIDTH -1:0]  RFB_data0;
wire[YSYX210458_DATA_WIDTH -1:0]  RFB_data1;
wire[YSYX210458_DATA_WIDTH -1:0]  RFB_data2;
wire[YSYX210458_DATA_WIDTH -1:0]  RFB_rdata;

reg             RFB_op;
reg             RFB_cache;
reg             RFB_rep_way;
reg [YSYX210458_INDEX_W -1 :0]     RFB_index;
reg [YSYX210458_TAG_W -1   :0]     RFB_tag;
reg [YSYX210458_OFFSET_W -1:0]     RFB_offset;
reg [YSYX210458_WSTRB_W  -1:0]     RFB_wstrb;

reg  REF_from_SMB,REF_from_SMB0,REF_from_SMB1,REF_from_SMB2,REF_from_SMB3;
reg rd_req_buf;
wire REF_count_last;
wire RFB_sel_0_4,RFB_sel_1_5,RFB_sel_2_6,RFB_sel_3_7;

////SMB////
wire [YSYX210458_LINE_W -1:0]  SMB_rdata;
////////WAY_D////////

reg [YSYX210458_INDEX_W -1     :0]     WTB_index;
reg [YSYX210458_WSTRB_W -1     :0]     WTB_wstrb;
reg                         WTB_way_num;
wire            way0_dwe_WTB;
wire            way0_dwe_REF;
wire            way0_dwe_FENCE;
wire            way1_dwe_FENCE;
wire            way1_dwe_WTB;
wire            way1_dwe_REF;
wire            way0_dwe;
wire            way1_dwe;
wire  [YSYX210458_INDEX_W -1   :0]     way0_dindex;
wire  [YSYX210458_INDEX_W -1   :0]     way1_dindex;

assign way0_dwe_WTB = WTB_wstrb != 8'h0 && !WTB_way_num;
assign way0_dwe_REF = RQB_op && !RQB_rep_way && REF_cache_last;
assign way0_dwe_FENCE = REP_valid && !RQB_rep_way && RQB_fence;
assign way1_dwe_WTB = WTB_wstrb != 8'h0 && WTB_way_num ;
assign way1_dwe_REF = RQB_op && RQB_rep_way && REF_cache_last;
assign way1_dwe_FENCE = REP_valid && RQB_rep_way && RQB_fence;

assign way0_dwe     = way0_dwe_REF || way0_dwe_WTB;
assign way1_dwe     = way1_dwe_REF || way1_dwe_WTB;
assign way0_dindex = way0_dwe_WTB ? WTB_index : RQB_index;
assign way1_dindex = way1_dwe_WTB ? WTB_index : RQB_index;

////////TAGV_RAM////////
wire [YSYX210458_INDEX_W -1    :0]     tagv0_index,tagv1_index;
wire [TAGV_W -1     :0]     tagv0_wdata;
wire [TAGV_W -1     :0]     tagv0_rdata;
wire            tagv0_we;

wire [TAGV_W -1     :0]     tagv1_wdata;
wire [TAGV_W -1     :0]     tagv1_rdata;
wire            tagv1_we;
////Dirty////
reg [DEPTH -1       :0]     way0_table_d;
reg [DEPTH -1       :0]     way1_table_d;

//way0_d;
always @(posedge clk) begin
    if (reset) begin
        way0_table_d <= {DEPTH{1'b0}};
    end
    else if (way0_dwe_WTB ) begin
        way0_table_d[WTB_index] <= 1'b1;
    end
    else if ( way0_dwe_REF) begin
        way0_table_d[RQB_index] <= 1'b1;
    end
    else if (way0_dwe_FENCE) begin
        way0_table_d[way0_fence_index] <= 1'b0;
    end
    
end
//way1_d;
always @(posedge clk) begin
    if (reset) begin
        way1_table_d <= {DEPTH{1'b0}};
    end
    else if ( way1_dwe_WTB ) begin
        way1_table_d[WTB_index] <= 1'b1;
    end
    else if ( way1_dwe_REF) begin
        way1_table_d[RQB_index] <= 1'b1;
    end
    else if (way1_dwe_FENCE) begin
        way1_table_d[way1_fence_index] <= 1'b0;
    end
end

////TAGV////
integer  i,j;
reg [TAGV_W -1      :0]     way0_tagv_table[DEPTH -1:0];
reg [TAGV_W -1      :0]     way1_tagv_table[DEPTH -1:0];
wire    [DEPTH -1:0] way0_table_v;
wire    [DEPTH -1:0] way1_table_v;
genvar x;
generate for ( x =0;x<DEPTH;x=x+1) begin : gen_v_table
    assign way0_table_v[x] = way0_tagv_table[x][0];
    assign way1_table_v[x] = way1_tagv_table[x][0];
end endgenerate
always @(posedge clk) begin
    if ( reset || fence_valid && IS_ICACHE ) begin
        for(i = 0;i<DEPTH;i = i+1 )
         way0_tagv_table[i]  <= {TAGV_W{1'b0}};
    end
    else if ( tagv0_we) begin
        way0_tagv_table[tagv0_index] <= tagv0_wdata;
    end

    ////
    if ( reset || fence_valid && IS_ICACHE) begin
        for(j = 0;j<DEPTH; j= j+1 )
         way1_tagv_table[j]  <= {TAGV_W{1'b0}};
    end
    else if ( tagv1_we) begin
        way1_tagv_table[tagv1_index] <= tagv1_wdata;
    end
    
end

////////DATA_BANK_RAM////////
wire [YSYX210458_DATA_WIDTH -1:0]     bank_wdata_0;
wire [YSYX210458_DATA_WIDTH -1:0]     bank_wdata_1;
wire [YSYX210458_DATA_WIDTH -1:0]     bank_wdata_2;
wire [YSYX210458_DATA_WIDTH -1:0]     bank_wdata_3;
wire [YSYX210458_DATA_WIDTH -1:0]     bank_wdata_4;
wire [YSYX210458_DATA_WIDTH -1:0]     bank_wdata_5;
wire [YSYX210458_DATA_WIDTH -1:0]     bank_wdata_6;
wire [YSYX210458_DATA_WIDTH -1:0]     bank_wdata_7;

wire [SRAM_WIDTH -1:0]     bank_rdata_0;
wire [SRAM_WIDTH -1:0]     bank_rdata_1;
wire [SRAM_WIDTH -1:0]     bank_rdata_2;
wire [SRAM_WIDTH -1:0]     bank_rdata_3;
wire [YSYX210458_WSTRB_W -1:0]      bank_wstrb_0;
wire [YSYX210458_WSTRB_W -1:0]      bank_wstrb_1;
wire [YSYX210458_WSTRB_W -1:0]      bank_wstrb_2;
wire [YSYX210458_WSTRB_W -1:0]      bank_wstrb_3;
wire [YSYX210458_WSTRB_W -1:0]      bank_wstrb_4;
wire [YSYX210458_WSTRB_W -1:0]      bank_wstrb_5;
wire [YSYX210458_WSTRB_W -1:0]      bank_wstrb_6;
wire [YSYX210458_WSTRB_W -1:0]      bank_wstrb_7;

wire [YSYX210458_INDEX_W -1:0]     bank_index_0;
wire [YSYX210458_INDEX_W -1:0]     bank_index_1;
wire [YSYX210458_INDEX_W -1:0]     bank_index_2;
wire [YSYX210458_INDEX_W -1:0]     bank_index_3;

ysyx_210458_cache_data_SRAM data_bank_0(
    .clk        (clk),
    .wstrb_hi   (bank_wstrb_1),
    .wstrb_lo   (bank_wstrb_0),
    .we         (bank_wstrb_0 != 8'h0 || bank_wstrb_1 != 8'h0),
    .addr       (bank_index_0),
    .wdata_hi   (bank_wdata_1),
    .wdata_lo   (bank_wdata_0),
    .rdata      (bank_rdata_0)

);
ysyx_210458_cache_data_SRAM data_bank_1(
    .clk        (clk),
    .wstrb_hi   (bank_wstrb_3),
    .wstrb_lo   (bank_wstrb_2),
    .we         (bank_wstrb_3 != 8'h0 || bank_wstrb_2 != 8'h0),
    .addr       (bank_index_1),
    .wdata_hi   (bank_wdata_3),
    .wdata_lo   (bank_wdata_2),
    .rdata      (bank_rdata_1)

);
ysyx_210458_cache_data_SRAM data_bank_2(
    .clk        (clk),
    .wstrb_hi   (bank_wstrb_5),
    .wstrb_lo   (bank_wstrb_4),
    .we         (bank_wstrb_5 != 8'h0 || bank_wstrb_4 != 8'h0),
    .addr       (bank_index_2),
    .wdata_hi   (bank_wdata_5),
    .wdata_lo   (bank_wdata_4),
    .rdata      (bank_rdata_2)

);
ysyx_210458_cache_data_SRAM data_bank_3(
    .clk        (clk),
    .wstrb_hi   (bank_wstrb_7),
    .wstrb_lo   (bank_wstrb_6),
    .we         (bank_wstrb_7 != 8'h0 || bank_wstrb_6 != 8'h0),
    .addr       (bank_index_3),
    .wdata_hi   (bank_wdata_7),
    .wdata_lo   (bank_wdata_6),
    .rdata      (bank_rdata_3)

);

////////////LOOK UP////////////
//RQB=>Request Buffer
///////////////////////////
//lsfr 随机数生成模块    ///
wire [2:0] lsfr_out;    ///
                        ///
ysyx_210458_lsfr u_lsfr (          ////
    .clk    (clk),    /////
    .reset (reset), /////
    .dout   (lsfr_out) ////
);                     ///
//////////////////////////
wire  RQB_we ;
assign RQB_we    = addr_ok ;

always @(posedge clk) begin
    if(reset ) begin
        RQB_wstrb   <= 8'b0;
        RQB_op      <= 1'b0;
        RQB_cache   <= 1'b0;
        RQB_op      <= 1'b0;
        RQB_index   <= {YSYX210458_INDEX_W{1'b0}};
        RQB_tag     <= {YSYX210458_TAG_W{1'b0}};
        RQB_offset  <= {YSYX210458_OFFSET_W{1'b0}};
        
    end
    //可能这里需要修改
    else if (RQB_we)begin
        RQB_cache   <= !uncache;
        RQB_op      <= op;
        RQB_size    <= size;
        RQB_index   <= index;
        RQB_tag     <= tag;
        RQB_offset  <= offset;
        RQB_wstrb   <= wstrb;
        RQB_wdata   <= wdata;
        RQB_addr    <= uncache  ? {tag,index,offset}: {tag,index,5'b0};
        
        //RQB_addr    <= {tag,index,offset};
    end
    // if (RQB_we)begin
        // RQB_cache   <= !uncache;
        // RQB_op      <= op;
        // RQB_size    <= size;
        // RQB_index   <= index;
        // RQB_tag     <= tag;
        // RQB_offset  <= offset;
        // RQB_wstrb   <= wstrb;
        // RQB_wdata   <= wdata;
        // RQB_rep_way <= lsfr_out[0];
        // RQB_addr    <= uncache  ? {tag,index,offset}: {tag,index,5'b0};
        // 
        // RQB_addr    <= {tag,index,offset};
    // end
    // 可能这里需要修改
    // else if(reset || IDLE || ( RAW_haza || !valid) && !MISS_valid && !REP_valid && !REF_valid && !LKUP_valid || REF_valid && REF_last && ( RAW_haza || !valid) ) begin
        // RQB_wstrb   <= 8'b0;
        // RQB_op      <= 1'b0;
        // RQB_cache   <= 1'b0;
        // 
    // end
    if (LKUP_valid && !cache_hit ) begin
        RFB_cache   <= RQB_cache  ;
        RFB_op      <= RQB_op     ;
        RFB_index   <= RQB_index  ;
        RFB_tag     <= RQB_tag    ;
        RFB_offset  <= RQB_offset ;
        RFB_wstrb   <= RQB_wstrb  ;
        RFB_rep_way <= RQB_rep_way;
    end
    else if (REF_valid && REF_last || reset ) begin
        RFB_wstrb   <= 8'b0;
        RFB_op      <= 1'b0;
        RFB_cache   <= 1'b0;
    end
    ////RQB_FENCE////////
    // if (reset || REP_to_IDLE) begin
    //     RQB_fence   <= 1'b0;
    // end
    // else if (RQB_we && !IS_ICACHE ) begin
    //     RQB_fence  <= fence_valid;
    // end
    ////RQB_FENCE////////
    if (reset || REP_to_IDLE) begin
        RQB_fence   <= 1'b0;
    end
    // else if (RQB_we && !IS_ICACHE && !RQB_fence) begin//&& !RQB_fence
    //     RQB_fence  <= fence_valid;
    // end
    else if (RQB_we ) begin//&& !RQB_fence
        RQB_fence  <= IS_ICACHE ? 1'b0 : fence_valid || RQB_fence ;
    end

    if (reset || RQB_we && !RQB_fence) begin
        RQB_rep_way <= lsfr_out[0];
    end
    else if ( RQB_rep_way && way1_clear && REP_valid && RQB_fence  ) begin
        RQB_rep_way <= 1'b0;
    end
    else if ( !RQB_rep_way && way0_clear && REP_valid && RQB_fence ) begin
        RQB_rep_way <= 1'b1;
    end
    
    //需要在某些时候将写使能置零
end
////因为tagv是LUT所以是不会延时///

assign tagv0_index      = RQB_fence ? way0_fence_index : RQB_index;
assign tagv1_index      = RQB_fence ? way1_fence_index : RQB_index;
assign tagv0_rdata      = way0_tagv_table[tagv0_index];
assign tagv1_rdata      = way1_tagv_table[tagv1_index];
assign way0_tag         = way0_tagv_table[tagv0_index][TAGV_W -1 :1];
assign way1_tag         = way1_tagv_table[tagv1_index][TAGV_W -1 :1];
assign way0_v           = way0_tagv_table[tagv0_index][0];
assign way1_v           = way1_tagv_table[tagv1_index][0];
assign way0_d           = way0_table_d[tagv0_index];
assign way1_d           = way1_table_d[tagv1_index];
assign bank_sel_0_4     = RQB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h0;
assign bank_sel_1_5     = RQB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h1;
assign bank_sel_2_6     = RQB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h2;
assign bank_sel_3_7     = RQB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h3;

assign RFB_sel_0_4     = RFB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h0;
assign RFB_sel_1_5     = RFB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h1;
assign RFB_sel_2_6     = RFB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h2;
assign RFB_sel_3_7     = RFB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h3;

assign way0_hit         = way0_v && (way0_tag == RQB_tag);
assign way1_hit         = way1_v && (way1_tag == RQB_tag);

assign cache_hit        = (way0_hit || way1_hit) && RQB_cache;
//bank_index需要仔细考虑考虑
//ret_last可能会改变，先标记一下
wire   bank0_we;
wire   bank1_we;
wire   bank2_we;
wire   bank3_we;

assign bank0_we         = bank_wstrb_0 != 8'h0 || bank_wstrb_1 != 8'h0;
assign bank1_we         = bank_wstrb_2 != 8'h0 || bank_wstrb_3 != 8'h0;
assign bank2_we         = bank_wstrb_4 != 8'h0 || bank_wstrb_5 != 8'h0;
assign bank3_we         = bank_wstrb_6 != 8'h0 || bank_wstrb_7 != 8'h0;

assign bank_index_0     = RQB_fence ? way0_fence_index : bank0_we && !REF_valid ? WTB_index:REF_cache_last && !RQB_rep_way   && REF_valid || MISS_valid || LKUP_to_MISS ? RQB_index: index;
assign bank_index_1     = RQB_fence ? way0_fence_index : bank1_we && !REF_valid ? WTB_index:REF_cache_last && !RQB_rep_way   && REF_valid || MISS_valid || LKUP_to_MISS ? RQB_index: index;
assign bank_index_2     = RQB_fence ? way1_fence_index : bank2_we && !REF_valid ? WTB_index:REF_cache_last &&  RQB_rep_way   && REF_valid || MISS_valid || LKUP_to_MISS ? RQB_index: index;
assign bank_index_3     = RQB_fence ? way1_fence_index : bank3_we && !REF_valid ? WTB_index:REF_cache_last &&  RQB_rep_way   && REF_valid || MISS_valid || LKUP_to_MISS ? RQB_index: index;

//rdata需要仔细考虑一下。因为SRAM一次读出来的是128位
wire    cached_read_hit,write_ok,cached_axi_back,uncached_axi_back,cached_SMB_hit,fence_ok;
reg [YSYX210458_DATA_WIDTH -1:0] way0_rdata_buf;
reg [YSYX210458_DATA_WIDTH -1:0] way1_rdata_buf;
reg [YSYX210458_DATA_WIDTH -1:0] RFB_rdata_buf;
reg  cache_hit_buf;


always @(posedge clk ) begin
    // if (cache_hit) begin
    //     way0_rdata_buf <= way0_rdata;
    //     way1_rdata_buf <= way1_rdata;
        
    // end
    if (reset) begin
        way0_rdata_buf <= {YSYX210458_DATA_WIDTH{1'b0}};
        way1_rdata_buf <= {YSYX210458_DATA_WIDTH{1'b0}};
        RFB_rdata_buf  <= {YSYX210458_DATA_WIDTH{1'b0}};
    end
    else  if (cache_hit) begin
        way0_rdata_buf <= way0_rdata;
        way1_rdata_buf <= way1_rdata;  
    end

    if (reset) begin
        RFB_rdata_buf  <= {YSYX210458_DATA_WIDTH{1'b0}};
    end
    else  if (cached_axi_back || uncached_axi_back || cached_SMB_hit) begin
        RFB_rdata_buf <= RFB_rdata;  
    end

    if (reset) begin
        cache_hit_buf <= 1'b0;
    end
    else begin
       cache_hit_buf <= cached_read_hit;
    end

    
end

assign way0_rdata       = ({YSYX210458_DATA_WIDTH{way0_hit & bank_sel_0_4}} & bank_rdata_0[YSYX210458_DATA_WIDTH -1:0])
                        | ({YSYX210458_DATA_WIDTH{way0_hit & bank_sel_1_5}} & bank_rdata_0[SRAM_WIDTH - 1 :SRAM_WIDTH -YSYX210458_DATA_WIDTH])
                        | ({YSYX210458_DATA_WIDTH{way0_hit & bank_sel_2_6}} & bank_rdata_1[YSYX210458_DATA_WIDTH -1:0])
                        | ({YSYX210458_DATA_WIDTH{way0_hit & bank_sel_3_7}} & bank_rdata_1[SRAM_WIDTH - 1 :SRAM_WIDTH -YSYX210458_DATA_WIDTH]);

assign way1_rdata       = ({YSYX210458_DATA_WIDTH{way1_hit & bank_sel_0_4}} & bank_rdata_2[YSYX210458_DATA_WIDTH -1:0])
                        | ({YSYX210458_DATA_WIDTH{way1_hit & bank_sel_1_5}} & bank_rdata_2[SRAM_WIDTH - 1 :SRAM_WIDTH -YSYX210458_DATA_WIDTH])
                        | ({YSYX210458_DATA_WIDTH{way1_hit & bank_sel_2_6}} & bank_rdata_3[YSYX210458_DATA_WIDTH -1:0])
                        | ({YSYX210458_DATA_WIDTH{way1_hit & bank_sel_3_7}} & bank_rdata_3[SRAM_WIDTH - 1 :SRAM_WIDTH -YSYX210458_DATA_WIDTH]);

assign cache_rdata      = way0_rdata_buf | way1_rdata_buf | RFB_rdata;
// assign rdata            = LKUP_valid && cache_hit && !MISS_valid && !REP_valid && !REF_valid ? way0_rdata_buf | way1_rdata_buf : RFB_rdata;//这里应该存在问题

reg hit_buf;
// assign rdata            = hit_buf && !MISS_valid && !REP_valid && !REF_valid ? way0_rdata_buf | way1_rdata_buf : RFB_rdata;//这里应该存在问题
assign rdata            = cache_hit_buf && !MISS_valid && !REP_valid && !REF_valid ? way0_rdata_buf | way1_rdata_buf : RFB_rdata_buf;
// assign inst             = inst_sel_hi ? rdata[YSYX210458_DATA_WIDTH -1: 32] : rdata[`YSYX210458_INST_W -1:0];
assign inst             = sel_hi ? rdata[YSYX210458_DATA_WIDTH -1: 32] : rdata[`YSYX210458_INST_W -1:0];

//
//////////////HIT WRITE////////////
//WTB=>Write BUffer
// reg [7:0]       WTB_index;
// reg [3:0]       WTB_wstrb;
// reg             WTB_way_num;
//WTB_wstrb 需要根据offset确定到底是哪个双字？
//所以还是需要仔细考虑一下的
reg [YSYX210458_OFFSET_W -1    :0]       WTB_offset;
reg [YSYX210458_DATA_WIDTH -1  :0]      WTB_wdata;
wire            WTB_we;
wire            bankw_sel_0_4;
wire            bankw_sel_1_5;
wire            bankw_sel_2_6;
wire            bankw_sel_3_7;
assign  WTB_we  = LKUP_valid && cache_hit && RQB_op && RQB_cache ;
always @( posedge clk) begin //这里存在问题
    if ( reset ||  (REF_valid && !REF_last) ) begin
        WTB_wstrb   <= 8'h0;
    end
    else if (WTB_we)begin
        WTB_index   <= RQB_index;
        WTB_way_num <= way0_hit ? 1'b0 : 1'b1;
        WTB_offset  <= RQB_offset;
        WTB_wstrb   <= RQB_wstrb;
        WTB_wdata   <= RQB_wdata;
    end
    else if ( WTB_wstrb != 8'h0 && !(MISS_valid || LKUP_to_MISS)) begin
        WTB_wstrb  <= 8'b0;
    end
end

assign bankw_sel_0_4    = WTB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h0;
assign bankw_sel_1_5    = WTB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h1;
assign bankw_sel_2_6    = WTB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h2;
assign bankw_sel_3_7    = WTB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == 2'h3;

//前半部分用于WTB写入数据，后半部分用于REFILL填入一个Cache行的数据
//应为SRAM宽度的问题，这里还需要仔细考虑一下
assign bank_wstrb_0     = ({8{bankw_sel_0_4 & !WTB_way_num }}& WTB_wstrb) | ({8{  REF_cache_last & !RQB_rep_way }}  );
assign bank_wstrb_1     = ({8{bankw_sel_1_5 & !WTB_way_num }}& WTB_wstrb) | ({8{  REF_cache_last & !RQB_rep_way }}  );
assign bank_wstrb_2     = ({8{bankw_sel_2_6 & !WTB_way_num }}& WTB_wstrb) | ({8{  REF_cache_last & !RQB_rep_way }}  );
assign bank_wstrb_3     = ({8{bankw_sel_3_7 & !WTB_way_num }}& WTB_wstrb) | ({8{  REF_cache_last & !RQB_rep_way }}  );
assign bank_wstrb_4     = ({8{bankw_sel_0_4 &  WTB_way_num }}& WTB_wstrb) | ({8{  REF_cache_last &  RQB_rep_way }}  );
assign bank_wstrb_5     = ({8{bankw_sel_1_5 &  WTB_way_num }}& WTB_wstrb) | ({8{  REF_cache_last &  RQB_rep_way }}  );
assign bank_wstrb_6     = ({8{bankw_sel_2_6 &  WTB_way_num }}& WTB_wstrb) | ({8{  REF_cache_last &  RQB_rep_way }}  );
assign bank_wstrb_7     = ({8{bankw_sel_3_7 &  WTB_way_num }}& WTB_wstrb) | ({8{  REF_cache_last &  RQB_rep_way }}  );

//ret_last这个条件需要改一下
//因为预取的时候可能会超过4个传输长度
//如果是REF_from_STREAMER buffer的话一拍就可以写进去了
//也不需要啥了
wire [YSYX210458_DATA_WIDTH -1:0] SMB_wdata0 ,SMB_wdata1 ,SMB_wdata2 ,SMB_wdata3 ;

assign bank_wdata_0     = REF_from_SMB ? SMB_wdata0 :REF_cache_last  && !RQB_rep_way? RFB_data0_buf :WTB_wdata;
assign bank_wdata_1     = REF_from_SMB ? SMB_wdata1 :REF_cache_last  && !RQB_rep_way? RFB_data1_buf :WTB_wdata;
assign bank_wdata_2     = REF_from_SMB ? SMB_wdata2 :REF_cache_last  && !RQB_rep_way? RFB_data2_buf :WTB_wdata;
assign bank_wdata_3     = REF_from_SMB ? SMB_wdata3 :REF_cache_last  && !RQB_rep_way? RFB_data3     :WTB_wdata;
assign bank_wdata_4     = REF_from_SMB ? SMB_wdata0 :REF_cache_last  &&  RQB_rep_way? RFB_data0_buf :WTB_wdata;
assign bank_wdata_5     = REF_from_SMB ? SMB_wdata1 :REF_cache_last  &&  RQB_rep_way? RFB_data1_buf :WTB_wdata;
assign bank_wdata_6     = REF_from_SMB ? SMB_wdata2 :REF_cache_last  &&  RQB_rep_way? RFB_data2_buf :WTB_wdata;
assign bank_wdata_7     = REF_from_SMB ? SMB_wdata3 :REF_cache_last  &&  RQB_rep_way? RFB_data3     :WTB_wdata;



assign SMB_wdata0[07:00] = RFB_we0 && bank_sel_0_4 ? RQB_wdata[07:00] : SMB_rdata[007:000];
assign SMB_wdata0[15:08] = RFB_we1 && bank_sel_0_4 ? RQB_wdata[15:08] : SMB_rdata[015:008];
assign SMB_wdata0[23:16] = RFB_we2 && bank_sel_0_4 ? RQB_wdata[23:16] : SMB_rdata[023:016];
assign SMB_wdata0[31:24] = RFB_we3 && bank_sel_0_4 ? RQB_wdata[31:24] : SMB_rdata[031:024];
assign SMB_wdata0[39:32] = RFB_we4 && bank_sel_0_4 ? RQB_wdata[39:32] : SMB_rdata[039:032];
assign SMB_wdata0[47:40] = RFB_we5 && bank_sel_0_4 ? RQB_wdata[47:40] : SMB_rdata[047:040];
assign SMB_wdata0[55:48] = RFB_we6 && bank_sel_0_4 ? RQB_wdata[55:48] : SMB_rdata[055:048];
assign SMB_wdata0[63:56] = RFB_we7 && bank_sel_0_4 ? RQB_wdata[63:56] : SMB_rdata[063:056];
assign SMB_wdata1[07:00] = RFB_we0 && bank_sel_1_5 ? RQB_wdata[07:00] : SMB_rdata[071:064];
assign SMB_wdata1[15:08] = RFB_we1 && bank_sel_1_5 ? RQB_wdata[15:08] : SMB_rdata[079:072];
assign SMB_wdata1[23:16] = RFB_we2 && bank_sel_1_5 ? RQB_wdata[23:16] : SMB_rdata[087:080];
assign SMB_wdata1[31:24] = RFB_we3 && bank_sel_1_5 ? RQB_wdata[31:24] : SMB_rdata[095:088];
assign SMB_wdata1[39:32] = RFB_we4 && bank_sel_1_5 ? RQB_wdata[39:32] : SMB_rdata[103:096];
assign SMB_wdata1[47:40] = RFB_we5 && bank_sel_1_5 ? RQB_wdata[47:40] : SMB_rdata[111:104];
assign SMB_wdata1[55:48] = RFB_we6 && bank_sel_1_5 ? RQB_wdata[55:48] : SMB_rdata[119:112];
assign SMB_wdata1[63:56] = RFB_we7 && bank_sel_1_5 ? RQB_wdata[63:56] : SMB_rdata[127:120];
assign SMB_wdata2[07:00] = RFB_we0 && bank_sel_2_6 ? RQB_wdata[07:00] : SMB_rdata[135:128];
assign SMB_wdata2[15:08] = RFB_we1 && bank_sel_2_6 ? RQB_wdata[15:08] : SMB_rdata[143:136];
assign SMB_wdata2[23:16] = RFB_we2 && bank_sel_2_6 ? RQB_wdata[23:16] : SMB_rdata[151:144];
assign SMB_wdata2[31:24] = RFB_we3 && bank_sel_2_6 ? RQB_wdata[31:24] : SMB_rdata[159:152];
assign SMB_wdata2[39:32] = RFB_we4 && bank_sel_2_6 ? RQB_wdata[39:32] : SMB_rdata[167:160];
assign SMB_wdata2[47:40] = RFB_we5 && bank_sel_2_6 ? RQB_wdata[47:40] : SMB_rdata[175:168];
assign SMB_wdata2[55:48] = RFB_we6 && bank_sel_2_6 ? RQB_wdata[55:48] : SMB_rdata[183:176];
assign SMB_wdata2[63:56] = RFB_we7 && bank_sel_2_6 ? RQB_wdata[63:56] : SMB_rdata[191:184];
assign SMB_wdata3[07:00] = RFB_we0 && bank_sel_3_7 ? RQB_wdata[07:00] : SMB_rdata[199:192];
assign SMB_wdata3[15:08] = RFB_we1 && bank_sel_3_7 ? RQB_wdata[15:08] : SMB_rdata[207:200];
assign SMB_wdata3[23:16] = RFB_we2 && bank_sel_3_7 ? RQB_wdata[23:16] : SMB_rdata[215:208];
assign SMB_wdata3[31:24] = RFB_we3 && bank_sel_3_7 ? RQB_wdata[31:24] : SMB_rdata[223:216];
assign SMB_wdata3[39:32] = RFB_we4 && bank_sel_3_7 ? RQB_wdata[39:32] : SMB_rdata[231:224];
assign SMB_wdata3[47:40] = RFB_we5 && bank_sel_3_7 ? RQB_wdata[47:40] : SMB_rdata[239:232];
assign SMB_wdata3[55:48] = RFB_we6 && bank_sel_3_7 ? RQB_wdata[55:48] : SMB_rdata[247:240];
assign SMB_wdata3[63:56] = RFB_we7 && bank_sel_3_7 ? RQB_wdata[63:56] : SMB_rdata[255:248];


//bank_index

//
localparam SMB_TAGI = YSYX210458_ADDR_WIDTH -YSYX210458_OFFSET_W ;
reg [SMB_TAGI -1:0] SMB_tagi;
reg [YSYX210458_LINE_W -1 :0] SMB_DATA[3:0];
reg [SMB_TAGI -1 :0] SMB_tag_index[3:0];
////////////CACHE MISS//////////
reg [YSYX210458_ADDR_WIDTH -1  :0]  MSB_addr;
reg         MSB_V;
reg         MSB_D;
reg [1:0]   MSB_count;
reg         wr_req_buf;

reg  [YSYX210458_LINE_W -1     :0]    MSB_wr_data;
wire [YSYX210458_LINE_W -1     :0]    wr_data_0;
wire [YSYX210458_LINE_W -1     :0]    wr_data_1;

assign wr_data_0 = {bank_rdata_1,bank_rdata_0};
assign wr_data_1 = {bank_rdata_3,bank_rdata_2};
////MSB_的东西需要仔细斟酌
always @(posedge clk) begin
    if (MISS_valid ) begin
       MSB_wr_data  <= !RQB_cache  ? {192'b0, RQB_wdata} :RQB_rep_way ? wr_data_1 : wr_data_0;
       MSB_D        <= !RQB_cache  ? 1'b1  : RQB_rep_way  ? way1_d    : way0_d;
       MSB_V        <= !RQB_cache  ? 1'b1  : RQB_rep_way  ? tagv1_rdata[0] : tagv0_rdata[0];
       MSB_addr     <= !RQB_cache  ? RQB_addr :  
                        RQB_fence  && RQB_rep_way ? {tagv1_rdata[TAGV_W -1:1],way1_fence_index,5'b0} : 
                        RQB_fence  && !RQB_rep_way? {tagv0_rdata[TAGV_W -1:1],way0_fence_index,5'b0} :
                        RQB_rep_way ? {tagv1_rdata[TAGV_W -1:1],RQB_index,5'b0} : {tagv0_rdata[TAGV_W -1:1],RQB_index,5'b0};
    end
    else if (REF_valid && REF_last) begin
        MSB_D <= 1'b0;
        MSB_V <= 1'b0;
    end

    if (reset ||  wr_req_buf && wr_rdy || REP_valid || REF_valid || MISS_valid && !SMB_wdone ) begin
        wr_req_buf <= 1'b0;
    end
    else if (MISS_valid && wr_rdy && (way1_d && tagv1_rdata[0] && RQB_rep_way || way0_d && tagv0_rdata[0] && !RQB_rep_way) && RQB_cache 
          || MISS_valid && wr_rdy && !RQB_cache && RQB_op  ) begin
        wr_req_buf <= 1'b1;
    end
end
///////////////////////////////////////
wire  miss_SMB_hit0;
wire  miss_SMB_hit1;
wire  miss_SMB_hit2;
wire  miss_SMB_hit3;


assign miss_SMB_hit0 =  way1_tag == SMB_tag_index[0][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[0][YSYX210458_INDEX_W -1:0]== RQB_index && RQB_rep_way || way0_tag == SMB_tag_index[0][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[0][YSYX210458_INDEX_W -1:0]== RQB_index && !RQB_rep_way;
assign miss_SMB_hit1 =  way1_tag == SMB_tag_index[1][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[1][YSYX210458_INDEX_W -1:0]== RQB_index && RQB_rep_way || way0_tag == SMB_tag_index[1][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[1][YSYX210458_INDEX_W -1:0]== RQB_index && !RQB_rep_way;
assign miss_SMB_hit2 =  way1_tag == SMB_tag_index[2][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[2][YSYX210458_INDEX_W -1:0]== RQB_index && RQB_rep_way || way0_tag == SMB_tag_index[2][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[2][YSYX210458_INDEX_W -1:0]== RQB_index && !RQB_rep_way;
assign miss_SMB_hit3 =  way1_tag == SMB_tag_index[3][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[3][YSYX210458_INDEX_W -1:0]== RQB_index && RQB_rep_way || way0_tag == SMB_tag_index[3][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[3][YSYX210458_INDEX_W -1:0]== RQB_index && !RQB_rep_way;
//////////////REPLACE////////////

//replace 于 REFILL 也需要仔细斟酌，因为加上了替换buffer，如果需要替换那就直接放到替换buffer里面
//还加了指令/数据预取的 stream buffer refill的行为也可能发生了变化
assign wr_req   =   wr_req_buf;
assign wr_type  =   !RQB_cache ? RQB_size :3'h4;
assign wr_addr  =   MSB_addr;
assign wr_data  =   MSB_wr_data;
assign wr_wstrb =   !RQB_cache && RQB_op ? RQB_wstrb : {YSYX210458_WSTRB_W{MSB_D & MSB_V & wr_req_buf}};
////////STREAMER_BUFFER////////////
////SMB////
reg [2:0] SMB_count;
reg [3:0] SMB_V;
//用来表示是不是当前请求是不是包含预取
//预不预主要看的是rd_type
//计数器主要是用于将stream的data部分一次更新干净


reg       will_SMB;
// wire        SMB_wdone;
wire        SMB_buf_hit;
reg [YSYX210458_DATA_WIDTH -1:0] SMB_rdata0;
reg [YSYX210458_DATA_WIDTH -1:0] SMB_rdata1;
reg [YSYX210458_DATA_WIDTH -1:0] SMB_rdata2;
wire [YSYX210458_DATA_WIDTH -1:0] SMB_rdata3;




wire    SMB_we0;
wire    SMB_we1;
wire    SMB_we2;
wire    SMB_DATA_we;
wire [1:0]   SMB_rep;


wire    SMB_hit0;
wire    SMB_hit1;
wire    SMB_hit2;
wire    SMB_hit3;
wire    SMB_hit;

assign SMB_hit  = SMB_hit0 || SMB_hit1 || SMB_hit2 || SMB_hit3;
assign SMB_hit0 = RQB_tag == SMB_tag_index[0][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[0][YSYX210458_INDEX_W -1:0]== RQB_index && SMB_V[0];
assign SMB_hit1 = RQB_tag == SMB_tag_index[1][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[1][YSYX210458_INDEX_W -1:0]== RQB_index && SMB_V[1];
assign SMB_hit2 = RQB_tag == SMB_tag_index[2][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[2][YSYX210458_INDEX_W -1:0]== RQB_index && SMB_V[2];
assign SMB_hit3 = RQB_tag == SMB_tag_index[3][SMB_TAGI -1 :YSYX210458_INDEX_W] && SMB_tag_index[3][YSYX210458_INDEX_W -1:0]== RQB_index && SMB_V[3];

assign SMB_rdata = ({YSYX210458_LINE_W{REF_from_SMB0}}   & SMB_DATA[0] )
                 | ({YSYX210458_LINE_W{REF_from_SMB1}}   & SMB_DATA[1] )
                 | ({YSYX210458_LINE_W{REF_from_SMB2}}   & SMB_DATA[2] )
                 | ({YSYX210458_LINE_W{REF_from_SMB3}}   & SMB_DATA[3] );
wire [3:0] SMB_rep_d;

//////解决冲突
ysyx_210458_decoder_2_4 u_dec2_4 (.in (lsfr_out[1:0]), .out (SMB_rep_d));
assign SMB_rep = (SMB_rep_d & {SMB_hit3,SMB_hit2,SMB_hit1,SMB_hit0}) != 4'h0 ? lsfr_out[1:0] + 2'b01 : lsfr_out[1:0]  ;

assign SMB_we0 = SMB_count == 3'h4 && ret_valid;
assign SMB_we1 = SMB_count == 3'h5 && ret_valid;
assign SMB_we2 = SMB_count == 3'h6 && ret_valid;

assign SMB_DATA_we = SMB_count == 3'h7 && ret_valid;
assign SMB_rdata3 = ret_data;
assign SMB_wdone  = SMB_count == 3'h0;
assign SMB_buf_hit = !SMB_wdone && RQB_tag == SMB_tagi[SMB_TAGI -1 :YSYX210458_INDEX_W] && RQB_index == SMB_tagi[YSYX210458_INDEX_W -1: 0];
/////
always @(posedge clk) begin
    if (reset ) begin
    SMB_tagi <= {SMB_TAGI{1'b0}};
end 
else if (RQB_cache && rd_req && REF_valid) begin
    SMB_tagi <= {RQB_tag,RQB_index} + 27'h1; 
end

    if (reset) begin
        SMB_tag_index[0] <= {SMB_TAGI{1'b0}};
        SMB_tag_index[1] <= {SMB_TAGI{1'b0}};
        SMB_tag_index[2] <= {SMB_TAGI{1'b0}};
        SMB_tag_index[3] <= {SMB_TAGI{1'b0}};
    end
    
    // else if (miss_SMB_hit0 && MISS_valid && !IS_ICACHE && RQB_cache) begin//|| miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3
    //     SMB_tag_index[0] <= RQB_rep_way ? {way1_tag,RQB_index} : {way0_tag,RQB_index};
    // end
    // else if (miss_SMB_hit1 && MISS_valid && !IS_ICACHE&& RQB_cache) begin//|| miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3
    //     SMB_tag_index[1] <= RQB_rep_way ? {way1_tag,RQB_index} : {way0_tag,RQB_index};
    // end
    // else if (miss_SMB_hit2 && MISS_valid && !IS_ICACHE && RQB_cache) begin//|| miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3
    //     SMB_tag_index[2] <= RQB_rep_way ? {way1_tag,RQB_index} : {way0_tag,RQB_index};
    // end
    // else if (miss_SMB_hit3 && MISS_valid && !IS_ICACHE && RQB_cache) begin//|| miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3
    //     SMB_tag_index[3] <= RQB_rep_way ? {way1_tag,RQB_index} : {way0_tag,RQB_index};
    // end
    `ifdef YSYX210458_ENAENABLE_NIVIC
    else if (MISS_valid && !IS_ICACHE && RQB_cache && !miss_SMB_hit0 && !miss_SMB_hit1 && !miss_SMB_hit2 && !miss_SMB_hit3 && SMB_wdone) begin
        SMB_tag_index[SMB_rep] <= RQB_rep_way ? {way1_tag,RQB_index} : {way0_tag,RQB_index};
    end
    `endif
    `ifdef YSYX210458_ENAENABLE_IVIC
    else if (MISS_valid && RQB_cache && !miss_SMB_hit0 && !miss_SMB_hit1 && !miss_SMB_hit2 && !miss_SMB_hit3 && SMB_wdone) begin
        SMB_tag_index[SMB_rep] <= RQB_rep_way ? {way1_tag,RQB_index} : {way0_tag,RQB_index};
    end
    `endif

    else  if (SMB_DATA_we ) begin
        SMB_tag_index[SMB_rep] <= SMB_tagi;
    end
end


always @( posedge clk) begin
    if (reset || SMB_count == 3'h7 && ret_valid) begin
        SMB_count <= 3'h0;
    end
    else if (ret_valid && will_SMB) begin
        SMB_count <= SMB_count + 1'b1;
    end
    
    if (reset) begin
        will_SMB <= 1'b0;
    end
    
    else if (SMB_count == 3'h7 && ret_valid  ) begin
        will_SMB <= 1'b0;
    end
    else if (rd_req && rd_type == 3'h7) begin
        will_SMB <= 1'b1;
    end

    ////SMB_DATA////
    
    // else if (miss_SMB_hit0 && MISS_valid && !IS_ICACHE && RQB_cache) begin//
    //     SMB_DATA[0] <= RQB_rep_way ? wr_data_1 : wr_data_0;
    // end
    // else if (miss_SMB_hit1 && MISS_valid && !IS_ICACHE && RQB_cache) begin//|| miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3
    //     SMB_DATA[1] <= RQB_rep_way ? wr_data_1 : wr_data_0;
    // end
    // else if (miss_SMB_hit2 && MISS_valid && !IS_ICACHE && RQB_cache) begin//|| miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3
    //     SMB_DATA[2] <= RQB_rep_way ? wr_data_1 : wr_data_0;
    // end
    // else if (miss_SMB_hit3 && MISS_valid && !IS_ICACHE && RQB_cache) begin//|| miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3
    //     SMB_DATA[3] <= RQB_rep_way ? wr_data_1 : wr_data_0;
    // end
    // else if (miss_SMB_hit1 && MISS_valid && !IS_ICACHE && RQB_cache) begin//
    //     SMB_DATA[1] <= RQB_rep_way ? wr_data_1 : wr_data_0;
    // end
    // else if (miss_SMB_hit2 && MISS_valid && !IS_ICACHE && RQB_cache) begin//|| miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3
    //     SMB_DATA[2] <= RQB_rep_way ? wr_data_1 : wr_data_0;
    // end
    // else if (miss_SMB_hit3 && MISS_valid && !IS_ICACHE && RQB_cache) begin//|| miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3
    //     SMB_DATA[3] <= RQB_rep_way ? wr_data_1 : wr_data_0;
    // end
    `ifdef YSYX210458_ENAENABLE_NIVIC
    if ((miss_SMB_hit0|| miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3 ) && MISS_valid && !IS_ICACHE && RQB_cache && SMB_wdone) begin//
        SMB_DATA[0] <= miss_SMB_hit0 && RQB_rep_way ? wr_data_1 : miss_SMB_hit0  ? wr_data_0 :SMB_DATA[0] ;
        SMB_DATA[1] <= miss_SMB_hit1 && RQB_rep_way ? wr_data_1 : miss_SMB_hit1  ? wr_data_0 :SMB_DATA[1] ;
        SMB_DATA[2] <= miss_SMB_hit2 && RQB_rep_way ? wr_data_1 : miss_SMB_hit2  ? wr_data_0 :SMB_DATA[2] ;
        SMB_DATA[3] <= miss_SMB_hit3 && RQB_rep_way ? wr_data_1 : miss_SMB_hit3  ? wr_data_0 :SMB_DATA[3] ;
    end
    
    else if (MISS_valid && !IS_ICACHE&& RQB_cache && SMB_wdone) begin
        SMB_DATA[SMB_rep] <= RQB_rep_way ? wr_data_1 : wr_data_0;
    end
    `endif

`ifdef YSYX210458_ENAENABLE_IVIC
    if ((miss_SMB_hit0|| miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3 ) && MISS_valid  && RQB_cache && SMB_wdone) begin//
        SMB_DATA[0] <= miss_SMB_hit0 && RQB_rep_way ? wr_data_1 : miss_SMB_hit0  ? wr_data_0 :SMB_DATA[0] ;
        SMB_DATA[1] <= miss_SMB_hit1 && RQB_rep_way ? wr_data_1 : miss_SMB_hit1  ? wr_data_0 :SMB_DATA[1] ;
        SMB_DATA[2] <= miss_SMB_hit2 && RQB_rep_way ? wr_data_1 : miss_SMB_hit2  ? wr_data_0 :SMB_DATA[2] ;
        SMB_DATA[3] <= miss_SMB_hit3 && RQB_rep_way ? wr_data_1 : miss_SMB_hit3  ? wr_data_0 :SMB_DATA[3] ;
    end
    
    else if (MISS_valid && RQB_cache && SMB_wdone) begin
        SMB_DATA[SMB_rep] <= RQB_rep_way ? wr_data_1 : wr_data_0;
    end
`endif

    else if (SMB_DATA_we) begin
        SMB_DATA[SMB_rep] <= {SMB_rdata3,SMB_rdata2,SMB_rdata1,SMB_rdata0};
    end

    if (reset || RQB_fence && LKUP_valid || fence_valid && IS_ICACHE) begin
        SMB_V <= 4'h0;
    end
    else if (SMB_hit && REP_valid) begin
        SMB_V[0]  <= !SMB_hit0 && SMB_V[0];
        SMB_V[1]  <= !SMB_hit1 && SMB_V[1]; 
        SMB_V[2]  <= !SMB_hit2 && SMB_V[2]; 
        SMB_V[3]  <= !SMB_hit3 && SMB_V[3];  
    end
    // else if (SMB_hit && LKUP_valid && RQB_cache && RQB_op) begin//
    //     SMB_V[0]  <= !SMB_hit0 && SMB_V[0];
    //     SMB_V[1]  <= !SMB_hit1 && SMB_V[1]; 
    //     SMB_V[2]  <= !SMB_hit2 && SMB_V[2]; 
    //     SMB_V[3]  <= !SMB_hit3 && SMB_V[3];  
    // end
`ifdef YSYX210458_ENAENABLE_NIVIC
    else if ((miss_SMB_hit0 ||  miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3) && !IS_ICACHE && MISS_valid && RQB_cache && SMB_wdone )begin
        SMB_V[0]  <= miss_SMB_hit0 ;
        SMB_V[1]  <= miss_SMB_hit1 ; 
        SMB_V[2]  <= miss_SMB_hit2 ; 
        SMB_V[3]  <= miss_SMB_hit3 ;  
    end
    else if (!IS_ICACHE && MISS_valid && RQB_cache && SMB_wdone) begin
        SMB_V[SMB_rep] <= 1'b1;
    end
`endif
`ifdef YSYX210458_ENAENABLE_IVIC
    else if ((miss_SMB_hit0 ||  miss_SMB_hit1 || miss_SMB_hit2 || miss_SMB_hit3)  && MISS_valid && RQB_cache && SMB_wdone )begin
        SMB_V[0]  <= miss_SMB_hit0 ;
        SMB_V[1]  <= miss_SMB_hit1 ; 
        SMB_V[2]  <= miss_SMB_hit2 ; 
        SMB_V[3]  <= miss_SMB_hit3 ;  
    end
    else if ( MISS_valid && RQB_cache && SMB_wdone) begin
        SMB_V[SMB_rep] <= 1'b1;
    end
`endif
    else if (SMB_DATA_we) begin
        SMB_V[SMB_rep] <= 1'b1;
    end

    if (SMB_we0) begin
        SMB_rdata0 <= ret_data;
    end
    if (SMB_we1) begin 
        SMB_rdata1 <= ret_data;
    end
    if (SMB_we2) begin
        SMB_rdata2 <= ret_data;
    end

end
////////////////FENCE/////////////////////
//实现循环写出只需要让状态机跑起来就行了

assign way0_vd_list = way0_table_d & way0_table_v;
assign way1_vd_list = way1_table_d & way1_table_v;
assign way0_clear   = way0_vd_list == {DEPTH{1'b0}};
assign way1_clear   = way1_vd_list == {DEPTH{1'b0}};

ysyx_210458_encode_64_6 u_encoder0 ( .din (way0_vd_list),    .dout (way0_fence_index), .valid (way0_valid) );
ysyx_210458_encode_64_6 u_encoder1 ( .din (way1_vd_list),    .dout (way1_fence_index), .valid (way1_valid) );

///还要让SRAM选择优先编码器算出来的地址
//还要更新状态机
//REP ==>LKUP
//REP ==>IDLE
//REP ==>REFILL
//还需要转换RQB_rep_way




// ////////////REFILL////////////
assign      RFB_we0 = RQB_op && RQB_wstrb[0] == 1'b1;
assign      RFB_we1 = RQB_op && RQB_wstrb[1] == 1'b1;
assign      RFB_we2 = RQB_op && RQB_wstrb[2] == 1'b1;
assign      RFB_we3 = RQB_op && RQB_wstrb[3] == 1'b1;
assign      RFB_we4 = RQB_op && RQB_wstrb[4] == 1'b1;
assign      RFB_we5 = RQB_op && RQB_wstrb[5] == 1'b1;
assign      RFB_we6 = RQB_op && RQB_wstrb[6] == 1'b1;
assign      RFB_we7 = RQB_op && RQB_wstrb[7] == 1'b1;


assign REF_cache_last = (MSB_count == 2'h3 && ret_valid || REF_from_SMB) && REF_valid && RQB_cache;
assign REF_last       = (MSB_count == 2'h3 && ret_valid || REF_from_SMB) && REF_valid && RQB_cache || ret_last && REF_valid && !RQB_cache && SMB_wdone;

//rd_req需要查看stream_buffer的情况才能确定到底发不发出axi总线请求
//现在到了发现STREAM_BUFFER命中的时候该这么填回cache的问题了，还有及时重填的时候需要直接返回一个data
wire REF_to_IDLE;

assign REF_count_last = MSB_count == 2'h3 && ret_valid;
always @( posedge clk) begin
    //这里取消rd_req握手置零
    //因为rd_req拉高的时候就是非满的
    //且刚好可以放行同一个完整状态（MISS =>REF的全过程
    //reset || rd_req && rd_rdy || REP_valid && SMB_hit && RQB_cache || SMB_buf_hit && REP_valid && RQB_cache || REF_from_SMB

    if (reset || rd_req && rd_rdy || REP_valid && SMB_hit && RQB_cache || SMB_buf_hit && REP_valid && RQB_cache || REF_from_SMB ) begin
        rd_req_buf <= 1'b0;
    end
    else if (REP_valid && !(!RQB_cache && RQB_op)   && rd_rdy && !RQB_fence && SMB_wdone) begin
        rd_req_buf <= 1'b1;
    end
    if (reset || REF_to_IDLE) begin
        REF_from_SMB <= 1'b0;
        REF_from_SMB0 <= 1'b0;
        REF_from_SMB1 <= 1'b0;
        REF_from_SMB2 <= 1'b0;
        REF_from_SMB3 <= 1'b0;
    end
    else if (REP_valid && SMB_hit && RQB_cache && !RQB_fence) begin
        REF_from_SMB <= 1'b1;
        REF_from_SMB0 <= SMB_hit0;
        REF_from_SMB1 <= SMB_hit1;
        REF_from_SMB2 <= SMB_hit2;
        REF_from_SMB3 <= SMB_hit3;
    end
end

assign rd_req = rd_req_buf;
assign rd_type  = RQB_cache ? 3'h7 : RQB_size;
assign rd_addr  = RQB_addr;

//砍掉了关键字优先策略之后可以降低与总线交互的难度，
//砍掉关键字优先主要是为了方便进行  指令/数据的预取
//因为加入预取策略这个时候就需要改变一下ret_last指令
always @(posedge clk) begin
    // if (reset || ret_valid && ret_valid && MSB_count == 3'h3 && REF_valid) begin//这里存在问题会碰到relast最前面然后跟着retvalid
    if (reset ||  ret_valid && MSB_count == 2'h3 && REF_valid) begin
        MSB_count <= 2'h0;
    end
    else if (ret_valid && MSB_count == 2'h0 && RQB_cache && REF_valid && SMB_wdone ) begin//&& !RQB_cache
        MSB_count <= 2'h1;
    end
    else if (ret_valid && MSB_count == 2'h1) begin
        MSB_count <= 2'h2;
    end
    else if (ret_valid && MSB_count == 2'h2) begin
        MSB_count <= 2'h3;
    end
    /////////////
    if (ret_valid && MSB_count == 2'h0 && REF_valid) begin
            RFB_data0_buf[07:00] <= RFB_we0 && bank_sel_0_4 ? RQB_wdata[07:00] : ret_data[07:00];
            RFB_data0_buf[15:08] <= RFB_we1 && bank_sel_0_4 ? RQB_wdata[15:08] : ret_data[15:08];
            RFB_data0_buf[23:16] <= RFB_we2 && bank_sel_0_4 ? RQB_wdata[23:16] : ret_data[23:16];
            RFB_data0_buf[31:24] <= RFB_we3 && bank_sel_0_4 ? RQB_wdata[31:24] : ret_data[31:24];
            RFB_data0_buf[39:32] <= RFB_we4 && bank_sel_0_4 ? RQB_wdata[39:32] : ret_data[39:32];
            RFB_data0_buf[47:40] <= RFB_we5 && bank_sel_0_4 ? RQB_wdata[47:40] : ret_data[47:40];
            RFB_data0_buf[55:48] <= RFB_we6 && bank_sel_0_4 ? RQB_wdata[55:48] : ret_data[55:48];
            RFB_data0_buf[63:56] <= RFB_we7 && bank_sel_0_4 ? RQB_wdata[63:56] : ret_data[63:56];
    end
    if (ret_valid && MSB_count == 2'h1 && REF_valid) begin
            RFB_data1_buf[07:00] <= RFB_we0 && bank_sel_1_5 ? RQB_wdata[07:00] : ret_data[07:00];
            RFB_data1_buf[15:08] <= RFB_we1 && bank_sel_1_5 ? RQB_wdata[15:08] : ret_data[15:08];
            RFB_data1_buf[23:16] <= RFB_we2 && bank_sel_1_5 ? RQB_wdata[23:16] : ret_data[23:16];
            RFB_data1_buf[31:24] <= RFB_we3 && bank_sel_1_5 ? RQB_wdata[31:24] : ret_data[31:24];
            RFB_data1_buf[39:32] <= RFB_we4 && bank_sel_1_5 ? RQB_wdata[39:32] : ret_data[39:32];
            RFB_data1_buf[47:40] <= RFB_we5 && bank_sel_1_5 ? RQB_wdata[47:40] : ret_data[47:40];
            RFB_data1_buf[55:48] <= RFB_we6 && bank_sel_1_5 ? RQB_wdata[55:48] : ret_data[55:48];
            RFB_data1_buf[63:56] <= RFB_we7 && bank_sel_1_5 ? RQB_wdata[63:56] : ret_data[63:56];
    end
    if (ret_valid && MSB_count == 2'h2 && REF_valid) begin
            RFB_data2_buf[07:00] <= RFB_we0 && bank_sel_2_6 ? RQB_wdata[07:00] : ret_data[07:00];
            RFB_data2_buf[15:08] <= RFB_we1 && bank_sel_2_6 ? RQB_wdata[15:08] : ret_data[15:08];
            RFB_data2_buf[23:16] <= RFB_we2 && bank_sel_2_6 ? RQB_wdata[23:16] : ret_data[23:16];
            RFB_data2_buf[31:24] <= RFB_we3 && bank_sel_2_6 ? RQB_wdata[31:24] : ret_data[31:24];
            RFB_data2_buf[39:32] <= RFB_we4 && bank_sel_2_6 ? RQB_wdata[39:32] : ret_data[39:32];
            RFB_data2_buf[47:40] <= RFB_we5 && bank_sel_2_6 ? RQB_wdata[47:40] : ret_data[47:40];
            RFB_data2_buf[55:48] <= RFB_we6 && bank_sel_2_6 ? RQB_wdata[55:48] : ret_data[55:48];
            RFB_data2_buf[63:56] <= RFB_we7 && bank_sel_2_6 ? RQB_wdata[63:56] : ret_data[63:56];
    end
end

assign RFB_data3[07:00] = RFB_we0 && bank_sel_3_7 && REF_count_last  ? RQB_wdata[07:00] : ret_data[07:00];
assign RFB_data3[15:08] = RFB_we1 && bank_sel_3_7 && REF_count_last  ? RQB_wdata[15:08] : ret_data[15:08];
assign RFB_data3[23:16] = RFB_we2 && bank_sel_3_7 && REF_count_last  ? RQB_wdata[23:16] : ret_data[23:16];
assign RFB_data3[31:24] = RFB_we3 && bank_sel_3_7 && REF_count_last  ? RQB_wdata[31:24] : ret_data[31:24];
assign RFB_data3[39:32] = RFB_we4 && bank_sel_3_7 && REF_count_last  ? RQB_wdata[39:32] : ret_data[39:32];
assign RFB_data3[47:40] = RFB_we5 && bank_sel_3_7 && REF_count_last  ? RQB_wdata[47:40] : ret_data[47:40];
assign RFB_data3[55:48] = RFB_we6 && bank_sel_3_7 && REF_count_last  ? RQB_wdata[55:48] : ret_data[55:48];
assign RFB_data3[63:56] = RFB_we7 && bank_sel_3_7 && REF_count_last  ? RQB_wdata[63:56] : ret_data[63:56];

//xi现在该往cache里面写入数据了
//V肯定是要为1的
//D：如果是写操作那么这一定是为1的
//tag的话直接就是RQB_tag
//data的话就是那16个字节
//返回数据的话就一定是读出来的数据直接返回就行了
//还差一个由读取的数据直接返回数据
//差某些控制信号置零的逻辑
//差从新填入写入tagv与d表的
//写的时候肯定不会读，读的时候肯定不会修改

assign RFB_rdata        = ({YSYX210458_DATA_WIDTH{RFB_sel_0_4 & ret_valid & RQB_cache & MSB_count == 2'h0}} & ret_data)
                        | ({YSYX210458_DATA_WIDTH{RFB_sel_1_5 & ret_valid & RQB_cache & MSB_count == 2'h1}} & ret_data)
                        | ({YSYX210458_DATA_WIDTH{RFB_sel_2_6 & ret_valid & RQB_cache & MSB_count == 2'h2}} & ret_data) 
                        | ({YSYX210458_DATA_WIDTH{RFB_sel_3_7 & REF_count_last  & RQB_cache & MSB_count == 2'h3}} & ret_data)
                        | ({YSYX210458_DATA_WIDTH{RFB_sel_0_4 & REF_from_SMB & RQB_cache }} & SMB_rdata[063:000]) 
                        | ({YSYX210458_DATA_WIDTH{RFB_sel_1_5 & REF_from_SMB & RQB_cache }} & SMB_rdata[127:064])
                        | ({YSYX210458_DATA_WIDTH{RFB_sel_2_6 & REF_from_SMB & RQB_cache }} & SMB_rdata[191:128])
                        | ({YSYX210458_DATA_WIDTH{RFB_sel_3_7 & REF_from_SMB & RQB_cache }} & SMB_rdata[255:192]) 
                        | ({YSYX210458_DATA_WIDTH{               ret_last  &!RQB_cache }}                   & ret_data);
assign tagv0_wdata      =  {RQB_tag,1'b1};//tagv_0_v ?{RQB_tag ,1'b0} :  IorD_op ? {RQB_tag ,RQB_sv} :
assign tagv1_wdata      =  {RQB_tag,1'b1};//tagv_0_v ?{RQB_tag ,1'b0} :  IorD_op ? {RQB_tag ,RQB_sv} :

//如果以后变成流水线的cache的非阻塞形式，要注意每一级应该依靠自己的东西
assign tagv0_we         = MSB_count == 2'h1  && !RQB_rep_way && REF_valid && RQB_cache || REF_from_SMB &&  !RQB_rep_way;
assign tagv1_we         = MSB_count == 2'h1  &&  RQB_rep_way && REF_valid && RQB_cache || REF_from_SMB &&  RQB_rep_way;


assign RAW_haza =   WTB_wstrb != 8'h0 && WTB_offset[YSYX210458_OFFSET_W -1] == offset[YSYX210458_OFFSET_W -1] && !op || LKUP_valid && RQB_op && cache_hit && valid && !op && RQB_offset[YSYX210458_OFFSET_W -1] == offset[YSYX210458_OFFSET_W -1] ;


wire IDLE_1;
wire IDLE_0;
assign IDLE_1 =( RAW_haza || !valid) && !MISS_valid && !REP_valid && !REF_valid && !LKUP_valid 
            || REF_valid && REF_last
            || REF_valid && !RQB_cache && RQB_op && uncache
            || REF_valid && !RQB_cache && RQB_op 
            || LKUP_valid && cache_hit && !valid ;
assign IDLE_0 = (valid && !RAW_haza ) && !(REF_valid && REF_last || REF_valid && !RQB_cache && RQB_op) 

             || LKUP_valid && cache_hit && valid && cache_hit 
             || MISS_valid  ;
assign addr_ok  = IDLE && !RAW_haza || (LKUP_valid && cache_hit && op || LKUP_valid && cache_hit && !op && !RAW_haza) && !RQB_fence ;// 
// assign data_ok  = LKUP_valid && cache_hit && !RQB_op && !REF_valid && !REF_aldata_ok 
//                || LKUP_valid && RQB_op && !REF_valid && !(REF_aldata_ok && RQB_cache)//&& RQB_cache
//                || ret_valid && REF_valid && RQB_offset[3:2] == MSB_count && !RQB_op && RQB_cache 
//                || ret_valid && REF_valid && ret_last &&  !RQB_op && !RQB_cache;

// always @( posedge clk )begin
//     if (reset) begin
//         hit_buf <= 1'b0;
//         sel_hi  <= 1'b0;
//     end
//     else begin
//     hit_buf <= cache_hit && LKUP_valid && RQB_cache;
//     sel_hi  <=  inst_sel_hi;
//     end
// end

// assign data_ok =  hit_buf  //&& !IorD_op
//                || LKUP_valid && RQB_op && RQB_cache
//                || LKUP_valid && RQB_op 
//                || ret_valid && REF_valid && RFB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == MSB_count && !RQB_op && RQB_cache && {1'b0,MSB_count} == SMB_count 
//                || ret_valid && REF_valid && ret_last &&  !RQB_op && !RQB_cache
//                || REF_valid && REF_from_SMB && !RQB_op //因为写已经在接收的时侯发送的data_ok，现在就没必要了
//                || REP_to_IDLE;

assign cached_read_hit = LKUP_valid && !RQB_op &&  RQB_cache && cache_hit;      //cached 读命中
assign write_ok        = LKUP_valid && RQB_op ;                                 // uncached/cached 写
                                                                                //  cached 重填返回(AXI)
assign cached_axi_back   =  ret_valid && REF_valid && RFB_offset[YSYX210458_OFFSET_W -1:YSYX210458_OFFSET_W -2] == MSB_count && !RQB_op && RQB_cache && {1'b0,MSB_count} == SMB_count ;
assign uncached_axi_back =  ret_valid && REF_valid && ret_last &&  !RQB_op && !RQB_cache ;//uncached 读返回
assign cached_SMB_hit    = REF_valid && REF_from_SMB && !RQB_op ;                // cached 重填返回(SMB) //因为写已经在接收的时侯发送的data_ok，现在就没必要了
assign fence_ok          = REP_to_IDLE;                                          // D$的fence 完成
assign data_ok =  cached_read_hit || write_ok || cached_axi_back || uncached_axi_back || cached_SMB_hit || fence_ok;
               
//为了让cache适应流水线，需要设置两个信号，第一个个信号是表示下一拍数据要返回了，也就是data_ok，
//data_ok2就是表示数据和这个一起返回，
//data_ok2只是对于写不需要，只是对于读需要，因为写不需要返回数据，还有一个就是冲刷流水也不需要data_ok2
always @( posedge clk )begin
    if (reset) begin
        hit_buf <= 1'b0;
        sel_hi  <= 1'b0;
    end
    else begin
    hit_buf <= cached_read_hit || cached_axi_back || uncached_axi_back || cached_SMB_hit;
    sel_hi  <=  inst_sel_hi;
    end
end

assign data_ok2= hit_buf;
wire MISS_op_0 ;
wire MISS_op_0_0;
wire MISS_op_0_1;
wire MISS_op_0_3;
//根据测试来看MISS_0_0 不是必须的
assign MISS_op_0_0 = LKUP_valid  && !cache_hit && RQB_cache && RQB_op ;
assign MISS_op_0_1 = REP_valid || REF_valid  ;//|| MISS_valid && RQB_cache && !cache_hit
assign MISS_op_0_3 =MISS_valid && (wr_rdy );//&& cache_hit
assign MISS_op_0 =  MISS_op_0_0 || MISS_op_0_1 || MISS_op_0_3;
                              




assign no_need_wr_rdy = RQB_cache || !RQB_cache && !RQB_op;
assign LKUP_to_MISS = (RQB_cache && !cache_hit || !RQB_cache || RQB_fence ) && LKUP_valid && WTB_wstrb == 8'h0;//;
assign MISS_to_REP  = MISS_valid && wr_rdy && SMB_wdone ;//|| MISS_valid && no_need_wr_rdy;
assign REP_to_REF   = REP_valid && ( rd_rdy && !SMB_buf_hit || !RQB_cache && RQB_op ) && !RQB_fence && SMB_wdone;
assign REF_to_0     = ( REF_valid && REF_last || REF_valid &&!RQB_cache && RQB_op );
assign REP_to_LKUP  = REP_valid && RQB_fence && ( !way0_clear || !way1_clear );
assign REP_to_IDLE  = REP_valid && RQB_fence && (way0_clear && way1_clear);
assign REF_to_IDLE  = REF_valid && REF_last || REF_valid &&!RQB_cache && RQB_op;
wire  LKUP_to_IDLE;
assign LKUP_to_IDLE = cache_hit && !valid && !RQB_fence || LKUP_valid && RQB_op && cache_hit && RAW_haza && RQB_cache ;
////Dcache的时候还需要在REP的时候修改d表，而Icache直接修改V表就行了
//还需要理一理状态转换
always @( posedge clk) begin
    if (IDLE_0) begin
        IDLE <= 1'b0;
    end
    else if (reset ||  IDLE_1 || REP_to_IDLE || fence_valid && fence_valid) begin
        IDLE <= 1'b1;
    end
    
    if (reset ||  MISS_valid || REP_valid && !RQB_fence || REF_valid && !REF_last || LKUP_to_IDLE || LKUP_to_MISS  ) begin
    
        LKUP_valid <= 1'b0;
    end
    else if ((valid && !RAW_haza  )&& !(REF_valid && REF_last) || REP_to_LKUP ) begin
        LKUP_valid <= 1'b1;
    end

    if (MISS_to_REP || reset  ) begin
        MISS_valid <= 1'b0;
    end
    else if (LKUP_to_MISS) begin// && wr_rdy
        MISS_valid <= 1'b1;
    end
    /////////
    if (reset || REF_valid || REP_to_REF || REP_to_IDLE || REP_to_LKUP ) begin
        REP_valid <= 1'b0;
    end
    else if (MISS_to_REP ) begin
        REP_valid <= 1'b1;
    end
    ////////
    if (reset || REF_to_IDLE  ) begin//REF_valid && REF_last || REF_valid &&!RQB_cache && RQB_op
        REF_valid <= 1'b0;
    end
    else if ( REP_to_REF ) begin//REP_valid &&( rd_rdy || !RQB_cache && RQB_op) && !RQB_fence
        REF_valid <= 1'b1;
    end
end

`ifdef YSYX210458_PREFCOUNT
reg [63:0] rd_req_count;
reg [63:0] SMB_hit_count;

always @(posedge clk) begin
    if (reset ) begin
        rd_req_count <=64'h0;
    end
    else if (rd_req && RQB_cache && rd_rdy) begin
        rd_req_count <= rd_req_count + 64'h1;
    end

    if (reset) begin
        SMB_hit_count <=64'b0;
    end    
    else  if ( REF_valid && REF_from_SMB) begin
        SMB_hit_count <= SMB_hit_count + 1'h1;
    end
end

reg [63:0] clk_count;
always @(posedge clk)
begin
    if(clk_count[`YSYX210458_COUNT -1:0] == {`YSYX210458_COUNT{1'b1}}  ) begin
        if (IS_ICACHE) begin
            
        
	    $display("I$,Rd_req_count:");
        // $display(clk_count);
        $display(rd_req_count);
        $display("I$,SMB_hit_count:");
        $display(SMB_hit_count);
        // $display(%f,SMB_hit_count/rd_req_count);
        $display("===============================");
        end
        else if (!IS_ICACHE)  begin
         $display("D$,Rd_req_count:");
        // $display(clk_count);
        $display(rd_req_count);
        $display("D$,SMB_hit_count:");
        $display(SMB_hit_count);
        // $display(%f,SMB_hit_count/rd_req_count);
        // $display("===============================");
        end
    end
    if (reset )begin
        clk_count <= 64'h0;
    end
    else begin
        clk_count <= clk_count + 64'h1;
    end 
end
`endif


endmodule

////////CLINT////////
module ysyx_210458_clint (
    input   clk,
    input   reset,

    input  mem_to_cmp,
    input  mem_to_mtime,
    // input [63:0]  addr,
    input  wr,
    input [`YSYX210458_WSTRB_W -1:0] wstrb,
    input [63:0] wdata,
    output clint_data_ok,
    output time_int ,
    output [63:0] clint_rdata 
);

reg  [63:0] mtime;
reg  [63:0] mtimecmp;
reg         tick;
reg         data_ok;
reg         sel_cmp;

wire  mtime_we;
wire  cmp_we;
wire  is_cmp;
wire  is_mtime;

always @( posedge clk) begin
    data_ok <= (is_cmp || is_mtime);
    sel_cmp <= is_cmp;   
end
assign is_cmp = mem_to_cmp;
assign is_mtime= mem_to_mtime;
assign clint_data_ok = data_ok;
assign cmp_we = mem_to_cmp && wr && is_cmp;
assign mtime_we =  mem_to_mtime && wr && is_mtime;
//////mtime//////

always @(posedge clk) begin
    if (reset) tick <= 1'b0;
        else tick <= ~tick;
    if(reset) begin
        mtime <= 64'h0;
    end
    else if (mtime_we) begin
        mtime <= wdata;
    end
    else if (tick) begin
        mtime <= mtime + 1'b1;
    end
    
end
//////mtimecmp////
always @(posedge clk) begin
    if (reset) begin
        mtimecmp <=64'h0;
    end
    else if (cmp_we)
        mtimecmp <= wdata;
end

assign time_int = mtime >=  mtimecmp;
assign clint_rdata = sel_cmp ? mtimecmp : mtime;



endmodule

////////BPU////////
module ysyx_210458_LiteBPU (
    input       clk,
    input       reset,

    input [31:0] inst,
    input [63:0] x1_value,
    input [63:0] xn_value,
    input [63:0] pc,
    output[4:0]  rxn,
    output [63:0] bpu_pc,
    output        bpu_taken,
    output        bpu_may_wait

);

wire        inst_jal;
wire        inst_jalr;
wire        inst_bxx;
// wire 
wire [2:0] func3;
wire [6:0] func7;
wire [4:0]  rs1;
wire [6:0]  op;
wire [63:0] I_imm;
wire [63:0] J_imm;
wire [63:0] U_imm;
wire [63:0] B_imm;
wire [63:0] jalr_src1;

wire        J_type;
wire        I_type;
wire        B_type;
wire [63:0] imm_src;
wire        rs1_x0;
wire        rs1_x1;
wire        jalr_x0;
wire        jalr_x1;
wire        jalr_xn;


assign op   = inst[6:0];
assign func3= inst[14:12];
assign rs1  = inst[19:15];
assign func7= inst[31:25];
assign J_type       = inst_jal;
assign I_type       = inst_jalr;
assign B_type       = inst_bxx;

assign inst_jal     = op == 7'h6f;
assign inst_jalr    = op == 7'h67;
assign inst_bxx     = op == 7'h63 & func3 != 3'h2 & func3 != 3'h3;

assign rs1_x0       = rs1 == 5'h00;
assign rs1_x1       = rs1 == 5'h01;
assign rxn          = rs1;

assign jalr_x0      = inst_jalr & rs1_x0;
assign jalr_x1      = inst_jalr & rs1_x1;
assign jalr_xn      = inst_jalr & ~rs1_x1 & ~rs1_x0;
assign bpu_may_wait = jalr_xn;

assign J_imm        = {{44{inst[31]}},inst[19:12],inst[20],inst[30:21],1'b0};
assign I_imm        = {{53{inst[31]}},inst[30:20]};
assign B_imm        = {{52{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0};

assign imm_src  = ({64{J_type}}   & J_imm)
                | ({64{I_type}}   & I_imm)
                | ({64{B_type}}   & B_imm);
assign jalr_src1 =({64{jalr_x0}}   & 64'h0)
                | ({64{jalr_x1}}   & x1_value)
                | ({64{jalr_xn}}   & xn_value);
////
wire  [63:0] add_src1;
wire  [63:0] add_src2;
wire  [63:0] add_result;

`ifdef YSYX210458_ENAENABLE_SIMBPU
assign add_src1 = inst_jalr ? jalr_src1 : pc;
assign add_src2 = bpu_taken ? imm_src : 64'h4;
assign bpu_taken= inst_jal || inst_jalr || inst_bxx && inst[31];
`endif
`ifdef YSYX210458_ENAENABLE_NEXT
assign add_src1 =  pc;
assign add_src2 =  64'h4;
assign bpu_taken= 1'b0;
`endif


assign add_result = add_src1 + add_src2;

`ifdef YSYX210458_ENAENABLE_DFT
assign bpu_pc     = {add_result[63:32],add_result[31:2],2'b0};
`endif

`ifdef YSYX210458_ENAENABLE_SoC
assign bpu_pc     = {add_result[63:32],add_result[31:2],2'b0};
`endif



//存在一个问题就是，目前cpu未实现uncahe功能，会导致预测到低于0x8000_0000的情况，这个时候需要避免
//为了方便直接改成把改成8开头
//最后需要实现uncache功能
               

endmodule

////////ALU//////
module ysyx_210458_alu(
  input                          clk           ,
  input                          reset         ,
//   input                          alu_can_ov    ,
  input  [15:0] alu_op,
  input  [63:0] alu_src1,
  input  [63:0] alu_src2,
  output [63:0] alu_result,

  output        alu_stall                ,
  output        alu_ex
);

wire op_add;   //�ӷ�����
wire op_sub;   //��������
wire op_slt;   //�з��űȽϣ�С����λ
wire op_sltu;  //�޷��űȽϣ�С����λ
wire op_and;   //��λ��
wire op_nor;   //��λ���
wire op_or;    //��λ��
wire op_xor;   //��λ���
wire op_sll;   //�߼�����
wire op_srl;   //�߼�����
wire op_sra;   //��������
wire op_lui;   //���������ڸ߰벿��
wire op_rv32i;

wire src1_sign;
wire src2_sign;
wire adder_result_sign;

// control code decomposition
assign op_add  = alu_op[ 0];
assign op_sub  = alu_op[ 1];
assign op_slt  = alu_op[ 2];
assign op_sltu = alu_op[ 3];
assign op_and  = alu_op[ 4];
assign op_nor  = alu_op[ 5];
assign op_or   = alu_op[ 6];
assign op_xor  = alu_op[ 7];
assign op_sll  = alu_op[ 8];
assign op_srl  = alu_op[ 9];
assign op_sra  = alu_op[10];
assign op_lui  = alu_op[11];
assign op_rv32i= alu_op[12];


wire [63:0] add_sub_result;
wire [63:0] slt_result; 
wire [63:0] sltu_result;
wire [63:0] and_result;
wire [63:0] nor_result;
wire [63:0] or_result;
wire [63:0] xor_result;
wire [63:0] lui_result;
wire [63:0] sll_result;
wire [127:0] sr64_result; 
wire [63:0] sr_result; 
//
wire [63:0] add_sub_result_w; 
wire [63:0] sllw_result; 
// wire [63:0] addw_r


// 64-bit adder
wire [63:0] adder_a;
wire [63:0] adder_b;
wire [63:0] adder_cin;
wire [63:0] adder_result;
wire        adder_cout;

assign adder_a   = alu_src1;
assign adder_b   = (op_sub | op_slt | op_sltu) ? ~alu_src2 : alu_src2;
assign adder_cin = (op_sub | op_slt | op_sltu) ? 64'h1      : 64'h0;
assign {adder_cout, adder_result} = adder_a + adder_b + adder_cin;

// ADD, SUB result
assign add_sub_result_w = {{32{adder_result[31]}}, adder_result[31:0]};
assign add_sub_result = op_rv32i  ? add_sub_result_w : adder_result;


assign src1_sign = alu_src1[63] ;
assign src2_sign = alu_src2[63]; 
assign adder_result_sign = adder_result[63];

assign alu_ex   = 1'b0;
//  op_add && alu_can_ov && (src1_sign == src2_sign  && adder_result_sign != src1_sign)
//               ||  op_sub && alu_can_ov && (src1_sign != src2_sign  && adder_result_sign == src2_sign );
// SLT result
assign slt_result[63:1] = 63'b0;
assign slt_result[0]    = (alu_src1[63] & ~alu_src2[63])
                        | ((alu_src1[63] ~^ alu_src2[63]) & adder_result[63]);

// SLTU result
assign sltu_result[63:1] = 63'b0;
assign sltu_result[0]    = ~adder_cout;

// bitwise operation
assign and_result = alu_src1 & alu_src2;
assign or_result  = alu_src1 | alu_src2 ;
assign nor_result = ~or_result;
assign xor_result = alu_src1 ^ alu_src2;
assign lui_result = {{32{alu_src2[31]}}, alu_src2[31:0]};
//


// SLL result
wire [5:0] sll_src;
wire [63:0] slld_result;
assign sll_src   = op_rv32i ? {1'b0,alu_src2[4:0]} : alu_src2[5:0];
assign slld_result = alu_src1 << sll_src;
assign sllw_result = {{32{slld_result[31]}},slld_result[31:0]};
assign sll_result  = op_rv32i ? sllw_result : slld_result;
// SRL, SRA result
wire [5:0] sr_src2;
assign sr_src2 = op_rv32i ? {1'b0,alu_src2[4:0]} : alu_src2[5:0];
wire [127:0] sr_src1;
assign sr_src1 = op_rv32i ? {{96{op_sra & op_rv32i & alu_src1[31]}},alu_src1[31:0] } : 
                             {{64{op_sra & alu_src1[63]}}, alu_src1[63:0]};
assign sr64_result = sr_src1 >> sr_src2;

assign sr_result   = op_rv32i ? {{32{sr64_result[31]}},sr64_result[31:0]} : sr64_result[63:0];
assign alu_stall = 1'b0;

assign alu_result = ({64{op_add|op_sub}} & add_sub_result)
                  | ({64{op_slt       }} & slt_result)
                  | ({64{op_sltu      }} & sltu_result)
                  | ({64{op_and       }} & and_result)
                  | ({64{op_nor       }} & nor_result)
                  | ({64{op_or        }} & or_result)
                  | ({64{op_xor       }} & xor_result)
                  | ({64{op_lui       }} & lui_result)
                  | ({64{op_sll       }} & sll_result)
                  | ({64{op_srl|op_sra}} & sr_result);


endmodule
////////TH_stage////
module ysyx_210458_TH_stage(
 input  [`YSYX210458_DS_TO_TH_BUS_WD -1:0]         ds_to_th_bus,
 input  [`YSYX210458_ES_TO_TH_BUS_WD -1:0  ]       es_to_th_bus,
 input  [`YSYX210458_MS_TO_TH_BUS_WD -1:0  ]         ms_to_th_bus,
 input  [`YSYX210458_TO_TH_BUS_WD -1:0  ]         ws_to_th_bus,

 output [`YSYX210458_OUT_TH_BUS_WD -1:0 ]         data_haza_bus

);

wire 	       data_haza;
wire           ds_valid;
wire           es_valid;
wire           ms_valid;
wire           ws_valid;
wire           ms_gr_we;
wire           es_gr_we;
wire           ws_gr_we;
wire           br_inst;
wire           data_haza_es;
wire           data_haza_ms;
wire           data_haza_ws;
wire [4:0]     ds_rs;
wire [4:0]     ds_rt;
wire [4:0]     es_dest;
wire [4:0]     ms_dest;
wire [4:0]     ws_dest;
wire [4:0]     ws_c0_com_addr;
wire [4:0]     ms_c0_com_addr;
wire [4:0]     es_c0_com_addr;
wire           ws_op_mfc0;
wire           ms_op_mfc0;
wire           es_op_mfc0;
wire           data_haza_es_c0;
wire           data_haza_ms_c0;
wire           data_haza_ws_c0;
wire           es_load_op;
wire           ds_br_stall;
wire           ms_load_op;
wire           ms_ready_go;
wire           es_br_stall;
wire           ms_br_stall;
wire           ms_op_csr;
wire           es_op_csr;


assign  { 
          ds_valid , //11:11
          br_inst,  //10:10
          ds_rt,//9:5
          ds_rs //4:0
          }= ds_to_th_bus ;
assign  {
         ms_op_csr,
         ms_ready_go,
         ms_load_op,
         ms_valid,
         ms_gr_we, 
         ms_dest    
         }=ms_to_th_bus ;

assign {
         es_op_csr,
         es_load_op,
         es_valid ,//6:6
         es_gr_we ,  //5:5
         es_dest    //4:0
      } =es_to_th_bus ;

assign  {
         ws_gr_we , 
         ws_valid , //5:5
         ws_dest    //4:0
      } = ws_to_th_bus;

assign data_haza_es = ds_valid && es_valid && es_gr_we && ( br_inst || es_load_op || es_op_csr)
                   && (es_dest != 5'd0)
                   && (ds_rs == es_dest || ds_rt == es_dest);

assign data_haza_ms = ds_valid && ms_valid && ms_gr_we && ( ms_load_op || ms_op_csr)
                   && (ms_dest != 5'd0)
                   && (ds_rs == ms_dest || ds_rt == ms_dest);
                   
assign data_haza_ws = ds_valid && ws_valid && ws_gr_we 
                   && (ws_dest != 5'd0)
                   && (ds_rs == ws_dest || ds_rt == ws_dest);

assign es_br_stall  =ds_valid && es_valid &&  es_load_op && br_inst && ((ds_rs == es_dest)  || (ds_rt == es_dest)) ;
assign ms_br_stall  =ds_valid && ms_valid &&  ms_load_op && br_inst && ((ds_rs == ms_dest)  || (ds_rt == ms_dest)) ;
assign ds_br_stall = es_br_stall  || ms_br_stall;
assign data_haza =  data_haza_es || data_haza_ms || data_haza_ws;                                                                                                          
assign data_haza_bus = {ds_br_stall,data_haza};


endmodule  

//////////REGFILE////////
module ysyx_210458_regfile(
    input         clk,
    input         reset,
    // READ PORT 1
    input  [ 4:0] raddr1,
    output [63:0] rdata1,
    // READ PORT 2
    input  [ 4:0] raddr2,
    output [63:0] rdata2,
    //x1_port
    output [63:0] x1_value,
    // WRITE PORT
    input          we,       //write enable, HIGH valid
    input  [ 4:0] waddr,
    input  [63:0] wdata

    `ifdef  YSYX210458_ENAENABLE_DFT
    ,
    output wire [`YSYX210458_REG_BUS ] regs_o [31:0]

    `endif
);
reg [63:0] rf[31:0];

//WRITE
// always @(posedge clk) begin
//     if (we) rf[waddr]<= wdata;
// end
integer  j;
always @(posedge clk) begin
    if (reset) begin
        for(j = 0;j<32;j = j+1 )
           rf[j] <= {`YSYX210458_DATA_WIDTH{1'b0}};   
        end
    else if (we & waddr != 0) begin
        rf[waddr]<= wdata;
    end 
end
//READ OUT 1
assign rdata1 = (raddr1==5'b0) ? 64'b0 : rf[raddr1];

//READ OUT 2
assign rdata2 = (raddr2==5'b0) ? 64'b0 : rf[raddr2];
//X1_port
assign x1_value = rf[5'h01];

 `ifdef  YSYX210458_ENAENABLE_DFT
genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin : regfile_gen
			assign regs_o[i] = (we & waddr == i & i != 0) ? wdata : rf[i];
		end
	endgenerate
`endif 

endmodule

////////tools///////
module ysyx_210458_decoder_2_4(
    input  wire  [ 1:0] in,
    output wire [3:0] out
);

genvar i;
generate for (i=0; i<4; i=i+1) begin : gen_for_dec_2_4
    assign out[i] = (in == i);
end endgenerate

endmodule

module ysyx_210458_decoder_5_32(
    input  wire  [ 4:0] in,
    output wire [31:0] out
);

genvar i;
generate for (i=0; i<32; i=i+1) begin : gen_for_dec_5_32
    assign out[i] = (in == i);
end endgenerate

endmodule


module ysyx_210458_decoder_6_64(
    input  wire  [ 5:0] in,
    output wire  [63:0] out
);

genvar i;
generate for (i=0; i<64; i=i+1) begin : gen_for_dec_6_64//
    assign out[i] = (in == i);
end endgenerate

endmodule

module ysyx_210458_decoder_3_8(
    input  wire  [ 2:0] in,
    output wire  [ 7:0] out
);

genvar i;
generate for (i=0; i<8; i=i+1) begin : gen_for_dec_3_8//
    assign out[i] = (in == i);
end endgenerate

endmodule

module ysyx_210458_decoder_7_128(
    input  wire  [ 6:0] in,
    output wire  [ 127:0] out
);

genvar i;
generate for (i=0; i<128; i=i+1) begin : gen_for_dec_7_128//
    assign out[i] = (in == i);
end endgenerate

endmodule

module ysyx_210458_cache_data_SRAM (
    input           clk,
    input   [7:0]  wstrb_lo,
    input   [7:0]  wstrb_hi,
    input           we,
    input   [5:0]   addr,
    input   [63:0] wdata_lo,
    input   [63:0] wdata_hi,
    output  [127:0] rdata

);
wire    [127:0]     bits_we;
wire    [127:0]     wdata;
wire    [15:0]      wstrb;
assign wdata = {wdata_hi,wdata_lo};
assign wstrb = {wstrb_hi,wstrb_lo};

assign bits_we = {
    {8{wstrb[15]}},
    {8{wstrb[14]}},
    {8{wstrb[13]}},
    {8{wstrb[12]}},
    {8{wstrb[11]}},
    {8{wstrb[10]}},
    {8{wstrb[09]}},
    {8{wstrb[08]}},
    {8{wstrb[07]}},
    {8{wstrb[06]}},
    {8{wstrb[05]}},
    {8{wstrb[04]}},
    {8{wstrb[03]}},
    {8{wstrb[02]}},
    {8{wstrb[01]}},
    {8{wstrb[00]}}
};

S011HD1P_X32Y2D128_BW data_ram(
    .CLK            (clk),
    .CEN            (1'b0),
    .WEN            (~we),
    .BWEN           (~bits_we),
    .A              (addr   ),
    .D              (wdata),
    .Q              (rdata)
);

    
endmodule

module ysyx_210458_lsfr
(
input                         clk, //时钟
input                         reset,  //复位
output reg [2:0]              dout  //data_out
);

parameter    INIT = 3'h1; //初始值
parameter    COFF = 3'h4; //生成多项式

reg [2:0]  dout_next;
always @ (posedge clk or posedge reset)
    if(reset)       dout <=  INIT;
    else          dout <=  dout_next;

integer i;
always@(*)
    begin
        dout_next[0] = dout[2];
        for(i=1; i<3; i=i+1)
            if(COFF[3-i])        dout_next[i] = dout[i-1]^dout[2];
            else                 dout_next[i] = dout[i-1];
end

endmodule



module ysyx_210458_fifo
#(
    parameter  DEPTH_WIDTH = 4,
    parameter YSYX210458_DATA_WIDTH = 256,
    parameter WIDTH_CNT = 3,//clog2(DEPTH_WIDTH) + 1,
    parameter MAX_NUM   = DEPTH_WIDTH -1
)

(
    input           clk,
    input           reset,

    output          empty,
    output          full,

    input           rd_en,
    input           wr_en,
    input [YSYX210458_DATA_WIDTH -1 :0]    wdata,
    output[YSYX210458_DATA_WIDTH -1 :0]    rdata
);
reg [YSYX210458_DATA_WIDTH -1 :0] data_buf [DEPTH_WIDTH -1:0];
reg [WIDTH_CNT -1  :0]   Rptr;
reg [WIDTH_CNT -1  :0]   Wptr;

wire [WIDTH_CNT -2 :0]  Rptr_count;
wire                    Rptr_sign;
wire [WIDTH_CNT -2 :0]  Wptr_count;
wire                    Wptr_sign;
wire [WIDTH_CNT -2:0]   read_next;
wire            buf_we;
wire            Rptr_add;
wire            Wptr_add;
wire            FULL;
wire            EMPTY;

assign read_next    = Rptr_count - 1'b1;
assign Rptr_count   = Rptr[WIDTH_CNT -2 :0];
assign Rptr_sign    = Rptr[WIDTH_CNT -1];
assign Wptr_count   = Wptr[WIDTH_CNT -2 :0];
assign Wptr_sign    = Wptr[WIDTH_CNT -1];

assign buf_we      = Wptr_add;
assign Wptr_add    = wr_en && !FULL;
assign Rptr_add    = rd_en && !EMPTY;

assign FULL =  Rptr_count == Wptr_count && Rptr_sign != Wptr_sign;
assign EMPTY=  Rptr == Wptr ;//|| Rptr_sign == Wptr_sign && Wptr_count == read_next;
// assign rdata = !EMPTY && rd_en ? data_buf[read_next] : data_buf[Rptr_count];
// assign rdata = data_buf[Rptr_count];
// assign rdata = data_buf[read_next];
assign rdata = EMPTY ? data_buf[read_next] : data_buf[Rptr_count];
// assign rdata = rd_en ? data_buf[read_next] :data_buf[read_next] ;
assign full = FULL;
assign empty =EMPTY;
integer  i;
always @(posedge clk) begin
    if (reset ) begin
        for(i = 0;i<DEPTH_WIDTH;i = i+1 )
        data_buf[i]  <= {YSYX210458_DATA_WIDTH{1'b0}}; 
    end
    else  if (buf_we) begin
        data_buf[Wptr_count] <= wdata;
    end
    if (reset) begin
        Wptr[WIDTH_CNT -2:0] <= {WIDTH_CNT -1{1'b0}};
    end
    else if (Wptr_add) begin
        Wptr[WIDTH_CNT -2:0] <= Wptr[WIDTH_CNT -2:0] +1'b1;
    end
    if (reset ) begin
        Wptr[WIDTH_CNT -1] <= 1'b0;
    end
    else if ((Wptr_count == MAX_NUM[WIDTH_CNT -2:0]) && Wptr_add) begin
        Wptr[WIDTH_CNT -1] <= !Wptr[WIDTH_CNT -1];
    end

    if(reset ) begin
        Rptr[WIDTH_CNT -2:0] <= {WIDTH_CNT -1{1'b0}};
    end
    else if (Rptr_add) begin
        Rptr[WIDTH_CNT -2:0] <= Rptr[WIDTH_CNT -2:0] + 1'b1;
    end
    if (reset ) begin
        Rptr[WIDTH_CNT -1] <= 1'b0;
    end
    else if ((Rptr_count == MAX_NUM[WIDTH_CNT -2:0])  && Rptr_add) begin
        Rptr[WIDTH_CNT -1] <= !Rptr[WIDTH_CNT -1];
    end
end


endmodule

module ysyx_210458_axi_haza
#(
    parameter DEPTH_WIDTH = 4,
    parameter YSYX210458_DATA_WIDTH = 26,
    parameter WIDTH_CNT = 3,//clog2(DEPTH_WIDTH) + 1,
    parameter MAX_NUM   = DEPTH_WIDTH -1
)

(
    input           clk,
    input           reset,

    output          empty,
    output          full,

    input           rd_en,
    input           wr_en,
    input           wr_uncahe,
    input [YSYX210458_DATA_WIDTH -1 :0]   compare_addr1,
    input [YSYX210458_DATA_WIDTH -1 :0]   compare_addr2,
    input [YSYX210458_DATA_WIDTH -1 :0]    wdata,
    // output[YSYX210458_DATA_WIDTH -1 :0]    rdata,
    output                     haza1,
    output                     haza2,
    output                     haza_uncache
);
reg [YSYX210458_DATA_WIDTH -1 :0] data_buf [DEPTH_WIDTH -1:0];
reg [WIDTH_CNT -1  :0]   Rptr;
reg [WIDTH_CNT -1  :0]   Wptr;
reg [DEPTH_WIDTH -1:0]   v_table;
reg [DEPTH_WIDTH -1:0]   uncache_table;

wire [WIDTH_CNT -2 :0]  Rptr_count;
wire                    Rptr_sign;
wire [WIDTH_CNT -2 :0]  Wptr_count;
wire                    Wptr_sign;

wire [YSYX210458_DATA_WIDTH -1:0] cmp_next_addr1,cmp_next_addr2;
// wire [YSYX210458_DATA_WIDTH -1:0] buf_next_addr1,buf_addr;

wire [DEPTH_WIDTH -1:0]  haza1_list;
wire [DEPTH_WIDTH -1:0]  haza2_list;

wire            buf_we;
wire            Rptr_add;
wire            Wptr_add;
wire            FULL;
wire            EMPTY;

assign Rptr_count   = Rptr[WIDTH_CNT -2 :0];
assign Rptr_sign    = Rptr[WIDTH_CNT -1];
assign Wptr_count   = Wptr[WIDTH_CNT -2 :0];
assign Wptr_sign    = Wptr[WIDTH_CNT -1];

assign buf_we      = Wptr_add;
assign Wptr_add    = wr_en && !FULL;
assign Rptr_add    = rd_en && !EMPTY;

assign FULL =  Rptr_count == Wptr_count && Rptr_sign != Wptr_sign;
assign EMPTY=  Rptr == Wptr ;
assign full = FULL;
assign empty =EMPTY;
assign haza1 = haza1_list != {DEPTH_WIDTH{1'b0}};
assign haza2 = haza2_list != {DEPTH_WIDTH{1'b0}};
assign haza_uncache = (v_table & uncache_table) != {DEPTH_WIDTH{1'b0}};
// assign haza_uncache = 1'b0;

assign cmp_next_addr1 = compare_addr1 + 26'h1;
assign cmp_next_addr2 = compare_addr2 + 26'h1;
// assign buf_addr       = data_buf[i];
// assign buf_next_addr1 = buf_addr+ 26'h3FF_FFFE;
// assign buf_next_addr2 = data_buf[1] + 26'h1;  
genvar i;
	generate
		for (i = 0; i < DEPTH_WIDTH ; i = i + 1) begin : haza_gen
			assign haza1_list[i] = compare_addr1 == data_buf[i] && v_table[i] || cmp_next_addr1 == data_buf[i] && v_table[i]  ;
            assign haza2_list[i] = compare_addr2 == data_buf[i] && v_table[i] || cmp_next_addr2 == data_buf[i] && v_table[i] ;
            // assign haza1_list[i] = compare_addr1 == data_buf[i] && v_table[i] || compare_addr1 == buf_next_addr1 && v_table[i]  ;
            // assign haza2_list[i] = compare_addr2 == data_buf[i] && v_table[i] || compare_addr2 == buf_next_addr1 && v_table[i]  ;
            
		end
	endgenerate
integer  j;
always @(posedge clk) begin
    if (reset) begin
        for(j = 0;j<DEPTH_WIDTH;j = j+1 )
         data_buf[j]  <= {YSYX210458_DATA_WIDTH{1'b0}};
    end
    else if (buf_we) begin
        data_buf[Wptr_count]        <= wdata;
    end
    if (reset) begin
        Wptr[WIDTH_CNT -2:0] <= {WIDTH_CNT -1{1'b0}};
    end
    else if (Wptr_add) begin
        Wptr[WIDTH_CNT -2:0] <= Wptr[WIDTH_CNT -2:0] +1'b1;
    end
    if (reset ) begin
        Wptr[WIDTH_CNT -1] <= 1'b0;
    end
    else if ((Wptr_count == MAX_NUM[WIDTH_CNT -2:0]) && Wptr_add) begin
        Wptr[WIDTH_CNT -1] <= !Wptr[WIDTH_CNT -1];
    end

    if(reset ) begin
        Rptr[WIDTH_CNT -2:0] <= {WIDTH_CNT -1{1'b0}};
    end
    else if (Rptr_add) begin
        Rptr[WIDTH_CNT -2:0] <= Rptr[WIDTH_CNT -2:0] + 1'b1;
    end
    if (reset ) begin
        Rptr[WIDTH_CNT -1] <= 1'b0;
    end
    else if ((Rptr_count == MAX_NUM[WIDTH_CNT -2:0])  && Rptr_add) begin
        Rptr[WIDTH_CNT -1] <= !Rptr[WIDTH_CNT -1];
    end

    if (reset) begin
        v_table         <= {DEPTH_WIDTH{1'b0}};
        uncache_table   <= {DEPTH_WIDTH{1'b0}};
    end
    else if (buf_we || rd_en) begin
        if (buf_we) begin
        v_table[Wptr_count]         <= 1'b1;
        uncache_table[Wptr_count]   <= wr_uncahe;
        end
        if (rd_en) begin
             v_table[Rptr_count]    <= 1'b0;
        uncache_table[Rptr_count]   <= 1'b0;
        end
    end
end


endmodule

module ysyx_210458_encode_64_6
(
    input [63:0] din,
    output [5:0] dout,
    output       valid
);
/////////////////////////////////////////////////////class1////////////////////////////////////////////////////
wire [31:0] class1_dout;
wire [15:0] class1_valid;

genvar i;
generate for ( i= 0 ; i<16 ;i=i+1 ) begin :gen_for_encode16
    ysyx_210458_Priority_encoder u_Priority_encoder (.din (din[i*4+3:i*4]) , .dout (class1_dout[i*2+1:i*2]) , .valid (class1_valid[i])  );
    
end endgenerate
///////////////////////////////////////////class2///////////////////////////////////////////////////////////
wire [23:0] class2_dout;
wire [7:0]  class2_valid;

genvar j;
generate for ( j =0;j<8;j=j+1) begin : gen_for_encode8

    ysyx_210458_encoder_sel u_encoder_sel (.sign1   (class1_valid[j*2+1]),
                               .sign0   (class1_valid[j*2]) ,
                               .din1    (class1_dout[j*4+3:j*4+2]),
                               .din0    (class1_dout[j*4+1:j*4]),
                               .dout    (class2_dout[j*3+2:j*3]),
                               .valid   (class2_valid[j]));
end endgenerate

/////////////////////////////////////////////////////////class3/////////////////////////////////////////////

wire [15:0] class3_dout;
wire [3:0]  class3_valid;

genvar x;
generate for ( x =0;x<4;x=x+1) begin : gen_for_encode4

     ysyx_210458_encoder_sel #(
        .DIN_WIDTH  (3),
        .DOUT_WIDTH (4)) 
     u_encoder_sel (.sign1   (class2_valid[x*2+1]),
                   .sign0   (class2_valid[x*2]) ,
                   .din1    (class2_dout[x*6+5:x*6+3]),
                   .din0    (class2_dout[x*6+2:x*6]),
                   .dout    (class3_dout[x*4+3:x*4]),
                   .valid   (class3_valid[x]));
end endgenerate

/////////////////////////////////////////////////////////class4//////////////////////////////////////////

wire [9:0] class4_dout;
wire [1:0]  class4_valid;

genvar z;
generate for ( z =0;z<2;z=z+1) begin : gen_for_encode2

    ysyx_210458_encoder_sel #(
        .DIN_WIDTH  (4),
        .DOUT_WIDTH (5)
    )
     u_encoder_sel (.sign1  (class3_valid[z*2+1]),
                   .sign0   (class3_valid[z*2]) ,
                   .din1    (class3_dout[z*8+7:z*8+4]),
                   .din0    (class3_dout[z*8+3:z*8]),
                   .dout    (class4_dout[z*5+4:z*5]),
                   .valid   (class4_valid[z]));            
end endgenerate

/////////////////////////////////////////////////////class5//////////////////////////////////////////

ysyx_210458_encoder_sel #(
        .DIN_WIDTH  (5),
        .DOUT_WIDTH (6)
    )
     u_encoder_sel (.sign1  (class4_valid[1]),
                   .sign0   (class4_valid[0]) ,
                   .din1    (class4_dout[9:5]),
                   .din0    (class4_dout[4:0]),
                   .dout    (dout),
                   .valid   (valid));
////////////////////////////////////////////////////END//////////////////////////////////////////////         
//64_6优先编码
//五层结构
////////1个//////////
////////2个///////////
////////4个////////////
////////8个/////////////
////////16个/////////////


endmodule
module ysyx_210458_Priority_encoder
#(
    parameter DOUT_WIDTH = 2,
    parameter start = 0 
) 
(
    input [3:0] din,
    output [1:0] dout,
    output      valid
);

wire valid1, valid0;
wire [1:0] dout1,dout0;

assign valid1 = din[3] ? 1'b1 : din[2];
assign valid0 = din[1] ? 1'b1 : din[0];
assign valid  = valid1 ? 1'b1 : valid0;

assign dout1  = din[3] ? 2'h3 : 2'h2;
assign dout0  = din[1] ? 2'h1 : 2'h0;
assign dout   = valid1 ? dout1   : dout0;

endmodule

module ysyx_210458_encoder_sel 
#(
    parameter DIN_WIDTH = 2,
    parameter DOUT_WIDTH = 3 
)
(
    input  sign1,
    input  sign0,
    input [DIN_WIDTH -1 :0] din1,
    input [DIN_WIDTH -1 :0] din0,
    output[DOUT_WIDTH -1:0] dout,
    output                  valid
);
    
assign valid = sign0 | sign1;
assign dout =  sign1 ? {1'b1,din1} : {1'b0,din0};


endmodule

module ysyx_210458_queue 
#(
    parameter  DEPTH_WIDTH = 5,
    parameter YSYX210458_DATA_WIDTH = 160,
    parameter WIDTH_CNT = 4,//clog2(DEPTH_WIDTH) + 1,
    parameter MAX_NUM   = DEPTH_WIDTH -1
)

(
    input           clk,
    input           reset,
    input           clear_en,

    output          empty,
    output          full,
    output          almost_full,

    input           rd_en,
    input           wr_en,
    input [YSYX210458_DATA_WIDTH -1 :0]    wdata,
    output[YSYX210458_DATA_WIDTH -1 :0]    rdata
);
reg [YSYX210458_DATA_WIDTH -1 :0] data_buf [DEPTH_WIDTH -1:0];
reg [WIDTH_CNT -1  :0]   Rptr;
reg [WIDTH_CNT -1  :0]   Wptr;

wire [WIDTH_CNT -2 :0]  Rptr_count;
wire                    Rptr_sign;
wire [WIDTH_CNT -2 :0]  Wptr_count;
wire                    Wptr_sign;
wire [WIDTH_CNT -2:0]   read_next;
wire            buf_we;
wire            Rptr_add;
wire            Wptr_add;
wire            FULL;
wire            EMPTY;

assign read_next    = Rptr_count - 1'b1;
assign Rptr_count   = Rptr[WIDTH_CNT -2 :0];
assign Rptr_sign    = Rptr[WIDTH_CNT -1];
assign Wptr_count   = Wptr[WIDTH_CNT -2 :0];
assign Wptr_sign    = Wptr[WIDTH_CNT -1];

assign buf_we      = Wptr_add;
assign Wptr_add    = wr_en && !FULL;
assign Rptr_add    = rd_en && !(EMPTY && !Wptr_add);
wire [2:0] W_sub_R,R_sub_W;
assign W_sub_R = Wptr_count - Rptr_count;
assign R_sub_W = Rptr_count - Wptr_count;

assign almost_full = Rptr_sign == Wptr_sign && ( W_sub_R == 3'h3 || W_sub_R == 3'h4 ) || Rptr_sign != Wptr_sign &&(  R_sub_W == 3'h2 || R_sub_W == 3'h1 || R_sub_W == 3'h0) ;
assign FULL =  Rptr_count == Wptr_count && Rptr_sign != Wptr_sign;
assign EMPTY=  Rptr == Wptr ;//|| Rptr_sign == Wptr_sign && Wptr_count == read_next;
// assign rdata = !EMPTY && rd_en ? data_buf[read_next] : data_buf[Rptr_count];
// assign rdata = data_buf[Rptr_count];
// assign rdata = data_buf[read_next];
assign rdata = EMPTY ? data_buf[read_next] : data_buf[Rptr_count];
// assign rdata = rd_en ? data_buf[read_next] :data_buf[read_next] ;
assign full = FULL;
assign empty =EMPTY;
integer  i;
always @(posedge clk) begin
    // if (reset ) begin
    //     for(i = 0;i<DEPTH_WIDTH;i = i+1 )
    //     data_buf[i]  <= {YSYX210458_DATA_WIDTH{1'b0}}; 
    // end
    // else  
    if (buf_we) begin
        data_buf[Wptr_count] <= wdata;
    end
    if (reset || clear_en || Wptr_count == MAX_NUM[WIDTH_CNT -2:0] && Wptr_add) begin
        Wptr[WIDTH_CNT -2:0] <= {WIDTH_CNT -1{1'b0}};
    end
    else if (Wptr_add) begin
        Wptr[WIDTH_CNT -2:0] <= Wptr[WIDTH_CNT -2:0] +1'b1;
    end
    if (reset || clear_en ) begin
        Wptr[WIDTH_CNT -1] <= 1'b0;
    end
    else if ((Wptr_count == MAX_NUM[WIDTH_CNT -2:0]) && Wptr_add) begin
        Wptr[WIDTH_CNT -1] <= !Wptr[WIDTH_CNT -1];
    end

    if(reset || clear_en || Rptr_add && Rptr_count == MAX_NUM[WIDTH_CNT -2:0] ) begin
        Rptr[WIDTH_CNT -2:0] <= {WIDTH_CNT -1{1'b0}};
    end
    else if (Rptr_add) begin
        Rptr[WIDTH_CNT -2:0] <= Rptr[WIDTH_CNT -2:0] + 1'b1;
    end
    if (reset || clear_en) begin
        Rptr[WIDTH_CNT -1] <= 1'b0;
    end
    else if ((Rptr_count == MAX_NUM[WIDTH_CNT -2:0])  && Rptr_add) begin
        Rptr[WIDTH_CNT -1] <= !Rptr[WIDTH_CNT -1];
    end
end


endmodule