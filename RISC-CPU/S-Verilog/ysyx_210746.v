`timescale 1ns / 1ps

`define YSYX210746_ZERO_WORD           64'h00000000_00000000
`define YSYX210746_REG_BUS             63 : 0     
`define YSYX210746_RISCV_PRIV_MODE_U   0
`define YSYX210746_RISCV_PRIV_MODE_S   1
`define YSYX210746_RISCV_PRIV_MODE_M   3
`define YSYX210746_AXI_ADDR_WIDTH      32
`define YSYX210746_AXI_DATA_WIDTH      64
`define YSYX210746_AXI_ID_WIDTH        4
`define YSYX210746_AXI_USER_WIDTH      1
`define YSYX210746_RW_DATA_WIDTH       64  

`define YSYX210746_RW_ADDR_WIDTH       64

`define YSYX210746_REQ_READ            1'b0
// `define YSYX210746_REQ_WRITE           1'b1
// `define DIFF_TEST           1'b1

`ifdef DIFF_TEST
    `define YSYX210746_PC_START                64'h00000000_80000000
    `define YSYX210746_AXI_TOP_INTERFACE(name) io_memAXI_0_``name
`else
    `define YSYX210746_PC_START                64'h00000000_30000000
    
`endif



//***********************************//

// Burst types
`define ysyx_210746_AXI_BURST_TYPE_FIXED                                2'b00
`define ysyx_210746_AXI_BURST_TYPE_INCR                                 2'b01
`define ysyx_210746_AXI_BURST_TYPE_WRAP                                 2'b10
// Access permissions
`define ysyx_210746_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define ysyx_210746_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define ysyx_210746_AXI_PROT_SECURE_ACCESS                              3'b000
`define ysyx_210746_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define ysyx_210746_AXI_PROT_DATA_ACCESS                                3'b000
`define ysyx_210746_AXI_PROT_INSTRUCTION_ACCESS                         3'b100
// Memory types (AR)
`define ysyx_210746_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define ysyx_210746_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define ysyx_210746_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define ysyx_210746_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define ysyx_210746_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define ysyx_210746_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define ysyx_210746_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define ysyx_210746_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define ysyx_210746_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define ysyx_210746_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define ysyx_210746_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define ysyx_210746_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111
// Memory types (AW)
`define ysyx_210746_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define ysyx_210746_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define ysyx_210746_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define ysyx_210746_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define ysyx_210746_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define ysyx_210746_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define ysyx_210746_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define ysyx_210746_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define ysyx_210746_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define ysyx_210746_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define ysyx_210746_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define ysyx_210746_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define ysyx_210746_AXI_SIZE_BYTES_1                                    3'b000
`define ysyx_210746_AXI_SIZE_BYTES_2                                    3'b001
`define ysyx_210746_AXI_SIZE_BYTES_4                                    3'b010
`define ysyx_210746_AXI_SIZE_BYTES_8                                    3'b011
`define ysyx_210746_AXI_SIZE_BYTES_16                                   3'b100
`define ysyx_210746_AXI_SIZE_BYTES_32                                   3'b101
`define ysyx_210746_AXI_SIZE_BYTES_64                                   3'b110
`define ysyx_210746_AXI_SIZE_BYTES_128                                  3'b111

module ysyx_210746_axi_size_ctrl(
    input       [6:0]  inst_data,
    input              skip,
    // input              ld_valid,
    // input              ar_addr_flag,
    input              ld_pause_o,
    
    output reg  [2:0]  axi_ar_size,
    output reg  [2:0]  axi_aw_size
    
);
  parameter SB = 7'd31, SH = 7'd32, SW = 7'd33 , SD = 34;
  parameter LB = 7'd38, LH = 7'd39, LW = 7'd40 , LHU = 7'd41,LWU =7'd14 , LD =7'd15, LBU = 7'd49;//I_TYPE LOAD

`ifdef   DIFF_TEST
  assign  axi_aw_size    =  3'b011;
  assign  axi_ar_size    =  3'b011;// 011 = 8*8bit
`else
   always @(*) begin
      if (skip)
          axi_ar_size = 3'b000 ;
      else if (ld_pause_o) 
          case(inst_data)
              LB,LBU :  axi_ar_size = 3'b000 ;
              LH,LHU :  axi_ar_size = 3'b001 ;
              LW,LWU :  axi_ar_size = 3'b010 ;
              LD     :  axi_ar_size = 3'b011 ;
              default:  axi_ar_size = 3'b011 ;
          endcase
     else
         axi_ar_size = 3'b010 ;
  end

  always @(*) begin
      case(inst_data)
          SB:  axi_aw_size = 3'b000 ;
          SH:  axi_aw_size = 3'b001 ;
          SW:  axi_aw_size = 3'b010 ;
          SD:  axi_aw_size = 3'b011 ;
          default:  axi_aw_size = 3'b000 ;
      endcase
  end
`endif 

  endmodule

module ysyx_210746_axi_ctrl (
    input                                          clock,
    input                                          reset,

	input                                          if_valid,
    input  [31:0]                                  if_addr,
   
    input                                          ld_valid,
    input  [31:0]                                  ld_addr,
    input                                          ld_pause,

    input                                          sd_valid,
    input  [7:0]                                   sd_strb,
    input  [31:0]                                  sd_addr,
    input  [`YSYX210746_RW_DATA_WIDTH-1:0]         sd_data,

    input                                          skip,
    input                                          id_bubble,
    input                                          ti_excep_r,
    input  [6:0]                                   mem_inst_data,
    input                                          ld_pause_o,
    
    output                                         if_ready,
    output [1:0]                                   if_resp,
    output reg [`YSYX210746_RW_DATA_WIDTH-1:0]     if_data_read,

    output                                         ld_ready,
    output reg [`YSYX210746_RW_DATA_WIDTH-1:0]     ld_data_read,

    output                                         sd_ready,

    // Advanced eXtensible Interface
    input                                          axi_aw_ready_i,
    output                                         axi_aw_valid_o,
    output [`YSYX210746_AXI_ADDR_WIDTH-1:0]        axi_aw_addr_o,
    output [`YSYX210746_AXI_ID_WIDTH-1:0]          axi_aw_id_o,
    output [7:0]                                   axi_aw_len_o,
    output [2:0]                                   axi_aw_size_o,
    output [1:0]                                   axi_aw_burst_o,
  
    input                                          axi_w_ready_i,
    output                                         axi_w_valid_o,
    output [`YSYX210746_AXI_DATA_WIDTH-1:0]        axi_w_data_o,
    output [`YSYX210746_AXI_DATA_WIDTH/8-1:0]      axi_w_strb_o,
    output                                         axi_w_last_o,

    
    output                                         axi_b_ready_o,
    input                                          axi_b_valid_i,
    input  [1:0]                                   axi_b_resp_i,
    input  [`YSYX210746_AXI_ID_WIDTH-1:0]          axi_b_id_i,
    input                                          axi_b_user_i,

    input                                          axi_ar_ready_i,
    output                                         axi_ar_valid_o,
    output [`YSYX210746_AXI_ADDR_WIDTH-1:0]        axi_ar_addr_o,
    output [`YSYX210746_AXI_ID_WIDTH-1:0]          axi_ar_id_o,
    output [7:0]                                   axi_ar_len_o,
    output [2:0]                                   axi_ar_size_o,
    output [1:0]                                   axi_ar_burst_o,


    output                                         axi_r_ready_o,
    input                                          axi_r_valid_i,
    input  [1:0]                                   axi_r_resp_i,
    input  [`YSYX210746_AXI_DATA_WIDTH-1:0]        axi_r_data_i,
    input                                          axi_r_last_i,
    input  [`YSYX210746_AXI_ID_WIDTH-1:0]          axi_r_id_i,
    input                                          axi_r_user_i
);

  
  // handshake
  wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;  // handshakedone  when ready and valid both are 1
  wire w_hs       = axi_w_ready_i  & axi_w_valid_o;
  wire b_hs       = axi_b_ready_o  & axi_b_valid_i;
  wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
  wire r_hs       = axi_r_ready_o  & axi_r_valid_i;

  wire w_done     = w_hs & axi_w_last_o;
  wire r_done     = r_hs & axi_r_last_i;


  wire r_valid    =  if_valid | ld_valid;

// ------------------State Machine------------------
    parameter [1:0] W_STATE_IDLE = 2'b00, W_STATE_ADDR = 2'b01, W_STATE_WRITE = 2'b10, W_STATE_RESP = 2'b11;
    parameter [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_READ  = 2'b10;

    reg [1:0] w_state, r_state;
    // wire w_state_idle = w_state == W_STATE_IDLE; 
    wire w_state_addr = w_state == W_STATE_ADDR, w_state_write = w_state == W_STATE_WRITE, w_state_resp = w_state == W_STATE_RESP;
    // wire r_state_idle = r_state == R_STATE_IDLE
    wire r_state_addr = r_state == R_STATE_ADDR, r_state_read  = r_state == R_STATE_READ;

    // Wirte State Machine
    always @(posedge clock) begin
        if (reset) begin
            w_state <= W_STATE_IDLE;
        end
        else begin
            if (sd_valid) begin
                case (w_state)
                    W_STATE_IDLE:               w_state <= W_STATE_ADDR;
                    W_STATE_ADDR:  if (aw_hs)   w_state <= W_STATE_WRITE;//The address only be written once, so once the handshake signal is successful at this time, it means that the address has been transmitted.
                    W_STATE_WRITE: if (w_done)  w_state <= W_STATE_RESP; //Sign write data complete transfer
                    W_STATE_RESP:  if (b_hs)    w_state <= W_STATE_IDLE;
                endcase
            end
           
        end
    end

    // Read State Machine
    always @(posedge clock) begin
        if (reset) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
            if (r_valid) begin
                case (r_state)
                    R_STATE_IDLE:               r_state <= R_STATE_ADDR;
                    R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ: if (r_done)   r_state <= R_STATE_IDLE;
                    default:;
                endcase
            end
            
        end
    end
    

  //if_ready  if_data_read  if_resp 
  reg        if_ready_r;
  reg [1:0]  if_resp_r;

  always @(posedge clock ) begin
      if (reset) 
          if_ready_r <= 1'b0;
      else if (r_done)
          if_ready_r <= 1'b1;
      else
          if_ready_r <= 1'b0;
  end
  assign  if_ready  =  if_ready_r;

  always @(posedge clock ) begin
      if (reset) 
          if_resp_r <= 2'b0;
      else if (r_done)
          if_resp_r <= axi_r_resp_i;
  end
  assign  if_resp  =  if_resp_r;

  

  always @(posedge clock ) begin
      if (reset) 
          if_data_read  <=  64'd0;
      else if (r_hs && (~ld_valid || (ld_valid && ~ld_pause) || skip ) && (~id_bubble) )  // a beat transfer a data 
          if_data_read  <=  axi_r_data_i;
  end
    
 
  //ld_ready  ld_data_read  
  reg        ld_ready_r;

  always @(posedge clock) begin
      if (reset) 
          ld_ready_r <= 1'b0;
      else if (r_done && ld_valid)
          ld_ready_r <= 1'b1;
      else
          ld_ready_r <= 1'b0;
  end
  assign  ld_ready   =  ld_ready_r;



  always @(posedge clock ) begin
      if (reset) 
          ld_data_read  <=  64'd0;
      else if (ld_pause && r_hs && ld_valid)
          ld_data_read  <=  axi_r_data_i;
      else if (r_hs && ld_valid)
          ld_data_read  <=  ld_data_read;
      
  end

  assign  sd_ready   =  b_hs;

  


  
  

  // ------------------Number of transmission------------------
  reg  [7:0]  w_len_r;
  always @(posedge clock) begin
      if (reset)
          w_len_r  <= 0;
      else if ((w_len_r < axi_aw_len_o) && w_state_write)
          w_len_r  <= w_len_r +1'b1;
      else
          w_len_r  <= 0;
  end 

  reg  [7:0]  r_len_r;
  always @(posedge clock) begin
      if (reset)
          r_len_r  <= 0;
      else if ((r_len_r < axi_ar_len_o) && r_state_read)
          r_len_r  <= r_len_r +1'b1;
      else
          r_len_r  <= 0;
  end 

  ysyx_210746_axi_size_ctrl  u_axi_size_ctrl(
      .inst_data            (mem_inst_data),
      .skip                 (skip         ),

      .ld_pause_o           (ld_pause_o),

      .axi_aw_size          (axi_aw_size_o),
      .axi_ar_size          (axi_ar_size_o)        
  );



  // Write address channel signals
  wire  [3:0]  axi_id   =  4'b0;
    
  assign  axi_aw_valid_o   =  skip ? 0 : w_state_addr;

`ifdef DIFF_TEST
  assign  axi_aw_addr_o    =  skip ? 0 : {sd_addr[31:3],3'b0} ;
`else
  assign  axi_aw_addr_o    =  skip ? 0 : sd_addr[31:0] ;
`endif 

  assign  axi_aw_id_o      =  axi_id;
  
  assign  axi_aw_len_o     =  0;

`ifdef DIFF_TEST
  assign  axi_aw_prot_o    =  `ysyx_210746_AXI_PROT_UNPRIVILEGED_ACCESS | `ysyx_210746_AXI_PROT_SECURE_ACCESS | `ysyx_210746_AXI_PROT_DATA_ACCESS;
  wire    axi_user         =  1'b0;
  assign  axi_aw_user_o    =  axi_user;
  assign  axi_aw_lock_o    =  1'b0;
  assign  axi_aw_cache_o   =  `ysyx_210746_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
  assign  axi_aw_qos_o     =  4'h0;
  assign  axi_aw_region_o  = 4'b0;
`endif 

  assign  axi_aw_burst_o   =  `ysyx_210746_AXI_BURST_TYPE_INCR;
  
    

  // Write data channel signals
  assign  axi_w_valid_o    =  skip ? 0 : w_state_write;
  assign  axi_w_data_o     =  skip ? 0 : w_hs? sd_data : 0;  //?
  assign  axi_w_strb_o     =  (skip || ti_excep_r) ? 0 : sd_strb;
  assign  axi_w_last_o     =  skip ? 0 : (w_len_r == axi_aw_len_o) ? 1'b1 : 1'b0 ;

`ifdef DIFF_TEST  
  assign  axi_w_user_o     =  axi_user;
`endif   

  // Write response channel signals
  assign  axi_b_ready_o    =  w_state_resp;



  // Read address channel signals
  


  assign axi_ar_valid_o   = r_state_addr ;

  assign axi_ar_addr_o    = skip ?  if_addr[31:0]: ld_pause_o ? ld_addr[31:0]: if_addr[31:0]; 

  assign axi_ar_id_o      = 0;//select ld or if
  assign axi_ar_len_o     = 0;//????
  assign axi_ar_burst_o   = `ysyx_210746_AXI_BURST_TYPE_INCR;

`ifdef DIFF_TEST   
  assign axi_ar_lock_o    = 1'b0;
  assign axi_ar_cache_o   = `ysyx_210746_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE;
  assign axi_ar_qos_o     = 4'h0;
  assign axi_ar_prot_o    = `ysyx_210746_AXI_PROT_UNPRIVILEGED_ACCESS | `ysyx_210746_AXI_PROT_SECURE_ACCESS | `ysyx_210746_AXI_PROT_DATA_ACCESS;
  assign axi_ar_user_o    = 0;
  
  assign axi_ar_region_o  = 4'b0;
`endif   
 
  // Read data channel signals
  assign axi_r_ready_o    = r_state_read;



   // ------------------process axi_ar_addr------------------
  reg ar_addr_flag;
  
  always @(posedge clock) begin
      if (reset)
          ar_addr_flag  <= 0;
      else if (axi_ar_valid_o && ld_valid && ~skip)
          ar_addr_flag  <= ar_addr_flag + 1;
      else if (~ld_valid)
          ar_addr_flag  <= 0;
  end

  // ------------------process w_trans------------------
//   reg w_valid;
  
//   always @(posedge clock) begin
//       if (reset)
//           w_valid  <=  0;
//       else if (sd_valid)
//           w_valid  <=  1'b1;
//   end

endmodule








 
module ysyx_210746_bubble_gen (
    // input   [6:0]  inst_data,
    input          rs1_r_ena,
    input   [4:0]  rs1_r_addr,
    input          rs2_r_ena,
    input   [4:0]  rs2_r_addr,
    input          exe_rd_w_ena, 
    input   [4:0]  exe_rd_w_addr,
    input          exe_ld_en,

    
    output         id_bubble

    
);
  
 
 
   
  wire  id_bubble_rs1  =  ( ( exe_rd_w_addr == rs1_r_addr  ) && ( rs1_r_ena & exe_rd_w_ena & exe_ld_en ) && ( exe_rd_w_addr != 5'd0 ))   ?   1'b1  : 0;
    
  wire  id_bubble_rs2  =  ( ( exe_rd_w_addr == rs2_r_addr  ) && ( rs2_r_ena & exe_rd_w_ena & exe_ld_en ) && ( exe_rd_w_addr != 5'd0 ))   ?   1'b1  : 0;

  assign  id_bubble  =  id_bubble_rs1 || id_bubble_rs2;

               

endmodule 

module ysyx_210746_clint(
    input                 clk,
    input                 rst,
    input                 wr_en,
    input                 rd_en,
    
    input        [63:0]   reg_addr,
    input        [63:0]   w_data,

   
    output  reg  [63:0]   rd_data,
    output  wire          clint_msip,
    output  wire          clint_mtip 


  );


  reg   [63:0]   msip_r;     // 0x0200_0000
  reg   [63:0]   mtime_r;    // 0x0200_4000
  reg   [63:0]   mtimecmp_r; // 0x0200_BFF8
 
  
  assign  clint_msip    = msip_r[0];
  assign  clint_mtip    = (mtime_r >= mtimecmp_r) ? 1'b1 : 1'b0 ;
  

  always @(posedge clk) begin
      if (rst == 1'b1)
          mtime_r  <= 0;
      else if(wr_en == 1'b1 && reg_addr == 64'h0200_4000)
          mtime_r  <= w_data;
      else 
          mtime_r  <= mtime_r + 1;
  end

  always @(posedge clk) begin
      if (rst == 1'b1) begin
          msip_r  <=  0;
          mtimecmp_r <=  64'h1_0000;
      end
      else if(wr_en == 1'b1)
          case(reg_addr)
              64'h0200_0000:  msip_r      <=  w_data;
              64'h0200_BFF8:  mtimecmp_r  <=  w_data;
              default:;
          endcase
      else if (mtime_r >= mtimecmp_r)
          mtimecmp_r  <=  mtimecmp_r + 100000; 
      
  end

  always @(*) begin
      if (rd_en)
          case(reg_addr)
              64'h0200_0000:  rd_data      =  msip_r;
              64'h0200_4000:  rd_data      =  mtime_r;
              64'h0200_BFF8:  rd_data      =  mtimecmp_r;
              default:        rd_data      =  64'd0;
          endcase
      else
          rd_data      =  64'd0;
  end
  endmodule

   

  module ysyx_210746_continuous (
      input          clk,
      input          rst,
      input          fetched,
      input          ld_valid,
      input          ld_hs,
      

      output         con_ld
    //   output         con_sd 
  );

  reg          ld_hs_r;
//   reg          ld_en_r;
  
  always @(posedge clk) begin
      if (rst == 1'b1)
          ld_hs_r <= 0;
      else if (fetched)
          ld_hs_r <= ld_hs;
  end    

    
      

  assign  con_ld  = ( (ld_hs_r == 1) && (ld_valid == 1) ) ? 1'b1 : 0;
//   assign  con_sd  =  (inst == inst_r) ?  0 : ((sd_en == sd_en_r && 1) ? 1 : 0 );

  endmodule
  
 
module ysyx_210746_csr_data_mux(
    input        [1 :0]   mstatus_mux,
    input        [1 :0]   mepc_mux,
    input        [1 :0]   mcause_mux,
    input        [1 :0]   csr_data_mux,
    input        [11:0]   id_imm,

    input        [63:0]   id_csr_data,
    input        [63:0]   id_mstatus,
    input        [63:0]   id_mepc,
    input        [63:0]   id_mcause,

    input        [63:0]   exe_csr_data,
    input        [63:0]   exe_mstatus,
    input        [63:0]   exe_mepc,
    input        [63:0]   exe_mcause,

    input        [63:0]   mem_csr_data,
    input        [63:0]   mem_mstatus,
    input        [63:0]   mem_mepc,
    input        [63:0]   mem_mcause,

    input        [63:0]   wb_csr_data,
    input        [63:0]   wb_mstatus,
    input        [63:0]   wb_mepc,
    input        [63:0]   wb_mcause,


    output  reg  [63:0]   mstatus_r_o,
    output  reg  [63:0]   mepc_r_o,
    output  reg  [63:0]   mcause_r_o,
    output  reg  [63:0]   csr_data_o

);
 

  always @(*) begin
      case (mstatus_mux)
         2'b11:    mstatus_r_o  =  exe_mstatus;
         2'b10:    mstatus_r_o  =  mem_mstatus;
         2'b01:    mstatus_r_o  =  wb_mstatus;
         default:  mstatus_r_o  =  id_mstatus;
      endcase
  end

  always @(*) begin
      case (mepc_mux)
         2'b11:    mepc_r_o  =  exe_mepc;
         2'b10:    mepc_r_o  =  mem_mepc;
         2'b01:    mepc_r_o  =  wb_mepc;
         default:  mepc_r_o  =  id_mepc;
      endcase
  end

  always @(*) begin
      case (mcause_mux)
         2'b11:    mcause_r_o  =  exe_mcause;
         2'b10:    mcause_r_o  =  mem_mcause;
         2'b01:    mcause_r_o  =  wb_mcause;
         default:  mcause_r_o  =  id_mcause;
      endcase
  end

  always @(*) begin
      case (id_imm)
          12'h300:  if( csr_data_mux == 2'b11 )
                        csr_data_o = exe_mstatus;
                    else if( csr_data_mux == 2'b10 )
                        csr_data_o = mem_mstatus;
                    else if( csr_data_mux == 2'b01 )
                        csr_data_o = wb_mstatus;    
                    else
                        csr_data_o = id_mstatus;
          
          12'h341:  if( csr_data_mux == 2'b11 )
                        csr_data_o = exe_mepc;
                    else if( csr_data_mux == 2'b10 )
                        csr_data_o = mem_mepc;
                    else if( csr_data_mux == 2'b01 )
                        csr_data_o = wb_mepc;    
                    else
                        csr_data_o = id_mepc;
          
          12'h342:  if( csr_data_mux == 2'b11 )
                        csr_data_o = exe_mcause;
                    else if( csr_data_mux == 2'b10 )
                        csr_data_o = mem_mcause;
                    else if( csr_data_mux == 2'b01 )
                        csr_data_o = wb_mcause;    
                    else
                        csr_data_o = id_mcause;

         default:  if( csr_data_mux == 2'b11 )
                        csr_data_o = exe_csr_data;
                    else if( csr_data_mux == 2'b10 )
                        csr_data_o = mem_csr_data;
                    else if( csr_data_mux == 2'b01 )
                        csr_data_o = wb_csr_data;    
                    else
                        csr_data_o = id_csr_data;
      endcase
  end

  

  endmodule 
module ysyx_210746_csr_exe_bypass(
    input               id_csr_wr_en,
    input               exe_csr_wr_en,
    input               mem_csr_wr_en,
    input               wb_csr_wr_en,
    input      [6:0]    id_inst_data,
    input      [6:0]    exe_inst_data,
    input      [6:0]    mem_inst_data,
    input      [6:0]    wb_inst_data,
    
    input      [11:0]   id_imm,
    input      [11:0]   exe_imm,
    input      [11:0]   mem_imm,
    input      [11:0]   wb_imm,
    
    

    output  reg [1:0]   mstatus_mux,
    output  reg [1:0]   mepc_mux,
    output  reg [1:0]   mcause_mux,
    output  reg [1:0]   csr_data_mux

);
  parameter ECALL = 7'd56, EBREAK = 7'd57, MRET = 7'd58;

  wire  id_eem_inst_data   =  (id_inst_data  ==  ECALL) || (id_inst_data  ==  EBREAK) || (id_inst_data  ==  MRET);
  wire  id_ee_inst_data    =  (id_inst_data  ==  ECALL) || (id_inst_data  ==  EBREAK) ;
  wire  exe_eem_inst_data  =  (exe_inst_data ==  ECALL) || (exe_inst_data ==  EBREAK) || (exe_inst_data ==  MRET);
  wire  exe_ee_inst_data   =  (exe_inst_data ==  ECALL) || (exe_inst_data ==  EBREAK) ;
  wire  mem_eem_inst_data  =  (mem_inst_data ==  ECALL) || (mem_inst_data ==  EBREAK) || (mem_inst_data ==  MRET);
  wire  mem_ee_inst_data   =  (mem_inst_data ==  ECALL) || (mem_inst_data ==  EBREAK) ;
  wire  wb_eem_inst_data   =  (wb_inst_data ==  ECALL ) || (wb_inst_data ==  EBREAK ) || (wb_inst_data ==  MRET);
  wire  wb_ee_inst_data    =  (wb_inst_data ==  ECALL ) || (wb_inst_data ==  EBREAK ) ;
  
  //mstatus_mux
  always @(*) begin
      if(id_eem_inst_data)begin
          if( (exe_eem_inst_data || (exe_imm == 12'h300)) & (id_csr_wr_en & exe_csr_wr_en) )
              mstatus_mux = 2'b11;
          else if( (mem_eem_inst_data || (mem_imm == 12'h300)) & (id_csr_wr_en & mem_csr_wr_en) )
              mstatus_mux = 2'b10;
          else if( (wb_eem_inst_data || (wb_imm == 12'h300)) & (id_csr_wr_en & wb_csr_wr_en) )
              mstatus_mux = 2'b01;    
          else
              mstatus_mux = 2'b00;
      end
      else
          mstatus_mux = 2'b00;   
  end

//mepc_mux
  always @(*) begin
      if(id_ee_inst_data)begin
          if( (exe_ee_inst_data || (exe_imm == 12'h341)) & (id_csr_wr_en & exe_csr_wr_en) )
              mepc_mux = 2'b11;
          else if( (mem_ee_inst_data || (mem_imm == 12'h341)) & (id_csr_wr_en & mem_csr_wr_en) )
              mepc_mux = 2'b10;
          else if( (wb_ee_inst_data || (wb_imm == 12'h341)) & (id_csr_wr_en & wb_csr_wr_en) )
              mepc_mux = 2'b01;    
          else
              mepc_mux = 2'b00;
      end
      else
          mepc_mux = 2'b00;   
  end

//mcause_mux
  always @(*) begin
      if(id_ee_inst_data)begin
          if( (exe_ee_inst_data || (exe_imm == 12'h342)) & (id_csr_wr_en & exe_csr_wr_en) )
              mcause_mux = 2'b11;
          else if( (mem_ee_inst_data || (mem_imm == 12'h342)) & (id_csr_wr_en & mem_csr_wr_en) )
              mcause_mux = 2'b10;
          else if( (wb_ee_inst_data || (wb_imm == 12'h342)) & (id_csr_wr_en & wb_csr_wr_en) )
              mcause_mux = 2'b01;    
          else
              mcause_mux = 2'b00;
      end
      else
          mcause_mux = 2'b00;   
  end
  
//csr_data_mux
  always @(*) begin
      case(id_imm) 
          12'h300:  if( (exe_eem_inst_data || (exe_imm == 12'h300)) & (id_csr_wr_en & exe_csr_wr_en) )
                        csr_data_mux = 2'b11;
                    else if( (mem_eem_inst_data || (mem_imm == 12'h300)) & (id_csr_wr_en & mem_csr_wr_en) )
                        csr_data_mux = 2'b10;
                    else if( (wb_eem_inst_data || (wb_imm == 12'h300)) & (id_csr_wr_en & wb_csr_wr_en) )
                        csr_data_mux = 2'b01;    
                    else
                        csr_data_mux = 2'b00;
          


          12'h341:  if( (exe_ee_inst_data || (exe_imm == 12'h341)) & (id_csr_wr_en & exe_csr_wr_en) )
                        csr_data_mux = 2'b11;
                    else if( (mem_ee_inst_data || (mem_imm == 12'h341)) & (id_csr_wr_en & mem_csr_wr_en) )
                        csr_data_mux = 2'b10;
                    else if( (wb_ee_inst_data || (wb_imm == 12'h341)) & (id_csr_wr_en & wb_csr_wr_en) )
                        csr_data_mux = 2'b01;    
                    else
                        csr_data_mux = 2'b00;
          12'h342:  if( (exe_ee_inst_data || (exe_imm == 12'h342)) & (id_csr_wr_en & exe_csr_wr_en) )
                        csr_data_mux = 2'b11;
                    else if( (mem_ee_inst_data || (mem_imm == 12'h342)) & (id_csr_wr_en & mem_csr_wr_en) )
                        csr_data_mux = 2'b10;
                    else if( (wb_ee_inst_data || (wb_imm == 12'h342)) & (id_csr_wr_en & wb_csr_wr_en) )
                        csr_data_mux = 2'b01;    
                    else
                        csr_data_mux = 2'b00;


          default:  if((exe_imm == id_imm) & (id_csr_wr_en & exe_csr_wr_en) )
                        csr_data_mux = 2'b11;
                    else if( (mem_imm == id_imm) & (id_csr_wr_en & mem_csr_wr_en) )
                        csr_data_mux = 2'b10;
                    else if( (wb_imm == id_imm) & (id_csr_wr_en & wb_csr_wr_en) )
                        csr_data_mux = 2'b01;    
                    else
                        csr_data_mux = 2'b00;

           endcase

  end

  endmodule 
module ysyx_210746_csr_exe_data_mux(
    input      [6 :0]    inst_data,
    input      [11:0]    exe_imm,
    input                exe_csr_wr_ena,
    
    
    input      [63:0]   exe_mstatus_r,
    input      [63:0]   exe_mepc_r,
    input      [63:0]   exe_mcause_r,
    input      [63:0]   csr_mstatus_r,
    input      [63:0]   csr_mepc_r,
    input      [63:0]   csr_mcause_r,
    input      [63:0]   csr_wr_data,

    output  reg  [63:0]   mstatus_r_o,
    output  reg  [63:0]   mepc_r_o,
    output  reg  [63:0]   mcause_r_o
);
  parameter ECALL = 7'd56, EBREAK = 7'd57, MRET = 7'd58;

  always @(*) begin
      case (inst_data)
          ECALL,EBREAK,MRET: begin
              mstatus_r_o  =  csr_mstatus_r;
          end
          default: if( (exe_imm == 12'h300) && (exe_csr_wr_ena) )
                       mstatus_r_o  =  csr_wr_data;
                   else
                       mstatus_r_o  =  exe_mstatus_r;
      endcase
  end

  always @(*) begin
      case (inst_data)
          ECALL,EBREAK: begin
              mepc_r_o     =  csr_mepc_r;
          end

          MRET:begin
              mepc_r_o     =  exe_mepc_r;
          end
          default: if ( (exe_imm == 12'h341) && (exe_csr_wr_ena) )
                       mepc_r_o     =  csr_wr_data;
                   else
                       mepc_r_o     =  exe_mepc_r;  
      endcase
  end

  always @(*) begin
      case (inst_data)
          ECALL,EBREAK: begin
              mcause_r_o   =  csr_mcause_r;
          end
          MRET:begin
              mcause_r_o   =  exe_mcause_r;
          end
          default: if ( (exe_imm == 12'h342) && (exe_csr_wr_ena) )
                       mcause_r_o     =  csr_wr_data;
                   else
                       mcause_r_o     =  exe_mcause_r;
      endcase
  end

  

  endmodule 
module ysyx_210746_csr_exe_stage(
    input               csr_wr_ena,
    input       [4:0]   rs1_r_addr,
    input       [6:0]   inst_data,
    input       [11:0]  imm,
    input       [63:0]  r_data1,
    input       [63:0]  pc,
    
    input      [63:0]   mstatus_r,
    input      [63:0]   mepc_r,
    
    input      [63:0]   mcause_r,
    

    input      [63:0]   exe_rd_csr_data,

    output reg [63:0]   csr_mepc_r,
    output reg [63:0]   csr_mcause_r,
    output reg [63:0]   csr_mstatus_r,
    output reg [63:0]   csr_wr_data  
    
);

  wire  [63:0]  r1_or_mstatus , zimm_data;

  parameter CSRRW = 7'd50, CSRRS = 7'd51, CSRRC = 7'd52, CSRRWI = 7'd53, CSRRSI = 7'd54, CSRRCI = 7'd55;
  parameter ECALL = 7'd56, EBREAK = 7'd57, MRET = 7'd58;

  assign  r1_or_mstatus =  (r_data1 | mstatus_r); 
  assign  zimm_data     =  {59'b0,rs1_r_addr};

  always @(*) begin
    if(csr_wr_ena) 
        case(inst_data)
           ECALL:   begin
                             csr_mepc_r      =  pc  ;
                             csr_mcause_r    =  64'h0000_0000_0000_000b;
                             csr_mstatus_r   =  {56'h18,mstatus_r[3],7'b0};
                             csr_wr_data     =  64'd0;
           end
           EBREAK:  begin
                             csr_mepc_r      =  pc;
                             csr_mcause_r    =  64'h3;
                             csr_mstatus_r   =  {56'h18,mstatus_r[3],7'b0};
                             csr_wr_data     =  64'd0;
           end               
           MRET:    begin
                        if ( mstatus_r[14:13]==2'b11)                  
                            csr_mstatus_r   =  {mstatus_r[63:13],2'b00,3'b0,1'b1,3'b0,mstatus_r[7],3'b000};
                        else 
                            csr_mstatus_r   =  {56'b0,1'b1,3'b0,mstatus_r[7],3'b0};
                        csr_wr_data           =  64'd0;
                        csr_mepc_r            =  64'd0;
                        csr_mcause_r          =  64'd0;
           end

           CSRRW:   begin
                        csr_mepc_r            =  64'd0;
                        csr_mcause_r          =  64'd0;
                        csr_mstatus_r         =  64'd0;
                   case(imm) 
                       12'h300:  if (r_data1[14:13]==2'b11 )
                                     csr_wr_data   =  {1'b1,r_data1[62:0]};
                                 else
                                     csr_wr_data   =  r_data1;
                       12'h341:  csr_wr_data       =  r_data1;
                       12'h343:  csr_wr_data       =  r_data1;
                       12'h305:  csr_wr_data       =  r_data1;
                       12'h342:  csr_wr_data       =  r_data1;
                       12'h304:  csr_wr_data       =  r_data1;
                       12'h340:  csr_wr_data       =  r_data1;
                       12'h303:  csr_wr_data       =  r_data1;
                       12'h302:  csr_wr_data       =  r_data1;
                       default:  csr_wr_data       =  64'd0;
           endcase
           end
           CSRRS:   begin
                        csr_mepc_r            =  64'd0;
                        csr_mcause_r          =  64'd0;
                        csr_mstatus_r         =  64'd0;
                   case(imm)
                       12'h300:  if (r1_or_mstatus[13:12]==2'b11 || r1_or_mstatus[15:14]==2'b11)
                                     csr_wr_data   =  {1'b1,r1_or_mstatus[62:0]};
                                 else
                                     csr_wr_data   =  r1_or_mstatus;      
                       12'h341:  csr_wr_data       =  (r_data1 | mepc_r);
                       12'h343:  csr_wr_data       =  (r_data1 | exe_rd_csr_data);
                       12'h305:  csr_wr_data       =  (r_data1 | exe_rd_csr_data);
                       12'h342:  csr_wr_data       =  (r_data1 | mcause_r);
                       12'h304:  csr_wr_data       =  (r_data1 | exe_rd_csr_data);
                       12'h340:  csr_wr_data       =  (r_data1 | exe_rd_csr_data);
                       12'h303:  csr_wr_data       =  (r_data1 | exe_rd_csr_data);
                       12'h302:  csr_wr_data       =  (r_data1 | exe_rd_csr_data);
                       default:  csr_wr_data       =  64'd0;
           endcase
           end
           CSRRC:   begin
                        csr_mepc_r            =  64'd0;
                        csr_mcause_r          =  64'd0;
                        csr_mstatus_r         =  64'd0;
                   case(imm)
                       12'h300:  csr_wr_data       =  ((~r_data1) & mstatus_r);
                       12'h341:  csr_wr_data       =  ((~r_data1) & mepc_r);
                       12'h343:  csr_wr_data       =  ((~r_data1) & exe_rd_csr_data);
                       12'h305:  csr_wr_data       =  ((~r_data1) & exe_rd_csr_data);
                       12'h342:  csr_wr_data       =  ((~r_data1) & mcause_r);
                       12'h304:  csr_wr_data       =  ((~r_data1) & exe_rd_csr_data);
                       12'h340:  csr_wr_data       =  ((~r_data1) & exe_rd_csr_data);
                       12'h303:  csr_wr_data       =  ((~r_data1) & exe_rd_csr_data);
                       12'h302:  csr_wr_data       =  ((~r_data1) & exe_rd_csr_data);
                       default:  csr_wr_data       =  64'd0;
           endcase
           end
           CSRRWI: begin
                        csr_mepc_r            =  64'd0;
                        csr_mcause_r          =  64'd0;
                        csr_mstatus_r         =  64'd0;
                   case(imm)
                       12'h300:  csr_wr_data       =  zimm_data;
                       12'h341:  csr_wr_data       =  zimm_data;
                       12'h343:  csr_wr_data       =  zimm_data;
                       12'h305:  csr_wr_data       =  zimm_data;
                       12'h342:  csr_wr_data       =  zimm_data;
                       12'h304:  csr_wr_data       =  zimm_data;
                       12'h340:  csr_wr_data       =  zimm_data;
                       12'h303:  csr_wr_data       =  zimm_data;
                       12'h302:  csr_wr_data       =  zimm_data;
                       
                       default:  csr_wr_data       =  64'd0;
           endcase
           end
           CSRRSI: begin
                        csr_mepc_r            =  64'd0;
                        csr_mcause_r          =  64'd0;
                        csr_mstatus_r         =  64'd0;
                   case(imm)
                       12'h300:  csr_wr_data       =  (zimm_data | mstatus_r);
                       12'h341:  csr_wr_data       =  (zimm_data | mepc_r);
                       12'h343:  csr_wr_data       =  (zimm_data | exe_rd_csr_data);
                       12'h305:  csr_wr_data       =  (zimm_data | exe_rd_csr_data);
                       12'h342:  csr_wr_data       =  (zimm_data | mcause_r);
                       12'h304:  csr_wr_data       =  (zimm_data | exe_rd_csr_data);
                       12'h340:  csr_wr_data       =  (zimm_data | exe_rd_csr_data);
                       12'h303:  csr_wr_data       =  (zimm_data | exe_rd_csr_data);
                       12'h302:  csr_wr_data       =  (zimm_data | exe_rd_csr_data);
                       default:  csr_wr_data       =  64'd0;
           endcase
           end
           CSRRCI: begin
                        csr_mepc_r            =  64'd0;
                        csr_mcause_r          =  64'd0;
                        csr_mstatus_r         =  64'd0;
                   case(imm)
                       12'h300:  csr_wr_data       =  ((~zimm_data) & exe_rd_csr_data);//**
                       12'h341:  csr_wr_data       =  ((~zimm_data) & mepc_r);
                       12'h343:  csr_wr_data       =  ((~zimm_data) & exe_rd_csr_data);
                       12'h305:  csr_wr_data       =  ((~zimm_data) & exe_rd_csr_data);
                       12'h342:  csr_wr_data       =  ((~zimm_data) & mcause_r);
                       12'h304:  csr_wr_data       =  ((~zimm_data) & exe_rd_csr_data);
                       12'h340:  csr_wr_data       =  ((~zimm_data) & exe_rd_csr_data);
                       12'h303:  csr_wr_data       =  ((~zimm_data) & exe_rd_csr_data);
                       12'h302:  csr_wr_data       =  ((~zimm_data) & exe_rd_csr_data);
                       default:  csr_wr_data       =  64'd0;
           endcase
           end
           default: begin
                        csr_wr_data           =  64'd0;
                        csr_mepc_r            =  64'd0;
                        csr_mcause_r          =  64'd0;
                        csr_mstatus_r         =  64'd0;
           end
           endcase
  
    else  begin
                        csr_wr_data           =  64'd0;
                        csr_mepc_r            =  64'd0;
                        csr_mcause_r          =  64'd0;
                        csr_mstatus_r         =  64'd0;
          end
  end
  endmodule 

module ysyx_210746_csr_reg(
    input               clk,
    input               rst,
    input               clint_msip,
    input               clint_mtip,
    input               csr_rd_ena,//要是读的值还没写回来，就需要旁路
    input               csr_wr_ena,
    input       [6:0]   inst_data,
    input       [11:0]  wr_imm,
    input       [11:0]  rd_imm,
    // input       [31:0]  inst,
    input       [`YSYX210746_RW_ADDR_WIDTH-1:0]  intr_pc,
    input       [63:0]  csr_wr_data,
    

    input               inst_valid,
    
    output              ti_excep,
    output  reg [63:0]  csr_data,
    
    
    //output wire [`YSYX210746_REG_BUS] regs_o[0 : 31]        // difftest
    output      [63:0]  mstatus_r_o,
    output      [63:0]  mepc_r_o,
    output      [63:0]  mtvec_r_o,
    output      [63:0]  mcause_r_o
 
);

  parameter CSRRW = 7'd50, CSRRS = 7'd51, CSRRC = 7'd52, CSRRWI = 7'd53, CSRRSI = 7'd54, CSRRCI = 7'd55;
  parameter ECALL = 7'd56, EBREAK = 7'd57, MRET = 7'd58;
 // 32 registers
  wire              si_excep;
   
  reg  [63:0]  mstatus_r;  //0x300  MRW
  reg  [63:0]  medeleg_r;  //0x302
  reg  [63:0]  mideleg_r;  //0x303
  reg  [63:0]  mie_r;      //0x304
  reg  [63:0]  mtvec_r;    //0x305
  reg  [63:0]  mscratch_r; //0x340
  reg  [63:0]  mepc_r;     //0x341
  reg  [63:0]  mcause_r;   //0x342
  reg  [63:0]  mtval_r;    //0x343  mbadaddr_addr
  reg  [63:0]  mip_r;      //0x344


  assign  si_excep      =  ((mie_r[3]==1'b1) && (mip_r[3]==1'b1) && (mstatus_r[3]==1'b1));
  assign  ti_excep      =  ((mie_r[7]==1'b1) && (mip_r[7]==1'b1) && (mstatus_r[3]==1'b1));

  always @(posedge clk) begin
      if ( rst == 1'b1 ) begin
          mstatus_r   <= `YSYX210746_ZERO_WORD;
          mtvec_r     <= `YSYX210746_ZERO_WORD;
          medeleg_r   <= `YSYX210746_ZERO_WORD;
          mideleg_r   <= `YSYX210746_ZERO_WORD;      
          mie_r       <= `YSYX210746_ZERO_WORD;
          mscratch_r  <= `YSYX210746_ZERO_WORD;
          mepc_r      <= `YSYX210746_ZERO_WORD;
          mcause_r    <= `YSYX210746_ZERO_WORD;
          mtval_r     <= `YSYX210746_ZERO_WORD;
      end
      else if(ti_excep || si_excep) begin
          mepc_r      <=  intr_pc;
          //mstatus
          if (mstatus_r [14:13]==2'b11)
              mstatus_r   <=  {mstatus_r[63:13],2'b11,3'b0,1'b1,3'b0,4'b0} ;
          else
              mstatus_r   <=  {56'h18,mstatus_r[3],7'b0};//machine

          //mcause_r
          if (ti_excep)
              mcause_r   <=  {1'b1,63'h7};
          else
              mcause_r   <=  {1'b1,63'h3};
          
          //mtval
              
      end

      else if(csr_wr_ena & inst_valid  )
          case(inst_data)
           ECALL:   begin
                             mepc_r      <=  intr_pc  ;
                             mcause_r    <=  64'h0000_0000_0000_000b;
                             mstatus_r   <=  {56'h18,mstatus_r[3],7'b0};
           end
           EBREAK:  begin
                             mepc_r      <=  intr_pc;
                             mcause_r    <=  64'h3;
                             mstatus_r   <=  {56'h18,mstatus_r[3],7'b0};
           end               
           MRET:    begin
                        if ( mstatus_r[14:13]==2'b11)                  
                            mstatus_r   <=  {mstatus_r[63:13],2'b00,3'b0,1'b1,3'b0,mstatus_r[7],3'b000};
                        else 
                            mstatus_r   <=  {56'b0,1'b1,3'b0,mstatus_r[7],3'b0};
           end

           CSRRW,CSRRS,CSRRC,CSRRWI,CSRRSI,CSRRCI:  
                    case(wr_imm) 
                       12'h300:  mstatus_r   <=  csr_wr_data;
                       12'h341:  mepc_r      <=  csr_wr_data;
                       12'h343:  mtval_r     <=  csr_wr_data;
                       12'h305:  mtvec_r     <=  csr_wr_data;
                       12'h342:  mcause_r    <=  csr_wr_data;
                       12'h304:  mie_r       <=  csr_wr_data;
                       12'h340:  mscratch_r  <=  csr_wr_data;
                       12'h303:  mideleg_r   <=  csr_wr_data;
                       12'h302:  medeleg_r   <=  csr_wr_data;
                       default:  begin
                                     mstatus_r   <= mstatus_r;
                                     mtvec_r     <= mtvec_r;
                                     medeleg_r   <= medeleg_r;
                                     mideleg_r   <= mideleg_r;      
                                     mie_r       <= mie_r;
                                     mscratch_r  <= mscratch_r;
                                     mepc_r      <= mepc_r;
                                     mcause_r    <= mcause_r;
                                     mtval_r     <= mtval_r;
                       end
           endcase
           default: begin
                                     mstatus_r   <= mstatus_r;
                                     mtvec_r     <= mtvec_r;
                                     medeleg_r   <= medeleg_r;
                                     mideleg_r   <= mideleg_r;      
                                     mie_r       <= mie_r;
                                     mscratch_r  <= mscratch_r;
                                     mepc_r      <= mepc_r;
                                     mcause_r    <= mcause_r;
                                     mtval_r     <= mtval_r;
                       end
  endcase
  end

//mip_r config  only read
  always @(posedge clk) begin
      if (rst == 1'b1) 
          mip_r     <=  `YSYX210746_ZERO_WORD;
	  else if(clint_msip)
          mip_r[3]  <=  1'b1;
      else if(clint_mtip)
          mip_r[7]  <=  1'b1;
      else
          mip_r     <=  0; // remember clear zero
  end


//用于与rs1_addr交换数据
  always @(*) begin
		if (rst == 1'b1) begin
            csr_data   = `YSYX210746_ZERO_WORD;
        end
		else if (csr_rd_ena == 1'b1)
             case (rd_imm)
                 12'h300:  csr_data   = mstatus_r   ;
                 12'h341:  csr_data   = mepc_r      ;
                 12'h343:  csr_data   = mtval_r     ;
                 12'h305:  csr_data   = mtvec_r     ;
                 12'h342:  csr_data   = mcause_r    ;
                 12'h304:  csr_data   = mie_r       ;
                 12'h344:  csr_data   = mip_r       ;
                 12'h340:  csr_data   = mscratch_r  ;
                //  12'hB00:  csr_data   = mcycle_r    ;
                 12'h303:  csr_data   = mideleg_r   ;
                 12'h302:  csr_data   = medeleg_r   ;
                default:   csr_data   = 64'd0       ;
            endcase
		else
			csr_data = `YSYX210746_ZERO_WORD;
  end


//用于提交  
  assign  mstatus_r_o =   
                        ((ti_excep == 1'b1)  || (si_excep == 1'b1)) ? ( (mstatus_r[14:13]==2'b11 ) ? {mstatus_r[63:13],2'b11,3'b0,1'b1,3'b0,4'b0} : {56'h18,mstatus_r[3],7'b0} ): 
                        inst_valid  ?                       
                        (  ((inst_data == ECALL)  || (inst_data == EBREAK)) ?  {56'h18,mstatus_r[3],7'b0} : 
                          (inst_data == MRET) ?  ( (mstatus_r[14:13]==2'b11 ) ? {mstatus_r[63:13],2'b00,3'b0,1'b1,3'b0,mstatus_r[7],3'b000} : {56'b0,1'b1,3'b0,mstatus_r[7],3'b0} ):
                          ((csr_wr_ena==1'b1) && (wr_imm == 12'h300)) ?  csr_wr_data :  mstatus_r )
                          : mstatus_r; 

  assign  mepc_r_o    =   
                        ((ti_excep == 1'b1)  || (si_excep == 1'b1)) ?  intr_pc:  //intr_pc+4?
                        inst_valid  ?
                        (  ((inst_data == ECALL)  || (inst_data == EBREAK)) ?  intr_pc : 
                          ((csr_wr_ena==1'b1) && (wr_imm == 12'h341)) ?  csr_wr_data : mepc_r ) 
                          : mepc_r ;


  assign  mcause_r_o  =   
                          (ti_excep == 1'b1) ?  {1'b1,63'h7} :
                          (si_excep == 1'b1) ?  {1'b1,63'h3} :
                        inst_valid  ?  
                        (  (inst_data == ECALL) ?   64'h0000_0000_0000_000b : 
                          (inst_data == EBREAK) ?  64'h3 :
                          ((csr_wr_ena==1'b1) && (wr_imm == 12'h342)) ?  csr_wr_data : mcause_r ) 
                          : mcause_r ;

  assign  mtvec_r_o   =   inst_valid  ?
                          ( ((csr_wr_ena==1'b1) && (wr_imm == 12'h305)) ?  csr_wr_data : mtvec_r )
                          : mtvec_r;


  endmodule         


module ysyx_210746_dmem_ctrl(
      input         clk,
      input         rst,
 
      input         if_hs,
      input         skip,
    //   input         ti_excep,
      input         ti_excep_r,
      input         ti_pause,

      input  [7:0]  mem_mask,
      input  [31:0] mem_addr,
      input  [63:0] mem_wdata,
      
      input         ld_en,
      input         ld_ready,
      input         ld_pause,
      

      input         sd_en,
      input         sd_ready,

      output        clint_skip,
      output        ld_valid,
      output        ld_hs,
    //   output [1:0]  ld_size,
      output [31:0] ld_addr,

      output        sd_valid,
      output        clint_skip_sd,
    //   output        sd_hs,
    //   output [1:0]  sd_size,
      output [7:0]  sd_strb,
      output [31:0] sd_addr,
      output [63:0] sd_data
  );

  reg        ld_valid_r;
  reg        sd_valid_r;
  reg        sd_flag_r;

  reg [63:0] sd_data_r;
  
 
  assign  ld_hs       =  ld_ready  & ld_valid & ~ld_pause;  //保证在ld指令的最后时刻写入
  wire    sd_hs       =  sd_ready  & sd_valid;


  wire   clint_skip_ld = ld_en ? ( (32'h0200_ffff > ld_addr  && ld_addr >32'h0200_0000 )  ? 1 : 0 ) : 0;
  assign   clint_skip_sd = sd_en ? ( (32'h0200_ffff > sd_addr  && sd_addr >32'h0200_0000 ) 
                                    || (32'h3fff_ffff > sd_addr  && sd_addr >32'h3000_0000 )  ? 1 : 0 ) : 0;
  assign clint_skip  =  clint_skip_sd || clint_skip_ld ;




 

//   assign  ld_size  =  `SIZE_W;
//   assign  sd_size  =  `SIZE_W;
  

  always @(posedge clk) begin
      if (rst==1'b1)
          ld_valid_r <= 1'b0;
      else if (ld_hs || ti_excep_r)
          ld_valid_r <= 1'b0;
      else if (ld_en && ~skip && ~clint_skip)
          ld_valid_r <= 1'b1;
  end
  assign  ld_valid =   (ti_excep_r || ti_pause || skip || clint_skip ) ?  1'b0 : ld_en ? 1'b1 : ld_valid_r; 

  
  assign  ld_addr  =  mem_addr;

//-------------------------------
   always @(posedge clk) begin
      if (rst==1'b1)
          sd_flag_r <= 0;
      else if (sd_hs)
          sd_flag_r <= 1'b1;
      else if (if_hs)
          sd_flag_r <= 1'b0;
   end

   wire sd_flag  =  sd_hs ? 1'b1 :sd_flag_r; //(if_hs ? 1'b0 : sd_flag_r ) ;

  

  always @(posedge clk) begin
      if (rst==1'b1)
          sd_valid_r <= 1'b0;
      else if (sd_flag)
          sd_valid_r <= 1'b0;
      else if (sd_en)
          sd_valid_r <= 1'b1;    
  end
  assign  sd_valid =  sd_valid_r ;


  always @(posedge clk) begin
      if (rst==1'b1) begin
          sd_data_r <= 0;
      end
      else if (sd_en) begin
          sd_data_r <= mem_wdata;
      end
  end
  assign  sd_data  =  sd_data_r;
  assign  sd_addr  =  mem_addr;

  
  
  assign  sd_strb  =  (ti_excep_r || ti_pause || skip || clint_skip) ?  8'b0 : mem_mask;
  
endmodule
  
  




 

module ysyx_210746_dmem_rdata_mux(
    input         [6:0]  inst_data_i,
    input         [2:0] exe_data,
    input         [63:0] ld_data_read,
    
    output  reg   [63:0] dmem_rdata
);

  parameter LB = 7'd38, LH = 7'd39, LW = 7'd40 , LHU = 7'd41,LWU =7'd14 , LD =7'd15, LBU = 7'd49;//I_TYPE LOAD

  always @(*) begin
      case(inst_data_i)
      LD:      dmem_rdata = ld_data_read;
      LWU:         if (exe_data[2] == 0 )
                       dmem_rdata = {32'b0,ld_data_read[31:0]};
                   else
                       dmem_rdata = {32'b0,ld_data_read[63:32]}; 
   
      LW:          if  (exe_data[2] == 0 ) 
                       dmem_rdata = {{32{ld_data_read[31]}},ld_data_read[31:0]};
                   else 
                       dmem_rdata = {{32{ld_data_read[63]}},ld_data_read[63:32]};

      LH:  case(exe_data[2:1])
               2'b00:dmem_rdata = {{48{ld_data_read[15]}},ld_data_read[15:0]};
               2'b01:dmem_rdata = {{48{ld_data_read[31]}},ld_data_read[31:16]};
               2'b10:dmem_rdata = {{48{ld_data_read[47]}},ld_data_read[47:32]};
               2'b11:dmem_rdata = {{48{ld_data_read[63]}},ld_data_read[63:48]};
               default: dmem_rdata = 0;
           endcase   
      
      LHU:  case(exe_data[2:1])
               2'b00:dmem_rdata = {48'b0,ld_data_read[15:0]};
               2'b01:dmem_rdata = {48'b0,ld_data_read[31:16]};
               2'b10:dmem_rdata = {48'b0,ld_data_read[47:32]};
               2'b11:dmem_rdata = {48'b0,ld_data_read[63:48]};
               default: dmem_rdata = 0;
           endcase   

      LB:   case(exe_data[2:0])
               3'b000:dmem_rdata = {{56{ld_data_read[7]}},ld_data_read[7:0]};
               3'b001:dmem_rdata = {{56{ld_data_read[15]}},ld_data_read[15:8]};
               3'b010:dmem_rdata = {{56{ld_data_read[23]}},ld_data_read[23:16]};
               3'b011:dmem_rdata = {{56{ld_data_read[31]}},ld_data_read[31:24]};
               3'b100:dmem_rdata = {{56{ld_data_read[39]}},ld_data_read[39:32]};
               3'b101:dmem_rdata = {{56{ld_data_read[47]}},ld_data_read[47:40]};
               3'b110:dmem_rdata = {{56{ld_data_read[55]}},ld_data_read[55:48]};
               3'b111:dmem_rdata = {{56{ld_data_read[63]}},ld_data_read[63:56]};
               default: dmem_rdata = 0;
           endcase 

      LBU:   case(exe_data[2:0])
               3'b000:dmem_rdata = {56'b0,ld_data_read[7:0]};
               3'b001:dmem_rdata = {56'b0,ld_data_read[15:8]};
               3'b010:dmem_rdata = {56'b0,ld_data_read[23:16]};
               3'b011:dmem_rdata = {56'b0,ld_data_read[31:24]};
               3'b100:dmem_rdata = {56'b0,ld_data_read[39:32]};
               3'b101:dmem_rdata = {56'b0,ld_data_read[47:40]};
               3'b110:dmem_rdata = {56'b0,ld_data_read[55:48]};
               3'b111:dmem_rdata = {56'b0,ld_data_read[63:56]};
               default: dmem_rdata = 0;
           endcase         
     
      default: dmem_rdata = 0;
      endcase

  end

endmodule

   

module ysyx_210746_dmem_wdata_mux(
    input       [6:0]  inst_data,
    input       [63:0] r_data2,
    input       [63:0] exe_data,
    
    output      [63:0] dmem_addr,
    output reg  [7:0]  dmem_mask,
    output reg  [63:0] dmem_wdata
);


//   assign   dmem_addr =  (((exe_data - `YSYX210746_PC_START ) ) >64'hffff_ffff )?  0 : ((exe_data - `YSYX210746_PC_START ) ) ;
`ifdef DIFF_TEST
  assign   dmem_addr =  ((exe_data - `YSYX210746_PC_START ) ) ;
`else
  assign   dmem_addr =  exe_data    ;
`endif 
  
  parameter SB = 7'd31, SH = 7'd32, SW = 7'd33 , SD = 34;

  always @(*) begin
      case(inst_data)
      SD:  begin
              dmem_wdata = r_data2[63:0];
              dmem_mask  = 8'b1111_1111;
          end
      SW:  if(exe_data[2] == 1'b0) begin
               dmem_wdata = {32'b0,r_data2[31:0]};
               dmem_mask  = 8'b0000_1111;
           end  
           else begin
               dmem_wdata = {r_data2[31:0],32'b0};
               dmem_mask  = 8'b1111_0000;
           end

      SH:  case(exe_data[2:1])
               2'b00:begin
                   dmem_wdata = {48'b0,r_data2[15:0]};
                   dmem_mask  = 8'b0000_0011;
               end
               2'b01:begin
                   dmem_wdata = {32'b0,r_data2[15:0],16'b0};
                   dmem_mask  = 8'b0000_1100;
               end
               2'b10:begin
                   dmem_wdata = {16'b0,r_data2[15:0],32'b0};
                   dmem_mask  = 8'b0011_0000;
               end
               2'b11:begin
                   dmem_wdata = {r_data2[15:0],48'b0};
                   dmem_mask  = 8'b1100_0000;
               end

               default: begin
                   dmem_wdata = 64'd0;
                   dmem_mask  = 8'd0;
               end
           endcase   
      
      SB:  case(exe_data[2:0])
               3'b000:begin
                   dmem_wdata = {56'b0,r_data2[7:0]};
                   dmem_mask  = 8'b0000_0001;
               end
               3'b001:begin
                   dmem_wdata = {48'b0,r_data2[7:0],8'b0};
                   dmem_mask  = 8'b0000_0010;
               end
               3'b010:begin
                   dmem_wdata = {40'b0,r_data2[7:0],16'b0};
                   dmem_mask  = 8'b0000_0100;
               end
               3'b011:begin
                   dmem_wdata = {32'b0,r_data2[7:0],24'b0};
                   dmem_mask  = 8'b0000_1000;
               end
               3'b100:begin
                   dmem_wdata = {24'b0,r_data2[7:0],32'b0};
                   dmem_mask  = 8'b0001_0000;
               end
               3'b101:begin
                   dmem_wdata = {16'b0,r_data2[7:0],40'b0};
                   dmem_mask  = 8'b0010_0000;
               end
               3'b110:begin
                   dmem_wdata = {8'b0,r_data2[7:0],48'b0};
                   dmem_mask  = 8'b0100_0000;
               end
               3'b111:begin
                   dmem_wdata = {r_data2[7:0],56'b0};
                   dmem_mask  = 8'b1000_0000;
               end
               default: begin
                   dmem_wdata = 64'd0;
                   dmem_mask  = 8'd0;
               end
           endcase         
      default: begin
                   dmem_wdata = 64'd0;
                   dmem_mask  = 8'd0;
               end
  endcase

  end

endmodule
  
   

module ysyx_210746_exe_mem_reg (
    input               clk,
    input               rst,
    input               fetched,
    input               clear,
    input               exe_inst_valid,
    input               exe_skip,
    input               ld_pause,
    input      [`YSYX210746_RW_ADDR_WIDTH-1:0]   exe_pc,
    input      [31:0]   exe_inst,
    input               exe_jump_success,

    //id_stage
    input               exe_rd_w_ena,
    input      [4:0]    exe_rd_w_addr,   
    input               exe_csr_wr_ena,
    input               exe_csr_rd_ena,
    input               exe_ld_en,
    input               exe_sd_en,
    input      [6:0]    exe_inst_data,
    input      [11:0]   exe_imm,
  
    //csr_reg rd_mux
    input      [63:0]   exe_rd_csr_data,
    //csr_reg wr_mux
    input      [63:0]   exe_wr_mstatus,
    input      [63:0]   exe_wr_mcause,
    input      [63:0]   exe_wr_mepc,

    //exe_stage
    input      [63:0]   exe_data,
    //csr_exe_stage
    input      [63:0]   csr_wr_data,
    //reg_file
    // input      [63:0]   exe_r_data1,
    input      [63:0]   exe_r_data2, 
    
    output reg          mem_inst_valid,
    output reg          mem_skip,
    //pc
    output reg [`YSYX210746_RW_ADDR_WIDTH-1:0]   mem_pc,
    output reg [31:0]   mem_inst,
    output reg          mem_jump_success,

    //id_stage
    output reg          mem_rd_w_ena,
    output reg [4:0]    mem_rd_w_addr,   
    output reg          mem_csr_wr_ena,
    output reg          mem_csr_rd_ena,
    output reg          mem_ld_en,
    output reg          mem_sd_en,
    output reg [6:0]    mem_inst_data,
    output reg [11:0]   mem_imm,

    //csr_reg rd_mux
    output reg [63:0]   mem_rd_csr_data,
    //csr_reg wr_mux
    output reg [63:0]   mem_wr_mstatus,
    output reg [63:0]   mem_wr_mcause,
    output reg [63:0]   mem_wr_mepc,
    //exe_stage
    output reg [63:0]   mem_exe_data,
    //exe_stage
    output reg [63:0]   mem_csr_wr_data,
    //reg_file
    // output reg [63:0]   mem_r_data1,
    output reg [63:0]   mem_r_data2 
      
);

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          mem_pc           <=  `YSYX210746_PC_START ;
          mem_inst         <=  0;
          mem_inst_valid   <=  0;
          mem_skip         <=  0;
          mem_jump_success <=  0;
      end
      else if (fetched &&  clear) begin 
          mem_pc           <=  `YSYX210746_PC_START ;
          mem_inst         <=  0;
          mem_inst_valid   <=  0;
          mem_skip         <=  0;
          mem_jump_success <=  0;
      end
      else if (fetched && ld_pause) begin
          mem_pc           <=  mem_pc ;
          mem_inst         <=  mem_inst;
          mem_inst_valid   <=  mem_inst_valid;
          mem_skip         <=  mem_skip;
          mem_jump_success <=  mem_jump_success;
      end
      else if (fetched && ~clear) begin
          mem_pc           <=  exe_pc ;
          mem_inst         <=  exe_inst;
          mem_inst_valid   <=  exe_inst_valid;
          mem_skip         <=  exe_skip;
          mem_jump_success <=  exe_jump_success;
      end
      
  end

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          mem_rd_w_ena      <= 0;
          mem_rd_w_addr     <= 0;
          mem_csr_wr_ena    <= 0;
          mem_csr_rd_ena    <= 0;
          mem_ld_en         <= 0;
          mem_sd_en         <= 0;
      end
      else if (fetched &&  clear) begin 
          mem_rd_w_ena      <= 0;
          mem_rd_w_addr     <= 0;
          mem_csr_wr_ena    <= 0;
          mem_csr_rd_ena    <= 0;
          mem_ld_en         <= 0;
          mem_sd_en         <= 0;
      end   
      else if (fetched && ld_pause) begin
          mem_rd_w_ena      <= mem_rd_w_ena  ;
          mem_rd_w_addr     <= mem_rd_w_addr ;
          mem_csr_wr_ena    <= mem_csr_wr_ena;
          mem_csr_rd_ena    <= mem_csr_rd_ena;
          mem_ld_en         <= mem_ld_en;
          mem_sd_en         <= mem_sd_en;
      end
      else if (fetched && ~clear) begin
          mem_rd_w_ena      <= exe_rd_w_ena  ;
          mem_rd_w_addr     <= exe_rd_w_addr ;
          mem_csr_wr_ena    <= exe_csr_wr_ena;
          mem_csr_rd_ena    <= exe_csr_rd_ena;
          mem_ld_en         <= exe_ld_en;
          mem_sd_en         <= exe_sd_en;
      end
      
  end

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          mem_inst_data     <= 0;
        //   mem_inst_type     <= 0;
        //   mem_imm_shift     <= 0;
          mem_imm           <= 0;
      end
      else if (fetched &&  clear) begin 
          mem_inst_data     <= 0;
        //   mem_inst_type     <= 0;
        //   mem_imm_shift     <= 0;
          mem_imm           <= 0;
      end
      else if (fetched && ld_pause) begin
          mem_inst_data     <= mem_inst_data;
        //   mem_inst_type     <= mem_inst_type;
        //   mem_imm_shift     <= mem_imm_shift;
          mem_imm           <= mem_imm;
      end
      else if (fetched && ~clear) begin
          mem_inst_data     <= exe_inst_data;
        //   mem_inst_type     <= exe_inst_type;
        //   mem_imm_shift     <= exe_imm_shift;
          mem_imm           <= exe_imm;
      end
      
  end

//   always @(posedge clk ) begin
//       if (rst==1'b1) begin
//           mem_csr_data      <= 0 ;
//           mem_mstatus_r     <= 0 ;
//           mem_mepc_r        <= 0 ;
//           mem_mtval_r       <= 0 ;
//           mem_mtvec_r       <= 0 ;
//           mem_mcause_r      <= 0 ;
//           mem_mie_r         <= 0 ;
//           mem_mip_r         <= 0 ;
//           mem_mscratch_r    <= 0 ;
//           mem_mideleg_r     <= 0 ;
//           mem_medeleg_r     <= 0 ;
//       end
//       else if (fetched &&  clear) begin 
//           mem_csr_data      <= 0 ;
//           mem_mstatus_r     <= 0 ;
//           mem_mepc_r        <= 0 ;
//           mem_mtval_r       <= 0 ;
//           mem_mtvec_r       <= 0 ;
//           mem_mcause_r      <= 0 ;
//           mem_mie_r         <= 0 ;
//           mem_mip_r         <= 0 ;
//           mem_mscratch_r    <= 0 ;
//           mem_mideleg_r     <= 0 ;
//           mem_medeleg_r     <= 0 ;
//       end
//       else if (fetched && ld_pause) begin
//           mem_csr_data      <= mem_csr_data ;
//           mem_mstatus_r     <= mem_mstatus_r ;
//           mem_mepc_r        <= mem_mepc_r ;
//           mem_mtval_r       <= mem_mtval_r ;
//           mem_mtvec_r       <= mem_mtvec_r ;
//           mem_mcause_r      <= mem_mcause_r ;
//           mem_mie_r         <= mem_mie_r ;
//           mem_mip_r         <= mem_mip_r ;
//           mem_mscratch_r    <= mem_mscratch_r ;
//           mem_mideleg_r     <= mem_mideleg_r ;
//           mem_medeleg_r     <= mem_medeleg_r ;
//       end
//       else if (fetched && ~clear) begin
//           mem_csr_data      <= exe_csr_data ;
//           mem_mstatus_r     <= exe_mstatus_r ;
//           mem_mepc_r        <= exe_mepc_r ;
//           mem_mtval_r       <= exe_mtval_r ;
//           mem_mtvec_r       <= exe_mtvec_r ;
//           mem_mcause_r      <= exe_mcause_r ;
//           mem_mie_r         <= exe_mie_r ;
//           mem_mip_r         <= exe_mip_r ;
//           mem_mscratch_r    <= exe_mscratch_r ;
//           mem_mideleg_r     <= exe_mideleg_r ;
//           mem_medeleg_r     <= exe_medeleg_r ;
//       end
      
//   end


  always @(posedge clk ) begin
      if (rst==1'b1) begin
          mem_exe_data                <= 0 ;
          mem_csr_wr_data             <= 0 ;
      end
      else if (fetched &&  clear) begin 
          mem_exe_data                <= 0 ;
          mem_csr_wr_data             <= 0 ;
      end
      else if (fetched && ld_pause) begin
          mem_exe_data                <= mem_exe_data ;
          mem_csr_wr_data             <= mem_csr_wr_data ;
      end
      else if (fetched && ~clear) begin
          mem_exe_data                <= exe_data ;
          mem_csr_wr_data             <= csr_wr_data ;
      end
      
  end

 always @(posedge clk ) begin
      if (rst==1'b1) begin
        //   mem_rd_mstatus      <= 0 ;
        //   mem_rd_mcause       <= 0 ;
        //   mem_rd_mepc         <= 0 ;
          mem_rd_csr_data     <= 0 ;

          mem_wr_mstatus      <= 0 ;
          mem_wr_mcause       <= 0 ;
          mem_wr_mepc         <= 0 ;

      end
      else if (fetched &&  clear) begin 
        //   mem_rd_mstatus      <= 0 ;
        //   mem_rd_mcause       <= 0 ;
        //   mem_rd_mepc         <= 0 ;
          mem_rd_csr_data     <= 0 ;

          mem_wr_mstatus      <= 0 ;
          mem_wr_mcause       <= 0 ;
          mem_wr_mepc         <= 0 ;
      end
      else if (fetched && ld_pause) begin
        //   mem_rd_mstatus      <= mem_rd_mstatus ;
        //   mem_rd_mcause       <= mem_rd_mcause ;
        //   mem_rd_mepc         <= mem_rd_mepc ;
          mem_rd_csr_data     <= mem_rd_csr_data ;

          mem_wr_mstatus      <= mem_wr_mstatus ;
          mem_wr_mcause       <= mem_wr_mcause ;
          mem_wr_mepc         <= mem_wr_mepc ;
      end
      else if (fetched && ~clear) begin
        //   mem_rd_mstatus      <= exe_rd_mstatus ;
        //   mem_rd_mcause       <= exe_rd_mcause ;
        //   mem_rd_mepc         <= exe_rd_mepc ;
          mem_rd_csr_data     <= exe_rd_csr_data ;

          mem_wr_mstatus      <= exe_wr_mstatus ;
          mem_wr_mcause       <= exe_wr_mcause ;
          mem_wr_mepc         <= exe_wr_mepc ;
      end
      
  end 

  always @(posedge clk ) begin
      if (rst==1'b1) begin
        //   mem_r_data1   <= 64'd0;
          mem_r_data2   <= 64'd0;
      end
      else if (fetched &&  clear) begin 
        //   mem_r_data1   <= 64'd0;
          mem_r_data2   <= 64'd0;
      end
      else if (fetched && ld_pause) begin
        //   mem_r_data1   <= mem_r_data1;
          mem_r_data2   <= mem_r_data2;
      end
      else if (fetched && ~clear) begin
        //   mem_r_data1   <= exe_r_data1;
          mem_r_data2   <= exe_r_data2;
      end
      
  end

  endmodule 
module ysyx_210746_exe_op2_mux(
    input                rst,
    input        [2:0]   inst_type,
     
    input        [63:0]  imm_shift,
    input        [63:0]  exe_rdata2_mux,

    output  reg  [63:0]  op2
);

  parameter  I_TYPE  =  3'b000,
             R_TYPE  =  3'b001,
             S_TYPE  =  3'b010,
             U_TYPE  =  3'b011,
             UJ_TYPE =  3'b100,
             SB_TYPE =  3'b101;


  always @(*) begin
      if (rst == 1'b1)
          op2 = 64'd0;
      else 
      case(inst_type)
          R_TYPE,SB_TYPE:                op2  =  exe_rdata2_mux;
          
          I_TYPE,S_TYPE,U_TYPE,UJ_TYPE:  op2  =  imm_shift;
            
          
          
          
          
         
          default: op2 = 64'd0;
      endcase
  end

  endmodule 
module ysyx_210746_exe_stage(
    input                rst,
    input        [6:0]   inst_data_i,
    input        [63:0]  op1,
    input        [63:0]  op2,
    input        [`YSYX210746_RW_ADDR_WIDTH-1:0]  pc,
    
    output  reg  [63:0]  exe_data_o
    
);
  wire  [4:0]  imm2;
  wire  [5:0]  imm1;
  wire  [31:0] r_d2,r_d3,r_d4,r_d5,r_d6;
  wire  [63:0] sum,sub,r_d1;

   //I_TYPE
  parameter ADDI = 7'd0, SLTI = 7'd1, SLTIU = 7'd2, XORI = 7'd3, ORI = 7'd4, ANDI = 7'd5, SLLI =7'd6, SRLI = 7'd7,
            SRAI = 7'd8, JALR = 7'd9; 
  parameter ADDIW = 7'd10, SLLIW =7'd11 , SRLIW =7'd12 , SRAIW =7'd13 , LWU =7'd14 , LD =7'd15 ;
  //R_TYPE          
  parameter ADD = 7'd16, SUB = 7'd17, SLL = 7'd18, SLT = 7'd19, SLTU = 7'd20, XOR = 7'd21, SRL = 7'd22, SRA =7'd23,
            OR = 7'd24, AND = 7'd25 ; 
  parameter ADDW = 7'd26, SUBW = 7'd27, SLLW = 7'd28, SRLW = 7'd29, SRAW = 7'd30;           
  //S_TYPE
  parameter SB = 7'd31, SH = 7'd32, SW = 7'd33 , SD = 34;
  //U_TYPE
  parameter LUI = 7'd35, AUIPC = 7'd36;
  //UJ_TYPE
  parameter JAL = 7'd37;
  parameter LB = 7'd38, LH = 7'd39, LW = 7'd40 , LHU = 7'd41;//I_TYPE LOAD
  //B_TYPE
//   parameter BNE = 7'd42, BEQ=7'd43, BLT = 7'd44, BLTU = 7'd45, BGE = 7'd46, BGEU = 7'd47;

  parameter NOP = 7'd48;
  parameter LBU = 7'd49;

  assign  imm1  = op2[5:0];
  assign  imm2  = op2[4:0];
  assign  sum   = op1+op2;
  assign  sub   = op1-op2;
  assign  r_d1  = op1<<imm1;
  assign  r_d2  = op1[31:0] << imm2;
  assign  r_d3  = op1[31:0] >> imm1; 
  assign  r_d4  = $signed(op1[31:0]) >>> imm1; 
  assign  r_d5  = op1[31:0] >> imm2;
  assign  r_d6  = $signed(op1[31:0]) >>> imm2; 

  always @(*) begin
      if (rst == 1'b1)
          exe_data_o = 64'd0;
      else
      case(inst_data_i)
      // I/R type inst
      ADDI,ADD: exe_data_o = op1 + op2; //x[rd] = x[rd] + sext(imm)
      
      SLTI,SLT: if ($signed(op1)<$signed(op2))
                    exe_data_o = 64'd1;
                else
                    exe_data_o = 0;

      
      SLTIU,SLTU: if (op1 < op2 )
                exe_data_o = 64'd1;
            else 
                exe_data_o = 64'd0;
      
      XORI,XOR: exe_data_o = op1 ^ op2 ;
      ORI,OR:   exe_data_o = op1 | op2 ;
      ANDI,AND: exe_data_o = op1 & op2 ;
      SLLI,SLL: exe_data_o = op1<<imm1;
      SRLI,SRL: exe_data_o = op1>>imm1;
      SRAI,SRA: exe_data_o = ($signed(op1)) >>> imm1;
      SLLIW:    exe_data_o = {{33{r_d1[31]}},r_d1[30:0]};
      SLLW:     exe_data_o = {{33{r_d2[31]}},r_d2[30:0]};
      SRLIW:    exe_data_o = {{33{r_d3[31]}},r_d3[30:0]};
      SRAIW:    exe_data_o = {{33{r_d4[31]}},r_d4[30:0]};
      
      JALR:     exe_data_o = pc+4;
      ADDIW,ADDW: exe_data_o = {{33{sum[31]}},sum[30:0]};
      SUB:      exe_data_o = op1-op2;
      SUBW:     exe_data_o = {{33{sub[31]}},sub[30:0]};

      SRLW:     exe_data_o = {{33{r_d5[31]}},r_d5[30:0]};
      SRAW:     exe_data_o = {{33{r_d6[31]}},r_d6[30:0]};

      //LOAD type inst
      LW,LH,LB: exe_data_o = op1+op2;
      LWU,LHU,LBU:  exe_data_o = op1+op2; //x[rd] = M[x[rs1] + sext(offset)][31:0]  fail
      LD:       exe_data_o = op1+op2; //x[rd] = M[x[rs1] + sext(offset)][63:0]  pass


      //U type inst
      LUI:      exe_data_o = op2;
      AUIPC:    exe_data_o = op2+pc; //x[rd] = pc + sext(immediate[31:12] << 12)  
      //NOP type inst
      NOP:      exe_data_o = 0; 
      //UJ type inst
      JAL:      exe_data_o = pc+4;//?????
      
      //S type inst
      SH,SB,SW,SD: exe_data_o = op1+op2;
      //B type inst
      
                            
      default:  exe_data_o = 0;
      endcase
  end


  endmodule 

module ysyx_210746_id_exe_reg (
    input               clk,
    input               rst,
    input               fetched,
    input      [`YSYX210746_RW_ADDR_WIDTH-1:0]   id_pc,
    input      [31:0]   id_inst,
    input               jump_success,
    input               clear,
    input               id_inst_valid,
    input               id_skip,
    input               id_bubble,
    
    input               ld_pause,
    
    //id_stage
    // input               rs1_r_ena,
    input      [4:0]    rs1_r_addr,

    input               rd_w_ena,
    input      [4:0]    rd_w_addr,   
    input               csr_wr_ena,
    input               csr_rd_ena,
    input               ld_en,
    input               sd_en, 
    input      [6:0]    inst_data,
    input      [2:0]    inst_type,
    input      [11:0]   imm,
    input      [63:0]   imm_shift,
    
    //csr_reg rd_mux
    input      [63:0]   rd_mstatus,
    input      [63:0]   rd_mcause,
    input      [63:0]   rd_mepc,
    input      [63:0]   rd_csr_data,
    
    
    //reg
    input      [63:0]   r_data1,
    input      [63:0]   r_data2,
    // input    [`YSYX210746_REG_BUS] regs_o[0 : 31],       

        

    output reg          exe_inst_valid,
    output reg          exe_skip,
    //pc
    output reg [`YSYX210746_RW_ADDR_WIDTH-1:0]   exe_pc,
    output reg [31:0]   exe_inst,
    output reg          exe_jump_success,

    //id_stage
    // output reg          exe_rs1_r_ena,
    output reg [4:0]    exe_rs1_r_addr,
    output reg          exe_rd_w_ena,
    output reg [4:0]    exe_rd_w_addr,   
    output reg          exe_csr_wr_ena,
    output reg          exe_csr_rd_ena,
    output reg          exe_ld_en,
    output reg          exe_sd_en,
    output reg [6:0]    exe_inst_data,
    output reg [2:0]    exe_inst_type,
    output reg [11:0]   exe_imm,
    output reg [63:0]   exe_imm_shift,

    //csr_reg rd_mux
    output reg [63:0]   exe_rd_mstatus,
    output reg [63:0]   exe_rd_mcause,
    output reg [63:0]   exe_rd_mepc,
    output reg [63:0]   exe_rd_csr_data,

    //reg
    output reg [63:0]   exe_r_data1,
    output reg [63:0]   exe_r_data2

);
    

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          exe_pc           <=  `YSYX210746_PC_START ;
          exe_inst         <=  0;
          exe_inst_valid   <=  0;
          exe_skip         <=  0;
          exe_jump_success <=  0;
      end
      else if (fetched &&  clear) begin 
          exe_pc           <=  `YSYX210746_PC_START ;
          exe_inst         <=  0;
          exe_inst_valid   <=  0;
          exe_skip         <=  0;
          exe_jump_success <=  0;
      end
      else if (fetched && ld_pause  ) begin
          exe_pc           <=  exe_pc ;
          exe_inst         <=  exe_inst;
          exe_inst_valid   <=  exe_inst_valid;
          exe_skip         <=  exe_skip;
          exe_jump_success <=  exe_jump_success;
      end
      else if (fetched && id_bubble) begin
          exe_pc           <=  `YSYX210746_PC_START;
          exe_inst         <=  0;
          exe_inst_valid   <=  0;
          exe_skip         <=  0;
          exe_jump_success <=  0;
      end
      else if (fetched && ~clear) begin
          exe_pc           <=  id_pc ;
          exe_inst         <=  id_inst;
          exe_inst_valid   <=  id_inst_valid;
          exe_skip         <=  id_skip;
          exe_jump_success <=  jump_success;
      end
      
  end

  always @(posedge clk ) begin
      if (rst==1'b1) begin
        //   exe_rs1_r_ena     <= 0;
          exe_rs1_r_addr    <= 0;
        //   exe_rs2_r_ena     <= 0;
        //   exe_rs2_r_addr    <= 0;
          exe_rd_w_ena      <= 0;
          exe_rd_w_addr     <= 0;
          exe_csr_wr_ena    <= 0;
          exe_csr_rd_ena    <= 0;
          exe_ld_en         <= 0;
          exe_sd_en         <= 0;
      end
      else if (fetched &&  clear) begin 
        //   exe_rs1_r_ena     <= 0;
          exe_rs1_r_addr    <= 0;
        //   exe_rs2_r_ena     <= 0;
        //   exe_rs2_r_addr    <= 0;
          exe_rd_w_ena      <= 0;
          exe_rd_w_addr     <= 0;
          exe_csr_wr_ena    <= 0;
          exe_csr_rd_ena    <= 0;
          exe_ld_en         <= 0;
          exe_sd_en         <= 0;
      end
      else if (fetched && ld_pause  ) begin
        //   exe_rs1_r_ena     <= exe_rs1_r_ena ;
          exe_rs1_r_addr    <= exe_rs1_r_addr;
        //   exe_rs2_r_ena     <= exe_rs2_r_ena ;
        //   exe_rs2_r_addr    <= exe_rs2_r_addr;
          exe_rd_w_ena      <= exe_rd_w_ena  ;
          exe_rd_w_addr     <= exe_rd_w_addr ;
          exe_csr_wr_ena    <= exe_csr_wr_ena;
          exe_csr_rd_ena    <= exe_csr_rd_ena;
          exe_ld_en         <= exe_ld_en;
          exe_sd_en         <= exe_sd_en;
      end
      else if (fetched && id_bubble) begin
        //   exe_rs1_r_ena     <= 0;
          exe_rs1_r_addr    <= 0;
        //   exe_rs2_r_ena     <= 0;
        //   exe_rs2_r_addr    <= 0;
          exe_rd_w_ena      <= 0;
          exe_rd_w_addr     <= 0;
          exe_csr_wr_ena    <= 0;
          exe_csr_rd_ena    <= 0;
          exe_ld_en         <= 0;
          exe_sd_en         <= 0;
      end
      else if (fetched && ~clear) begin
        //   exe_rs1_r_ena     <= rs1_r_ena ;
          exe_rs1_r_addr    <= rs1_r_addr;
        //   exe_rs2_r_ena     <= rs2_r_ena ;
        //   exe_rs2_r_addr    <= rs2_r_addr;
          exe_rd_w_ena      <= rd_w_ena  ;
          exe_rd_w_addr     <= rd_w_addr ;
          exe_csr_wr_ena    <= csr_wr_ena;
          exe_csr_rd_ena    <= csr_rd_ena;
          exe_ld_en         <= ld_en;
          exe_sd_en         <= sd_en;
      end
      
  end

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          exe_inst_data     <= 0;
          exe_inst_type     <= 0;
          exe_imm_shift     <= 0;
          exe_imm           <= 0;
      end
      else if (fetched &&  clear) begin 
          exe_inst_data     <= 0;
          exe_inst_type     <= 0;
          exe_imm_shift     <= 0;
          exe_imm           <= 0;
      end
      else if (fetched && ld_pause  ) begin
          exe_inst_data     <= exe_inst_data;
          exe_inst_type     <= exe_inst_type;
          exe_imm_shift     <= exe_imm_shift;
          exe_imm           <= exe_imm;
      end
      else if (fetched && id_bubble) begin
          exe_inst_data     <= 0;
          exe_inst_type     <= 0;
          exe_imm_shift     <= 0;
          exe_imm           <= 0;
      end
      else if (fetched && ~clear) begin
          exe_inst_data     <= inst_data;
          exe_inst_type     <= inst_type;
          exe_imm_shift     <= imm_shift;
          exe_imm           <= imm;
      end
      
  end


  always @(posedge clk ) begin
      if (rst==1'b1) begin
          exe_rd_mstatus      <= 0 ;
          exe_rd_mcause       <= 0 ;
          exe_rd_mepc         <= 0 ;
          exe_rd_csr_data     <= 0 ;
      end
      else if (fetched &&  clear) begin 
          exe_rd_mstatus      <= 0 ;
          exe_rd_mcause       <= 0 ;
          exe_rd_mepc         <= 0 ;
          exe_rd_csr_data     <= 0 ;
      end
      else if (fetched && ld_pause  ) begin
          exe_rd_mstatus      <= exe_rd_mstatus ;
          exe_rd_mcause       <= exe_rd_mcause ;
          exe_rd_mepc         <= exe_rd_mepc ;
          exe_rd_csr_data     <= exe_rd_csr_data ;
          
      end
      else if (fetched && id_bubble) begin
          exe_rd_mstatus      <= 0 ;
          exe_rd_mcause       <= 0 ;
          exe_rd_mepc         <= 0 ;
          exe_rd_csr_data     <= 0 ;
      end
      else if (fetched && ~clear) begin
          exe_rd_mstatus      <= rd_mstatus ;
          exe_rd_mcause       <= rd_mcause ;
          exe_rd_mepc         <= rd_mepc ;
          exe_rd_csr_data     <= rd_csr_data ;
          
      end
      
  end 


  always @(posedge clk ) begin
      if (rst==1'b1) begin
          exe_r_data1   <= 0;
          exe_r_data2   <= 0;
          
      end
      else if (fetched &&  clear) begin 
          exe_r_data1   <= 0;
          exe_r_data2   <= 0;
      end
      else if (fetched && ld_pause  ) begin
          exe_r_data1   <= exe_r_data1;
          exe_r_data2   <= exe_r_data2;
      end
      else if (fetched && id_bubble) begin
          exe_r_data1   <= 0;
          exe_r_data2   <= 0;
      end
      else if (fetched && ~clear) begin
          exe_r_data1   <= r_data1;
          exe_r_data2   <= r_data2;
      end
      
  end

endmodule

 
module ysyx_210746_id_stage(
  input                rst,
  input                id_skip,
  input         [31:0] inst,

  output               rs1_r_ena,
  output        [4:0]  rs1_r_addr,
  output               rs2_r_ena,
  output        [4:0]  rs2_r_addr,
  output               rd_w_ena,
  output        [4:0]  rd_w_addr,
  output               csr_rd_ena,   
  output               csr_wr_ena,
  output               ld_en,
  output               sd_en,            

  output  reg   [6:0]  inst_data,
  //output        [6:0]  inst_opcode,
  output  reg   [2:0]  inst_type,
  output  reg   [63:0] imm_shift,
  output  wire  [11:0] imm
);

  wire      [2:0]  funct3;
 
  wire      [6:0]  inst_opcode;
  
   
  parameter  I_TYPE  =  3'b000,
             R_TYPE  =  3'b001,
             S_TYPE  =  3'b010,
             U_TYPE  =  3'b011,
             UJ_TYPE =  3'b100,
             B_TYPE  =  3'b101;
  
  //I_TYPE
  parameter ADDI = 7'd0, SLTI = 7'd1, SLTIU = 7'd2, XORI = 7'd3, ORI = 7'd4, ANDI = 7'd5, SLLI =7'd6, SRLI = 7'd7,
            SRAI = 7'd8, JALR = 7'd9; 
  parameter ADDIW = 7'd10, SLLIW =7'd11 , SRLIW =7'd12 , SRAIW =7'd13 , LWU =7'd14 , LD =7'd15 ;
  //R_TYPE          
  parameter ADD = 7'd16, SUB = 7'd17, SLL = 7'd18, SLT = 7'd19, SLTU = 7'd20, XOR = 7'd21, SRL = 7'd22, SRA =7'd23,
            OR = 7'd24, AND = 7'd25 ; 
  parameter ADDW = 7'd26, SUBW = 7'd27, SLLW = 7'd28, SRLW = 7'd29, SRAW = 7'd30;           
  //S_TYPE
  parameter SB = 7'd31, SH = 7'd32, SW = 7'd33 , SD = 34;
  //U_TYPE
  parameter LUI = 7'd35, AUIPC = 7'd36;
  //UJ_TYPE
  parameter JAL = 7'd37;
  parameter LB = 7'd38, LH = 7'd39, LW = 7'd40 , LHU = 7'd41;//I_TYPE LOAD
  //B_TYPE
  parameter BNE = 7'd42, BEQ=7'd43, BLT = 7'd44, BLTU = 7'd45, BGE = 7'd46, BGEU = 7'd47;
  
  parameter NOP = 7'd48;
  parameter LBU = 7'd49;
  parameter CSRRW = 7'd50, CSRRS = 7'd51, CSRRC = 7'd52, CSRRWI = 7'd53, CSRRSI = 7'd54, CSRRCI = 7'd55;
  parameter ECALL = 7'd56, EBREAK = 7'd57, MRET = 7'd58;

  assign  inst_opcode = inst[6:0];
  assign  funct3      = inst[14:12];
  
  assign  rd_w_addr   = inst[11:7];
  assign  rs2_r_addr  = inst[24:20];
  assign  rs1_r_addr  = inst[19:15];

  assign  imm         = inst[31:20];
  assign  rs1_r_ena   = id_skip ? 1'b0 :
                        ( (inst_type==UJ_TYPE) | (inst_type==I_TYPE) | (inst_type==R_TYPE) |  (inst_type==B_TYPE) 
                           |  (inst_type==S_TYPE) ) ? 1'b1 : 1'b0 ;

  assign  rs2_r_ena   = id_skip ? 1'b0 :
                        ( (inst_type==I_TYPE) | (inst_type==R_TYPE) |  (inst_type==B_TYPE) 
                           |  (inst_type==S_TYPE) ) ? 1'b1 : 1'b0 ;

  assign  rd_w_ena    = id_skip ? 1'b0 :
                        ( (inst_type==UJ_TYPE) | (inst_type==I_TYPE) | (inst_type==R_TYPE) | (inst_type==U_TYPE)) ? 1'b1 : 1'b0 ;

  assign  csr_rd_ena  = id_skip ? 1'b0 :
                        ( (inst_data == CSRRW) | (inst_data == CSRRS) | (inst_data == CSRRC) | 
                          (inst_data == CSRRWI) | (inst_data == CSRRSI) | (inst_data == CSRRCI) ) ? 1'b1 : 1'b0 ;

  assign  csr_wr_ena  =   id_skip ? 1'b0 :
                        ((inst_data == ECALL) | (inst_data == EBREAK) | (inst_data == MRET) ) ? 1'b1:
                          ( rs1_r_addr == 0 ) ? 1'b0 : 
                          ( (inst_data == CSRRW) | (inst_data == CSRRS) | (inst_data == CSRRC) | (inst_data == CSRRWI) | (inst_data == CSRRSI) | (inst_data == CSRRCI) ) ? 1'b1 : 1'b0 ;
  
  assign  ld_en       = id_skip ? 1'b0 :
                        ( (inst_data==LB) || (inst_data==LH) || (inst_data==LW) || (inst_data==LHU) || (inst_data==LWU) || (inst_data==LD) || (inst_data==LBU) 
                            )? 1'b1 : 1'b0;
                 
  assign  sd_en       = id_skip ? 1'b0 :
                        ( (inst_data==SB) || (inst_data==SH) || (inst_data==SW) || (inst_data==SD) )? 1'b1 : 1'b0;                                                
  


  //inst_type  six types :I\R\S\U\UJ\SB
  always @(*) begin
      if (rst == 1'b1)
          inst_type = I_TYPE; 
      else if (inst_opcode == 7'b1100011)
          inst_type = B_TYPE;
      else if (inst_opcode == 7'b1101111)
          inst_type = UJ_TYPE;   
      else if (inst_opcode == 7'b0100011)
          inst_type = S_TYPE;
      else if (inst_opcode == 7'b0110011 || inst_opcode == 7'b0111011 )
          inst_type = R_TYPE;
      else if ((inst_opcode[6]==1'b0) && (inst_opcode[2]==1'b1))
          inst_type = U_TYPE;
      else 
          inst_type = I_TYPE;  
  end
  
  always @(*) begin
      if (rst == 1'b1)
          inst_data = NOP;
      else
      case(inst_type) 
          I_TYPE:begin
              case(funct3)
                  3'b000:  if((imm == 12'd0) && (inst_opcode == 7'b1110011))
                               inst_data = ECALL;
                           else if((imm == 12'd1) && (inst_opcode == 7'b1110011))
                               inst_data = EBREAK;
                           else if( (imm == 12'b0011_0000_0010) && (inst_opcode == 7'b1110011))
                               inst_data = MRET;         
                           else if(inst_opcode[6]==1) 
                               inst_data = JALR; 
                           else if(inst_opcode[3]==1)
                               inst_data = ADDIW;
                           else if(inst_opcode[4]==1)
                               inst_data = ADDI;
                           else if(inst_opcode[0]==1) 
                               inst_data = LB;
                           else
                               inst_data = 0;
                 
                  3'b001:  if(inst_opcode[6]==1)
                               inst_data = CSRRW; 
                           else if(inst_opcode[3]==1)
                               inst_data = SLLIW;
                           else if (inst_opcode[4]==1)
                               inst_data = SLLI;
                           else
                               inst_data = LH;
                 
                  3'b010:  if(inst_opcode[6]==1)
                               inst_data = CSRRS; 
                           else if(inst_opcode[4]==1)
                               inst_data = SLTI;
                           else
                               inst_data = LW;
                 
                  3'b011:  if(inst_opcode[6]==1)
                               inst_data = CSRRC; 
                           else if (inst_opcode[4]==1)
                               inst_data = SLTIU;
                           else
                               inst_data = LD;
                 
                  3'b100:  if (inst_opcode[4]==1)
                               inst_data = XORI;
                           else
                               inst_data = LBU;
                                 
                  3'b101:  if(inst_opcode[6]==1)
                               inst_data = CSRRWI; 
                           else if (inst_opcode[4]==1'b0)
                                inst_data = LHU;
                           else if (imm[10]==1)
                               if(inst_opcode[3]==1)
                                   inst_data = SRAIW;
                               else   
                                   inst_data = SRAI;
                           else if(inst_opcode[3]==1)
                                   inst_data = SRLIW;
                               else   
                                   inst_data = SRLI;
                               
                  3'b110:  if(inst_opcode[6]==1)
                               inst_data = CSRRSI; 
                           else if (inst_opcode[4]==1)
                               inst_data = ORI;
                           else
                               inst_data = LWU;
                  3'b111:  if(inst_opcode[6]==1)
                               inst_data = CSRRCI; 
                           else 
                               inst_data = ANDI;
                  default: inst_data = NOP;
            
              endcase
          end
          R_TYPE:
                case(funct3)
                  3'b000:  if(imm[10])
                               if (inst_opcode[3]==1)
                                   inst_data = SUBW;
                               else
                                   inst_data = SUB;
                           else if (inst_opcode[3]==1)
                                   inst_data = ADDW;
                               else
                                   inst_data = ADD;
                              
                  3'b001:  if (inst_opcode[3]==1)
                               inst_data = SLLW;
                           else
                               inst_data = SLL;
                  3'b010:  inst_data = SLT;
                  3'b011:  inst_data = SLTU;
                  3'b100:  inst_data = XOR;
                  3'b101:  if(imm[10])
                               if (inst_opcode[3]==1)
                                   inst_data = SRAW;
                               else
                                   inst_data = SRA;
                           else if (inst_opcode[3]==1)
                                   inst_data = SRLW;
                               else
                                   inst_data = SRL;
                               
                  3'b110:  inst_data = OR;
                  3'b111:  inst_data = AND;
                  default: inst_data = NOP;
              
              endcase
        
          S_TYPE:begin
              case(funct3)
                  3'b000:  inst_data = SB;
                  3'b001:  inst_data = SH;
                  3'b010:  inst_data = SW;
                  3'b011:  inst_data = SD;
                  default: inst_data = NOP;
            
              endcase
          end
          U_TYPE:begin
              if(inst_opcode[5]==1)
                  inst_data = LUI;
              else
                  inst_data = AUIPC;
          end
          UJ_TYPE:begin
              inst_data = JAL;
          end
          B_TYPE:begin
              case(funct3)
                  3'b000:  inst_data = BEQ;
                  3'b001:  inst_data = BNE;
                  3'b100:  inst_data = BLT;
                  3'b101:  inst_data = BGE;
                  3'b110:  inst_data = BLTU;
                  3'b111:  inst_data = BGEU;
                  default: inst_data = NOP;
            endcase
          end
          default:  inst_data = NOP;
      
      endcase

  end


  //imm_shift explore
  always @(*) begin
      if (rst == 1'b1)
          imm_shift = 64'd0 ;
      else 
      case (inst_type)
          I_TYPE: imm_shift = {{53{inst[31]}},inst[30:20]};
          S_TYPE: imm_shift = {{53{inst[31]}},inst[30:25],inst[11:8],inst[7]};
          B_TYPE: imm_shift = {{52{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0};
          U_TYPE: imm_shift = {{33{inst[31]}},inst[30:12],{12{1'b0}}};
          UJ_TYPE:imm_shift = {{44{inst[31]}},inst[19:12],inst[20],inst[30:21],1'b0};
          default:imm_shift = 64'd0;
      endcase
  end

  endmodule 
module ysyx_210746_if_addr_data_bypass (
    input          rs1_r_ena,
    input   [4:0]  rs1_r_addr,
    input          rs2_r_ena,
    input   [4:0]  rs2_r_addr,
    input          mem_rd_w_ena,  
    input   [4:0]  mem_rd_w_addr,
    input          exe_rd_w_ena, 
    input   [4:0]  exe_rd_w_addr,
    input          wb_rd_w_ena, 
    input   [4:0]  wb_rd_w_addr,
    input          ld_en,//此时r_data与dmem_rdata冲突
    input          exe_csr_rd_ena,
    input          mem_csr_rd_ena,
    input          wb_csr_rd_ena,
    input          mem_skip,
    input          wb_skip,
    
    output  [2:0]  r_data1_mux,
    output  [2:0]  r_data2_mux

);

    assign  r_data1_mux  =  ( ( exe_rd_w_addr == rs1_r_addr  ) && ( rs1_r_ena & exe_rd_w_ena & ~exe_csr_rd_ena )                     && ( exe_rd_w_addr != 5'd0 ))   ?   3'b111  :
                            ( ( exe_rd_w_addr == rs1_r_addr  ) && ( rs1_r_ena & exe_rd_w_ena &  exe_csr_rd_ena )                     && ( exe_rd_w_addr != 5'd0 ))   ?   3'b110  :
                            ( ( mem_rd_w_addr == rs1_r_addr  ) && ( rs1_r_ena & mem_rd_w_ena & ~mem_csr_rd_ena & ~ld_en & ~mem_skip) && ( mem_rd_w_addr != 5'd0 ))   ?   3'b101  :
                            ( ( mem_rd_w_addr == rs1_r_addr  ) && ( rs1_r_ena & mem_rd_w_ena & ~mem_csr_rd_ena &  ld_en & ~mem_skip) && ( mem_rd_w_addr != 5'd0 ))   ?   3'b100  :
                            ( ( mem_rd_w_addr == rs1_r_addr  ) && ( rs1_r_ena & mem_rd_w_ena &  mem_csr_rd_ena & ~ld_en & ~mem_skip) && ( mem_rd_w_addr != 5'd0 ))   ?   3'b011  :
                            ( ( wb_rd_w_addr  == rs1_r_addr  ) && ( rs1_r_ena & wb_rd_w_ena  & ~wb_csr_rd_ena  & ~wb_skip )          && ( wb_rd_w_addr  != 5'd0 ))   ?   3'b010  : 
                            ( ( wb_rd_w_addr  == rs1_r_addr  ) && ( rs1_r_ena & wb_rd_w_ena  &  wb_csr_rd_ena  & ~wb_skip )          && ( wb_rd_w_addr  != 5'd0 ))   ?   3'b001  :  3'b000;
 
    assign  r_data2_mux  =  ( ( exe_rd_w_addr == rs2_r_addr  ) && ( rs2_r_ena & exe_rd_w_ena & ~exe_csr_rd_ena )                     && ( exe_rd_w_addr != 5'd0 ))   ?   3'b111  :
                            ( ( exe_rd_w_addr == rs2_r_addr  ) && ( rs2_r_ena & exe_rd_w_ena &  exe_csr_rd_ena )                     && ( exe_rd_w_addr != 5'd0 ))   ?   3'b110  :
                            ( ( mem_rd_w_addr == rs2_r_addr  ) && ( rs2_r_ena & mem_rd_w_ena & ~mem_csr_rd_ena & ~ld_en & ~mem_skip) && ( mem_rd_w_addr != 5'd0 ))   ?   3'b101  :
                            ( ( mem_rd_w_addr == rs2_r_addr  ) && ( rs2_r_ena & mem_rd_w_ena & ~mem_csr_rd_ena &  ld_en & ~mem_skip) && ( mem_rd_w_addr != 5'd0 ))   ?   3'b100  :
                            ( ( mem_rd_w_addr == rs2_r_addr  ) && ( rs2_r_ena & mem_rd_w_ena &  mem_csr_rd_ena & ~ld_en & ~mem_skip) && ( mem_rd_w_addr != 5'd0 ))   ?   3'b011  :
                            ( ( wb_rd_w_addr  == rs2_r_addr  ) && ( rs2_r_ena & wb_rd_w_ena  & ~wb_csr_rd_ena  & ~wb_skip )          && ( wb_rd_w_addr  != 5'd0 ))   ?   3'b010  : 
                            ( ( wb_rd_w_addr  == rs2_r_addr  ) && ( rs2_r_ena & wb_rd_w_ena  &  wb_csr_rd_ena  & ~wb_skip )          && ( wb_rd_w_addr  != 5'd0 ))   ?   3'b001  :  3'b000;


    // assign  r_data2_mux  =  ( ( exe_rd_w_addr == rs2_r_addr  ) && ( rs2_r_ena & exe_rd_w_ena           ) && ( exe_rd_w_addr != 5'd0 ))   ?   3'b100  :
    //                         ( ( mem_rd_w_addr == rs2_r_addr  ) && ( rs2_r_ena & mem_rd_w_ena & ~ld_en  ) && ( mem_rd_w_addr != 5'd0 ))   ?   3'b011  :
    //                         ( ( mem_rd_w_addr == rs2_r_addr  ) && ( rs2_r_ena & mem_rd_w_ena &  ld_en  ) && ( mem_rd_w_addr != 5'd0 ))   ?   3'b010  :
    //                         ( ( wb_rd_w_addr  == rs2_r_addr  ) && ( rs2_r_ena & wb_rd_w_ena            ) && ( wb_rd_w_addr  != 5'd0 ))   ?   3'b001  :  3'b00;

endmodule

 
module ysyx_210746_if_addr_gen(
  input              clk,
  input              rst,
  input              ti_excep,
  input              ti_excep_r,
  input      [6:0]   inst_data,
  input      [63:0]  imm_shift,
  input      [63:0]  r_data1,
  input      [63:0]  r_data2,
  input      [63:0]  mtvec_r,
  input      [63:0]  mepc_r,
  input              id_bubble,
  
  input              sd_valid,
  input              clint_skip_sd,
  

  input              ld_pause_o,
  input              ti_pause,

  input              if_ready,
  input      [1:0]   if_resp,

  input      [63:0]  pc,
  input      [31:0]  inst,
 

  output reg         clear,
  output reg         jump_success,
  output reg         intr_clear,
  output             if_valid,
  output             fetched,
  
  output reg [63:0]  if_addr_o
    
 );

  wire handshake_done ;
 
  reg   [63:0]  if_addr;
 
  wire          skip;


  parameter JALR = 7'd9, JAL = 7'd37;  //** when change number don't foreget
  //B_TYPE
  parameter BNE = 7'd42, BEQ=7'd43, BLT = 7'd44, BLTU = 7'd45, BGE = 7'd46, BGEU = 7'd47;
  parameter ECALL = 7'd56, EBREAK = 7'd57, MRET = 7'd58;
  
  parameter PC_START_RESET = `YSYX210746_PC_START ;

`ifdef DIFF_TEST  
  assign handshake_done =  (if_valid & if_ready);
`else
  assign handshake_done =  clint_skip_sd ?  (if_valid & if_ready)  : sd_valid ? 1'b0 : (if_valid & if_ready);
`endif 

  assign fetched        =  handshake_done;
  assign if_valid       = 1'b1;
//   assign if_size        = `SIZE_W; //2'b10

  assign skip  =  ((inst == 32'h0000_007b)) ? 1'b1 :0;
  
  wire   jump  = ( (inst_data == ECALL) || (inst_data == EBREAK) ||  (inst_data == MRET) || (inst_data == JALR) || (inst_data == JAL) 
              || (inst_data == BNE) || (inst_data == BEQ) || (inst_data == BLT) || (inst_data == BLTU) || (inst_data == BGE) || (inst_data == BGEU) ) ? 1'b1 : 0 ;

  




  always @(*) begin // This can be changed the pc instantly 
      if (rst==1'b1) begin
          if_addr_o = PC_START_RESET;
          clear     = 1'b1;
          intr_clear= 1'b0;
          jump_success = 1'b0;
      end
      else if (ti_excep == 1'b1) begin   //具有优先级
          if_addr_o = mtvec_r;
          clear     = 1'b1;
          intr_clear= 1'b1;
          jump_success = 1'b0;
      end
      else if(ti_pause == 1) begin//防止在中断期间产生之前读回来的指令所导致地址变化错误
          if_addr_o = if_addr ;
          clear     = 1'b1;
          intr_clear= 1'b1;
          jump_success = 1'b0;
      end
      else  if (skip)  begin//发生skip跳转时，要将前if_stage阶段的指令产生一次冲刷
          if_addr_o = if_addr + 64'd4 -4; 
          clear     = 1'b0;
          intr_clear= 1'b0;
          jump_success = 1'b0;
      end
    //   else  if (jump && ld_valid && ~ld_pause_o)  begin
    //       if_addr_o = if_addr ; 
    //       clear     = 0;
    //   end
      else  if(~id_bubble && ~ld_pause_o)
          case (inst_data)
              ECALL,EBREAK:  begin
                             if_addr_o = mtvec_r;
                             clear     = 1'b1;
                             intr_clear= 1'b0;
                             jump_success = 1'b0;
              end
              MRET:          begin
                             if_addr_o = mepc_r;
                             clear     = 1'b1;
                             intr_clear= 1'b0;
                             jump_success = 1'b1;
              end
              JALR:          begin
                             if_addr_o = (r_data1 + imm_shift)&(-1);
                             clear     = 1'b1;
                             intr_clear= 1'b0;
                             jump_success = 1'b1;
              end
              JAL:           begin
                             if_addr_o = pc + imm_shift;
                             clear     = 1'b1;
                             intr_clear= 1'b0;
                             jump_success = 1'b1;
              end
              BNE:           if (r_data1 != r_data2) begin
                                 if_addr_o = pc + imm_shift;//第一次-4是因为单周期，第二次是因为流水线中id阶段读到的inst是慢两拍的,且只在跳转的时候-4  == if_addr_o + imm_shift -4 -4 ;
                                 clear     = 1'b1;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b1;
                             end
                             else begin
                                 if_addr_o = if_addr;
                                 clear     = 1'b0;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b0;
                             end
              BEQ:           if (r_data1 == r_data2) begin
                                 if_addr_o = pc + imm_shift;
                                 clear     = 1'b1;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b1;
                             end
                             else begin 
                                 if_addr_o = if_addr+4-4 ;
                                 clear     = 1'b0;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b0;
                             end
              BLT:           if ($signed(r_data1) < $signed(r_data2)) begin
                                 if_addr_o = pc + imm_shift;
                                 clear     = 1'b1;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b1;
                             end
                             else begin
                                 if_addr_o = if_addr+4-4;         
                                 clear     = 1'b0;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b0;
                             end      
              BLTU:          if (r_data1 < r_data2) begin
                                 if_addr_o = pc + imm_shift;
                                 clear     = 1'b1;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b1;
                             end
                             else begin
                                 if_addr_o = if_addr+4-4;
                                 clear     = 1'b0;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b0;
                             end
              BGE:           if ($signed(r_data1) >= $signed(r_data2)) begin
                                 if_addr_o = pc + imm_shift;
                                 clear     = 1'b1;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b1;
                             end    
                             else begin
                                 if_addr_o = if_addr+4-4;
                                 clear     = 1'b0;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b0;
                             end
              BGEU:          if (r_data1 >= r_data2) begin 
                                 if_addr_o = pc + imm_shift;
                                 clear     = 1'b1;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b1;
                             end
                             else begin
                                 if_addr_o = if_addr+4-4;  
                                 clear     = 1'b0;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b0;
                             end
              default:       begin
                                 if_addr_o = if_addr;  
                                 clear     = 1'b0;
                                 intr_clear= 1'b0;
                                 jump_success = 1'b0;
                             end 
  endcase
      else  begin
          if_addr_o = if_addr ; 
          clear     = 1'b0;
          intr_clear= 1'b0;
          jump_success = 1'b0;
      end                        
  end     

//|| (inst == 32'h00f7_3023) 
  always@(posedge clk) begin
      if (rst==1'b1) begin
          if_addr <= PC_START_RESET;
      end
      else if (ti_excep == 1)
          if_addr <= if_addr_o;
      else  if (handshake_done == 1'b1) begin
          if (ti_excep_r)  
              if_addr <= if_addr ;  
          else  if (skip)
              if_addr <= if_addr + 64'd4;
          else  if (ld_pause_o || id_bubble )  //当ld_pasue使能时若产生跳转 该怎么处理 
              if_addr <= if_addr_o;     //变为if_addr_o
          else if (jump)
              if_addr <= if_addr_o +4; 
          else
              if_addr <= if_addr + 4 ;
      end
  end
  
endmodule


 
module ysyx_210746_if_addr_rdata_mux(
    input                rst,
    input        [2:0]   r_data1_mux,
    input        [2:0]   r_data2_mux,
    
    
    input        [63:0]  r_data1,
    input        [63:0]  r_data2,
    input        [63:0]  mem_exe_data,
    input        [63:0]  exe_data,
    input        [63:0]  wb_reg_wdata,
    input        [63:0]  dmem_rdata,
    input        [63:0]  exe_csr_data,
    input        [63:0]  mem_csr_data,
    input        [63:0]  wb_csr_data,
    
    
    
    output  reg  [63:0]  r_data1_o,
    output  reg  [63:0]  r_data2_o
);



  always @(*) begin
      if (rst == 1'b1)
          r_data1_o = 64'd0;
      else if (r_data1_mux  ==  3'b111)
          r_data1_o  =  exe_data;
      else if (r_data1_mux  == 3'b110)
          r_data1_o  =  exe_csr_data;
      else if (r_data1_mux  == 3'b101)
          r_data1_o  =  mem_exe_data;
      else if (r_data1_mux  ==  3'b100)
          r_data1_o  =  dmem_rdata;
      else if (r_data1_mux  ==  3'b011)
          r_data1_o  =  mem_csr_data;             
      else if (r_data1_mux  ==  3'b010)
          r_data1_o  =  wb_reg_wdata;
      else if (r_data1_mux  ==  3'b001)
          r_data1_o  =  wb_csr_data;    //实际上，reg_wdata就已经写的是wb_csr_data了，但这里只是为了方便验证就保留
      else 
          r_data1_o  =  r_data1;
  end

  always @(*) begin
      if (rst == 1'b1)
          r_data2_o = 64'd0;
      else if (r_data2_mux  ==  3'b111)
          r_data2_o  =  exe_data;
      else if (r_data2_mux  == 3'b110)
          r_data2_o  =  exe_csr_data;
      else if (r_data2_mux  == 3'b101)
          r_data2_o  =  mem_exe_data;
      else if (r_data2_mux  ==  3'b100)
          r_data2_o  =  dmem_rdata;
      else if (r_data2_mux  ==  3'b011)
          r_data2_o  =  mem_csr_data;             
      else if (r_data2_mux  ==  3'b010)
          r_data2_o  =  wb_reg_wdata;
      else if (r_data2_mux  ==  3'b001)
          r_data2_o  =  wb_csr_data;    //实际上，reg_wdata就已经写的是wb_csr_data了，但这里只是为了方便验证就保留
      else 
          r_data2_o  =  r_data2;
  end

  endmodule 

module ysyx_210746_if_id_reg (
    input               clk,
    input               rst,
    input               fetched,
    input      [`YSYX210746_RW_ADDR_WIDTH-1:0]   pc,
    input      [31:0]   inst,
    input               skip,
    input               id_bubble,
  
    input               ld_pause,
    // input               ti_pause,
    input               clear,

    output reg          id_inst_valid,
    output reg          id_skip,
    output reg [`YSYX210746_RW_ADDR_WIDTH-1:0]   id_pc,
    output reg [31:0]   id_inst
);

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          id_pc           <= `YSYX210746_PC_START ;
          id_inst         <= 0;
          id_inst_valid   <= 0;
          id_skip         <= 0;
      end
      else if (fetched && clear) begin  
          id_pc           <= `YSYX210746_PC_START ;
          id_inst         <= 0;
          id_inst_valid   <= 0;
          id_skip         <= 0;
      end
      else if (fetched && ( ld_pause || id_bubble  ) ) begin
          id_inst_valid   <= id_inst_valid;
          id_inst         <= id_inst;//防止因产生ld_pause期间变化的inst导致if_addr生成错误
          id_skip         <= id_skip;
          id_pc           <= id_pc ; 
      end    
      else if (fetched && ~clear) begin
          if (inst == 0) begin
              id_inst_valid   <= id_inst_valid;
              id_inst         <= id_inst;
              id_skip         <= id_skip;
              id_pc           <= id_pc ; 
          end
          else begin
              id_inst_valid   <= 1;
              id_inst         <= inst;
              id_skip         <= skip;
              id_pc           <= pc ; 
          end

      end
      
  end

endmodule 
module ysyx_210746_if_stage(
  input                            clk,
  input                            rst,
  input                            ti_excep,
//   input                            ti_excep_r,
  input                            ld_pause,
//   input                            ld_valid,
  input                            ti_pause,
  input                            id_bubble,
  

  input                            fetched,
  input      [`YSYX210746_RW_ADDR_WIDTH-1:0]  if_addr,
  input      [`YSYX210746_RW_DATA_WIDTH-1:0]  if_data_read,

  output                           skip,
  output reg [`YSYX210746_RW_ADDR_WIDTH-1:0]  pc,
  output     [31:0]                inst


 );
  
 
  reg   [31:0]  if_data_l;
  reg   [31:0]  if_data_h;
  


//   parameter JALR = 7'd9, JAL = 7'd37;  
//   //B_TYPE
//   parameter BNE = 7'd42, BEQ=7'd43, BLT = 7'd44, BLTU = 7'd45, BGE = 7'd46, BGEU = 7'd47;
//   parameter ECALL = 7'd56, EBREAK = 7'd57, MRET = 7'd58;
  
  parameter PC_START_RESET = `YSYX210746_PC_START ;

 
  assign   skip  =  (inst == 32'h0000_007b) ? 1'b1 : 0;
               

  always @(posedge clk) begin
      if (rst==1'b1) begin
          pc        <= PC_START_RESET;
          if_data_l <= 0;
          if_data_h <= 0;
      end
      else if (ti_excep == 1) 
          pc  <=   if_addr;
      else if(fetched == 1'b1) begin
          if_data_l <= if_data_read[31:0];
          if_data_h <= if_data_read[63:32];   
          if (ld_pause || ti_pause || id_bubble  ) 
              pc    <= pc;
          else 
              pc    <= if_addr;
        
      end
      
  end

  assign  inst  =  ti_pause ? 0 : pc[2] ? if_data_h : if_data_l; //inst在bubble产生时不能变，两种方法，一种是在axi_ctrl.v那控制if_data_read不读，另一种是控制inst不变  (先采用前一个方法)
 
  endmodule


  module ysyx_210746_intr_excp_hold (
      input              clk,
      input              rst,
      input              fetched,
      input              ti_excep,

      output             ti_excep_r     
  );

  reg ti_excep_reg; 

  always @(posedge  clk) begin 
      if (rst==1'b1)
          ti_excep_reg <= 0;
      else if (ti_excep && ~fetched)
          ti_excep_reg <= 1;
      else if (fetched)
          ti_excep_reg <= 0;
  end
  assign  ti_excep_r  =  ti_excep  ?  1'b1 :  ti_excep_reg; //避免在fetched时刻产生ti导致等待过长时间
  
  endmodule
   

module ysyx_210746_ld_data_mux (
    input          clint_skip,
    input  [63:0]  ld_data_read,
    input  [63:0]  clint_data_read,

    output [63:0]  ld_data_read_o
);
    
  assign  ld_data_read_o = clint_skip ? clint_data_read : ld_data_read;

endmodule 

module ysyx_210746_mem_wb_reg (
    input               clk,
    input               rst,
    input               fetched,
    input               clear,
    input               mem_inst_valid,
    input               mem_skip,
    input               ld_pause,
    input      [`YSYX210746_RW_ADDR_WIDTH-1:0]   mem_pc,
    input      [6 :0]   mem_inst,
    input               mem_jump_success,

    //id_stage
    input               mem_rd_w_ena,
    input      [4:0]    mem_rd_w_addr,   
    input               mem_csr_wr_ena,
    input               mem_csr_rd_ena,
    input      [6:0]    mem_inst_data,
    input      [11:0]   mem_imm,
    //csr_reg rd_mux
    input      [63:0]   mem_rd_csr_data,
    //csr_reg wr_mux
    input      [63:0]   mem_wr_mstatus,
    input      [63:0]   mem_wr_mcause,
    input      [63:0]   mem_wr_mepc,
    //exe_stage
    input      [63:0]   mem_exe_data,
    //csr_exe_stage
    input      [63:0]   mem_csr_wr_data,
    //load
    input      [63:0]   dmem_rdata, 
    
    

    output reg          wb_inst_valid,
    output reg          wb_skip,
    //pc
    output reg [`YSYX210746_RW_ADDR_WIDTH-1:0]   wb_pc,
    output reg [6 :0]   wb_inst,
    output reg          wb_jump_success,

    //id_stage
    // output reg          wb_rs1_r_ena,
    output reg          wb_rd_w_ena,
    output reg [4:0]    wb_rd_w_addr,   
    output reg          wb_csr_wr_ena,
    output reg          wb_csr_rd_ena,
    output reg [6:0]    wb_inst_data, 
    output reg [11:0]   wb_imm,
    output reg [63:0]   wb_rd_csr_data,
    //csr_reg wr_mux
    output reg [63:0]   wb_wr_mstatus,
    output reg [63:0]   wb_wr_mcause,
    output reg [63:0]   wb_wr_mepc,
    //exe_stage
    output reg [63:0]   wb_exe_data,
    //csr_exe_stage
    output reg [63:0]   wb_csr_wr_data,

    //load 
    output reg [63:0]   wb_dmem_rdata
      
);

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          wb_pc           <=  `YSYX210746_PC_START ;
          wb_inst         <=  0;
          wb_inst_valid   <=  0;
          wb_skip         <=  0;
          wb_jump_success <=  0;
      end
      else if (fetched &&  clear) begin 
          wb_pc           <=  `YSYX210746_PC_START ;
          wb_inst         <=  0;
          wb_inst_valid   <=  0;
          wb_skip         <=  0;
          wb_jump_success <=  0;
      end
      else if (fetched && ld_pause) begin
          wb_pc           <=  wb_pc ;
          wb_inst         <=  wb_inst;
          wb_inst_valid   <=  wb_inst_valid;
          wb_skip         <=  wb_skip;
          wb_jump_success <=  wb_jump_success;
      end
      else if (fetched && ~clear) begin
          wb_pc           <=  mem_pc ;
          wb_inst         <=  mem_inst;
          wb_inst_valid   <=  mem_inst_valid;
          wb_skip         <=  mem_skip;
          wb_jump_success <=  mem_jump_success;
      end
      
  end


  always @(posedge clk ) begin
      if (rst==1'b1) begin
          wb_rd_w_ena      <= 0;
          wb_rd_w_addr     <= 0;
          wb_csr_wr_ena    <= 0;
          wb_csr_rd_ena    <= 0;
      end
      else if (fetched &&  clear) begin 
          wb_rd_w_ena      <= 0;
          wb_rd_w_addr     <= 0;
          wb_csr_wr_ena    <= 0;
          wb_csr_rd_ena    <= 0;
      end
      else if (fetched && ld_pause) begin
          wb_rd_w_ena      <= wb_rd_w_ena  ;
          wb_rd_w_addr     <= wb_rd_w_addr ;
          wb_csr_wr_ena    <= wb_csr_wr_ena;
          wb_csr_rd_ena    <= wb_csr_rd_ena;
      end
      else if (fetched && ~clear) begin
          wb_rd_w_ena      <= mem_rd_w_ena  ;
          wb_rd_w_addr     <= mem_rd_w_addr ;
          wb_csr_wr_ena    <= mem_csr_wr_ena;
          wb_csr_rd_ena    <= mem_csr_rd_ena;
      end
      
  end

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          wb_inst_data     <= 0;
          wb_imm           <= 0;
      end
      else if (fetched &&  clear) begin 
          wb_inst_data     <= 0;
          wb_imm           <= 0;
      end
      else if (fetched && ld_pause) begin
          wb_inst_data     <= wb_inst_data;
          wb_imm           <= wb_imm;
      end
      else if (fetched && ~clear) begin
          wb_inst_data     <= mem_inst_data;
          wb_imm           <= mem_imm;
      end
      
  end


  always @(posedge clk ) begin
      if (rst==1'b1) begin
          wb_exe_data     <= 0;
          wb_dmem_rdata   <= 0;
          wb_csr_wr_data  <= 0;
      end
      else if (fetched &&  clear) begin 
          wb_exe_data     <= 0 ;
          wb_dmem_rdata   <= 0;
          wb_csr_wr_data  <= 0;
      end
      else if (fetched && ld_pause) begin
          wb_exe_data     <= wb_exe_data ;
          wb_dmem_rdata   <= wb_dmem_rdata;
          wb_csr_wr_data  <= wb_csr_wr_data;
      end
      else if (fetched && ~clear) begin
          wb_exe_data     <= mem_exe_data ;
          wb_dmem_rdata   <= dmem_rdata;
          wb_csr_wr_data  <= mem_csr_wr_data;
      end
      
  end

always @(posedge clk ) begin
      if (rst==1'b1) begin
          wb_rd_csr_data     <= 0 ;
          wb_wr_mstatus      <= 0 ;
          wb_wr_mcause       <= 0 ;
          wb_wr_mepc         <= 0 ;
      end
      else if (fetched &&  clear) begin 
          wb_rd_csr_data     <= 0 ;
          wb_wr_mstatus      <= 0 ;
          wb_wr_mcause       <= 0 ;
          wb_wr_mepc         <= 0 ;

      end
      else if (fetched && ld_pause) begin
          wb_rd_csr_data     <= wb_rd_csr_data ;
          wb_wr_mstatus      <= wb_wr_mstatus ;
          wb_wr_mcause       <= wb_wr_mcause ;
          wb_wr_mepc         <= wb_wr_mepc ;

      end
      else if (fetched && ~clear) begin
          wb_rd_csr_data     <= mem_rd_csr_data ;
          wb_wr_mstatus      <= mem_wr_mstatus ;
          wb_wr_mcause       <= mem_wr_mcause ;
          wb_wr_mepc         <= mem_wr_mepc ;
      end
      
  end 


  endmodule 

  module ysyx_210746_pause_gen (
      input       clk,
      input       rst,
      input       ld_valid,
      input       fetched,
      input       con_ld,
      input       ti_excep_r,

      output reg  ld_pause,
      output      ld_pause_o,//即有ld_valid起拉高直到ld_pause拉低时拉低，补全了一个小周期
      output reg  ti_pause
  );

  reg ld_valid_r;
  reg ld_pause_flag;

  always @(posedge clk) begin
      if (rst == 1'b1)
          ld_pause_flag <= 1'b1;
      else if ( (ld_pause && fetched) || (fetched && ti_excep_r))
          ld_pause_flag <= 0;
      else if (fetched)
          ld_pause_flag <= 1;
  end
  assign  ld_pause_o  =  ld_pause_flag  ?  ld_valid  :  0;

  always @(posedge clk) begin
      if (rst == 1'b1)
          ld_valid_r <= 1'b1;
      else 
          ld_valid_r <= ld_valid;
  end
  
  always @(posedge clk) begin
      if (rst == 1'b1)
          ld_pause  <=  1'b0;
      else if ((ld_valid && ~ld_valid_r) || (~fetched && con_ld))
          ld_pause  <=  1'b1;
      else if (fetched || ti_excep_r)
          ld_pause  <=  1'b0;
  end
  
  always @(posedge clk) begin
      if (rst == 1'b1)
          ti_pause  <=  1'b0;
      else if (ti_excep_r)
          ti_pause  <=  1'b1;
      else if (fetched)
          ti_pause  <=  1'b0;
  end

  endmodule 

module ysyx_210746_record_commit_pc(
    input              clk,
    input              rst,
    input              id_inst_valid ,
    input              commit_valid,
    input      [63:0]  commit_pc,
    input              jump_success,
    input              wb_jump_success,
    input      [`YSYX210746_RW_ADDR_WIDTH-1:0]  jump_pc,
    input      [`YSYX210746_RW_ADDR_WIDTH-1:0]  jump_dest_pc,  
    input              ti_excep,
    input              inst_valid,
    input              fetched,

    output     [`YSYX210746_RW_ADDR_WIDTH-1:0]  intr_pc
);
  

  
  

  reg  [1:0]   state ;
  reg  [63:0]  jump_pc_r1;
  reg  [63:0]  jump_pc_r2;
  reg  [63:0]  jump_pc_r3;
  reg  [63:0]  jump_pc_r4;
  reg  [63:0]  jump_dest_pc_r1;
  reg  [63:0]  jump_dest_pc_r2;
  reg  [63:0]  jump_dest_pc_r3;
  reg  [63:0]  jump_dest_pc_r4;
  reg  [63:0]  commit_pc_r;
  reg  [63:0]  intr_pc_r;
  reg          flag1;//标志跳转指令对应的pc正确
  reg          flag2;
  reg          flag3;
  reg          flag4;
  
  always @(posedge clk ) begin
      if (rst==1'b1) begin
          flag1       <=  0;
      end
      else if (wb_jump_success  && (jump_pc_r1 == commit_pc)  && inst_valid )begin
          flag1       <=  1;
      end
      else if (inst_valid )begin
          flag1       <=  0;
      end
  end
  
  always @(posedge clk ) begin
      if (rst==1'b1) begin
          flag2       <=  0;
      end
      else if (wb_jump_success  && (jump_pc_r2 == commit_pc)  && inst_valid )begin
          flag2       <=  1;
      end
      else if (inst_valid )begin
          flag2       <=  0;
      end
  end

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          flag3       <=  0;
      end
      else if (wb_jump_success  && (jump_pc_r3 == commit_pc)  && inst_valid )begin
          flag3       <=  1;
      end
      else if (inst_valid )begin
          flag3       <=  0;
      end
  end

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          flag4       <=  0;
      end
      else if (wb_jump_success  && (jump_pc_r4 == commit_pc)  && inst_valid )begin
          flag4       <=  1;
      end
      else if (inst_valid )begin
          flag4       <=  0;
      end
  end

  always @(posedge clk ) begin
      case(state)
      2'b00:  if (jump_success  && id_inst_valid   && fetched )begin
                  state            <=  2'b01;
      end
      2'b01:  if (jump_success  && id_inst_valid   && fetched )begin
                  state            <=  2'b10;
      end
      2'b10:  if (jump_success  && id_inst_valid   && fetched )begin
                  state            <=  2'b11;
      end
      2'b11:  if (jump_success  && id_inst_valid   && fetched )begin
                  state            <=  2'b00;
      end
      default:    state            <=  2'b00;
      endcase
  end

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          jump_pc_r1       <=  0;
          jump_dest_pc_r1  <=  0;
      end
      else if (jump_success  && id_inst_valid   && fetched && (state==2'b00) )begin
          jump_pc_r1       <=  jump_pc;
          jump_dest_pc_r1  <=  jump_dest_pc;
      end
      else if (flag1  && inst_valid )begin
          jump_pc_r1       <=  0;
      end
  end

   always @(posedge clk ) begin
      if (rst==1'b1) begin
          jump_pc_r2       <=  0; 
          jump_dest_pc_r2  <=  0;
      end
      else if (jump_success  && id_inst_valid   && fetched && (state==2'b01))begin
          jump_pc_r2       <=  jump_pc;
          jump_dest_pc_r2  <=  jump_dest_pc;
      end
      else if ( flag2  && inst_valid )begin
          jump_pc_r2       <=  0;
      end
  end

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          jump_pc_r3       <=  0;
          jump_dest_pc_r3  <=  0;
      end
      else if (jump_success  && id_inst_valid   && fetched && (state==2'b10) )begin
          jump_pc_r3       <=  jump_pc;
          jump_dest_pc_r3  <=  jump_dest_pc;
      end
      else if ( flag3   && inst_valid )begin
          jump_pc_r3       <=  0;
      end
  end

  always @(posedge clk ) begin
      if (rst==1'b1) begin
          jump_pc_r4       <=  0;
          jump_dest_pc_r4  <=  0;
      end
      else if (flag4   && inst_valid )begin
          jump_pc_r4       <=  0;
      end
      else if (jump_success  && id_inst_valid   && fetched  && (state==2'b11))begin
          jump_pc_r4       <=  jump_pc;
          jump_dest_pc_r4  <=  jump_dest_pc;
      end
      
  end



  always @(posedge clk ) begin
      if (rst==1'b1) begin
          commit_pc_r  <=  0;
      end
      else if (commit_valid) begin
          commit_pc_r  <=  commit_pc ; 
      end
  end

  always @(posedge clk ) begin
      if (rst==1'b1)
          intr_pc_r  <=  0;
      else if ( (jump_pc_r1 == commit_pc_r) && ti_excep && flag1)
          intr_pc_r  <=  jump_dest_pc_r1;
      else if ( (jump_pc_r2 == commit_pc_r) && ti_excep && flag2)
          intr_pc_r  <=  jump_dest_pc_r2;
      else if ( (jump_pc_r3 == commit_pc_r) && ti_excep && flag3)
          intr_pc_r  <=  jump_dest_pc_r3;
      else if ( (jump_pc_r4 == commit_pc_r) && ti_excep && flag4)
          intr_pc_r  <=  jump_dest_pc_r4;            
      else if (commit_valid)
          intr_pc_r  <=  commit_pc + 64'd4;    
  end
  assign  intr_pc = ( (jump_pc_r1 == commit_pc_r) && ti_excep && ~jump_success && flag1) ? jump_dest_pc_r1 :
                    ( (jump_pc_r2 == commit_pc_r) && ti_excep && flag2) ? jump_dest_pc_r2 :
                    ( (jump_pc_r3 == commit_pc_r) && ti_excep && flag3) ? jump_dest_pc_r3 :
                    ( (jump_pc_r4 == commit_pc_r) && ti_excep && flag4) ? jump_dest_pc_r4 :
                    commit_valid ?  commit_pc_r + 64'd4 : intr_pc_r;

endmodule 

module ysyx_210746_reg_file(
    input               clk,
    input               rst,
    input               ti_excep,
    input               rs1_r_ena,
    input       [4:0]   rs1_r_addr,
    input               rs2_r_ena,
    input       [4:0]   rs2_r_addr,
    input               rd_r_ena,
    input       [4:0]   rd_r_addr,
    input       [63:0]  w_data,
    
    output  reg [63:0]  r_data1,
    output  reg [63:0]  r_data2
);

    // 32 registers
  reg [`YSYX210746_REG_BUS] 	regs[0 : 31];


  always @(posedge clk) begin
      if ( rst == 1'b1 ) begin
          regs[ 0] <= `YSYX210746_ZERO_WORD;
          regs[ 1] <= `YSYX210746_ZERO_WORD;
          regs[ 2] <= `YSYX210746_ZERO_WORD;
          regs[ 3] <= `YSYX210746_ZERO_WORD;
          regs[ 4] <= `YSYX210746_ZERO_WORD;
          regs[ 5] <= `YSYX210746_ZERO_WORD;
          regs[ 6] <= `YSYX210746_ZERO_WORD;
          regs[ 7] <= `YSYX210746_ZERO_WORD;
          regs[ 8] <= `YSYX210746_ZERO_WORD;
          regs[ 9] <= `YSYX210746_ZERO_WORD;
          regs[10] <= `YSYX210746_ZERO_WORD;
          regs[11] <= `YSYX210746_ZERO_WORD;
          regs[12] <= `YSYX210746_ZERO_WORD;
          regs[13] <= `YSYX210746_ZERO_WORD;
          regs[14] <= `YSYX210746_ZERO_WORD;
          regs[15] <= `YSYX210746_ZERO_WORD;
          regs[16] <= `YSYX210746_ZERO_WORD;
          regs[17] <= `YSYX210746_ZERO_WORD;
          regs[18] <= `YSYX210746_ZERO_WORD;
          regs[19] <= `YSYX210746_ZERO_WORD;
          regs[20] <= `YSYX210746_ZERO_WORD;
          regs[21] <= `YSYX210746_ZERO_WORD;
          regs[22] <= `YSYX210746_ZERO_WORD;
          regs[23] <= `YSYX210746_ZERO_WORD;
          regs[24] <= `YSYX210746_ZERO_WORD;
          regs[25] <= `YSYX210746_ZERO_WORD;
          regs[26] <= `YSYX210746_ZERO_WORD;
          regs[27] <= `YSYX210746_ZERO_WORD;
          regs[28] <= `YSYX210746_ZERO_WORD;
          regs[29] <= `YSYX210746_ZERO_WORD;
          regs[30] <= `YSYX210746_ZERO_WORD;
          regs[31] <= `YSYX210746_ZERO_WORD;
      end
       else if ((rd_r_ena == 1'b1) && (rd_r_addr != 5'd0) && (ti_excep == 1'b0))
           regs[rd_r_addr] <= w_data;
  end

  always @(*) begin
		if (rst == 1'b1)
			r_data1 = `YSYX210746_ZERO_WORD;
		else if (rs1_r_ena == 1'b1)
			r_data1 = regs[rs1_r_addr];
		else
			r_data1 = `YSYX210746_ZERO_WORD;
  end
	
  always @(*) begin
      if (rst == 1'b1)
	      r_data2 = `YSYX210746_ZERO_WORD;
	  else if (rs2_r_ena == 1'b1)
          r_data2 = regs[rs2_r_addr];
	  else
          r_data2 = `YSYX210746_ZERO_WORD;
  end


  endmodule


 
module ysyx_210746_reg_wdata_mux(
    input         [6:0]  inst_data_i,
    input         [63:0] exe_data,
    input         [63:0] dmem_rdata,
    input         [63:0] csr_data,

  
    
    
    output  reg   [63:0] reg_wdata
);

  parameter LB = 7'd38, LH = 7'd39, LW = 7'd40 , LHU = 7'd41,LWU =7'd14 , LD =7'd15, LBU = 7'd49;//I_TYPE LOAD
  parameter CSRRW = 7'd50, CSRRS = 7'd51, CSRRC = 7'd52, CSRRWI = 7'd53, CSRRSI = 7'd54, CSRRCI = 7'd55;

  always @(*) begin
      case(inst_data_i)
      CSRRW,CSRRS,CSRRC,CSRRWI,CSRRSI,CSRRCI: reg_wdata = csr_data;
      
      LD,LWU,LW,LH,LHU,LB,LBU:                reg_wdata = dmem_rdata;    
     
      default:                                reg_wdata = exe_data;
      endcase

  end

  endmodule
  
   


//**********************//


module ysyx_210746(
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


    wire aw_ready;
    wire aw_valid;
    wire [`YSYX210746_AXI_ADDR_WIDTH-1:0] aw_addr;
    wire [`YSYX210746_AXI_ID_WIDTH-1:0] aw_id;
    wire [7:0] aw_len;
    wire [2:0] aw_size;
    wire [1:0] aw_burst;
   
    wire w_ready;
    wire w_valid;
    wire [`YSYX210746_AXI_DATA_WIDTH-1:0] w_data;
    wire [`YSYX210746_AXI_DATA_WIDTH/8-1:0] w_strb;
    wire w_last;
    
    wire b_ready;
    wire b_valid;
    wire [1:0] b_resp;
    wire [`YSYX210746_AXI_ID_WIDTH-1:0] b_id;

    wire ar_ready;
    wire ar_valid;
    wire [`YSYX210746_AXI_ADDR_WIDTH-1:0] ar_addr;
    wire [`YSYX210746_AXI_ID_WIDTH-1:0] ar_id;
    wire [7:0] ar_len;
    wire [2:0] ar_size;
    wire [1:0] ar_burst;
    
    
    wire r_ready;
    wire r_valid;
    wire [1:0] r_resp;
    wire [`YSYX210746_AXI_DATA_WIDTH-1:0] r_data;
    wire r_last;
    wire [`YSYX210746_AXI_ID_WIDTH-1:0] r_id;
//********************************************************//    
    wire if_valid,ld_valid,sd_valid;
    wire clint_skip_sd;
    wire if_ready,ld_ready,sd_ready;
    wire ld_pause,ti_pause,ld_pause_o;
    wire skip;
    wire id_bubble;
    wire ti_excep_r;
    wire [1:0] if_resp;
    
    wire [7:0]  sd_strb;
    wire [63:0] sd_data;
    wire [63:0] if_data_read,ld_data_read;
    wire [`YSYX210746_RW_ADDR_WIDTH-1:0] if_addr;
    wire [31:0] ld_addr,sd_addr;
    wire        inst_valid;

  

//************************** if stage **************************//
  wire [`YSYX210746_RW_ADDR_WIDTH-1:0] pc;
  wire [31 : 0] inst; 
  wire          fetched;
  wire          clear;
  wire          intr_clear;
  wire          jump_success;
  wire          exe_jump_success;
  wire          mem_jump_success;
  wire          wb_jump_success;
  wire          if_skip;


  //if_id_reg
  wire          id_skip;
  wire          id_inst_valid;
  wire [`YSYX210746_RW_ADDR_WIDTH-1:0] id_pc;
  wire [31 : 0] id_inst; 


//************************** id stage **************************//
// id_stage 
  wire rs1_r_ena;
  wire [4 : 0]  rs1_r_addr;
  wire rs2_r_ena;
  wire [4 : 0]  rs2_r_addr;
  wire rd_w_ena;
  wire [4 : 0]  rd_w_addr;
  wire csr_rd_ena;
  wire csr_wr_ena;
  wire ld_en;
  wire sd_en;

  wire  [2:0]   r_data1_mux;
  wire  [2:0]   r_data2_mux;
  wire  [63:0]  r_data1_o;
  wire  [63:0]  r_data2_o;

  wire [2 : 0]  inst_type;
  wire [6 : 0]  inst_data;
  wire [11 : 0] imm;
  wire [63 : 0] imm_shift;
  wire [`YSYX210746_REG_BUS]op2;

  // regfile 
  wire [`YSYX210746_REG_BUS] r_data1;
  wire [`YSYX210746_REG_BUS] r_data2;

  // ------- id_exe_reg -------
  wire          exe_skip;
  wire          exe_inst_valid;
  //pc
  wire [`YSYX210746_RW_ADDR_WIDTH-1:0]   exe_pc;
  wire [31:0]   exe_inst;
  // id_stage
  wire [4:0]    exe_rs1_r_addr;
  wire          exe_rd_w_ena;
  wire [4:0]    exe_rd_w_addr;   
  wire          exe_csr_wr_ena;
  wire          exe_csr_rd_ena;
  wire          exe_ld_en;
  wire          exe_sd_en;
  wire [6:0]    exe_inst_data;
  wire [2:0]    exe_inst_type;
  wire [11:0]   exe_imm; 
  wire [63:0]   exe_imm_shift; 

  //csr_reg
  wire  [63:0]  exe_r_data1;
  wire  [63:0]  exe_r_data2;

//************************** exe stage **************************//

  //------- exe_mem_reg -------//
  wire [`YSYX210746_REG_BUS]exe_data;
  wire [`YSYX210746_REG_BUS]csr_mepc_r;
  wire [`YSYX210746_REG_BUS]csr_mcause_r;
  wire [`YSYX210746_REG_BUS]csr_mstatus_r;
  wire [`YSYX210746_REG_BUS]exe_wr_mepc;
  wire [`YSYX210746_REG_BUS]exe_wr_mcause;
  wire [`YSYX210746_REG_BUS]exe_wr_mstatus;

  wire [`YSYX210746_REG_BUS]mem_wr_mepc;
  wire [`YSYX210746_REG_BUS]mem_wr_mcause;
  wire [`YSYX210746_REG_BUS]mem_wr_mstatus;
  wire [`YSYX210746_REG_BUS]wb_wr_mepc;
  wire [`YSYX210746_REG_BUS]wb_wr_mcause;
  wire [`YSYX210746_REG_BUS]wb_wr_mstatus;

  
  wire          mem_inst_valid;
  wire          mem_skip;
  //pc
  wire [`YSYX210746_RW_ADDR_WIDTH-1:0]   mem_pc;
  wire [31:0]   mem_inst;
  
// id_stage
  wire          mem_rd_w_ena;
  wire [4:0]    mem_rd_w_addr;   
  wire          mem_csr_wr_ena;
  wire          mem_csr_rd_ena;
  wire          mem_ld_en;
  wire          mem_sd_en;
  wire [6:0]    mem_inst_data;
  wire [11:0]   mem_imm;
  wire  [1:0]   mstatus_mux;
  wire  [1:0]   mepc_mux;
  wire  [1:0]   mcause_mux;
  wire  [1:0]   csr_data_mux;
  wire  [63:0]  mem_exe_data;
  wire  [63:0]  mem_csr_wr_data;
  wire  [63:0]  mem_r_data2;
  
//clint
  wire          clint_msip;   
  wire          clint_mtip; 
  wire  [63:0]  clint_rd_data;
  wire  [63:0]  ld_data_read_o;
  wire          ld_hs;

//continuous
  wire          con_ld;

//csr_reg 
  wire          ti_excep;
  wire  [63:0]  csr_data;
  wire  [63:0]  csr_wr_data;
  wire  [63:0]  mstatus_r;  //0x300  MRW
  wire  [63:0]  mtvec_r;    //0x301
  wire  [63:0]  mepc_r;     //0x341
  wire  [63:0]  mcause_r;   //0x342  

  wire  [63:0]  rd_mstatus_r;  
  wire  [63:0]  rd_mepc_r;     
  wire  [63:0]  rd_mcause_r;
  wire  [63:0]  rd_csr_data;
  wire  [63:0]  exe_rd_mstatus ;  
  wire  [63:0]  exe_rd_mepc ;     
  wire  [63:0]  exe_rd_mcause ;
  wire  [63:0]  exe_rd_csr_data;   

  wire  [63:0]  mem_rd_csr_data;
  wire  [63:0]  wb_rd_csr_data;         

// Access memory
  wire [63:0] dmem_rdata, dmem_wdata,dmem_addr;
  wire  clint_skip;
  wire [7:0] dmem_mask;
  wire dmem_ld_en,dmem_sd_en;
// Wb_reg
  wire [`YSYX210746_RW_ADDR_WIDTH-1:0] wb_pc;
  wire [6:0] wb_inst;
  wire        wb_rd_w_ena;
  wire [4:0]  wb_rd_w_addr;
  wire        wb_csr_wr_ena;
  wire        wb_csr_rd_ena;
  wire [11:0] wb_imm;
  wire [6:0]  wb_inst_data;
  wire          wb_skip;
  wire          wb_inst_valid;
// id_stage
  wire  [63:0]  wb_exe_data;
  wire  [63:0]  wb_csr_wr_data;
  wire  [63:0]  wb_reg_wdata;
  wire  [63:0]  wb_dmem_rdata;
// Difftest
  reg [`YSYX210746_REG_BUS] cmt_pc;
  wire [`YSYX210746_RW_ADDR_WIDTH-1:0] intr_pc;
  reg cmt_valid;
  reg trap;
  reg [63:0] cycleCnt;
  reg [63:0] instrCnt;


    assign ar_ready                 = io_master_arready;
    assign io_master_arvalid        = ar_valid;
    assign io_master_araddr         = ar_addr;
    assign io_master_arid           = ar_id;
    assign io_master_arlen          = ar_len;
    assign io_master_arsize         = ar_size;
    assign io_master_arburst        = ar_burst;
    
    
    assign io_master_rready         = r_ready;
    assign r_valid                  = io_master_rvalid;
    assign r_resp                   = io_master_rresp;// OKAY  EXOKAY  SLVERR  DECERR
    assign r_data                   = io_master_rdata;
    assign r_last                   = io_master_rlast;
    assign r_id                     = io_master_rid;

    
    assign aw_ready                 = io_master_awready;
    assign io_master_awvalid        = aw_valid;
    assign io_master_awaddr         = aw_addr;
    assign io_master_awid           = aw_id;
    assign io_master_awlen          = aw_len;
    assign io_master_awsize         = aw_size;
    assign io_master_awburst        = aw_burst;

    assign w_ready                  = io_master_wready;
    assign io_master_wvalid         = w_valid;
    assign io_master_wdata          = w_data;
    assign io_master_wstrb          = w_strb;
    assign io_master_wlast          = w_last;

    assign io_master_bready         = b_ready;
    assign b_valid                  = io_master_bvalid;
    assign b_resp                   = io_master_bresp;
    assign b_id                     = io_master_bid;
    
    assign        io_slave_awready  = 0;
  
    assign        io_slave_wready   = 0;

    assign        io_slave_bvalid   = 0;
    assign        io_slave_bresp    = 2'b0;
    assign        io_slave_bid      = 4'b0;
    assign        io_slave_arready  = 0;
  
    assign        io_slave_rvalid   = 0;
    assign        io_slave_rresp    = 2'b0;
    assign        io_slave_rdata    = 64'b0;
    assign        io_slave_rlast    = 0;
    assign        io_slave_rid      = 4'b0;


    ysyx_210746_axi_ctrl u_axi_ctrl(
        .clock                          (clock),
        .reset                          (reset),

        .if_valid                       (if_valid),  //input
        .if_addr                        (if_addr[31:0]),
        
        .ld_valid                       (ld_valid),
        .ld_addr                        (ld_addr),

        .sd_valid                       (sd_valid),
        .sd_strb                        (sd_strb),
        .sd_addr                        (sd_addr),
        .sd_data                        (sd_data),

        .if_ready                       (if_ready),//output
        .if_resp                        (if_resp),
        .if_data_read                   (if_data_read),

        .ld_ready                       (ld_ready),
        .ld_data_read                   (ld_data_read),
        .ld_pause                       (ld_pause),
        .ld_pause_o                     (ld_pause_o),//将axi_crtl中的axi_ar-addr输出筛选用ld_pasue_o来筛选，去掉flag标志
        .skip                           (skip),
        .id_bubble                      (id_bubble),
        .ti_excep_r                     (ti_excep_r),
        .mem_inst_data                  (mem_inst_data),

        .sd_ready                       (sd_ready),

        .axi_aw_ready_i                 (aw_ready),
        .axi_aw_valid_o                 (aw_valid),
        .axi_aw_addr_o                  (aw_addr),
        
        .axi_aw_id_o                    (aw_id),
        
        .axi_aw_len_o                   (aw_len),
        .axi_aw_size_o                  (aw_size),
        .axi_aw_burst_o                 (aw_burst),
   

        .axi_w_ready_i                  (w_ready),
        .axi_w_valid_o                  (w_valid),
        .axi_w_data_o                   (w_data),
        .axi_w_strb_o                   (w_strb),
        .axi_w_last_o                   (w_last),
 
        .axi_b_ready_o                  (b_ready),
        .axi_b_valid_i                  (b_valid),
        .axi_b_resp_i                   (b_resp),
        .axi_b_id_i                     (b_id),
        .axi_b_user_i                   (1'b0),

        .axi_ar_ready_i                 (ar_ready),
        .axi_ar_valid_o                 (ar_valid),
        .axi_ar_addr_o                  (ar_addr),
        .axi_ar_id_o                    (ar_id),
        .axi_ar_len_o                   (ar_len),
        .axi_ar_size_o                  (ar_size),
        .axi_ar_burst_o                 (ar_burst),
      
        
        .axi_r_ready_o                  (r_ready),
        .axi_r_valid_i                  (r_valid),
        .axi_r_resp_i                   (r_resp),
        .axi_r_data_i                   (r_data),
        .axi_r_last_i                   (r_last),
        .axi_r_id_i                     (r_id),
        .axi_r_user_i                   (1'b0)
    );

   
    assign  skip  = mem_skip || clint_skip;

//**********************If Stage**********************//

ysyx_210746_if_stage If_stage(
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .ti_excep           (ti_excep           ),//input
  .ld_pause           (ld_pause           ),//input 
  .ti_pause           (ti_pause           ),//input
  .id_bubble          (id_bubble          ),//input  

  .if_data_read       (if_data_read       ),//input [63:0]
  .if_addr            (if_addr            ),//input [31:0]
  .fetched            (fetched            ),//input 

  .skip               (if_skip            ),//output
  .pc                 (pc                 ),//output [63:0]
  .inst               (inst               ) //output [31:0]

);

ysyx_210746_if_id_reg  u_if_id_reg(
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .fetched            (fetched            ),//input
  .clear              (clear              ),//input
  .skip               (if_skip            ),//input
  .id_bubble          (id_bubble          ),//input 
  .ld_pause           (ld_pause           ),//input 
//   .ti_pause           (ti_pause           ),//input  
  .pc                 (pc                 ),//input [63:0]
  .inst               (inst               ),//input [31:0]
  
  .id_skip            (id_skip            ),//output  
  .id_inst_valid      (id_inst_valid      ),//output
  .id_pc              (id_pc              ),//output [63:0]
  .id_inst            (id_inst            ) //output [31:0]
);

//**********************Id Stage**********************//

ysyx_210746_if_addr_data_bypass  u_if_addr_data_bypass(
  .rs1_r_ena          (rs1_r_ena          ),//input
  .rs1_r_addr         (rs1_r_addr         ),//input [4:0]
  .rs2_r_ena          (rs2_r_ena          ),//input
  .rs2_r_addr         (rs2_r_addr         ),//input [4:0]
  .exe_rd_w_ena       (exe_rd_w_ena       ),//input
  .exe_rd_w_addr      (exe_rd_w_addr      ),//input [4:0] 
  .mem_rd_w_ena       (mem_rd_w_ena       ),//input
  .mem_rd_w_addr      (mem_rd_w_addr      ),//input [4:0]
  .wb_rd_w_ena        (wb_rd_w_ena        ),//input
  .wb_rd_w_addr       (wb_rd_w_addr       ),//input [4:0]
  .ld_en              (dmem_ld_en         ),//input

  .exe_csr_rd_ena     (exe_csr_rd_ena     ),//input
  .mem_csr_rd_ena     (mem_csr_rd_ena     ),//input
  .wb_csr_rd_ena      (wb_csr_rd_ena      ),//input

  .mem_skip           (mem_skip           ),//input
  .wb_skip            (wb_skip            ),//input
  
 
  .r_data1_mux        (r_data1_mux        ),//output [2:0] 
  .r_data2_mux        (r_data2_mux        ) //output [2:0]
);

ysyx_210746_if_addr_rdata_mux  u_if_addr_rdata_mux(
  .rst                (reset              ),//input
  .r_data1_mux        (r_data1_mux        ),//input [2:0] 
  .r_data2_mux        (r_data2_mux        ),//input [2:0]
  .r_data1            (r_data1            ),//input [63:0]
  .r_data2            (r_data2            ),//input [63:0]

  .mem_exe_data       (mem_exe_data       ),//input [63:0]
  .exe_data           (exe_data           ),//input [63:0]
  .wb_reg_wdata       (wb_reg_wdata       ),//input [63:0]
  .dmem_rdata         (dmem_rdata         ),//input [63:0]
  .exe_csr_data       (exe_rd_csr_data    ),//input [63:0]
  .mem_csr_data       (mem_rd_csr_data    ),//input [63:0]
  .wb_csr_data        (wb_rd_csr_data     ),//input [63:0]  还有一种情况是当需要读csr_reg里的status这个三个值时，exe或mem阶段有MRET等指令，会导致csr_wr_data变化不及时，但这里先不考虑，遇到再说

  .r_data1_o          (r_data1_o          ),//output [63:0]
  .r_data2_o          (r_data2_o          ) //output [63:0]
);


ysyx_210746_if_addr_gen u_if_addr_gen(
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .ti_excep           (ti_excep           ),//input
  .ti_excep_r         (ti_excep_r         ),//input
  .inst_data          (inst_data          ),//input [4:0]
  .imm_shift          (imm_shift          ),//input [63:0]
  .r_data1            (r_data1_o          ),//input [63:0]
  .r_data2            (r_data2_o          ),//input [63:0]
  .mtvec_r            (mtvec_r            ),//input [63:0] 选wb阶段的是因为产生时钟中断时，最新的还未提交，只能用已提交的  *先待定*
  .mepc_r             (mepc_r             ),//input [63:0]
  
  .sd_valid           (sd_valid           ),//input 
  .clint_skip_sd      (clint_skip_sd      ),//input 
  .ld_pause_o         (ld_pause_o         ),//input  
  .ti_pause           (ti_pause           ),//input
  .id_bubble          (id_bubble          ),//input

  .pc                 (id_pc              ),//output [63:0]
  .inst               (id_inst            ),//output [31:0]
  
  .if_ready           (if_ready           ),//input
  .if_resp            (if_resp            ),//input [1:0]

  .if_valid           (if_valid           ),//output 
//   .if_size            (if_size            ),//output [1:0] 
  .if_addr_o          (if_addr            ),//output [63:0]
  
  
  .clear              (clear              ),//output  跳转clear和中断clear合并在一起相对于if_stage
  .intr_clear         (intr_clear         ),//output
  .jump_success       (jump_success       ),//output
  .fetched            (fetched            ) //output 

);

ysyx_210746_bubble_gen  u_bubble_gen(
//   .inst_data          (inst_data          ),//input [4:0]
  .rs1_r_ena          (rs1_r_ena          ),//input
  .rs1_r_addr         (rs1_r_addr         ),//input [4:0]
  .rs2_r_ena          (rs2_r_ena          ),//input
  .rs2_r_addr         (rs2_r_addr         ),//input [4:0]
  .exe_rd_w_ena       (exe_rd_w_ena       ),//input
  .exe_rd_w_addr      (exe_rd_w_addr      ),//input [4:0] 
  .exe_ld_en          (exe_ld_en          ),//input


  .id_bubble          (id_bubble          )//output 是ld指令紧跟需要该寄存器值的指令  
  // .mem_bubble         (mem_bubble         ) //output 是sd后紧跟ld指令
);

ysyx_210746_id_stage Id_stage(
  .rst                (reset              ),//input
  .inst               (id_inst            ),//input
  .id_skip            (id_skip            ),//input
  
  .rs1_r_ena          (rs1_r_ena          ),//output 
  .rs1_r_addr         (rs1_r_addr         ),//output [4:0]
  .rs2_r_ena          (rs2_r_ena          ),//output 
  .rs2_r_addr         (rs2_r_addr         ),//output [4:0]
  .rd_w_ena           (rd_w_ena           ),//output           注意
  .rd_w_addr          (rd_w_addr          ),//output [4:0]
  .csr_rd_ena         (csr_rd_ena         ),//output 
  .csr_wr_ena         (csr_wr_ena         ),//output
  .ld_en              (ld_en              ),//output 
  .sd_en              (sd_en              ),//output  
  .inst_type          (inst_type          ),//output [2:0]
  .inst_data          (inst_data          ),//output [4:0]
  .imm                (imm                ),//output [11:0]
  .imm_shift          (imm_shift          ) //output [63:0]
);

  wire rd_r_ena  =  (ti_pause || wb_skip || ld_pause ) ? 0 :    wb_rd_w_ena && fetched  ; //因为load指令此时是在mem阶段完成，所以不需要再用ld_valid控制是否写入         

ysyx_210746_reg_file Regfile(
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .ti_excep           (ti_excep           ),//input
  .rd_r_addr          (wb_rd_w_addr       ),//input [4:0]
  .rd_r_ena           (rd_r_ena           ),//input
  .w_data             (wb_reg_wdata       ),//input [63:0]
  .rs1_r_addr         (rs1_r_addr         ),//input [4:0]
  .rs1_r_ena          (rs1_r_ena          ),//input
  .rs2_r_addr         (rs2_r_addr         ),//input [4:0]
  .rs2_r_ena          (rs2_r_ena          ),//input

  .r_data1            (r_data1            ),//output [63:0]
  .r_data2            (r_data2            ) //output [63:0]
);

ysyx_210746_clint    u_clint(
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .wr_en              (dmem_sd_en         ),//input
  .rd_en              (dmem_ld_en         ),//input 
  
  .reg_addr           (mem_exe_data       ),//input [63:0]
  .w_data             (dmem_wdata         ),//input [63:0]
   
  .rd_data            (clint_rd_data      ),//output [63:0]
  .clint_msip         (clint_msip         ),//output
  .clint_mtip         (clint_mtip         ) //output

);

//csr_reg和regfile有点不同，它是在id阶段就完成写入，并且读出的时候是一级一级的往下传，就不会和所在时刻的pc对不上, //但是会导致中断产生时原本，不应该执行的指令也产生了执行结果
ysyx_210746_csr_reg  u_csr_reg(
  .clk                (clock              ),//input 
  .rst                (reset              ),//input
  .csr_rd_ena         (csr_rd_ena         ),//input //csr_reg读还需要思考，像csr_data与r_data1之间的关系
  .csr_wr_ena         (wb_csr_wr_ena      ),//input 
  .clint_msip         (clint_msip         ),//input
  .clint_mtip         (clint_mtip         ),//input
  .inst_data          (wb_inst_data       ),//input [4:0]
  .wr_imm             (wb_imm             ),//input [11:0]
  .rd_imm             (imm                ),//input [11:0]
  
  .intr_pc            (intr_pc            ),//input [63:0]
  .csr_wr_data        (wb_csr_wr_data     ),//input [63:0] 


  .inst_valid         (inst_valid         ),//input 用inst_valid保证最后写入

  .ti_excep           (ti_excep           ),//output   
  
  .csr_data           (csr_data           ),//output [63:0]

  .mstatus_r_o        (mstatus_r          ),//output [63:0]
  .mepc_r_o           (mepc_r             ),//output [63:0]
  .mtvec_r_o          (mtvec_r            ),//output [63:0]
  .mcause_r_o         (mcause_r           ) //output [63:0]
 
);


ysyx_210746_csr_exe_bypass  u_csr_exe_bypass(
  .id_csr_wr_en       (csr_wr_ena         ),//input
  .exe_csr_wr_en      (exe_csr_wr_ena     ),//input
  .mem_csr_wr_en      (mem_csr_wr_ena     ),//input
  .wb_csr_wr_en       (wb_csr_wr_ena      ),//input

  .id_inst_data       (inst_data          ),//input [6:0]  
  .exe_inst_data      (exe_inst_data      ),//input [6:0]  
  .mem_inst_data      (mem_inst_data      ),//input [6:0]
  .wb_inst_data       (wb_inst_data       ),//input [6:0]  

  .id_imm             (imm                ),//input [11:0]  
  .exe_imm            (exe_imm            ),//input [11:0]  
  .mem_imm            (mem_imm            ),//input [11:0]
  .wb_imm             (wb_imm             ),//input [11:0]  


  .mstatus_mux        (mstatus_mux        ),//output [1:0]  
  .mepc_mux           (mepc_mux           ),//output [1:0]  
  .mcause_mux         (mcause_mux         ),//output [1:0]  
  .csr_data_mux       (csr_data_mux       ) //output [1:0]  

);

ysyx_210746_csr_data_mux  u_Csr_data_mux(
  .mstatus_mux        (mstatus_mux        ),//output [1:0]  
  .mepc_mux           (mepc_mux           ),//output [1:0]  
  .mcause_mux         (mcause_mux         ),//output [1:0]  
  .csr_data_mux       (csr_data_mux       ),//output [1:0]
  .id_imm             (imm                ),//input [11:0]

  .id_csr_data        (csr_data           ),//input [63:0]
  .id_mstatus         (mstatus_r          ),//input [63:0] 
  .id_mepc            (mepc_r             ),//input [63:0] 
  .id_mcause          (mcause_r           ),//input [63:0]

  .exe_csr_data       (csr_wr_data        ),//input [63:0]
  .exe_mstatus        (exe_wr_mstatus     ),//input [63:0] 
  .exe_mepc           (exe_wr_mepc        ),//input [63:0] 
  .exe_mcause         (exe_wr_mcause      ),//input [63:0]

  .mem_csr_data       (mem_csr_wr_data    ),//input [63:0]
  .mem_mstatus        (mem_wr_mstatus     ),//input [63:0] 
  .mem_mepc           (mem_wr_mepc        ),//input [63:0] 
  .mem_mcause         (mem_wr_mcause      ),//input [63:0]

  .wb_csr_data        (wb_csr_wr_data     ),//input [63:0]
  .wb_mstatus         (wb_wr_mstatus      ),//input [63:0] 
  .wb_mepc            (wb_wr_mepc         ),//input [63:0] 
  .wb_mcause          (wb_wr_mcause       ),//input [63:0]

  .mstatus_r_o        (rd_mstatus_r       ),//output [63:0]
  .mepc_r_o           (rd_mepc_r          ),//output [63:0]
  .mcause_r_o         (rd_mcause_r        ),//output [63:0]
  .csr_data_o         (rd_csr_data        ) //output [63:0]    

);


ysyx_210746_intr_excp_hold  u_intr_excp_hold(
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .fetched            (fetched            ),//input
  .ti_excep           (ti_excep           ),//input

  .ti_excep_r         (ti_excep_r         ) //output 标志产生中断时，到产生中断的该条指令的数据读回来时间

);

ysyx_210746_id_exe_reg  u_id_exe_reg (
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .fetched            (fetched            ),//input
  .clear              (intr_clear         ),//input
  .ld_pause           (ld_pause           ),//input 
  .id_skip            (id_skip            ),//input
  .id_bubble          (id_bubble          ),//input  
  .id_inst_valid      (id_inst_valid      ),//output
  //pc
  .id_pc              (id_pc              ),//input [63:0]
  .id_inst            (id_inst            ),//input [31:0]
  .jump_success       (jump_success       ),//output
   
  //id_stage
  .rs1_r_addr         (rs1_r_addr         ),//input [4:0]
  .rd_w_ena           (rd_w_ena           ),//input 
  .rd_w_addr          (rd_w_addr          ),//input [4:0]
  .csr_wr_ena         (csr_wr_ena         ),//input
  .csr_rd_ena         (csr_rd_ena         ),//input 
  .ld_en              (ld_en              ),//input 
  .sd_en              (sd_en              ),//input 
  .inst_type          (inst_type          ),//input [2:0]
  .inst_data          (inst_data          ),//input [4:0]
  .imm                (imm                ),//input [11:0]
  .imm_shift          (imm_shift          ),//input [63:0]

  //csr_rd_mux
  .rd_mstatus         (rd_mstatus_r       ),//input [63:0]
  .rd_mepc            (rd_mepc_r          ),//input [63:0]
  .rd_mcause          (rd_mcause_r        ),//input [63:0]
  .rd_csr_data        (rd_csr_data        ),//input [63:0]
  //reg_file
  .r_data1            (r_data1_o          ),//input [63:0]
  .r_data2            (r_data2_o          ),//input [63:0]
        

  .exe_skip           (exe_skip           ),//output  
  .exe_inst_valid     (exe_inst_valid     ),//output
  //pc
  .exe_pc             (exe_pc             ),//output [63:0]
  .exe_inst           (exe_inst           ),//output [31:0]
  .exe_jump_success   (exe_jump_success   ),//output
  //id_stage
  .exe_rs1_r_addr     (exe_rs1_r_addr     ),//output [4:0]

  .exe_rd_w_ena       (exe_rd_w_ena       ),//output
  .exe_rd_w_addr      (exe_rd_w_addr      ),//output [4:0]   
  .exe_csr_wr_ena     (exe_csr_wr_ena     ),//output
  .exe_csr_rd_ena     (exe_csr_rd_ena     ),//output
  .exe_ld_en          (exe_ld_en          ),//output 
  .exe_sd_en          (exe_sd_en          ),//output
  .exe_inst_data      (exe_inst_data      ),//output [6:0]  
  .exe_inst_type      (exe_inst_type      ),//output [2:0]
  .exe_imm            (exe_imm            ),//input [11:0]  
  .exe_imm_shift      (exe_imm_shift      ),//output [11:0]
  //csr_rd_mux
  .exe_rd_mstatus     (exe_rd_mstatus     ),//input [63:0]
  .exe_rd_mepc        (exe_rd_mepc        ),//input [63:0]
  .exe_rd_mcause      (exe_rd_mcause      ),//input [63:0]
  .exe_rd_csr_data    (exe_rd_csr_data    ),//input [63:0]
  //reg_file
  .exe_r_data1        (exe_r_data1        ),//output [63:0]
  .exe_r_data2        (exe_r_data2        ) //output [63:0]

);  


//**********************Exe Stage**********************//



ysyx_210746_exe_op2_mux u_exe_op2_mux(
  .rst                (reset              ),//input
  .inst_type          (exe_inst_type      ),//input [2:0]
  .exe_rdata2_mux     (exe_r_data2        ),//input [63:0]
  .imm_shift          (exe_imm_shift      ),//input [63:0]
  

  .op2                (op2                ) //output [63:0]
);

ysyx_210746_exe_stage u_exe_stage(
  .rst                (reset              ),//input
  .inst_data_i        (exe_inst_data      ),//input [6:0]
  .pc                 (exe_pc             ),//input [63:0]
  .op1                (exe_r_data1        ),//input [63:0]
  .op2                (op2                ),//input [63:0]
  
  .exe_data_o         (exe_data           ) //output [63:0]
);


ysyx_210746_csr_exe_stage  u_csr_exe_stage(
  .csr_wr_ena         (exe_csr_wr_ena     ),//input 
  .rs1_r_addr         (exe_rs1_r_addr     ),//input [4:0]
  .inst_data          (exe_inst_data      ),//input [4:0]
  .imm                (exe_imm            ),//input [11:0]
  .pc                 (exe_pc             ),//input [63:0]
  .r_data1            (exe_r_data1        ),//input [63:0]

  .mstatus_r          (exe_rd_mstatus     ),//input [63:0]
  .mepc_r             (exe_rd_mepc        ),//input [63:0]
  .mcause_r           (exe_rd_mcause      ),//input [63:0]
  .exe_rd_csr_data    (exe_rd_csr_data    ),//input [63:0]

  
  
  .csr_mepc_r         (csr_mepc_r         ),//output [63:0]
  .csr_mcause_r       (csr_mcause_r       ),//output [63:0]
  .csr_mstatus_r      (csr_mstatus_r      ),//output [63:0]
  .csr_wr_data        (csr_wr_data        ) //output [63:0]  
  
);

ysyx_210746_csr_exe_data_mux  u_csr_exe_data_mux(
  .inst_data          (exe_inst_data      ),//input [4:0]
  .exe_imm            (exe_imm            ),//input [11:0]
  .exe_csr_wr_ena     (exe_csr_wr_ena     ),//input 
  
  .exe_mstatus_r      (exe_rd_mstatus     ),//input [63:0]
  .exe_mepc_r         (exe_rd_mepc        ),//input [63:0]
  .exe_mcause_r       (exe_rd_mcause      ),//input [63:0]
  .csr_mepc_r         (csr_mepc_r         ),//input [63:0]
  .csr_mcause_r       (csr_mcause_r       ),//input [63:0]
  .csr_mstatus_r      (csr_mstatus_r      ),//input [63:0]
  .csr_wr_data        (csr_wr_data        ),//input [63:0]

  .mepc_r_o           (exe_wr_mepc        ),//output [63:0]
  .mcause_r_o         (exe_wr_mcause      ),//output [63:0]
  .mstatus_r_o        (exe_wr_mstatus     ) //output [63:0]

);

ysyx_210746_exe_mem_reg  u_exe_mem_reg (
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .fetched            (fetched            ),//input
  .clear              (intr_clear         ),//input
  .ld_pause           (ld_pause           ),//input 
  .exe_skip           (exe_skip           ),//input  
  .exe_inst_valid     (exe_inst_valid     ),//input
  //pc
  .exe_pc             (exe_pc             ),//input [63:0]
  .exe_inst           (exe_inst           ),//input [31:0]
  .exe_jump_success   (exe_jump_success   ),//input
  //id_stage
  .exe_rd_w_ena       (exe_rd_w_ena       ),//input
  .exe_rd_w_addr      (exe_rd_w_addr      ),//input [4:0]   
  .exe_csr_wr_ena     (exe_csr_wr_ena     ),//input
  .exe_csr_rd_ena     (exe_csr_rd_ena     ),//input
  .exe_ld_en          (exe_ld_en          ),//input 
  .exe_sd_en          (exe_sd_en          ),//input
  .exe_inst_data      (exe_inst_data      ),//input [6:0]  
  .exe_imm            (exe_imm            ),//input [11:0]  
  //csr_rd_mux

  .exe_rd_csr_data    (exe_rd_csr_data    ),//input [63:0]
  //csr_wr_mux
  .exe_wr_mepc        (exe_wr_mepc        ),//input [63:0]
  .exe_wr_mcause      (exe_wr_mcause      ),//input [63:0]
  .exe_wr_mstatus     (exe_wr_mstatus     ),//input [63:0]
  //exe_stage
  .exe_data           (exe_data           ),//input [63:0]
  //csr_exe_stage
  .csr_wr_data        (csr_wr_data        ),//input [63:0]
  //reg_file
  .exe_r_data2        (exe_r_data2        ),//input [63:0]
        

  .mem_skip           (mem_skip           ),//input  
  .mem_inst_valid     (mem_inst_valid     ),//input
  //pc
  .mem_pc             (mem_pc             ),//output [63:0]
  .mem_inst           (mem_inst           ),//output [31:0]
  .mem_jump_success   (mem_jump_success   ),//output
  //id_stage
  .mem_rd_w_ena       (mem_rd_w_ena       ),//output
  .mem_rd_w_addr      (mem_rd_w_addr      ),//output [4:0]   
  .mem_csr_wr_ena     (mem_csr_wr_ena     ),//output
  .mem_csr_rd_ena     (mem_csr_rd_ena     ),//output
  .mem_ld_en          (mem_ld_en          ),//output 
  .mem_sd_en          (mem_sd_en          ),//output
  .mem_inst_data      (mem_inst_data      ),//output [6:0]  
  .mem_imm            (mem_imm            ),//input [11:0]  
 
  //csr_rd_mux
  .mem_rd_csr_data    (mem_rd_csr_data    ),//input [63:0]
  //csr_wr_mux
  .mem_wr_mepc        (mem_wr_mepc        ),//input [63:0]
  .mem_wr_mcause      (mem_wr_mcause      ),//input [63:0]
  .mem_wr_mstatus     (mem_wr_mstatus     ),//input [63:0]
  //exe_stage
  .mem_exe_data       (mem_exe_data       ),//output [63:0]
  //csr_exe_stage
  .mem_csr_wr_data    (mem_csr_wr_data    ),//output [63:0]
  //reg_file
//   .mem_r_data1        (mem_r_data1        ),//output [63:0]
  .mem_r_data2        (mem_r_data2        ) //output [63:0]

);  



//**********************Mem Stage**********************//



ysyx_210746_dmem_wdata_mux  u_dmem_wdata_mux (
  .inst_data          (mem_inst_data      ),//input [6:0]
  .r_data2            (mem_r_data2        ),//input [63:0]
  .exe_data           (mem_exe_data       ),//input [2:0]
  
  
  .dmem_addr          (dmem_addr          ),//output [63:0]
  .dmem_mask          (dmem_mask          ),//output [7:0]
  .dmem_wdata         (dmem_wdata         ) //output [63:0]
);

assign dmem_ld_en = mem_ld_en && ~ti_pause ;//保证ti产生阶段读回错误的数据不起作用
assign dmem_sd_en = mem_sd_en && ~ti_pause ;

ysyx_210746_dmem_ctrl  u_dmem_ctrl(
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .skip               (mem_skip           ),//input
  .if_hs              (fetched            ),//input
  .ti_excep_r         (ti_excep_r         ),//input
  .ti_pause           (ti_pause           ),//input
  

  .mem_mask           (dmem_mask          ),//input [7:0]
  .mem_addr           (dmem_addr[31:0]    ),//input [31:0]
  .mem_wdata          (dmem_wdata         ),//input [63:0]
  
  .ld_en              (dmem_ld_en         ),//input 
  .ld_ready           (ld_ready           ),//input
  .ld_pause           (ld_pause           ),//input 

  .sd_en              (dmem_sd_en         ),//input 
  .sd_ready           (sd_ready           ),//input 

  .clint_skip         (clint_skip         ),//output
  .ld_valid           (ld_valid           ),//output
  .ld_hs              (ld_hs              ),//output
  .ld_addr            (ld_addr            ),//output [31:0]

  .sd_valid           (sd_valid           ),//output
  .clint_skip_sd      (clint_skip_sd      ),//output 

  .sd_strb            (sd_strb            ),//output [7:0]
  .sd_addr            (sd_addr            ),//output [31:0]
  .sd_data            (sd_data            ) //output [63:0]

);

ysyx_210746_pause_gen  u_Pause_gen(
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .ld_valid           (ld_valid           ),//input
  .con_ld             (con_ld             ),//input
  .fetched            (fetched            ),//input
  .ti_excep_r         (ti_excep_r         ),//input

  .ld_pause           (ld_pause           ),//output
  .ld_pause_o         (ld_pause_o         ),//output
  .ti_pause           (ti_pause           ) //output 标志这段时间为中断暂停时间，即给一个时间段让if_addr重新取数据，而pc在这段时间内不变，让二者之间的关系回到if_addr_o又比pc快
);

ysyx_210746_continuous u_continuous(
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .fetched            (fetched            ),//input
  .ld_valid           (ld_valid           ),//input
  .ld_hs              (ld_hs              ),//input


  .con_ld             (con_ld             ) //output
//   .con_sd             (con_sd             ) //output
);

ysyx_210746_ld_data_mux    u_ld_data_mux(
  .clint_skip         (clint_skip         ),//input
  .ld_data_read       (ld_data_read       ),//input [63:0]
  .clint_data_read    (clint_rd_data      ),//input [63:0]

  .ld_data_read_o     (ld_data_read_o     ) //output [63:0]

);

ysyx_210746_dmem_rdata_mux  u_dmem_rdata_mux(
  .inst_data_i        (mem_inst_data      ),//input [6:0]
  .exe_data           (mem_exe_data[2:0]  ),//input [63:0]
  .ld_data_read       (ld_data_read_o     ),//input [63:0]
  
  
  
  .dmem_rdata         (dmem_rdata         ) //output [63:0]
);


ysyx_210746_mem_wb_reg  u_mem_wb_reg (
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .fetched            (fetched            ),//input
  .mem_skip           (mem_skip           ),//input
  .mem_inst_valid     (mem_inst_valid     ),//input
  .clear              (intr_clear         ),//input
  .ld_pause           (ld_pause           ),//input 
  //pc
  .mem_pc             (mem_pc             ),//input [63:0]
  .mem_inst           (mem_inst[6:0]      ),//input [6:0]
  .mem_jump_success   (mem_jump_success   ),//output
  //id_stage
  .mem_rd_w_ena       (mem_rd_w_ena       ),//input
  .mem_rd_w_addr      (mem_rd_w_addr      ),//input [4:0]   
  .mem_csr_wr_ena     (mem_csr_wr_ena     ),//input
  .mem_csr_rd_ena     (mem_csr_rd_ena     ),//input
  .mem_inst_data      (mem_inst_data      ),//input [6:0]  
  .mem_imm            (mem_imm            ),//input [11:0]  

  .mem_rd_csr_data    (mem_rd_csr_data    ),//input [63:0]
  //csr_wr_mux
  .mem_wr_mepc        (mem_wr_mepc        ),//input [63:0]
  .mem_wr_mcause      (mem_wr_mcause      ),//input [63:0]
  .mem_wr_mstatus     (mem_wr_mstatus     ),//input [63:0]
  //exe_stage
  .mem_exe_data       (mem_exe_data       ),//input [63:0]
  //csr_exe_stage
  .mem_csr_wr_data    (mem_csr_wr_data    ),//input [63:0]

  //load
  .dmem_rdata         (dmem_rdata         ),//input [63:0]
  .wb_skip            (wb_skip            ),//output
  .wb_inst_valid      (wb_inst_valid      ),//output
  //pc
  .wb_pc              (wb_pc              ),//output [63:0]
  .wb_inst            (wb_inst            ),//output [6:0]
  .wb_jump_success    (wb_jump_success    ),//output
  //id_stage
  .wb_rd_w_ena        (wb_rd_w_ena        ),//output
  .wb_rd_w_addr       (wb_rd_w_addr       ),//output [4:0]   
  .wb_csr_wr_ena      (wb_csr_wr_ena      ),//output
  .wb_csr_rd_ena      (wb_csr_rd_ena      ),//output
  .wb_inst_data       (wb_inst_data       ),//output [6:0]  
  .wb_imm             (wb_imm             ),//input [11:0]      
  
  .wb_rd_csr_data     (wb_rd_csr_data     ),//input [63:0]
  //csr_wr_mux 
  .wb_wr_mepc         (wb_wr_mepc         ),//input [63:0]
  .wb_wr_mcause       (wb_wr_mcause       ),//input [63:0]
  .wb_wr_mstatus      (wb_wr_mstatus      ),//input [63:0]
  //exe_stage
  .wb_exe_data        (wb_exe_data        ),//output [63:0]
  .wb_csr_wr_data     (wb_csr_wr_data     ),//output [63:0]  是写入csr_reg的
  //reg_file
  .wb_dmem_rdata      (wb_dmem_rdata      ) //output [63:0]

);  
//**********************Wb Stage**********************//  


ysyx_210746_reg_wdata_mux  u_reg_wdata_mux(
  .inst_data_i        (wb_inst_data       ),//input [6:0]
  .exe_data           (wb_exe_data        ),//input [63:0]
  .dmem_rdata         (wb_dmem_rdata      ),//input [63:0]
  .csr_data           (wb_rd_csr_data     ),//input [63:0]
  
  .reg_wdata          (wb_reg_wdata       ) //output [63:0]
);

ysyx_210746_record_commit_pc  u_record_commit_pc(
  .clk                (clock              ),//input
  .rst                (reset              ),//input
  .commit_valid       (cmt_valid          ),//input [63:0]
  .commit_pc          (cmt_pc             ),//input [63:0]
  .jump_success       (jump_success       ),//input
  .wb_jump_success    (wb_jump_success    ),//input
  .jump_pc            (id_pc              ),//input [63:0]
  .jump_dest_pc       (if_addr            ),//input [63:0]
  .inst_valid         (inst_valid         ),//input 清零的时候用inst_valid
  .fetched            (fetched            ),//input 取数的时候用fetched
  .id_inst_valid      (id_inst_valid      ),//input
  .ti_excep           (ti_excep           ),//input

  .intr_pc            (intr_pc            ) //output [63:0]
);
 
//只有inst_valid有效时 skip信号才有用
assign inst_valid =  wb_inst_valid && fetched && ~ld_pause && ~ti_excep_r && ~ti_pause;

always @(posedge clock) begin
  if (reset) begin
    { cmt_pc,  cmt_valid, trap,  cycleCnt, instrCnt} <= 0;
  end
  else if (~trap) begin
    cmt_pc    <= wb_pc;
    cmt_valid <= inst_valid;
    trap      <= wb_inst[6:0] == 7'h6b;
    cycleCnt  <= cycleCnt + 1;
    instrCnt  <= instrCnt + {63'b0,inst_valid};
  end
end


endmodule

 

