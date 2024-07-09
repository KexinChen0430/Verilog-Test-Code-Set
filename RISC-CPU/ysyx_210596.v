//yx
//`timescale 1ns / 1ps
//`ifndef MYCPU_H
	`define YSYX210596_BR_BUS_WD        66
	`define YSYX210596_FS_TO_DS_BUS_WD  96
	`define YSYX210596_DS_TO_ES_BUS_WD  345
	`define YSYX210596_ES_TO_MS_BUS_WD  260
	`define YSYX210596_MS_TO_WS_BUS_WD  246
	`define YSYX210596_WS_TO_RF_BUS_WD  70
	`define YSYX210596_WS_TO_CSR_BUS_WD 129 
	`define YSYX210596_WS_EXCEPT_BUS_WD 133 
//`endif


`define YSYX210596_PC_START    64'h00000000_30000000  
`define YSYX210596_OFFSET_TEST 64'h80000000_00000000
`define YSYX210596_RISCV_PRIV_MODE_U   0
`define YSYX210596_RISCV_PRIV_MODE_S   1
`define YSYX210596_RISCV_PRIV_MODE_M   3
`define YSYX210596_REG_BUS    63 : 0  

//AXI
`define YSYX210596_AXI_ADDR_WIDTH     64
`define YSYX210596_AXI_DATA_WIDTH 	   64
`define YSYX210596_AXI_ID_WIDTH       4
`define YSYX210596_AXI_USER_WIDTH 	   1

`define YSYX210596_SIZE_B             2'b00
`define YSYX210596_SIZE_H             2'b01
`define YSYX210596_SIZE_W             2'b10
`define YSYX210596_SIZE_D             2'b11
//`include "defines.v"
//`define AXI_TOP_INTERFACE(name) io_master_``name

module ysyx_210596(
    input                               clock,
    input                               reset,
    input                               io_interrupt,
	//change
	input                               io_master_awready,
    output                              io_master_awvalid,
    output [31:0]      io_master_awaddr,
    output [3:0]      io_master_awid,
    output [7:0]      io_master_awlen,
    output [2:0]      io_master_awsize,
    output [1:0]      io_master_awburst,

    
    input                               io_master_wready,
    output                              io_master_wvalid,
    output [63:0]      io_master_wdata,
    output [7:0]      io_master_wstrb,
    output                              io_master_wlast,
    
    output                              io_master_bready,
    input                               io_master_bvalid,
    input  [1:0]      io_master_bresp,
    input  [3:0]      io_master_bid,

    input                               io_master_arready,
    output                              io_master_arvalid,
    output [31:0]      io_master_araddr,
    output [3:0]      io_master_arid,
    output [7:0]      io_master_arlen,
    output [2:0]      io_master_arsize,
    output [1:0]      io_master_arburst,
    
    output                              io_master_rready,
    input                               io_master_rvalid,
    input  [1:0]      io_master_rresp,
    input  [63:0]      io_master_rdata,
    input                               io_master_rlast,
    input  [3:0]      io_master_rid,


//slave



	output                             io_slave_awready,
    input                              io_slave_awvalid,
    input [31:0]      io_slave_awaddr,
    input [3:0]      io_slave_awid,
    input [7:0]      io_slave_awlen,
    input [2:0]      io_slave_awsize,
    input [1:0]      io_slave_awburst,

    output                             io_slave_wready,
    input                              io_slave_wvalid,
    input [63:0]      io_slave_wdata,
    input [7:0]      io_slave_wstrb,
    input                              io_slave_wlast,
    
    input                              io_slave_bready,
    output                             io_slave_bvalid,
    output  [1:0]    io_slave_bresp,
    output  [3:0]    io_slave_bid,

    output                             io_slave_arready,
    input                              io_slave_arvalid,
    input [31:0]      io_slave_araddr,
    input [3:0]      io_slave_arid,
    input [7:0]      io_slave_arlen,
    input [2:0]      io_slave_arsize,
    input [1:0]      io_slave_arburst,

    input                              io_slave_rready,
    output                             io_slave_rvalid,
    output  [1:0]    io_slave_rresp,
    output  [63:0]    io_slave_rdata,
    output                             io_slave_rlast,
    output  [3:0]    io_slave_rid  



);

	assign io_slave_awready = 1'b0 ;
	assign io_slave_wready  = 1'b0 ;
	assign io_slave_bvalid  = 1'b0 ;
	assign io_slave_bresp   = 2'b0 ;
	assign io_slave_bid     = 4'b0 ;
	assign io_slave_arready = 1'b0 ;
	assign io_slave_rvalid  = 1'b0 ;
	assign io_slave_rresp   = 2'b0 ;
	assign io_slave_rdata   = 64'h0;
	assign io_slave_rlast   = 1'b0 ;
	assign io_slave_rid     = 4'b0 ;


	wire [  `YSYX210596_AXI_USER_WIDTH-1:0]      io_master_buser;
	wire [  `YSYX210596_AXI_USER_WIDTH-1:0]      io_master_ruser;

	assign io_master_buser = 1'b0;
	assign io_master_ruser = 1'b0;

    wire                         aw_ready;
    wire                         aw_valid;
    wire [  `YSYX210596_AXI_ADDR_WIDTH-1:0] aw_addr;
    //wire [                  2:0] aw_prot;
    wire [    `YSYX210596_AXI_ID_WIDTH-1:0] aw_id;
    //wire [  `AXI_USER_WIDTH-1:0] aw_user;    
    wire [                  7:0] aw_len;
    wire [                  2:0] aw_size;
    wire [                  1:0] aw_burst;
    //wire [1:0]                        aw_lock;  //may be wrong
    //wire [                  3:0] aw_cache;
    //wire  aw_qos;
    //wire aw_region;

    wire                         w_ready;
    wire                         w_valid;
    wire [  `YSYX210596_AXI_DATA_WIDTH-1:0] w_data;
    wire [`YSYX210596_AXI_DATA_WIDTH/8-1:0] w_strb;
    wire                         w_last;
    //wire [  `AXI_USER_WIDTH-1:0] w_user;
    
    wire                         b_ready;
    wire                         b_valid;
    //wire [                  1:0] b_resp;
    //wire [    `AXI_ID_WIDTH-1:0] b_id;
    //wire [  `AXI_USER_WIDTH-1:0] b_user;

    wire                         ar_ready;
    wire                         ar_valid;
    wire [  `YSYX210596_AXI_ADDR_WIDTH-1:0] ar_addr;
    //wire [                  2:0] ar_prot; 
    wire [    `YSYX210596_AXI_ID_WIDTH-1:0] ar_id;
    //wire [  `AXI_USER_WIDTH-1:0] ar_user;
    wire [                  7:0] ar_len;
    wire [                  2:0] ar_size;
    wire [                  1:0] ar_burst;
    //wire [1:0]                        ar_lock;   //may be wrong
    //wire [                  3:0] ar_cache;
    //wire [                  3:0] ar_qos;
    //wire [                  3:0] ar_region;
    
    wire                         r_ready;
    wire                         r_valid;
    //wire [                  1:0] r_resp;
    wire [  `YSYX210596_AXI_DATA_WIDTH-1:0] r_data;
    //wire                         r_last;
    //wire [    `AXI_ID_WIDTH-1:0] r_id;
    //wire [  `AXI_USER_WIDTH-1:0] r_user;

   //ar
    assign ar_ready                 = io_master_arready;
    assign io_master_arvalid        = ar_valid;
    assign io_master_araddr         = ar_addr[31:0];
    //assign `AXI_TOP_INTERFACE(arprot)         = ar_prot;
    assign io_master_arid           = ar_id;
    //assign `AXI_TOP_INTERFACE(aruser)         = ar_user;
    assign io_master_arlen          = ar_len;
    assign io_master_arsize         = ar_size;
    assign io_master_arburst        = ar_burst;
    //assign `AXI_TOP_INTERFACE(arlock)         = ar_lock;
    //assign `AXI_TOP_INTERFACE(arcache)        = ar_cache;
    //assign `AXI_TOP_INTERFACE(arqos)          = ar_qos;
  
  //r
    assign io_master_rready         = r_ready;
    assign r_valid                  = io_master_rvalid;
    //assign r_resp                   = io_master_rresp;
    assign r_data                   = io_master_rdata;
    //assign r_last                   = io_master_rlast;
    //assign r_id                     = io_master_rid;
    //assign r_user                   = io_master_ruser;
 
  //aw
    assign aw_ready                 = io_master_awready;
    assign io_master_awvalid        = aw_valid;
    assign io_master_awaddr         = aw_addr[31:0];
    //assign `AXI_TOP_INTERFACE(awprot)         = aw_prot;
    assign io_master_awid           = aw_id;
    //assign `AXI_TOP_INTERFACE(awuser)         = aw_user;
    assign io_master_awlen          = aw_len;
    assign io_master_awsize         = aw_size;
    assign io_master_awburst        = aw_burst;
    //assign `AXI_TOP_INTERFACE(awlock)         = aw_lock;
    //assign `AXI_TOP_INTERFACE(awcache)        = aw_cache;
    //assign `AXI_TOP_INTERFACE(awqos)          = aw_qos;

  //w
    assign w_ready                  = io_master_wready;
    assign io_master_wvalid         = w_valid;
    assign io_master_wdata           = w_data;
    assign io_master_wstrb          = w_strb;
    assign io_master_wlast          = w_last;
    
  //b
    assign io_master_bready         = b_ready;
    assign b_valid                  = io_master_bvalid;
    //assign b_resp                   = io_master_bresp;
    //assign b_id                     = io_master_bid;
    //assign b_user                   = io_master_buser;
    
    wire   clk;
    assign clk = clock;
    //wire   resetn;
    //assign resetn = ~reset;

    //inst sram-like,
    wire         inst_req     ;
    wire         inst_wr      ;
    wire  [ 1:0] inst_size    ;
    wire  [63:0] inst_addr    ; 
    wire  [63:0] inst_wdata   ;
    wire  [63:0] inst_rdata   ;
    wire         inst_addr_ok ;
    wire         inst_data_ok ;
    //data sram-like
    wire         data_req     ;    
    wire         data_wr      ;
    wire  [ 1:0] data_size    ;
    wire  [63:0] data_addr    ;
    wire  [63:0] data_wdata   ;
    wire  [63:0] data_rdata   ;
    wire         data_addr_ok ;
    wire         data_data_ok ;



ysyx_210596_cpu_axi_interface u_cpu_axi_interface(
	//ports
	.clk          		( clk          		),
	.reset       	  	( reset       		),

	.inst_req     		( inst_req     		),
	.inst_wr      		( inst_wr      		),
	.inst_size    		( {1'b0,inst_size}  ),
	.inst_addr    		( inst_addr    		),
	.inst_wdata   		( inst_wdata   		),
	.inst_rdata   		( inst_rdata   		),
	.inst_addr_ok 		( inst_addr_ok 		),
	.inst_data_ok 		( inst_data_ok 		),
	.data_req     		( data_req     		),
	.data_wr      		( data_wr      		),
	.data_size    		( {1'b0,data_size}  ),
	.data_addr    		( data_addr    		),
	.data_wdata   		( data_wdata   		),
	.data_rdata   		( data_rdata   		),
	.data_addr_ok 		( data_addr_ok 		),
	.data_data_ok 		( data_data_ok 		),

	.arid         		( ar_id         		),
	.araddr       		( ar_addr       		),
	.arlen        		( ar_len        		),
	.arsize       		( ar_size       		),
	.arburst      		( ar_burst      		),
	//.arlock       		( ar_lock       		),
	//.arcache      		( ar_cache      		),
	//.arprot       		( ar_prot       		),
	//.aruser       		( ar_user       		),
	//.arqos        		( ar_qos        		),
	//.arregion     		( ar_region     		),
	.arvalid      		( ar_valid      		),
	.arready      		( ar_ready      		),

	//.rid          		( r_id          		),
	//.ruser        		( r_user        		),
	.rdata        		( r_data        		),
	//.rresp        		( r_resp        		),
	//.rlast        		( r_last        		),
	.rvalid       		( r_valid       		),
	.rready       		( r_ready       		),

	.awid         		( aw_id         		),
	.awaddr       		( aw_addr       		),
	.awlen        		( aw_len        		),
	.awsize       		( aw_size       		),
	.awburst      		( aw_burst      		),
	//.awlock       		( aw_lock       		),
	//.awcache      		( aw_cache      		),
	//.awprot       		( aw_prot       		),
	//.awuser       		( aw_user       		),
	//.awqos        		( aw_qos        		),
	//.awregion     		( aw_region     		),
	.awvalid      		( aw_valid      		),
	.awready      		( aw_ready      		),

	//.wuser        		( w_user        		),
	.wdata        		( w_data        		),
	.wstrb        		( w_strb        		),
	.wlast        		( w_last        		),
	.wvalid       		( w_valid       		),
	.wready       		( w_ready       		),

	//.bid          		( b_id          		),
	//.buser        		( b_user        		),
	//.bresp        		( b_resp        		),
	.bvalid       		( b_valid       		),
	.bready       		( b_ready       		)
);

//wire        io_uart_out_valid;
//wire [ 7:0] io_uart_out_ch   ;

ysyx_210596_cpu u_cpu(
	//ports
	.clock             		( clock           ),
	.reset             		( reset           ),

	.inst_sram_wr      		( inst_wr      		),
	.inst_sram_req     		( inst_req     		),
	//.inst_sram_addr_ok 		( inst_addr_ok 		),
	.inst_sram_data_ok 		( inst_data_ok 		),
	.inst_sram_addr    		( inst_addr    		),
	.inst_sram_wdata   		( inst_wdata   		),
	.inst_sram_rdata   		( inst_rdata   		),
	.inst_sram_size    		( inst_size    		),

	.data_sram_wr      		( data_wr      		),
	.data_sram_req     		( data_req     		),
	.data_sram_addr_ok 		( data_addr_ok 		),
	.data_sram_data_ok 		( data_data_ok 		),
	.data_sram_addr    		( data_addr    		),
	.data_sram_wdata   		( data_wdata   		),
	.data_sram_rdata   		( data_rdata   		),
	.data_sram_size    		( data_size    		)
    //.io_uart_out_valid    (io_uart_out_valid    ),
    //.io_uart_out_ch       ( io_uart_out_ch      )
);

endmodule

//--Yangxin--

//`include "defines.v"
module ysyx_210596_cpu_axi_interface(
    input   wire clk                  ,
    input   wire reset                ,

    //inst sram-like,
    input   wire         inst_req     ,
    input   wire         inst_wr      ,
    input   wire  [ 2:0] inst_size    ,
    input   wire  [63:0] inst_addr    , 
    input   wire  [63:0] inst_wdata   ,
    output  wire  [63:0] inst_rdata   ,
    output  wire         inst_addr_ok ,
    output  wire         inst_data_ok ,
    //data sram-like
    input   wire         data_req     ,    
    input   wire         data_wr      ,
    input   wire  [ 2:0] data_size    ,
    input   wire  [63:0] data_addr    ,
    input   wire  [63:0] data_wdata   ,
    output  wire  [63:0] data_rdata   ,
    output  wire         data_addr_ok ,
    output  wire         data_data_ok ,

    //axi
    //ar
    output  wire  [ 3:0] arid         ,
    output  wire  [63:0] araddr       ,
    output  wire  [ 7:0] arlen        ,
    output  wire  [ 2:0] arsize       ,
    output  wire  [ 1:0] arburst      ,
    //output  wire  [ 1:0] arlock       ,   //weikuan
    //output  wire  [ 3:0] arcache      ,
    //output  wire  [ 2:0] arprot       ,
    //output  wire         aruser       ,
    //output  wire  [ 3:0] arqos        ,
    //output  wire  [ 3:0] arregion     ,
    output  wire         arvalid      ,
    input   wire         arready      ,
    //r
    //input   wire  [ 3:0] rid          ,
    //input   wire         ruser        ,
    input   wire  [63:0] rdata        ,
    //input   wire  [ 1:0] rresp        ,
    //input   wire         rlast        ,
    input   wire         rvalid       ,
    output  wire         rready       ,
    //aw
    output  wire  [ 3:0] awid         ,
    output  wire  [63:0] awaddr       ,
    output  wire  [ 7:0] awlen        ,
    output  wire  [ 2:0] awsize       ,
    output  wire  [ 1:0] awburst      ,
    //output  wire  [ 1:0] awlock       ,
    //output  wire  [ 3:0] awcache      ,
    //output  wire  [ 2:0] awprot       ,
    //output  wire         awuser       ,
    //output  wire         awqos        ,
    //output  wire         awregion     ,
    output  wire         awvalid      ,
    input   wire         awready      ,
    //w
    //output  wire  [ 3:0] wid        ,
    //output  wire         wuser        ,
    output  wire  [63:0] wdata        ,
    output  wire  [ 7:0] wstrb        ,
    output  wire         wlast        ,
    output  wire         wvalid       ,
    input   wire         wready       ,
    //b
    //input   wire  [ 3:0] bid          ,
    //input   wire         buser        ,
    //input   wire  [ 1:0] bresp        ,
    input   wire         bvalid       ,
    output  wire         bready
);



//addr
reg        do_req    ;
reg        do_req_or ;  //req is inst or data;1:data;0:inst
reg        do_wr_r   ;
reg [ 2:0] do_size_r ;
reg [63:0] do_addr_r ;
reg [63:0] do_wdata_r;

//reg [63:0] do_addr_r_w;

wire   data_back;
assign inst_addr_ok = !do_req && !data_req;
assign data_addr_ok = !do_req;

always @(posedge clk) begin
    do_req     <= reset                             ? 1'b0 :
                  (inst_req || data_req) && !do_req ? 1'b1 :
                  data_back                         ? 1'b0 : do_req;

    do_req_or  <= reset ? 1'b0:
                  !do_req ? data_req : do_req_or;

    do_wr_r    <= reset                    ? 1'b0    :
                  data_req && data_addr_ok ? data_wr :
                  inst_req && inst_addr_ok ? inst_wr : do_wr_r;

    do_size_r  <= reset                    ? 3'b00     :
                  data_req && data_addr_ok ? data_size :
                  inst_req && inst_addr_ok ? inst_size : do_size_r;

    do_addr_r  <= reset                    ? 64'h0     :
                  data_req && data_addr_ok ? data_addr :
                  inst_req && inst_addr_ok ? inst_addr : do_addr_r;
    // do_addr_r_w<= reset                    ? 64'h0     :
    //               data_req && data_addr_ok ? {data_addr[63:2],2'b0} :
    //               inst_req && inst_addr_ok ? inst_addr : do_addr_r;

    do_wdata_r <= reset                    ? 64'h0      :
                  data_req && data_addr_ok ? data_wdata :
                  inst_req && inst_addr_ok ? inst_wdata : do_wdata_r;
end 

//inst sram-like
assign inst_data_ok = do_req && !do_req_or && data_back;
assign data_data_ok = do_req &&  do_req_or && data_back;
assign inst_rdata   = (araddr[2] == 1'b0) ? {32'h0,rdata[31:0]} :
                                            {32'h0,rdata[63:32]};
assign data_rdata   = rdata;

//axi
reg addr_rcv;
reg wdata_rcv;

assign data_back = addr_rcv && (rvalid && rready || bvalid && bready);

always @(posedge clk) begin
    addr_rcv <= reset                ? 1'b0:
                (arvalid && arready) ? 1'b1:
                (awvalid && awready) ? 1'b1:
                data_back            ? 1'b0: addr_rcv;

    wdata_rcv <= reset            ? 1'b0:
                 wvalid && wready ? 1'b1:
                 data_back        ? 1'b0: wdata_rcv;
end

// reg addr_rcv_d1;
// always @(posedge clk) begin
//     addr_rcv_d1 <= addr_rcv;
// end

//ar
assign arid     = 4'd0                           ;
assign araddr   = do_addr_r                      ;
//assign araddr   = {do_addr_r[63:2],2'b0}         ;
assign arlen    = 8'd0                           ;
//assign arsize   = do_size_r                      ;
assign arsize   = araddr[31] ? 3'd3 : 3'd2       ;
assign arburst  = 2'd1                           ;
//assign arlock   = 2'd0                           ;
//assign arcache  = 4'd0                           ;
//assign arprot   = 3'd0                           ;
//assign aruser   = 1'b0                           ;
//assign arqos    = 4'b0                           ;
//assign arregion = 4'b0                           ;
assign arvalid  = do_req && !do_wr_r && !addr_rcv;
//r
assign rready  = 1'b1                            ;

//aw
assign awid     = 4'd0                           ;
assign awaddr   = do_addr_r                      ;
//assign awaddr   = {do_addr_r[63:2],2'b0}         ;
assign awlen    = 8'd0                           ;
assign awsize   = awaddr[31] ? 3'd3 : 3'd2                       ;//11.27
//assign awsize   = 3'd3                           ;
assign awburst  = 2'd1                           ;
//assign awlock   = 2'd0                           ;
//assign awcache  = 4'd0                           ;
//assign awprot   = 3'd0                           ;
//assign awuser   = 1'b0                           ;
//assign awqos    = 1'b0                           ;
//assign awregion = 1'b0                           ;
assign awvalid  = do_req && do_wr_r && !addr_rcv ;
//w
//assign wid     = 4'd0                         ;
assign wdata   = do_wdata_r                     ;
assign wstrb   = (do_size_r[1:0] == 2'b00) ? 8'b0000_0001<<do_addr_r[2:0] :
                 (do_size_r[1:0] == 2'b01) ? 8'b0000_0011<<{do_addr_r[2:1],1'b0} :
                 (do_size_r[1:0] == 2'b10) ? 8'b0000_1111<<{do_addr_r[2],2'b0}   :
                 (do_size_r[1:0] == 2'b11) ? 8'b1111_1111                 :
                                             8'b1111_1111                 ;
// assign wstrb   = (do_size_r[2:1] == 2'b00) ? 8'b0000_0001 :
//                  (do_size_r[2:1] == 2'b01) ? 8'b0000_0011<<do_addr_r[2:1] :
//                  (do_size_r[2:1] == 2'b10) ? 8'd0000_1111<<do_addr_r[2]   :
//                  (do_size_r[2:1] == 2'd11) ? 8'd1111_1111                 :
//                                       8'd1111_1111                   ;
assign wlast   = 1'b1;
assign wvalid  = do_req && do_wr_r && !wdata_rcv;
//assign wuser   = 1'b0                           ;
//b
assign bready = 1'b1;

endmodule

//`include "defines.v"

module ysyx_210596_cpu(
    input  wire        clock            ,
    input  wire        reset            ,
    
    //inst sram interface
    output wire        inst_sram_wr     ,
    output wire        inst_sram_req    ,
    //input  wire        inst_sram_addr_ok,
    input  wire        inst_sram_data_ok,
    output wire [63:0] inst_sram_addr   ,
    output wire [63:0] inst_sram_wdata  ,
    input  wire [63:0] inst_sram_rdata  ,
    output wire [ 1:0] inst_sram_size   ,     

    //data sram interface
    output wire        data_sram_wr     ,
    output wire        data_sram_req    ,
    input  wire        data_sram_addr_ok,
    input  wire        data_sram_data_ok,
    output wire [63:0] data_sram_addr   ,
    output wire [63:0] data_sram_wdata  ,
    input  wire [63:0] data_sram_rdata  ,
    output wire [ 1:0] data_sram_size   

    //output wire        io_uart_out_valid,
    //output wire [ 7:0] io_uart_out_ch 

);

localparam CSR_MCYCLE = 12'hb00;
// if_stage
wire [63:0] pc;
wire [31:0] inst;


//wire        rd_w_ena;
//wire [4:0]  rd_w_addr;

// regfile -> id_stage

// regfile -> difftest
//wire [`REG_BUS] regs[0:31];

// exe_stage
// exe_stage -> other stage
// exe_stage -> regfile
//wire [`REG_BUS] rd_data;


wire        clk;
assign clk = clock;

// wire        inst_sram_en;
// wire [7:0]  inst_sram_wen;
// wire [63:0] inst_sram_addr;
// wire [63:0] inst_sram_wdata;
// wire [31:0] inst_sram_rdata;
// wire        data_sram_wr_rd;

//trace debug inteface: I think it is similar to difftest
wire [                 63:0] debug_wb_pc      ;
wire [                 31:0] debug_wb_inst    ; 
assign pc   = debug_wb_pc  ;
assign inst = debug_wb_inst;

// wire                         data_sram_en   ;
//   wire [                  7:0] data_sram_wen  ;
// wire [                 63:0] data_sram_addr ;
// wire [                 63:0] data_sram_wdata;
// wire [				         63:0] data_sram_mask ;
// wire [                 63:0] data_sram_rdata;


wire                         ds_allowin    ;
wire                         es_allowin    ;
wire                         ms_allowin    ;
wire                         ws_allowin    ;
wire                         fs_to_ds_valid;
wire                         ds_to_es_valid;
wire                         es_to_ms_valid;
wire                         ms_to_ws_valid;
wire [`YSYX210596_FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus  ;
wire [`YSYX210596_DS_TO_ES_BUS_WD -1:0] ds_to_es_bus  ;
wire [`YSYX210596_ES_TO_MS_BUS_WD -1:0] es_to_ms_bus  ;
wire [`YSYX210596_MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus  ;
wire [`YSYX210596_WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus  ;
wire [`YSYX210596_BR_BUS_WD        -1:0] br_bus        ;
wire [				         69:0] es_to_ds_fwd  ;
wire [                 68:0] ms_to_ds_fwd  ;
wire [                 68:0] ws_to_ds_fwd  ;

//csr
wire [                128:0] csr_ms_to_es_fwd;
wire [				        128:0] csr_ws_to_es_fwd;

//to csr_regs
wire [				         63:0] csr_regs_raddr  ;
wire [				         63:0] csr_regs_rdata  ;

wire [`YSYX210596_WS_TO_CSR_BUS_WD-1:0] ws_to_csr_bus   ;



//wire [63:0] regs[0:31];


//wire 						             debug_wb_rf_we   ;
//wire [                  4:0] debug_wb_rf_waddr;
//wire [                 63:0] debug_wb_rf_wdata;  
wire                         debug_wb_valid   ;

//except
wire                         except_flush     ;
wire [				         63:0] except_new_pc    ;

wire [                 63:0] csr_mtvec_to_ws  ;
wire [                 63:0] csr_mepc_to_ws   ;
wire [                 63:0] csr_mstatus_to_ws;
wire                         csr_mie_mtie_to_ws;
wire [`YSYX210596_WS_EXCEPT_BUS_WD-1:0] ws_except_bus    ;

//timer interrupt
wire                         timer_interrupt  ;
//wire [                 63:0] ms_pc_to_ws      ;
//wire                         ms_valid_to_ws   ;
//wire [                 63:0] es_pc_to_ws      ;
//wire                         es_valid_to_ws   ; 
wire                         true_timer_interrupt;



//reg                          true_timer_interrupt_d1;//
// assign pc   = debug_wb_pc  ;
// assign inst = debug_wb_inst;

//reg [63:0] pc_d1;
//reg [31:0] inst_d1;
//always @(posedge clk) begin
  //true_timer_interrupt_d1 <= true_timer_interrupt;
  //pc_d1  <= pc;
  //inst_d1 <= inst;
//end

wire load_data_pre_ok;
wire clint_valid     ;

//IF stage
ysyx_210596_if_stage inst_if_stage
    (
	.clk               (clk              ),
	.reset             (reset            ),
	//allowin
	.ds_allowin        (ds_allowin       ),
	//brbus
	.br_bus            (br_bus           ),
	//outputs
	.fs_to_ds_valid    (fs_to_ds_valid   ),
	.fs_to_ds_bus      (fs_to_ds_bus     ),
	//inst sram interfece
  .inst_sram_wr      (inst_sram_wr     ),
	.inst_sram_addr    (inst_sram_addr   ),
	.inst_sram_wdata   (inst_sram_wdata  ),
	.inst_sram_rdata   (inst_sram_rdata  ),
  .inst_sram_req     (inst_sram_req    ),
  .inst_sram_size    (inst_sram_size   ),
  //.inst_sram_addr_ok (inst_sram_addr_ok),
  .inst_sram_data_ok (inst_sram_data_ok),
  //exception
  .except_flush      (except_flush     ),
  .except_new_pc     (except_new_pc    )
    );

//ID stage
ysyx_210596_id_stage inst_id_stage
	(
		.clk            (clk           ),
		.reset          (reset         ),
		//allowin
		.es_allowin     (es_allowin    ),
		.ds_allowin     (ds_allowin    ),
		//from fs
		.fs_to_ds_valid (fs_to_ds_valid),
		.fs_to_ds_bus   (fs_to_ds_bus  ),
		// to es
		.ds_to_es_valid (ds_to_es_valid),
		.ds_to_es_bus   (ds_to_es_bus  ),
		//to fs
		.br_bus         (br_bus        ),
		//forward
		.es_to_ds_fwd   (es_to_ds_fwd  ),
		.ms_to_ds_fwd   (ms_to_ds_fwd  ),
		.ws_to_ds_fwd   (ws_to_ds_fwd  ),
    .load_data_pre_ok(load_data_pre_ok),
		//to rf:for write back
		.ws_to_rf_bus   (ws_to_rf_bus  ),
    //.regs_o         (regs          ),     //difftest 
    .except_flush   (except_flush  )
	);

//EXE_stage
ysyx_210596_exe_stage inst_exe_stage
	(
		.clk               (clk              ),
		.reset             (reset            ),
		//allowin
		.ms_allowin        (ms_allowin       ),
		.es_allowin        (es_allowin       ),
		//from ds
		.ds_to_es_valid    (ds_to_es_valid   ),
		.ds_to_es_bus      (ds_to_es_bus     ),
		//to ms
		.es_to_ms_valid    (es_to_ms_valid   ),
		.es_to_ms_bus      (es_to_ms_bus     ),
		//forward
		.es_to_ds_fwd      (es_to_ds_fwd     ),
    //csr forward
	  .csr_ms_to_es_fwd  (csr_ms_to_es_fwd ),
    .csr_ws_to_es_fwd  (csr_ws_to_es_fwd ),
		//data sram interface
    .data_sram_wr      (data_sram_wr     ),
		.data_sram_addr    (data_sram_addr   ),
		.data_sram_wdata   (data_sram_wdata  ),
    .data_sram_req     (data_sram_req    ),
    .data_sram_size    (data_sram_size   ),
    .data_sram_addr_ok (data_sram_addr_ok),
    .data_sram_data_ok (data_sram_data_ok),
    .es_valid_for_clint(clint_valid      ),
    //csr_regs
    .csr_regs_raddr  (csr_regs_raddr     ),
	  .csr_regs_rdata  (csr_regs_rdata     ),
    //except
    .except_flush    (except_flush       )
    //.es_pc_to_ws     (es_pc_to_ws        ),
    //.es_valid_to_ws  (es_valid_to_ws     )
	);

wire [63:0] mtimecmp_o; 
wire [63:0] mtime_o; 



//MEM_stage
ysyx_210596_mem_stage inst_mem_stage
	(
		.clk                (clk               ),
		.reset              (reset             ),
		//allowin
		.ws_allowin         (ws_allowin        ),
		.ms_allowin         (ms_allowin        ),
		//from es
		.es_to_ms_valid     (es_to_ms_valid    ),
		.es_to_ms_bus       (es_to_ms_bus      ),
		//to ws
		.ms_to_ws_valid     (ms_to_ws_valid    ),
		.ms_to_ws_bus       (ms_to_ws_bus      ),
		//forward
		.ms_to_ds_fwd       (ms_to_ds_fwd      ),
    .csr_ms_to_es_fwd   (csr_ms_to_es_fwd  ),
    .load_data_pre_ok   (load_data_pre_ok  ),
		//from data-sram
		.data_sram_rdata_d0 (data_sram_rdata   ),
    .data_sram_data_ok  (data_sram_data_ok ),
    //except
    .except_flush       (except_flush      ),
    //.ms_pc_to_ws        (ms_pc_to_ws       ),
    //.ms_valid_to_ws     (ms_valid_to_ws    ),
    .mtimecmp_i         (mtimecmp_o        ),
    .mtime_i            (mtime_o           )         
	);

wire ws_skip;
//WB_stage
ysyx_210596_wb_stage inst_wb_stage
	(
		.clk              (clk              ),
		.reset            (reset            ),
		//allowin
		.ws_allowin       (ws_allowin       ),
		//from ms
		.ms_to_ws_valid   (ms_to_ws_valid   ),
		.ms_to_ws_bus     (ms_to_ws_bus     ),
		//to rf
		.ws_to_rf_bus     (ws_to_rf_bus     ),
    //to csr
	  .ws_to_csr_bus    (ws_to_csr_bus    ), 
    .ws_except_bus    (ws_except_bus    ),
		//forward
		.ws_to_ds_fwd     (ws_to_ds_fwd     ),
    .csr_ws_to_es_fwd (csr_ws_to_es_fwd ), 
    //csr_regs_forward
    .csr_mtvec        (csr_mtvec_to_ws  ),
    .csr_mepc         (csr_mepc_to_ws   ),
    .csr_mstatus      (csr_mstatus_to_ws),
    .csr_mie_mtie     (csr_mie_mtie_to_ws),

    .debug_wb_pc      (debug_wb_pc      ),
    .debug_wb_inst    (debug_wb_inst    ),
    //.debug_wb_rf_we   (debug_wb_rf_we   ),
    //.debug_wb_rf_waddr(debug_wb_rf_waddr),
    //.debug_wb_rf_wdata(debug_wb_rf_wdata),
    .debug_wb_valid   (debug_wb_valid   ),
    //except
    .except_flush     (except_flush     ),
    .except_new_pc    (except_new_pc    ),
    //timer interrupt
    .timer_interrupt  (timer_interrupt  ),
    .true_timer_interrupt(true_timer_interrupt),
    //.ms_pc_to_ws      (ms_pc_to_ws      ),
    //.ms_valid_to_ws   (ms_valid_to_ws   ),
    //.es_pc_to_ws      (es_pc_to_ws      ),
    //.es_valid_to_ws   (es_valid_to_ws   ),
    .ws_skip          (ws_skip          ),
    .data_ok          (inst_sram_data_ok)
	);




ysyx_210596_clint u_clint(
	//ports
	.clk             		( clk             		),
	.reset           		( reset           		),
	.addr            		( data_sram_addr      ),
	.wdata           		( data_sram_wdata     ),
	.wr_en           		( data_sram_wr        ),
  .mtimecmp_o         ( mtimecmp_o          ),
  .mtime_o            ( mtime_o             ),
  .clint_valid        ( clint_valid         ),
	.timer_interrupt 		( timer_interrupt 		)
);



//csr_regs
//wire        	global_int_en_o;
//wire [63:0] 	csr_mcycle_o   ;
//wire [63:0] 	csr_mtvec_o    ;
//wire [63:0] 	csr_mcause_o   ;
//wire [63:0] 	csr_mepc_o     ;
//wire [63:0] 	csr_mstatus_o  ;
//wire [63:0] 	csr_mie_o      ;
//wire [63:0]   csr_mip_o      ;
//wire [63:0]   csr_mscratch_o ;
//wire [63:0]   csr_sstatus_o  ;



ysyx_210596_csr_reg u_csr_reg(
	//ports
	.clk             		( clk             		 ),
	.reset           		( reset           		 ),
  //from wb
	.we              		( ws_to_csr_bus[128]   ),
	.raddr           		( csr_regs_raddr[11:0]       ),
	.waddr           		( ws_to_csr_bus[127:64]),
	.wdata           		( ws_to_csr_bus[  63:0]),
	.rdata           		( csr_regs_rdata       ),
	//.global_int_en_o 		( global_int_en_o 		 ),
  //ecall & mret
  .csr_except_ctrl    ( ws_except_bus        ),
  //difftest
	//.csr_mcycle_o    		( csr_mcycle_o    		 ),
	//.csr_mtvec_o     		( csr_mtvec_o     		 ),
	//.csr_mcause_o    		( csr_mcause_o    		 ),
	//.csr_mepc_o      		( csr_mepc_o      		 ),
	//.csr_mstatus_o   		( csr_mstatus_o   		 ),
	//.csr_mie_o       		( csr_mie_o       		 ),
  //.csr_mip_o          ( csr_mip_o            ),
  //.csr_mscratch_o     ( csr_mscratch_o       ),
  //csr_regs
  .csr_mtvec_to_ws    ( csr_mtvec_to_ws      ),
  .csr_mepc_to_ws     ( csr_mepc_to_ws       ),
  .csr_mstatus_to_ws  ( csr_mstatus_to_ws    ),
  .csr_mie_mtie_to_ws ( csr_mie_mtie_to_ws   )
  //.csr_sstatus_o      ( csr_sstatus_o        ) 
);



/*

//Access data memory
// wire [63:0] pc;
// assign pc = fs_pc;
// reg [63:0] rdata;
RAMHelper RAMHelper(
  .clk              (clk),
  .en               (data_sram_en),
  .rIdx             ((data_sram_addr - `PC_START) >> 3),
  .rdata            (data_sram_rdata),
  .wIdx             ((data_sram_addr - `PC_START) >> 3),
  .wdata            (data_sram_wdata),
  .wmask            (data_sram_mask),
  .wen              (data_sram_wr_rd)
);
// wire [31:0] inst;
// assign inst = pc[2] ? rdata[63 : 32] : rdata[31 : 0];

// assign fs_inst = inst;

*/


// Difftest
//reg cmt_wen;
//reg [7:0] cmt_wdest;
//reg [`REG_BUS] cmt_wdata;
//reg [`REG_BUS] cmt_pc;
//reg [31:0] cmt_inst;
//reg cmt_valid;
// reg trap;                          //2022.01.17
// //reg [7:0] trap_code;
// reg [63:0] cycleCnt;
// reg [63:0] instrCnt;
//reg [`REG_BUS] regs_diff [0 : 31];

//interrupt difftest
//reg [`REG_BUS] exceptionPC;
//reg [31:0]     exceptionInst; 
//reg [31:0]     intrNO;    //7 or 11
//reg [31:0]     cause  ;




//csr difftest
//reg [63:0] csr_mcycle_diff ;
//reg [63:0] csr_mtvec_diff  ;
//reg [63:0] csr_mcause_diff ;
//reg [63:0] csr_mepc_diff   ;
//reg [63:0] csr_mstatus_diff;
//reg [63:0] csr_mie_diff    ;
//reg [63:0] csr_mip_diff    ;
//reg [63:0] csr_mscratch_diff    ;
//reg [63:0] csr_sstatus_diff;

//assign rd_w_ena  = debug_wb_rf_we           ;
//assign rd_w_addr = {3'd0, debug_wb_rf_waddr};
//assign rd_w_addr = debug_wb_rf_waddr        ;
//assign rd_data   = debug_wb_rf_wdata        ;


//wire inst_valid = (pc != `PC_START) | (inst != 0);
wire inst_valid = (((pc != `YSYX210596_PC_START) | (inst != 0)) && debug_wb_valid && (~true_timer_interrupt));

//wire wb_skip = (inst == 32'h7b || (ws_skip) ||(ws_to_csr_bus[75:64] == CSR_MCYCLE && ws_to_csr_bus[128])) ? 1'b1: 1'b0;



//assign io_uart_out_valid = (cmt_inst==32'h7b && inst_valid) ? 1'b1 : 1'b0;
//assign io_uart_out_ch = (cmt_inst==32'h7b) ? regs[10][7:0] : 8'b0;

// always @(negedge clock) begin
//   if (reset) begin
//     {trap, cycleCnt, instrCnt} <= 0;
//   end
//   else if (~trap) begin
//     //cmt_wen <= rd_w_ena;
//     //cmt_wdest <= {3'd0, rd_w_addr};
//     //cmt_wdata <= rd_data;
//     //cmt_pc <= pc;
//     //cmt_inst <= inst;
//     //cmt_valid <= inst_valid;

// 		//regs_diff <= regs;
//     //csr addr
//     //csr_mcycle_diff  <= csr_mcycle_o ;
//     //csr_mtvec_diff   <= csr_mtvec_o  ;
//     //csr_mcause_diff  <= csr_mcause_o ;
//     //csr_mepc_diff    <= csr_mepc_o   ;
//     //csr_mstatus_diff <= csr_mstatus_o;
//     //csr_mie_diff     <= csr_mie_o    ;
//     //csr_mip_diff     <= csr_mip_o    ;
//     //csr_mscratch_diff<= csr_mscratch_o;
//     //csr_sstatus_diff <= csr_sstatus_o;

//     //interrupt
//     //exceptionPC      <= pc & {64{true_timer_interrupt}};
//     //exceptionInst   <= inst & {32{true_timer_interrupt}};
//     //intrNO          <= {32{true_timer_interrupt}} & {32'd7};
//     //cause            <= {32{true_timer_interrupt}} & {32'd7};


//     trap <= inst[6:0] == 7'h6b;
//     //trap_code <= regs[10][7:0];
//     cycleCnt <= cycleCnt + 1;
//     instrCnt <= instrCnt + {63'b0,inst_valid};
//   end
// end

//2022.01.17




// DifftestInstrCommit DifftestInstrCommit(
//   .clock              (clock),
//   .coreid             (0),
//   .index              (0),
//   .valid              (cmt_valid),
//   .pc                 (cmt_pc),
//   .instr              (cmt_inst),
//   .special            (0),
//   .skip               (wb_skip),
//   .isRVC              (0),
//   .scFailed           (0),
//   .wen                (cmt_wen),
//   .wdest              (cmt_wdest),
//   .wdata              (cmt_wdata)
// );

// DifftestArchIntRegState DifftestArchIntRegState (
//   .clock              (clock),
//   .coreid             (0),
//   .gpr_0              (regs_diff[0]),
//   .gpr_1              (regs_diff[1]),
//   .gpr_2              (regs_diff[2]),
//   .gpr_3              (regs_diff[3]),
//   .gpr_4              (regs_diff[4]),
//   .gpr_5              (regs_diff[5]),
//   .gpr_6              (regs_diff[6]),
//   .gpr_7              (regs_diff[7]),
//   .gpr_8              (regs_diff[8]),
//   .gpr_9              (regs_diff[9]),
//   .gpr_10             (regs_diff[10]),
//   .gpr_11             (regs_diff[11]),
//   .gpr_12             (regs_diff[12]),
//   .gpr_13             (regs_diff[13]),
//   .gpr_14             (regs_diff[14]),
//   .gpr_15             (regs_diff[15]),
//   .gpr_16             (regs_diff[16]),
//   .gpr_17             (regs_diff[17]),
//   .gpr_18             (regs_diff[18]),
//   .gpr_19             (regs_diff[19]),
//   .gpr_20             (regs_diff[20]),
//   .gpr_21             (regs_diff[21]),
//   .gpr_22             (regs_diff[22]),
//   .gpr_23             (regs_diff[23]),
//   .gpr_24             (regs_diff[24]),
//   .gpr_25             (regs_diff[25]),
//   .gpr_26             (regs_diff[26]),
//   .gpr_27             (regs_diff[27]),
//   .gpr_28             (regs_diff[28]),
//   .gpr_29             (regs_diff[29]),
//   .gpr_30             (regs_diff[30]),
//   .gpr_31             (regs_diff[31])
// );

// DifftestTrapEvent DifftestTrapEvent(
//   .clock              (clock),
//   .coreid             (0),
//   .valid              (trap),
//   .code               (trap_code),
//   .pc                 (cmt_pc),
//   .cycleCnt           (cycleCnt),
//   .instrCnt           (instrCnt)
// );

// DifftestArchEvent DifftestArchEvent(
//   .clock              (clock),
//   .coreid             (0),
//   .intrNO             (intrNO),   //zhongduanhao
//   .cause              (cause),   //liwaihao 
//   .exceptionPC        (exceptionPC),
//   .exceptionInst      (exceptionInst)
// );


// DifftestCSRState DifftestCSRState(
//   .clock              (clock),
//   .coreid             (0),
//   .priviledgeMode     (`RISCV_PRIV_MODE_M),
//   .mstatus            (csr_mstatus_diff),
//   .sstatus            (csr_sstatus_diff),
//   .mepc               (csr_mepc_diff),
//   .sepc               (0),
//   .mtval              (0),
//   .stval              (0),
//   .mtvec              (csr_mtvec_diff),
//   .stvec              (0),
//   .mcause             (csr_mcause_diff),
//   .scause             (0),
//   .satp               (0),
//   //.mip                (csr_mip_diff),
//   .mip                (0),
//   .mie                (csr_mie_diff),
//   .mscratch           (csr_mscratch_diff),
//   .sscratch           (0),
//   .mideleg            (0),
//   .medeleg            (0)
// );

// DifftestArchFpRegState DifftestArchFpRegState(
//   .clock              (clock),
//   .coreid             (0),
//   .fpr_0              (0),
//   .fpr_1              (0),
//   .fpr_2              (0),
//   .fpr_3              (0),
//   .fpr_4              (0),
//   .fpr_5              (0),
//   .fpr_6              (0),
//   .fpr_7              (0),
//   .fpr_8              (0),
//   .fpr_9              (0),
//   .fpr_10             (0),
//   .fpr_11             (0),
//   .fpr_12             (0),
//   .fpr_13             (0),
//   .fpr_14             (0),
//   .fpr_15             (0),
//   .fpr_16             (0),
//   .fpr_17             (0),
//   .fpr_18             (0),
//   .fpr_19             (0),
//   .fpr_20             (0),
//   .fpr_21             (0),
//   .fpr_22             (0),
//   .fpr_23             (0),
//   .fpr_24             (0),
//   .fpr_25             (0),
//   .fpr_26             (0),
//   .fpr_27             (0),
//   .fpr_28             (0),
//   .fpr_29             (0),
//   .fpr_30             (0),
//   .fpr_31             (0)
// );

endmodule

//--Yangxin--

//`include "defines.v"

module ysyx_210596_if_stage(
	input  wire           				clk  		     ,
	input  wire           				reset		     ,
	//allowin
	input  wire           				ds_allowin	     ,
	//brbus
	input  wire [      `YSYX210596_BR_BUS_WD  -1:0] br_bus           ,    // To do
	//to ds
	output wire    		  				fs_to_ds_valid   ,
	output wire [`YSYX210596_FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus     ,
	//input wire [				63:  0] inst_addr        ,

	//inst sram inteface
	//output wire        				inst_sram_en     ,
	//output wire [				   7:0] inst_sram_wen    ,
	output wire 						inst_sram_wr     ,
	output wire [				  63:0] inst_sram_addr   ,
	output wire [	 			  63:0] inst_sram_wdata  ,
	//input  wire [				  31:0] inst_sram_rdata  ,
	input  wire [				  63:0] inst_sram_rdata  ,
	//add handshake
	output wire                         inst_sram_req    ,
	output wire [                  1:0] inst_sram_size 	 ,
	//input  wire                         inst_sram_addr_ok,
	input  wire 						inst_sram_data_ok,

	//exception
	input  wire                         except_flush     ,
	input  wire [				  63:0]	except_new_pc   
	);

wire         inst_sram_en   ;     //1230 dc report
//wire [7:0] 	inst_sram_wen  ;

assign      inst_sram_size = 2'b11;

wire 		fs_valid       ;
wire    	fs_ready_go    ;
wire    	fs_allowin     ;
//wire    	to_fs_valid	   ;

reg  [63:0] seq_pc         ;
wire [63:0] next_pc        ;

wire        br_taken       ;
wire [63:0] br_target      ;

//wire        pre_fs_ready_go;
wire        br_stall       ;

assign  {br_stall,br_taken,br_target} = br_bus;

wire [31:0] fs_inst        ;
wire [63:0] fs_pc          ;
assign fs_to_ds_bus = {fs_inst, //95:64
					   fs_pc    //63:0
					   };

//pre-IF stage

//assign pre_fs_ready_go = ~br_stall && (inst_sram_req & inst_sram_addr_ok); //pre-IF send request
//assign to_fs_valid = inst_sram_data_ok;

wire handshake   ;
assign handshake = inst_sram_data_ok;

always @(posedge clk) begin
	if(reset) begin
	  	seq_pc <= `YSYX210596_PC_START;
	end
	else if(except_flush) begin
		seq_pc <= except_new_pc;
	end
	else if(handshake) begin
		seq_pc <= fs_pc + 4;
	end
	else begin
	  	seq_pc <= seq_pc;
	end
end


reg br_taken_flag;
assign next_pc = (br_taken | br_taken_flag) ? br_target : seq_pc;  //for inst_addr

//parameter PC_START_RESET = `PC_START - 4;
//parameter PC_START_RESET = `PC_START;

//inst_sram_req
assign inst_sram_req = inst_sram_en;

assign fs_valid = inst_sram_data_ok;


always @(posedge clk) begin
	if(reset) begin
		br_taken_flag <= 1'b0;
	end
	else if(br_taken) begin
		br_taken_flag <= 1'b1;
	end
	else if(inst_sram_data_ok) begin
		br_taken_flag <= 1'b0;
	end
end

// reg except_flush_hold;
// always @(posedge clk) begin
// 	if(reset) begin
// 		except_flush_hold <= 1'b0;
// 	end
// 	else if(except_flush) begin
// 		except_flush_hold <= 1'b1;
// 	end
// 	else if(inst_sram_data_ok) begin
// 		except_flush_hold <= 1'b0;
// 	end
// end

// wire except_flush_true;
// assign except_flush_true = except_flush | except_flush_hold;
//IF stage
assign fs_ready_go = ~br_taken && inst_sram_data_ok;
//assign fs_allowin = !fs_valid || ds_allowin    ;
assign fs_allowin = !fs_valid && ds_allowin    ;
assign fs_to_ds_valid = fs_valid && fs_ready_go;
assign fs_pc = (except_flush) ? except_new_pc:
			   						  next_pc;

assign inst_sram_wr    = 1'b0                ;
assign inst_sram_en    = ~reset && fs_allowin;
//assign inst_sram_wen   = 8'h0;
assign inst_sram_addr  = next_pc;
assign inst_sram_wdata = 64'h0;
assign fs_inst = inst_sram_rdata[31:0];

endmodule

//--Yangxin--
//`timescale 1ns / 1ps

module ysyx_210596_Imm_Extractor(
	input wire  [31:0] instruction  ,
	input wire  [ 5:0] inst_imm_type_sel,
	output reg [63:0] value
);

	wire [11:0] Imm_11_0   = instruction[31:20];
	wire [19:0] Imm_31_12  = instruction[31:12];
	wire [ 4:0] Imm_4_0    = instruction[ 11:7];
	wire [ 6:0] Imm_11_5   = instruction[31:25];
	wire        Imm_11_B   = instruction[7];
	wire [ 3:0] Imm_4_1    = instruction[11:8];
	wire [ 5:0] Imm_10_5   = instruction[30:25];
	wire 		Imm_12     = instruction[31];
	wire [ 7:0] Imm_19_12  = instruction[19:12];
	wire 		Imm_11_J   = instruction[20];
	wire [ 9:0] Imm_10_1   = instruction[30:21];
	wire 		Imm_20	   = instruction[31];

	//Extend bits and get immediate values of types
	wire signed [63:0] Imm_I  = {{52{Imm_11_0[11]}},Imm_11_0};
	wire signed [63:0] Imm_U  = {{32{Imm_31_12[19]}}, Imm_31_12,12'h0};
	wire signed [63:0] Imm_B  = {{52{Imm_12}}, Imm_11_B, Imm_10_5, Imm_4_1, 1'b0};
	wire signed [63:0] Imm_S  = {{52{Imm_11_5[6]}}, Imm_11_5, Imm_4_0};
	wire signed [63:0] Imm_UJ = {{44{Imm_20}}, Imm_19_12, Imm_11_J, Imm_10_1, 1'b0};

	always @(*) begin
		case(inst_imm_type_sel)
			6'b000001: value = Imm_I;
			6'b000010: value = Imm_U;
			6'b000100: value = Imm_B;
			6'b001000: value = Imm_S;
			6'b010000: value = Imm_UJ;
			default: begin
				value = 0;
			end
		endcase
	end
endmodule

//`timescale 1ns / 1ps

module ysyx_210596_decoder_3_8(
	input  wire [2:0] in,
	output wire [7:0] out
	);

genvar i;
generate for(i=0; i<8; i=i+1) begin : gen_for_dec_3_8
	assign out[i] = (in == i);
end endgenerate
endmodule



module ysyx_210596_decoder_5_32(
	input  wire [ 4:0] in,
	output wire [31:0] out
	);

genvar i;
generate for(i=0; i<32; i=i+1) begin : gen_for_dec_5_32
	assign out[i] = (in == i);
end endgenerate
endmodule




module ysyx_210596_decoder_6_64(
	input  wire [ 5:0] in,
	output wire [63:0] out
	);

genvar i;
generate for(i=0; i<64; i=i+1) begin : gen_for_dec_6_64
	assign out[i] = (in == i);
end endgenerate
endmodule




module ysyx_210596_decoder_7_128(
	input  wire [  6:0] in,
	output wire [127:0] out
	);

genvar i;
generate for(i=0; i<128; i=i+1) begin : gen_for_dec_7_128
	assign out[i] = (in == i);
end endgenerate
endmodule

//`include "defines.v"

module ysyx_210596_regfile(
	input  wire clk          ,
	input  wire reset        , 
	//READ PORT 1
	input  wire [ 4:0] raddr1,
	output wire [63:0] rdata1,
	//READ PORT 2
	input  wire [ 4:0] raddr2,
	output wire [63:0] rdata2,
	//WRITE PORT
	input  wire 	   we    ,
	input  wire [ 4:0] waddr ,
	input  wire [63:0] wdata 

	//output wire [63:0] regs_o[0: 31]      //difftest    
	);

reg [63:0] rf[31:0];  //64 Bit length, 32 Registers

// integer i = 0;
// initial begin
// 	for(i = 0; i<32; i = i + 1) begin
// 		rf[i] = 0;
// 	end
// end

//READ OUT 1
assign rdata1 = (raddr1==5'b0) ? 64'b0 : rf[raddr1];

//READ OUT 2
assign rdata2 = (raddr2==5'b0) ? 64'b0 : rf[raddr2];

//WRITE
always @(posedge clk) begin
	if(reset) begin
		rf[0    ] <= 64'h0;
		rf[1    ] <= 64'h0;
		rf[2    ] <= 64'h0;
		rf[3    ] <= 64'h0;
		rf[4    ] <= 64'h0;
		rf[5    ] <= 64'h0;
		rf[6    ] <= 64'h0;
		rf[7    ] <= 64'h0;
		rf[8    ] <= 64'h0;
		rf[9    ] <= 64'h0;
		rf[10   ] <= 64'h0;
		rf[11   ] <= 64'h0;
		rf[12   ] <= 64'h0;
		rf[13   ] <= 64'h0;
		rf[14   ] <= 64'h0;
		rf[15   ] <= 64'h0;
		rf[16   ] <= 64'h0;
		rf[17   ] <= 64'h0;
		rf[18   ] <= 64'h0;
		rf[19   ] <= 64'h0;
		rf[20   ] <= 64'h0;
		rf[21   ] <= 64'h0;
		rf[22   ] <= 64'h0;
		rf[23   ] <= 64'h0;
		rf[24   ] <= 64'h0;
		rf[25   ] <= 64'h0;
		rf[26   ] <= 64'h0;
		rf[27   ] <= 64'h0;
		rf[28   ] <= 64'h0;
		rf[29   ] <= 64'h0;
		rf[30   ] <= 64'h0;
		rf[31   ] <= 64'h0;
	end
	else  begin
		if(we && (waddr != 5'd0))
			rf[waddr] <= wdata;
	end
end

// genvar j;
// generate
// 	for(j = 0; j<32; j=j+1) begin
// 	  assign regs_o[j] = (we & waddr == j & j != 0) ? wdata : rf[j];
// 	end
	
// endgenerate

endmodule

//--Yangxin--

//`include "defines.v"


module ysyx_210596_id_stage(
	input  wire           				clk           ,
	input  wire           				reset         ,
	//allowin
	input  wire           				es_allowin    ,
	output wire           				ds_allowin    ,
	//from fs
	input  wire           				fs_to_ds_valid,
	input  wire [`YSYX210596_FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus  ,
	//to es
	output wire 		  				ds_to_es_valid,
	output wire [`YSYX210596_DS_TO_ES_BUS_WD -1:0] ds_to_es_bus  ,
	//to fs
	output wire [      `YSYX210596_BR_BUS_WD  -1:0] br_bus        ,
	//forward
	input  wire [                 69:0] es_to_ds_fwd  ,
	input  wire [                 68:0] ms_to_ds_fwd  ,
	input  wire [                 68:0] ws_to_ds_fwd  ,
	//from ms
	input  wire 					    load_data_pre_ok,
	//to rf: for write_back
	input  wire [`YSYX210596_WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus  ,
	//output wire [                 63:0] regs_o[0: 31] , //difftest 
	//except
	input  wire 						except_flush  
	);

 wire inst_lui   ;   
 wire inst_auipc ;
 wire inst_jal   ;
 wire inst_jalr  ;
 wire inst_beq   ;
 wire inst_bne   ;
 wire inst_blt   ;
 wire inst_bge   ;
 wire inst_bltu  ;
 wire inst_bgeu  ;
 wire inst_lb    ;
 wire inst_lh    ;
 wire inst_lw    ;
 wire inst_lbu   ;
 wire inst_lhu   ;
 wire inst_sb    ;
 wire inst_sh    ;
 wire inst_sw    ;
 wire inst_addi  ;
 wire inst_slti  ;
 wire inst_sltiu ;
 wire inst_xori  ;
 wire inst_ori   ;
 wire inst_andi  ;

 wire inst_slli  ;
 wire inst_srli  ;
 wire inst_srai  ;

 wire inst_add   ;
 wire inst_sub   ;
 wire inst_sll   ;
 wire inst_slt   ;
 wire inst_sltu  ;
 wire inst_xor   ;
 wire inst_srl   ;
 wire inst_sra   ;
 wire inst_or    ;
 wire inst_and   ;

 wire inst_lwu   ;
 wire inst_ld    ;
 wire inst_sd    ;

 wire inst_addiw ;
 wire inst_slliw ;
 wire inst_srliw ; 
 wire inst_sraiw ;
 wire inst_addw  ; 
 wire inst_subw  ; 
 wire inst_sllw  ; 
 wire inst_srlw  ; 
 wire inst_sraw  ;


 //csr
 wire inst_csrrw ;
 wire inst_csrrs ;
 wire inst_csrrc ;
 wire inst_csrrwi;
 wire inst_csrrsi;
 wire inst_csrrci;

//interrupt
wire inst_ecall;
wire inst_mret;
wire ds_except_enter_ecall;
wire ds_except_quit_mret;




wire [6:0] opcode   ;
wire [4:0] rd       ;
wire [2:0] func3    ;
wire [6:0] func7    ;
wire [5:0] func7_6  ;
wire [4:0] rs1      ;
wire [4:0] rs2      ;

wire [127:0] opcode_d ;
wire [7:0] func3_d  ;
wire [127:0] func7_d  ;
wire [63:0] func7_6_d;

wire [31:0]  ds_inst    ;
assign opcode  = ds_inst[ 6: 0];
assign rd      = ds_inst[11: 7];
assign func3   = ds_inst[14:12];
assign func7   = ds_inst[31:25];
assign func7_6 = ds_inst[31:26];
assign rs1     = ds_inst[19:15];
assign rs2     = ds_inst[24:20];

ysyx_210596_decoder_7_128   u_dec0 (.in(opcode), .out(opcode_d));
ysyx_210596_decoder_3_8     u_dec1 (.in(func3), .out(func3_d))  ;
ysyx_210596_decoder_7_128   u_dec2 (.in(func7), .out(func7_d))  ;
ysyx_210596_decoder_6_64     u_dec3 (.in(func7_6), .out(func7_6_d));

//decide instruction
assign inst_lui   = opcode_d[7'h37];
assign inst_auipc = opcode_d[7'h17];
assign inst_jal   = opcode_d[7'h6F];
assign inst_jalr  = opcode_d[7'h67] & func3_d[3'd0];
assign inst_beq   = opcode_d[7'h63] & func3_d[3'd0];
assign inst_bne   = opcode_d[7'h63] & func3_d[3'd1];
assign inst_blt   = opcode_d[7'h63] & func3_d[3'd4];
assign inst_bge   = opcode_d[7'h63] & func3_d[3'd5];
assign inst_bltu  = opcode_d[7'h63] & func3_d[3'd6];
assign inst_bgeu  = opcode_d[7'h63] & func3_d[3'd7];
assign inst_lb    = opcode_d[7'h03] & func3_d[3'd0];
assign inst_lh    = opcode_d[7'h03] & func3_d[3'd1];
assign inst_lw    = opcode_d[7'h03] & func3_d[3'd2];
assign inst_lbu   = opcode_d[7'h03] & func3_d[3'd4];
assign inst_lhu   = opcode_d[7'h03] & func3_d[3'd5];
assign inst_sb    = opcode_d[7'h23] & func3_d[3'd0];
assign inst_sh    = opcode_d[7'h23] & func3_d[3'd1];
assign inst_sw    = opcode_d[7'h23] & func3_d[3'd2];
assign inst_addi  = opcode_d[7'h13] & func3_d[3'd0];
assign inst_slti  = opcode_d[7'h13] & func3_d[3'd2];
assign inst_sltiu = opcode_d[7'h13] & func3_d[3'd3];
assign inst_xori  = opcode_d[7'h13] & func3_d[3'd4];
assign inst_ori   = opcode_d[7'h13] & func3_d[3'd6];
assign inst_andi  = opcode_d[7'h13] & func3_d[3'd7];

assign inst_slli  = opcode_d[7'h13] & func3_d[3'd1] && func7_6_d[6'h0];
assign inst_srli  = opcode_d[7'h13] & func3_d[3'd5] && func7_6_d[6'h0];
assign inst_srai  = opcode_d[7'h13] & func3_d[3'd5] && func7_6_d[6'h10];

assign inst_add   = opcode_d[7'h33] & func3_d[3'd0] && func7_d[7'h0 ];
assign inst_sub   = opcode_d[7'h33] & func3_d[3'd0] && func7_d[7'h20];
assign inst_sll   = opcode_d[7'h33] & func3_d[3'd1] && func7_d[7'h0 ];
assign inst_slt   = opcode_d[7'h33] & func3_d[3'd2] && func7_d[7'h0 ];
assign inst_sltu  = opcode_d[7'h33] & func3_d[3'd3] && func7_d[7'h0 ];
assign inst_xor   = opcode_d[7'h33] & func3_d[3'd4] && func7_d[7'h0 ];
assign inst_srl   = opcode_d[7'h33] & func3_d[3'd5] && func7_d[7'h0 ];
assign inst_sra   = opcode_d[7'h33] & func3_d[3'd5] && func7_d[7'h20];
assign inst_or    = opcode_d[7'h33] & func3_d[3'd6] && func7_d[7'h0 ];
assign inst_and   = opcode_d[7'h33] & func3_d[3'd7] && func7_d[7'h0 ];

assign inst_lwu   = opcode_d[7'h03] & func3_d[3'd6];
assign inst_ld    = opcode_d[7'h03] & func3_d[3'd3];
assign inst_sd    = opcode_d[7'h23] & func3_d[3'd3];

assign inst_addiw = opcode_d[7'h1B] & func3_d[3'd0];
assign inst_slliw = opcode_d[7'h1B] & func3_d[3'd1] & func7_d[7'h0 ];
assign inst_srliw = opcode_d[7'h1B] & func3_d[3'd5] & func7_d[7'h0 ];
assign inst_sraiw = opcode_d[7'h1B] & func3_d[3'd5] & func7_d[7'h20];
assign inst_addw  = opcode_d[7'h3B] & func3_d[3'd0] & func7_d[7'h0 ];
assign inst_subw  = opcode_d[7'h3B] & func3_d[3'd0] & func7_d[7'h20];
assign inst_sllw  = opcode_d[7'h3B] & func3_d[3'd1] & func7_d[7'h0 ];
assign inst_srlw  = opcode_d[7'h3B] & func3_d[3'd5] & func7_d[7'h0 ];
assign inst_sraw  = opcode_d[7'h3B] & func3_d[3'd5] & func7_d[7'h20];

//csr
assign inst_csrrw  = opcode_d[7'h73] & func3_d[3'd1];
assign inst_csrrs  = opcode_d[7'h73] & func3_d[3'd2];
assign inst_csrrc  = opcode_d[7'h73] & func3_d[3'd3];
assign inst_csrrwi = opcode_d[7'h73] & func3_d[3'd5];
assign inst_csrrsi = opcode_d[7'h73] & func3_d[3'd6];
assign inst_csrrci = opcode_d[7'h73] & func3_d[3'd7];

//interrupt
assign inst_ecall      = (ds_inst == 32'h73)      ;
assign inst_mret       = (ds_inst == 32'h30200073);
assign ds_except_enter_ecall = inst_ecall         ;
assign ds_except_quit_mret  = inst_mret                ;

reg          ds_valid   ;
wire         ds_ready_go;

wire [                 63:0] fs_pc      ;
reg  [`YSYX210596_FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus_r;
assign       fs_pc = fs_to_ds_bus_r[63:0];


wire [63:0]  ds_pc      ;
assign      {ds_inst    ,
		     ds_pc} = fs_to_ds_bus_r;

wire        rf_we       ;
wire [4:0]  rf_waddr    ;
wire [63:0] rf_wdata    ;
assign      {rf_we		,        //69
	        rf_waddr    ,        //68:64
	        rf_wdata             //63:0
	         } = ws_to_rf_bus; 

wire        br_stall    ;
wire        br_taken    ;
wire [63:0] br_target   ;

wire [15:0] alu_op      ;
wire 		load_op     ;
wire [ 5:0] inst_imm_type_sel;
wire [63:0] imm_value   ;
wire        src2_is_sa  ;
wire        src1_is_pc  ;
wire        src2_is_imm ;
wire        src2_is_4   ;   
wire        alu_res_cut ;
//wire        res_from_mem;
wire        gr_we    ;
wire        mem_we   ;
wire [ 4:0] dest     ;
wire [63:0] rs1_value;  //true value form regfile or data forward
wire [63:0] rs2_value;  //true value form regfile or data forward
//wire		dst_is_rd;

wire [ 4:0] rf_raddr1;
wire [63:0] rf_rdata1;
wire [ 4:0] rf_raddr2;
wire [63:0] rf_rdata2;

//csr
wire        csr_rd   ;
wire        csr_wr   ;
wire        csr_imm  ;
wire [11:0] csr_waddr;



//jump and branch
wire        rs1_eq_rs2;
wire 		rs1_lt_rs2;
wire        rs1_ltu_rs2;

//load and store
wire [10:0] mem_control;
assign mem_control = {inst_lb , inst_lh , inst_lw ,
					  inst_lbu, inst_lhu, inst_sb ,
					  inst_sh , inst_sw , inst_lwu,
					  inst_ld , inst_sd           
					  };

assign br_bus       = {br_stall,        //65:65
					   br_taken,        //64:64
					   br_target        //63:0
					  };

assign ds_to_es_bus = {ds_except_enter_ecall, //344:344
					   ds_except_quit_mret  , //343:343
					   csr_rd     ,     //342:342
                       csr_wr     ,     //341:341
					   csr_imm    ,     //340:340
					   csr_waddr  ,     //339:328
					   ds_inst    ,     //327:296
					   mem_control,     //295:285
					   alu_op     ,     //284:269
					   load_op    ,     //268:268
					   src2_is_sa ,     //267:267
					   src1_is_pc ,     //266:266
					   src2_is_imm,     //265:265
					   src2_is_4  ,     //264:264
					   alu_res_cut,     //263:263
					   gr_we      ,     //262:262
					   mem_we     ,     //261:261
					   dest       ,     //260:256
					   imm_value  ,     //255:192
					   rs1_value  ,     //191:128
					   rs2_value  ,     //127:64
					   ds_pc            //63:0
					   };
wire ds_wait_true;

assign ds_ready_go    = ~ds_wait_true;
assign ds_allowin     = !ds_valid || ds_ready_go && es_allowin;
assign ds_to_es_valid = ds_valid && ds_ready_go;

always @(posedge clk) begin
	if (reset | except_flush) begin
		// reset
		ds_valid <= 1'b0;
	end
	else if (ds_allowin) begin
		ds_valid <= fs_to_ds_valid;
	end

	if(fs_to_ds_valid && ds_allowin) begin
		fs_to_ds_bus_r <= fs_to_ds_bus;
	end
end

//alu_op
assign alu_op[ 0] = inst_auipc | inst_jal  | inst_jalr  | inst_lb   | inst_lh  | inst_lw | inst_lbu 
                  | inst_lhu   | inst_lwu  | inst_ld    | inst_addi | inst_add | inst_sb | inst_sh 
                  | inst_sw    | inst_sd   | inst_addiw | inst_addw;

assign alu_op[ 1] = inst_sub   | inst_subw                             ;
assign alu_op[ 2] = inst_and   | inst_andi   						   ;

assign alu_op[ 3] = inst_or    | inst_ori  | inst_csrrs | inst_csrrsi  ;
assign alu_op[ 4] = inst_xor   | inst_xori               			   ;
assign alu_op[ 5] = inst_sll   | inst_slli | inst_slliw                ;
assign alu_op[ 6] = inst_srl   | inst_srli                             ;
assign alu_op[ 7] = inst_sra   | inst_srai                             ;
assign alu_op[ 8] = inst_slt   | inst_slti                             ;
assign alu_op[ 9] = inst_sltu  | inst_sltiu                            ;
assign alu_op[10] = inst_lui                                           ;
assign alu_op[11] = inst_sraiw | inst_sraw                             ;
assign alu_op[12] = inst_sllw                                          ;
assign alu_op[13] = inst_srlw  | inst_srliw                            ;

assign alu_op[14] = inst_csrrc | inst_csrrci                           ;   //qufan zai yu
assign alu_op[15] = inst_csrrw | inst_csrrwi                           ;   //src2 = 0;

assign load_op = inst_lw | inst_lb | inst_lh | inst_lbu | inst_lhu | inst_lwu | inst_ld;


//Immediate value
assign inst_imm_type_sel[0] = inst_jalr | inst_lb    | inst_lh    | inst_lw   | inst_lbu  | inst_lhu  | 
							  inst_addi | inst_slti  | inst_sltiu | inst_xori | inst_ori  | inst_andi |
							  inst_lwu  | inst_ld    | inst_addiw | inst_slli | inst_srli | inst_srai | 
							  inst_slliw| inst_srliw | inst_sraiw                                       ;
assign inst_imm_type_sel[1] = inst_lui  | inst_auipc                                                    ;
assign inst_imm_type_sel[2] = inst_beq  | inst_bne   | inst_blt   | inst_bge | inst_bltu | inst_bgeu    ;
assign inst_imm_type_sel[3] = inst_sb   | inst_sh    | inst_sw    | inst_sd                             ;
assign inst_imm_type_sel[4] = inst_jal                                                                  ;
assign inst_imm_type_sel[5] = 1'b0;
ysyx_210596_Imm_Extractor Imm_Extractor_0(.instruction(ds_inst), .inst_imm_type_sel(inst_imm_type_sel), .value(imm_value));



// assign ds_to_es_bus = {alu_op      ,  //135:124
//                        load_op     ,  //123:123
//                        src1_is_sa  ,  //122:122
//                        src1_is_pc  ,  //121:121
//                        src2_is_imm ,  //120:120
//                        src2_is_8   ,  //119:119
//                        gr_we       ,  //118:118
//                        mem_we      ,  //117:117
//                        dest        ,  //116:112
//                        imm         ,  //111:96
//                        rs_value    ,  //95 :64
//                        rt_value    ,  //63 :32
//                        ds_pc          //31 :0
//                       };

assign src1_is_pc  = inst_auipc | inst_jal  | inst_jalr;
assign src2_is_imm = inst_auipc | inst_lui  | inst_lb  | inst_lh   | inst_lw   | inst_lbu   | 
					 inst_lhu   | inst_lwu  | inst_ld  | inst_addi | inst_slti | inst_addiw |
					 inst_sltiu | inst_xori | inst_ori | inst_andi | inst_sb   | 
					 inst_sh    | inst_sw   | inst_sd                                        ;
assign src2_is_4   = inst_jal   | inst_jalr                                                  ;

assign src2_is_sa  = inst_slli  | inst_srli  | inst_srai  | inst_slliw | 
                     inst_srliw | inst_sraiw                                                 ;
assign alu_res_cut = inst_addiw | inst_slliw | inst_srliw | inst_addw  | inst_subw           ;


//assign res_from_mem = inst_lb | inst_lh | inst_lw | inst_lbu | inst_lhu | inst_lwu | inst_ld ;

//assign dst_is_rd = 1'b1;
assign gr_we = ~inst_beq  & ~inst_bne & ~inst_blt & ~inst_bge & ~inst_bltu & ~inst_bgeu 
	         & ~inst_sb   & ~inst_sw  & ~inst_sh  & ~inst_sd;

assign mem_we = inst_sb | inst_sh | inst_sw | inst_sd;

//wire inst_no_dest;
//assign inst_no_dest = inst_beq | inst_bne | inst_blt | inst_bge;
assign dest = rd;

//csr
assign csr_rd  = inst_csrrw | inst_csrrs | inst_csrrc | inst_csrrwi | inst_csrrsi | inst_csrrci;
assign csr_wr  = csr_rd;
assign csr_imm = inst_csrrwi | inst_csrrsi | inst_csrrci;
assign csr_waddr = ds_inst[31:20];
//data forward


//load_stall
wire ds_wait;
//wire load_stall;

assign ds_wait    = (es_to_ds_fwd[69] && (rs1 == es_to_ds_fwd[68:64]) && (rs1 != 5'h0)) || 
					(es_to_ds_fwd[69] && (rs2 == es_to_ds_fwd[68:64]) && (rs2 != 5'h0));

reg ds_wait_hold;
always @(posedge clk) begin
	if(reset) begin
		ds_wait_hold <= 1'b0;
	end
	else if(ds_wait) begin
		ds_wait_hold <= 1'b1;
	end
	else if(load_data_pre_ok) begin
		ds_wait_hold <= 1'b0;
	end
end

assign ds_wait_true = ds_wait | ds_wait_hold;

/************************************/
//to do 

//to do 
//to do 

//to do   2021.09.15 23:06




//assign load_stall = (rs1 == EXE_dest && es_load_op) || (rs2 == EXE_dest && es_load_op);
/************************************/
//br_stall
assign br_stall = br_taken & {ds_valid};


assign  rf_raddr1 = rs1;
assign  rf_raddr2 = rs2;

ysyx_210596_regfile inst_RegFile
	(
		.clk    (clk      ),
		.reset  (reset    ),
		.raddr1 (rf_raddr1),
		.rdata1 (rf_rdata1),
		.raddr2 (rf_raddr2),
		.rdata2 (rf_rdata2),
		.we     (rf_we    ),
		.waddr  (rf_waddr ),
		.wdata  (rf_wdata )
		//.regs_o (regs_o   )     //difftest
	);


assign  rs1_value = (es_to_ds_fwd[68:64] == rs1) && (rs1 != 5'd0) ? es_to_ds_fwd[63:0] :
				    (ms_to_ds_fwd[68:64] == rs1) && (rs1 != 5'd0) ? ms_to_ds_fwd[63:0] :
				    (ws_to_ds_fwd[68:64] == rs1) && (rs1 != 5'd0) ? ws_to_ds_fwd[63:0] :
				   								                              rf_rdata1;

assign  rs2_value = (es_to_ds_fwd[68:64] == rs2) && (rs2 != 5'd0) ? es_to_ds_fwd[63:0] :
				    (ms_to_ds_fwd[68:64] == rs2) && (rs2 != 5'd0) ? ms_to_ds_fwd[63:0] :
				    (ws_to_ds_fwd[68:64] == rs2) && (rs2 != 5'd0) ? ws_to_ds_fwd[63:0] :
				   															  rf_rdata2;

wire signed[63:0] rs1_value_signed = $signed(rs1_value);
wire signed[63:0] rs2_value_signed = $signed(rs2_value);

//JUMP and BRANCH
assign rs1_eq_rs2  = (rs1_value == rs2_value);
//assign rs1_lt_rs2  = (rs1_value_signed[63] & ~rs2_value_signed[63]) | (rs1_value_signed < rs2_value_signed );
assign rs1_lt_rs2  = (rs1_value_signed[63] & ~rs2_value_signed[63]) | (rs1_value_signed < rs2_value_signed );
assign rs1_ltu_rs2 = (rs1_value < rs2_value);

wire [63:0] rs1_value_for_jalr;
reg  [63:0] rs1_value_hold    ;

always @(posedge clk) begin
	if(reset) begin
		rs1_value_hold <= 64'h0;
	end
	else if(inst_jalr & ds_valid) begin
		rs1_value_hold <= rs1_value;
	end
	else if(ds_valid) begin
		rs1_value_hold <= 64'h0;
	end
	else begin
		rs1_value_hold <= rs1_value_hold;
	end
end

assign rs1_value_for_jalr = (inst_jalr & ds_valid) ? rs1_value : rs1_value_hold;


assign br_taken = ((inst_beq && rs1_eq_rs2)
			   || (inst_bne && !rs1_eq_rs2)
			   || (inst_blt &&  rs1_lt_rs2)
			   || (inst_bge && !rs1_lt_rs2)
			   || (inst_bltu && rs1_ltu_rs2)
			   || (inst_bgeu && !rs1_ltu_rs2)
			   || inst_jal
			   || inst_jalr) && ds_valid && (~ds_wait_true);
assign br_target = (inst_beq || inst_bne || inst_blt || inst_bge || inst_bltu || inst_bgeu) ? (fs_pc + imm_value) :
				   (inst_jal ) ? (fs_pc + imm_value) :
				   /*(inst_jalr) ?*/ (rs1_value_for_jalr + {imm_value[63:1],1'b0});




endmodule

/************************************************/


//--Yangxin--

//`include "defines.v"

module ysyx_210596_alu(
	input wire  [15:0] alu_op    ,
	input wire  [63:0] alu_src1  ,
	input wire  [63:0] alu_src2  ,
	output wire [63:0] alu_result
	);

wire op_add  ;
wire op_sub  ;
wire op_and  ;
wire op_or   ;
wire op_xor  ;
wire op_sll  ;
wire op_srl  ;
wire op_sra  ;
wire op_slt  ;
wire op_sltu ;
wire op_lui  ;
wire op_sraiw;
wire op_sllw ;
wire op_srlw ;
wire op_csrc ;
wire op_csrw ;

//control code decomposition
assign op_add   = alu_op[ 0];
assign op_sub   = alu_op[ 1];
assign op_and   = alu_op[ 2];
assign op_or    = alu_op[ 3];
assign op_xor   = alu_op[ 4];
assign op_sll   = alu_op[ 5];
assign op_srl   = alu_op[ 6];
assign op_sra   = alu_op[ 7];
assign op_slt   = alu_op[ 8];
assign op_sltu  = alu_op[ 9];
assign op_lui   = alu_op[10];
assign op_sraiw = alu_op[11];
assign op_sllw  = alu_op[12];
assign op_srlw  = alu_op[13];
assign op_csrc  = alu_op[14];
assign op_csrw  = alu_op[15];

wire [ 63:0] add_sub_result ;
wire [ 63:0] and_result     ;
wire [ 63:0] sltu_result    ; 
wire [ 63:0] or_result      ;
wire [ 63:0] xor_result     ;
wire [ 63:0] sll_result     ;
//wire [ 63:0] srl_result     ;
//wire [ 63:0] sra_result     ;
wire [127:0] sr128_result   ;
wire [ 63:0] sr_result      ;
wire [127:0] sraiw128_result;
wire [ 63:0] sraiw_result   ;
 
wire [ 63:0] slt_result     ;
//wire [ 63:0] sltu_result    ;
wire [ 63:0] lui_result     ;

wire [ 63:0] sllw_result_temp;
wire [ 63:0] sllw_result    ;

wire [ 31:0] srlw_result_temp;
wire [ 63:0] srlw_result    ;
wire [ 63:0] csrc_result    ;
wire [ 63:0] csrw_result    ;

//64-bit adder
wire [ 63:0] adder_a        ;
wire [ 63:0] adder_b        ;
wire [ 63:0] adder_result   ;


wire         adder_cin      ;
wire         adder_cout     ;

assign adder_a   = alu_src1;
assign adder_b   = (op_sub | op_slt | op_sltu) ? ~alu_src2 : alu_src2;
assign adder_cin = (op_sub | op_slt | op_sltu) ? 1'b1 : 1'b0    ;
assign {adder_cout,adder_result} = adder_a + adder_b + {63'b0,adder_cin};



//ADD,SUB result
assign add_sub_result = adder_result;

//SLT result
assign slt_result[63:1]  = 63'b0;
assign slt_result[0]     = (alu_src1[63] & ~alu_src2[63])
					     | ((alu_src1[63] ^~ alu_src2[63]) & adder_result[63]);

//SLTU result
assign sltu_result[63:1] = 63'b0;
assign sltu_result[0]    = ~adder_cout; //why not = adder_cout;

//bitwise operation
assign and_result = alu_src1 & alu_src2;
assign or_result  = alu_src1 | alu_src2;
assign xor_result = alu_src1 ^ alu_src2;
assign lui_result = alu_src2;  //maybe wrong

//SLL result
assign sll_result = alu_src1 << alu_src2[5:0];
assign sllw_result_temp = {32'b0,alu_src1[31:0]} << alu_src2[4:0];
assign sllw_result = {{32{sllw_result_temp[31]}},sllw_result_temp[31:0]};


//SRL result
assign sr128_result = {{64{op_sra & alu_src1[63]}},alu_src1[63:0]} >> alu_src2[5:0];
assign sr_result    = sr128_result[63:0];
assign sraiw128_result = {{96{alu_src1[31]}},alu_src1[31:0]} >> alu_src2[4:0];
assign sraiw_result = sraiw128_result[63:0];

assign srlw_result_temp = alu_src1[31:0] >> alu_src2[4:0];
//assign srlw_result = {32'd0,alu_src1[31:0]} >> alu_src2[4:0];
assign srlw_result = {{32{srlw_result_temp[31]}},srlw_result_temp};

//csrc result
assign csrc_result = (~alu_src1) & alu_src2;
assign csrw_result = alu_src1;

//final result mux
assign alu_result = ({64{op_add | op_sub}} & add_sub_result)
				  | ({64{op_and         }} & and_result    )
				  | ({64{op_or          }} & or_result     )
				  | ({64{op_xor         }} & xor_result    )
				  | ({64{op_sll         }} & sll_result    )
				  | ({64{op_srl | op_sra}} & sr_result     )
				  | ({64{op_slt         }} & slt_result    )
				  | ({64{op_sltu        }} & sltu_result   )
				  | ({64{op_lui			}} & lui_result    )
				  | ({64{op_sraiw       }} & sraiw_result  )
				  | ({64{op_sllw        }} & sllw_result   )
				  | ({64{op_srlw        }} & srlw_result   )
				  | ({64{op_csrc        }} & csrc_result   )
				  | ({64{op_csrw        }} & csrw_result   )
				  ;

endmodule

//--Yangxin--

//`include "defines.v"


module ysyx_210596_exe_stage(
	input  wire           				  clk              ,
	input  wire            				  reset            ,
	//allowin
	input  wire            				  ms_allowin       ,
	output wire          				  es_allowin       ,
	//from ds
	input  wire           				  ds_to_es_valid   ,
	input  wire [`YSYX210596_DS_TO_ES_BUS_WD -1:0]   ds_to_es_bus     ,
	//to ms
	output wire          				  es_to_ms_valid   ,
	output wire [`YSYX210596_ES_TO_MS_BUS_WD -1:0]   es_to_ms_bus     ,
	//forward
	output wire [				  69:0]   es_to_ds_fwd     ,
	//csr forward
	input  wire [                128:0]   csr_ms_to_es_fwd ,
    input  wire [				 128:0]   csr_ws_to_es_fwd ,
	//data sram interface
	//output wire          				  data_sram_en     ,
	//output wire [ 		       7:0]   data_sram_wen	   ,
	output wire                           data_sram_wr 	   ,
	output wire [				  63:0]   data_sram_addr   ,
	//output wire [				  63:0]   data_sram_mask   ,
	output wire [				  63:0]   data_sram_wdata  ,
	//output wire 						  data_sram_wr_rd  ,
	//add handshake
	output wire 						  data_sram_req    ,
	output wire [				   1:0]   data_sram_size   ,
	input  wire  						  data_sram_addr_ok,
	input  wire 						  data_sram_data_ok,
	
	output wire 						  es_valid_for_clint,

	//to csr_regs
	output wire [				  63:0]   csr_regs_raddr   ,
	input  wire [				  63:0]   csr_regs_rdata   ,
	//except
	input  wire 						  except_flush     
	//output wire [                 63:0]   es_pc_to_ws      ,
	//output wire                           es_valid_to_ws  			 
	);

reg           es_valid;
assign es_valid_for_clint = es_valid;


wire          data_sram_en;

wire          es_ready_go;
reg  [`YSYX210596_DS_TO_ES_BUS_WD -1:0] ds_to_es_bus_r;
wire [15:0]   es_alu_op; 
wire          es_load_op;
wire  		  es_src2_is_sa;
wire  		  es_src1_is_pc;
wire          es_src2_is_imm;
wire          es_src2_is_4;
wire          es_alu_res_cut;
wire 		  es_gr_we;
wire 		  es_mem_we;
wire [4:0]    es_dest;
wire [63:0]   es_imm;
wire [63:0]   es_rs1_value;
wire [63:0]   es_rs2_value; 
wire [63:0]   es_pc;

wire [31:0]   es_inst;   //difftest

//csr
wire          es_csr_rd   ;
wire          es_csr_wr   ;
wire          es_csr_imm  ;
wire [11:0]   es_csr_waddr;
//exception
wire 		  es_except_enter_ecall;
wire          es_except_quit_mret ;

//load and store
wire [10:0] es_mem_control;
wire        data_mem_en;
assign data_mem_en = ^es_mem_control;

//wire [7:0]  sram_wen   ;
wire [63:0] write_sram_wdata ;
wire        inst_is_sb ;
wire        inst_is_sh ;
wire        inst_is_sw ;
wire        inst_is_sd ;

assign inst_is_sb = es_mem_control[5] == 1'b1;
assign inst_is_sh = es_mem_control[4] == 1'b1;
assign inst_is_sw = es_mem_control[3] == 1'b1;
assign inst_is_sd = es_mem_control[0] == 1'b1;
wire [63:0] es_alu_result;
assign write_sram_wdata = inst_is_sb ? (es_alu_result[2:0] == 3'b000 ? {56'h0, es_rs2_value[7:0]       } :
										es_alu_result[2:0] == 3'b001 ? {48'h0, es_rs2_value[7:0], 8'h0 } :
										es_alu_result[2:0] == 3'b010 ? {40'h0, es_rs2_value[7:0], 16'h0} :
										es_alu_result[2:0] == 3'b011 ? {32'h0, es_rs2_value[7:0], 24'h0} :
										es_alu_result[2:0] == 3'b100 ? {24'h0, es_rs2_value[7:0], 32'h0} :
										es_alu_result[2:0] == 3'b101 ? {16'h0, es_rs2_value[7:0], 40'h0} :
										es_alu_result[2:0] == 3'b110 ? {8'h0 , es_rs2_value[7:0], 48'h0} :
										/*es_alu_result[2:0] == 3'b111 ?*/ {       es_rs2_value[7:0], 56'h0} 
							           ) :
						  inst_is_sh ? (es_alu_result[2:1] == 2'b00 ? {48'h0,es_rs2_value[15:0]        } :
						  			    es_alu_result[2:1] == 2'b01 ? {32'h0,es_rs2_value[15:0],  16'h0} :
						  			    es_alu_result[2:1] == 2'b10 ? {16'h0,es_rs2_value[15:0],  32'h0} :
						  			    /*es_alu_result[2:1] == 2'b11 ?*/ {      es_rs2_value[15:0],  48'h0}  
						  	           ) :
						  inst_is_sw ? (es_alu_result[2] == 1'b0 ?    {32'h0,   es_rs2_value[31:0]     } :
						  				/*es_alu_result[2] == 1'b1 ?*/    {         es_rs2_value[31:0],32'h0}
						  			   ) :
						  inst_is_sd ? (es_rs2_value
						  	           ) :
						  	           es_rs2_value; 


// assign sram_wen = inst_is_sb ? (es_alu_result[2:0] == 3'b000 ? 8'b0000_0001:
// 								es_alu_result[2:0] == 3'b001 ? 8'b0000_0010:
// 								es_alu_result[2:0] == 3'b010 ? 8'b0000_0100:
// 								es_alu_result[2:0] == 3'b011 ? 8'b0000_1000:
// 								es_alu_result[2:0] == 3'b100 ? 8'b0001_0000:
// 								es_alu_result[2:0] == 3'b101 ? 8'b0010_0000:
// 								es_alu_result[2:0] == 3'b110 ? 8'b0100_0000:
// 								/*es_alu_result[2:0] == 3'b111 ?*/ 8'b1000_0000
// 							    ) :
// 			      inst_is_sh ? (es_alu_result[2:1] == 2'b00 ?  8'b0000_0011:
// 						  	    es_alu_result[2:1] == 2'b01 ?  8'b0000_1100:
// 						  	    es_alu_result[2:1] == 2'b10 ?  8'b0011_0000:
// 						  	    /*es_alu_result[2:1] == 2'b11 ?*/  8'b1100_0000
// 						  	   ) :
// 				  inst_is_sw ? (es_alu_result[2] == 1'b0 ? 8'b0000_1111 :
// 						  		/*es_alu_result[2] == 1'b1 ?*/ 8'b1111_0000
// 						  	   ) :
// 				  inst_is_sd ? (8'b1111_1111
// 						  	   ) :
// 						  	    8'b1111_1111; 

// wire [ 4:0]   EXE_dest;
// assign EXE_dest = es_dest & {5{es_valid}};
wire [63:0] es_result;
//forward
//wire [69:0] es_to_ds_fwd;
assign es_to_ds_fwd = {70{es_valid}} & {70{es_gr_we}} & {es_load_op,es_dest,es_result};  //1+5+64
assign {es_except_enter_ecall,
	    es_except_quit_mret ,
		es_csr_rd      ,
		es_csr_wr      ,
		es_csr_imm     ,
		es_csr_waddr   ,
		es_inst        ,
		es_mem_control ,
		es_alu_op      ,
		es_load_op     ,
		es_src2_is_sa  ,
		es_src1_is_pc  ,
		es_src2_is_imm ,
		es_src2_is_4   ,
		es_alu_res_cut ,
		es_gr_we       ,
		es_mem_we      ,
		es_dest        ,
		es_imm         ,
		es_rs1_value   ,
		es_rs2_value   ,
		es_pc
	   } = ds_to_es_bus_r;

wire [63:0] es_alu_src1;
wire [63:0] es_alu_src2;




wire	    es_res_from_mem;

assign es_res_from_mem = es_load_op;
wire es_skip_mtimecmp;
wire es_skip_mtime;
wire es_skip;
wire [63:0] es_csr_wdata;
assign es_to_ms_bus = {es_skip_mtimecmp     , //259:259
					   es_skip_mtime        , //258:258
					   es_skip              , //257:257
					   es_except_enter_ecall, //256:256
					   es_except_quit_mret , //255:255
	                   es_csr_wr      ,       //254:254
					   es_csr_wdata   ,       //253:190
					   es_csr_waddr   ,       //189:178
					   es_inst        ,       //177:146
					   es_mem_control ,       //145:135 
					   es_res_from_mem,       //134:134
					   es_gr_we       ,       //133:133
					   es_dest        ,       //132:128
					   es_result  ,           //127:64
					   es_pc                  //63:0        
   				      };

//assign es_ready_go = 1'b1;
assign es_ready_go = (data_mem_en) ? (es_skip ? 1'b1 : data_sram_req & data_sram_addr_ok) : 1'b1;
assign es_allowin  = !es_valid || es_ready_go && ms_allowin;
assign es_to_ms_valid = es_valid && es_ready_go;
always @(posedge clk) begin
	if (reset | except_flush) begin
		// reset
		es_valid <= 1'b0;
	end
	else if (es_allowin) begin
		es_valid <= ds_to_es_valid;
	end

	if(ds_to_es_valid && es_allowin) begin
		ds_to_es_bus_r <= ds_to_es_bus;
	end
end

//assign es_pc_to_ws    = es_pc   ;
//assign es_valid_to_ws = es_valid;

assign csr_regs_raddr = es_csr_rd ? {52'h0, es_inst[31:20]} : 64'h0;
wire [63:0] es_csr_true_rdata;  //need alu

//csr_regs_rdata need to be select(forward)
//wire [63:0] es_csr_rdata;


assign es_csr_true_rdata = ((csr_regs_raddr == csr_ms_to_es_fwd[63:0]) && (csr_ms_to_es_fwd[128])) ? csr_ms_to_es_fwd[127:64] :
						   ((csr_regs_raddr == csr_ws_to_es_fwd[63:0]) && (csr_ws_to_es_fwd[128])) ? csr_ws_to_es_fwd[127:64] :
													                                                 csr_regs_rdata           ;
 //csr
 assign es_csr_wdata = es_csr_wr ? es_alu_result : 64'h0;


assign es_alu_src1 = //es_src1_is_sa ? {es_imm} :
					 es_csr_imm    ? {59'h0,es_inst[19:15]} :
					 es_src1_is_pc ? es_pc :
					 				 es_rs1_value;

assign es_alu_src2 = es_csr_rd     ? es_csr_true_rdata  :
					 es_src2_is_sa ? {58'd0,es_imm[5:0]}: 
					 es_src2_is_imm ? {es_imm} :
				     es_src2_is_4 ? 64'd4 :
				     				es_rs2_value;

//todo: alu 处理64I截断的问题，可能需要增加选择控制信号

ysyx_210596_alu inst_alu
	(
		.alu_op     (es_alu_op),
		.alu_src1   (es_alu_src1),
		.alu_src2   (es_alu_src2),
		.alu_result (es_alu_result)
	);


assign es_result =  es_csr_rd      ? es_csr_true_rdata                              :
					es_alu_res_cut ? {{32{es_alu_result[31]}}, es_alu_result[31:0]} :
								                               es_alu_result        ;

// mask_8_64 inst(.in(sram_wen),
// 		  .out(data_sram_mask));
//wire [ 	    7:0]   data_sram_wen ;
//wire [     63:0]   data_sram_mask; 

// ysyx_210596_mask_8_64 inst(.in(data_sram_wen),
// 		  .out(data_sram_mask));


assign es_skip = (data_sram_addr == 64'h00000000_02004000 && data_mem_en) 
			   || (data_sram_addr == 64'h00000000_0200bff8 && data_mem_en);



assign es_skip_mtime    = (data_sram_addr == 64'h00000000_0200bff8 && data_mem_en);
assign es_skip_mtimecmp = (data_sram_addr == 64'h00000000_02004000 && data_mem_en);


assign data_sram_en = (es_skip) ? 1'b0 : (data_mem_en & es_valid);
//assign data_sram_en = data_mem_en;
//assign data_sram_wen = es_mem_we&&es_valid ? sram_wen : 8'h0;
assign data_sram_addr = data_mem_en ? es_alu_result : 0;
//assign data_sram_addr = {es_alu_result[63:2],2'b0};
//assign data_sram_addr = es_alu_result;
//assign data_sram_addr = (es_inst == 32'h00063783) ? 64'h80000000_00000000 : es_alu_result;
//assign data_sram_mask = ;
assign data_sram_wdata = write_sram_wdata;
assign data_sram_wr    = es_mem_we;

assign data_sram_req  = data_sram_en;
assign data_sram_size = (inst_is_sb) ? `YSYX210596_SIZE_B :
						(inst_is_sh) ? `YSYX210596_SIZE_H :
						(inst_is_sw) ? `YSYX210596_SIZE_W :
						(inst_is_sd) ? `YSYX210596_SIZE_D :
									   `YSYX210596_SIZE_D ;


endmodule


// module ysyx_210596_mask_8_64(
// 	input  wire [ 7:0] in,
// 	output wire [63:0] out
// 	);

// genvar i;
// generate for(i=0; i<64; i=i+1) begin : gen_for_mask_8_64
// 	integer j = i/8;
// 	assign out[i] = (in[j]) ? 1'b1 : 1'b0;
// end endgenerate


// endmodule
//--YangXin--

//`include "defines.v"


module ysyx_210596_mem_stage(
	input  wire         				clk               ,
	input  wire         				reset             ,
	//allowin
	input  wire         				ws_allowin        ,
	output wire           				ms_allowin        ,
	//from es
	input  wire         				es_to_ms_valid    ,
	input  wire [`YSYX210596_ES_TO_MS_BUS_WD -1:0] es_to_ms_bus      ,
	//to ws
	output wire         				ms_to_ws_valid    ,
	output wire [`YSYX210596_MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus      ,
	//forward
	output wire [                 68:0] ms_to_ds_fwd      ,
	output wire [                128:0] csr_ms_to_es_fwd  ,
	output wire              			load_data_pre_ok  ,
	//from data_sram
	input  wire [                 63:0] data_sram_rdata_d0,
	//add handshake
	input  wire 						data_sram_data_ok ,
	//except
	input  wire 						except_flush      ,
	//output wire [                 63:0] ms_pc_to_ws       ,
	//output wire 						ms_valid_to_ws    ,
	input  wire [                 63:0] mtimecmp_i        ,
	input  wire [                 63:0] mtime_i        
	// input  wire                         es_inst                 
	);

reg          ms_valid;
wire         ms_ready_go;

reg [`YSYX210596_ES_TO_MS_BUS_WD -1:0] es_to_ms_bus_r;
wire         ms_res_from_mem;
wire         ms_gr_we;
wire [ 4:0]  ms_dest;
wire [63:0]  ms_alu_result;
wire [63:0]  ms_pc;
wire [31:0]  ms_inst;   //difftest
//csr
wire 		 ms_csr_wr;
wire [63:0]  ms_csr_wdata;
wire [11:0]  ms_csr_waddr;
//exception
wire         ms_except_enter_ecall;
wire         ms_except_quit_mret ;

//store load
wire [10:0]  ms_mem_control;
wire         load_sign_lb  ;
wire         load_sign_lh  ;
wire         load_sign_lw  ;
wire [63:0]  mem_result_lb ;
// wire [63:0]  mem_result_lb_temp ;
wire [7:0]  mem_result_lb_temp ;


wire 		 ms_mem_flag;
assign ms_mem_flag = ^ms_mem_control;

wire [63:0]  mem_result_lh ;
// wire [63:0]  mem_result_lh_temp ;
wire [15:0]  mem_result_lh_temp ;

wire [63:0]  mem_result_lw ;
//wire [63:0]  mem_result_lw_temp ;
wire [31:0]  mem_result_lw_temp ;

wire [63:0]  mem_result_lbu;
wire [63:0]  mem_result_lhu;
wire [63:0]  mem_result_lwu;
wire [63:0]  mem_result_ld ;

// reg  [63:0]  data_sram_rdata;

wire ms_skip;
// always @(posedge clk) begin
// 	data_sram_rdata <= data_sram_rdata_d0;
// end
wire [63:0] data_sram_rdata;
assign data_sram_rdata = data_sram_rdata_d0 & {64{data_sram_data_ok}};
wire load_flag;
assign load_flag = ms_mem_control[10] | ms_mem_control[9] | ms_mem_control[8] | ms_mem_control[7] | ms_mem_control[6] | ms_mem_control[2] | ms_mem_control[1];
assign load_data_pre_ok = (load_flag) & (data_sram_data_ok || ms_skip);


//lb lbu
assign load_sign_lb = (ms_alu_result[2:0] == 3'b000) ? data_sram_rdata[7] :
					  (ms_alu_result[2:0] == 3'b001) ? data_sram_rdata[15]:
					  (ms_alu_result[2:0] == 3'b010) ? data_sram_rdata[23]:
					  (ms_alu_result[2:0] == 3'b011) ? data_sram_rdata[31]:
					  (ms_alu_result[2:0] == 3'b100) ? data_sram_rdata[39]:
					  (ms_alu_result[2:0] == 3'b101) ? data_sram_rdata[47]:
					  (ms_alu_result[2:0] == 3'b110) ? data_sram_rdata[55]:
					  (ms_alu_result[2:0] == 3'b111) ? data_sram_rdata[63]:
					  												  1'b0;

assign mem_result_lb_temp[7:0] = 
					  (ms_alu_result[2:0] == 3'b000) ? data_sram_rdata[7:0] :
					  (ms_alu_result[2:0] == 3'b001) ? data_sram_rdata[15:8]:
					  (ms_alu_result[2:0] == 3'b010) ? data_sram_rdata[23:16]:
					  (ms_alu_result[2:0] == 3'b011) ? data_sram_rdata[31:24]:
					  (ms_alu_result[2:0] == 3'b100) ? data_sram_rdata[39:32]:
					  (ms_alu_result[2:0] == 3'b101) ? data_sram_rdata[47:40]:
					  (ms_alu_result[2:0] == 3'b110) ? data_sram_rdata[55:48]:
					  (ms_alu_result[2:0] == 3'b111) ? data_sram_rdata[63:56]:
					  								   data_sram_rdata[63:56];

assign mem_result_lb  = {{56{load_sign_lb}}, mem_result_lb_temp[7:0]};
assign mem_result_lbu = {56'd0, mem_result_lb_temp[7:0]};

//lh/lhu

assign load_sign_lh = (ms_alu_result[2:1] == 2'b00 ) ? data_sram_rdata[15]:
           			  (ms_alu_result[2:1] == 2'b01 ) ? data_sram_rdata[31]:
           			  (ms_alu_result[2:1] == 2'b10 ) ? data_sram_rdata[47]:
           			  (ms_alu_result[2:1] == 2'b11 ) ? data_sram_rdata[63]:
           			  												  1'b0;

assign mem_result_lh_temp[15:0] = 
					  (ms_alu_result[2:1] == 2'b00 ) ? data_sram_rdata[15:0]:
           			  (ms_alu_result[2:1] == 2'b01 ) ? data_sram_rdata[31:16]:
           			  (ms_alu_result[2:1] == 2'b10 ) ? data_sram_rdata[47:32]:
           			  (ms_alu_result[2:1] == 2'b11 ) ? data_sram_rdata[63:48]:
           			                                   data_sram_rdata[63:48];

assign mem_result_lh  = {{48{load_sign_lh}},mem_result_lh_temp[15:0]};           			  
assign mem_result_lhu = {48'd0, mem_result_lh_temp[15:0]};

//lw/lwu

assign load_sign_lw = (ms_alu_result[2] == 1'b0) ? data_sram_rdata[31] :
					  (ms_alu_result[2] == 1'b1) ? data_sram_rdata[63] :
					  						                   	  1'b0 ;
assign mem_result_lw_temp[31:0] = 
					  (ms_alu_result[2] == 1'b0) ? data_sram_rdata[31: 0]:
					  (ms_alu_result[2] == 1'b1) ? data_sram_rdata[63:32]:   //1230 dc report
					  							   data_sram_rdata[63:32];

assign mem_result_lw = {{32{load_sign_lw}}, mem_result_lw_temp[31:0]};
assign mem_result_lwu = {32'd0, mem_result_lw_temp[31:0]};

//ld
assign mem_result_ld = data_sram_rdata;




// wire [4:0]   MEM_dest;
// assign MEM_dest = ms_dest & {5{ms_valid}};


wire ms_skip_mtime;
wire ms_skip_mtimecmp;
wire [63:0] ms_final_result;
//forward
//wire [68:0]  ms_to_ds_fwd;
// assign ms_to_ds_fwd     = {69{ms_valid}} & {69{ms_gr_we}} & {ms_dest,ms_final_result};  //5+64
// assign csr_ms_to_es_fwd = {129{ms_valid}} & {129{ms_csr_wr}} & 
// 						  {ms_csr_wr,ms_csr_waddr,ms_csr_wdata}; //1+64+64
assign ms_to_ds_fwd     = {69{ms_to_ws_valid}} & {69{ms_gr_we}} & {ms_dest,ms_final_result};  //5+64
assign csr_ms_to_es_fwd = {129{ms_to_ws_valid}} & {129{ms_csr_wr}} & 
						  {ms_csr_wr,{52'b0,ms_csr_waddr},ms_csr_wdata}; //1+64+64

// assign csr_ms_to_es_fwd = {77{ms_to_ws_valid}} & {77{ms_csr_wr}} & 
// 						  {ms_csr_wr,ms_csr_waddr,ms_csr_wdata}; //1+12+64

assign {ms_skip_mtimecmp     ,
		ms_skip_mtime        ,
	    ms_skip              ,
		ms_except_enter_ecall,
		ms_except_quit_mret ,
		ms_csr_wr      ,
		ms_csr_wdata   ,
		ms_csr_waddr   ,
		ms_inst        ,
		ms_mem_control ,    
		ms_res_from_mem,
	    ms_gr_we       ,
	    ms_dest		   ,
	    ms_alu_result  ,
	    ms_pc
	    } = es_to_ms_bus_r;

wire [63:0] mem_result;


assign ms_to_ws_bus = {ms_skip              , //245:245
					   ms_except_enter_ecall, //244:244
					   ms_except_quit_mret , //243:243
					   ms_csr_wr      ,  //242:242
					   ms_csr_wdata   ,  //241:178
					   ms_csr_waddr   ,  //177:166
					   ms_inst        ,  //165:134
					   ms_gr_we       ,  //133:133
					   ms_dest        ,  //132:128
					   ms_final_result,  //127:64
					   ms_pc             //63:0
					   };



//assign ms_ready_go    = 1'b1;
assign ms_ready_go    = ms_mem_flag ? (ms_skip ? 1'b1 : data_sram_data_ok) : 1'b1;
assign ms_allowin     = !ms_valid || ms_ready_go && ws_allowin;
assign ms_to_ws_valid = ms_valid && ms_ready_go;
always @(posedge clk) begin
	if (reset | except_flush) begin
		// reset
		ms_valid <= 1'b0;
	end
	else if (ms_allowin) begin
		ms_valid <= es_to_ms_valid;
	end

	if(es_to_ms_valid && ms_allowin) begin
		es_to_ms_bus_r <= es_to_ms_bus;
	end
end

//assign ms_pc_to_ws    = ms_pc   ;
//assign ms_valid_to_ws = ms_valid;

assign mem_result = (ms_mem_control == 11'b1000_0000_000) ? mem_result_lb :
                    (ms_mem_control == 11'b0100_0000_000) ? mem_result_lh :
                    (ms_mem_control == 11'b0010_0000_000) ? mem_result_lw :
                    (ms_mem_control == 11'b0001_0000_000) ? mem_result_lbu:
                    (ms_mem_control == 11'b0000_1000_000) ? mem_result_lhu:
                    (ms_mem_control == 11'b0000_0000_100) ? mem_result_lwu:
                    (ms_mem_control == 11'b0000_0000_010) ? mem_result_ld :
                    										data_sram_rdata;




// assign ms_final_result = ms_res_from_mem ? mem_result
//                                          : ms_alu_result;

assign ms_final_result =ms_skip_mtime        ? mtime_i   :
						ms_skip_mtimecmp     ? mtimecmp_i: 
						ms_res_from_mem      ? mem_result
                                             : ms_alu_result;


endmodule

//--Yangxin--

//`include "defines.v"

module ysyx_210596_wb_stage(
	input  wire 						clk    		     ,
	input  wire 						reset		     ,
	//allowin
	output wire 						ws_allowin	     ,
	//from ms
	input  wire                         ms_to_ws_valid   ,
	input  wire [`YSYX210596_MS_TO_WS_BUS_WD-1 :0] ms_to_ws_bus     ,
	//to rf:for write back
	output wire [`YSYX210596_WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus     ,
	//to csr
	output wire [`YSYX210596_WS_TO_CSR_BUS_WD-1:0] ws_to_csr_bus    , 
	output wire [`YSYX210596_WS_EXCEPT_BUS_WD-1:0] ws_except_bus    , 
	//forward
	output wire [                 68:0] ws_to_ds_fwd     ,
	output wire [                128:0] csr_ws_to_es_fwd , 
	//csr_regs_forward
	input  wire [                 63:0] csr_mtvec        , 
	input  wire [                 63:0] csr_mepc         ,
	input  wire [                 63:0] csr_mstatus      ,	
	input  wire 				        csr_mie_mtie     , 		
    //trace debug inteface: I think it is similar to difftest
	output wire [                 63:0] debug_wb_pc      ,
	output wire [                 31:0] debug_wb_inst    , 
	//output wire 						debug_wb_rf_we   ,
	//output wire [                  4:0] debug_wb_rf_waddr,
	//output wire [                 63:0] debug_wb_rf_wdata, 
	output wire                         debug_wb_valid   ,
	//except
	output wire                         except_flush     ,   
    output wire [                 63:0] except_new_pc    ,
	//timer interrupt 
	input  wire                         timer_interrupt  ,
	output wire                         true_timer_interrupt, 
	//input  wire	[                 63:0] ms_pc_to_ws      ,
	//input  wire                         ms_valid_to_ws   ,
	//input  wire [                 63:0] es_pc_to_ws      ,
	//input  wire                         es_valid_to_ws   ,
	output wire                         ws_skip          ,
	//inst_sram data ok
	input  wire 				        data_ok 
	);




reg ws_valid;
wire ws_ready_go;

reg [`YSYX210596_MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus_r;
wire ws_gr_we;
wire [4:0] ws_dest;
wire [63:0] ws_final_result;
wire [63:0] ws_pc;
wire [31:0] ws_inst;
//csr
wire 		 ws_csr_wr;
wire [63:0]  ws_csr_wdata;
wire [11:0]  ws_csr_waddr;
//exception
wire         ws_except_enter_ecall;
wire         ws_except_quit_mret  ;
// wire         except_flush         ;
// wire [63:0]  except_new_pc        ;





wire        ws_except_ecall		 ;
wire        ws_except_mret 		 ;
wire [63:0] ws_except_pc         ; 
wire        ws_except_status_mie ;
wire 	    ws_except_status_mpie; 

wire        ws_timer_interrupt   ;       
wire [63:0] ws_int_next_pc       ;

// assign ws_int_next_pc = ms_valid_to_ws ? ms_pc_to_ws :
// 						es_valid_to_ws ? es_pc_to_ws :
// 								         64'h0       ;
assign ws_int_next_pc = ws_except_pc;


assign ws_except_ecall       = ws_except_enter_ecall & ws_valid;
assign ws_except_mret        = ws_except_quit_mret & ws_valid;
assign ws_except_pc          = ws_pc;
assign ws_except_status_mie  = csr_mstatus[3];
assign ws_except_status_mpie = csr_mstatus[7];

assign ws_timer_interrupt    = timer_interrupt & ws_except_status_mie & csr_mie_mtie & ws_valid;         //need to add interrupt-en ???
//assign ws_timer_interrupt    = timer_interrupt & ws_except_status_mie & csr_mie_mtie;         //need to add interrupt-en ???
assign true_timer_interrupt  = ws_timer_interrupt;

wire except_flush_temp;

assign except_flush_temp  = (ws_except_enter_ecall | ws_except_quit_mret | ws_timer_interrupt) & ws_valid;

reg except_flush_hold;
always @(posedge clk) begin
	if(reset) begin
		except_flush_hold <= 1'b0;
	end
	else if(except_flush_temp) begin
		except_flush_hold <= 1'b1;
	end
	else if(data_ok) begin
		except_flush_hold <= 1'b0;
	end
end
assign except_flush = except_flush_temp | except_flush_hold;

//assign except_flush  = (ws_except_enter_ecall | ws_except_quit_mret | ws_timer_interrupt);
assign except_new_pc = ws_timer_interrupt    ? csr_mtvec :
					   ws_except_enter_ecall ? csr_mtvec :
					   ws_except_quit_mret   ? csr_mepc  :
					   						   csr_mtvec ;

assign ws_except_bus         = {ws_int_next_pc       ,  //132:69
								ws_timer_interrupt   ,  //68:68
								ws_except_ecall      ,  //67:67
							    ws_except_mret       ,  //66:66
								ws_except_pc         ,  //65:2
								ws_except_status_mie ,  //1:1
								ws_except_status_mpie   //0:0
};




//////////////
// wire [4:0] WB_dest;
// assign WB_dest = ws_dest & {5{ws_valid}};

//wire ws_skip;

//forward
//wire [68:0] ws_to_ds_fwd;
assign ws_to_ds_fwd     = {69{ws_valid}} & {69{ws_gr_we}} & {ws_dest,ws_final_result};  //5+64
// assign csr_ws_to_es_fwd = {129{ws_valid}} & {129{ws_csr_wr}} & 
// 						  {ws_csr_wr,ws_csr_waddr,ws_csr_wdata}; //1+64+64
wire [63:0] csr_waddr ;
assign csr_ws_to_es_fwd = {129{ws_valid}} & {129{ws_csr_wr}} & 
						  {ws_csr_wr,csr_waddr,ws_csr_wdata}; //1+64+64

assign {ws_skip              ,
		ws_except_enter_ecall,
		ws_except_quit_mret ,
		ws_csr_wr      ,
		ws_csr_wdata   ,
		ws_csr_waddr   ,
		ws_inst        ,     //166:135
		ws_gr_we       ,     //134:133
	    ws_dest        ,     //132:128
	    ws_final_result,     //127:64
	    ws_pc                //63:0
	    } = ms_to_ws_bus_r;


wire        rf_we    ;
wire [ 4:0] rf_waddr ;
wire [63:0] rf_wdata ;

//csr
wire        csr_we    ;

wire [63:0] csr_wdata ;
assign ws_to_rf_bus = {rf_we,       //69:69
	                   rf_waddr,    //68:64
	                   rf_wdata     //63:0
					   };

assign ws_to_csr_bus = {csr_we,      //128:128
						csr_waddr,   //127:64
						csr_wdata    //63:0
					   };


assign ws_ready_go = 1'b1;
assign ws_allowin = !ws_valid || ws_ready_go;
always @(posedge clk) begin
	if (reset | except_flush) begin
		// reset
		ws_valid <= 1'b0;
	end
	else if (ws_allowin) begin
		ws_valid <= ms_to_ws_valid;
	end

	if(ms_to_ws_valid && ws_allowin) begin
		ms_to_ws_bus_r <= ms_to_ws_bus;
	end
end

assign rf_we    = ws_gr_we && ws_valid && (~true_timer_interrupt);
//assign rf_we    = ws_gr_we && ws_valid;
assign rf_waddr = ws_dest;
assign rf_wdata = ws_final_result;
//csr
//assign csr_we    = ws_csr_wr && ws_valid;
assign csr_we    = ws_csr_wr && ws_valid && (~true_timer_interrupt);
assign csr_waddr = {52'h0,ws_csr_waddr};
assign csr_wdata = ws_csr_wdata;
//csr with exception
//assign csr_we    = ws_except_enter_ecall ?  (ws_csr_wr && ws_valid);


// reg  [                 63:0] ws_pc_d1;
// reg  [                 31:0] ws_inst_d1;
// reg  						 rf_we_d1;
// reg  [                  4:0] ws_dest_d1;
// reg  [                 63:0] ws_final_result_d1;

// always @(posedge clk) begin
// 	ws_pc_d1 <= ws_pc;
// 	ws_inst_d1 <= ws_inst;
// 	rf_we_d1 <= rf_we;
// 	ws_dest_d1 <= ws_dest;
// 	ws_final_result_d1 <= ws_final_result;
// end


//debug info generate
assign debug_wb_pc       = ws_pc          ;
assign debug_wb_inst     = ws_inst        ;
//assign debug_wb_rf_we    = rf_we          ;
//assign debug_wb_rf_waddr = ws_dest        ;
//assign debug_wb_rf_wdata = ws_final_result;
assign debug_wb_valid    = ws_valid       ;
// assign debug_wb_pc       = ws_pc          ;
// assign debug_wb_inst     = ws_inst_d1        ;
// assign debug_wb_rf_we    = rf_we_d1          ;
// assign debug_wb_rf_waddr = ws_dest_d1        ;
// assign debug_wb_rf_wdata = ws_final_result_d1;

endmodule
//--Yangxin--

//`include "defines.v"
//csr 寄存器模块
module ysyx_210596_csr_reg(
	input wire         clk              ,
	input wire         reset            ,
	//from wb
	input wire         we               ,
	input wire  [11:0] raddr            ,
	input wire  [63:0] waddr            ,
	input wire  [63:0] wdata            ,
	output wire [63:0] rdata            ,
	
	//output wire        global_int_en_o  ,

	//ecall & mret
	input  wire [`YSYX210596_WS_EXCEPT_BUS_WD-1:0] csr_except_ctrl  , 
	//difftest
	//output wire [63:0] csr_mcycle_o     ,
	//output wire [63:0] csr_mtvec_o      , 
	//output wire [63:0] csr_mcause_o     ,
	//output wire [63:0] csr_mepc_o       , 
	//output wire [63:0] csr_mstatus_o    ,
	//output wire [63:0] csr_mie_o        ,
	//output wire [63:0] csr_mip_o        ,
	//output wire [63:0] csr_mscratch_o   , 
	//output wire [63:0] csr_sstatus_o    , 

	//csr_regs
	output wire [63:0] csr_mtvec_to_ws  ,
	output wire [63:0] csr_mepc_to_ws   ,
	output wire [63:0] csr_mstatus_to_ws,
	output wire        csr_mie_mtie_to_ws    
	);

localparam CSR_MCYCLE   = 12'hb00;
localparam CSR_MTVEC    = 12'h305;
localparam CSR_MCAUSE   = 12'h342;
localparam CSR_MEPC     = 12'h341;
localparam CSR_MSTATUS  = 12'h300;
localparam CSR_MIE      = 12'h304;
//localparam CSR_MIP      = 12'h344;
localparam CSR_MSCRATCH = 12'h340;

reg [63:0] mcycle ;  //machine cycle counter
reg [63:0] mtvec  ;
reg [63:0] mcause ;
reg [63:0] mepc   ;
reg [63:0] mstatus;
reg [63:0] mie    ;
//reg [63:0] mip    ;
reg [63:0] mscratch;

//assign global_int_en_o = (mstatus[3] == 1'b1) ? 1'b1 : 1'b0;

//exception ecall and mret
wire        except_ecall      ;
wire        except_mret       ;
wire [63:0] except_pc         ; 
wire        except_status_mie ;
wire 	    except_status_mpie; 
wire        except_timer_interrupt;
wire [63:0] except_int_next_pc;

assign {except_int_next_pc    ,//132:69
		except_timer_interrupt,//68:68
		except_ecall      ,    //67:67
		except_mret       ,    //66:66
		except_pc         ,    //65:2
		except_status_mie ,    //1:1
		except_status_mpie     //0:0
		} = csr_except_ctrl;


//cycle counter
always @(posedge clk) begin
	if (reset) begin
		// reset
		mcycle <= 64'h0;
	end
	else begin
		mcycle <= mcycle + 1'b1;
	end
end

//WRITE CSR
//mtvec
always @(posedge clk) begin
	if (reset) begin
		// reset
		mtvec <= 64'h0;
	end
	else if (we && (waddr[11:0] == CSR_MTVEC)) begin
		mtvec <= wdata;
	end
end

//mcause
always @(posedge clk) begin
	if (reset) begin
		// reset
		mcause <= 64'h0;
	end
	else if(except_timer_interrupt) begin
		mcause <= 64'h80000000_00000007;
	end
	else if(except_ecall) begin
	    mcause <= 64'd11;
	end
	else if (we && (waddr[11:0] == CSR_MCAUSE)) begin
		mcause <= wdata;
	end
end

//mepc
always @(posedge clk) begin
	if (reset) begin
		// reset
		mepc <= 64'h0;
	end
	else if(except_timer_interrupt) begin
		//mepc <= except_pc;
		mepc <= except_int_next_pc;
	end
	else if(except_ecall) begin
		mepc <= except_pc;
	end
	else if (we && (waddr[11:0] == CSR_MEPC)) begin
		mepc <= wdata;
	end
end

//mstatus
always @(posedge clk) begin
	if (reset) begin
		// reset
		mstatus <= 64'h0;
	end
	else if(except_timer_interrupt) begin
		mstatus[7] <= except_status_mie;
		mstatus[3] <= 1'b0;
		mstatus[12:11] <= 2'b11;         //????
	end
	else if(except_mret) begin
		mstatus[3] <= except_status_mpie;
		mstatus[7] <= 1'b1;
		mstatus[12:11] <= 2'b0;
	end
	else if(except_ecall) begin
		mstatus[7] <= except_status_mie;
		mstatus[3] <= 1'b0;
		mstatus[12:11] <= 2'b11;
	end
	else if (we && (waddr[11:0] == CSR_MSTATUS)) begin
		mstatus <= {((wdata[16:15]==2'b11) || (wdata[14:13] == 2'b11)) ,wdata[62:0]};
	end
end

//mie
always @(posedge clk) begin
	if (reset) begin
		// reset
		mie <= 64'h0;
	end
	else if (we && (waddr[11:0] == CSR_MIE)) begin
		mie <= wdata;
	end
end

// //mip
// always @(posedge clk) begin
// 	if (reset) begin
// 		// reset
// 		mip <= 64'h0;
// 	end
// 	else if(except_timer_interrupt) begin
// 		mip[7] <= 1'b1;
// 	end
// 	else if (we && (waddr[11:0] == CSR_MIP)) begin
// 		mip <= wdata;
// 	end
// end

//mscratch
always @(posedge clk) begin
	if (reset) begin
		// reset
		mscratch <= 64'h0;
	end
	else if (we && (waddr[11:0] == CSR_MSCRATCH)) begin
		mscratch <= wdata;
	end
end

//READ
assign rdata = (raddr[11:0] == waddr[11:0] && we) ? wdata  :
               (raddr[11:0] == CSR_MCYCLE      ) ? mcycle :
               (raddr[11:0] == CSR_MTVEC       ) ? mtvec  :
               (raddr[11:0] == CSR_MCAUSE      ) ? mcause :
               (raddr[11:0] == CSR_MEPC        ) ? mepc   :
               (raddr[11:0] == CSR_MSTATUS     ) ? mstatus:
               (raddr[11:0] == CSR_MIE         ) ? mie    :
			   (raddr[11:0] == CSR_MSCRATCH    ) ? mscratch    :
               									    64'h0  ;


//difftest
//assign csr_mcycle_o  = (we & waddr[11:0] == CSR_MCYCLE ) ? wdata : mcycle ;
//assign csr_mtvec_o   = (we & waddr[11:0] == CSR_MTVEC  ) ? wdata : mtvec  ;
//assign csr_mcause_o  = //(except_timer_interrupt         ) ? mcause         :
					//    (except_timer_interrupt         ) ? 64'h80000000_00000007:
					//    (except_ecall                   ) ? 64'd11         :
                    //    (we & waddr[11:0] == CSR_MCAUSE ) ? wdata : mcause ;
// assign csr_mepc_o    = //(except_timer_interrupt         ) ? mepc           :
// 					   (except_timer_interrupt         ) ? except_int_next_pc:
// 					   (except_ecall                   ) ? except_pc      :
// 					   (we & waddr[11:0] == CSR_MEPC   ) ? wdata : mepc   ;
// assign csr_mstatus_o = //(except_timer_interrupt         ) ?
// 					   //{mstatus[63:13],2'b11,mstatus[10:8],except_status_mie,mstatus[6:4],1'b0,mstatus[2:0]} : 
// 					   //mstatus: 
// 					   (except_timer_interrupt         ) ?
// 					   {mstatus[63:13],2'b11,mstatus[10:8],except_status_mie,mstatus[6:4],1'b0,mstatus[2:0]} : 
// 					   //{mstatus[63:13],mstatus[12:8],except_status_mie,mstatus[6:4],1'b0,mstatus[2:0]} : 
// 					   (except_mret                    ) ? 
// 					   {mstatus[63:13],2'b0,mstatus[10:8],1'b1,mstatus[6:4],except_status_mpie,mstatus[2:0]} : 
// 					   (except_ecall                   ) ?
// 					   {mstatus[63:13],2'b11,mstatus[10:8],except_status_mie,mstatus[6:4],1'b0,mstatus[2:0]} : 
// 					   (we & waddr[11:0] == CSR_MSTATUS) ? {((wdata[16:15]==2'b11) || (wdata[14:13] == 2'b11)) ,wdata[62:0]} : mstatus;

//assign csr_mie_o     = (we & waddr[11:0] == CSR_MIE    ) ? wdata : mie    ;
// assign csr_mip_o     = (except_timer_interrupt)          ? {mip[63:8],1'b1,mip[6:0]}:
// 					   (we & waddr[11:0] == CSR_MIP    ) ? wdata : mip    ;
//assign csr_mscratch_o     = (we & waddr[11:0] == CSR_MSCRATCH    ) ? wdata : mscratch    ;
//assign csr_sstatus_o = csr_mstatus_o & 64'h80000003000DE122;

assign csr_mtvec_to_ws    = mtvec  ;
assign csr_mepc_to_ws     = mepc   ;
assign csr_mstatus_to_ws  = mstatus;
assign csr_mie_mtie_to_ws = mie[7] ;

endmodule
//--Yangxin--

//`include "defines.v"

module ysyx_210596_clint(
    input  wire         clk            ,
    input  wire         reset          ,
    input  wire [63:0]  addr           ,
    input  wire [63:0]  wdata          ,
    input  wire         wr_en          , 
    output wire [63:0]  mtimecmp_o     ,
    output wire [63:0]  mtime_o        , 
    input  wire         clint_valid    ,
    //output wire         clint_ready    ,
    output wire         timer_interrupt

);

reg [63:0] mtime;
reg [63:0] mtimecmp;

always @(posedge clk) begin
    if(reset) begin
        mtime <= 64'h0;
    end
    else begin
        mtime <= mtime + 1;
    end
end

//mie
// always @(posedge clk) begin
// 	if (reset) begin
// 		// reset
// 		mie <= 64'h0;
// 	end
// 	else if (we && (waddr == CSR_MIE)) begin
// 		mie <= wdata;
// 	end
// end

//mtimecmp
wire mtimecmp_en;
assign mtimecmp_en = (addr == 64'h00000000_02004000);
assign mtimecmp_o  = mtimecmp;

//reg    clint_ready_reg              ;
//assign clint_ready = clint_ready_reg;

//assign clint_ready = clint_ready_reg;


always @(posedge clk) begin
    if(reset) begin
        mtimecmp <= 64'h0;
    end
    else if(mtimecmp_en & wr_en & clint_valid) begin
        mtimecmp <= wdata;
    end
end

// always @(posedge clk) begin
//      if(reset) begin
//          clint_ready_reg <= 1'b0;
//      end
//      else if(clint_valid) begin
//          clint_ready_reg <= 1'b1;
//      end
// end

assign timer_interrupt = (mtime >= mtimecmp);

//mtime
assign mtime_o = mtime;

endmodule

