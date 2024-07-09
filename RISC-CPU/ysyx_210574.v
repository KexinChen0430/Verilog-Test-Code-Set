`timescale 1ns / 1ps
`define YSYX210574_PC_START   32'h30000000 
`define YSYX210574_InstBus		31:0
`define YSYX210574_InstAddrBus	31:0
`define YSYX210574_JumpEnable 	1'b1 
`define YSYX210574_RegBus			63:0
`define YSYX210574_RegAddrBus		4:0
`define YSYX210574_ZeroWord		64'h00000000_00000000
`define YSYX210574_ADDRZeroWord		32'h00000000
`define YSYX210574_ZERO_WORD      64'h00000000_00000000
`define YSYX210574_WriteEnable 	1'b1
`define YSYX210574_ZeroReg 		5'h0
`define YSYX210574_WriteDisable	1'b0
`define YSYX210574_RIB_REQ 1'b1
`define YSYX210574_RIB_NREQ 1'b0
`define YSYX210574_JumpDisable 1'b0
`define YSYX210574_HoldEnable 1'b1
`define YSYX210574_HoldDisable 1'b0
`define YSYX210574_MemBus 63:0
`define YSYX210574_RstEnable 1'b1
`define YSYX210574_INT_ASSERT 1'b1
`define YSYX210574_INT_DEASSERT 1'b0


`define YSYX210574_INST_TYPE_I 7'b0010011
`define YSYX210574_INST_ADDI   3'b000
`define YSYX210574_INST_SLTI   3'b010
`define YSYX210574_INST_SLTIU  3'b011
`define YSYX210574_INST_XORI   3'b100
`define YSYX210574_INST_ORI    3'b110
`define YSYX210574_INST_ANDI   3'b111
`define YSYX210574_INST_SLLI   3'b001
`define YSYX210574_INST_SRI    3'b101


`define YSYX210574_INST_TYPE_IW 7'b0011011
`define YSYX210574_INST_ADDIW   3'b000
`define YSYX210574_INST_SLLIW   3'b001
`define YSYX210574_INST_SRIW    3'b101



`define YSYX210574_INST_TYPE_L 7'b0000011
`define YSYX210574_INST_LB     3'b000
`define YSYX210574_INST_LH     3'b001
`define YSYX210574_INST_LW     3'b010
`define YSYX210574_INST_LBU    3'b100
`define YSYX210574_INST_LHU    3'b101
`define YSYX210574_INST_LWU    3'b110
`define YSYX210574_INST_LD     3'b011


`define YSYX210574_INST_TYPE_S 7'b0100011
`define YSYX210574_INST_SB     3'b000
`define YSYX210574_INST_SH     3'b001
`define YSYX210574_INST_SW     3'b010
`define YSYX210574_INST_SD     3'b011


`define YSYX210574_INST_TYPE_R_M 7'b0110011


`define YSYX210574_INST_ADD_SUB 3'b000
`define YSYX210574_INST_SLL    3'b001
`define YSYX210574_INST_SLT    3'b010
`define YSYX210574_INST_SLTU   3'b011
`define YSYX210574_INST_XOR    3'b100
`define YSYX210574_INST_SR     3'b101
`define YSYX210574_INST_OR     3'b110
`define YSYX210574_INST_AND    3'b111


`define YSYX210574_INST_TYPE_RW 7'b0111011
`define YSYX210574_INST_ADD_SUBW 3'b000
`define YSYX210574_INST_SLLW     3'b001
`define YSYX210574_INST_SRW      3'b101



`define YSYX210574_INST_MUL    3'b000
`define YSYX210574_INST_MULH   3'b001
`define YSYX210574_INST_MULHSU 3'b010
`define YSYX210574_INST_MULHU  3'b011
`define YSYX210574_INST_DIV    3'b100
`define YSYX210574_INST_DIVU   3'b101
`define YSYX210574_INST_REM    3'b110
`define YSYX210574_INST_REMU   3'b111


`define YSYX210574_INST_JAL    7'b1101111
`define YSYX210574_INST_JALR   7'b1100111

`define YSYX210574_INST_LUI    7'b0110111
`define YSYX210574_INST_AUIPC  7'b0010111
`define YSYX210574_INST_NOP    32'h00000001
`define YSYX210574_INST_NOP_OP 7'b0000001
`define YSYX210574_INST_MRET   32'h30200073
`define YSYX210574_INST_RET    32'h00008067

`define YSYX210574_INST_FENCE  7'b0001111
`define YSYX210574_INST_ECALL  32'h73
`define YSYX210574_INST_EBREAK 32'h00100073


`define YSYX210574_INST_TYPE_B 7'b1100011
`define YSYX210574_INST_BEQ    3'b000
`define YSYX210574_INST_BNE    3'b001
`define YSYX210574_INST_BLT    3'b100
`define YSYX210574_INST_BGE    3'b101
`define YSYX210574_INST_BLTU   3'b110
`define YSYX210574_INST_BGEU   3'b111


`define YSYX210574_INST_CSR    7'b1110011
`define YSYX210574_INST_CSRRW  3'b001
`define YSYX210574_INST_CSRRS  3'b010
`define YSYX210574_INST_CSRRC  3'b011
`define YSYX210574_INST_CSRRWI 3'b101
`define YSYX210574_INST_CSRRSI 3'b110
`define YSYX210574_INST_CSRRCI 3'b111


`define YSYX210574_CSR_CYCLE   12'hc00
`define YSYX210574_CSR_CYCLEH  12'hc80
`define YSYX210574_CSR_MTVEC   12'h305
`define YSYX210574_CSR_MCAUSE  12'h342
`define YSYX210574_CSR_MEPC    12'h341
`define YSYX210574_CSR_MIE     12'h304
`define YSYX210574_CSR_MSTATUS 12'h300
`define YSYX210574_CSR_MSCRATCH 12'h340
`define YSYX210574_CSR_MIP      12'h344


`define YSYX210574_AXI_ADDR_WIDTH      32
`define YSYX210574_AXI_DATA_WIDTH      64
`define YSYX210574_AXI_ID_WIDTH        4
`define YSYX210574_AXI_USER_WIDTH      1

`define YSYX210574_SIZE_B              2'b00
`define YSYX210574_SIZE_H              2'b01
`define YSYX210574_SIZE_W              2'b10
`define YSYX210574_SIZE_D              2'b11

`define YSYX210574_REQ_READ            1'b0
`define YSYX210574_REQ_WRITE           1'b1


`define YSYX210574_B0XX_AXI_DATA_WIDTH   64
`define YSYX210574_B0XX_AXI_ID_WIDTH     4
`define YSYX210574_B0XX_AXI_USER_WIDTH   1


module ysyx_210574(
    
    input  clock,
    input  reset,
    input  io_interrupt,
	
    output                                 io_slave_awready,
    input                                  io_slave_awvalid,
    input [31:0]                           io_slave_awaddr,
    input [3:0]                            io_slave_awid,
    input [7:0]                            io_slave_awlen,
    input [2:0]                            io_slave_awsize,
    input [1:0]                            io_slave_awburst,

    output                                 io_slave_wready,
    input                                  io_slave_wvalid,
    input [63:0]                           io_slave_wdata,
    input [7:0]                            io_slave_wstrb,
    input                                  io_slave_wlast,

    input                                  io_slave_bready,
    output                                 io_slave_bvalid,
    output  [1:0]                          io_slave_bresp,
    output  [3:0]                          io_slave_bid,

    output                                 io_slave_arready,
    input                                  io_slave_arvalid,
    input [31:0]                           io_slave_araddr,
    input [3:0]                            io_slave_arid,
    input [7:0]                            io_slave_arlen,
    input [2:0]                            io_slave_arsize,
    input [1:0]                            io_slave_arburst, 

    input                                  io_slave_rready,
    output                                 io_slave_rvalid,
    output  [1:0]                          io_slave_rresp,
    output  [63:0]                         io_slave_rdata,
    output                                 io_slave_rlast,
    output  [3:0]                          io_slave_rid,

    input                                 io_master_awready,
    output                                io_master_awvalid,
    output [31:0]                         io_master_awaddr,
    output [3:0]                          io_master_awid,
    output [7:0]                          io_master_awlen,
    output [2:0]                          io_master_awsize,
    output [1:0]                          io_master_awburst,
   
 
    input                                 io_master_wready,
    output                                io_master_wvalid,
    output [63:0]                         io_master_wdata,
    output [7:0]                          io_master_wstrb,
    output                                io_master_wlast,
 
    output                                io_master_bready,
    input                                 io_master_bvalid,
    input  [1:0]                          io_master_bresp,
    input  [3:0]                          io_master_bid,

    input                                 io_master_arready,
    output                                io_master_arvalid,
    output [31:0]                         io_master_araddr,
    output [3:0]                          io_master_arid,
    output [7:0]                          io_master_arlen,
    output [2:0]                          io_master_arsize,
    output [1:0]                          io_master_arburst,
    
    output                                io_master_rready,
    input                                 io_master_rvalid,
    input  [1:0]                          io_master_rresp,
    input  [63:0]                         io_master_rdata,
    input                                 io_master_rlast,
    input  [3:0]                          io_master_rid
    );
    // always @(*) begin
    //  
    //       $display("=mytest====%x====%x====%x===%x===%x======\n",io_master_arvalid,io_master_araddr, io_master_arsize,io_master_arready, reset);
    //       
    //    end

    //integer file_out;
    //initial begin
    //    file_out = $fopen("rt.txt");
    //    if (!file_out)begin
    //        $dispaly("can't open file");
    //        $finish;
    //    end
//
    //end
//
    // always @(*) begin
    //     $fdisplay(file_out,"%d",io_master_araddr);
          //$display("=mytest====%x====%x====%x===%x===%x======\n",io_master_arvalid,io_master_araddr, io_master_arsize,io_master_arready, reset);

       //end
    assign io_master_arid = 4'b0;
    assign io_master_awid = 4'b0;
    assign io_slave_awready = 1'b0;

    assign io_slave_wready = 1'b0;

    assign io_slave_bvalid = 1'b0;
    assign io_slave_bresp = 2'b0;
    assign io_slave_bid = 4'b0;


    assign io_slave_arready = 1'b0;

    assign io_slave_rvalid = 1'b0;
    assign io_slave_rresp = 2'b0;
    assign io_slave_rdata = 64'h0;
    assign io_slave_rlast = 1'b0;
    assign io_slave_rid = 4'b0;
    

    ysyx_210574_bigcpu Ysyx_210574_bigcpu(
    .clock(clock),
    .reset(reset),
    .aw_bits_ready(io_master_awready),
    .aw_bits_valid(io_master_awvalid),
    .aw_bits_addr(io_master_awaddr),
    
    
    
    .aw_bits_len(io_master_awlen),
    .aw_bits_size(io_master_awsize),
    .aw_bits_burst(io_master_awburst),
    
    
    

    .w_bits_ready(io_master_wready),
    .w_bits_valid(io_master_wvalid),
    .w_bits_data(io_master_wdata),
    .w_bits_strb(io_master_wstrb),
    .w_bits_last(io_master_wlast),

    .b_bits_ready( io_master_bready),
    .b_bits_valid( io_master_bvalid),
    .b_bits_resp(io_master_bresp),
    .b_bits_id(io_master_bid),
    

    .ar_bits_ready( io_master_arready),
    .ar_bits_valid( io_master_arvalid),
    .ar_bits_addr(io_master_araddr),
    
    
    
    .ar_bits_len(io_master_arlen),
    .ar_bits_size(io_master_arsize),
    .ar_bits_burst(io_master_arburst),
    
    
    

    .r_bits_ready(io_master_rready),
    .r_bits_valid(io_master_rvalid),
    .r_bits_resp(io_master_rresp),
    .r_bits_data(io_master_rdata),
    .r_bits_last(io_master_rlast),
    .r_bits_id(io_master_rid)
    

    );

endmodule


module ysyx_210574_cache(
    input clk,
    input rst,
    //接收
    input wire [63:0]axi_mem_wmask,
    output reg [`YSYX210574_AXI_ADDR_WIDTH-1:0]axi_cache_d_aw_addr,  
    output reg axi_cache_d_aw_valid,
    input wire axi_cache_d_aw_ready,
    output reg [7:0]axi_cache_d_aw_len_o,
    output reg [2:0]axi_cache_d_aw_size_o,
    output reg [1:0]axi_cache_d_aw_burst_o,

    output reg [`YSYX210574_AXI_DATA_WIDTH-1:0]axi_cache_d_w_data,
    output reg [7:0]axi_cache_d_w_strb,
    output reg axi_cache_d_w_valid,
    output reg axi_cache_d_w_last,
    input wire axi_cache_d_w_ready,

    input wire [`YSYX210574_AXI_ID_WIDTH-1:0]axi_cache_d_b_id,
    input wire [1:0]axi_cache_d_b_resp,
    input wire axi_cache_d_b_valid,
    output reg axi_cache_d_b_ready,

    output reg [`YSYX210574_AXI_ADDR_WIDTH-1:0]axi_cache_d_ar_addr,
    output reg axi_cache_d_ar_valid,
    input wire axi_cache_d_ar_ready,
    output reg [7:0]axi_cache_d_ar_len_o,
    output reg [2:0]axi_cache_d_ar_size_o,
    output reg [1:0]axi_cache_d_ar_burst_o,

    input wire [`YSYX210574_AXI_ID_WIDTH-1:0]axi_cache_d_r_id,
    input wire [`YSYX210574_AXI_DATA_WIDTH-1:0]axi_cache_d_r_data,
    input wire [1:0]axi_cache_d_r_resp,
    input wire axi_cache_d_r_last,
    input wire axi_cache_d_r_valid,
    output reg axi_cache_d_r_ready,



    //发送
    input wire cache_mem_vaild,
    input wire cache_delete,

	input wire [`YSYX210574_AXI_ADDR_WIDTH-1:0]cache_d_aw_addr,  
    input wire cache_d_aw_valid,
    output reg cache_d_aw_ready,
    input [7:0] cache_d_aw_len_o,
    input [2:0] cache_d_aw_size_o,
    input [1:0] cache_d_aw_burst_o,

    input wire [`YSYX210574_AXI_DATA_WIDTH-1:0]cache_d_w_data,
    input wire [7:0]cache_d_w_strb,
    input wire cache_d_w_valid,
    output reg cache_d_w_ready,

    output wire [`YSYX210574_AXI_ID_WIDTH-1:0]cache_d_b_id,
    output wire [1:0]cache_d_b_resp,
    output reg cache_d_b_valid,
    input wire cache_d_b_ready,

    
    input wire [`YSYX210574_AXI_ADDR_WIDTH-1:0]cache_d_ar_addr,
    input wire cache_d_ar_valid,
    output reg cache_d_ar_ready,
    input [7:0] cache_d_ar_len_o,
    input [2:0] cache_d_ar_size_o,
    input [1:0] cache_d_ar_burst_o,

    output reg [`YSYX210574_AXI_ID_WIDTH-1:0]cache_d_r_id,
    output reg [`YSYX210574_AXI_DATA_WIDTH-1:0]cache_d_r_data,
    output reg [1:0]cache_d_r_resp,
    output reg cache_d_r_last,
    output reg cache_d_r_valid,
    input wire cache_d_r_ready 
);
//*********************************************************
    reg uncache; 
    wire [6:0]I_index;
    wire [20:0]I_tag;
    wire I_line_offset;
    reg [31:0]r_data_addr;
    reg cache_hit;
    wire [127:0]cache_rdata;
    wire icache_cen;
    wire [5:0]A_addr;
    reg [127:0] B_wen;
    reg [127:0]axi_icache_data;
    reg [31:0] 	regs[0 : 127];
    wire [6:0] axi_index = {1'b0,cache_d_ar_addr[9:4]};
    reg DWcache_hit;
    reg keep_cache_hit;
    reg keep_Dcache_hit;
    reg wen_ram;
    reg Dwen_ram;
    reg [63:0] read_data;
    wire [20:0]D_tag;
    reg Dcache_hit;
    wire [6:0] D_index = cache_d_ar_addr[9:4] + 7'b100_0000;
    assign D_tag = cache_d_ar_addr[30:10];
    wire [127:0]Dcache_rdata;
    wire Dcache_cen;
    wire [5:0]D_A_addr;
    reg [127:0] D_B_wen;
    reg [127:0]axi_Dcache_data;
    wire [63:0] w_strb ={{8{cache_d_w_strb[7]}},{8{cache_d_w_strb[6]}},{8{cache_d_w_strb[5]}},{8{cache_d_w_strb[4]}},
    {8{cache_d_w_strb[3]}},{8{cache_d_w_strb[2]}},{8{cache_d_w_strb[1]}},{8{cache_d_w_strb[0]}}};
    assign icache_cen = (cache_hit == 1'b1)?1'b1:(wen_ram & ~uncache == 1'b1)?1'b1:1'b0;
    assign Dcache_cen = (Dcache_hit == 1'b1)?1'b1:(Dwen_ram & ~uncache == 1'b1)?1'b1:1'b0;
    assign D_A_addr = cache_d_ar_addr[9:4];
    assign A_addr = cache_d_ar_addr[9:4];
    assign I_line_offset = cache_d_ar_addr[3];
    assign I_index = {1'b0,cache_d_ar_addr[9:4]};
    assign I_tag = cache_d_ar_addr[30:10];
     always @ (*) begin
            if (rst == `YSYX210574_RstEnable) begin
                uncache = 1'b0;
            end else if ((cache_d_ar_addr < 32'h8000_0000)  ) begin
                uncache = 1'b1;
            end else begin
                uncache = 1'b0;
            end
        end
    always @ (posedge clk) begin
            if (rst == `YSYX210574_RstEnable) begin
                cache_d_ar_ready <= 1'b0;
            end else if (cache_d_ar_valid == 1'b1) begin
                cache_d_ar_ready <= 1'b1;
            end else begin
                cache_d_ar_ready <= 1'b0;
            end
        end 


    //命中判断
    ysyx_210574_S011HD1P_X32Y2D128_BW YSYX210574_S011HD1P_X32Y2D128_BW_cache(
        .Q(cache_rdata),
        .CLK(clk),
        .CEN(~icache_cen),
        .BWEN(B_wen),
        .WEN(~wen_ram),
        .A(A_addr),
        .D(axi_icache_data)
    );
     //写入tag
    integer i;
	
	always @(posedge clk) begin
		if ( rst == 1'b1 ) begin
            for (i = 0; i < 128; i = i + 1) begin
                regs[i] <= 32'h0; 
            end
        end else if ( cache_delete == 1'b1 ) begin
			for (i = 0; i < 128; i = i + 1) begin
                regs[i] <= 32'h0; 
            end
        end else begin
			if ((axi_cache_d_r_valid & axi_cache_d_r_ready &
             ~uncache & ~cache_mem_vaild) == 1'b1)	
				regs[axi_index] <= cache_d_ar_addr;
            else if ((axi_cache_d_r_valid & axi_cache_d_r_ready &
             ~uncache & cache_mem_vaild) == 1'b1)	
				regs[D_index] <= cache_d_ar_addr;
		end

    end

     always @(*) begin
    		if (rst == 1'b1)
    			r_data_addr = 32'h0;
    		else if (cache_d_ar_valid & cache_d_ar_ready  & ~cache_mem_vaild == 1'b1)
    			r_data_addr = regs[I_index];
            else if (cache_d_ar_valid & cache_d_ar_ready  & cache_mem_vaild == 1'b1)
    			r_data_addr = regs[D_index];
            else if (cache_d_w_valid & cache_d_w_ready  & cache_mem_vaild == 1'b1)
    			r_data_addr = regs[D_index];
            else 
    			r_data_addr =32'h0;
    	end

     always @(*) begin
            if ( (r_data_addr[30:10] == I_tag) & (r_data_addr[31]   == 1'b1) & ~cache_mem_vaild & ~uncache &
            cache_d_ar_valid & cache_d_ar_ready)
            	cache_hit = 1'b1;
            else
                cache_hit = 1'b0;           
	end
     always @(*) begin
            if ( (r_data_addr[30:10] == D_tag) & (r_data_addr[31]   == 1'b1) & cache_mem_vaild & ~uncache &
            cache_d_ar_valid & cache_d_ar_ready)
            	Dcache_hit = 1'b1;
            else
                Dcache_hit = 1'b0;           
	end
     always @(*) begin
            if ( (r_data_addr[30:10] == D_tag) & (r_data_addr[31]   == 1'b1) & cache_mem_vaild & ~uncache &
            cache_d_w_valid & cache_d_w_valid)
            	DWcache_hit = 1'b1;
            else
                DWcache_hit = 1'b0;           
	end
    always @(posedge clk) begin
   		 if (cache_hit  == 1'b1)begin
   			keep_cache_hit <= 1'b1;
   		 end else  begin
   			keep_cache_hit <= 1'b0;
   	    end
       end
    always @(posedge clk) begin
   		 if (Dcache_hit  == 1'b1)begin
   			keep_Dcache_hit <= 1'b1;
   		 end else  begin
   			keep_Dcache_hit <= 1'b0;
   	    end
       end
     //未命中
    always @(posedge clk) begin
    		 if ((~cache_hit & ~Dcache_hit & cache_d_ar_valid & cache_d_ar_ready)  == 1'b1)begin
    			axi_cache_d_ar_valid <= 1'b1;
    		 end else if (axi_cache_d_ar_ready == 1'b1) begin
    			axi_cache_d_ar_valid <= 1'b0;              
    	    end
        end
    always @ (posedge clk) begin
            if (rst == `YSYX210574_RstEnable) begin
                axi_cache_d_ar_addr <= 32'h0;
            end else if ((~cache_hit & ~Dcache_hit & cache_d_ar_valid & cache_d_ar_ready & ~uncache) == 1'b1) begin
                axi_cache_d_ar_addr <= {cache_d_ar_addr[31:4],4'b0};
            end else if ((~cache_hit & ~Dcache_hit & cache_d_ar_valid & cache_d_ar_ready & uncache) == 1'b1) begin
                axi_cache_d_ar_addr <= cache_d_ar_addr;
            end else if (axi_cache_d_r_valid == 1'b1)begin 
                axi_cache_d_ar_addr <= 32'h0;
            end
        end
    always @ (*) begin
                axi_cache_d_ar_len_o = cache_d_ar_len_o;
                axi_cache_d_ar_size_o = cache_d_ar_size_o;
                axi_cache_d_ar_burst_o =  cache_d_ar_burst_o;
        end
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            axi_cache_d_r_ready <= 1'b0;
        end else if ( axi_cache_d_ar_ready == 1'b1) begin
            axi_cache_d_r_ready <= 1'b1;
        end else if (axi_cache_d_r_valid & axi_cache_d_r_ready == 1'b1)begin
            axi_cache_d_r_ready <= 1'b1;
        end
    end
  
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            axi_icache_data <= 128'h0;
            wen_ram <= 1'b0;
            B_wen   <= 128'h0;
        end else if (axi_cache_d_r_valid & axi_cache_d_r_ready & ~cache_mem_vaild & ~uncache & ~axi_cache_d_r_last == 1'b1) begin
            axi_icache_data <= {64'h0,axi_cache_d_r_data};
            wen_ram <= 1'b1;
            B_wen   <= {64'hffff_ffff_ffff_ffff,64'h0};
        end else if (axi_cache_d_r_valid & axi_cache_d_r_last & ~cache_mem_vaild & ~uncache == 1'b1) begin
            axi_icache_data <= {axi_cache_d_r_data,64'h0};
            wen_ram <= 1'b1;
            B_wen   <= {64'h0,64'hffff_ffff_ffff_ffff};
        end else begin
            axi_icache_data <= 128'h0;
            wen_ram <= 1'b0;
            B_wen   <= 128'h0;
        end
    end
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            axi_Dcache_data <= 128'h0;
            Dwen_ram <= 1'b0;
            D_B_wen <= 128'h0;
        end else if (axi_cache_d_r_valid & axi_cache_d_r_ready & cache_mem_vaild & ~uncache & ~axi_cache_d_r_last == 1'b1) begin
            axi_Dcache_data <= {64'h0,axi_cache_d_r_data};
            Dwen_ram <= 1'b1;
            D_B_wen <= {64'hffff_ffff_ffff_ffff,64'h0};
        end else if (axi_cache_d_r_valid & axi_cache_d_r_last & cache_mem_vaild & ~uncache == 1'b1) begin
            axi_Dcache_data <= {axi_cache_d_r_data,64'h0};
            Dwen_ram <= 1'b1;
            D_B_wen <= {64'h0,64'hffff_ffff_ffff_ffff};
        end else if ( DWcache_hit & cache_mem_vaild & ~uncache & ~I_line_offset == 1'b1) begin
            axi_Dcache_data <= {64'h0,cache_d_w_data};
            Dwen_ram <= 1'b1;
            D_B_wen <= {64'hffff_ffff_ffff_ffff,~w_strb};
        end else if ( DWcache_hit & cache_mem_vaild & ~uncache & I_line_offset == 1'b1) begin
            axi_Dcache_data <= {cache_d_w_data,64'h0};
            Dwen_ram <= 1'b1;
            D_B_wen <= {~w_strb,64'hffff_ffff_ffff_ffff};
        end else begin
            axi_Dcache_data <= 128'h0;
            Dwen_ram <= 1'b0;
            D_B_wen <= 128'h0;
        end
    end
     always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            read_data <= 64'h0;
        end else if ( axi_cache_d_r_valid & axi_cache_d_r_ready & ~uncache  & ~I_line_offset & ~axi_cache_d_r_last == 1'b1) begin
            read_data <= axi_cache_d_r_data;
        end
    end
     always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
             cache_d_r_valid <= 1'b0;
             cache_d_r_data <= 64'h0;
        end else if (axi_cache_d_r_valid & axi_cache_d_r_ready & uncache == 1'b1) begin
             cache_d_r_valid <= 1'b1;
             cache_d_r_data <= axi_cache_d_r_data;
        end else if (axi_cache_d_r_valid & axi_cache_d_r_ready & ~uncache  & ~I_line_offset & axi_cache_d_r_last == 1'b1) begin
             cache_d_r_valid <= 1'b1;
             cache_d_r_data <= read_data;
        end else if (axi_cache_d_r_valid & axi_cache_d_r_last & I_line_offset & ~uncache == 1'b1) begin
             cache_d_r_valid <= 1'b1;
             cache_d_r_data <= axi_cache_d_r_data;
        end else if (keep_cache_hit & ~I_line_offset == 1'b1) begin
             cache_d_r_valid <= 1'b1;
             cache_d_r_data <= cache_rdata[63:0];
        end else if (keep_cache_hit & I_line_offset == 1'b1) begin
             cache_d_r_valid <= 1'b1;
             cache_d_r_data <= cache_rdata[127:64];
        end else if (keep_Dcache_hit & ~I_line_offset == 1'b1) begin
             cache_d_r_valid <= 1'b1;
             cache_d_r_data <= Dcache_rdata[63:0];
        end else if (keep_Dcache_hit & I_line_offset == 1'b1) begin
             cache_d_r_valid <= 1'b1;
             cache_d_r_data <= Dcache_rdata[127:64];
        end else begin 
             cache_d_r_valid <= 1'b0;
             cache_d_r_data <= 64'h0;
        end
    end
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            cache_d_r_last <= 1'b0;
        end else if ( cache_d_r_ready == 1'b1) begin
            cache_d_r_last <= 1'b1;
        end else begin
            cache_d_r_last <= 1'b0;
        end
    end
    //**********************Dcache******************************
    //命中判断
    ysyx_210574_S011HD1P_X32Y2D128_BW YSYX210574_S011HD1P_X32Y2D128_BW_Dcache(
        .Q(Dcache_rdata),
        .CLK(clk),
        .CEN(~Dcache_cen),
        .BWEN(D_B_wen),
        .WEN(~Dwen_ram),
        .A(D_A_addr),
        .D(axi_Dcache_data)
    );



     always @ (posedge clk) begin
            if (rst == `YSYX210574_RstEnable) begin
                cache_d_aw_ready <= 1'b0;
            end else if (cache_d_aw_valid == 1'b1) begin
                cache_d_aw_ready <= 1'b1;
            end else begin
                cache_d_aw_ready <= 1'b0;
            end
        end
     always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
             cache_d_w_ready <= 1'b0;
        end else if (cache_d_aw_valid & cache_d_aw_ready == 1'b1) begin
             cache_d_w_ready <= 1'b1;
        end else if (cache_d_w_valid & cache_d_w_ready == 1'b1) begin
             cache_d_w_ready <= 1'b0;
        end
    end
     always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            cache_d_b_valid <= 1'b0;
        end else if (axi_cache_d_b_ready & axi_cache_d_b_valid == 1'b1) begin
            cache_d_b_valid <= 1'b1; 
        end else if (cache_d_b_ready == 1'b1) begin
            cache_d_b_valid <= 1'b0;       
        end
    end
    //外设写握手
     always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            axi_cache_d_aw_addr <= 32'b0;
        end else if (cache_d_aw_valid & cache_d_aw_ready == 1'b1) begin
            axi_cache_d_aw_addr <= cache_d_aw_addr;
        end else if (axi_cache_d_b_valid == 1'b1) begin
            axi_cache_d_aw_addr <= 32'h0;
        end
    end

     always @(posedge clk) begin
    		 if ( cache_d_aw_valid & cache_d_aw_ready == 1'b1)begin
    			axi_cache_d_aw_valid <= 1'b1;
    		 end else if (axi_cache_d_aw_ready == 1'b1) begin
    			axi_cache_d_aw_valid <= 1'b0;
    	    end
        end
    always @ (*) begin
                axi_cache_d_aw_len_o = cache_d_aw_len_o;
                axi_cache_d_aw_size_o = cache_d_aw_size_o;
                axi_cache_d_aw_burst_o =  cache_d_aw_burst_o;
        end
     always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            axi_cache_d_w_valid <= 1'b0;
        end else if ( axi_cache_d_aw_ready & axi_cache_d_aw_valid  == 1'b1) begin
            axi_cache_d_w_valid <= 1'b1;
        end else if (axi_cache_d_w_ready == 1'b1)begin
            axi_cache_d_w_valid <= 1'b0;
        end
    end
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            axi_cache_d_w_data <= 64'h0;
            axi_cache_d_w_strb <= 8'b0;
            axi_cache_d_w_last <= 1'b0;
        end else if ( axi_cache_d_aw_ready  & axi_cache_d_aw_valid == 1'b1) begin
            axi_cache_d_w_data <= cache_d_w_data;
            axi_cache_d_w_strb <= cache_d_w_strb;
            axi_cache_d_w_last <= 1'b1;
        end else if ( axi_cache_d_b_valid  == 1'b1)  begin
            axi_cache_d_w_data <= 64'h0;
            axi_cache_d_w_strb <= 8'b0;
            axi_cache_d_w_last <= 1'b1;
        end
    end    
     always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            axi_cache_d_b_ready <= 1'b0;
        end else if ( axi_cache_d_aw_ready & axi_cache_d_aw_valid  == 1'b1) begin
            axi_cache_d_b_ready <= 1'b1;
        end else if ( axi_cache_d_b_valid  == 1'b1) begin
            axi_cache_d_b_ready <= 1'b0;
        end
    end
    
endmodule
module ysyx_210574_S011HD1P_X32Y2D128_BW(
    Q, CLK, CEN, WEN, BWEN, A, D
);
parameter Bits = 128;
parameter Word_Depth = 64;
parameter Add_Width = 6;
parameter Wen_Width = 128;

output reg [Bits-1:0] Q;
input                 CLK;
input                 CEN;
input                 WEN;
input [Wen_Width-1:0] BWEN;
input [Add_Width-1:0] A;
input [Bits-1:0]      D;

wire cen  = ~CEN;
wire wen  = ~WEN;
wire [Wen_Width-1:0] bwen = ~BWEN;

reg [Bits-1:0] ram [0:Word_Depth-1];
always @(posedge CLK) begin
    if(cen && wen) begin
        ram[A] <= (D & bwen) | (ram[A] & ~bwen);
    end
    Q <= cen && !wen ? ram[A] : 128'h0;
    //if(cen) begin
    //    $display("=mytest====%x====%x====%x===%x===%x===%x===\n",ram[A],CEN, WEN,BWEN, A,D);
    //end
end

endmodule
module ysyx_210574_if_stage(

    input wire clk,
    input wire rst,
    input wire jump_flag_i,                 
    input wire[`YSYX210574_InstAddrBus] jump_addr_i,   
    input wire            flush,

    output reg fetched,

    output if_valid,
	input  if_ready,
    output [7:0] if_size,
    input  [1:0] if_resp,
    input  [63:0] if_data_read,
    output reg[`YSYX210574_InstAddrBus]inst_addr,

    output wire handshake_done,


    output wire[`YSYX210574_InstBus]       inst_o,           
	output reg[`YSYX210574_InstAddrBus]    pc


    );
   //always @(*) begin
   //  if (handshake_done == 1'b1) begin
   //     $display("=mytest====%x====%x====%x===%x===%x===%x=%x==\n",pc,inst_o, if_valid,if_data_read, handshake_done,jump_addr_i,jump_flag_i);
   //end
   //
   //    end

    //reg stop;
    wire [31:0]axi_if_data_read;
    reg[`YSYX210574_InstBus] inst;
    assign handshake_done = if_valid & if_ready;
    assign if_valid = (rst == 1'b1 )?1'b0:1'b1;
    assign if_size = 8'b0;
    assign axi_if_data_read = pc[2] ? if_data_read[63:32] : if_data_read[31:0];
  
    
    
    always @ (posedge clk) begin
        
        if (rst == 1'b1 ) begin
            pc <= `YSYX210574_PC_START;
            inst_addr <= `YSYX210574_PC_START;
             fetched <= 0;
             inst <= 32'b0;
            //stop <= 1'b0;
         end else if (flush == 1'b1) begin
            pc <= pc;
        
        end else if (jump_flag_i == `YSYX210574_JumpEnable) begin
            pc <= jump_addr_i;
           inst_addr <= jump_addr_i;
          // stop <= 1'b1; 
           inst <= 32'b0;
           fetched <= 0;
        
        //end else if ( if_ready & stop == 1'b1  ) begin
        //    pc <= pc;
        //    inst_addr <= inst_addr;   
        //    inst <= 32'b0;
        //    stop <= 1'b0;
        end else if ( handshake_done  ) begin
            pc <= inst_addr;
            inst_addr <= inst_addr + 4;
            inst <= axi_if_data_read[31:0];
            fetched <= 1;
        end else begin
            pc <= inst_addr;
            inst <= 32'b0;
            fetched <= 0;
        end
    end
    
assign inst_o =  inst;
endmodule



module ysyx_210574_ifid_reg(

    input wire clk,
    input wire rst,
	input wire flush,

    input wire if_fetched,
	output reg id_fetched,

    input wire[`YSYX210574_InstBus] 	 if_inst,            
    input wire[`YSYX210574_InstAddrBus] if_pc,   
	

    input wire 				 if_hold_flag, 

	output reg[`YSYX210574_InstAddrBus] id_pc,
    output reg[`YSYX210574_InstBus] 	 id_inst           
    

    );

	always @(posedge clk)begin
		if(rst == 1'b1)begin
			id_pc <= 32'h0;
			id_inst <= 32'h0;
			id_fetched <= 1'b0;		
		end else if(if_hold_flag == 1'b1)begin
			id_pc <= 32'h0;
			id_inst <= 32'h0;
			id_fetched <= 1'b0;
		end else if(flush == 1'b1)begin
			id_pc <= id_pc;
			id_inst <= id_inst;
			id_fetched <= id_fetched;
		end else begin
			id_pc <= if_pc;
			id_inst <= if_inst;
			id_fetched <= if_fetched;
			end
		end
endmodule


module ysyx_210574_id_stage(

	input wire rst,

    input wire  id_fetched_i,
	output wire id_fetched_o,

    input wire[`YSYX210574_InstBus] id_inst_i,             
    input wire[`YSYX210574_InstAddrBus] id_pc_i,    

    input wire[`YSYX210574_RegBus]     ex2_reg_wdata_i,       
    input wire              ex2_reg_we_i,                   
    input wire[`YSYX210574_RegAddrBus] ex2_reg_waddr_i,   

    input wire[`YSYX210574_RegBus]     mem2_reg_wdata_i,       
    input wire              mem2_reg_we_i,                   
    input wire[`YSYX210574_RegAddrBus] mem2_reg_waddr_i,   

    input wire              ex2_mem_req_i,  
    output wire             stallreg_id1,    
    output wire             stallreg_id2,
    
    input wire[`YSYX210574_RegBus] id_reg1_rdata_i,        
    input wire[`YSYX210574_RegBus] id_reg2_rdata_i,        

    
    output reg[`YSYX210574_RegAddrBus] id_reg1_raddr_o,    
    output reg[`YSYX210574_RegAddrBus] id_reg2_raddr_o,    
	output                  id_reg1_ena,
	output                  id_reg2_ena,
    
    output wire[`YSYX210574_InstAddrBus] id_pc_o, 

    input wire[`YSYX210574_RegBus]      id_csr_rdata_i,         
    output reg[11:0]  id_csr_raddr_o,              

    output reg              id_csr_we_o,                  
    output reg[11:0]  id_csr_waddr_o,
    output reg[`YSYX210574_RegBus]      id_csr_rdata_o,

    
    output reg[`YSYX210574_RegBus]id_op1_o,
    output reg[`YSYX210574_RegBus]id_op2_o,
    output reg[`YSYX210574_RegBus]id_op1_jump_o,
    output reg[`YSYX210574_RegBus]id_op2_jump_o,
    output reg[`YSYX210574_InstBus]id_inst_o,             
    output reg[`YSYX210574_RegBus]id_reg1_rdata_o,        
    output reg[`YSYX210574_RegBus]id_reg2_rdata_o,        
    output reg id_reg_we_o,                     
    output reg[`YSYX210574_RegAddrBus] id_reg_waddr_o      

    );

    wire[6:0] opcode = id_inst_i[6:0];
    wire[2:0] funct3 = id_inst_i[14:12];
    wire[4:0] rd = id_inst_i[11:7];
    wire[4:0] rs1 = id_inst_i[19:15];
    wire[4:0] rs2 = id_inst_i[24:20];

    wire[1:0]fwrd1 = (rst == 1'b1)?2'b00:(ex2_reg_we_i == 1'b1 && ex2_reg_waddr_i == id_reg1_raddr_o && id_reg1_ena == 1'b1  )?2'b01:
    (mem2_reg_we_i == 1'b1 && mem2_reg_waddr_i == id_reg1_raddr_o && id_reg1_ena == 1'b1 )?2'b10:
    (id_reg1_ena == 1'b1)?2'b11:2'b00;

    wire[1:0]fwrd2 = (rst == 1'b1)?2'b00:(ex2_reg_we_i == 1'b1 && ex2_reg_waddr_i == id_reg2_raddr_o && id_reg2_ena == 1'b1 )?2'b01:
    (mem2_reg_we_i == 1'b1 && mem2_reg_waddr_i == id_reg2_raddr_o && id_reg2_ena == 1'b1)?2'b10:
    (id_reg2_ena == 1'b1)?2'b11:2'b00;

    assign stallreg_id1 = (rst == 1'b1)?1'b0:((ex2_reg_we_i == 1'b1 && ex2_reg_waddr_i == id_reg1_raddr_o && id_reg1_ena == 1'b1)  &&
     (ex2_mem_req_i == 1'b1) )?1'b1:1'b0;

    assign stallreg_id2 = (rst == 1'b1)?1'b0:((ex2_reg_we_i == 1'b1 && ex2_reg_waddr_i == id_reg2_raddr_o && id_reg2_ena == 1'b1 ) &&
     (ex2_mem_req_i == 1'b1) )?1'b1:1'b0;
    assign id_fetched_o = id_fetched_i;
 
    assign id_reg1_ena =1'b1;
    assign id_reg2_ena =1'b1;
    assign id_pc_o = id_pc_i;
    always @ (*) begin
             id_inst_o = id_inst_i;
             id_reg1_rdata_o = (rs1 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id1 == 1'b1)?`YSYX210574_ZeroWord:(fwrd1 == 2'b01)?ex2_reg_wdata_i:
             (fwrd1 == 2'b10 )?mem2_reg_wdata_i:(fwrd1 == 2'b11 )?id_reg1_rdata_i:`YSYX210574_ZeroWord;
             id_reg2_rdata_o = (rs2 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id2 == 1'b1)?`YSYX210574_ZeroWord:(fwrd2 == 2'b01)?ex2_reg_wdata_i:
             (fwrd2 == 2'b10 )?mem2_reg_wdata_i:(fwrd2 == 2'b11 )?id_reg2_rdata_i:`YSYX210574_ZeroWord;
             id_csr_rdata_o = id_csr_rdata_i;
             id_op1_o = `YSYX210574_ZeroWord;
             id_op2_o = `YSYX210574_ZeroWord;
             id_op1_jump_o = `YSYX210574_ZeroWord;
             id_op2_jump_o = `YSYX210574_ZeroWord;
             id_csr_we_o = 1'b0;
             id_csr_raddr_o = 12'h0;
             id_csr_waddr_o = 12'h0;
             id_reg_we_o = 1'b0;
             id_reg_waddr_o = `YSYX210574_ZeroReg;
        case (opcode)
            `YSYX210574_INST_TYPE_I: begin
                        id_reg_we_o = `YSYX210574_WriteEnable;
                        id_reg_waddr_o = rd;
                        id_reg1_raddr_o = rs1;
                        id_reg2_raddr_o = `YSYX210574_ZeroReg;
                        id_op1_o = (rs1 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id1 == 1'b1)?`YSYX210574_ZeroWord:(fwrd1 == 2'b01)?ex2_reg_wdata_i:
                        (fwrd1 == 2'b10 )?mem2_reg_wdata_i:(fwrd1 == 2'b11 )?id_reg1_rdata_i:`YSYX210574_ZeroWord;
                        id_op2_o = {{52{id_inst_i[31]}}, id_inst_i[31:20]};
            end
             `YSYX210574_INST_TYPE_IW: begin
                case (funct3)
                    `YSYX210574_INST_ADDIW,`YSYX210574_INST_SLLIW,`YSYX210574_INST_SRIW: begin
                        id_reg_we_o = `YSYX210574_WriteEnable;
                        id_reg_waddr_o = rd;
                        id_reg1_raddr_o = rs1;
                        id_reg2_raddr_o = `YSYX210574_ZeroReg;
                        id_op1_o = (rs1 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id1 == 1'b1)?`YSYX210574_ZeroWord:(fwrd1 == 2'b01)?ex2_reg_wdata_i:
                        (fwrd1 == 2'b10 )?mem2_reg_wdata_i:(fwrd1 == 2'b11 )?id_reg1_rdata_i:`YSYX210574_ZeroWord;
                        id_op2_o = {{52{id_inst_i[31]}}, id_inst_i[31:20]};
                    end
                    default: begin
                        id_reg_we_o = `YSYX210574_WriteDisable;
                        id_reg_waddr_o = `YSYX210574_ZeroReg;
                        id_reg1_raddr_o = `YSYX210574_ZeroReg;
                        id_reg2_raddr_o = `YSYX210574_ZeroReg;
                    end
                endcase
            end
            `YSYX210574_INST_TYPE_R_M: begin
                        id_reg_we_o = `YSYX210574_WriteEnable;
                        id_reg_waddr_o = rd;
                        id_reg1_raddr_o = rs1;
                        id_reg2_raddr_o = rs2;
                        id_op1_o =(rs1 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id1 == 1'b1)?`YSYX210574_ZeroWord:(fwrd1 == 2'b01)?ex2_reg_wdata_i:
                        (fwrd1 == 2'b10 )?mem2_reg_wdata_i:(fwrd1 == 2'b11 )?id_reg1_rdata_i:`YSYX210574_ZeroWord;
                        id_op2_o =(rs2 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id2 == 1'b1)?`YSYX210574_ZeroWord:(fwrd2 == 2'b01)?ex2_reg_wdata_i:
                        (fwrd2 == 2'b10 )?mem2_reg_wdata_i:(fwrd2 == 2'b11 )?id_reg2_rdata_i:`YSYX210574_ZeroWord;
			end	
            `YSYX210574_INST_TYPE_RW: begin
                case (funct3)
                    `YSYX210574_INST_ADD_SUBW,`YSYX210574_INST_SLLW,`YSYX210574_INST_SRW: begin
                        id_reg_we_o = `YSYX210574_WriteEnable;
                        id_reg_waddr_o = rd;
                        id_reg1_raddr_o = rs1;
                        id_reg2_raddr_o = rs2;
                        id_op1_o = (rs1 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id1 == 1'b1)?`YSYX210574_ZeroWord:(fwrd1 == 2'b01)?ex2_reg_wdata_i:
                        (fwrd1 == 2'b10 )?mem2_reg_wdata_i:(fwrd1 == 2'b11 )?id_reg1_rdata_i:`YSYX210574_ZeroWord;
                        id_op2_o = (rs2 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id2 == 1'b1)?`YSYX210574_ZeroWord:(fwrd2 == 2'b01)?ex2_reg_wdata_i:
                        (fwrd2 == 2'b10 )?mem2_reg_wdata_i:(fwrd2 == 2'b11 )?id_reg2_rdata_i:`YSYX210574_ZeroWord;
                    end
                    default: begin
                        id_reg_we_o = `YSYX210574_WriteDisable;
                        id_reg_waddr_o = `YSYX210574_ZeroReg;
                        id_reg1_raddr_o = `YSYX210574_ZeroReg;
                        id_reg2_raddr_o = `YSYX210574_ZeroReg;
                    end
                endcase
			end	
            `YSYX210574_INST_TYPE_L: begin
                case (funct3)
                    `YSYX210574_INST_LB, `YSYX210574_INST_LH, `YSYX210574_INST_LW, `YSYX210574_INST_LBU, `YSYX210574_INST_LHU,`YSYX210574_INST_LWU, `YSYX210574_INST_LD  : begin
                        id_reg1_raddr_o = rs1;
                        id_reg2_raddr_o = `YSYX210574_ZeroReg;
                        id_reg_we_o = `YSYX210574_WriteEnable;
                        id_reg_waddr_o = rd;
                        id_op1_o = (rs1 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id1 == 1'b1)?`YSYX210574_ZeroWord:(fwrd1 == 2'b01)?ex2_reg_wdata_i:
                        (fwrd1 == 2'b10 )?mem2_reg_wdata_i:(fwrd1 == 2'b11 )?id_reg1_rdata_i:`YSYX210574_ZeroWord;
                        id_op2_o = {{52{id_inst_i[31]}}, id_inst_i[31:20]};
                    end
                    default: begin
                        id_reg1_raddr_o = `YSYX210574_ZeroReg;
                        id_reg2_raddr_o = `YSYX210574_ZeroReg;
                        id_reg_we_o = `YSYX210574_WriteDisable;
                        id_reg_waddr_o = `YSYX210574_ZeroReg;
                    end
                endcase
            end
            `YSYX210574_INST_TYPE_S: begin
                case (funct3)
                    `YSYX210574_INST_SB, `YSYX210574_INST_SW, `YSYX210574_INST_SH,`YSYX210574_INST_SD: begin
                        id_reg1_raddr_o = rs1;
                        id_reg2_raddr_o = rs2;
                        id_reg_we_o = `YSYX210574_WriteDisable;
                        id_reg_waddr_o = `YSYX210574_ZeroReg;
                        id_op1_o = (rs1 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id1 == 1'b1)?`YSYX210574_ZeroWord:(fwrd1 == 2'b01)?ex2_reg_wdata_i:
                        (fwrd1 == 2'b10 )?mem2_reg_wdata_i:(fwrd1 == 2'b11 )?id_reg1_rdata_i:`YSYX210574_ZeroWord;
                        id_op2_o = {{52{id_inst_i[31]}}, id_inst_i[31:25], id_inst_i[11:7]};
                    end
                    default: begin
                        id_reg1_raddr_o = `YSYX210574_ZeroReg;
                        id_reg2_raddr_o = `YSYX210574_ZeroReg;
                        id_reg_we_o = `YSYX210574_WriteDisable;
                        id_reg_waddr_o = `YSYX210574_ZeroReg;
                    end
                endcase
            end
            `YSYX210574_INST_TYPE_B: begin
                case (funct3)
                    `YSYX210574_INST_BEQ, `YSYX210574_INST_BNE, `YSYX210574_INST_BLT, `YSYX210574_INST_BGE, `YSYX210574_INST_BLTU, `YSYX210574_INST_BGEU: begin
                        id_reg1_raddr_o = rs1;
                        id_reg2_raddr_o = rs2;
                        id_reg_we_o = `YSYX210574_WriteDisable;
                        id_reg_waddr_o = `YSYX210574_ZeroReg;
                        id_op1_o = (rs1 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id1 == 1'b1)?`YSYX210574_ZeroWord:(fwrd1 == 2'b01)?ex2_reg_wdata_i:
                        (fwrd1 == 2'b10 )?mem2_reg_wdata_i:(fwrd1 == 2'b11 )?id_reg1_rdata_i:`YSYX210574_ZeroWord;
                        id_op2_o =(rs2 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id2 == 1'b1)?`YSYX210574_ZeroWord:(fwrd2 == 2'b01)?ex2_reg_wdata_i:
                        (fwrd2 == 2'b10 )?mem2_reg_wdata_i:(fwrd2 == 2'b11 )?id_reg2_rdata_i:`YSYX210574_ZeroWord;
                        id_op1_jump_o = {{32{1'b0}},id_pc_i[31:0]};
                        id_op2_jump_o = {{52{id_inst_i[31]}}, id_inst_i[7], id_inst_i[30:25], id_inst_i[11:8], 1'b0};
                    end
                    default: begin
                        id_reg1_raddr_o = `YSYX210574_ZeroReg;
                        id_reg2_raddr_o = `YSYX210574_ZeroReg;
                        id_reg_we_o = `YSYX210574_WriteDisable;
                        id_reg_waddr_o = `YSYX210574_ZeroReg;
                    end
                endcase
            end
            `YSYX210574_INST_JAL: begin
                id_reg_we_o = `YSYX210574_WriteEnable;
                id_reg_waddr_o = rd;
                id_reg1_raddr_o = `YSYX210574_ZeroReg;
                id_reg2_raddr_o = `YSYX210574_ZeroReg;
                id_op1_o = {{32{1'b0}},id_pc_i[31:0]};
                id_op2_o = 64'h4;
                id_op1_jump_o = {{32{1'b0}},id_pc_i[31:0]};
                id_op2_jump_o = {{44{id_inst_i[31]}}, id_inst_i[19:12],id_inst_i[20], id_inst_i[30:21], 1'b0};
            end
            `YSYX210574_INST_JALR: begin
                id_reg_we_o = `YSYX210574_WriteEnable;
                id_reg1_raddr_o = rs1;
                id_reg2_raddr_o = `YSYX210574_ZeroReg;
                id_reg_waddr_o = rd;
                id_op1_o = {{32{1'b0}},id_pc_i[31:0]};
                id_op2_o = 64'h4;
                id_op1_jump_o = (rs1 == 5'b00000)?`YSYX210574_ZeroWord:(stallreg_id1 == 1'b1)?`YSYX210574_ZeroWord:(fwrd1 == 2'b01)?ex2_reg_wdata_i:
                        (fwrd1 == 2'b10 )?mem2_reg_wdata_i:(fwrd1 == 2'b11 )?id_reg1_rdata_i:`YSYX210574_ZeroWord;
                id_op2_jump_o = {{52{id_inst_i[31]}}, id_inst_i[31:20]};
            end
            `YSYX210574_INST_LUI: begin
                id_reg_we_o = `YSYX210574_WriteEnable;
                id_reg_waddr_o = rd;
                id_reg1_raddr_o = `YSYX210574_ZeroReg;
                id_reg2_raddr_o = `YSYX210574_ZeroReg;
                id_op1_o = {{44{id_inst_i[31]}}, id_inst_i[31:12]};
                id_op2_o = `YSYX210574_ZeroWord;
            end
            `YSYX210574_INST_AUIPC: begin
                id_reg_we_o = `YSYX210574_WriteEnable;
                id_reg_waddr_o = rd;
                id_reg1_raddr_o = `YSYX210574_ZeroReg;
                id_reg2_raddr_o = `YSYX210574_ZeroReg;
                id_op1_o = {{44{id_inst_i[31]}}, id_inst_i[31:12]};
                id_op2_o = {{32{1'b0}},id_pc_i[31:0]};
            end
            `YSYX210574_INST_NOP_OP: begin
                id_reg_we_o = `YSYX210574_WriteDisable;
                id_reg_waddr_o = `YSYX210574_ZeroReg;
                id_reg1_raddr_o = `YSYX210574_ZeroReg;
                id_reg2_raddr_o = `YSYX210574_ZeroReg;
            end
            `YSYX210574_INST_FENCE: begin
                id_reg_we_o = `YSYX210574_WriteDisable;
                id_reg_waddr_o = `YSYX210574_ZeroReg;
                id_reg1_raddr_o = `YSYX210574_ZeroReg;
                id_reg2_raddr_o = `YSYX210574_ZeroReg;
                id_op1_jump_o = 64'h0;
                id_op2_jump_o = 64'h0;
            end
            `YSYX210574_INST_CSR: begin
                id_reg_we_o = `YSYX210574_WriteDisable;
                id_reg_waddr_o = `YSYX210574_ZeroReg;
                id_reg1_raddr_o = `YSYX210574_ZeroReg;
                id_reg2_raddr_o = `YSYX210574_ZeroReg;
                id_csr_raddr_o = id_inst_i[31:20];
                id_csr_waddr_o = id_inst_i[31:20];
                case (funct3)
                    `YSYX210574_INST_CSRRW, `YSYX210574_INST_CSRRS, `YSYX210574_INST_CSRRC: begin
                        id_reg1_raddr_o = rs1;
                        id_reg2_raddr_o = `YSYX210574_ZeroReg;
                        id_reg_we_o = `YSYX210574_WriteEnable;
                        id_reg_waddr_o = rd;
                        id_csr_we_o = `YSYX210574_WriteEnable;
                    end
                    `YSYX210574_INST_CSRRWI, `YSYX210574_INST_CSRRSI, `YSYX210574_INST_CSRRCI: begin
                        id_reg1_raddr_o = `YSYX210574_ZeroReg;
                        id_reg2_raddr_o = `YSYX210574_ZeroReg;
                        id_reg_we_o = `YSYX210574_WriteEnable;
                        id_reg_waddr_o = rd;
                        id_csr_we_o = `YSYX210574_WriteEnable;
                    end
                    default: begin
                        id_reg_we_o = `YSYX210574_WriteDisable;
                        id_reg_waddr_o = `YSYX210574_ZeroReg;
                        id_reg1_raddr_o = `YSYX210574_ZeroReg;
                        id_reg2_raddr_o = `YSYX210574_ZeroReg;
                        id_csr_we_o = `YSYX210574_WriteDisable;
                    end
                endcase
            end
            default: begin
                id_reg_we_o = `YSYX210574_WriteDisable;
                id_reg_waddr_o = `YSYX210574_ZeroReg;
                id_reg1_raddr_o = `YSYX210574_ZeroReg;
                id_reg2_raddr_o = `YSYX210574_ZeroReg;
            end
        endcase


    end

endmodule
 



module ysyx_210574_idex_reg(

    input wire clk,
    input wire rst,
    input wire  id_fetched,
	output reg ex_fetched,
	input wire  				flush,
    input wire            id_exe_flag,

    input wire[`YSYX210574_InstBus]     id_inst,            
    input wire[`YSYX210574_InstAddrBus] id_pc,
    input wire 				       id_reg_we,                    
    input wire[`YSYX210574_RegAddrBus]  id_reg_waddr,    
    input wire[`YSYX210574_RegBus]      id_reg1_rdata,       
    input wire[`YSYX210574_RegBus]      id_reg2_rdata,       
  
    input wire[`YSYX210574_RegBus] id_op1,
    input wire[`YSYX210574_RegBus] id_op2,
    input wire[`YSYX210574_RegBus] id_op1_jump,
    input wire[`YSYX210574_RegBus] id_op2_jump,
	input wire            stall1,
	output reg           ex_stall1,
	input wire            stall2,
	output reg           ex_stall2,

	input wire[11:0] 			    id_csr_waddr,
    input wire[`YSYX210574_RegBus] 				id_csr_rdata,
	output reg[11:0]   		    ex_csr_waddr,
    output reg[`YSYX210574_RegBus] 			ex_csr_rdata,
	input wire		    			id_csr_we,
	output reg 						ex_csr_we,  
 
    output reg[`YSYX210574_InstAddrBus] ex_pc,
    output reg[`YSYX210574_RegBus] ex_op1,
    output reg[`YSYX210574_RegBus] ex_op2,
    output reg[`YSYX210574_RegBus] ex_op1_jump,
    output reg[`YSYX210574_RegBus] ex_op2_jump,
    output reg[`YSYX210574_InstBus] ex_inst,            

    output reg 			        ex_reg_we,        
    output reg[`YSYX210574_RegAddrBus] ex_reg_waddr,    
    output reg[`YSYX210574_RegBus] ex_reg1_rdata,       
    output reg[`YSYX210574_RegBus] ex_reg2_rdata        
   

    );

    always @(posedge clk)begin
		if(rst == 1'b1)begin
            ex_fetched		  <=  1'b0;			
			ex_csr_waddr      <=  12'h0;
			ex_csr_rdata      <=  64'h0;
			ex_csr_we		  <=  1'b0;
			ex_stall1         <=  1'b0;
			ex_stall2         <=  1'b0;
			ex_inst     	  <=  32'h0; 
			ex_reg_we         <=  1'b0;
			ex_reg_waddr      <=  5'b0;
			ex_reg1_rdata     <=  64'h0; 
			ex_reg2_rdata     <=  64'h0;
			ex_op1            <=  64'h0;
			ex_op2            <=  64'h0;
			ex_op1_jump       <=  64'h0;
			ex_op2_jump       <=  64'h0;
			ex_pc             <=  32'h0;
    	end else if(id_exe_flag == 1'b1)begin
            ex_fetched		  <=  1'b0;
			ex_csr_waddr      <=  12'h0;
			ex_csr_rdata      <=  64'h0;
			ex_csr_we		  <=  1'b0;
			ex_stall1         <=  1'b0;
			ex_stall2         <=  1'b0;
            ex_inst     	  <=  32'h0; 
			ex_reg_we         <=  1'b0;
			ex_reg_waddr      <=  5'b0;
			ex_reg1_rdata     <=  64'h0; 
			ex_reg2_rdata     <=  64'h0;
			ex_op1            <=  64'h0;
			ex_op2            <=  64'h0;
			ex_op1_jump       <=  64'h0;
			ex_op2_jump       <=  64'h0;
			ex_pc             <=  32'h0;
		end else if(flush == 1'b1)begin
            ex_fetched		  <=  ex_fetched;
			ex_csr_waddr      <=  ex_csr_waddr;
			ex_csr_rdata      <=  ex_csr_rdata;
			ex_csr_we		  <=  ex_csr_we	;
			ex_stall1         <=  ex_stall1  ; 
			ex_stall2         <=  ex_stall2   ;
			ex_inst     	  <=  ex_inst     ;
			ex_reg_we         <=  ex_reg_we    ;
			ex_reg_waddr      <=  ex_reg_waddr ;
			ex_reg1_rdata     <=  ex_reg1_rdata;
			ex_reg2_rdata     <=  ex_reg2_rdata;
			ex_op1            <=  ex_op1       ;
			ex_op2            <=  ex_op2       ;
			ex_op1_jump       <=  ex_op1_jump  ;
			ex_op2_jump       <=  ex_op2_jump ;
     		ex_pc  	          <=  ex_pc  	   ; 
		end else begin
            ex_fetched		  <=  id_fetched;
			ex_csr_waddr      <=  id_csr_waddr;
			ex_csr_rdata      <=  id_csr_rdata;
			ex_csr_we		  <=   id_csr_we;
			ex_stall1         <=   stall1;
			ex_stall2         <=   stall2;
			ex_inst     	  <=   id_inst;     
			ex_reg_we         <=   id_reg_we;    
			ex_reg_waddr      <=   id_reg_waddr; 
			ex_reg1_rdata     <=   id_reg1_rdata;
			ex_reg2_rdata     <=   id_reg2_rdata;
			ex_op1            <=   id_op1;       
			ex_op2            <=   id_op2;       
			ex_op1_jump       <=   id_op1_jump;  
			ex_op2_jump       <=   id_op2_jump;
     		ex_pc  	          <=   id_pc;
			end
		end

endmodule




module ysyx_210574_exe_stage(

    input wire rst,
    input wire exe_mem_done,
     input wire  ex_fetched_i,
	output wire ex_fetched_o,
    input wire           exe_stall1_i,
    input wire           exe_stall2_i,
    input wire[`YSYX210574_RegBus]     memm2_reg_wdata_i,
    input wire           exe_clint_time_stop_i,

    input wire[`YSYX210574_RegBus]        exe_mip_i,
    input wire[`YSYX210574_RegBus]        exe_mie_i,
    input wire[`YSYX210574_RegBus]        exe_mstatus_i,

    

    input wire[`YSYX210574_InstBus] ex_inst_i,

    input wire reg_we_i,                    
    input wire[`YSYX210574_RegAddrBus] reg_waddr_i,    
    input wire[`YSYX210574_RegBus] reg1_rdata_i,       
    input wire[`YSYX210574_RegBus] reg2_rdata_i,       
   
    input wire[`YSYX210574_RegBus] exe_op1_i,
    input wire[`YSYX210574_RegBus] exe_op2_i,
    input wire[`YSYX210574_RegBus] op1_jump_i,
    input wire[`YSYX210574_RegBus] op2_jump_i,
    input wire[`YSYX210574_InstAddrBus] ex_pc_i,
    output [`YSYX210574_InstAddrBus] ex_pc_o,

    input wire[`YSYX210574_InstAddrBus]        int_addr_i,                        
    output reg[3:0]                 int_state_o,
    input wire                      ex_csr_we_i, 
    input wire[`YSYX210574_RegBus]             ex_csr_rdata_i,
    input wire[11:0]  		    ex_csr_waddr_i,

    output wire                     ex_csr_we_o,                        
    output wire[11:0]   		    ex_csr_waddr_o,
    output reg[`YSYX210574_RegBus]            ex_csr_wdata_o,

    
    output reg[`YSYX210574_RegBus] mem_wdata_o,        
    output reg[`YSYX210574_InstAddrBus] mem_raddr_o,    
    output reg[`YSYX210574_InstAddrBus] mem_waddr_o,    
    output wire mem_we_o,                   
    output wire mem_req_o,                  
	output wire[`YSYX210574_RegBus] reg2_rdata_o,  
    output wire[`YSYX210574_RegBus] reg_wdata_o,       
    output wire reg_we_o,                   
    output wire[`YSYX210574_RegAddrBus] reg_waddr_o, 
    output reg exe_delete,
	
	
	output wire[6:0] opcode,
    output wire[2:0] funct3,

	           
    output wire jump_flag_o,                
    output wire[`YSYX210574_InstAddrBus] jump_addr_o   
    );

localparam S_INT_IDLE            = 4'b0001;
localparam S_INT_SYNC_ASSERT     = 4'b0010;      
localparam S_INT_ASYNC_ASSERT    = 4'b0100;      
localparam S_INT_MRET            = 4'b1000;      

    wire[31:0] srw_32shift;             
    wire[31:0] sraiw_32shift_mask;
    wire[31:0] sraiw_32shift;
    wire[31:0] sraiw_shift;

    wire[31:0]sraw_32shift; 
    wire[31:0]sraw_32shift_mask; 
    wire[31:0]sraw_shift; 

    wire[63:0] sr_shift;
    wire[63:0] sri_shift;
    wire[63:0] sll_shift;
    wire[63:0] sriw_shift;
    wire[31:0] sllw_shift;
    wire[63:0] srlw_shift;
    
    wire[63:0] sr_shift_mask;
    wire[63:0] sri_shift_mask;
    wire[63:0] op1_add_op2_res;
    wire[63:0] op1_sub_op2_res;
    wire[63:0] op1_jump_add_op2_jump_res;
    wire op1_ge_op2_signed;
    wire op1_ge_op2_unsigned;
    wire op1_eq_op2;
    
    

   
    wire[4:0] uimm;
    reg[`YSYX210574_RegBus] reg_wdata;
    reg reg_we;
    reg[`YSYX210574_RegAddrBus] reg_waddr;
    reg jump_flag;
    reg[`YSYX210574_InstAddrBus] jump_addr;
    reg mem_we;
    reg mem_req;
    wire exe_skip_o;
    wire[`YSYX210574_RegBus] op1_i;
    wire[`YSYX210574_RegBus] op2_i;
    wire[`YSYX210574_RegBus]xreg1_rdata_i;
    wire[`YSYX210574_RegBus]JALR_op1_jump;
    assign ex_fetched_o = ex_fetched_i;
assign exe_skip_o=(int_state_o == S_INT_ASYNC_ASSERT)?1'b1:1'b0;
 always @ (*) begin
            if (exe_clint_time_stop_i & exe_mie_i[7] & exe_mip_i[7] & exe_mstatus_i[3] & ~(ex_pc_i ==32'h0) & exe_mem_done == 1'b1)  begin
                int_state_o = S_INT_ASYNC_ASSERT;           
            end else if ((ex_inst_i == `YSYX210574_INST_ECALL || ex_inst_i == `YSYX210574_INST_EBREAK) &  exe_mstatus_i[3] == 1'b1)begin
                int_state_o = S_INT_SYNC_ASSERT;
            end else if (ex_inst_i == `YSYX210574_INST_MRET) begin
                int_state_o = S_INT_MRET;
            end else begin
                int_state_o = S_INT_IDLE;
            end
        end



    
    assign ex_csr_waddr_o = ex_csr_waddr_i;
    assign ex_csr_we_o = ex_csr_we_i;
    assign xreg1_rdata_i =(exe_stall1_i == 1'b1)?memm2_reg_wdata_i:reg1_rdata_i;
    assign op1_i =(exe_stall1_i == 1'b1)?memm2_reg_wdata_i:exe_op1_i;
    assign op2_i =(exe_stall2_i == 1'b1)?memm2_reg_wdata_i:exe_op2_i;
    assign reg2_rdata_o =(exe_stall2_i == 1'b1)?memm2_reg_wdata_i:reg2_rdata_i;
    assign JALR_op1_jump =(exe_stall1_i == 1'b1)?memm2_reg_wdata_i:op1_jump_i;

    
    assign ex_pc_o = ex_pc_i;

    assign opcode = ex_inst_i[6:0];
    assign funct3 = ex_inst_i[14:12];
    
    assign uimm = ex_inst_i[19:15];

    assign srw_32shift = op1_i[31:0];   
    assign sraiw_32shift = srw_32shift >> ex_inst_i[24:20] ;
    assign sraiw_32shift_mask = 32'hffff_ffff >> ex_inst_i[24:20];
    assign sraiw_shift = (sraiw_32shift & sraiw_32shift_mask) | ({32{srw_32shift[31]}} & (~sraiw_32shift_mask));

    
    
    
    
    

    assign sraw_32shift = srw_32shift >> op2_i[4:0];
    assign sraw_32shift_mask = 32'hffff_ffff >> op2_i[4:0];
    assign sraw_shift = (sraw_32shift & sraw_32shift_mask) | ({32{srw_32shift[31]}} & (~sraw_32shift_mask));



    assign sr_shift = op1_i >> op2_i[5:0];
    assign sri_shift = op1_i >> ex_inst_i[25:20];
    assign sr_shift_mask = 64'hffffffffffffffff >> op2_i[5:0];
    assign sri_shift_mask = 64'hffffffffffffffff >> ex_inst_i[25:20];
	assign sll_shift = op1_i << ex_inst_i[24:20];
    assign sriw_shift = (op1_i & 64'h0000_0000_ffff_ffff) >> ex_inst_i[24:20];
    
    assign sllw_shift = srw_32shift << op2_i[4:0];
    assign srlw_shift = (op1_i & 64'h0000_0000_ffff_ffff) >> op2_i[4:0];

    assign op1_sub_op2_res = op1_i - op2_i;
    assign op1_add_op2_res = op1_i + op2_i;
    assign op1_jump_add_op2_jump_res = op1_jump_i + op2_jump_i;

    
    assign op1_ge_op2_signed = $signed(op1_i) >= $signed(op2_i);
    
    assign op1_ge_op2_unsigned = op1_i >= op2_i;
    assign op1_eq_op2 = (op1_i == op2_i);
 

    assign reg_wdata_o = reg_wdata;
    assign reg_we_o = (rst == 1'b1)? 1'b0:(exe_skip_o == 1'b1)?1'b0:reg_we;
    assign reg_waddr_o = reg_waddr;

    assign mem_we_o = (rst == 1'b1)? 1'b0:(exe_skip_o == 1'b1)?1'b0:mem_we;
    assign mem_req_o = (rst == 1'b1)? `YSYX210574_RIB_NREQ:(exe_skip_o == 1'b1)?1'b0:mem_req;


    assign jump_flag_o = jump_flag || ((int_state_o == S_INT_IDLE)?1'b0:(int_state_o == S_INT_ASYNC_ASSERT)?1'b1:
    (int_state_o == S_INT_SYNC_ASSERT)?1'b1:(int_state_o == S_INT_MRET)?1'b1:1'b0);

    assign jump_addr_o = (rst == 1'b1)?`YSYX210574_ADDRZeroWord: (int_state_o == S_INT_ASYNC_ASSERT)?int_addr_i:((int_state_o == S_INT_IDLE)?jump_addr:
    (int_state_o == S_INT_SYNC_ASSERT)?int_addr_i:(int_state_o == S_INT_MRET)?int_addr_i:jump_addr);

   
    always @ (*) begin
            ex_csr_wdata_o = 64'h0;
            jump_flag = `YSYX210574_JumpDisable;  
            jump_addr = `YSYX210574_ADDRZeroWord;
            mem_wdata_o = `YSYX210574_ZeroWord;
            mem_raddr_o = `YSYX210574_ADDRZeroWord;
            mem_waddr_o = `YSYX210574_ADDRZeroWord;
            mem_we = 1'b0;
            reg_wdata = 64'h0;
            reg_we = reg_we_i;
            reg_waddr = reg_waddr_i;
            mem_req = `YSYX210574_RIB_NREQ;
            exe_delete = 1'b0;
        case (opcode)
            `YSYX210574_INST_TYPE_I: begin
                case (funct3)
                    `YSYX210574_INST_ADDI: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = op1_add_op2_res;
                    end
                    `YSYX210574_INST_SLTI: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = {64{(~op1_ge_op2_signed)}} & 64'h1;
                    end
                    `YSYX210574_INST_SLTIU: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = {64{(~op1_ge_op2_unsigned)}} & 64'h1;
                    end
                    `YSYX210574_INST_XORI: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = op1_i ^ op2_i;
                    end
                    `YSYX210574_INST_ORI: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = op1_i | op2_i;
                    end
                    `YSYX210574_INST_ANDI: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = op1_i & op2_i;
                    end
                    `YSYX210574_INST_SLLI: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = op1_i << ex_inst_i[25:20];
                    end
                    `YSYX210574_INST_SRI: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        if (ex_inst_i[30] == 1'b1) begin
                            reg_wdata = (sri_shift & sri_shift_mask) | ({64{op1_i[31]}} & (~sri_shift_mask));
                        end else begin
                            reg_wdata = op1_i >> ex_inst_i[25:20];
                        end
                    end
                    default: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                    end
                endcase
            end
            `YSYX210574_INST_TYPE_IW: begin
                case (funct3)
                    `YSYX210574_INST_ADDIW: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = (op1_add_op2_res & 64'h0000_0000_ffff_ffff) | ({{32{op1_add_op2_res[31]}},32'b0});
                    end                                     
                    `YSYX210574_INST_SLLIW: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = (sll_shift & 64'h0000_0000_ffff_ffff) | ({{32{sll_shift[31]}},32'b0});
                    end
                    `YSYX210574_INST_SRIW: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        if (ex_inst_i[30] == 1'b1) begin
                            reg_wdata = {{32{sraiw_shift[31]}},sraiw_shift};  
                        end else begin
                            reg_wdata = (sriw_shift ) | ({{32{sriw_shift[31]}},32'b0});
                        end
                    end
                    default: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                    end
                endcase
            end
            `YSYX210574_INST_TYPE_R_M: begin
                    case (funct3)
                        `YSYX210574_INST_ADD_SUB: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            if (ex_inst_i[30] == 1'b0) begin
                                reg_wdata = op1_add_op2_res;
                            end else begin
                                reg_wdata = op1_i - op2_i;
                            end
                        end
                        `YSYX210574_INST_SLL: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            reg_wdata = op1_i << op2_i[5:0];
                        end
                        `YSYX210574_INST_SLT: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            reg_wdata = {64{(~op1_ge_op2_signed)}} & 64'h1;
                        end
                        `YSYX210574_INST_SLTU: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            reg_wdata = {64{(~op1_ge_op2_unsigned)}} & 64'h1;
                        end
                        `YSYX210574_INST_XOR: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            reg_wdata = op1_i ^ op2_i;
                        end
                        `YSYX210574_INST_SR: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            if (ex_inst_i[30] == 1'b1) begin
                                reg_wdata = (sr_shift & sr_shift_mask) | ({64{op1_i[31]}} & (~sr_shift_mask));
                            end else begin
                                reg_wdata = op1_i >> op2_i[5:0];
                            end
                        end
                        `YSYX210574_INST_OR: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            reg_wdata = op1_i | op2_i;
                        end
                        `YSYX210574_INST_AND: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            reg_wdata = op1_i & op2_i;
                        end
                        default: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            reg_wdata = `YSYX210574_ZeroWord;
                        end
                    endcase
				end
            `YSYX210574_INST_TYPE_RW: begin
                    case (funct3)
                        `YSYX210574_INST_ADD_SUBW: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            if (ex_inst_i[30] == 1'b0) begin
                                reg_wdata = ((op1_add_op2_res) & 64'h0000_0000_ffff_ffff) | ({{32{op1_add_op2_res[31]}},32'b0});
                            end else begin
                                reg_wdata = ((op1_sub_op2_res) & 64'h0000_0000_ffff_ffff) | ({{32{op1_sub_op2_res[31]}},32'b0});
                            end
                        end
                        `YSYX210574_INST_SLLW: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            reg_wdata ={{32{sllw_shift[31]}},sllw_shift}; 
                        end
                        `YSYX210574_INST_SRW: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            if (ex_inst_i[30] == 1'b1) begin
                                reg_wdata = {{32{sraw_shift[31]}},sraw_shift};
                            end else begin
                                reg_wdata = srlw_shift | ({{32{srlw_shift[31]}},32'b0});
                            end 
                        end
                        default: begin
                            jump_flag = `YSYX210574_JumpDisable;
                            
                            jump_addr = `YSYX210574_ADDRZeroWord;
                            mem_wdata_o = `YSYX210574_ZeroWord;
                            mem_raddr_o = `YSYX210574_ADDRZeroWord;
                            mem_waddr_o = `YSYX210574_ADDRZeroWord;
                            mem_we = `YSYX210574_WriteDisable;
                            reg_wdata = `YSYX210574_ZeroWord;
                        end
                    endcase
				end
            `YSYX210574_INST_TYPE_L: begin
                case (funct3)
                    `YSYX210574_INST_LB: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        mem_req = `YSYX210574_RIB_REQ;
                        mem_raddr_o = op1_add_op2_res[31:0];
                        reg_wdata = `YSYX210574_ZeroWord;
                    end
                    `YSYX210574_INST_LH: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        mem_req = `YSYX210574_RIB_REQ;
                        mem_raddr_o = op1_add_op2_res[31:0];
                        reg_wdata = `YSYX210574_ZeroWord;
                        end
                    `YSYX210574_INST_LW: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        mem_req = `YSYX210574_RIB_REQ;
                        mem_raddr_o = op1_add_op2_res[31:0];
                       reg_wdata = `YSYX210574_ZeroWord;
                    end
                    `YSYX210574_INST_LBU: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        mem_req = `YSYX210574_RIB_REQ;
                        mem_raddr_o = op1_add_op2_res[31:0];
                        reg_wdata = `YSYX210574_ZeroWord;
                    end
                    `YSYX210574_INST_LHU: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        mem_req = `YSYX210574_RIB_REQ;
                        mem_raddr_o = op1_add_op2_res[31:0];
                        reg_wdata = `YSYX210574_ZeroWord;
                        end
                     `YSYX210574_INST_LWU: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        mem_req = `YSYX210574_RIB_REQ;
                        mem_raddr_o = op1_add_op2_res[31:0];
                        reg_wdata = `YSYX210574_ZeroWord;
                        end
                     `YSYX210574_INST_LD: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        mem_req = `YSYX210574_RIB_REQ;
                        mem_raddr_o = op1_add_op2_res[31:0];
                        reg_wdata = `YSYX210574_ZeroWord;
                        end 
                    default: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                    end
                endcase
            end
            `YSYX210574_INST_TYPE_S: begin
                case (funct3)
                    `YSYX210574_INST_SB: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        reg_wdata = `YSYX210574_ZeroWord;
                        mem_we = `YSYX210574_WriteEnable;
                        mem_req = `YSYX210574_RIB_NREQ;
                        mem_waddr_o = op1_i[31:0] + exe_op2_i[31:0];
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        
                    end
                    `YSYX210574_INST_SH: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        reg_wdata = `YSYX210574_ZeroWord;
                        mem_we = `YSYX210574_WriteEnable;
                        mem_req = `YSYX210574_RIB_NREQ;
                        mem_waddr_o = op1_i[31:0] + exe_op2_i[31:0];
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        
                    end
                    `YSYX210574_INST_SD: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        reg_wdata = `YSYX210574_ZeroWord;
                        mem_we = `YSYX210574_WriteEnable;
                        mem_req = `YSYX210574_RIB_NREQ;
                        mem_waddr_o = op1_i[31:0] + exe_op2_i[31:0];
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                      
                    end
                    `YSYX210574_INST_SW: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        reg_wdata = `YSYX210574_ZeroWord;
                        mem_we = `YSYX210574_WriteEnable;
                        mem_req = `YSYX210574_RIB_NREQ;
                        mem_waddr_o =op1_i[31:0] + exe_op2_i[31:0];
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                      
                    end
                    
                    default: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                    end
                endcase
            end
            `YSYX210574_INST_TYPE_B: begin
                case (funct3)
                    `YSYX210574_INST_BEQ: begin
                        
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                        jump_flag = op1_eq_op2 & `YSYX210574_JumpEnable;
                        jump_addr = {32{op1_eq_op2}} & op1_jump_add_op2_jump_res[31:0];
                    end
                    `YSYX210574_INST_BNE: begin
                        
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                        jump_flag = (~op1_eq_op2) & `YSYX210574_JumpEnable;
                        jump_addr = {32{(~op1_eq_op2)}} & op1_jump_add_op2_jump_res[31:0];
                    end
                    `YSYX210574_INST_BLT: begin
                        
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                        jump_flag = (~op1_ge_op2_signed) & `YSYX210574_JumpEnable;
                        jump_addr = {32{(~op1_ge_op2_signed)}} & op1_jump_add_op2_jump_res[31:0];
                    end
                    `YSYX210574_INST_BGE: begin
                        
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                        jump_flag = (op1_ge_op2_signed) & `YSYX210574_JumpEnable;
                        jump_addr = {32{(op1_ge_op2_signed)}} & op1_jump_add_op2_jump_res[31:0];
                    end
                    `YSYX210574_INST_BLTU: begin
                        
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                        jump_flag = (~op1_ge_op2_unsigned) & `YSYX210574_JumpEnable;
                        jump_addr = {32{(~op1_ge_op2_unsigned)}} & op1_jump_add_op2_jump_res[31:0];
                    end
                    `YSYX210574_INST_BGEU: begin
                        
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                        jump_flag = (op1_ge_op2_unsigned) & `YSYX210574_JumpEnable;
                        jump_addr = {32{(op1_ge_op2_unsigned)}} & op1_jump_add_op2_jump_res[31:0];
                    end
                    default: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                    end
                endcase
            end
            `YSYX210574_INST_JAL: begin
                
                mem_wdata_o = `YSYX210574_ZeroWord;
                mem_raddr_o = `YSYX210574_ADDRZeroWord;
                mem_waddr_o = `YSYX210574_ADDRZeroWord;
                mem_we = `YSYX210574_WriteDisable;
                jump_flag = `YSYX210574_JumpEnable;
                jump_addr = op1_jump_add_op2_jump_res[31:0];
                reg_wdata = exe_op1_i + exe_op2_i;
            end
            `YSYX210574_INST_JALR: begin
                
                mem_wdata_o = `YSYX210574_ZeroWord;
                mem_raddr_o = `YSYX210574_ADDRZeroWord;
                mem_waddr_o = `YSYX210574_ADDRZeroWord;
                mem_we = `YSYX210574_WriteDisable;
                jump_flag = `YSYX210574_JumpEnable;
                jump_addr = JALR_op1_jump[31:0] + op2_jump_i[31:0];
                reg_wdata = exe_op1_i + exe_op2_i;
            end
            
            `YSYX210574_INST_LUI: begin
                
                mem_wdata_o = `YSYX210574_ZeroWord;
                mem_raddr_o = `YSYX210574_ADDRZeroWord;
                mem_waddr_o = `YSYX210574_ADDRZeroWord;
                mem_we = `YSYX210574_WriteDisable;
                jump_addr = `YSYX210574_ADDRZeroWord;
                jump_flag = `YSYX210574_JumpDisable;
                reg_wdata =  (op1_i << 12);
            end
			`YSYX210574_INST_AUIPC: begin
                
                mem_wdata_o = `YSYX210574_ZeroWord;
                mem_raddr_o = `YSYX210574_ADDRZeroWord;
                mem_waddr_o = `YSYX210574_ADDRZeroWord;
                mem_we = `YSYX210574_WriteDisable;
                jump_addr = `YSYX210574_ADDRZeroWord;
                jump_flag = `YSYX210574_JumpDisable;
                reg_wdata = (op1_i << 12) + op2_i;
            end
            `YSYX210574_INST_NOP_OP: begin
                jump_flag = `YSYX210574_JumpDisable;
                
                jump_addr = `YSYX210574_ADDRZeroWord;
                mem_wdata_o = `YSYX210574_ZeroWord;
                mem_raddr_o = `YSYX210574_ADDRZeroWord;
                mem_waddr_o = `YSYX210574_ADDRZeroWord;
                mem_we = `YSYX210574_WriteDisable;
                reg_wdata = `YSYX210574_ZeroWord;
            end
            `YSYX210574_INST_FENCE: begin
                 case (funct3)
                    3'b001:begin
                    mem_wdata_o = `YSYX210574_ZeroWord;
                    mem_raddr_o = `YSYX210574_ADDRZeroWord;
                    mem_waddr_o = `YSYX210574_ADDRZeroWord;
                    mem_we = `YSYX210574_WriteDisable;
                    reg_wdata = `YSYX210574_ZeroWord;
                    jump_flag = `YSYX210574_JumpDisable;
                    jump_addr = 32'h0;
                    exe_delete = 1'b1;
                    end
                     default: begin
                    mem_wdata_o = `YSYX210574_ZeroWord;
                    mem_raddr_o = `YSYX210574_ADDRZeroWord;
                    mem_waddr_o = `YSYX210574_ADDRZeroWord;
                    mem_we = `YSYX210574_WriteDisable;
                    reg_wdata = `YSYX210574_ZeroWord;
                    jump_flag = `YSYX210574_JumpDisable;
                    jump_addr = 32'h0;
                    exe_delete = 1'b0;
                    end
                    endcase
            end

             `YSYX210574_INST_CSR: begin
                jump_flag = `YSYX210574_JumpDisable;
                
                jump_addr = `YSYX210574_ADDRZeroWord;
                mem_wdata_o = `YSYX210574_ZeroWord;
                mem_raddr_o = `YSYX210574_ADDRZeroWord;
                mem_waddr_o = `YSYX210574_ADDRZeroWord;
                mem_we = `YSYX210574_WriteDisable;
                case (funct3)
                    `YSYX210574_INST_CSRRW: begin
                        ex_csr_wdata_o = xreg1_rdata_i;
                        reg_wdata = ex_csr_rdata_i;
                    end
                    `YSYX210574_INST_CSRRS: begin
                        ex_csr_wdata_o = xreg1_rdata_i | ex_csr_rdata_i;
                        reg_wdata = ex_csr_rdata_i;
                    end
                    `YSYX210574_INST_CSRRC: begin
                        ex_csr_wdata_o = ex_csr_rdata_i & (~xreg1_rdata_i);
                        reg_wdata = ex_csr_rdata_i;
                    end
                    `YSYX210574_INST_CSRRWI: begin
                        ex_csr_wdata_o = {59'h0, uimm};
                        reg_wdata = ex_csr_rdata_i;
                    end
                    `YSYX210574_INST_CSRRSI: begin
                        ex_csr_wdata_o = {59'h0, uimm} | ex_csr_rdata_i;
                        reg_wdata = ex_csr_rdata_i;
                    end
                    `YSYX210574_INST_CSRRCI: begin
                        ex_csr_wdata_o = (~{59'h0, uimm}) & ex_csr_rdata_i;
                        reg_wdata = ex_csr_rdata_i;
                    end
                    default: begin
                        jump_flag = `YSYX210574_JumpDisable;
                        
                        jump_addr = `YSYX210574_ADDRZeroWord;
                        mem_wdata_o = `YSYX210574_ZeroWord;
                        mem_raddr_o = `YSYX210574_ADDRZeroWord;
                        mem_waddr_o = `YSYX210574_ADDRZeroWord;
                        mem_we = `YSYX210574_WriteDisable;
                        reg_wdata = `YSYX210574_ZeroWord;
                    end
                endcase
            end
            default: begin
                jump_flag = `YSYX210574_JumpDisable;
                
                jump_addr = `YSYX210574_ADDRZeroWord;
                mem_wdata_o = `YSYX210574_ZeroWord;
                mem_raddr_o = `YSYX210574_ADDRZeroWord;
                mem_waddr_o = `YSYX210574_ADDRZeroWord;
                mem_we = `YSYX210574_WriteDisable;
                reg_wdata = `YSYX210574_ZeroWord;
            end
        endcase
        
    end

endmodule




module ysyx_210574_exemem_reg(

    input wire rst,
	input wire clk,
	input wire            flush,
    input wire  ex_fetched,
	output reg  mem_fetched,

	input wire[6:0] ex_opcode,
    input wire[2:0] ex_funct3,
	input wire[`YSYX210574_RegBus] ex_reg2_rdata,
	
    input wire[`YSYX210574_RegBus] 	ex_reg_wdata,     
    input wire 				ex_reg_we,                 
	input wire[`YSYX210574_RegAddrBus] ex_reg_waddr,
	
	input wire[`YSYX210574_RegBus]		ex_mem_wdata,    
    input wire[`YSYX210574_InstAddrBus]ex_mem_raddr,
    input wire[`YSYX210574_InstAddrBus]ex_mem_waddr,
    input wire 				ex_mem_we,               
    input wire				ex_mem_req,
	
    output reg[`YSYX210574_RegBus] 	mem_mem_wdata,        
    output reg[`YSYX210574_InstAddrBus]mem_mem_raddr,    
    output reg[`YSYX210574_InstAddrBus]mem_mem_waddr,    
    output reg 			mem_mem_we,                   
    output reg 			mem_mem_req,                  
	output reg[6:0] mem_opcode,
    output reg[2:0] mem_funct3,
	output reg[`YSYX210574_RegBus] mem_reg2_rdata,
    
    output reg[`YSYX210574_RegBus] 	mem_reg_wdata,       
    output reg 				mem_reg_we,                   
    output reg[`YSYX210574_RegAddrBus]mem_reg_waddr   

   

    );

	always @(posedge clk)begin
		if(rst == 1'b1)begin
            mem_fetched	   <= 1'b0;
			mem_reg2_rdata <= 64'h0;
			mem_reg_wdata  <= 64'h0;
			mem_reg_we     <= 1'b0;
			mem_reg_waddr  <= 5'b0;
		end else if(flush == 1'b1)begin
            mem_fetched	   <= mem_fetched;
			mem_reg2_rdata <= mem_reg2_rdata;
			mem_reg_wdata  <= mem_reg_wdata ;
			mem_reg_we     <= mem_reg_we    ;
			mem_reg_waddr  <= mem_reg_waddr ;
		end else begin
            mem_fetched	   <= ex_fetched;
			mem_reg2_rdata <= ex_reg2_rdata;
			mem_reg_wdata  <= ex_reg_wdata;  
			mem_reg_we     <= ex_reg_we;  
			mem_reg_waddr  <= ex_reg_waddr; 
			end
		end
	always @(posedge clk)begin
		if(rst == 1'b1)begin
			mem_opcode 			  <= 7'b0;
			mem_funct3  		  <= 3'b0;
		end else if(flush == 1'b1)begin
			mem_opcode 			  <=mem_opcode;
			mem_funct3  		  <=mem_funct3;
		end else begin
			mem_opcode 			  <= ex_opcode; 			
			mem_funct3  		  <= ex_funct3;  		
			end
		end
	always @(posedge clk)begin
		if(rst == 1'b1)begin
			mem_mem_wdata   <= 64'h0;
			mem_mem_raddr   <= 32'h0;
			mem_mem_waddr   <= 32'h0;
			mem_mem_we      <= 1'b0;
			mem_mem_req     <= 1'b0;
		end else if(flush == 1'b1)begin
			mem_mem_wdata   <= mem_mem_wdata;
			mem_mem_raddr   <= mem_mem_raddr;
			mem_mem_waddr   <= mem_mem_waddr;
			mem_mem_we      <= mem_mem_we;   
			mem_mem_req     <= mem_mem_req;  			
		end else begin
			mem_mem_wdata   <= ex_mem_wdata;
            mem_mem_raddr   <= ex_mem_raddr;
            mem_mem_waddr   <= ex_mem_waddr;
            mem_mem_we      <= ex_mem_we;  
            mem_mem_req     <= ex_mem_req;
			end
		end
endmodule

 module ysyx_210574_mem_stage(

    input wire rst,
	input wire  mem_fetched_i,
	output wire mem_done,

    output reg [63:0] 	 	 mem_wmask,
    input wire[63:0] 			 mem_reg_wdata_i,     
    input wire 		     		 mem_reg_we_i,                 
	input wire[`YSYX210574_RegAddrBus]   	 mem_reg_waddr_i, 
	
	input wire[63:0]   	 mem_reg2_rdata_i,

	input wire[6:0]      mem_opcode_i,
    input wire[2:0]      mem_funct3_i,
	
	input wire[63:0]  	 	 mem_mem_wdata_i,    
    input wire[`YSYX210574_InstAddrBus]    	 mem_mem_raddr_i,
    input wire[`YSYX210574_InstAddrBus] 	 	 mem_mem_waddr_i,
    input wire 				 mem_mem_we_i,               
    input wire				 mem_mem_req_i,

	
	
    output reg[63:0]  	 axi_mem_wdata_o,            
    output reg[`YSYX210574_InstAddrBus]   	 axi_mem_ADDR_o,    		
	input wire[63:0]  	 axi_mem_rdata_i,           
	output                mem_valid_o,
	input                 mem_ready_i,
	output wire [7:0] 		 mem_size_o,
    input  wire [1:0] 		 mem_resp_i,
	output wire 		 axi_req_o,
	

	output reg 		 axi_still,

	
    output reg[63:0]  	 	mem_reg_wdata_o,       
    output  		 		mem_reg_we_o,          
    output reg[`YSYX210574_RegAddrBus] mem_reg_waddr_o   

    );


	reg		 mem_reg_we_o_o;
	reg[63:0] 		 mem_mem_wdata_o;
    wire[31:0]   	 mem_mem_ADDR_o;
    wire[2:0]      mem_mem_raddr_index_i;
    wire[2:0]      mem_mem_waddr_index_i;
    reg[63:0]     mem_mem_rdata_i;
	wire[7:0]mem_wmask_short;
	wire   hs_done    = mem_valid_o & mem_ready_i;
    assign axi_req_o = (mem_mem_we_i ==1'b1)?`YSYX210574_REQ_WRITE:`YSYX210574_REQ_READ;
	assign mem_done = ((mem_ready_i | ~(mem_mem_we_i | mem_mem_req_i)) & mem_fetched_i );
	assign mem_reg_we_o = (mem_done == 1'b1)?mem_reg_we_o_o:1'b0;
	assign mem_size_o =  mem_wmask_short;
	
	assign mem_mem_raddr_index_i = mem_mem_raddr_i[2:0];
	assign mem_mem_waddr_index_i = mem_mem_waddr_i[2:0];
	assign mem_valid_o  = mem_mem_we_i | mem_mem_req_i;
	assign mem_mem_ADDR_o =(rst ==1'b1)?32'h0:(mem_mem_raddr_i |  mem_mem_waddr_i);

    //always @(*) begin 
    //    if (mem_valid_o == 1'b1)
    //       $display("=mytest====mem_mem_we_i%x====mem_mem_req_i%x====mem_mem_ADDR_o%x===axi_mem_wdata_o%x===axi_mem_rdata_i%x===\n",
    //       mem_mem_we_i,mem_mem_req_i, axi_mem_ADDR_o,axi_mem_wdata_o, axi_mem_rdata_i);
    //
    //end


	always @ (*)begin
		 if(mem_ready_i == 1'b1 )begin
			
			axi_mem_wdata_o = mem_mem_wdata_o;	
			axi_mem_ADDR_o = mem_mem_ADDR_o;
			

		end else begin

			axi_mem_wdata_o = mem_mem_wdata_o;	
			axi_mem_ADDR_o = mem_mem_ADDR_o;
			

			
		
		
		
		
		end		
	end
	always @ (*)begin
		if(mem_ready_i == 1'b1 )begin
			mem_mem_rdata_i = axi_mem_rdata_i;
		end else begin	
			mem_mem_rdata_i = 64'h0;	
		end		
	end

	always @ (*)begin
		if(hs_done == 1'b1 )begin
			axi_still = 1'b0;		
		end else begin
			axi_still = mem_mem_we_i | mem_mem_req_i;
			
			
			
		end		
	end

	always @ (*) begin
		    mem_mem_wdata_o = mem_mem_wdata_i;
		    mem_wmask = `YSYX210574_ZeroWord;
		    mem_reg_wdata_o = mem_reg_wdata_i;
	        mem_reg_we_o_o  = mem_reg_we_i;
	        mem_reg_waddr_o = mem_reg_waddr_i;	
		case ( mem_opcode_i)
			`YSYX210574_INST_TYPE_L: begin
					case ( mem_funct3_i)
						`YSYX210574_INST_LB: begin
							case ( mem_mem_raddr_index_i)
								3'b000: begin
									 mem_reg_wdata_o = {{56{ mem_mem_rdata_i[7]}},  mem_mem_rdata_i[7:0]};
								end
								3'b001: begin
									 mem_reg_wdata_o = {{56{ mem_mem_rdata_i[15]}},  mem_mem_rdata_i[15:8]};
								end
								3'b010: begin
									 mem_reg_wdata_o = {{56{ mem_mem_rdata_i[23]}},  mem_mem_rdata_i[23:16]};
								end
								3'b011: begin
									 mem_reg_wdata_o = {{56{ mem_mem_rdata_i[31]}},  mem_mem_rdata_i[31:24]};
								end
								3'b100: begin
									 mem_reg_wdata_o = {{56{ mem_mem_rdata_i[39]}},  mem_mem_rdata_i[39:32]};
								end
								3'b101: begin
									 mem_reg_wdata_o = {{56{ mem_mem_rdata_i[47]}},  mem_mem_rdata_i[47:40]};
								end
								3'b110: begin
									 mem_reg_wdata_o = {{56{ mem_mem_rdata_i[55]}},  mem_mem_rdata_i[55:48]};
								end										
								3'b111: begin
									mem_reg_wdata_o = {{56{ mem_mem_rdata_i[63]}},  mem_mem_rdata_i[63:56]};
								end
								 default: begin
							    	mem_reg_wdata_o = `YSYX210574_ZeroWord;
							    end
							endcase
						end
						`YSYX210574_INST_LH: begin
							case ( mem_mem_raddr_index_i[2:1])
							    2'b00: begin
							    	 mem_reg_wdata_o = {{48{ mem_mem_rdata_i[15]}},  mem_mem_rdata_i[15:0]};
							    end
							    2'b01: begin
							    	 mem_reg_wdata_o = {{48{ mem_mem_rdata_i[31]}},  mem_mem_rdata_i[31:16]};
							    end
							    2'b10: begin
							    	 mem_reg_wdata_o = {{48{ mem_mem_rdata_i[47]}},  mem_mem_rdata_i[47:32]};
							    end
							    2'b11: begin
							    	 mem_reg_wdata_o = {{48{ mem_mem_rdata_i[63]}},  mem_mem_rdata_i[63:48]};
							    end
								default: begin
							    	mem_reg_wdata_o = `YSYX210574_ZeroWord;
							    end
							endcase
						end
						`YSYX210574_INST_LW: begin
							   case ( mem_mem_raddr_index_i[2])
							    1'b0: begin
							    	 mem_reg_wdata_o = {{32{ mem_mem_rdata_i[31]}},  mem_mem_rdata_i[31:0]};
							    end
							    1'b1: begin
							    	 mem_reg_wdata_o = {{32{ mem_mem_rdata_i[63]}},  mem_mem_rdata_i[63:32]};
							    end	
								default: begin
							    	mem_reg_wdata_o = `YSYX210574_ZeroWord;
							    end													    						   
							endcase
						end
						`YSYX210574_INST_LBU: begin
							case ( mem_mem_raddr_index_i)
								3'b000: begin
									 mem_reg_wdata_o = {56'h0, mem_mem_rdata_i[7:0]};
								end
								3'b001: begin
									 mem_reg_wdata_o = {56'h0,  mem_mem_rdata_i[15:8]};
								end
								3'b010: begin
									 mem_reg_wdata_o = {56'h0,  mem_mem_rdata_i[23:16]};
								end
								3'b011: begin
									 mem_reg_wdata_o = {56'h0,  mem_mem_rdata_i[31:24]};
								end
								3'b100: begin
									 mem_reg_wdata_o = {56'h0,  mem_mem_rdata_i[39:32]};
								end
								3'b101: begin
									 mem_reg_wdata_o = {56'h0,  mem_mem_rdata_i[47:40]};
								end
								3'b110: begin
									 mem_reg_wdata_o = {56'h0,  mem_mem_rdata_i[55:48]};
								end						
								3'b111: begin
									mem_reg_wdata_o = {56'h0, mem_mem_rdata_i[63:56]};
								end
								 default: begin
							    	mem_reg_wdata_o = `YSYX210574_ZeroWord;
							    end
							endcase
						end
						`YSYX210574_INST_LHU: begin
							case ( mem_mem_raddr_index_i[2:1])
							    2'b00: begin
							    	 mem_reg_wdata_o = {48'h0,  mem_mem_rdata_i[15:0]};
							    end
							    2'b01: begin
							    	 mem_reg_wdata_o = {48'h0,  mem_mem_rdata_i[31:16]};
							    end
							    2'b10: begin
							    	 mem_reg_wdata_o = {48'h0,  mem_mem_rdata_i[47:32]};
							    end
							    2'b11: begin
							    	 mem_reg_wdata_o = {48'h0,  mem_mem_rdata_i[63:48]};
							    end
								default: begin
							    	mem_reg_wdata_o = `YSYX210574_ZeroWord;
							    end
							endcase
						end
						`YSYX210574_INST_LWU: begin
							   case ( mem_mem_raddr_index_i[2])
							    1'b0: begin
							    	 mem_reg_wdata_o = {32'h0,  mem_mem_rdata_i[31:0]};
							    end
							    1'b1: begin
							    	 mem_reg_wdata_o = {32'h0,  mem_mem_rdata_i[63:32]};
							    end	
								default: begin
							    	mem_reg_wdata_o = `YSYX210574_ZeroWord;
							    end													    						   
							endcase
						end
						`YSYX210574_INST_LD: begin
							    	mem_reg_wdata_o = mem_mem_rdata_i;
							    end													    						   
						default: begin
							 mem_reg_wdata_o = `YSYX210574_ZeroWord;
						end
					endcase
				end
			`YSYX210574_INST_TYPE_S: begin
				case ( mem_funct3_i)
					`YSYX210574_INST_SB: begin
						case ( mem_mem_waddr_index_i)
							3'b000: begin
								 mem_wmask = 64'h0000_0000_0000_00FF;
								 mem_mem_wdata_o = {56'b0,  mem_reg2_rdata_i[7:0]};
							end
							3'b001: begin
								 mem_wmask = 64'h0000_0000_0000_FF00;
								 mem_mem_wdata_o = {48'b0,  mem_reg2_rdata_i[7:0], 8'b0};
							end
							3'b010: begin
								 mem_wmask = 64'h0000_0000_00FF_0000;
								 mem_mem_wdata_o = {40'b0,  mem_reg2_rdata_i[7:0], 16'b0};
							end
							3'b011: begin
								 mem_wmask = 64'h0000_0000_FF00_0000;
								 mem_mem_wdata_o = {32'b0,  mem_reg2_rdata_i[7:0], 24'b0};
							end
							3'b100: begin
								 mem_wmask = 64'h0000_00FF_0000_0000;
								 mem_mem_wdata_o = {24'b0,  mem_reg2_rdata_i[7:0], 32'b0};
							end
							3'b101: begin
								 mem_wmask = 64'h0000_FF00_0000_0000;
								 mem_mem_wdata_o = {16'b0,  mem_reg2_rdata_i[7:0], 40'b0};
							end
							3'b110: begin
								 mem_wmask = 64'h00FF_0000_0000_0000;
								 mem_mem_wdata_o = {8'b0,  mem_reg2_rdata_i[7:0],48'b0};
							end
							3'b111: begin
								 mem_wmask = 64'hFF00_0000_0000_0000;
								 mem_mem_wdata_o = { mem_reg2_rdata_i[7:0], 56'b0};
							end
							default: begin
								 mem_wmask = `YSYX210574_ZeroWord;
								 mem_mem_wdata_o = `YSYX210574_ZeroWord;
							end
						endcase
					end
					`YSYX210574_INST_SH: begin
						case ( mem_mem_waddr_index_i[2:1])
							2'b00: begin
								 mem_wmask = 64'h0000_0000_0000_FFFF;
								 mem_mem_wdata_o = {48'b0,  mem_reg2_rdata_i[15:0]};
							end
							2'b01: begin
								 mem_wmask = 64'h0000_0000_FFFF_0000;
								 mem_mem_wdata_o = {32'b0,  mem_reg2_rdata_i[15:0], 16'b0};
							end
							2'b10: begin
								 mem_wmask = 64'h0000_FFFF_0000_0000;
								 mem_mem_wdata_o = {16'b0,  mem_reg2_rdata_i[15:0], 32'b0};
							end
							2'b11: begin
								 mem_wmask = 64'hFFFF_0000_0000_0000;
								 mem_mem_wdata_o = { mem_reg2_rdata_i[15:0], 48'b0};
							end
							default: begin
								 mem_wmask = `YSYX210574_ZeroWord;
								 mem_mem_wdata_o = `YSYX210574_ZeroWord;
							end
						endcase
					end
					`YSYX210574_INST_SW: begin
						 case ( mem_mem_waddr_index_i[2])
							1'b0: begin
								 mem_wmask = 64'h0000_0000_FFFF_FFFF;
								 mem_mem_wdata_o = {32'b0,  mem_reg2_rdata_i[31:0]};
							end
							1'b1: begin
								 mem_wmask = 64'hFFFF_FFFF_0000_0000;
								 mem_mem_wdata_o = {mem_reg2_rdata_i[31:0], 32'b0};
							end
							default: begin
								 mem_wmask = `YSYX210574_ZeroWord;
								 mem_mem_wdata_o = `YSYX210574_ZeroWord;
							end
						endcase
					end	
					`YSYX210574_INST_SD: begin						
						 	mem_wmask = 64'hFFFF_FFFF_FFFF_FFFF;
						 	mem_mem_wdata_o = mem_reg2_rdata_i;
						   end
				   default: begin
						 mem_wmask = `YSYX210574_ZeroWord;
						 mem_mem_wdata_o = `YSYX210574_ZeroWord;
					end
				endcase
			end			
			default: begin
						mem_reg_wdata_o = mem_reg_wdata_i;
	    				mem_reg_we_o_o 	= mem_reg_we_i;
	    				mem_reg_waddr_o = mem_reg_waddr_i;
						mem_mem_wdata_o = mem_mem_wdata_i;
						mem_wmask = `YSYX210574_ZeroWord;
					end
        endcase

        end
	
	assign mem_wmask_short = {mem_wmask[56], mem_wmask[48], mem_wmask[40],mem_wmask[32], mem_wmask[24], mem_wmask[16], mem_wmask[8], mem_wmask[0]};
endmodule
module ysyx_210574_memwb_reg(

    input wire rst,
	input wire clk,
	

    input wire[63:0] 	mem_reg_wdata,     
    input wire 			mem_reg_we,                 
	input wire[4:0]	 	mem_reg_waddr, 

    
    output reg[63:0] 	wb_reg_wdata,       
    output reg 			wb_reg_we,          
    output reg[4:0]		wb_reg_waddr       

    );

	always @(posedge clk)begin
		if(rst == 1'b1)begin
			wb_reg_wdata  <= 64'b0;
			wb_reg_we     <= 1'b0;
			wb_reg_waddr  <= 5'b0;
		
		
		
		
		
		
		
		
		
		
		
		
		end else begin
			wb_reg_wdata  <= mem_reg_wdata;  
			wb_reg_we     <= mem_reg_we;  
			wb_reg_waddr  <= mem_reg_waddr;
			end
		end
	
	
endmodule

module ysyx_210574_wb_stage(

    input wire rst,
    
    input wire[63:0] 	    wb_reg_wdata_i,     
    input wire 				wb_reg_we_i,                 
	input wire[`YSYX210574_RegAddrBus] wb_reg_waddr_i, 

    
    output wire[63:0]   	wb_reg_wdata_o,       
    output wire 			wb_reg_we_o,          
    output wire[`YSYX210574_RegAddrBus]wb_reg_waddr_o       

    );

assign	wb_reg_wdata_o=(rst == 1'b1)?64'b0:wb_reg_wdata_i;
assign	wb_reg_we_o=(rst == 1'b1)?1'b0:wb_reg_we_i;
assign	wb_reg_waddr_o=(rst == 1'b1)?5'b0:wb_reg_waddr_i;
	
	
endmodule

 module ysyx_210574_regfile(
 
	input  wire clk,
	input  wire rst,
	input  wire  [4  : 0] w_addr,
	input  wire  [`YSYX210574_RegBus]w_data,
	input  wire 		  w_ena,
	
	input  wire  [4  : 0] r_addr1,
	output reg   [`YSYX210574_RegBus]r_data1,
	input  wire 		  r_ena1,

	input  wire  [4  : 0] r_addr2,
	output reg   [`YSYX210574_RegBus]r_data2,
	input  wire 		  r_ena2

    );

    

	reg [`YSYX210574_RegBus] 	regs[0 : 31];
	
	always @(posedge clk) begin
		if ( rst == 1'b1 ) begin
			regs[ 0] <= `YSYX210574_ZERO_WORD;
			regs[ 1] <= `YSYX210574_ZERO_WORD;
			regs[ 2] <= `YSYX210574_ZERO_WORD;
			regs[ 3] <= `YSYX210574_ZERO_WORD;
			regs[ 4] <= `YSYX210574_ZERO_WORD;
			regs[ 5] <= `YSYX210574_ZERO_WORD;
			regs[ 6] <= `YSYX210574_ZERO_WORD;
			regs[ 7] <= `YSYX210574_ZERO_WORD;
			regs[ 8] <= `YSYX210574_ZERO_WORD;
			regs[ 9] <= `YSYX210574_ZERO_WORD;
			regs[10] <= `YSYX210574_ZERO_WORD;
			regs[11] <= `YSYX210574_ZERO_WORD;
			regs[12] <= `YSYX210574_ZERO_WORD;
			regs[13] <= `YSYX210574_ZERO_WORD;
			regs[14] <= `YSYX210574_ZERO_WORD;
			regs[15] <= `YSYX210574_ZERO_WORD;
			regs[16] <= `YSYX210574_ZERO_WORD;
			regs[17] <= `YSYX210574_ZERO_WORD;
			regs[18] <= `YSYX210574_ZERO_WORD;
			regs[19] <= `YSYX210574_ZERO_WORD;
			regs[20] <= `YSYX210574_ZERO_WORD;
			regs[21] <= `YSYX210574_ZERO_WORD;
			regs[22] <= `YSYX210574_ZERO_WORD;
			regs[23] <= `YSYX210574_ZERO_WORD;
			regs[24] <= `YSYX210574_ZERO_WORD;
			regs[25] <= `YSYX210574_ZERO_WORD;
			regs[26] <= `YSYX210574_ZERO_WORD;
			regs[27] <= `YSYX210574_ZERO_WORD;
			regs[28] <= `YSYX210574_ZERO_WORD;
			regs[29] <= `YSYX210574_ZERO_WORD;
			regs[30] <= `YSYX210574_ZERO_WORD;
			regs[31] <= `YSYX210574_ZERO_WORD;
		end
		else begin
			if ((w_ena == 1'b1) && (w_addr != 5'h00))	
				regs[w_addr] <= w_data;
		end

	end


	always @(*) begin
		if (rst == 1'b1)
			r_data1 = `YSYX210574_ZERO_WORD;
		else if ((w_ena == 1'b1 && r_ena1 == 1'b1 && r_addr1 == w_addr ))
			r_data1 = w_data;
		else if (r_ena1 == 1'b1)
			r_data1 = regs[r_addr1];
		else
			r_data1 = `YSYX210574_ZERO_WORD;
	end

	always @(*) begin
		if (rst == 1'b1)
			r_data2 = `YSYX210574_ZERO_WORD;
		else if ((w_ena == 1'b1 && r_ena2 == 1'b1 && r_addr2 == w_addr ))
			r_data2 = w_data;
		else if (r_ena2 == 1'b1)
			r_data2 = regs[r_addr2];
		else
			r_data2 = `YSYX210574_ZERO_WORD;
	end



endmodule




module ysyx_210574_ctrl(

    input wire rst,
    
    input wire              ctrl_stallreg_id1,  
    input wire              ctrl_stallreg_id2,
    input wire              ctrl_axi_still_i,
    output wire             ctrl_stall1,    
    output wire             ctrl_stall2,
    
    output wire             ctrl_axi_still_o,
    
    input wire 				 ctrl_jump_flag_i,
    input wire[`YSYX210574_InstAddrBus] ctrl_jump_addr_i,

    output wire              ctrl_hold_flag_o,
    output wire              ctrl_exe_flag_o,
    
    output wire 			  ctrl_jump_flag_o,
    output wire[`YSYX210574_InstAddrBus] ctrl_jump_addr_o

    );

assign ctrl_axi_still_o =(rst == 1'b1)?1'b0:(ctrl_axi_still_i == 1'b1)?1'b1:1'b0;
assign ctrl_stall1 =(rst == 1'b1)?1'b0:(ctrl_stallreg_id1 == 1'b1)?1'b1:1'b0;
assign ctrl_stall2 =(rst == 1'b1)?1'b0:(ctrl_stallreg_id2 == 1'b1)?1'b1:1'b0;
assign ctrl_hold_flag_o=(rst == 1'b1)?1'b0:(ctrl_axi_still_i == 1'b1)?1'b0:ctrl_jump_flag_i; 
assign ctrl_jump_flag_o=(rst == 1'b1)?1'b0:ctrl_jump_flag_i;
assign ctrl_jump_addr_o=(rst == 1'b1)?32'b0:ctrl_jump_addr_i;   
assign ctrl_exe_flag_o=(rst == 1'b1)?1'b0:(ctrl_axi_still_i == 1'b1)?1'b0:ctrl_jump_flag_i;
endmodule

module ysyx_210574_csr_reg(

    input wire clk,
    input wire rst,

     input wire           csr_clint_time_stop_i,

    
    input wire we_i,                        
    input wire[11:0]  raddr_i,        
    input wire[11:0]  waddr_i,        
    input wire[`YSYX210574_RegBus] data_i,             
    
    input wire[3:0] csr_int_state,
    input wire[`YSYX210574_InstAddrBus] csr_inst_addr_i,

    
    output wire [`YSYX210574_RegBus] csr_mie_o,
    output wire [`YSYX210574_RegBus] csr_mstatus_o,
    output wire [`YSYX210574_RegBus] csr_mip_o,
    output reg[`YSYX210574_RegBus] csr_data_o,              
    output wire [`YSYX210574_InstAddrBus] csr_int_addr_o
    );
    localparam S_INT_IDLE            = 4'b0001;
    localparam S_INT_SYNC_ASSERT     = 4'b0010;      
    localparam S_INT_ASYNC_ASSERT    = 4'b0100;      
    localparam S_INT_MRET            = 4'b1000;

    reg[`YSYX210574_RegBus] cycle;
    reg[`YSYX210574_RegBus] mtvec;
    reg[`YSYX210574_RegBus] mcause;
    reg[`YSYX210574_RegBus] mepc;
    reg[`YSYX210574_RegBus] mie;
    reg[`YSYX210574_RegBus] mstatus;
    reg[`YSYX210574_RegBus] mip;
    reg[`YSYX210574_RegBus] mscratch;            
    wire [63:0] data_is; 

    assign csr_int_addr_o =(csr_int_state ==S_INT_IDLE )?32'h0:(csr_int_state == S_INT_ASYNC_ASSERT )?mtvec[31:0]:
    (csr_int_state ==S_INT_SYNC_ASSERT )?mtvec[31:0]:
    (csr_int_state ==S_INT_MRET )?mepc[31:0]:32'h0;
    assign csr_mie_o     = mie;
    assign csr_mstatus_o = mstatus;
    assign csr_mip_o= mip;

  
    

    assign data_is = (data_i[13:12]==2'b11)?(data_i | 64'h8000_0000_0000_0000):(data_i[15:14]==2'b11)?(data_i | 64'h8000_0000_0000_0000):data_i;                

     always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            mip <= `YSYX210574_ZeroWord;
        end else if(csr_clint_time_stop_i==1'b1) begin
            mip <= 64'h80;
        end else begin
            mip <= 64'h0;
        end
    end
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            cycle <= `YSYX210574_ZeroWord;
        end else begin
            cycle <= cycle + 1'b1;
        end
    end

    
    
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            mtvec <= `YSYX210574_ZeroWord;
            mcause <= `YSYX210574_ZeroWord;
            mepc <= `YSYX210574_ZeroWord;
            mie <= `YSYX210574_ZeroWord;
            mstatus <= `YSYX210574_ZeroWord;
            mscratch <= `YSYX210574_ZeroWord;
        end else begin
            
            if (we_i == `YSYX210574_WriteEnable) begin
                case (waddr_i[11:0])
                    `YSYX210574_CSR_MTVEC: begin
                        mtvec <= data_i;
                    end
                    `YSYX210574_CSR_MCAUSE: begin
                        mcause <= data_i;
                    end
                    `YSYX210574_CSR_MEPC: begin
                        mepc <= data_i;
                    end
                    `YSYX210574_CSR_MIE: begin
                        mie <= data_i;
                    end
                    `YSYX210574_CSR_MSTATUS: begin
                        mstatus <= data_is ;
                    end
                    `YSYX210574_CSR_MSCRATCH: begin
                        mscratch <= data_i;
                    end
                    default: begin

                    end
                endcase
            
            end else if (csr_int_state == S_INT_IDLE) begin
                        mtvec     <= mtvec;
                        mcause    <= mcause;                   
                        mepc      <= mepc;
                        mie       <= mie;                       
                        mstatus   <= mstatus;
                        mscratch  <= mscratch;
            end else if (csr_int_state == S_INT_ASYNC_ASSERT) begin
                        mtvec     <= mtvec;
                        mcause    <= 64'h8000_0000_0000_0007;                   
                        mepc      <= {{32{1'b0}},csr_inst_addr_i[31:0]};
                        mie       <= mie;
                        mstatus   <= {mstatus[63:32],mstatus[31:13],2'b11,mstatus[10:8],1'b1,mstatus[6:4],1'b0, mstatus[2:0]};
                        mscratch  <= mscratch;
             end else if (csr_int_state == S_INT_SYNC_ASSERT) begin
                        mtvec     <= mtvec;
                        mcause    <= 64'd11;                   
                        mepc      <= {{32{1'b0}},csr_inst_addr_i[31:0]};
                        mie       <= mie;
                        mstatus   <= {mstatus[63:32],mstatus[31:13],2'b11,mstatus[10:8],1'b1,mstatus[6:4],1'b0, mstatus[2:0]};
                        mscratch  <= mscratch;
            end else if (csr_int_state == S_INT_MRET) begin
                        mtvec     <= mtvec;
                        mcause    <= mcause;                   
                        mepc      <= mepc;
                        mie       <= mie;
                        mstatus   <={mstatus[63:32],mstatus[31:13],2'b0,mstatus[10:8],1'b1,mstatus[6:4],mstatus[7], mstatus[2:0]};
                        mscratch  <= mscratch;
                    end
        end
    end

    
    
    always @ (*) begin
         if ((waddr_i[11:0] == raddr_i[11:0]) && (we_i == `YSYX210574_WriteEnable)) begin
            csr_data_o = data_i;
        end else begin
            case (raddr_i[11:0])
                `YSYX210574_CSR_MTVEC: begin
                    csr_data_o = mtvec;
                end
                `YSYX210574_CSR_CYCLE: begin
                    csr_data_o = cycle;
                end
               
               
               
                `YSYX210574_CSR_MCAUSE: begin
                    csr_data_o = mcause;
                end
                `YSYX210574_CSR_MEPC: begin
                    csr_data_o = mepc;
                end
                `YSYX210574_CSR_MIE: begin
                    csr_data_o = mie;
                end
                `YSYX210574_CSR_MSTATUS: begin
                    csr_data_o = mstatus;
                end
                `YSYX210574_CSR_MSCRATCH: begin
                    csr_data_o = mscratch;
                end
                default: begin
                    csr_data_o = `YSYX210574_ZeroWord;
                end
            endcase
        end
    end

endmodule




module ysyx_210574_cpu(

    input wire clock,
    input wire reset,

	input wire cpu_clint_time_stop,

    output wire [63:0] mem_wmask,
    output wire[`YSYX210574_InstAddrBus]    inst_addr,
    output wire                  if_valid,
    input                        if_ready,
    input  [63:0]                if_data_read,
    output [7:0]                 if_size,
    input  [1:0]                 if_resp,
    output handshake_done,
    output mem_done,

    output wire exe_delete,
    output wire [`YSYX210574_RegBus]   axi_mem_wdata_o,
    input wire[`YSYX210574_MemBus]     axi_mem_rdata_i,
	output wire[`YSYX210574_InstAddrBus]  	axi_mem_ADDR_o,
	output wire 		 mem_valid_o,
    output [7:0] 		 mem_size_o,
    input  [1:0] 		 mem_resp_i,  
    output wire 	     axi_req_o, 
	input wire 		     mem_ready_i
    );
    wire ctrl_axi_still_o;
    wire axi_still;
	wire[`YSYX210574_InstBus] inst_o;         
	wire[`YSYX210574_InstAddrBus] pc;

	
	wire jump_flag_i;              
	wire[`YSYX210574_InstAddrBus] jump_addr_i;
    
	wire stall1;
    wire stall2;
    
	wire[`YSYX210574_InstBus] id_inst_i;  
    wire[`YSYX210574_InstAddrBus] id_pc_i;
	
	wire if_hold_flag;
	
    
    wire stallreg_id1;
    wire stallreg_id2;
	

    wire[`YSYX210574_RegAddrBus] id_reg1_raddr_o;      
    wire[`YSYX210574_RegAddrBus] id_reg2_raddr_o;      
    wire id_reg1_ena;                       
    wire id_reg2_ena;                       
	wire[`YSYX210574_RegBus] id_reg1_rdata_i;          
	wire[`YSYX210574_RegBus] id_reg2_rdata_i;          
	
	
    wire               id_csr_we_o;                 
    wire[11:0]  id_csr_waddr_o;
    wire[`YSYX210574_RegBus]      id_csr_rdata_o;          
    wire[`YSYX210574_RegBus]      id_csr_rdata_i;
    wire[11:0]  id_csr_raddr_o;
    wire[`YSYX210574_InstAddrBus] id_pc_o;
    wire[`YSYX210574_RegBus]id_op1_o;
    wire[`YSYX210574_RegBus]id_op2_o;
    wire[`YSYX210574_RegBus]id_op1_jump_o;
    wire[`YSYX210574_RegBus]id_op2_jump_o;
    wire[`YSYX210574_InstBus]id_inst_o;         
    wire[`YSYX210574_RegBus]id_reg1_rdata_o;    
    wire[`YSYX210574_RegBus]id_reg2_rdata_o;    
    wire 		  id_reg_we_o;                 
    wire[`YSYX210574_RegAddrBus]id_reg_waddr_o;
    
   
    
    wire          id_exe_flag;
    
    wire               ex_csr_we_i; 
    wire[`YSYX210574_RegBus]      ex_csr_rdata_i;
    wire[11:0]   ex_csr_waddr_i;
    wire               exe_stall1_i;
    wire               exe_stall2_i;
    wire[`YSYX210574_InstAddrBus] ex_pc_i;
    wire[`YSYX210574_InstBus] ex_inst_i;         
    wire 		   reg_we_i;                 
    wire[`YSYX210574_RegAddrBus] reg_waddr_i; 
    wire[`YSYX210574_RegBus] reg1_rdata_i;    
    wire[`YSYX210574_RegBus] reg2_rdata_i;    
    wire[`YSYX210574_RegBus] op1_i;
    wire[`YSYX210574_RegBus] op2_i;
    wire[`YSYX210574_RegBus] op1_jump_i;
    wire[`YSYX210574_RegBus] op2_jump_i;

    
    wire                    ex_csr_we_o;                       
    wire[11:0]  		ex_csr_waddr_o;
    wire[`YSYX210574_RegBus]           ex_csr_wdata_o;
    
    wire[`YSYX210574_InstAddrBus] ex_pc_o;
    wire[`YSYX210574_RegBus] mem_wdata_o;    
    wire[`YSYX210574_InstAddrBus] mem_raddr_o;    
    wire[`YSYX210574_InstAddrBus] mem_waddr_o;    
    wire mem_we_o;               
    wire mem_req_o;              
    wire[`YSYX210574_RegBus] reg2_rdata_o;  
    wire[`YSYX210574_RegBus] reg_wdata_o;   
    wire reg_we_o;               
    wire[`YSYX210574_RegAddrBus] reg_waddr_o;
    
  
    wire[6:0] opcode;
    wire[2:0] funct3;
               
	wire jump_flag_o;             
	wire[`YSYX210574_InstAddrBus] jump_addr_o;
	
	
	wire[`YSYX210574_RegBus] 		 mem_reg_wdata_i; 
	wire 				 mem_reg_we_i;    
	wire[`YSYX210574_RegAddrBus]	 mem_reg_waddr_i;    
	wire[`YSYX210574_RegBus] 		 mem_reg2_rdata_i;
    wire[6:0] 			 mem_opcode_i;
    wire[2:0]			 mem_funct3_i;
    wire[`YSYX210574_RegBus] 		 mem_mem_wdata_i;  
    wire[`YSYX210574_InstAddrBus]   	 mem_mem_raddr_i;
    wire[`YSYX210574_InstAddrBus]	 	 mem_mem_waddr_i;
    wire 				 mem_mem_we_i;     
    wire				 mem_mem_req_i;        

   
     wire[`YSYX210574_RegBus] 	 mem_reg_wdata_o; 
     wire 			 mem_reg_we_o;    
     wire[`YSYX210574_RegAddrBus] mem_reg_waddr_o; 
    
    
    wire[`YSYX210574_RegBus] 	wb_reg_wdata_i;
    wire 			wb_reg_we_i;   
    wire[`YSYX210574_RegAddrBus] wb_reg_waddr_i;
	
	wire[`YSYX210574_RegBus] 	wb_reg_wdata_o; 
    wire 			wb_reg_we_o;    
    wire[`YSYX210574_RegAddrBus]wb_reg_waddr_o;

    
    wire [`YSYX210574_RegBus] mie;
    wire [`YSYX210574_RegBus] mstatus;
    wire [`YSYX210574_RegBus] mip;
    
    wire [3:0]csr_int_state;
    wire [`YSYX210574_InstAddrBus]csr_int_addr_o;
    wire fetched;
    wire id_fetched_i;
    wire id_fetched_o;
    wire ex_fetched_i;
    wire ex_fetched_o;
    wire mem_fetched_i;
    
    ysyx_210574_csr_reg Ysyx_210574_csr_reg(
        .clk(clock),
        .rst(reset),
        .csr_clint_time_stop_i(cpu_clint_time_stop),
        .we_i (ex_csr_we_o),
        .raddr_i(id_csr_raddr_o),
        .waddr_i(ex_csr_waddr_o),
        .data_i(ex_csr_wdata_o),
        .csr_int_state(csr_int_state),
        .csr_inst_addr_i(ex_pc_o),
        .csr_int_addr_o(csr_int_addr_o),
        .csr_data_o(id_csr_rdata_i),
        .csr_mie_o(mie),
        .csr_mstatus_o(mstatus),
        .csr_mip_o(mip)

    );
	
    
    ysyx_210574_if_stage Ysyx_210574_if_stage(
        .clk(clock),
        .rst(reset),
        .fetched(fetched),
        .flush(ctrl_axi_still_o),
        .if_valid(if_valid),
        .if_ready(if_ready),
        .if_size(if_size),
        .if_resp(if_resp),
        .if_data_read(if_data_read),
        .inst_addr(inst_addr),
		.jump_flag_i(jump_flag_i),                
		.jump_addr_i(jump_addr_i),            		
		.inst_o(inst_o),
        .handshake_done(handshake_done),         
		.pc(pc)	
    );

    
    ysyx_210574_ifid_reg Ysyx_210574_ifid_reg(
		.clk(clock),
        .rst(reset),
        .if_fetched(fetched),
        .id_fetched(id_fetched_i),
        .flush(ctrl_axi_still_o),
        .if_inst(inst_o),    
        .if_pc(pc),          
        .if_hold_flag(if_hold_flag),        
        .id_pc(id_pc_i),
        .id_inst(id_inst_i)     
    );

    
    ysyx_210574_id_stage Ysyx_210574_id_stage(
        .rst(reset),
        .id_fetched_i(id_fetched_i),
        .id_fetched_o(id_fetched_o),
        .id_csr_rdata_i(id_csr_rdata_i),
        .id_csr_raddr_o(id_csr_raddr_o),
        .id_csr_we_o(id_csr_we_o),
        .id_csr_waddr_o(id_csr_waddr_o),
        .id_csr_rdata_o(id_csr_rdata_o),
        .ex2_mem_req_i(mem_req_o),
        .stallreg_id1(stallreg_id1),
        .stallreg_id2(stallreg_id2),
        .ex2_reg_wdata_i(reg_wdata_o),       
        .ex2_reg_we_i(reg_we_o),                   
        .ex2_reg_waddr_i(reg_waddr_o),
        .mem2_reg_wdata_i(mem_reg_wdata_o),       
        .mem2_reg_we_i(mem_reg_we_o),                   
        .mem2_reg_waddr_i(mem_reg_waddr_o),   
        .id_inst_i(id_inst_i),       
        .id_pc_i(id_pc_i), 
        .id_pc_o(id_pc_o),   
        .id_reg1_rdata_i(id_reg1_rdata_i),    
        .id_reg2_rdata_i(id_reg2_rdata_i),
		.id_reg1_raddr_o(id_reg1_raddr_o),
        .id_reg2_raddr_o(id_reg2_raddr_o),		
        .id_reg1_ena(id_reg1_ena),
        .id_reg2_ena(id_reg2_ena),
        .id_op1_o(id_op1_o),
		.id_op2_o(id_op2_o),
        .id_op1_jump_o(id_op1_jump_o),
        .id_op2_jump_o(id_op2_jump_o),
		.id_inst_o(id_inst_o),     
		.id_reg1_rdata_o(id_reg1_rdata_o),
		.id_reg2_rdata_o(id_reg2_rdata_o),
		.id_reg_we_o(id_reg_we_o),               
		.id_reg_waddr_o(id_reg_waddr_o)
			
    );   

    
    ysyx_210574_idex_reg Ysyx_210574_idex_reg(
        .clk(clock),
        .rst(reset),
        .id_fetched(id_fetched_o),
        .ex_fetched(ex_fetched_i),
        .flush(ctrl_axi_still_o),
        .id_csr_waddr(id_csr_waddr_o),
        .id_csr_rdata(id_csr_rdata_o),
        .id_csr_we(id_csr_we_o),
        .ex_csr_waddr(ex_csr_waddr_i),
        .ex_csr_rdata(ex_csr_rdata_i),
        .ex_csr_we(ex_csr_we_i),
        .stall1(stall1),
        .stall2(stall2),
        .ex_stall1(exe_stall1_i),
        .ex_stall2(exe_stall2_i),
        .id_exe_flag(id_exe_flag),
        .id_pc(id_pc_o), 
        .ex_pc(ex_pc_i),
        .id_inst(id_inst_o),              
        .id_reg_we(id_reg_we_o),    
        .id_reg_waddr(id_reg_waddr_o), 
        .id_reg1_rdata(id_reg1_rdata_o),
        .id_reg2_rdata(id_reg2_rdata_o),
        .id_op1(id_op1_o),
		.id_op2(id_op2_o),
		.id_op1_jump(id_op1_jump_o),
		.id_op2_jump(id_op2_jump_o),
		.ex_op1(op1_i),
		.ex_op2(op2_i),
		.ex_op1_jump(op1_jump_i),
		.ex_op2_jump(op2_jump_i),
		.ex_inst(ex_inst_i),          
		.ex_reg_we(reg_we_i),    
		.ex_reg_waddr(reg_waddr_i),
		.ex_reg1_rdata(reg1_rdata_i),   
		.ex_reg2_rdata(reg2_rdata_i)   		  		  		  								
    );

   
        
           
            
   

    
    ysyx_210574_exe_stage Ysyx_210574_exe_stage(
        .rst(reset),
        .ex_fetched_i(ex_fetched_i),
        .ex_fetched_o(ex_fetched_o),
        .exe_mem_done(mem_done),
        .exe_mip_i(mip),
        .exe_mie_i(mie),
        .exe_mstatus_i(mstatus),
        .exe_clint_time_stop_i(cpu_clint_time_stop),
        .ex_csr_we_i(ex_csr_we_i),
        .ex_csr_rdata_i(ex_csr_rdata_i),
        .ex_csr_waddr_i(ex_csr_waddr_i),
        .int_addr_i(csr_int_addr_o),
        .int_state_o(csr_int_state),
        .ex_csr_we_o(ex_csr_we_o),
        .ex_csr_waddr_o(ex_csr_waddr_o),
        .ex_csr_wdata_o(ex_csr_wdata_o),
        .exe_stall1_i(exe_stall1_i),
        .exe_stall2_i(exe_stall2_i),
        .memm2_reg_wdata_i(mem_reg_wdata_o),
        .ex_inst_i(ex_inst_i),
        .ex_pc_i(ex_pc_i), 
        .ex_pc_o(ex_pc_o),         
        .reg_we_i(reg_we_i),                 
        .reg_waddr_i(reg_waddr_i), 
        .reg1_rdata_i(reg1_rdata_i),    
        .reg2_rdata_i(reg2_rdata_i),            
        .exe_op1_i(op1_i),
        .exe_op2_i(op2_i),
        .op1_jump_i(op1_jump_i),
        .op2_jump_i(op2_jump_i),
        .mem_wdata_o(mem_wdata_o),     
		.mem_raddr_o(mem_raddr_o),   
		.mem_waddr_o(mem_waddr_o),    
		.mem_we_o(mem_we_o),                
		.mem_req_o(mem_req_o),               
        .reg2_rdata_o(reg2_rdata_o),  
        .reg_wdata_o(reg_wdata_o),    
        .reg_we_o(reg_we_o),                
        .reg_waddr_o(reg_waddr_o),
        .exe_delete(exe_delete),             
        .opcode(opcode),
        .funct3(funct3),                
        .jump_flag_o(jump_flag_o),               
        .jump_addr_o(jump_addr_o)  

        
    );

    
    ysyx_210574_exemem_reg Ysyx_210574_exemem_reg(
        .clk(clock),
        .rst(reset),
        .ex_fetched(ex_fetched_o),
        .mem_fetched(mem_fetched_i),
        .flush(ctrl_axi_still_o),
        .ex_opcode(opcode),
        .ex_funct3(funct3),
        .ex_reg2_rdata(reg2_rdata_o),     
        .ex_reg_wdata(reg_wdata_o),  
        .ex_reg_we(reg_we_o),     
        .ex_reg_waddr(reg_waddr_o),        
        .ex_mem_wdata(mem_wdata_o),  
        .ex_mem_raddr(mem_raddr_o),
        .ex_mem_waddr(mem_waddr_o),
        .ex_mem_we(mem_we_o),     
        .ex_mem_req(mem_req_o),       
        .mem_mem_wdata( mem_mem_wdata_i), 
        .mem_mem_raddr( mem_mem_raddr_i), 
        .mem_mem_waddr( mem_mem_waddr_i), 
        .mem_mem_we( mem_mem_we_i),    
        .mem_mem_req( mem_mem_req_i),           
        .mem_opcode( mem_opcode_i),
        .mem_funct3( mem_funct3_i),
        .mem_reg2_rdata( mem_reg2_rdata_i),		 
		.mem_reg_wdata( mem_reg_wdata_i), 
		.mem_reg_we( mem_reg_we_i),    
		.mem_reg_waddr( mem_reg_waddr_i) 										
    );
    
    ysyx_210574_mem_stage Ysyx_210574_mem_stage(
        .rst(reset),
        .mem_wmask(mem_wmask),
        .mem_fetched_i(mem_fetched_i),
        .mem_done(mem_done),
        .mem_reg_wdata_i( mem_reg_wdata_i),  
        .mem_reg_we_i( mem_reg_we_i),     
        .mem_reg_waddr_i( mem_reg_waddr_i),        
        .mem_reg2_rdata_i( mem_reg2_rdata_i),
        .mem_opcode_i( mem_opcode_i),
        .mem_funct3_i( mem_funct3_i),       
        .mem_mem_wdata_i( mem_mem_wdata_i),
        .mem_mem_raddr_i( mem_mem_raddr_i),
        .mem_mem_waddr_i( mem_mem_waddr_i),
        .mem_mem_we_i( mem_mem_we_i),
		.mem_mem_req_i( mem_mem_req_i), 

        .axi_mem_wdata_o( axi_mem_wdata_o),    
        .axi_mem_ADDR_o( axi_mem_ADDR_o),    
        .mem_valid_o( mem_valid_o),     		 
        .mem_ready_i( mem_ready_i),           
        .axi_mem_rdata_i( axi_mem_rdata_i),           
        .mem_size_o(mem_size_o),
        .mem_resp_i(mem_resp_i),
        .axi_req_o(axi_req_o),
        .axi_still(axi_still),

        .mem_reg_wdata_o( mem_reg_wdata_o),  
        .mem_reg_we_o( mem_reg_we_o),     
        .mem_reg_waddr_o( mem_reg_waddr_o)         
    );
    
	ysyx_210574_memwb_reg Ysyx_210574_memwb_reg(
        .clk(clock),
        .rst(reset),
        
        .mem_reg_wdata(mem_reg_wdata_o),
        .mem_reg_we(mem_reg_we_o),   
        .mem_reg_waddr(mem_reg_waddr_o),
        .wb_reg_wdata(wb_reg_wdata_i), 
        .wb_reg_we(wb_reg_we_i),    
        .wb_reg_waddr(wb_reg_waddr_i)
    );

    
	ysyx_210574_wb_stage Ysyx_210574_wb_stage(
        .rst(reset),
        .wb_reg_wdata_i(wb_reg_wdata_i),
        .wb_reg_we_i(wb_reg_we_i),   
        .wb_reg_waddr_i(wb_reg_waddr_i),           
        .wb_reg_wdata_o(wb_reg_wdata_o),
        .wb_reg_we_o(wb_reg_we_o),   
        .wb_reg_waddr_o(wb_reg_waddr_o)    
    );
	
	
	ysyx_210574_regfile Ysyx_210574_regfile(
        .rst(reset),
        .clk(clock),                        
        .w_addr(wb_reg_waddr_o),                        
        .w_data(wb_reg_wdata_o),                        
        .w_ena(wb_reg_we_o),                         
        .r_addr1(id_reg1_raddr_o),             
        .r_data1(id_reg1_rdata_i),             
        .r_ena1(id_reg1_ena),         
        .r_addr2(id_reg2_raddr_o),
        .r_data2(id_reg2_rdata_i),
        .r_ena2(id_reg2_ena)
    );
	
	
	ysyx_210574_ctrl Ysyx_210574_ctrl(
        .rst(reset),
        
        
        .ctrl_stallreg_id1(stallreg_id1),
        .ctrl_stallreg_id2(stallreg_id2),
        .ctrl_stall1(stall1),
        .ctrl_stall2(stall2),
        .ctrl_jump_flag_i(jump_flag_o),
        .ctrl_jump_addr_i(jump_addr_o),         
        .ctrl_hold_flag_o(if_hold_flag),         
		.ctrl_jump_flag_o(jump_flag_i),
		.ctrl_jump_addr_o(jump_addr_i),
        .ctrl_axi_still_i(axi_still),
        .ctrl_axi_still_o(ctrl_axi_still_o),
		.ctrl_exe_flag_o(id_exe_flag)
    );

endmodule

module ysyx_210574_clint(

    input wire clk,
    input wire rst,


    input wire [`YSYX210574_AXI_ADDR_WIDTH-1:0]clint_d_aw_addr,
   
   
   
   
    input wire clint_d_aw_valid,
    output reg clint_d_aw_ready,

    input wire [`YSYX210574_AXI_DATA_WIDTH-1:0]clint_d_w_data,
    input wire clint_d_w_valid,
    output reg clint_d_w_ready,

    output wire [`YSYX210574_AXI_ID_WIDTH-1:0]clint_d_b_id,
    output wire [1:0]clint_d_b_resp,
    output reg clint_d_b_valid,
    input wire clint_d_b_ready,

    
    input wire [`YSYX210574_AXI_ADDR_WIDTH-1:0]clint_d_ar_addr,
    input wire clint_d_ar_valid,
    output reg clint_d_ar_ready,

    output reg [`YSYX210574_AXI_ID_WIDTH-1:0]clint_d_r_id,
    output reg [`YSYX210574_AXI_DATA_WIDTH-1:0]clint_d_r_data,
    output reg [1:0]clint_d_r_resp,
    output reg clint_d_r_last,
    output reg clint_d_r_valid,
    input wire clint_d_r_ready,

    output reg clint_time_stop
    

    );
    assign clint_d_b_resp =2'b0;
    assign clint_d_b_id =4'b0;
    reg[`YSYX210574_RegBus] mtime;
    reg[`YSYX210574_RegBus] mtimecmp;
    reg[`YSYX210574_RegBus] addr;
    reg hs_ar;
    
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
             clint_d_r_id <= 4'b0;
             clint_d_r_resp <=2'b0;
        end
    end

    
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            clint_d_ar_ready <= 1'b0;
        end else if (clint_d_ar_valid == 1'b1) begin
             clint_d_ar_ready <= 1'b1;
        end else begin
             clint_d_ar_ready <= 1'b0;
        end
    end

     
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            clint_d_r_valid <= 1'b0;
        end else if (hs_ar == 1'b1) begin
             clint_d_r_valid <= 1'b1;
        end else begin
             clint_d_r_valid <= 1'b0;
        end
    end
   always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            hs_ar <= 1'b0;
    end else if (clint_d_ar_valid & clint_d_ar_ready == 1'b1) begin
            hs_ar <=1'b1; 
        end else if (clint_d_r_ready & clint_d_r_valid == 1'b1) begin
            hs_ar <= 1'b0;
        end
    end
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            clint_d_r_data <= 64'h0;
            clint_d_r_last <= 1'b0;
        end else if ( clint_d_r_ready == 1'b1) begin
            clint_d_r_last <= 1'b1;
            case (addr)
                64'h200_4000:clint_d_r_data <= mtimecmp;
                64'h200_BFF8:clint_d_r_data <= mtime; 
                default: clint_d_r_data <= 64'h0;
            endcase
        end else begin
             clint_d_r_last <= 1'b0;
             clint_d_r_data <= 64'h0;
        end
    end

    
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            clint_d_aw_ready <= 1'b0;
        end else if (clint_d_aw_valid == 1'b1) begin
             clint_d_aw_ready <= 1'b1;
        end else begin
             clint_d_aw_ready <= 1'b0;
        end
    end

   always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            addr <= 64'b0;
        end else if (clint_d_aw_valid & clint_d_aw_ready ==1'b1 ) begin
            addr <= {{32{1'b0}},clint_d_aw_addr[31:0]};
        end else if (clint_d_ar_valid & clint_d_ar_ready == 1'b1) begin
            addr <= {{32{1'b0}},clint_d_ar_addr[31:0]};
        end else begin
            addr <= 64'b0;
        end
    end
    
    
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            clint_d_w_ready <= 1'b0;
        end else if (clint_d_w_valid == 1'b1) begin
            clint_d_w_ready <= 1'b1;
        end else begin
            clint_d_w_ready <= 1'b0;
        end
    end
     always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            mtimecmp <= 64'b0;
        end else if (clint_d_w_valid & clint_d_w_ready ==1'b1 ) begin
            mtimecmp <= clint_d_w_data;
        end
    end
    
    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            clint_d_b_valid <= 1'b0;
        end else if (clint_d_w_valid & clint_d_w_ready ==1'b1 ) begin
            clint_d_b_valid <= 1'b1;
        end else if(clint_d_b_ready ==1'b1) begin
            clint_d_b_valid <= 1'b0;
        end
    end

    always @ (posedge clk) begin
        if (rst == `YSYX210574_RstEnable) begin
            mtime <= 64'h0;
        end else begin
            mtime <= mtime + 1'b1;
        end
    end

    always @ (*) begin
        if (mtime > mtimecmp) begin
            clint_time_stop = 1'b1;
        end else begin
            clint_time_stop = 1'b0;
        end
    end
            


    

endmodule



`define YSYX210574_AXI_BURST_TYPE_FIXED                                2'b00               
`define YSYX210574_AXI_BURST_TYPE_INCR                                 2'b01               
`define YSYX210574_AXI_BURST_TYPE_WRAP                                 2'b10

`define YSYX210574_AXI_PROT_UNPRIVILEGED_ACCESS                        3'b000
`define YSYX210574_AXI_PROT_PRIVILEGED_ACCESS                          3'b001
`define YSYX210574_AXI_PROT_SECURE_ACCESS                              3'b000
`define YSYX210574_AXI_PROT_NON_SECURE_ACCESS                          3'b010
`define YSYX210574_AXI_PROT_DATA_ACCESS                                3'b000
`define YSYX210574_AXI_PROT_INSTRUCTION_ACCESS                         3'b100

`define YSYX210574_AXI_ARCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210574_AXI_ARCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210574_AXI_ARCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210574_AXI_ARCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210574_AXI_ARCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b1010
`define YSYX210574_AXI_ARCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b1110
`define YSYX210574_AXI_ARCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1010
`define YSYX210574_AXI_ARCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210574_AXI_ARCACHE_WRITE_BACK_NO_ALLOCATE                  4'b1011
`define YSYX210574_AXI_ARCACHE_WRITE_BACK_READ_ALLOCATE                4'b1111
`define YSYX210574_AXI_ARCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1011
`define YSYX210574_AXI_ARCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX210574_AXI_AWCACHE_DEVICE_NON_BUFFERABLE                   4'b0000
`define YSYX210574_AXI_AWCACHE_DEVICE_BUFFERABLE                       4'b0001
`define YSYX210574_AXI_AWCACHE_NORMAL_NON_CACHEABLE_NON_BUFFERABLE     4'b0010
`define YSYX210574_AXI_AWCACHE_NORMAL_NON_CACHEABLE_BUFFERABLE         4'b0011
`define YSYX210574_AXI_AWCACHE_WRITE_THROUGH_NO_ALLOCATE               4'b0110
`define YSYX210574_AXI_AWCACHE_WRITE_THROUGH_READ_ALLOCATE             4'b0110
`define YSYX210574_AXI_AWCACHE_WRITE_THROUGH_WRITE_ALLOCATE            4'b1110
`define YSYX210574_AXI_AWCACHE_WRITE_THROUGH_READ_AND_WRITE_ALLOCATE   4'b1110
`define YSYX210574_AXI_AWCACHE_WRITE_BACK_NO_ALLOCATE                  4'b0111
`define YSYX210574_AXI_AWCACHE_WRITE_BACK_READ_ALLOCATE                4'b0111
`define YSYX210574_AXI_AWCACHE_WRITE_BACK_WRITE_ALLOCATE               4'b1111
`define YSYX210574_AXI_AWCACHE_WRITE_BACK_READ_AND_WRITE_ALLOCATE      4'b1111

`define YSYX210574_AXI_SIZE_BYTES_1                                    3'b000                
`define YSYX210574_AXI_SIZE_BYTES_2                                    3'b001
`define YSYX210574_AXI_SIZE_BYTES_4                                    3'b010
`define YSYX210574_AXI_SIZE_BYTES_8                                    3'b011
`define YSYX210574_AXI_SIZE_BYTES_16                                   3'b100
`define YSYX210574_AXI_SIZE_BYTES_32                                   3'b101
`define YSYX210574_AXI_SIZE_BYTES_64                                   3'b110
`define YSYX210574_AXI_SIZE_BYTES_128                                  3'b111


module ysyx_210574_axi_rw # (
    parameter RW_DATA_WIDTH     = 64,
    parameter RW_ADDR_WIDTH     = 32,
    parameter AXI_DATA_WIDTH    = 64,
    parameter AXI_ADDR_WIDTH    = 32,
    parameter AXI_ID_WIDTH      = 4
)(
    input                               clock,
    input                               reset,

	input                               rw_valid_i,
	output                              rw_ready_o,
    input                               rw_req_i,
    output reg [RW_DATA_WIDTH-1:0]      data_read_o,
    input  [RW_DATA_WIDTH-1:0]          rw_w_data_i,
    input  [RW_ADDR_WIDTH-1:0]          rw_addr_i,
    input  [7:0]                        rw_size_i,
    output [1:0]                        rw_resp_o,


    
    input                               axi_aw_ready_i,              
    output                              axi_aw_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
    
    output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
    
    output [7:0]                        axi_aw_len_o,
    output [2:0]                        axi_aw_size_o,
    output [1:0]                        axi_aw_burst_o,
    
    
    
    

    input                               axi_w_ready_i,                 
    output                              axi_w_valid_o,
    output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
    output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
    output                              axi_w_last_o,
    
    
    output                              axi_b_ready_o,                
    input                               axi_b_valid_i,
    input  [1:0]                        axi_b_resp_i,                 
    input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,
    

    input                               axi_ar_ready_i,                
    output                              axi_ar_valid_o,
    output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
    
    output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
    
    output [7:0]                        axi_ar_len_o,
    output [2:0]                        axi_ar_size_o,
    output [1:0]                        axi_ar_burst_o,
    
    
    
    
    
    output                              axi_r_ready_o,                 
    input                               axi_r_valid_i,                 
    input  [1:0]                        axi_r_resp_i,
    input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
    input                               axi_r_last_i,
    input  [AXI_ID_WIDTH-1:0]           axi_r_id_i
    
);

    wire w_trans    = rw_req_i == `YSYX210574_REQ_WRITE;               
    wire r_trans    = rw_req_i == `YSYX210574_REQ_READ;               
    wire w_valid    = rw_valid_i & w_trans;
    wire r_valid    = rw_valid_i & r_trans;

    
    wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;       
    wire w_hs       = axi_w_ready_i  & axi_w_valid_o;          
    wire b_hs       = axi_b_ready_o  & axi_b_valid_i;
    wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
    wire r_hs       = axi_r_ready_o  & axi_r_valid_i;

    wire w_done     = w_hs & axi_w_last_o;
    wire r_done     = r_hs & axi_r_last_i;
    wire trans_done = w_trans ? b_hs : r_done;      

    
    
     localparam [2:0] W_STATE_IDLE = 3'b000, W_STATE_ADDR = 3'b001, W_STATE_WRITE = 3'b010, W_STATE_RESP = 3'b011, W_STATE_DONE = 3'b100;
     localparam [1:0] R_STATE_IDLE = 2'b00, R_STATE_ADDR = 2'b01, R_STATE_READ  = 2'b10, R_STATE_DONE = 2'b11;

    reg [2:0] w_state;
    reg [1:0] r_state;
    wire w_state_addr   = w_state == W_STATE_ADDR;
    wire w_state_write  = w_state == W_STATE_WRITE;
    wire w_state_resp   = w_state == W_STATE_RESP;
    wire r_state_addr   = r_state == R_STATE_ADDR;
    wire r_state_read   = r_state == R_STATE_READ;

    
    always @(posedge clock ) begin
        if (reset ==1'b1) begin
            w_state <= W_STATE_IDLE;
        end
        else begin
            if (w_valid) begin
                case (w_state)
                    W_STATE_IDLE:               w_state <= W_STATE_ADDR;
                    W_STATE_ADDR:  if (aw_hs)   w_state <= W_STATE_WRITE;
                    W_STATE_WRITE: if (w_done)  w_state <= W_STATE_RESP;
                    W_STATE_RESP:  if (b_hs)    w_state <= W_STATE_DONE;
                    W_STATE_DONE:               w_state <= W_STATE_IDLE;
                    default:;
                endcase
            end
        end
    end

    
    always @(posedge clock) begin
        if (reset ==1'b1) begin
            r_state <= R_STATE_IDLE;
        end
        else begin
            if (r_valid) begin
                case (r_state)
                    R_STATE_IDLE:               r_state <= R_STATE_ADDR;
                    R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
                    R_STATE_READ: if (r_done)   r_state <= R_STATE_DONE;
                    R_STATE_DONE:               r_state <= R_STATE_IDLE;
                    default:;
                endcase
            end
        end
    end

      reg rw_ready;
      wire rw_ready_nxt = trans_done;
      wire rw_ready_en      = trans_done | rw_ready;
      always @(posedge clock) begin
          if (reset ==1'b1) begin
              rw_ready <= 1'b0;
          end
          else if (rw_ready_en) begin
              rw_ready <= rw_ready_nxt;
          end
      end
      assign rw_ready_o     = rw_ready;

      reg [1:0] rw_resp;
      wire[1:0]rw_resp_nxt = w_trans ? axi_b_resp_i : axi_r_resp_i;
      wire resp_en = trans_done;
      always @(posedge clock) begin
          if (reset ==1'b1) begin
              rw_resp <= 2'b0;
          end
          else if (resp_en) begin
              rw_resp <= rw_resp_nxt;
          end
      end
      assign rw_resp_o      = rw_resp;  

    
    //parameter AXI_SIZE      = $clog2(AXI_DATA_WIDTH / 8);
    //wire [2:0]AXI_SIZE  = (rw_addr_i ==32'h3fff_ffff && rw_addr_i >=32'h3000_0000 )?3'b10:
    //(rw_addr_i <=32'h3fff_ffff && rw_addr_i >=32'h3000_0000 )?3'b10:
    //(rw_addr_i <=32'h1000_0fff && rw_addr_i >=32'h1000_0000 )?3'b10:(rw_addr_i <=32'h1000_1fff && rw_addr_i >=32'h1000_0000 )?3'b10:3'b11;
    wire [2:0]AXI_SIZE  = (rw_addr_i <=32'h1000_0fff && rw_addr_i >=32'h1000_0000 )?3'b0:
    (rw_addr_i < 32'h8000_0000 )?3'b10:3'b11;
    wire [AXI_ID_WIDTH-1:0] axi_id              = {AXI_ID_WIDTH{1'b0}};
    
    wire [7:0] axi_len      =  8'b0 ;
    wire [2:0] axi_size     = AXI_SIZE[2:0];
    
    assign axi_aw_valid_o   = w_state_addr;
    assign axi_aw_addr_o    = rw_addr_i;
    
    assign axi_aw_id_o      = axi_id;
    
    assign axi_aw_len_o     = axi_len;
    assign axi_aw_size_o    = axi_size;
    assign axi_aw_burst_o   = `YSYX210574_AXI_BURST_TYPE_INCR;                                 
    
    
    
    

    
    assign axi_w_valid_o    = w_state_write;
    assign axi_w_data_o     = rw_w_data_i ;
    assign axi_w_strb_o     = rw_size_i;
    assign axi_w_last_o     = 1'b1;
    

    
    assign axi_b_ready_o    = w_state_resp;





    
    

    
    assign axi_ar_valid_o   = r_state_addr;
    assign axi_ar_addr_o    = rw_addr_i;
    
    assign axi_ar_id_o      = axi_id;
    
    assign axi_ar_len_o     = (rw_addr_i < 32'h8000_0000 )?8'b0:8'b1;;                               
    assign axi_ar_size_o    = axi_size;
    assign axi_ar_burst_o   = `YSYX210574_AXI_BURST_TYPE_INCR;
    
    
    

    
    assign axi_r_ready_o    = r_state_read;
    genvar i;
    generate
    for ( i = 0; i < 1; i = i + 1) begin:regfile
        always @(posedge clock) begin
            if (reset ==1'b1) begin
                data_read_o[i*AXI_DATA_WIDTH+:AXI_DATA_WIDTH] <= 64'h0;
            end
            else if (axi_r_ready_o & axi_r_valid_i) begin
                    data_read_o[AXI_DATA_WIDTH-1:0] <= axi_r_data_i;
                end
            end
        end
endgenerate
endmodule

module ysyx_210574_axi_interconnect_wrap_2x2 #
(
    parameter DATA_WIDTH = 64,
    parameter ADDR_WIDTH = 32,
    parameter STRB_WIDTH = (DATA_WIDTH/8),
    parameter ID_WIDTH = 4
) 
(
   

    /*
     * AXI slave interface
     */
    output  reg [ID_WIDTH-1:0]    s00_axi_awid,
    output  reg [ADDR_WIDTH-1:0]  s00_axi_awaddr,
    output  reg [7:0]             s00_axi_awlen,
    output  reg [2:0]             s00_axi_awsize,
    output  reg [1:0]             s00_axi_awburst,
    
    
    
    
    output  reg                   s00_axi_awvalid,
    input wire                     s00_axi_awready,

    output  reg [DATA_WIDTH-1:0]  s00_axi_wdata,
    output  reg [STRB_WIDTH-1:0]  s00_axi_wstrb,
    output  reg                   s00_axi_wlast,
    output  reg                   s00_axi_wvalid,
    input wire                     s00_axi_wready,

    input wire [ID_WIDTH-1:0]      s00_axi_bid,
    input wire [1:0]               s00_axi_bresp,
    input wire                     s00_axi_bvalid,
    output  reg                   s00_axi_bready,

    output  reg [ID_WIDTH-1:0]    s00_axi_arid,
    output  reg [ADDR_WIDTH-1:0]  s00_axi_araddr,
    output  reg [7:0]             s00_axi_arlen,
    output  reg [2:0]             s00_axi_arsize,
    output  reg [1:0]             s00_axi_arburst,
   
   
   
   
    output  reg                   s00_axi_arvalid,
    input wire                     s00_axi_arready,

    input wire[ID_WIDTH-1:0]      s00_axi_rid,
    input wire[DATA_WIDTH-1:0]    s00_axi_rdata,
    input wire[1:0]               s00_axi_rresp,
    input wire                    s00_axi_rlast,
    input wire                    s00_axi_rvalid,
    output  reg                   s00_axi_rready,

   
    output  reg [ADDR_WIDTH-1:0]    s01_axi_awaddr,
    
   
    
    
    
    
    output  reg                     s01_axi_awvalid,
    input wire                       s01_axi_awready,

    output  reg [DATA_WIDTH-1:0]    s01_axi_wdata,
    output  reg                     s01_axi_wvalid,
    input wire                      s01_axi_wready,

    input wire[ID_WIDTH-1:0]        s01_axi_bid,
    input wire[1:0]                 s01_axi_bresp,    
    input wire                      s01_axi_bvalid,
    output  reg                     s01_axi_bready,

  
    output  reg [ADDR_WIDTH-1:0]    s01_axi_araddr,
    
    
    
    
    
    output  reg                     s01_axi_arvalid,
    input wire                       s01_axi_arready,

    input wire[ID_WIDTH-1:0]        s01_axi_rid,
    input wire[DATA_WIDTH-1:0]      s01_axi_rdata,
    input wire[1:0]                 s01_axi_rresp,
    input wire                      s01_axi_rlast,
    input wire                      s01_axi_rvalid,
    output  reg                     s01_axi_rready,

    /*
     * AXI master interface
     */
    input wire [ID_WIDTH-1:0]        m00_axi_awid,
    input wire [ADDR_WIDTH-1:0]      m00_axi_awaddr,
    input wire [7:0]                 m00_axi_awlen,
    input wire [2:0]                 m00_axi_awsize,
    input wire [1:0]                 m00_axi_awburst,
    
    
    
    
    input wire                       m00_axi_awvalid,
    output  reg                     m00_axi_awready,

    input wire [DATA_WIDTH-1:0]      m00_axi_wdata,
    input wire [STRB_WIDTH-1:0]      m00_axi_wstrb,
    input wire                       m00_axi_wlast,
    input wire                       m00_axi_wvalid,
    output  reg                     m00_axi_wready,

    output  reg [ID_WIDTH-1:0]      m00_axi_bid,
    output  reg [1:0]               m00_axi_bresp,
    output  reg                     m00_axi_bvalid,
    input wire                       m00_axi_bready,

    input wire [ID_WIDTH-1:0]        m00_axi_arid,
    input wire [ADDR_WIDTH-1:0]      m00_axi_araddr,
    input wire [7:0]                 m00_axi_arlen,
    input wire [2:0]                 m00_axi_arsize,
    input wire [1:0]                 m00_axi_arburst,
    
    
    
    
    input wire                       m00_axi_arvalid,
    output  reg                     m00_axi_arready,

    output  reg [ID_WIDTH-1:0]      m00_axi_rid,
    output  reg [DATA_WIDTH-1:0]    m00_axi_rdata,
    output  reg [1:0]               m00_axi_rresp,
    output  reg                     m00_axi_rlast,
    output  reg                     m00_axi_rvalid,
    input wire                       m00_axi_rready
);
    always@(*)begin
         if((m00_axi_awaddr | m00_axi_araddr) >= 32'h200_0000 && (m00_axi_awaddr | m00_axi_araddr) <= 32'h200_FFFF)begin
                s00_axi_awid                            = 4'b0;         
                s00_axi_awaddr                          = 32'h0;
                s00_axi_awlen                           = 8'b0;
                s00_axi_awsize                          = 3'b0;
                s00_axi_awburst                         = `YSYX210574_AXI_BURST_TYPE_INCR; 
                
                
                
                
                s00_axi_awvalid                         = 1'b0;
                
                s00_axi_wdata                           = 64'h0;
                s00_axi_wstrb                           = 8'b0;
                s00_axi_wlast                           = 1'b0;
                s00_axi_wvalid                          = 1'b0;
                
                
                
                
                s00_axi_bready                          = 1'b0;
                s00_axi_arid                            = 4'h0;
                s00_axi_araddr                          = 32'h0;
                s00_axi_arlen                           = 8'b0;
                s00_axi_arsize                          = 3'b0;
                s00_axi_arburst                         = `YSYX210574_AXI_BURST_TYPE_INCR;
                
                
                
                
                s00_axi_arvalid                         = 1'b0;
                
                
                
                
                
                
                s00_axi_rready                          = 1'b0;
                          
                 
                s01_axi_awaddr                          = m00_axi_awaddr;
                
                
                
                
                
                
                s01_axi_awvalid                         = m00_axi_awvalid;
                m00_axi_awready                         = s01_axi_awready;

                s01_axi_wdata                           = m00_axi_wdata;
            
                s01_axi_wvalid                          = m00_axi_wvalid;
                m00_axi_wready                          = s01_axi_wready;
                
                m00_axi_bid                             = s01_axi_bid;
                m00_axi_bresp                           = s01_axi_bresp;
                m00_axi_bvalid                          = s01_axi_bvalid;
                s01_axi_bready                          = m00_axi_bready;

                
                s01_axi_araddr                          = m00_axi_araddr;
                
                
                
                
                
                s01_axi_arvalid                         = m00_axi_arvalid;
                m00_axi_arready                         = s01_axi_arready;

                m00_axi_rid                             = s01_axi_rid;
                m00_axi_rdata                           = s01_axi_rdata;
                m00_axi_rresp                           = s01_axi_rresp;
                m00_axi_rlast                           = s01_axi_rlast;
                m00_axi_rvalid                          = s01_axi_rvalid;
                s01_axi_rready                          = m00_axi_rready;                                    
        end else begin
                s00_axi_awid                            = m00_axi_awid;           
                s00_axi_awaddr                          = m00_axi_awaddr;
                s00_axi_awlen                           = m00_axi_awlen;
                s00_axi_awsize                          = m00_axi_awsize;
                s00_axi_awburst                         = m00_axi_awburst;
                
                
                
                
                s00_axi_awvalid                         = m00_axi_awvalid;
                m00_axi_awready                         = s00_axi_awready;

                s00_axi_wdata                           = m00_axi_wdata;
                s00_axi_wstrb                           = m00_axi_wstrb;
                s00_axi_wlast                           = m00_axi_wlast;
                s00_axi_wvalid                          = m00_axi_wvalid;
                m00_axi_wready                          = s00_axi_wready;

                m00_axi_bid                             = s00_axi_bid;
                m00_axi_bresp                           = s00_axi_bresp;
                m00_axi_bvalid                          = s00_axi_bvalid;
                s00_axi_bready                          = m00_axi_bready;

                s00_axi_arid                            = m00_axi_arid;
                s00_axi_araddr                          = m00_axi_araddr;
                s00_axi_arlen                           = m00_axi_arlen;
                s00_axi_arsize                          = m00_axi_arsize;
                s00_axi_arburst                         = m00_axi_arburst;
                
                
                
                
                s00_axi_arvalid                         = m00_axi_arvalid;
                m00_axi_arready                         = s00_axi_arready;

                m00_axi_rid                             = s00_axi_rid;
                m00_axi_rdata                           = s00_axi_rdata;
                m00_axi_rresp                           = s00_axi_rresp;
                m00_axi_rlast                           = s00_axi_rlast;
                m00_axi_rvalid                          = s00_axi_rvalid;
                s00_axi_rready                          = m00_axi_rready;

                    
                s01_axi_awaddr                          = 32'h0;

                
                
                
                
                s01_axi_awvalid                         = 1'b0;
                
                s01_axi_wdata                           = 64'h0;
                s01_axi_wvalid                          = 1'b0;
                
                
                
                
                s01_axi_bready                          = 1'b0;
              
                s01_axi_araddr                          = 32'h0;
              
                
                
                
                
                s01_axi_arvalid                         = 1'b0;
                
                
                
                
                
                
                s01_axi_rready                          = 1'b0;                       
        end

    end




endmodule



module ysyx_210574_bigcpu(

    input wire clock,
    input wire reset,
	
    input                                 aw_bits_ready,
    output                                aw_bits_valid,
    output [`YSYX210574_AXI_ADDR_WIDTH-1:0]          aw_bits_addr,
    
    
    
    output [7:0]                          aw_bits_len,
    output [2:0]                          aw_bits_size,
    output [1:0]                          aw_bits_burst,
    
    
    
 
    input                                 w_bits_ready,
    output                                w_bits_valid,
    output [`YSYX210574_AXI_DATA_WIDTH-1:0]          w_bits_data,
    output [`YSYX210574_AXI_DATA_WIDTH/8-1:0]        w_bits_strb,
    output                                w_bits_last,
 
    output                                b_bits_ready,
    input                                 b_bits_valid,
    input  [1:0]                          b_bits_resp,
    input  [`YSYX210574_AXI_ID_WIDTH-1:0]            b_bits_id,
    

    input                                 ar_bits_ready,
    output                                ar_bits_valid,
    output [`YSYX210574_AXI_ADDR_WIDTH-1:0]          ar_bits_addr,
    
    
    
    output [7:0]                          ar_bits_len,
    output [2:0]                          ar_bits_size,
    output [1:0]                          ar_bits_burst,
    
    
    
    
    output                                r_bits_ready,
    input                                 r_bits_valid,
    input  [1:0]                          r_bits_resp,
    input  [`YSYX210574_AXI_DATA_WIDTH-1:0]          r_bits_data,
    input                                 r_bits_last,
    input  [`YSYX210574_AXI_ID_WIDTH-1:0]            r_bits_id
    
    );


    wire aw_ready;
    wire aw_valid;
    wire [`YSYX210574_AXI_ADDR_WIDTH-1:0] aw_addr;
    
    wire [`YSYX210574_AXI_ID_WIDTH-1:0] aw_id;
    
    wire [7:0] aw_len;
    wire [2:0] aw_size;
    wire [1:0] aw_burst;
    
    
    
    

    wire w_ready;
    wire w_valid;
    wire [`YSYX210574_AXI_DATA_WIDTH-1:0] w_data;
    wire [`YSYX210574_AXI_DATA_WIDTH/8-1:0] w_strb;
    wire w_last;
    
    
    wire b_ready;
    wire b_valid;
    wire [1:0] b_resp;
    wire [`YSYX210574_AXI_ID_WIDTH-1:0] b_id;
    

    wire ar_ready;
    wire ar_valid;
    wire [`YSYX210574_AXI_ADDR_WIDTH-1:0] ar_addr;
    
    wire [`YSYX210574_AXI_ID_WIDTH-1:0] ar_id;
    
    wire [7:0] ar_len;
    wire [2:0] ar_size;
    wire [1:0] ar_burst;
    
    
    
    
    
    wire r_ready;
    wire r_valid;
    wire [1:0] r_resp;
    wire [`YSYX210574_AXI_DATA_WIDTH-1:0] r_data;
    wire r_last;
    wire [`YSYX210574_AXI_ID_WIDTH-1:0] r_id;
    
    wire i_aw_ready;
    wire i_aw_valid;
    wire [`YSYX210574_AXI_ADDR_WIDTH-1:0] i_aw_addr;
    
    
    
    wire [7:0] i_aw_len;
    wire [2:0] i_aw_size;
    wire [1:0] i_aw_burst ;
    
    
    
    
    wire i_w_ready;
    wire i_w_valid;
    wire [`YSYX210574_B0XX_AXI_DATA_WIDTH-1:0] i_w_data;
    wire [`YSYX210574_B0XX_AXI_DATA_WIDTH/8-1:0] i_w_strb;
    wire i_w_last;
    
    wire i_b_ready;
    wire i_b_valid;
    wire [1:0] i_b_resp;
    wire [`YSYX210574_B0XX_AXI_ID_WIDTH-1:0] i_b_id;
    
    wire i_ar_ready;
    wire i_ar_valid;
    wire [`YSYX210574_AXI_ADDR_WIDTH-1:0] i_ar_addr;
    
   
    
    wire [7:0] i_ar_len;
    wire [2:0] i_ar_size;
    wire [1:0] i_ar_burst;
    
    
    
    
    wire i_r_ready;
    wire i_r_valid;
    wire [1:0] i_r_resp;
    wire [`YSYX210574_B0XX_AXI_DATA_WIDTH-1:0] i_r_data;
    wire i_r_last;
    wire [`YSYX210574_B0XX_AXI_ID_WIDTH-1:0] i_r_id;

    reg axi_if_valid;
    reg axi_if_ready;
    reg axi_req;
    reg [63:0] axi_if_data_read;
    reg [63:0] axi_data_write;
    reg [`YSYX210574_InstAddrBus] axi_inst_addr;
    reg [7:0] axi_if_size;
    reg [1:0] axi_if_resp;

    reg axi_mem_valid_o;
    reg axi_mem_ready_i;
    reg axi_axi_req_o;
    reg [63:0] axi_axi_mem_wdata_o;
    reg [63:0] axi_axi_mem_rdata_i;
    reg [31:0] axi_axi_mem_ADDR_o;
    reg [7:0] axi_mem_size_o;
    reg [1:0] axi_mem_resp_i;

    wire if_valid;
    wire if_ready;
    wire [63:0] if_data_read;
    wire [`YSYX210574_InstAddrBus] inst_addr;
    wire [7:0] if_size;
    wire [1:0] if_resp;

    wire exe_cache_delete;
    wire mem_valid_o;
    wire mem_ready_i;
    wire axi_req_o;
    wire [63:0] axi_mem_wdata_o;
    wire [63:0] axi_mem_rdata_i;
    wire [31:0] axi_mem_ADDR_o;
    wire [7:0] mem_size_o;
    wire [1:0] mem_resp_i;
    assign if_ready = axi_if_ready;
    assign if_data_read = axi_if_data_read;
    assign mem_ready_i = axi_mem_ready_i;
    assign axi_mem_rdata_i = axi_axi_mem_rdata_i;

    assign if_resp = axi_if_resp;
    assign mem_resp_i = axi_mem_resp_i;



    parameter I_STATE_IF = 1'b0, I_STATE_MEM = 1'b1;
    reg i_state;
    wire if_done;
    wire mem_done;
    wire time_stop;

     wire rw_ready_o;
    wire [63:0]data_read_o;
    wire [1:0]rw_resp_o;

     wire [`YSYX210574_AXI_ADDR_WIDTH-1:0]d_aw_addr;
   
   
   
   
    wire d_aw_valid;
    wire d_aw_ready;

    wire [`YSYX210574_AXI_DATA_WIDTH-1:0]d_w_data;
    wire d_w_valid;
    wire d_w_ready;

    wire [`YSYX210574_AXI_ID_WIDTH-1:0]d_b_id;
    wire [1:0]d_b_resp;
    wire d_b_valid;
    wire d_b_ready;


    wire [`YSYX210574_AXI_ADDR_WIDTH-1:0]d_ar_addr;
   
    
    
    
    wire d_ar_valid;
    wire d_ar_ready;

    wire [`YSYX210574_AXI_ID_WIDTH-1:0]d_r_id;
    wire [`YSYX210574_AXI_DATA_WIDTH-1:0]d_r_data;
    wire [1:0]d_r_resp;
    wire d_r_last;
    wire d_r_valid;
    wire d_r_ready;

    assign i_aw_ready           = aw_bits_ready;
    assign aw_bits_valid        = i_aw_valid;
    assign aw_bits_addr         = i_aw_addr;
    
    
    
    assign aw_bits_len          = i_aw_len;
    assign aw_bits_size         = i_aw_size;
    assign aw_bits_burst        = i_aw_burst;
    
    
    
    assign i_w_ready            = w_bits_ready;
    assign w_bits_valid         = i_w_valid;
    assign w_bits_data          = i_w_data;
    assign w_bits_strb          = i_w_strb;
    assign w_bits_last          = i_w_last;

    assign b_bits_ready         = i_b_ready;
    assign i_b_valid            = b_bits_valid;
    assign i_b_resp             = b_bits_resp;
    assign i_b_id               = b_bits_id;
    

    assign i_ar_ready           = ar_bits_ready;
    assign ar_bits_valid        = i_ar_valid;
    assign ar_bits_addr         = i_ar_addr;
    
    
    
    assign ar_bits_len          = i_ar_len;
    assign ar_bits_size         = i_ar_size;
    assign ar_bits_burst        = i_ar_burst;
    
   
    
    
    assign r_bits_ready         = i_r_ready;
    assign i_r_valid            = r_bits_valid;
    assign i_r_resp             = r_bits_resp;
    assign i_r_data             = r_bits_data;
    assign i_r_last             = r_bits_last;
    assign i_r_id               = r_bits_id;

    wire c_aw_ready;
    wire c_aw_valid;
    wire [`YSYX210574_AXI_ADDR_WIDTH-1:0] c_aw_addr;
    wire [`YSYX210574_B0XX_AXI_ID_WIDTH-1:0] c_aw_id;
    wire [7:0] c_aw_len;
    wire [2:0] c_aw_size;
    wire [1:0] c_aw_burst;
    wire c_w_ready;
    wire c_w_valid;
    wire [`YSYX210574_B0XX_AXI_DATA_WIDTH-1:0] c_w_data;
    wire [`YSYX210574_B0XX_AXI_DATA_WIDTH/8-1:0] c_w_strb;
    wire c_w_last;
    wire c_b_ready;
    wire c_b_valid;
    wire [1:0] c_b_resp;
    wire [`YSYX210574_B0XX_AXI_ID_WIDTH-1:0] c_b_id;
    wire c_ar_ready;
    wire c_ar_valid;
    wire [`YSYX210574_AXI_ADDR_WIDTH-1:0] c_ar_addr;
    wire [`YSYX210574_B0XX_AXI_ID_WIDTH-1:0] c_ar_id;
    wire [7:0] c_ar_len;
    wire [2:0] c_ar_size;
    wire [1:0] c_ar_burst;
    wire c_r_ready;
    wire c_r_valid;
    wire [1:0] c_r_resp;
    wire [`YSYX210574_B0XX_AXI_DATA_WIDTH-1:0] c_r_data;
    wire c_r_last;
    wire [`YSYX210574_B0XX_AXI_ID_WIDTH-1:0] c_r_id;
    wire [63:0]axi_mem_wmask;
    ysyx_210574_cache Ysyx_210574_Cache(
    .clk(clock),
    .rst(reset),
    .axi_mem_wmask(axi_mem_wmask),
    .axi_cache_d_aw_addr(i_aw_addr),  
    .axi_cache_d_aw_valid(i_aw_valid),
    .axi_cache_d_aw_ready(i_aw_ready),
    .axi_cache_d_aw_len_o(i_aw_len),
    .axi_cache_d_aw_size_o(i_aw_size),
    .axi_cache_d_aw_burst_o(i_aw_burst),
 
    .axi_cache_d_w_data(i_w_data),
    .axi_cache_d_w_strb(i_w_strb),
    .axi_cache_d_w_last(i_w_last),
    .axi_cache_d_w_valid(i_w_valid),
    .axi_cache_d_w_ready(i_w_ready),
 
    .axi_cache_d_b_id(i_b_id),
    .axi_cache_d_b_resp(i_b_resp),
    .axi_cache_d_b_valid(i_b_valid),
    .axi_cache_d_b_ready(i_b_ready),
 
    .axi_cache_d_ar_addr(i_ar_addr),
    .axi_cache_d_ar_valid(i_ar_valid),
    .axi_cache_d_ar_ready(i_ar_ready),
    .axi_cache_d_ar_len_o(i_ar_len),
    .axi_cache_d_ar_size_o(i_ar_size),
    .axi_cache_d_ar_burst_o(i_ar_burst),
 
    .axi_cache_d_r_id(i_r_id),
    .axi_cache_d_r_data(i_r_data),
    .axi_cache_d_r_resp(i_r_resp),
    .axi_cache_d_r_last(i_r_last),
    .axi_cache_d_r_valid(i_r_valid),
    .axi_cache_d_r_ready(i_r_ready),

    //发送
    .cache_delete(exe_cache_delete),
    .cache_mem_vaild(mem_valid_o),
    .cache_d_aw_addr(c_aw_addr),  
    .cache_d_aw_valid(c_aw_valid),
    .cache_d_aw_ready(c_aw_ready),
    .cache_d_aw_len_o(c_aw_len),
    .cache_d_aw_size_o(c_aw_size),
    .cache_d_aw_burst_o(c_aw_burst),
 
    .cache_d_w_data(c_w_data),
    .cache_d_w_strb(c_w_strb),
    .cache_d_w_valid(c_w_valid),
    .cache_d_w_ready(c_w_ready),
 
    .cache_d_b_id(c_b_id),
    .cache_d_b_resp(c_b_resp),
    .cache_d_b_valid(c_b_valid),
    .cache_d_b_ready(c_b_ready),
 
 
    .cache_d_ar_addr(c_ar_addr),
    .cache_d_ar_valid(c_ar_valid),
    .cache_d_ar_ready(c_ar_ready),
    .cache_d_ar_len_o(c_ar_len),
    .cache_d_ar_size_o(c_ar_size),
    .cache_d_ar_burst_o(c_ar_burst), 
 
    .cache_d_r_id(c_r_id),
    .cache_d_r_data(c_r_data),
    .cache_d_r_resp(c_r_resp),
    .cache_d_r_last(c_r_last),
    .cache_d_r_valid(c_r_valid),
    .cache_d_r_ready(c_r_ready) 

   );
   

     ysyx_210574_axi_rw u_Ysyx_210574_axi_rw (
        .clock                          (clock),
        .reset                          (reset),

        .rw_valid_i                     (axi_mem_valid_o | axi_if_valid),
        .rw_ready_o                     (rw_ready_o),
        .rw_req_i                       (axi_axi_req_o | axi_req),
        .data_read_o                    (data_read_o),
        .rw_w_data_i                    (axi_axi_mem_wdata_o | axi_data_write),
        .rw_addr_i                      (axi_axi_mem_ADDR_o | axi_inst_addr),
        .rw_size_i                      (axi_mem_size_o | axi_if_size),
        .rw_resp_o                      (rw_resp_o),

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
        .axi_r_id_i                     (r_id)
        
    );
    
    

   
    
    ysyx_210574_clint Ysyx_210574_clint(
        .clk(clock),
        .rst(reset),
        .clint_d_aw_addr(d_aw_addr),      
        .clint_d_aw_valid(d_aw_valid),
        .clint_d_aw_ready(d_aw_ready),

        .clint_d_w_data(d_w_data),
        .clint_d_w_valid(d_w_valid),
        .clint_d_w_ready(d_w_ready),
        .clint_d_b_id(d_b_id),
        .clint_d_b_resp(d_b_resp),
        .clint_d_b_valid(d_b_valid),
        .clint_d_b_ready(d_b_ready),
        
        .clint_d_ar_addr(d_ar_addr),
       
        
        
        
        
        .clint_d_ar_valid(d_ar_valid),
        .clint_d_ar_ready(d_ar_ready),
        .clint_d_r_id(d_r_id),
        .clint_d_r_data(d_r_data),
        .clint_d_r_resp(d_r_resp),
        .clint_d_r_last(d_r_last),
        .clint_d_r_valid(d_r_valid),
        .clint_time_stop(time_stop),
        .clint_d_r_ready(d_r_ready)

    );
    ysyx_210574_axi_interconnect_wrap_2x2 u_ysyx_210574_axi_interconnect (


        .s00_axi_awid                   (c_aw_id),
        .s00_axi_awaddr                 (c_aw_addr),
        .s00_axi_awlen                  (c_aw_len),
        .s00_axi_awsize                 (c_aw_size),
        .s00_axi_awburst                (c_aw_burst),
        
        
        
        
        .s00_axi_awvalid                (c_aw_valid),
        .s00_axi_awready                (c_aw_ready),

        .s00_axi_wdata                  (c_w_data),
        .s00_axi_wstrb                  (c_w_strb),
        .s00_axi_wlast                  (c_w_last),
        .s00_axi_wvalid                 (c_w_valid),
        .s00_axi_wready                 (c_w_ready),

        .s00_axi_bid                    (c_b_id),
        .s00_axi_bresp                  (c_b_resp),
        .s00_axi_bvalid                 (c_b_valid),
        .s00_axi_bready                 (c_b_ready),

        .s00_axi_arid                   (c_ar_id),
        .s00_axi_araddr                 (c_ar_addr),
        .s00_axi_arlen                  (c_ar_len),
        .s00_axi_arsize                 (c_ar_size),
        .s00_axi_arburst                (c_ar_burst),
        
        
        
        
        .s00_axi_arvalid                (c_ar_valid),
        .s00_axi_arready                (c_ar_ready),
        .s00_axi_rid                    (c_r_id),
        .s00_axi_rdata                  (c_r_data),
        .s00_axi_rresp                  (c_r_resp),
        .s00_axi_rlast                  (c_r_last),
        .s00_axi_rvalid                 (c_r_valid),
        .s00_axi_rready                 (c_r_ready),
       


        .s01_axi_awaddr                 (d_aw_addr),
      
       
       
       
       
        .s01_axi_awvalid                (d_aw_valid),
        .s01_axi_awready                (d_aw_ready),

        .s01_axi_wdata                  (d_w_data),
        .s01_axi_wvalid                 (d_w_valid),
        .s01_axi_wready                 (d_w_ready),

        .s01_axi_bid                    (d_b_id),
        .s01_axi_bresp                  (d_b_resp),
        .s01_axi_bvalid                 (d_b_valid),
        .s01_axi_bready                 (d_b_ready),

        
        .s01_axi_araddr                 (d_ar_addr),
        
        
        
        
        
        .s01_axi_arvalid                (d_ar_valid),
        .s01_axi_arready                (d_ar_ready),

        .s01_axi_rid                    (d_r_id),
        .s01_axi_rdata                  (d_r_data),
        .s01_axi_rresp                  (d_r_resp),
        .s01_axi_rlast                  (d_r_last),
        .s01_axi_rvalid                 (d_r_valid),
        .s01_axi_rready                 (d_r_ready),

        
        .m00_axi_awid                   (aw_id),
        .m00_axi_awaddr                 (aw_addr),
        .m00_axi_awlen                  (aw_len),
        .m00_axi_awsize                 (aw_size),
        .m00_axi_awburst                (aw_burst),
        
        
        
        
        .m00_axi_awvalid                (aw_valid),
        .m00_axi_awready                (aw_ready),
     

        .m00_axi_wdata                  (w_data),
        .m00_axi_wstrb                  (w_strb),
        .m00_axi_wlast                  (w_last),
        .m00_axi_wvalid                 (w_valid),
        .m00_axi_wready                 (w_ready),
        

        .m00_axi_bid                    (b_id),
        .m00_axi_bresp                  (b_resp),
        .m00_axi_bvalid                 (b_valid),
        .m00_axi_bready                 (b_ready),
        

        .m00_axi_arid                   (ar_id),
        .m00_axi_araddr                 (ar_addr),
        .m00_axi_arlen                  (ar_len),
        .m00_axi_arsize                 (ar_size),
        .m00_axi_arburst                (ar_burst),
        
        
        
        
        .m00_axi_arvalid                (ar_valid),
        .m00_axi_arready                (ar_ready),
        

        .m00_axi_rid                    (r_id),
        .m00_axi_rdata                  (r_data),
        .m00_axi_rresp                  (r_resp),
        .m00_axi_rlast                  (r_last),
        .m00_axi_rvalid                 (r_valid), 
        .m00_axi_rready                 (r_ready)
    );
    
    always @(posedge clock ) begin
        if (reset == 1'b1) i_state <= 0;
        else begin
            case (i_state)
                I_STATE_IF:   if (if_done)  i_state <= I_STATE_MEM;
                I_STATE_MEM:  if (mem_done) i_state <= I_STATE_IF;
                default:;
            endcase
        end
    end

   always @ (*)begin
		if( i_state == I_STATE_IF )begin
			axi_if_valid        = if_valid;
            axi_if_ready        = rw_ready_o;
            axi_req             = 1'b0;
            axi_if_data_read    = data_read_o;
            axi_data_write      = 64'h0;
            axi_inst_addr       = inst_addr;
            axi_if_size         = if_size;
            axi_mem_valid_o     = 1'b0;
            axi_mem_ready_i     = 1'b0;
            axi_axi_req_o       = 1'b0;
            axi_axi_mem_wdata_o = 64'h0;
            axi_axi_mem_rdata_i = 64'h0;
            axi_axi_mem_ADDR_o  = 32'h0;
            axi_mem_size_o      = 8'b0;
            axi_if_resp         = rw_resp_o;
            axi_mem_resp_i      = 2'b0;
		end else if(i_state == I_STATE_MEM ) begin
			axi_if_valid        = 1'b0;
            axi_if_ready        = 1'b0;
            axi_req             = 1'b0;
            axi_if_data_read    = 64'h0;
            axi_data_write      = 64'h0;
            axi_inst_addr       = 32'h0;
            axi_if_size         = 8'b0;
            axi_if_resp         = 2'b0;
            axi_mem_valid_o     = mem_valid_o;   
            axi_mem_ready_i     = rw_ready_o;    
            axi_axi_req_o       = axi_req_o;      
            axi_axi_mem_wdata_o = axi_mem_wdata_o;
            axi_axi_mem_rdata_i = data_read_o;
            axi_axi_mem_ADDR_o  = axi_mem_ADDR_o; 
            axi_mem_size_o      = mem_size_o;
            axi_mem_resp_i      = rw_resp_o;
        end else  begin  
            axi_if_valid        = 1'b0;
            axi_if_ready        = 1'b0;
            axi_req             = 1'b0;
            axi_if_data_read    = 64'h0;
            axi_data_write      = 64'h0;
            axi_inst_addr       = 32'h0;
            axi_if_size         = 8'b0;
            axi_mem_valid_o     = 1'b0;
            axi_mem_ready_i     = 1'b0;
            axi_axi_req_o       = 1'b0;
            axi_axi_mem_wdata_o = 64'h0;
            axi_axi_mem_rdata_i = 64'h0;
            axi_axi_mem_ADDR_o  = 32'h0;
            axi_mem_size_o      = 8'b0;
            axi_if_resp         = 2'b0;
            axi_mem_resp_i      = 2'b0;     
		end		
	end
   
   
    ysyx_210574_cpu Ysyx_210574_cpu(
    .clock(clock),
    .reset(reset),
    .mem_wmask(axi_mem_wmask),
    .cpu_clint_time_stop(time_stop),
    .handshake_done(if_done),
    .mem_done(mem_done),

    .if_valid(if_valid),
    .if_ready(if_ready),
    .if_data_read(if_data_read),	
    .if_resp(if_resp),
    .if_size(if_size),
    .inst_addr(inst_addr),
    .exe_delete(exe_cache_delete),

	.axi_mem_wdata_o(axi_mem_wdata_o),
	.axi_mem_rdata_i(axi_mem_rdata_i),
	.axi_mem_ADDR_o(axi_mem_ADDR_o),
    .mem_valid_o(mem_valid_o),
	.mem_size_o(mem_size_o),
	.mem_resp_i(mem_resp_i),
	.axi_req_o(axi_req_o),
	.mem_ready_i(mem_ready_i)
    );

endmodule
