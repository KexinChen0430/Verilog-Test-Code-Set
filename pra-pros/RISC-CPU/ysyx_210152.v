//-----------------------Standard RISC-V defines, DO NOT TOUCH IT!-----------------
//---------------------------------RISCV opcode define-----------------------------
`define YSYX210152_lui_encode 	                7'b0110111
`define YSYX210152_auipc_encode	                7'b0010111
`define YSYX210152_jal_encode	                7'b1101111
`define YSYX210152_jalr_encode	                7'b1100111
`define YSYX210152_branch_encode	            7'b1100011
`define YSYX210152_load_encode 	                7'b0000011
`define YSYX210152_store_encode	                7'b0100011
`define YSYX210152_imm_encode	                7'b0010011
`define YSYX210152_imm32_encode                 7'b0011011
`define YSYX210152_reg_encode	                7'b0110011	                //R type指令opcode
`define YSYX210152_reg32_encode                 7'b0111011	
`define YSYX210152_mem_encode	                7'b0001111	                //MISC-MEM指令OPCODE，
`define YSYX210152_system_encode                7'b1110011	
`define YSYX210152_amo_encode	                7'b0101111
`define YSYX210152_m32_encode	                7'b0111011

//------------------------------------RISC-V Privlage Defines---------------------
`define YSYX210152_Machine                      2'b11
`define YSYX210152_Supervisior                  2'b01
`define YSYX210152_User                         2'b00
//------------------------------------CSRs----------------------------------------
//----------CSR index------------------------
//          YSYX210152_User read only
`define YSYX210152_uro_cycle_index 			    12'hc00	        //YSYX210152_User read only, a shadow of YSYX210152_Machine mode cycle counter
`define YSYX210152_uro_time_index  			    12'hc01	        //YSYX210152_User read only, a shadow of YSYX210152_Machine mode time
`define YSYX210152_uro_instret_index 		    12'hc02         //YSYX210152_User read only, a shadow of instruction retired counter
`define YSYX210152_uro_hpmcounter3_index		12'hc03         //YSYX210152_User read only, performance counter3
`define YSYX210152_uro_hpmcounter4_index 	    12'hc04         //YSYX210152_User read only, performance counter4
`define YSYX210152_urw_halt_index               12'hcc0         //halt pulse generate csr, write to this csr will cause a halt (for ysyx difftest use) 
`define YSYX210152_urw_print_index              12'hcc1         //print function generate csr, value write to this csr will display on YSYX210152_Simulation tool
//   YSYX210152_Supervisior mode read and write
`define YSYX210152_srw_sstatus_index			12'h100
`define YSYX210152_srw_sie_index 			    12'h104
`define YSYX210152_srw_stvec_index 			    12'h105
`define YSYX210152_srw_scounteren_index 		12'h106
`define YSYX210152_srw_sscratch_index 		    12'h140
`define YSYX210152_srw_sepc_index 			    12'h141
`define YSYX210152_srw_scause_index 			12'h142
`define YSYX210152_srw_stval_index 			    12'h143
`define YSYX210152_srw_sip_index 			    12'h144
`define YSYX210152_srw_satp_index 			    12'h180
//    YSYX210152_Machine mode read only
`define YSYX210152_mro_mvendorid_index 		    12'hf11
`define YSYX210152_mro_marchid_index 		    12'hf12
`define YSYX210152_mro_mimp_index 			    12'hf13
`define YSYX210152_mro_mhardid_index 		    12'hf14
`define YSYX210152_mrw_mstatus_index 		    12'h300
`define YSYX210152_mro_misa_index 			    12'h301
`define YSYX210152_mrw_evangelion_index         12'hbc0         //YSYX210152_Machine mode read/write, this csr is for sepecial use 
`define YSYX210152_mrw_kernelcfg_index          12'hbc1         //YSYX210152_Machine mode read/write, this csr is set to control some modules in kernel
//     YSYX210152_Machine mode read and write
`define YSYX210152_mrw_medeleg_index 		    12'h302
`define YSYX210152_mrw_mideleg_index 		    12'h303	
`define YSYX210152_mrw_mie_index 			    12'h304
`define YSYX210152_mrw_mtvec_index 			    12'h305
`define YSYX210152_mrw_mcounteren_index 		12'h306
`define YSYX210152_mrw_mscratch_index 		    12'h340
`define YSYX210152_mrw_mepc_index 			    12'h341
`define YSYX210152_mrw_mcause_index 			12'h342
`define YSYX210152_mrw_mtval_index 			    12'h343
`define YSYX210152_mrw_mip_index 			    12'h344
`define YSYX210152_mrw_pmpcfg0_index 		    12'h3a0
`define YSYX210152_mrw_pmpaddr0_index 		    12'h3b0
`define YSYX210152_mrw_pmpaddr1_index 		    12'h3b1
`define YSYX210152_mrw_mcycle_index 			12'hb00
`define YSYX210152_mrw_minstret_index 		    12'hb02
`define YSYX210152_mrw_mhpcounter3_index 	    12'hb03
`define YSYX210152_mrw_mhpcounter4_index	 	12'hb04
`define YSYX210152_mrw_mcountinhibit_index      12'h320
`define YSYX210152_mrw_mhpmevent3_index 		12'h323

//----------Async maskable interrupt---------
`define YSYX210152_int_s_soft                   'd1             //s-mode software interrupt
`define YSYX210152_int_m_soft                   'd3             //m-mode software interrupt
`define YSYX210152_int_s_timer                  'd5
`define YSYX210152_int_m_timer                  'd7
`define YSYX210152_int_s_exter                  'd9
`define YSYX210152_int_m_exter                  'd11
//-----------None maskable interrupt---------
`define YSYX210152_nmi_PwrLost                  'd17            //power lost
`define YSYX210152_nmi_EccErr                   'd18            //Ecc error
`define YSYX210152_nmi_generic                  'd19            //NMI for general purpose use
//----------Sync exception-----------------
`define YSYX210152_exc_InstrAddrMis             'd0
`define YSYX210152_exc_InstrAccFlt              'd1
`define YSYX210152_exc_illins                   'd2
`define YSYX210152_exc_BreakPoint               'd3
`define YSYX210152_exc_LoadAddrMis              'd4
`define YSYX210152_exc_LoadAccFlt               'd5
`define YSYX210152_exc_StoreAddrMis             'd6
`define YSYX210152_exc_StoreAccFlt              'd7
`define YSYX210152_exc_EcallFromU               'd8
`define YSYX210152_exc_EcallFromS               'd9
`define YSYX210152_exc_EcallFromM               'd11
`define YSYX210152_exc_InstrPageFlt             'd12
`define YSYX210152_exc_LoadPageFlt              'd13
`define YSYX210152_exc_StorePageFlt             'd15
//---------------------------------Sv39CT defines-----------------------------------
`define YSYX210152_Sv39_V 			            0
`define YSYX210152_Sv39_R			            1
`define YSYX210152_Sv39_W			            2
`define YSYX210152_Sv39_X			            3
`define YSYX210152_Sv39_U			            4
`define YSYX210152_Sv39_G			            5
`define YSYX210152_Sv39_A			            6
`define YSYX210152_Sv39_D 			            7
`define YSYX210152_Sv39_C			            63                          //can be cache
`define YSYX210152_Sv39_T			            62                          //write Through
`define YSYX210152_Sv39_Bare                    4'h0
`define YSYX210152_Sv39_On                      4'h8
//-----------------------------------TLB & MMU modules commands----------------------------
`define YSYX210152_TLB_CMD_NOP                  8'h00
`define YSYX210152_TLB_CMD_rLUT                 8'h01
`define YSYX210152_TLB_CMD_wLUT                 8'h02
`define YSYX210152_TLB_CMD_xLUT                 8'h03
`define YSYX210152_TLB_CMD_FLUSH                8'h05
`define YSYX210152_TLB_RPL_NOP                  8'h00
`define YSYX210152_TLB_RPL_rPERR                8'h11                   //读页面错误
`define YSYX210152_TLB_RPL_wPERR                8'h12                   //写页面错误
`define YSYX210152_TLB_RPL_xPERR                8'h13                   //执行页面错误
`define YSYX210152_TLB_PRL_RDY                  8'h80
//--------------------------------FIB bus commands-----------------------------------------
`define YSYX210152_FIB_CMD_NOOP                 8'h00
`define YSYX210152_FIB_CMD_SIGR                 8'h01
`define YSYX210152_FIB_CMD_SIGW                 8'h02
`define YSYX210152_FIB_CMD_SEQR                 8'h03
`define YSYX210152_FIB_CMD_SEQW                 8'h04
`define YSYX210152_FIB_CMD_WAPR                 8'h05
`define YSYX210152_FIB_CMD_WAPW                 8'h06
`define YSYX210152_FIB_CMD_AMOR                 8'h07
`define YSYX210152_FIB_CMD_AMOW                 8'h08
`define YSYX210152_FIB_CMD_SEQE                 8'h14
//                        FIB-A extension
`define YSYX210152_FIB_CMD_LR                   8'h20
`define YSYX210152_FIB_CMD_SC                   8'h21
`define YSYX210152_FIB_CMD_AMOSWAP              8'h22
`define YSYX210152_FIB_CMD_AMOADD               8'h23
`define YSYX210152_FIB_CMD_AMOXOR               8'h24 
`define YSYX210152_FIB_CMD_AMOAND               8'h25
`define YSYX210152_FIB_CMD_AMOOR                8'h26
`define YSYX210152_FIB_CMD_MIN                  8'h27
`define YSYX210152_FIB_CMD_MAX                  8'h28
`define YSYX210152_FIB_CMD_MINU                 8'h29
`define YSYX210152_FIB_CMD_MAXU                 8'h2A
//                         FIB reply
`define YSYX210152_FIB_RPL_NOOP                 8'h00
`define YSYX210152_FIB_RPL_TRDY                 8'h10                   //Transmission Ready
`define YSYX210152_FIB_RPL_SEQ                  8'h14
`define YSYX210152_FIB_RPL_MODF                 8'h20                   //Modify Data (if have)
`define YSYX210152_FIB_RPL_TERR                 8'hF0
`define YSYX210152_FIB_RPL_IDLE                 8'hFF
//----------------------------------IDU instructions---------------------------------------

//-----------------------------------ALU operation defines---------------------------------
`define YSYX210152_ALU_NOP         8'h00                       //No operation, nothing happen
`define YSYX210152_ALU_JAL         8'h03                       //rd_data <= pc+4
`define YSYX210152_ALU_CSRW        8'h04                       //if(ds1==ds2) BPflt <= 0; else BPflt <= 1
`define YSYX210152_ALU_CSRS        8'h05
`define YSYX210152_ALU_CSRC        8'h06
`define YSYX210152_ALU_ADD         8'h08
`define YSYX210152_ALU_SUB         8'h0F
`define YSYX210152_ALU_SLT         8'h09
`define YSYX210152_ALU_XOR         8'h0A
`define YSYX210152_ALU_OR          8'h0B
`define YSYX210152_ALU_AND         8'h0C
`define YSYX210152_ALU_SL          8'h0D
`define YSYX210152_ALU_SR          8'h0E
//       some shits
`define YSYX210152_ALU_BCDADD      8'h10
`define YSYX210152_ALU_BCDMIN      8'h11
`define YSYX210152_ALU_BCDADJ      8'h12
`define YSYX210152_ALU_BCDIADJ     8'h13
//--------------------------------LSU operation defines-------------------------------------
//-------------------------------
`define YSYX210152_LSU_NOP         8'h00
`define YSYX210152_LSU_eXecute     8'h01   //Abandoned
`define YSYX210152_LSU_READ        8'h02
`define YSYX210152_LSU_WRITE       8'h03
`define YSYX210152_LSU_TLBRef      8'h06                       //TLB entry refersh
`define YSYX210152_LSU_CacheRef    8'h07                       //Cache refersh (write back all modification and disvalid)
//RV-A
`define YSYX210152_LSU_READ_Lock   8'h20   //Abandoned                    //Read from memory, and Lock the bus LR
`define YSYX210152_LSU_WRITE_Unloc 8'h21   //Abandoned                    //Write to memory, and release bus  SC
`define YSYX210152_LSU_AMOSWAP     8'h22
`define YSYX210152_LSU_AMOADD      8'h23
`define YSYX210152_LSU_AMOXOR      8'h24
`define YSYX210152_LSU_AMOAND      8'h25
`define YSYX210152_LSU_AMOOR       8'h26
`define YSYX210152_LSU_AMOMAX      8'h27
`define YSYX210152_LSU_AMOMIN      8'h28
`define YSYX210152_LSU_AMOMAXU     8'h29
`define YSYX210152_LSU_AMOMINU     8'h2A
//--------------------------------Mcop operation defines-----------------------------------
`define YSYX210152_Mcop_NOP        8'h00
`define YSYX210152_Mcop_MUL        8'h01
`define YSYX210152_Mcop_MULH       8'h02
`define YSYX210152_Mcop_MULHS      8'h03
`define YSYX210152_Mcop_DIV        8'h04
`define YSYX210152_Mcop_REM        8'h05
//--------------------------------Operation Information Defines----------------------------
`define YSYX210152_Sign64          2'b00                       //Sign extension, 64bit operation
`define YSYX210152_Sign32          2'b10                       //Sign extension, 32bit operation
`define YSYX210152_Unsign64        2'b01                       //Unsign ............
`define YSYX210152_Unsign32        2'b11                       //Unsign ............
`timescale 1ns/100ps

/************************************************************************************

 *    author : Jacl
 *    e-mail : 2320025806@qq.com
 *    date   : 20210109
 *    desc   : PRV564S config file
 *    version: 0.0

 __  __                   __           __         
/\ \/\ \                 /\ \__       /\ \        
\ \ \ \ \    ___     ____\ \ ,_\   ___\ \ \/'\    
 \ \ \ \ \  / __`\  /',__\\ \ \/  / __`\ \ , <    
  \ \ \_/ \/\ \L\ \/\__, `\\ \ \_/\ \L\ \ \ \\`\  
   \ `\___/\ \____/\/\____/ \ \__\ \____/\ \_\ \_\
    `\/__/  \/___/  \/___/   \/__/\/___/  \/_/\/_/

************************************************************************************/
/***********************************************************************************
                            注意事项
Cacheable Block设置方式：
    当地址和地址掩码（Cacheable_MASK）做与运算后，所得地址若等于Cacheable_ADDR则当前地址块
    可以被缓存。如当Cacheable_MASK=0xFFFF_FFFF_8000_0000,YSYX210152_Cacheable_ADDR=0x0000_0000_8000_0000时
    地址0x0000_0000_8000_0000~0x0000_0000_8FFF_FFFF是可缓存区段
同理设定SFR 地址块
***********************************************************************************/



`define YSYX210152_XLEN                    64                          //RV64 YES!
`define YSYX210152_TLB_switch              1                           //TLB  YES!
`define YSYX210152_ITLB_entry_NUM          16
`define YSYX210152_DTLB_entry_NUM          16
`define YSYX210152_DCacheForceInhibit      1                           //DCache force inhibit (InhibitDCache bit in kernel cfg is set to this value, can be change by software later)
`define YSYX210152_ICacheForceInhibit      1                           //ICache force inhibit (as up)
`define YSYX210152_CacheWTDefaultSwitch    1                           //DCache force write through mode default value
`define YSYX210152_PADR                    32
`define YSYX210152_Simulation              0                           //If 1, the files are YSYX210152_Simulation-use
`define YSYX210152_L1_switch               0                           //If 1, Cache is used; if 0 , ITCM is used
`define YSYX210152_Mcop_switch             1                           //If 1, Math coprocessor is used, if 0, no math-coprocessor
`define YSYX210152_PC_reset                64'h0000_0000_3000_0000
`define YSYX210152_Cacheable_MASK          64'hFFFF_FFFF_8000_0000     // If Address & YSYX210152_Cacheable_MASK = YSYX210152_Cacheable_ADDR, then the space can be cache
`define YSYX210152_Cacheable_ADDR          64'h0000_0000_8000_0000
`define YSYX210152_SFR_ADDR_MASK           64'hFFFF_FFFF_FFFF_0000     // If Address & YSYX210152_SFR_ADDR_MASK = YSYX210152_SFR_ADDR_SEG, the address is in SFR segment
`define YSYX210152_SFR_ADDR_SEG            64'h0000_0000_0200_0000
`define YSYX210152_SFR_MTIME_ADDR          64'h0000_0000_0200_BFF8
`define YSYX210152_SFR_MTIMECMP_ADDR       64'h0000_0000_0200_4000
`define YSYX210152_SFR_MSOFTINT_ADDR       64'h0000_0000_0200_4008

`define YSYX210152_AXI_DIFF 0
`define YSYX210152_DEBUG_RUN 0
//`define WAVEDUMP
//`define STUCK_AUTO_STOP


















module ysyx_210152_TLBcore#(
	parameter TLB_entry_NUM = 16				
)(

    input wire          TLBi_CLK,               
    input wire          TLBi_ARST,              

    input wire          TLBi_access,            
    input wire          TLBi_writeCHK,          
    input wire          TLBi_refersh,           
    input wire          TLBi_replace,           

    input wire [43:0]   TLBi_PPN,               
    input wire [9:0]    TLBi_PTE,               
    input wire [1:0]    TLBi_PageSize,          
    input wire [26:0]   TLBi_VPN,               

    output wire [43:0]  TLBo_PPN,               
    output wire [9:0]   TLBo_PTE,               
    output wire         TLBo_miss               

);

    wire [TLB_entry_NUM - 1:0] Entryo_valid;
	wire [43:0]                Entryo_PPN_tem [TLB_entry_NUM - 1:0] ;	
	wire [9:0]                 Entryo_PTE_tem [TLB_entry_NUM - 1:0] ;	
    wire [43:0]                Entryo_PPN     [TLB_entry_NUM - 1:0];
    wire [9:0]                 Entryo_PTE     [TLB_entry_NUM - 1:0];     
	wire [43:0]                TLBo_PPN_tem   [TLB_entry_NUM - 1:0];
	wire [9:0]                 TLBo_PTE_tem   [TLB_entry_NUM - 1:0];            
    wire [TLB_entry_NUM - 1:0] Entryo_hit;

    wire [TLB_entry_NUM - 1:0] Entryi_replace;

    reg  [7:0]                 Entry_replace_counter;

    genvar i;
    generate 
        for(i = 0; i < TLB_entry_NUM; i=i+1)
            begin:TLBEntrys
            ysyx_210152_TLB_entry TLB_entry(
                .CLK            (TLBi_CLK),
                .ARST           (TLBi_ARST),
                .refersh        (TLBi_refersh),
                .access         (TLBi_access),
                .write          (TLBi_writeCHK),
                .VPNi           (TLBi_VPN),
                .valid          (Entryo_valid[i]),
                .PTE_out        (Entryo_PTE_tem[i]),
                .PPN_out        (Entryo_PPN_tem[i]),		
                .hit            (Entryo_hit[i]),            
                .PPN_in         (TLBi_PPN),
                .PTE_in         (TLBi_PTE),
                .PTEsize_in     (TLBi_PageSize),
                .replace        (Entryi_replace[i])
            );
			assign Entryo_PPN[i] = (Entryo_hit[i]) ? Entryo_PPN_tem[i] : 44'd0;
			assign Entryo_PTE[i] = (Entryo_hit[i]) ? Entryo_PTE_tem[i] : 10'd0;					
			end	
    endgenerate



genvar k,l;
generate 
	for(l=0;l<44;l=l+1)
    begin:TLB_output_PPN_sel1
		assign TLBo_PPN_tem[0][l] = Entryo_PPN[0][l];
		for(k=1;k < TLB_entry_NUM;k=k+1) begin:TLB_output_PPN_sel2
			assign TLBo_PPN_tem[k][l] = TLBo_PPN_tem[k-1][l] | Entryo_PPN[k][l];
			end
		assign TLBo_PPN[l] = TLBo_PPN_tem[TLB_entry_NUM -1][l];
	end
endgenerate


genvar m,n;
generate 
	for(n=0;n<10;n=n+1)
    begin:TLB_output_PTW_sel1
		assign TLBo_PTE_tem[0][n] = Entryo_PTE[0][n];
		for(m=1;m < TLB_entry_NUM ; m=m+1) begin:TLB_output_PTW_sel2
			assign TLBo_PTE_tem[m][n] = TLBo_PTE_tem[m-1][n] | Entryo_PTE[m][n];
			end
		assign TLBo_PTE[n] = TLBo_PTE_tem[TLB_entry_NUM -1][n];
		
	end
endgenerate

assign TLBo_miss = TLBi_access & !(|Entryo_hit);                 



always@(posedge TLBi_CLK or posedge TLBi_ARST)begin
	if(TLBi_ARST) begin
		Entry_replace_counter <= 'h0;
	end
	else if(TLBi_replace)begin
        if(Entry_replace_counter==(TLB_entry_NUM-1))begin       
            Entry_replace_counter <= 'h0;
        end
        else begin                                              
		    Entry_replace_counter <= Entry_replace_counter + 'h1;
        end
    end
end

genvar j;
generate
    for(j=0; j<TLB_entry_NUM; j=j+1)begin:Replace_generate
        assign Entryi_replace[j] = TLBi_replace & (Entry_replace_counter==j);
    end
endgenerate



endmodule

module ysyx_210152_TLB_entry(

    input wire          CLK,
    input wire          ARST,



    input wire          refersh,
    input wire          access,
    input wire          write,

    input wire [26:0]   VPNi,           

    output reg          valid,
    output reg [9:0]    PTE_out,		
    output reg [43:0]   PPN_out,		
    output reg          hit,            

    input wire [43:0]   PPN_in,
    input wire [1:0]    PTEsize_in,     
    input wire [9:0]    PTE_in,		    

    input wire          replace		    
);

    reg [26:0]  VPN;		                
    reg [43:0]  PPN;                        
    reg [1:0]   PageSize;


always@(posedge CLK or posedge ARST)begin
	if(ARST)begin
		valid	<=	1'b0;
	end
    else if(refersh)begin
        valid <= 1'b0;
    end
    else if(hit & write & !PTE_out[`YSYX210152_Sv39_D])begin
        valid <= 1'b0;
    end
	else if(replace)begin
		valid	<=	1'b1;
	end
    
end

always@(posedge CLK or posedge ARST)begin
	if(ARST)begin
		PTE_out 	<=	10'b0;
		PPN		    <=	44'b0;
		VPN			<=	27'b0;
        PageSize    <= 2'b00;
	end
	else if(replace)begin
		PTE_out 	<=	PTE_in;
		PPN		    <=	PPN_in;
		VPN			<=	VPNi;
        PageSize    <= PTEsize_in;
	end
    
end

always@(*)begin
    if(access & valid)begin
        case(PageSize)
            2'b00 :             
            begin
                hit     = (VPNi==VPN) & !(write & !PTE_out[`YSYX210152_Sv39_D]);
                PPN_out = PPN;
            end
            2'b01 :             
            begin
                hit     = (VPNi[26:9]==VPN[26:9]) & !(write & !PTE_out[`YSYX210152_Sv39_D]);
                PPN_out = {PPN[43:9],VPNi[8:0]};
            end
            2'b10 :             
            begin
                hit     = (VPNi[26:18]==VPN[26:18]) & !(write & !PTE_out[`YSYX210152_Sv39_D]);
                PPN_out = {PPN[43:18],VPNi[17:0]};
            end
            default :
            begin
                hit     = 1'b0;
                PPN_out = PPN;
            end
        endcase
    end
    else begin
        hit     = 1'b0;
        PPN_out = PPN;
    end
end

endmodule












module ysyx_210152_PageCheck(

    input wire [1:0]CSR_priv,           
    input wire      CSR_mxr,            
    input wire      CSR_sum,            

    input wire      OP_read,            
    input wire      OP_write,
    input wire      OP_execute,


    input wire      PTE_U,
    input wire      PTE_W,
    input wire      PTE_R,
    input wire      PTE_X,
    input wire      PTE_D,


    output wire     check_ok

);


wire privilege_check_ok;


wire read_check;

wire write_check;

wire execute_check;

assign privilege_check_ok	=	((CSR_priv==`YSYX210152_User) & PTE_U) | 		
								((CSR_priv==`YSYX210152_Supervisior) & PTE_U & CSR_sum) | 	
								(CSR_priv==`YSYX210152_Supervisior) & !PTE_U | 			
								(CSR_priv==`YSYX210152_Machine);
								
assign read_check	=	OP_read & PTE_R | OP_read & PTE_X & CSR_mxr;
assign write_check	=	OP_write & PTE_W;
assign execute_check=	OP_execute & PTE_X;

assign check_ok	=	privilege_check_ok & (read_check | write_check | execute_check);

endmodule








module ysyx_210152_csa(
    input wire[127:0] x,
    input wire[127:0] y,
    input wire[127:0] z,
    output wire[127:0] s,
    output wire[127:0] c
);
    genvar i;
    generate
        for (i=0; i<128; i=i+1)
        begin: haha
            assign s[i] = x[i] ^ y[i] ^ z[i];
            assign c[i] = (x[i] & y[i]) | (y[i] & z[i]) | (z[i] & x[i]);
        end
    endgenerate
endmodule











module ysyx_210152_booth2(
    input wire[64:0] x, 
    input wire[2:0] y, 
    output reg[127:0] z, 
    output reg[1:0] c 
);
    wire[64:0] x_comp;
    assign x_comp = ~x;
    always @(*) begin
        case(y)
        3'b011: begin
            z = {{62{x[64]}}, x, 1'b0};
            c = 2'b00;
        end
        3'b100: begin
            z = {{62{x_comp[64]}}, x_comp, 1'b0};
            c = 2'b10;
        end
        3'b001, 3'b010: begin
            z = {{63{x[64]}}, x};
            c = 2'b00;
        end
        3'b101, 3'b110: begin
            z = {{63{x_comp[64]}}, x_comp};
            c = 2'b01;
        end
        default: begin
            z = 128'b0;
            c = 2'b00;
        end
        endcase
    end
endmodule













module ysyx_210152_TLB
#(
    parameter TLB_entry_NUM = 16
)(
    
    input wire              TLBi_CLK,
    input wire              TLBi_ARST,
    input wire              TLBi_ModifyPermit,      
    input wire              TLBi_pipflush,
    input wire              TLBi_refersh,           
    input wire [1:0]        TLBi_privilege,
    input wire              TLBi_CSR_mxr,
    input wire              TLBi_CSR_sum,

    input  wire             TLBi_valid,         
    input  wire [7:0]       TLBi_Opcode,        
    input  wire [`YSYX210152_XLEN-1:0] TLBi_DATA_VA,       

    output  reg             TLBo_valid,
    output  reg             TLBo_LoadPageFlt,
    output  reg             TLBo_StorePageFlt,
    output  reg             TLBo_InstPageFlt,
    output  reg [`YSYX210152_XLEN-1:0] TLBo_DATA_PA,        
    output  reg             TLBo_DATA_Cacheable, 
    output  reg             TLBo_DATA_WrThrough, 

    output reg [7:0]        PTWi_CMD,           
    output reg              PTWi_V,             
    output reg [3:0]        PTWi_WalkID,        
    output reg [26:0]       PTWi_VPN,           
    input wire              PTWo_FULL,          

    input wire [43:0]       PTWo_PPN,           
    input wire [7:0]        PTWo_RPL,
    input wire [3:0]        PTWo_WalkID,
    input wire              PTWo_V,
    input wire [9:0]        PTWo_PTE,           
    input wire [1:0]        PTWo_PageSize,      
    output reg              PTWi_RDEN           
);
/***********************************************************************
    阅读这份代码前你需要知道的：
    * PTW： Page Table Walker ： 负责遍历页表的打工仔

************************************************************************/

    reg         TLB_access;                     
    reg         Page_writeCHK, Page_readCHK, Page_eXeCHK;
    wire        page_checkOK;

    reg         TLB_replace;                    
    wire [9:0]  TLB_PTE;
    wire [43:0] TLB_PPN;

    wire        TLB_miss;
    reg         ErrorPage_write;                

    reg         ErrorPageV;
    reg [26:0]  ErrorVPN;
    reg [7:0]   ErrorType;


    reg         PTW_working_clear;              
    reg         PTW_working;                    
    reg [3:0]   PTW_workingID;                  
    reg [26:0]  PTW_WorkingVPN;                 

always@(posedge TLBi_CLK or posedge TLBi_ARST)begin
    if(TLBi_ARST)begin
        PTW_working <= 1'b0;
    end
    else if(TLBi_pipflush)begin                 
        PTW_working <= 1'b0;
    end
    else if(PTWi_V)begin                        
        PTW_working     <= 1'b1;
        PTW_WorkingVPN  <= PTWi_VPN;            
    end
    else if(PTW_working_clear)begin             
        PTW_working     <= 1'b0;
        PTW_workingID   <= PTW_workingID + 'd1; 
    end
end

always@(*)begin
    if(TLBi_valid)begin                                                   
        case(TLBi_Opcode)
            `YSYX210152_LSU_eXecute:
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b0;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b1;
            end
            `YSYX210152_LSU_READ   :
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b0;
                Page_readCHK = 1'b1;
                Page_eXeCHK  = 1'b0;
            end
            `YSYX210152_LSU_WRITE  :
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b1;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b0;
            end
            `YSYX210152_LSU_READ_Lock:
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b0;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b0; 
            end
            `YSYX210152_LSU_WRITE_Unloc:
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b1;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b0;    
            end
            `YSYX210152_LSU_AMOSWAP:
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b1;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b0;    
            end
            `YSYX210152_LSU_AMOADD:
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b1;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b0; 
            end
            `YSYX210152_LSU_AMOXOR:
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b1;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b0;    
            end
            `YSYX210152_LSU_AMOAND:
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b1;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b0;    
            end
            `YSYX210152_LSU_AMOOR:
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b1;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b0;      
            end
            `YSYX210152_LSU_AMOMAX:
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b1;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b0;     
            end
            `YSYX210152_LSU_AMOMIN:
            begin
                TLB_access  = 1'b1;
                Page_writeCHK= 1'b1;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b0;     
            end
            default:
            begin
                TLB_access  = 1'b0;
                Page_writeCHK= 1'b0;
                Page_readCHK = 1'b0;
                Page_eXeCHK  = 1'b0;
            end
        endcase
    end
    else begin
        TLB_access  = 1'b0;
        Page_writeCHK= 1'b0;
        Page_readCHK = 1'b0;
        Page_eXeCHK  = 1'b0;
    end
end

always@(*)begin
    if(!PTW_working & TLBi_ModifyPermit)begin                               
        if(TLBo_InstPageFlt | TLBo_LoadPageFlt | TLBo_StorePageFlt)begin    
            PTWi_V      = 1'b0;
            PTWi_VPN    = 'hx;
            PTWi_CMD    = `YSYX210152_TLB_CMD_NOP;
            PTWi_WalkID = PTW_workingID;
        end
        else if(TLB_miss & !PTWo_FULL)begin          
            case(TLBi_Opcode)
                `YSYX210152_LSU_eXecute:
                begin
                    PTWi_V      = 1'b1;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = `YSYX210152_TLB_CMD_xLUT;
                    PTWi_WalkID = PTW_workingID;
                end
                `YSYX210152_LSU_READ   :
                begin
                    PTWi_V      = 1'b1 ;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = `YSYX210152_TLB_CMD_rLUT;
                    PTWi_WalkID = PTW_workingID;
                end
                `YSYX210152_LSU_WRITE  :
                begin
                    PTWi_V      = 1'b1;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = `YSYX210152_TLB_CMD_wLUT;
                    PTWi_WalkID = PTW_workingID;
                end
                `YSYX210152_LSU_READ_Lock:
                begin
                    PTWi_V      = TLB_miss ? 1'b1 : 1'b0;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = TLB_miss ? `YSYX210152_TLB_CMD_rLUT : `YSYX210152_TLB_CMD_NOP;
                    PTWi_WalkID = PTW_workingID;
                end
                `YSYX210152_LSU_WRITE_Unloc:
                begin
                    PTWi_V      = 1'b1;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = `YSYX210152_TLB_CMD_wLUT;
                    PTWi_WalkID = PTW_workingID;
                end
                `YSYX210152_LSU_AMOSWAP:
                begin
                    PTWi_V      = 1'b1;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = `YSYX210152_TLB_CMD_wLUT;
                    PTWi_WalkID = PTW_workingID;
                end
                `YSYX210152_LSU_AMOADD:
                begin
                    PTWi_V      = 1'b1;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = `YSYX210152_TLB_CMD_wLUT;
                    PTWi_WalkID = PTW_workingID;
                end
                `YSYX210152_LSU_AMOXOR:
                begin
                    PTWi_V      = 1'b1;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = `YSYX210152_TLB_CMD_wLUT;
                    PTWi_WalkID = PTW_workingID;
                end
                `YSYX210152_LSU_AMOAND:
                begin
                    PTWi_V      = 1'b1;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = `YSYX210152_TLB_CMD_wLUT;
                    PTWi_WalkID = PTW_workingID;
                end
                `YSYX210152_LSU_AMOOR:
                begin
                    PTWi_V      = 1'b1;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = `YSYX210152_TLB_CMD_wLUT;
                    PTWi_WalkID = PTW_workingID;
                end
                `YSYX210152_LSU_AMOMAX:
                begin
                    PTWi_V      = 1'b1;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = `YSYX210152_TLB_CMD_wLUT;
                    PTWi_WalkID = PTW_workingID;
                end
                `YSYX210152_LSU_AMOMIN:
                begin
                    PTWi_V      = 1'b1;
                    PTWi_VPN    = TLBi_DATA_VA[38:12];
                    PTWi_CMD    = `YSYX210152_TLB_CMD_wLUT;
                    PTWi_WalkID = PTW_workingID;
                end
                default:
                begin
                    PTWi_V      = 1'b0;
                    PTWi_VPN    = 'hx;
                    PTWi_CMD    = 'hx;
                    PTWi_WalkID = PTW_workingID;
                end
            endcase
        end
        else begin
            PTWi_V      = 1'b0;
            PTWi_VPN    = 'hx;
            PTWi_CMD    = 'hx;
            PTWi_WalkID = PTW_workingID;
        end
    end
    else begin
        PTWi_V      = 1'b0;
        PTWi_VPN    = 'hx;
        PTWi_CMD    = 'hx;
        PTWi_WalkID = PTW_workingID;
    end
end

always@(*)begin
    if(PTWo_V)begin
        if(PTW_working & (PTWo_WalkID==PTW_workingID))begin    
            case(PTWo_RPL)
                `YSYX210152_TLB_PRL_RDY :
                begin
                    PTWi_RDEN       = 1'b1;
                    TLB_replace     = (TLB_miss&(PTW_WorkingVPN==TLBi_DATA_VA[38:12])) ? 1'b1 : 1'b0;
                    ErrorPage_write = 1'b0;                        
                end
                `YSYX210152_TLB_RPL_xPERR:
                begin
                    PTWi_RDEN       = 1'b1;
                    TLB_replace     = 1'b0;
                    ErrorPage_write = 1'b1;
                end
                `YSYX210152_TLB_RPL_rPERR:
                begin
                    PTWi_RDEN       = 1'b1;
                    TLB_replace     = 1'b0;
                    ErrorPage_write = 1'b1;
                end
                `YSYX210152_TLB_RPL_wPERR:
                begin
                    PTWi_RDEN       = 1'b1;
                    TLB_replace     = 1'b0;
                    ErrorPage_write = 1'b1; 
                end
                default:
                begin
                    PTWi_RDEN       = 1'b1;
                    TLB_replace     = 1'b0;
                    ErrorPage_write = 1'b0;
                end
            endcase
        end
        else begin                          
            PTWi_RDEN       = 1'b1;
            TLB_replace     = 1'b0;
            ErrorPage_write = 1'b0;
        end
    end
    else begin                              
        PTWi_RDEN       = 1'b0;
        TLB_replace     = 1'b0;
        ErrorPage_write = 1'b0;
    end
end
always@(*)begin
    if(PTWo_V & PTW_working & (PTWo_WalkID==PTW_workingID))begin    
        PTW_working_clear = 1'b1;
    end
    else begin
        PTW_working_clear = 1'b0;
    end
end


always@(posedge TLBi_CLK or posedge TLBi_ARST)begin
    if(TLBi_ARST)begin
        ErrorPageV<= 1'b0;
    end
    else if(TLBi_refersh)begin
        ErrorPageV<= 1'b0;
    end
    else if(ErrorPage_write)begin
        ErrorPageV<= 1'b1;
        ErrorVPN <= PTW_WorkingVPN;
        ErrorType<= PTWo_RPL;
    end
end

ysyx_210152_TLBcore#(.TLB_entry_NUM (TLB_entry_NUM))TLBcore(

    .TLBi_CLK               (TLBi_CLK),               
    .TLBi_ARST              (TLBi_ARST),              

    .TLBi_access            (TLB_access),            
    .TLBi_writeCHK          (Page_writeCHK),
    .TLBi_refersh           (TLBi_refersh),           
    .TLBi_replace           (TLB_replace),           

    .TLBi_PPN               (PTWo_PPN),               
    .TLBi_PTE               (PTWo_PTE),               
    .TLBi_PageSize          (PTWo_PageSize),          
    .TLBi_VPN               (TLBi_DATA_VA[38:12]),    

    .TLBo_PPN               (TLB_PPN),               
    .TLBo_PTE               (TLB_PTE),               
    .TLBo_miss              (TLB_miss)               
);
ysyx_210152_PageCheck           ATU_PageCheck(

    .CSR_priv               (TLBi_privilege),      
    .CSR_mxr                (TLBi_CSR_mxr),            
    .CSR_sum                (TLBi_CSR_sum),            

    .OP_read                (Page_readCHK),
    .OP_write               (Page_writeCHK),
    .OP_execute             (Page_eXeCHK),
    .PTE_U                  (TLB_PTE[`YSYX210152_Sv39_U]),
    .PTE_W                  (TLB_PTE[`YSYX210152_Sv39_W]),
    .PTE_R                  (TLB_PTE[`YSYX210152_Sv39_R]),
    .PTE_X                  (TLB_PTE[`YSYX210152_Sv39_X]),
    .PTE_D                  (TLB_PTE[`YSYX210152_Sv39_D]),
    .check_ok               (page_checkOK)
);


always@(*)begin
    if(TLBi_valid)begin
        if((TLBi_DATA_VA[38:12]==ErrorVPN) & ErrorPageV)begin       
            TLBo_valid          = 1'b1;
            TLBo_LoadPageFlt    = (ErrorType==`YSYX210152_TLB_RPL_rPERR);
            TLBo_StorePageFlt   = (ErrorType==`YSYX210152_TLB_RPL_wPERR);
            TLBo_InstPageFlt    = (ErrorType==`YSYX210152_TLB_RPL_xPERR);
            TLBo_DATA_PA        = 'h0;
            TLBo_DATA_Cacheable = 'b0;
            TLBo_DATA_WrThrough = 'b0;
        end
        else if(TLB_miss)begin              
            TLBo_valid          = 1'b0;
            TLBo_LoadPageFlt    = 1'b0;
            TLBo_StorePageFlt   = 1'b0;
            TLBo_InstPageFlt    = 1'b0;
            TLBo_DATA_PA        = 'h0;
            TLBo_DATA_Cacheable = 'b0;
            TLBo_DATA_WrThrough = 'b0;
        end
        else if(!page_checkOK)begin         
            TLBo_valid          = 1'b1;
            TLBo_LoadPageFlt    = Page_readCHK;
            TLBo_StorePageFlt   = Page_writeCHK;
            TLBo_InstPageFlt    = Page_eXeCHK;
            TLBo_DATA_PA        = 'h0;
            TLBo_DATA_Cacheable = 'b0;
            TLBo_DATA_WrThrough = 'b0;
        end
        else begin
            TLBo_valid          = 1'b1;
            TLBo_LoadPageFlt    = 1'b0;
            TLBo_StorePageFlt   = 1'b0;
            TLBo_InstPageFlt    = 1'b0;
            TLBo_DATA_PA        = {8'b0,TLB_PPN,TLBi_DATA_VA[11:0]};
            TLBo_DATA_Cacheable = 1'b0;
            TLBo_DATA_WrThrough = 1'b0; 
        end
    end
    else begin              
        TLBo_valid          = 1'b0;
        TLBo_LoadPageFlt    = 1'b0;
        TLBo_StorePageFlt   = 1'b0;
        TLBo_InstPageFlt    = 1'b0;
        TLBo_DATA_PA        = 'h0;
        TLBo_DATA_Cacheable = 'b0;
        TLBo_DATA_WrThrough = 'b0;
    end
end


endmodule












module ysyx_210152_TableEntry(
    input wire              GLB_CLKi,
    input wire              GLB_SRSTi,

    input wire              Tablei_WREN,
    input wire [7:0]        Tablei_WID,
    input wire [`YSYX210152_XLEN-1:0]  Tablei_ADDR,
    input wire [`YSYX210152_XLEN-1:0]  Tablei_PC,
    input wire [7:0]        Tablei_ITAG,
    input wire [1:0]        Tablei_priv,
    input wire [7:0]        Tablei_opcode,
    input wire [1:0]        Tablei_opinfo,
    input wire [3:0]        Tablei_opsize,
    input wire              Tablei_ci,
    input wire              Tablei_InstPageFlt,
    input wire              Tablei_LoadPageFlt,
    input wire              Tablei_StorePageFlt,
    input wire              Tablei_InstAddrmis,
    input wire              Tablei_LoadAddrMis,
    input wire              Tablei_StoreAddrMis,	

    input wire              Tablei_Remove,
    output reg              Tableo_V,
    output reg [`YSYX210152_XLEN-1:0]  Tableo_ADDR,
    output reg [`YSYX210152_XLEN-1:0]  Tableo_PC,
    output reg [7:0]        Tableo_RID,
    output reg [7:0]        Tableo_ITAG,
    output reg [1:0]        Tableo_priv,
    output reg [7:0]        Tableo_opcode,
    output reg [1:0]        Tableo_opinfo,
    output reg [3:0]        Tableo_opsize,
    output reg              Tableo_ci,
    output reg              Tableo_InstPageFlt,
    output reg              Tableo_LoadPageFlt,
    output reg              Tableo_StorePageFlt,
    output reg              Tableo_InstAddrmis,
    output reg              Tableo_LoadAddrMis,
    output reg              Tableo_StoreAddrMis		
);

always@(posedge GLB_CLKi)begin
    if(GLB_SRSTi)begin
        Tableo_V            <= 1'b0;
    end
    else if(Tablei_WREN)begin
        Tableo_V            <= 1'b1;
        Tableo_ADDR         <= Tablei_ADDR;
        Tableo_PC           <= Tablei_PC;
        Tableo_RID          <= Tablei_WID;
        Tableo_ITAG         <= Tablei_ITAG;
        Tableo_priv         <= Tablei_priv;
        Tableo_opcode       <= Tablei_opcode;
        Tableo_opinfo       <= Tablei_opinfo;
        Tableo_opsize       <= Tablei_opsize;
        Tableo_ci           <= Tablei_ci;
        Tableo_InstPageFlt  <= Tablei_InstPageFlt;
        Tableo_LoadPageFlt  <= Tablei_LoadPageFlt;
        Tableo_StorePageFlt <= Tablei_StorePageFlt;
        Tableo_InstAddrmis  <= Tablei_InstAddrmis;
        Tableo_LoadAddrMis  <= Tablei_LoadAddrMis;
        Tableo_StoreAddrMis <= Tablei_StoreAddrMis;		
    end
    else if(Tablei_Remove)begin
        Tableo_V            <= 1'b0;
    end
end

endmodule














module ysyx_210152_PTW
#(
    parameter FIB_ID    = 8'h00
)
(

    input wire              PTWi_CLK,
    input wire              PTWi_ARST,
    input wire [1:0]        PTWi_CSR_privlage,  
    input wire              PTWi_CSR_sum,
    input wire              PTWi_CSR_mxr,
    input wire [43:0]       PTWi_CSR_satpppn,   

    input wire [7:0]        PTWi_CMD,           
    input wire              PTWi_V,             
    input wire [3:0]        PTWi_WalkID,        
    input wire [26:0]       PTWi_VPN,           
    output wire             PTWo_FULL,          

    output reg [43:0]       PTWo_PPN,           
    output reg [7:0]        PTWo_RPL,
    output reg [3:0]        PTWo_WalkID,
    output reg              PTWo_V,
    output reg [9:0]        PTWo_PTE,           
    output reg [1:0]        PTWo_PageSize,      
    input wire              PTWi_RDEN,          

    output reg              PTWo_FIB_WREN,      
    output reg              PTWo_FIB_REQ,       
    input wire              PTWi_FIB_ACK,       
    input wire              PTWi_FIB_FULL,      
    output wire [7:0]       PTWo_FIB_ID,
    output reg  [7:0]       PTWo_FIB_CMD,
    output wire [3:0]       PTWo_FIB_BURST,
    output wire [3:0]       PTWo_FIB_SIZE,
    output reg [`YSYX210152_XLEN-1:0]  PTWo_FIB_ADDR,      
    output reg [`YSYX210152_XLEN-1:0]  PTWo_FIB_DATA,
    input wire [7:0]        PTWi_FIB_ID,
    input wire [7:0]        PTWi_FIB_RPL,
    input wire              PTWi_FIB_V,
    input wire [`YSYX210152_XLEN-1:0]  PTWi_FIB_DATA
);

    localparam stb 	    = 4'h0;	                
    localparam s2_1	    = 4'h1;	                
    localparam s2_2	    = 4'h2;
    localparam s4  	    = 4'h3;	                
    localparam s5  	    = 4'h4;	                
    localparam pte_upd0 = 4'h5;	                
    localparam pte_upd1 = 4'h6;
    localparam ready	= 4'h7;		            
    localparam page_fault= 4'h8;

    reg [7:0]        CMD;                   
    reg              V;                     
    reg [3:0]        WalkID;                
    reg [26:0]       VPN;                   
    reg [1:0]        privlage;              
    reg              sum;
    reg              mxr;
    reg [43:0]       satpppn;               

    reg [3:0]       state;                  
    reg [1:0]       i;
    reg [`YSYX210152_XLEN-1:0] PTE_temp;               
    reg [43:0]      a;                      
    wire            page_checkOK;

always@(posedge PTWi_CLK or posedge PTWi_ARST)begin
    if(PTWi_ARST)begin
        V <= 1'b0;
    end
    else if(V)begin                         
        V <= ((state==page_fault) | (state==ready)) ? 1'b0 : 1'b1;
    end
    else begin
        V           <= PTWi_V;
        CMD         <= PTWi_CMD;               
        WalkID      <= PTWi_WalkID;            
        VPN         <= PTWi_VPN;               
        privlage    <= PTWi_CSR_privlage;      
        sum         <= PTWi_CSR_sum;
        mxr         <= PTWi_CSR_mxr;
        satpppn     <= PTWi_CSR_satpppn;       
    end
end
assign PTWo_FULL = V;                           

always@(posedge PTWi_CLK or posedge PTWi_ARST)begin
    if(PTWi_ARST)begin
        state <= stb;
    end
    else begin
        case(state)
            stb     :   if(V & !PTWo_V)begin        
                            state <= s2_1;
                            i     <= 2'h2;          
                            a     <= satpppn;       
                        end
            s2_1    :   if(PTWi_FIB_ACK & !PTWi_FIB_FULL)begin          
                            state <= s2_2;
                        end
            s2_2    :   if(((PTWi_FIB_ID == FIB_ID)|(PTWi_FIB_ID==8'h00)) & PTWi_FIB_V)begin   
                            case(PTWi_FIB_RPL)
                                `YSYX210152_FIB_RPL_IDLE : state <= s2_1;          
                                `YSYX210152_FIB_RPL_TERR : state <= page_fault;    
                                `YSYX210152_FIB_RPL_TRDY : state <= s4;
                                default       : state <= state;
                            endcase   
                        end
            s4      :   if(!PTE_temp[`YSYX210152_Sv39_V] | !PTE_temp[`YSYX210152_Sv39_R] & PTE_temp[`YSYX210152_Sv39_W])begin
                            state <= page_fault;                    
                        end
                        else if(PTE_temp[`YSYX210152_Sv39_R] | PTE_temp[`YSYX210152_Sv39_X])begin
                            state <= s5;                            
                        end
                        else if(i==2'h0)begin
                            state <= page_fault;                    
                        end
                        else begin: NextPTE                         
                            state <= s2_1;
                            i     <= i - 2'h1;
                            a     <= PTE_temp[53:10];
                        end
            s5      :   if(!page_checkOK)begin
                            state <= page_fault;                    
                        end
                        else if(((i==2'h1)&PTE_temp[18:10]!=9'b0)|((i==2'h2)&PTE_temp[27:10]!=18'b0))begin  
                            state <= page_fault;
                        end
                        else if(!PTE_temp[`YSYX210152_Sv39_A] | (CMD==`YSYX210152_TLB_CMD_wLUT)&!PTE_temp[`YSYX210152_Sv39_D])begin               
                            state <= pte_upd0;
                        end
                        else begin
                            state <= ready;
                        end
            pte_upd0:   state <= pte_upd1;
            pte_upd1:   if(((PTWi_FIB_ID == FIB_ID)|(PTWi_FIB_ID==8'h00)) & PTWi_FIB_V)begin   
                            case(PTWi_FIB_RPL)
                                `YSYX210152_FIB_RPL_IDLE : state <= pte_upd0;          
                                `YSYX210152_FIB_RPL_TERR : state <= page_fault;        
                                `YSYX210152_FIB_RPL_TRDY : state <= ready;
                                default       : state <= state;
                            endcase   
                        end
		    ready:	state <= stb;
            
		    page_fault:	state <= stb;

            default:state <= stb;
        endcase
    end
end

ysyx_210152_PageCheck           PTW_PageCheck(

    .CSR_priv               (privlage),           
    .CSR_mxr                (mxr),            
    .CSR_sum                (sum),            

    .OP_read                (CMD==`YSYX210152_TLB_CMD_rLUT),            
    .OP_write               (CMD==`YSYX210152_TLB_CMD_wLUT),
    .OP_execute             (CMD==`YSYX210152_TLB_CMD_xLUT),
    .PTE_U                  (PTE_temp[`YSYX210152_Sv39_U]),
    .PTE_W                  (PTE_temp[`YSYX210152_Sv39_W]),
    .PTE_R                  (PTE_temp[`YSYX210152_Sv39_R]),
    .PTE_X                  (PTE_temp[`YSYX210152_Sv39_X]),
    .PTE_D                  (PTE_temp[`YSYX210152_Sv39_D]),
    .check_ok               (page_checkOK)
);

always@(posedge PTWi_CLK or posedge PTWi_ARST)begin
    if(PTWi_ARST)begin
        PTE_temp <= 64'h0;
    end
    	
	else if(state==s5)begin
		if(!PTE_temp[`YSYX210152_Sv39_A])begin
            PTE_temp[`YSYX210152_Sv39_A] <= 1'b1;
        end
        if(!PTE_temp[`YSYX210152_Sv39_D] & (CMD==`YSYX210152_TLB_CMD_wLUT))begin
            PTE_temp[`YSYX210152_Sv39_D] <= 1'b1;
        end
	end
	else if(state==s2_2)begin
		PTE_temp <= PTWi_FIB_DATA;
	end
end

always@(posedge PTWi_CLK or posedge PTWi_ARST)begin
    if(PTWi_ARST)begin
        PTWo_V <= 1'b0;
    end
    else if(PTWo_V)begin
        PTWo_V <= PTWi_RDEN ? 1'b0 : PTWo_V;
    end
    else begin
        if(state==ready)begin
            PTWo_V          <= 1'b1;
            PTWo_WalkID     <= WalkID;
            PTWo_RPL        <= `YSYX210152_TLB_PRL_RDY;
            PTWo_PPN        <= PTE_temp[53:10];
            PTWo_PTE        <= PTE_temp[9:0];
            PTWo_PageSize   <= i;
        end
        else if(state==page_fault)begin
            case(CMD)
                `YSYX210152_TLB_CMD_rLUT   :
                begin
                    PTWo_V          <= 1'b1;
                    PTWo_WalkID     <= WalkID;
                    PTWo_RPL        <= `YSYX210152_TLB_RPL_rPERR;
                    PTWo_PPN        <= PTE_temp[53:10];
                    PTWo_PTE        <= PTE_temp[9:0];
                    PTWo_PageSize   <= i;
                end
                `YSYX210152_TLB_CMD_wLUT   :   
                begin 
                    PTWo_V          <= 1'b1;
                    PTWo_WalkID     <= WalkID;
                    PTWo_RPL        <= `YSYX210152_TLB_RPL_wPERR;
                    PTWo_PPN        <= PTE_temp[53:10];
                    PTWo_PTE        <= PTE_temp[9:0];
                    PTWo_PageSize   <= i;
                end 
                `YSYX210152_TLB_CMD_xLUT   :
                begin
                    PTWo_V          <= 1'b1;
                    PTWo_WalkID     <= WalkID;
                    PTWo_RPL        <= `YSYX210152_TLB_RPL_xPERR;
                    PTWo_PPN        <= PTE_temp[53:10];
                    PTWo_PTE        <= PTE_temp[9:0];
                    PTWo_PageSize   <= i;
                end
                default         :
                begin
                    PTWo_V          <= 1'b0;
                    PTWo_WalkID     <= 4'hx;
                    PTWo_RPL        <= 8'hx;
                    PTWo_PPN        <= 44'hx;
                    PTWo_PTE        <= 10'hx;
                    PTWo_PageSize   <= 2'hx;
                end
            endcase
        end
    end
end

assign PTWo_FIB_ID      = FIB_ID;
assign PTWo_FIB_BURST   = 4'h0;         
assign PTWo_FIB_SIZE    = 4'h3;         
always@(*)begin
    case(state)
        s2_1    :   
        begin
            PTWo_FIB_CMD = `YSYX210152_FIB_CMD_SIGR;
            PTWo_FIB_REQ = 1'b1;
            PTWo_FIB_WREN = PTWi_FIB_FULL ? 1'b0 : 1'b1;
            PTWo_FIB_DATA = PTE_temp;
        end
        pte_upd0:   
        begin
            PTWo_FIB_CMD = `YSYX210152_FIB_CMD_SIGW;
            PTWo_FIB_REQ = 1'b1;
            PTWo_FIB_WREN = PTWi_FIB_FULL ? 1'b0 : 1'b1;
            PTWo_FIB_DATA = PTE_temp;
        end
    default     :   
        begin
            PTWo_FIB_CMD = `YSYX210152_FIB_CMD_NOOP;
            PTWo_FIB_REQ = 1'b0;
            PTWo_FIB_WREN = 1'b0;
            PTWo_FIB_DATA = 64'h0;
        end
    endcase
end
always@(*)begin
    case(i)
        2'h0    :   PTWo_FIB_ADDR = {8'b0,a,VPN[8:0],3'b0};
        2'h1    :   PTWo_FIB_ADDR = {8'b0,a,VPN[17:9],3'b0};
        2'h2    :   PTWo_FIB_ADDR = {8'b0,a,VPN[26:18],3'b0};
    default     :   PTWo_FIB_ADDR = 64'h0;
    endcase
end

endmodule










module ysyx_210152_mul(
    input wire[63:0] rs1,
    input wire[63:0] rs2,
    input wire sign1,
    input wire sign2,
    output wire[127:0] x,
    output wire[127:0] y
);

    wire[64:0] rs1_ext;
    wire[66:0] rs2_ext;
    wire[127:0] pp[0:33];
    wire[65:0] carry;
    wire[127:0] s_l1_1, s_l1_2, s_l1_3, s_l1_4, s_l1_5, s_l1_6, s_l1_7, s_l1_8, s_l1_9, s_l1_10, s_l1_11;
    wire[127:0] c_l1_1, c_l1_2, c_l1_3, c_l1_4, c_l1_5, c_l1_6, c_l1_7, c_l1_8, c_l1_9, c_l1_10, c_l1_11;
    wire[127:0] s_l2_1, s_l2_2, s_l2_3, s_l2_4, s_l2_5, s_l2_6, s_l2_7;
    wire[127:0] c_l2_1, c_l2_2, c_l2_3, c_l2_4, c_l2_5, c_l2_6, c_l2_7;
    wire[127:0] s_l3_1, s_l3_2, s_l3_3, s_l3_4, s_l3_5, c_l3_1, c_l3_2, c_l3_3, c_l3_4, c_l3_5;
    wire[127:0] s_l4_1, s_l4_2, s_l4_3, c_l4_1, c_l4_2, c_l4_3, s_l5_1, s_l5_2, c_l5_1, c_l5_2;
    wire[127:0] s_l6_1, s_l6_2, c_l6_1, c_l6_2, s_l7, c_l7, s_l8, c_l8;

    assign rs1_ext = sign1 ? {rs1[63], rs1[63:0]} : {1'b0, rs1[63:0]};
    assign rs2_ext = sign2 ? {{2{rs2[63]}}, rs2[63:0], 1'b0} : {2'b00, rs2[63:0], 1'b0};

    
    genvar i;
    generate
        for (i=0; i<=32; i=i+1)
        begin: haha
            ysyx_210152_booth2 u_booth(
                .x  (rs1_ext), 
                .y  (rs2_ext[2*i+2:2*i]), 
                .z  (pp[i]), 
                .c  (carry[2*i+1:2*i])
            );
        end
    endgenerate
    assign pp[33] = {62'b0, carry[65:0]};

    
    ysyx_210152_csa u_csa_l1_1(.x(pp[0]), .y({pp[1][125:0], 2'b0}), .z({pp[2][123:0], 4'b0}), .s(s_l1_1), .c(c_l1_1));
    ysyx_210152_csa u_csa_l1_2(.x({pp[3][121:0], 6'b0}), .y({pp[4][119:0], 8'b0}), .z({pp[5][117:0], 10'b0}), .s(s_l1_2), .c(c_l1_2));
    ysyx_210152_csa u_csa_l1_3(.x({pp[6][115:0], 12'b0}), .y({pp[7][113:0], 14'b0}), .z({pp[8][111:0], 16'b0}), .s(s_l1_3), .c(c_l1_3));
    ysyx_210152_csa u_csa_l1_4(.x({pp[9][109:0], 18'b0}), .y({pp[10][107:0], 20'b0}), .z({pp[11][105:0], 22'b0}), .s(s_l1_4), .c(c_l1_4));
    ysyx_210152_csa u_csa_l1_5(.x({pp[12][103:0], 24'b0}), .y({pp[13][101:0], 26'b0}), .z({pp[14][99:0], 28'b0}), .s(s_l1_5), .c(c_l1_5));
    ysyx_210152_csa u_csa_l1_6(.x({pp[15][97:0], 30'b0}), .y({pp[16][95:0], 32'b0}), .z({pp[17][93:0], 34'b0}), .s(s_l1_6), .c(c_l1_6));
    ysyx_210152_csa u_csa_l1_7(.x({pp[18][91:0], 36'b0}), .y({pp[19][89:0], 38'b0}), .z({pp[20][87:0], 40'b0}), .s(s_l1_7), .c(c_l1_7));
    ysyx_210152_csa u_csa_l1_8(.x({pp[21][85:0], 42'b0}), .y({pp[22][83:0], 44'b0}), .z({pp[23][81:0], 46'b0}), .s(s_l1_8), .c(c_l1_8));
    ysyx_210152_csa u_csa_l1_9(.x({pp[24][79:0], 48'b0}), .y({pp[25][77:0], 50'b0}), .z({pp[26][75:0], 52'b0}), .s(s_l1_9), .c(c_l1_9));
    ysyx_210152_csa u_csa_l1_10(.x({pp[27][73:0], 54'b0}), .y({pp[28][71:0], 56'b0}), .z({pp[29][69:0], 58'b0}), .s(s_l1_10), .c(c_l1_10));
    ysyx_210152_csa u_csa_l1_11(.x({pp[30][67:0], 60'b0}), .y({pp[31][65:0], 62'b0}), .z({pp[32][63:0], 64'b0}), .s(s_l1_11), .c(c_l1_11));
    ysyx_210152_csa u_csa_l2_1(.x(pp[33]), .y(s_l1_1), .z(s_l1_2), .s(s_l2_1), .c(c_l2_1));
    ysyx_210152_csa u_csa_l2_2(.x(s_l1_3), .y(s_l1_4), .z(s_l1_5), .s(s_l2_2), .c(c_l2_2));
    ysyx_210152_csa u_csa_l2_3(.x(s_l1_6), .y(s_l1_7), .z(s_l1_8), .s(s_l2_3), .c(c_l2_3));
    ysyx_210152_csa u_csa_l2_4(.x(s_l1_9), .y(s_l1_10), .z(s_l1_11), .s(s_l2_4), .c(c_l2_4));
    ysyx_210152_csa u_csa_l2_5(.x({c_l1_1[126:0], 1'b0}), .y({c_l1_2[126:0], 1'b0}), .z({c_l1_3[126:0], 1'b0}), .s(s_l2_5), .c(c_l2_5));
    ysyx_210152_csa u_csa_l2_6(.x({c_l1_4[126:0], 1'b0}), .y({c_l1_5[126:0], 1'b0}), .z({c_l1_6[126:0], 1'b0}), .s(s_l2_6), .c(c_l2_6));
    ysyx_210152_csa u_csa_l2_7(.x({c_l1_7[126:0], 1'b0}), .y({c_l1_8[126:0], 1'b0}), .z({c_l1_9[126:0], 1'b0}), .s(s_l2_7), .c(c_l2_7));
    ysyx_210152_csa u_csa_l3_1(.x({c_l1_10[126:0], 1'b0}), .y({c_l1_11[126:0], 1'b0}), .z(s_l2_1), .s(s_l3_1), .c(c_l3_1));
    ysyx_210152_csa u_csa_l3_2(.x(s_l2_2), .y(s_l2_3), .z(s_l2_4), .s(s_l3_2), .c(c_l3_2));
    ysyx_210152_csa u_csa_l3_3(.x(s_l2_5), .y(s_l2_6), .z(s_l2_7), .s(s_l3_3), .c(c_l3_3));
    ysyx_210152_csa u_csa_l3_4(.x({c_l2_1[126:0], 1'b0}), .y({c_l2_2[126:0], 1'b0}), .z({c_l2_3[126:0], 1'b0}), .s(s_l3_4), .c(c_l3_4));
    ysyx_210152_csa u_csa_l3_5(.x({c_l2_4[126:0], 1'b0}), .y({c_l2_5[126:0], 1'b0}), .z({c_l2_6[126:0], 1'b0}), .s(s_l3_5), .c(c_l3_5));
    ysyx_210152_csa u_csa_l4_1(.x({c_l2_7[126:0], 1'b0}), .y(s_l3_1), .z(s_l3_2), .s(s_l4_1), .c(c_l4_1));
    ysyx_210152_csa u_csa_l4_2(.x(s_l3_3), .y(s_l3_4), .z(s_l3_5), .s(s_l4_2), .c(c_l4_2));
    ysyx_210152_csa u_csa_l4_3(.x({c_l3_1[126:0], 1'b0}), .y({c_l3_2[126:0], 1'b0}), .z({c_l3_3[126:0], 1'b0}), .s(s_l4_3), .c(c_l4_3));
    ysyx_210152_csa u_csa_l5_1(.x({c_l3_4[126:0], 1'b0}), .y({c_l3_5[126:0], 1'b0}), .z(s_l4_1), .s(s_l5_1), .c(c_l5_1));
    ysyx_210152_csa u_csa_l5_2(.x(s_l4_2), .y(s_l4_3), .z({c_l4_1[126:0], 1'b0}), .s(s_l5_2), .c(c_l5_2));
    ysyx_210152_csa u_csa_l6_1(.x({c_l4_2[126:0], 1'b0}), .y({c_l4_3[126:0], 1'b0}), .z(s_l5_1), .s(s_l6_1), .c(c_l6_1));
    ysyx_210152_csa u_csa_l6_2(.x(s_l5_2), .y({c_l5_1[126:0], 1'b0}), .z({c_l5_2[126:0], 1'b0}), .s(s_l6_2), .c(c_l6_2));
    ysyx_210152_csa u_csa_l7(.x(s_l6_1), .y(s_l6_2), .z({c_l6_1[126:0], 1'b0}), .s(s_l7), .c(c_l7));
    ysyx_210152_csa u_csa_l8(.x({c_l6_2[126:0], 1'b0}), .y(s_l7), .z({c_l7[126:0], 1'b0}), .s(s_l8), .c(c_l8));
    
    assign x = s_l8;
    assign y = {c_l8[126:0], 1'b0};

endmodule













module ysyx_210152_WB_select(
    input wire              Global_Flush,

    input  wire             PIP0i_MSC_valid,
    input  wire             PIP0i_MSC_LoadPageFlt,
    input  wire             PIP0i_MSC_LoadAccFlt,
    input  wire             PIP0i_MSC_LoadAddrMis,
    input  wire             PIP0i_MSC_StorePageFlt,
    input  wire             PIP0i_MSC_StoreAccFlt,
    input  wire             PIP0i_MSC_StoreAddrMis,
    input  wire             PIP0i_INFO_ci,
    input  wire [7:0]       PIP0i_INFO_itag,
    input  wire [`YSYX210152_XLEN-1:0] PIP0i_INFO_pc,
    input  wire [1:0]       PIP0i_INFO_priv,
    input  wire [`YSYX210152_XLEN-1:0] PIP0i_DATA_data1,
    input  wire [`YSYX210152_XLEN-1:0] PIP0i_DATA_data2,
    output  reg             PIP0o_FC_ready,

    input  wire             PIP1i_MSC_valid,
    input  wire             PIP1i_MSC_LoadPageFlt,
    input  wire             PIP1i_MSC_LoadAccFlt,
    input  wire             PIP1i_MSC_LoadAddrMis,
    input  wire             PIP1i_MSC_StorePageFlt,
    input  wire             PIP1i_MSC_StoreAccFlt,
    input  wire             PIP1i_MSC_StoreAddrMis,
    input  wire             PIP1i_INFO_ci,
    input  wire [7:0]       PIP1i_INFO_itag,
    input  wire [`YSYX210152_XLEN-1:0] PIP1i_INFO_pc,
    input  wire [1:0]       PIP1i_INFO_priv,
    input  wire [`YSYX210152_XLEN-1:0] PIP1i_DATA_data1,
    input  wire [`YSYX210152_XLEN-1:0] PIP1i_DATA_data2,
    output  reg             PIP1o_FC_ready,

    input  wire             PIP2i_MSC_valid,
    input  wire             PIP2i_MSC_LoadPageFlt,
    input  wire             PIP2i_MSC_LoadAccFlt,
    input  wire             PIP2i_MSC_LoadAddrMis,
    input  wire             PIP2i_MSC_StorePageFlt,
    input  wire             PIP2i_MSC_StoreAccFlt,
    input  wire             PIP2i_MSC_StoreAddrMis,
    input  wire             PIP2i_INFO_ci,
    input  wire [7:0]       PIP2i_INFO_itag,
    input  wire [`YSYX210152_XLEN-1:0] PIP2i_INFO_pc,
    input  wire [1:0]       PIP2i_INFO_priv,
    input  wire [`YSYX210152_XLEN-1:0] PIP2i_DATA_data1,
    input  wire [`YSYX210152_XLEN-1:0] PIP2i_DATA_data2,
    output  reg             PIP2o_FC_ready,

    input  wire             DITFo_v,                    
    input  wire [7:0]       DITFo_itag,                 




    input  wire [4:0]       DITFo_rdindex,
    input  wire             DITFo_rden,                 
    input  wire [11:0]      DITFo_csrindex,
    input  wire             DITFo_csren,                
    input  wire             DITFo_jmp,
    input  wire             DITFo_InsAccessFlt,
    input  wire             DITFo_InsPageFlt,
    input  wire             DITFo_InsAddrMis,
    input  wire             DITFo_illins,
    input  wire             DITFo_mret,
    input  wire             DITFo_sret,
    input  wire             DITFo_ecall,
    input  wire             DITFo_ebreak,
    input  wire             DITFo_fence,
    input  wire             DITFo_fencei,
    input  wire             DITFo_fencevma,
    input  wire             DITFo_system,
    output  reg             DITFi_remove,               

    output  reg             WB_valid,
    output  reg             WB_rden,
    output  reg [4:0]       WB_rdindex,
    output  reg [`YSYX210152_XLEN-1:0] WB_data1,
    output  reg             WB_csren,
    output  reg [11:0]      WB_csrindex,
    output  reg [`YSYX210152_XLEN-1:0] WB_data2,
    output  reg [`YSYX210152_XLEN-1:0] WB_pc,                      
	output  reg [1:0]       WB_priv,
    output  reg             WB_ci,
    output  reg             WB_jmp,
    output  reg             WB_InsAccFlt,
    output  reg             WB_InsPageFlt,
    output  reg             WB_InsAddrMis,
    output  reg             WB_LoadAccFlt,
    output  reg             WB_LoadPageFlt,
    output  reg             WB_LoadAddrMis,
    output  reg             WB_StoreAccFlt,
    output  reg             WB_StorePageFlt,
    output  reg             WB_StoreAddrMis,
    output  reg             WB_illins,
    output  reg             WB_mret,
    output  reg             WB_sret,
    output  reg             WB_ecall,
    output  reg             WB_ebreak,
    output  reg             WB_fence,
    output  reg             WB_fencei,
    output  reg             WB_fencevma,
    output  reg             WB_system
);

always@(*)begin
    if(Global_Flush)begin
        WB_valid        = 1'b0;
        WB_rden         = 1'b0;
        WB_rdindex      = 5'h00;
        WB_data1        = 64'hx;
        WB_csren        = 1'b0;  
        WB_csrindex     = 12'h000;
        WB_data2        = 64'hx;
        WB_pc           = 64'h0;                               
        WB_priv         = `YSYX210152_Machine;
        WB_jmp          = 1'b0;
        WB_ci           = 1'b0;
        WB_InsAccFlt    = 1'b0;
        WB_InsPageFlt   = 1'b0;
        WB_InsAddrMis   = 1'b0;
        WB_LoadAccFlt   = 1'b0;
        WB_LoadPageFlt  = 1'b0;
        WB_LoadAddrMis  = 1'b0;
        WB_StoreAccFlt  = 1'b0;
        WB_StorePageFlt = 1'b0;
        WB_StoreAddrMis = 1'b0;
        WB_illins       = 1'b0;
        WB_mret         = 1'b0;
        WB_sret         = 1'b0;
        WB_ecall        = 1'b0;
        WB_ebreak       = 1'b0;
        WB_fence        = 1'b0;
        WB_fencei       = 1'b0;
        WB_fencevma     = 1'b0;
        WB_system       = 1'b0;
        DITFi_remove    = 1'b0;
        PIP0o_FC_ready  = PIP0i_MSC_valid;
        PIP1o_FC_ready  = PIP1i_MSC_valid;
        PIP2o_FC_ready  = PIP2i_MSC_valid;
    end
    else if(PIP0i_MSC_valid & DITFo_v & (DITFo_itag == PIP0i_INFO_itag))begin    
        WB_valid        = 1'b1;
        WB_rden         = (PIP0i_MSC_LoadAccFlt | PIP0i_MSC_LoadPageFlt | PIP0i_MSC_LoadAddrMis | PIP0i_MSC_StoreAccFlt | PIP0i_MSC_StoreAddrMis | PIP0i_MSC_StorePageFlt) ? 1'b0 : DITFo_rden;
        WB_rdindex      = DITFo_rdindex;
        WB_data1        = PIP0i_DATA_data1;
        WB_csren        = DITFo_csren;  
        WB_csrindex     = DITFo_csrindex;
        WB_data2        = PIP0i_DATA_data2;
        WB_pc           = PIP0i_INFO_pc;                      
        WB_priv         = PIP0i_INFO_priv;
        WB_jmp          = DITFo_jmp;
        WB_ci           = PIP0i_INFO_ci;
        WB_InsAccFlt    = DITFo_InsAccessFlt;
        WB_InsPageFlt   = DITFo_InsPageFlt;
        WB_InsAddrMis   = DITFo_InsAddrMis;
        WB_LoadAccFlt   = PIP0i_MSC_LoadAccFlt;
        WB_LoadPageFlt  = PIP0i_MSC_LoadPageFlt;
        WB_LoadAddrMis  = PIP0i_MSC_LoadAddrMis;
        WB_StoreAccFlt  = PIP0i_MSC_StoreAccFlt;
        WB_StorePageFlt = PIP0i_MSC_StorePageFlt;
        WB_StoreAddrMis = PIP0i_MSC_StoreAddrMis;
        WB_illins       = DITFo_illins;
        WB_mret         = DITFo_mret;
        WB_sret         = DITFo_sret;
        WB_ecall        = DITFo_ecall;
        WB_ebreak       = DITFo_ebreak;
        WB_fence        = DITFo_fence;
        WB_fencei       = DITFo_fencei;
        WB_fencevma     = DITFo_fencevma;
        WB_system       = DITFo_system;
        DITFi_remove    = 1'b1;                                
        PIP0o_FC_ready  = 1'b1;                                
        PIP1o_FC_ready  = 1'b0;
        PIP2o_FC_ready  = 1'b0;                                
    end
    else if(PIP1i_MSC_valid & DITFo_v & (DITFo_itag == PIP1i_INFO_itag))begin  
        WB_valid        = 1'b1;
        WB_rden         = (PIP1i_MSC_LoadAccFlt | PIP1i_MSC_LoadPageFlt | PIP1i_MSC_LoadAddrMis | PIP1i_MSC_StoreAccFlt | PIP1i_MSC_StoreAddrMis | PIP1i_MSC_StorePageFlt) ? 1'b0 : DITFo_rden;
        WB_rdindex      = DITFo_rdindex;
        WB_data1        = PIP1i_DATA_data1;
        WB_csren        = DITFo_csren;  
        WB_csrindex     = DITFo_csrindex;
        WB_data2        = PIP1i_DATA_data2;
        WB_pc           = PIP1i_INFO_pc;                      
        WB_priv         = PIP1i_INFO_priv;
        WB_jmp          = DITFo_jmp;
        WB_ci           = PIP1i_INFO_ci;
        WB_InsAccFlt    = DITFo_InsAccessFlt;
        WB_InsPageFlt   = DITFo_InsPageFlt;
        WB_InsAddrMis   = DITFo_InsAddrMis;
        WB_LoadAccFlt   = PIP1i_MSC_LoadAccFlt;
        WB_LoadPageFlt  = PIP1i_MSC_LoadPageFlt;
        WB_LoadAddrMis  = PIP1i_MSC_LoadAddrMis;
        WB_StoreAccFlt  = PIP1i_MSC_StoreAccFlt;
        WB_StorePageFlt = PIP1i_MSC_StorePageFlt;
        WB_StoreAddrMis = PIP1i_MSC_StoreAddrMis;
        WB_illins       = DITFo_illins;
        WB_mret         = DITFo_mret;
        WB_sret         = DITFo_sret;
        WB_ecall        = DITFo_ecall;
        WB_ebreak       = DITFo_ebreak;
        WB_fence        = DITFo_fence;
        WB_fencei       = DITFo_fencei;
        WB_fencevma     = DITFo_fencevma;
        WB_system       = DITFo_system;
        DITFi_remove    = 1'b1;                                
        PIP0o_FC_ready  = 1'b0;                                
        PIP1o_FC_ready  = 1'b1;                                
        PIP2o_FC_ready  = 1'b0;   
    end
    else if(PIP2i_MSC_valid & DITFo_v & (DITFo_itag == PIP2i_INFO_itag))begin  
        WB_valid        = 1'b1;
        WB_rden         = (PIP2i_MSC_LoadAccFlt | PIP2i_MSC_LoadPageFlt | PIP2i_MSC_LoadAddrMis | PIP2i_MSC_StoreAccFlt | PIP2i_MSC_StoreAddrMis | PIP2i_MSC_StorePageFlt) ? 1'b0 : DITFo_rden;
        WB_rdindex      = DITFo_rdindex;
        WB_data1        = PIP2i_DATA_data1;
        WB_csren        = DITFo_csren;  
        WB_csrindex     = DITFo_csrindex;
        WB_data2        = PIP2i_DATA_data2;
        WB_pc           = PIP2i_INFO_pc;                      
        WB_priv         = PIP2i_INFO_priv;
        WB_jmp          = DITFo_jmp;
        WB_ci           = PIP2i_INFO_ci;
        WB_InsAccFlt    = DITFo_InsAccessFlt;
        WB_InsPageFlt   = DITFo_InsPageFlt;
        WB_InsAddrMis   = DITFo_InsAddrMis;
        WB_LoadAccFlt   = PIP2i_MSC_LoadAccFlt;
        WB_LoadPageFlt  = PIP2i_MSC_LoadPageFlt;
        WB_LoadAddrMis  = PIP2i_MSC_LoadAddrMis;
        WB_StoreAccFlt  = PIP2i_MSC_StoreAccFlt;
        WB_StorePageFlt = PIP2i_MSC_StorePageFlt;
        WB_StoreAddrMis = PIP2i_MSC_StoreAddrMis;
        WB_illins       = DITFo_illins;
        WB_mret         = DITFo_mret;
        WB_sret         = DITFo_sret;
        WB_ecall        = DITFo_ecall;
        WB_ebreak       = DITFo_ebreak;
        WB_fence        = DITFo_fence;
        WB_fencei       = DITFo_fencei;
        WB_fencevma     = DITFo_fencevma;
        WB_system       = DITFo_system;
        DITFi_remove    = 1'b1;                                
        PIP0o_FC_ready  = 1'b0;                                
        PIP1o_FC_ready  = 1'b0;
        PIP2o_FC_ready  = 1'b1;   
    end
    else begin
        WB_valid        = 1'b0;
        WB_rden         = 1'b0;
        WB_rdindex      = 5'h00;
        WB_data1        = 64'hx;
        WB_csren        = 1'b0;  
        WB_csrindex     = 12'h000;
        WB_data2        = 64'hx;
        WB_pc           = 64'h0;                               
        WB_priv         = `YSYX210152_Machine;
        WB_jmp          = 1'b0;
        WB_ci           = 1'b0;
        WB_InsAccFlt    = 1'b0;
        WB_InsPageFlt   = 1'b0;
        WB_InsAddrMis   = 1'b0;
        WB_LoadAccFlt   = 1'b0;
        WB_LoadPageFlt  = 1'b0;
        WB_LoadAddrMis  = 1'b0;
        WB_StoreAccFlt  = 1'b0;
        WB_StorePageFlt = 1'b0;
        WB_StoreAddrMis = 1'b0;
        WB_illins       = 1'b0;
        WB_mret         = 1'b0;
        WB_sret         = 1'b0;
        WB_ecall        = 1'b0;
        WB_ebreak       = 1'b0;
        WB_fence        = 1'b0;
        WB_fencei       = 1'b0;
        WB_fencevma     = 1'b0;
        WB_system       = 1'b0;
        DITFi_remove    = 1'b0;
        PIP0o_FC_ready  = 1'b0;
        PIP1o_FC_ready  = 1'b0;
        PIP2o_FC_ready  = 1'b0;   
    end
end

endmodule













module ysyx_210152_TAGgen(
    input wire      CLKi,           
    input wire      ARSTi,          
    input wire      ENi,            
    output reg [7:0]DATAo           
);
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        DATAo <= 8'h00;
    end
    else if(ENi)begin
        DATAo <= DATAo + 8'h01;
    end
end

endmodule













module ysyx_210152_ResultUnit
#(
    parameter UsedAsInstrFront = 1'b0       
)
(

    input wire              RUi_CLK,
    input wire              RUi_ARST,
    input wire              RUi_Flush,

    input wire              RUi_RQ_V,
    input wire [7:0]        RUi_RQ_ID,
    input wire              RUi_RQ_WRERR,
    input wire              RUi_RQ_RDERR,
    input wire              RUi_RQ_RDY,
    input wire [127:0]      RUi_RQ_RDATA,
    output reg              RUo_RQ_ACK,

    output reg              Tablei_RDEN,                
    output reg [7:0]        Tablei_RID,                 
    output reg              Tablei_Remove,
    input wire              Tableo_V,                   
    input wire [`YSYX210152_XLEN-1:0]  Tableo_ADDR,
    input wire [`YSYX210152_XLEN-1:0]  Tableo_PC,
    input wire [7:0]        Tableo_ITAG,
    input wire [1:0]        Tableo_priv,
    input wire [7:0]        Tableo_opcode,
    input wire [1:0]        Tableo_opinfo,
    input wire [3:0]        Tableo_opsize,
    input wire              Tableo_ci,
    input wire              Tableo_InstPageFlt,
    input wire              Tableo_LoadPageFlt,
    input wire              Tableo_StorePageFlt,
    input wire              Tableo_InstAddrmis,
    input wire              Tableo_LoadAddrMis,
    input wire              Tableo_StoreAddrMis,

    output reg              RUo_valid,
    output reg              RUo_InstPageFlt,
    output reg              RUo_InstAddrMis,
    output reg              RUo_InstAccFlt,
    output reg              RUo_LoadPageFlt,
    output reg              RUo_LoadAddrMis,
    output reg              RUo_LoadAccFlt,
    output reg              RUo_StorePageFlt,
    output reg              RUo_StoreAddrMis,
    output reg              RUo_StoreAccFlt,
    output reg              RUo_ci,
    output reg [7:0]        RUo_ITAG,
    output reg [1:0]        RUo_priv,
    output reg [`YSYX210152_XLEN-1:0]  RUo_PC,
    output reg [`YSYX210152_XLEN-1:0]  RUo_VADDR,
    output reg [`YSYX210152_XLEN-1:0]  RUo_DATA,
    input wire              RUi_ready

);
    wire                OffADDR_sel;
    wire [`YSYX210152_XLEN-1:0]    RDATA;                  
    reg                 Result_ready;           
assign OffADDR_sel = UsedAsInstrFront;

always@(*)begin
    if(RUi_RQ_V)begin
        Tablei_RDEN = 1'b1;
        Tablei_RID  = RUi_RQ_ID;
    end
    else begin
        Tablei_RDEN = 1'b1;
        Tablei_RID  = RUi_RQ_ID;
    end
end

always@(*)begin
    if(RUi_Flush)begin
        Tablei_Remove   = 1'b0;
        RUo_RQ_ACK      = 1'b0;
        Result_ready    = 1'b0;
    end
    else if(RUi_RQ_V)begin
        if(Tableo_V)begin   
            if(RUo_valid & !RUi_ready)begin
                Tablei_Remove   = 1'b0;
                RUo_RQ_ACK      = 1'b0;
                Result_ready    = 1'b0;
            end
            else begin
                Tablei_Remove   = 1'b1;
                RUo_RQ_ACK      = 1'b1;
                Result_ready    = 1'b1;
            end
        end
        else begin          
            Tablei_Remove   = 1'b0;
            RUo_RQ_ACK      = 1'b1;
            Result_ready    = 1'b0;
        end
    end
    else begin
        Tablei_Remove   = 1'b0;
        RUo_RQ_ACK      = 1'b0;
        Result_ready    = 1'b0;
    end
end

ysyx_210152_DataShiftR          DataShiftR(
    .DATAi                  (RUi_RQ_RDATA),
    .Offset_ADDR            (OffADDR_sel ? Tableo_PC[3:0] :Tableo_ADDR[3:0]),
    .SIZEi                  (Tableo_opsize),
    .SIGNEXTi               ((Tableo_opinfo==`YSYX210152_Sign32) | (Tableo_opinfo==`YSYX210152_Sign64)),
    .DATAo                  (RDATA)
);

always@(posedge RUi_CLK or posedge RUi_ARST)begin
    if(RUi_ARST)begin
        RUo_valid           <= 1'b0;
        RUo_InstPageFlt     <= 1'b0;
        RUo_InstAddrMis     <= 1'b0;
        RUo_InstAccFlt      <= 1'b0;
        RUo_LoadPageFlt     <= 1'b0;
        RUo_LoadAddrMis     <= 1'b0;
        RUo_LoadAccFlt      <= 1'b0;
        RUo_StorePageFlt    <= 1'b0;
        RUo_StoreAddrMis    <= 1'b0;
        RUo_StoreAccFlt     <= 1'b0;
        RUo_ci              <= 1'b0;
        RUo_ITAG            <= 8'h00;
        RUo_priv            <= `YSYX210152_Machine;
        RUo_PC              <= 'hx;
        RUo_VADDR           <= 'hx;
        RUo_DATA            <= 'hx;
    end
    else if(RUo_valid & !RUi_ready)begin
        RUo_valid           <= RUo_valid;
        RUo_InstPageFlt     <= RUo_InstPageFlt;
        RUo_InstAddrMis     <= RUo_InstAddrMis;
        RUo_InstAccFlt      <= RUo_InstAccFlt;
        RUo_LoadPageFlt     <= RUo_LoadPageFlt;
        RUo_LoadAddrMis     <= RUo_LoadAddrMis;
        RUo_LoadAccFlt      <= RUo_LoadAccFlt;
        RUo_StorePageFlt    <= RUo_StorePageFlt;
        RUo_StoreAddrMis    <= RUo_StoreAddrMis;
        RUo_StoreAccFlt     <= RUo_StoreAccFlt;
        RUo_ci              <= RUo_ci;
        RUo_ITAG            <= RUo_ITAG;
        RUo_priv            <= RUo_priv;
        RUo_PC              <= RUo_PC;
        RUo_VADDR           <= RUo_VADDR;
        RUo_DATA            <= RUo_DATA;
    end
    else begin
        RUo_valid           <= Result_ready;
        RUo_InstPageFlt     <= Tableo_InstPageFlt;
        RUo_InstAddrMis     <= Tableo_InstAddrmis;
        RUo_InstAccFlt      <= (Tableo_opcode==`YSYX210152_LSU_eXecute) & RUi_RQ_RDERR;
        RUo_LoadPageFlt     <= Tableo_LoadPageFlt;
        RUo_LoadAddrMis     <= Tableo_LoadAddrMis;
        RUo_LoadAccFlt      <= RUi_RQ_RDERR;
        RUo_StorePageFlt    <= Tableo_StorePageFlt;
        RUo_StoreAddrMis    <= Tableo_StoreAddrMis;
        RUo_StoreAccFlt     <= RUi_RQ_WRERR;
        RUo_ci              <= Tableo_ci;
        RUo_ITAG            <= Tableo_ITAG;
        RUo_priv            <= Tableo_priv;
        RUo_PC              <= Tableo_PC;
        RUo_VADDR           <= Tableo_ADDR;
        RUo_DATA            <= RDATA;
    end
end

endmodule




module ysyx_210152_DataShiftR(
    input wire [127:0]  DATAi,
    input wire [3:0]    Offset_ADDR,
    input wire [3:0]    SIZEi,
    input wire          SIGNEXTi,       
    output reg [63:0]   DATAo
);
    wire [63:0] shift0, shift1, shift2, shift3;

assign shift0 = Offset_ADDR[3] ? DATAi[127:64] : DATAi[63:0];       
assign shift1 = Offset_ADDR[2] ? {32'b0,shift0[63:32]} : shift0;    
assign shift2 = Offset_ADDR[1] ? {48'b0,shift1[31:16]} : shift1;    
assign shift3 = Offset_ADDR[0] ? {56'b0,shift2[15:8]} : shift2;     
always@(*)begin
    if(SIGNEXTi)begin           
        case(SIZEi)
            4'h1 : DATAo = {{56{shift3[7]}},shift3[7:0]};
            4'h2 : DATAo = {{48{shift3[15]}},shift3[15:0]};
            4'h4 : DATAo = {{32{shift3[31]}},shift3[31:0]};
            default: DATAo = shift3;
        endcase
    end
    else begin                  
        case(SIZEi)
            4'h1 : DATAo = {56'b0,shift3[7:0]};
            4'h2 : DATAo = {48'b0,shift3[15:0]};
            4'h4 : DATAo = {32'b0,shift3[31:0]};
            default: DATAo = shift3;
        endcase
    end
end

endmodule







module ysyx_210152_PC(
    input  wire            CLKi,
    input  wire            ARSTi,
    input  wire [`YSYX210152_XLEN-1:0]B_newPC,         
    input  wire [`YSYX210152_XLEN-1:0]G_newPC,         
    input  wire            B_flush,         
    input  wire            G_flush,         
    input  wire            BTB_predicted,   
    input  wire [`YSYX210152_XLEN-1:0]BTB_predictedPC, 
    output  reg [`YSYX210152_XLEN-1:0]PC_Val,
    output  reg            PC_valid,        
    output wire [`YSYX210152_XLEN-1:0]PCnext_predicted,
    input  wire            Ready            
);
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        PC_Val <= `YSYX210152_PC_reset;
    end
    else if(G_flush)begin
        PC_Val <= G_newPC;
    end
    else if(B_flush)begin
        PC_Val <= B_newPC;
    end
    else if(Ready)begin
        PC_Val <= PCnext_predicted;
    end
end
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        PC_valid <= 1'b0;
    end
    else begin
        PC_valid <= 1'b1;
    end
end
assign PCnext_predicted = BTB_predicted ? BTB_predictedPC : (PC_Val+64'd4); 
endmodule








module ysyx_210152_BTB(

    input                   clk, rst,

    input [`YSYX210152_XLEN-1:0]       rd_PC,					
    output reg [1:0]        rd_predicted,			
    output reg [`YSYX210152_XLEN-1:0]  rd_predicted_PC,	    

    input                   wr_req,				    
    input [`YSYX210152_XLEN-1:0]       wr_PC,					
    input [`YSYX210152_XLEN-1:0]       wr_predicted_PC,		
    input                   wr_predicted_state_bit	
);
parameter BUFFER_ADDR_LEN=4;
parameter BUFFER_SIZE   = 1<<BUFFER_ADDR_LEN;
parameter TAG_LEN       = 64-BUFFER_ADDR_LEN-2;

    reg [TAG_LEN-1:0]   tag_pc          [0:BUFFER_SIZE-1]; 
    reg [`YSYX210152_XLEN-1:0]     predicted_pc    [0:BUFFER_SIZE-1];
    reg [1:0]           predicted_state [0:BUFFER_SIZE-1];  
    reg                 predicted_valid [0:BUFFER_SIZE-1];

    wire [TAG_LEN-1:0]          rd_pc_tag;
    wire [BUFFER_ADDR_LEN-1:0]  rd_pc_index;
    wire [1:0]                  rd_pc_offset;
    wire [TAG_LEN-1:0]          wr_pc_tag;
    wire [BUFFER_ADDR_LEN-1:0]  wr_pc_index;
    wire [1:0]                  wr_pc_offset;

assign {rd_pc_tag,rd_pc_index,rd_pc_offset}=rd_PC;
assign {wr_pc_tag,wr_pc_index,wr_pc_offset}=wr_PC;

always@(*)begin
    if((tag_pc[rd_pc_index]==rd_pc_tag) && predicted_valid[rd_pc_index])begin   
        rd_predicted = predicted_state[rd_pc_index];
    end
    else begin
        rd_predicted = 2'b0;
    end
end
always@(*)begin
   rd_predicted_PC = predicted_pc[rd_pc_index];
end

integer i;
always@(posedge clk)begin
    if(rst)begin
        for(i=0; i<BUFFER_SIZE; i=i+1)begin
            tag_pc[i]           <=0;
            predicted_pc[i]     <=0;
            predicted_valid[i]  <=0;
        end
    end
    else if(wr_req)begin
        tag_pc[wr_pc_index]         <=wr_pc_tag;
        predicted_pc[wr_pc_index]   <=wr_predicted_PC;
        predicted_valid[wr_pc_index]<=1'b1;
    end
end
integer j;
always@(posedge clk)begin
    if(rst)begin
        for(j=0; j<BUFFER_SIZE; j=j+1)begin
            predicted_state[j]  <=0;
        end
    end
    else if(wr_req)begin
        if((wr_pc_tag==tag_pc[wr_pc_index]) & predicted_valid[wr_pc_index])begin              
            case(predicted_state[wr_pc_index])
                2'b00 : predicted_state[wr_pc_index] <= wr_predicted_state_bit ? 2'b01 : 2'b00;
                2'b01 : predicted_state[wr_pc_index] <= wr_predicted_state_bit ? 2'b10 : 2'b00;
                2'b10 : predicted_state[wr_pc_index] <= wr_predicted_state_bit ? 2'b11 : 2'b01;
                2'b11 : predicted_state[wr_pc_index] <= wr_predicted_state_bit ? 2'b11 : 2'b10;
            endcase
        end
        else begin
            predicted_state[wr_pc_index] <= wr_predicted_state_bit ? 2'b11 : 2'b00;  
        end    
    end
end
endmodule












module ysyx_210152_ATU
#(
    parameter FIB_ID        = 8'h01,
    parameter TLB_entry_NUM = 16,
    parameter InstrATU      = 0                     
)
(

    input wire              ATUi_CLK,
    input wire              ATUi_ARST,
    input wire              ATUi_Flush,             
    input wire              ATUi_ModifyPermit,      
    input wire [7:0]        ATUi_ModifyPermitID,    
    input wire              ATUi_TLBrefersh,        
    input wire              ATUi_CacheRefersh,
    input wire              ATUi_CSR_CacheInhibit,
    input wire              ATUi_CSR_CacheWT,
    input wire              ATUi_CSR_mxr,
    input wire              ATUi_CSR_sum,
    input wire [3:0]        ATUi_CSR_satpmode,      
    input wire [43:0]       ATUi_CSR_satpppn,       

    input  wire             PIP_ATUi_MSC_valid,     
    input  wire  [7:0]      PIP_ATUi_Opcode,        
    input  wire  [1:0]      PIP_ATUi_OpInfo,        
    input  wire  [3:0]      PIP_ATUi_OpSize,
    input  wire  [7:0]      PIP_ATUi_INFO_ITAG,
    input  wire  [1:0]      PIP_ATUi_INFO_priv,     
    input  wire             PIP_ATUi_INFO_unpage,   
    input  wire [`YSYX210152_XLEN-1:0] PIP_ATUi_INFO_PC,       
    input  wire [`YSYX210152_XLEN-1:0] PIP_ATUi_DATA_VA,       
    input  wire [`YSYX210152_XLEN-1:0] PIP_ATUi_DATA_ds2,
    output reg              PIP_ATUo_FC_ready,

    output reg              Tablei_WREN,
    output     [7:0]        Tablei_WID,
    output     [`YSYX210152_XLEN-1:0]  Tablei_ADDR,
    output     [`YSYX210152_XLEN-1:0]  Tablei_PC,
    output     [7:0]        Tablei_ITAG,
    output     [1:0]        Tablei_priv,
    output     [7:0]        Tablei_opcode,
    output     [1:0]        Tablei_opinfo,
    output     [3:0]        Tablei_opsize,
    output                  Tablei_ci,
    output                  Tablei_InstPageFlt,
    output reg              Tablei_InstAddrMis,
    output                  Tablei_LoadPageFlt,
    output reg              Tablei_LoadAddrMis,
    output                  Tablei_StorePageFlt,
    output reg              Tablei_StoreAddreMis,
    input wire              Tableo_FULL,

    output reg              ATUo_AQ_V,          
    output     [7:0]        ATUo_AQ_ID,         
    output reg [7:0]        ATUo_AQ_CMD,        
    output reg              ATUo_AQ_CI,         
    output reg              ATUo_AQ_WT,         
    output wire [15:0]      ATUo_AQ_BSEL,       
    output wire [127:0]     ATUo_AQ_WDATA,      
    output reg [`YSYX210152_XLEN-1:0]  ATUo_AQ_ADDR,
    input wire              ATUi_AQ_FULL,

    output wire             ATUo_FIB_WREN,        
    output wire             ATUo_FIB_REQ,         
    input  wire             ATUi_FIB_ACK,         
    input  wire             ATUi_FIB_FULL,        
    output wire [7:0]       ATUo_FIB_ID,
    output wire [7:0]       ATUo_FIB_CMD,
    output wire [3:0]       ATUo_FIB_BURST,
    output wire [3:0]       ATUo_FIB_SIZE,
    output wire [`YSYX210152_XLEN-1:0] ATUo_FIB_ADDR,      
    output wire [`YSYX210152_XLEN-1:0] ATUo_FIB_DATA,
    input  wire [7:0]       ATUi_FIB_ID,
    input  wire [7:0]       ATUi_FIB_RPL,
    input  wire             ATUi_FIB_V,
    input  wire [`YSYX210152_XLEN-1:0] ATUi_FIB_DATA

);
    wire                Valid;                  
    wire [7:0]          AccessID;               
    reg                 ID_GEN;                 
    reg                 FLAG_CacheRef;          
	 reg                 FLAG_Clean;

    wire                MisAligned;

    wire                TLBo_valid;
    wire TLBo_DATA_WrThrough,TLBo_DATA_Cacheable;
    wire [`YSYX210152_XLEN-1:0]    TLBo_DATA_PA;
    wire                TLBo_InstPageFlt, TLBo_LoadPageFlt, TLBo_StorePageFlt;

    wire [7:0]          PTWi_CMD;           
    wire                PTWi_V;             
    wire [3:0]          PTWi_WalkID;         
    wire [26:0]         PTWi_VPN;           
    wire                PTWo_FULL;          
    wire [43:0]         PTWo_PPN;           
    wire [7:0]          PTWo_RPL;
    wire [3:0]          PTWo_WalkID;
    wire                PTWo_V;
    wire [9:0]          PTWo_PTE;           
    wire [1:0]          PTWo_PageSize;      
    wire                PTWi_RDEN;          

assign Valid = !ATUi_Flush & PIP_ATUi_MSC_valid;

always@(posedge ATUi_CLK or posedge ATUi_ARST)begin
    if(ATUi_ARST)begin
        FLAG_CacheRef <= 1'b0;
    end
    else if(ATUi_CacheRefersh)begin
        FLAG_CacheRef <= 1'b1;
    end
    else if(FLAG_Clean)begin
        FLAG_CacheRef <= 1'b0;
    end
end

ysyx_210152_DataShiftL      DataShiftL(
    .Offset_ADDR            (PIP_ATUi_DATA_VA[3:0]),
    .DATAi                  (PIP_ATUi_DATA_ds2),
    .SIZEi                  (PIP_ATUi_OpSize),
    .MisAligned             (MisAligned),         
    .BSELo                  (ATUo_AQ_BSEL),
    .DATAo                  (ATUo_AQ_WDATA)
);

    reg             TLBi_valid;
always@(*)begin
    if(Valid)begin
        if(MisAligned)begin             
            TLBi_valid = 1'b0;
        end
        else if((ATUi_CSR_satpmode==`YSYX210152_Sv39_On) & !PIP_ATUi_INFO_unpage)begin
            TLBi_valid = 1'b1;
        end
        else begin
            TLBi_valid = 1'b0;
        end
    end
    else begin
        TLBi_valid = 1'b0;
    end
end

ysyx_210152_TLB#(.TLB_entry_NUM (TLB_entry_NUM))TLB(
    
    .TLBi_CLK               (ATUi_CLK),
    .TLBi_ARST              (ATUi_ARST),
    .TLBi_ModifyPermit      (ATUi_ModifyPermit & (ATUi_ModifyPermitID==PIP_ATUi_INFO_ITAG)),
    .TLBi_pipflush          (ATUi_Flush),
    .TLBi_refersh           (ATUi_TLBrefersh),           
    .TLBi_privilege         (PIP_ATUi_INFO_priv),
    .TLBi_CSR_mxr           (ATUi_CSR_mxr),
    .TLBi_CSR_sum           (ATUi_CSR_sum),

    .TLBi_valid             (TLBi_valid),         
    .TLBi_Opcode            (PIP_ATUi_Opcode),        
    .TLBi_DATA_VA           (PIP_ATUi_DATA_VA),       

    .TLBo_valid             (TLBo_valid),
    .TLBo_LoadPageFlt       (TLBo_LoadPageFlt),
    .TLBo_StorePageFlt      (TLBo_StorePageFlt),
    .TLBo_InstPageFlt       (TLBo_InstPageFlt),
    .TLBo_DATA_PA           (TLBo_DATA_PA),        
    .TLBo_DATA_Cacheable    (TLBo_DATA_Cacheable), 
    .TLBo_DATA_WrThrough    (TLBo_DATA_WrThrough), 

    .PTWi_CMD               (PTWi_CMD),           
    .PTWi_V                 (PTWi_V),             
    .PTWi_WalkID            (PTWi_WalkID),         
    .PTWi_VPN               (PTWi_VPN),           
    .PTWo_FULL              (PTWo_FULL),          

    .PTWo_PPN               (PTWo_PPN),           
    .PTWo_RPL               (PTWo_RPL),
    .PTWo_WalkID            (PTWo_WalkID),
    .PTWo_V                 (PTWo_V),
    .PTWo_PTE               (PTWo_PTE),           
    .PTWo_PageSize          (PTWo_PageSize),      
    .PTWi_RDEN              (PTWi_RDEN)           
);

ysyx_210152_PTW#(
    .FIB_ID(FIB_ID)
) PTW(
    .PTWi_CLK               (ATUi_CLK),
    .PTWi_ARST              (ATUi_ARST),
    .PTWi_CSR_privlage      (PIP_ATUi_INFO_priv),
    .PTWi_CSR_sum           (ATUi_CSR_sum),
    .PTWi_CSR_mxr           (ATUi_CSR_mxr),
    .PTWi_CSR_satpppn       (ATUi_CSR_satpppn),
    .PTWi_CMD               (PTWi_CMD),
    .PTWi_V                 (PTWi_V),
    .PTWi_WalkID            (PTWi_WalkID),
    .PTWi_VPN               (PTWi_VPN),
    .PTWo_FULL              (PTWo_FULL),

    .PTWo_PPN               (PTWo_PPN),
    .PTWo_RPL               (PTWo_RPL),
    .PTWo_WalkID            (PTWo_WalkID),
    .PTWo_V                 (PTWo_V),
    .PTWo_PTE               (PTWo_PTE),
    .PTWo_PageSize          (PTWo_PageSize),
    .PTWi_RDEN              (PTWi_RDEN),

    .PTWo_FIB_WREN          (ATUo_FIB_WREN),
    .PTWo_FIB_REQ           (ATUo_FIB_REQ),
    .PTWi_FIB_ACK           (ATUi_FIB_ACK),
    .PTWi_FIB_FULL          (ATUi_FIB_FULL),
    .PTWo_FIB_ID            (ATUo_FIB_ID),
    .PTWo_FIB_CMD           (ATUo_FIB_CMD),
    .PTWo_FIB_BURST         (ATUo_FIB_BURST),
    .PTWo_FIB_SIZE          (ATUo_FIB_SIZE),
    .PTWo_FIB_ADDR          (ATUo_FIB_ADDR),
    .PTWo_FIB_DATA          (ATUo_FIB_DATA),
    .PTWi_FIB_ID            (ATUi_FIB_ID),
    .PTWi_FIB_RPL           (ATUi_FIB_RPL),
    .PTWi_FIB_V             (ATUi_FIB_V),
    .PTWi_FIB_DATA          (ATUi_FIB_DATA)
);

ysyx_210152_TAGgen      TAGgen(
    .CLKi                   (ATUi_CLK),           
    .ARSTi                  (ATUi_ARST),          
    .ENi                    (ID_GEN),            
    .DATAo                  (AccessID)           
);

always@(*)begin
    if(Valid)begin
        if(Tableo_FULL | ATUi_AQ_FULL)begin                 
            Tablei_WREN         = 1'b0;
            ATUo_AQ_V           = 1'b0;
            ATUo_AQ_CMD         = 'hx; 
            ID_GEN              = 1'b0;
            PIP_ATUo_FC_ready   = 1'b0;
            FLAG_Clean          = 1'b0;
        end
        else if(FLAG_CacheRef)begin             
            Tablei_WREN         = 1'b0;
            ATUo_AQ_V           = 1'b1;
            ATUo_AQ_CMD         = `YSYX210152_LSU_CacheRef; 
            ID_GEN              = 1'b1;
            PIP_ATUo_FC_ready   = 1'b0;
            FLAG_Clean          = 1'b1;
        end
        else if(PIP_ATUi_Opcode==`YSYX210152_LSU_CacheRef)begin
            Tablei_WREN         = 1'b1;
            ATUo_AQ_V           = 1'b1;
            ATUo_AQ_CMD         = `YSYX210152_LSU_CacheRef;        
            ID_GEN              = 1'b1;
            PIP_ATUo_FC_ready   = 1'b1;
            FLAG_Clean          = 1'b0;
        end
        else if(MisAligned)begin
            Tablei_WREN         = 1'b1;
            ATUo_AQ_V           = 1'b1;
            ATUo_AQ_CMD         = `YSYX210152_LSU_NOP;             
            ID_GEN              = 1'b1;
            PIP_ATUo_FC_ready   = 1'b1;
            FLAG_Clean          = 1'b0;
        end
        else if((ATUi_CSR_satpmode==`YSYX210152_Sv39_On) & !PIP_ATUi_INFO_unpage)begin                
            if(TLBo_valid)begin
               if(TLBo_InstPageFlt | TLBo_LoadPageFlt | TLBo_StorePageFlt)begin 
                    Tablei_WREN         = 1'b1;
                    ATUo_AQ_V           = 1'b1;
                    ATUo_AQ_CMD         = `YSYX210152_LSU_NOP;             
                    ID_GEN              = 1'b1;
                    PIP_ATUo_FC_ready   = 1'b1;
                    FLAG_Clean          = 1'b0;
               end
               else if((PIP_ATUi_Opcode==`YSYX210152_LSU_READ)|(PIP_ATUi_Opcode==`YSYX210152_LSU_READ_Lock)|(PIP_ATUi_Opcode==`YSYX210152_LSU_eXecute))begin 
                    Tablei_WREN         = 1'b1;
                    ATUo_AQ_V           = 1'b1;
                    ATUo_AQ_CMD         = `YSYX210152_LSU_READ;
                    ID_GEN              = 1'b1;
                    PIP_ATUo_FC_ready   = 1'b1;
                    FLAG_Clean          = 1'b0;
               end
               else if(ATUi_ModifyPermit & (ATUi_ModifyPermitID==PIP_ATUi_INFO_ITAG))begin
                    Tablei_WREN         = 1'b1;
                    ATUo_AQ_V           = 1'b1;
                    ATUo_AQ_CMD         = PIP_ATUi_Opcode;
                    ID_GEN              = 1'b1;
                    PIP_ATUo_FC_ready   = 1'b1;
                    FLAG_Clean          = 1'b0;
               end
               else begin
                    Tablei_WREN         = 1'b0;
                    ATUo_AQ_V           = 1'b0;
                    ATUo_AQ_CMD         = 'hx;           
                    ID_GEN              = 1'b0;
                    PIP_ATUo_FC_ready   = 1'b0;
                    FLAG_Clean          = 1'b0;
               end
            end
            else begin          
                Tablei_WREN         = 1'b0;
                ATUo_AQ_V           = 1'b0;
                ATUo_AQ_CMD         = 'hx;
                ID_GEN              = 1'b0;
                PIP_ATUo_FC_ready   = 1'b0;
                FLAG_Clean          = 1'b0;
            end
        end
        else if((PIP_ATUi_Opcode==`YSYX210152_LSU_READ)|(PIP_ATUi_Opcode==`YSYX210152_LSU_READ_Lock)|(PIP_ATUi_Opcode==`YSYX210152_LSU_eXecute))begin 
            Tablei_WREN         = 1'b1;
            ATUo_AQ_V           = 1'b1;
            ATUo_AQ_CMD         = `YSYX210152_LSU_READ;
            ID_GEN              = 1'b1;
            PIP_ATUo_FC_ready   = 1'b1;
            FLAG_Clean          = 1'b0;
        end
        else if(ATUi_ModifyPermit & (ATUi_ModifyPermitID==PIP_ATUi_INFO_ITAG))begin  
            Tablei_WREN         = 1'b1;
            ATUo_AQ_V           = 1'b1;
            ATUo_AQ_CMD         = PIP_ATUi_Opcode;             
            ID_GEN              = 1'b1;
            PIP_ATUo_FC_ready   = 1'b1;
            FLAG_Clean          = 1'b0;
        end
        else begin
            Tablei_WREN         = 1'b0;
            ATUo_AQ_V           = 1'b0;
            ATUo_AQ_CMD         = 'hx;           
            ID_GEN              = 1'b0;
            PIP_ATUo_FC_ready   = 1'b0;
            FLAG_Clean          = 1'b0;
        end
    end
    else begin
        Tablei_WREN         = 1'b0;
        ATUo_AQ_V           = 1'b0;
        ATUo_AQ_CMD         = 'hx; 
        ID_GEN              = 1'b0;
        PIP_ATUo_FC_ready   = ATUi_Flush ? 1'b1 : 1'b0;
        FLAG_Clean          = 1'b0;
    end
end

assign ATUo_AQ_ID      = AccessID;
always@(*)begin
    if((ATUi_CSR_satpmode==`YSYX210152_Sv39_On) & !PIP_ATUi_INFO_unpage)begin     

        ATUo_AQ_WT      = TLBo_DATA_WrThrough | ATUi_CSR_CacheWT;
        ATUo_AQ_ADDR    = TLBo_DATA_PA;
        ATUo_AQ_CI      = !(TLBo_DATA_Cacheable | (((ATUo_AQ_ADDR & `YSYX210152_Cacheable_MASK) == `YSYX210152_Cacheable_ADDR))) | ATUi_CSR_CacheInhibit;
    end
    else begin
        
        ATUo_AQ_WT      = ATUi_CSR_CacheWT;
        ATUo_AQ_ADDR    = PIP_ATUi_DATA_VA;
        ATUo_AQ_CI      = !(((ATUo_AQ_ADDR & `YSYX210152_Cacheable_MASK) == `YSYX210152_Cacheable_ADDR)) | ATUi_CSR_CacheInhibit;
    end
end


always@(*)begin
    if(Valid & MisAligned)begin
        if(PIP_ATUi_Opcode==`YSYX210152_LSU_eXecute)begin
            Tablei_InstAddrMis = 1'b1;
            Tablei_LoadAddrMis = 1'b0;
            Tablei_StoreAddreMis= 1'b0;
        end
        else if((PIP_ATUi_Opcode==`YSYX210152_LSU_READ) | (PIP_ATUi_Opcode==`YSYX210152_LSU_READ_Lock))begin
            Tablei_InstAddrMis = 1'b0;
            Tablei_LoadAddrMis = 1'b1;
            Tablei_StoreAddreMis= 1'b0;
        end
        else begin
            Tablei_InstAddrMis = 1'b0;
            Tablei_LoadAddrMis = 1'b0;
            Tablei_StoreAddreMis= 1'b1;
        end
    end
    else begin
        Tablei_InstAddrMis = 1'b0;
        Tablei_LoadAddrMis = 1'b0;
        Tablei_StoreAddreMis= 1'b0;
    end
end

assign Tablei_WID          = AccessID;
assign Tablei_ADDR         = InstrATU ?PIP_ATUi_DATA_ds2 : PIP_ATUi_DATA_VA;   
assign Tablei_PC           = PIP_ATUi_INFO_PC;
assign Tablei_ITAG         = PIP_ATUi_INFO_ITAG;
assign Tablei_priv         = PIP_ATUi_INFO_priv;
assign Tablei_opcode       = PIP_ATUi_Opcode;
assign Tablei_opinfo       = PIP_ATUi_OpInfo;
assign Tablei_opsize       = PIP_ATUi_OpSize;
assign Tablei_ci           = ATUo_AQ_CI;
assign Tablei_InstPageFlt  = TLBo_InstPageFlt;
assign Tablei_LoadPageFlt  = TLBo_LoadPageFlt;
assign Tablei_StorePageFlt = TLBo_StorePageFlt;



endmodule


module ysyx_210152_DataShiftL(
    input wire [3:0]    Offset_ADDR,
    input wire [63:0]   DATAi,
    input wire [3:0]    SIZEi,
    output reg          MisAligned,         
    output wire [15:0]  BSELo,
    output wire [127:0] DATAo
);
    wire [127:0] shift0, shift1, shift2;
    wire [15:0]  bsel_base, bsel0, bsel1, bsel2;

assign shift0 = Offset_ADDR[0] ? {56'b0,DATAi,8'b0} : {64'b0, DATAi};
assign shift1 = Offset_ADDR[1] ? {shift0[111:0],16'b0} : shift0;
assign shift2 = Offset_ADDR[2] ? {shift1[95:0],32'b0} : shift1;
assign DATAo  = Offset_ADDR[3] ? {shift2[63:0],64'b0} : shift2;

assign bsel_base =  (SIZEi[0] ? 16'b00000000_00000001 : 16'b00000000_00000000) |
                    (SIZEi[1] ? 16'b00000000_00000011 : 16'b00000000_00000000) |
                    (SIZEi[2] ? 16'b00000000_00001111 : 16'b00000000_00000000) |
                    (SIZEi[3] ? 16'b00000000_11111111 : 16'b00000000_00000000);     
assign bsel0 = Offset_ADDR[0] ? {bsel_base[14:0],1'b0} : bsel_base;
assign bsel1 = Offset_ADDR[1] ? {bsel0[13:0],2'b0} : bsel0;
assign bsel2 = Offset_ADDR[2] ? {bsel1[11:0],4'b0} : bsel1;
assign BSELo = Offset_ADDR[3] ? {bsel2[7:0],8'b0} : bsel2;

always@(*)begin
    case(SIZEi)
        4'h1 : MisAligned = 1'b0; 
        4'h2 : MisAligned = (Offset_ADDR[0] != 1'b0);
        4'h4 : MisAligned = (Offset_ADDR[1:0] != 2'b00);
        4'h8 : MisAligned = (Offset_ADDR[2:0] != 3'b000);
    default  : MisAligned = 1'b0;
    endcase
end

endmodule














module ysyx_210152_AccessTable(
    input wire              GLB_CLKi,
    input wire              GLB_SRSTi,                  

    output wire             Table_Full,
    output wire             Table_Empty,

    input wire              Tablei_WREN,
    input wire [7:0]        Tablei_WID,
    input wire [`YSYX210152_XLEN-1:0]  Tablei_ADDR,
    input wire [`YSYX210152_XLEN-1:0]  Tablei_PC,
    input wire [7:0]        Tablei_ITAG,
    input wire [1:0]        Tablei_priv,
    input wire [7:0]        Tablei_opcode,
    input wire [1:0]        Tablei_opinfo,
    input wire [3:0]        Tablei_opsize,
    input wire              Tablei_ci,
    input wire              Tablei_InstPageFlt,
    input wire              Tablei_LoadPageFlt,
    input wire              Tablei_StorePageFlt,
    input wire              Tablei_InstAddrmis,
    input wire              Tablei_LoadAddrMis,
    input wire              Tablei_StoreAddrMis,

    input wire              Tablei_RDEN,                
    input wire [7:0]        Tablei_RID,                 
    input wire              Tablei_Remove,              
    output reg              Tableo_V,                   
    output reg [`YSYX210152_XLEN-1:0]  Tableo_ADDR,
    output reg [`YSYX210152_XLEN-1:0]  Tableo_PC,
    output reg [7:0]        Tableo_ITAG,
    output reg [1:0]        Tableo_priv,
    output reg [7:0]        Tableo_opcode,
    output reg [1:0]        Tableo_opinfo,
    output reg [3:0]        Tableo_opsize,
    output reg              Tableo_ci,
    output reg              Tableo_InstPageFlt,
    output reg              Tableo_LoadPageFlt,
    output reg              Tableo_StorePageFlt,
    output reg              Tableo_InstAddrmis,
    output reg              Tableo_LoadAddrMis,
    output reg              Tableo_StoreAddrMis	
);

    reg [3:0]          EntryWrite;                     
    wire [3:0]          EntryRemove;                    
    wire [3:0]          Entryo_V;
    wire [7:0]          Entryo_RID		[3:0];
    wire [`YSYX210152_XLEN-1:0]    Entryo_ADDR     [3:0];
    wire [`YSYX210152_XLEN-1:0]    Entryo_PC       [3:0];
    wire [7:0]          Entryo_ITAG     [3:0];
    wire [1:0]          Entryo_priv     [3:0];
    wire [7:0]          Entryo_opcode   [3:0];
    wire [1:0]          Entryo_opinfo   [3:0];
    wire [3:0]          Entryo_opsize   [3:0];
    wire [3:0]          Entryo_ci;
    wire [3:0]          Entryo_InstPageFlt;
    wire [3:0]          Entryo_LoadPageFlt;
    wire [3:0]          Entryo_StorePageFlt;
    wire [3:0]          Entryo_InstAddrmis;
    wire [3:0]          Entryo_LoadAddrMis;
    wire [3:0]          Entryo_StoreAddrMis;	


    genvar i;
    generate
        for(i = 0; i < 4; i=i+1)begin:TableEntry
            ysyx_210152_TableEntry      TableEntry(
                .GLB_CLKi               (GLB_CLKi),
                .GLB_SRSTi              (GLB_SRSTi),

                .Tablei_WREN            (EntryWrite[i]),
                .Tablei_WID             (Tablei_WID),
                .Tablei_ADDR            (Tablei_ADDR),
                .Tablei_PC              (Tablei_PC),
                .Tablei_ITAG            (Tablei_ITAG),
                .Tablei_priv            (Tablei_priv),
                .Tablei_opcode          (Tablei_opcode),
                .Tablei_opinfo          (Tablei_opinfo),
                .Tablei_opsize          (Tablei_opsize),
                .Tablei_ci              (Tablei_ci),
                .Tablei_InstAddrmis     (Tablei_InstAddrmis),
                .Tablei_InstPageFlt     (Tablei_InstPageFlt),
                .Tablei_LoadAddrMis     (Tablei_LoadAddrMis),
                .Tablei_LoadPageFlt     (Tablei_LoadPageFlt),
                .Tablei_StoreAddrMis    (Tablei_StoreAddrMis),
                .Tablei_StorePageFlt    (Tablei_StorePageFlt),

                .Tablei_Remove          (EntryRemove[i]),
                .Tableo_V               (Entryo_V[i]),
                .Tableo_ADDR            (Entryo_ADDR[i]),
                .Tableo_PC              (Entryo_PC[i]),
                .Tableo_RID             (Entryo_RID[i]),
                .Tableo_ITAG            (Entryo_ITAG[i]),
                .Tableo_priv            (Entryo_priv[i]),
                .Tableo_opcode          (Entryo_opcode[i]),
                .Tableo_opinfo          (Entryo_opinfo[i]),
                .Tableo_opsize          (Entryo_opsize[i]),
                .Tableo_ci              (Entryo_ci[i]),
                .Tableo_InstPageFlt     (Entryo_InstPageFlt[i]),
                .Tableo_LoadPageFlt     (Entryo_LoadPageFlt[i]),
                .Tableo_StorePageFlt    (Entryo_StorePageFlt[i]),
                .Tableo_InstAddrmis     (Entryo_InstAddrmis[i]),
                .Tableo_LoadAddrMis     (Entryo_LoadAddrMis[i]),
                .Tableo_StoreAddrMis    (Entryo_StoreAddrMis[i])				
            );
        end
    endgenerate


always@(*)begin
    if(Tablei_WREN)begin
        if(!Entryo_V[0])begin           
            EntryWrite = 4'b0001;
        end
        else if(!Entryo_V[1])begin
            EntryWrite = 4'b0010;
        end
        else if(!Entryo_V[2])begin
            EntryWrite = 4'b0100;
        end
        else if(!Entryo_V[3])begin
            EntryWrite = 4'b1000;
        end
        else begin
            EntryWrite = 4'b0000;
        end
    end
    else begin
        EntryWrite = 4'b0000;
    end
end

assign EntryRemove[0] = Tablei_Remove & Entryo_V[0] & (Tablei_RID==Entryo_RID[0]);
assign EntryRemove[1] = Tablei_Remove & Entryo_V[1] & (Tablei_RID==Entryo_RID[1]);
assign EntryRemove[2] = Tablei_Remove & Entryo_V[2] & (Tablei_RID==Entryo_RID[2]);
assign EntryRemove[3] = Tablei_Remove & Entryo_V[3] & (Tablei_RID==Entryo_RID[3]);

always@(*)begin
    if(Entryo_V[0] & Tablei_RDEN & (Tablei_RID==Entryo_RID[0]))begin
        Tableo_V            = 1'b1;
        Tableo_ADDR         = Entryo_ADDR[0];
        Tableo_PC           = Entryo_PC[0];
        Tableo_ITAG         = Entryo_ITAG[0];
        Tableo_priv         = Entryo_priv[0];
        Tableo_opcode       = Entryo_opcode[0];
        Tableo_opinfo       = Entryo_opinfo[0];
        Tableo_opsize       = Entryo_opsize[0];
        Tableo_ci           = Entryo_ci[0];
        Tableo_InstPageFlt  = Entryo_InstPageFlt[0];
        Tableo_LoadPageFlt  = Entryo_LoadPageFlt[0];
        Tableo_StorePageFlt = Entryo_StorePageFlt[0];
        Tableo_InstAddrmis  = Entryo_InstAddrmis[0];
        Tableo_LoadAddrMis  = Entryo_LoadAddrMis[0];
        Tableo_StoreAddrMis = Entryo_StoreAddrMis[0];
    end
    else if(Entryo_V[1] & Tablei_RDEN & (Tablei_RID==Entryo_RID[1]))begin
        Tableo_V            = 1'b1;
        Tableo_ADDR         = Entryo_ADDR[1];
        Tableo_PC           = Entryo_PC[1];
        Tableo_ITAG         = Entryo_ITAG[1];
        Tableo_priv         = Entryo_priv[1];
        Tableo_opcode       = Entryo_opcode[1];
        Tableo_opinfo       = Entryo_opinfo[1];
        Tableo_opsize       = Entryo_opsize[1];
        Tableo_ci           = Entryo_ci[1];
        Tableo_InstPageFlt  = Entryo_InstPageFlt[1];
        Tableo_LoadPageFlt  = Entryo_LoadPageFlt[1];
        Tableo_StorePageFlt = Entryo_StorePageFlt[1];
        Tableo_InstAddrmis  = Entryo_InstAddrmis[1];
        Tableo_LoadAddrMis  = Entryo_LoadAddrMis[1];
        Tableo_StoreAddrMis = Entryo_StoreAddrMis[1];		
    end
    else if(Entryo_V[2] & Tablei_RDEN & (Tablei_RID==Entryo_RID[2]))begin
        Tableo_V            = 1'b1;
        Tableo_ADDR         = Entryo_ADDR[2];
        Tableo_PC           = Entryo_PC[2];
        Tableo_ITAG         = Entryo_ITAG[2];
        Tableo_priv         = Entryo_priv[2];
        Tableo_opcode       = Entryo_opcode[2];
        Tableo_opinfo       = Entryo_opinfo[2];
        Tableo_opsize       = Entryo_opsize[2];
        Tableo_ci           = Entryo_ci[2];
        Tableo_InstPageFlt  = Entryo_InstPageFlt[2];
        Tableo_LoadPageFlt  = Entryo_LoadPageFlt[2];
        Tableo_StorePageFlt = Entryo_StorePageFlt[2];
        Tableo_InstAddrmis  = Entryo_InstAddrmis[2];
        Tableo_LoadAddrMis  = Entryo_LoadAddrMis[2];
        Tableo_StoreAddrMis = Entryo_StoreAddrMis[2];		
    end
    else if(Entryo_V[3] & Tablei_RDEN & (Tablei_RID==Entryo_RID[3]))begin
        Tableo_V            = 1'b1;
        Tableo_ADDR         = Entryo_ADDR[3];
        Tableo_PC           = Entryo_PC[3];
        Tableo_ITAG         = Entryo_ITAG[3];
        Tableo_priv         = Entryo_priv[3];
        Tableo_opcode       = Entryo_opcode[3];
        Tableo_opinfo       = Entryo_opinfo[3];
        Tableo_opsize       = Entryo_opsize[3];
        Tableo_ci           = Entryo_ci[3];
        Tableo_InstPageFlt  = Entryo_InstPageFlt[3];
        Tableo_LoadPageFlt  = Entryo_LoadPageFlt[3];
        Tableo_StorePageFlt = Entryo_StorePageFlt[3];
        Tableo_InstAddrmis  = Entryo_InstAddrmis[3];
        Tableo_LoadAddrMis  = Entryo_LoadAddrMis[3];
        Tableo_StoreAddrMis = Entryo_StoreAddrMis[3];		
    end
    else begin
        Tableo_V            = 1'b0;
        Tableo_ADDR         = 'hx;
        Tableo_PC           = 'hx;
        Tableo_ITAG         = 'hx;
        Tableo_priv         = 'hx;
        Tableo_opcode       = 'hx;
        Tableo_opinfo       = 'hx;
        Tableo_opsize       = 'hx;
        Tableo_ci           = 1'bx;
        Tableo_InstPageFlt  = 'hx;
        Tableo_LoadPageFlt  = 'hx;
        Tableo_StorePageFlt = 'hx;
        Tableo_InstAddrmis  = 'hx;
        Tableo_LoadAddrMis  = 'hx;
        Tableo_StoreAddrMis = 'hx;		
    end
end

assign Table_Empty = !(|Entryo_V);
assign Table_Full  = &Entryo_V;

endmodule














module ysyx_210152_IDcore(

    input wire              CSR_tvm,                    
    input wire              CSR_tsr,                    
    

    input wire [1:0]        InstrPriv,                  
    input wire  [31:0]      Instruction,                
    input wire [`YSYX210152_XLEN-1:0]  InstructionPC,              
    input wire              Valid,                      
    input wire              InsAccessFlt,
    input wire              InsPageFlt,
    input wire              InsAddrMis,
    input wire              DITF_FULL,

    output wire [4:0]       rs1_index,
    output reg              rs1_en,
    output wire [4:0]       rs2_index,
    output reg              rs2_en,
    input wire  [`YSYX210152_XLEN-1:0] rs1_data,
    input wire  [`YSYX210152_XLEN-1:0] rs2_data,
    output wire [4:0]       rd_index,
    output reg              rd_en,

    output wire [11:0]      csr_index,
    output reg              csr_en,
	input  wire [`YSYX210152_XLEN-1:0] CSR_data,

    output reg              Checken,
    input wire              DepdcFind,

    output reg             Info_jmp,
    output reg             Info_illins,
    output reg             Info_mret,
    output reg             Info_sret,
    output reg             Info_ecall,
    output reg             Info_ebreak,
    output reg             Info_fence,
    output reg             Info_fencei,
    output reg             Info_fencevma,
    output reg             Info_system,

    output reg [`YSYX210152_XLEN-1:0] BP_address,                 
    output reg             BP_branch,                  
    output reg             BP_jmp,                     

    output wire             disp_ALU,                   
    output wire             disp_LSU,                   
    output wire             disp_Mcop,                  
    output reg [7:0]       disp_opcode,
    output reg [1:0]       disp_opinfo,                
    output reg [3:0]       disp_size,                  
    output reg [`YSYX210152_XLEN-1:0] disp_ds1,                   
    output reg [`YSYX210152_XLEN-1:0] disp_ds2                    

);
parameter DISP_NULL = 4'h0;
parameter DISP_ALU  = 4'h1;
parameter DISP_LSU  = 4'h2;
parameter DISP_Mcop = 4'h4;
    reg  [3:0] disp_dest;             

    wire [6:0] opcode;                 
    wire [2:0] funct3;
    wire [4:0] funct5;
    wire [5:0] funct6;
    wire [6:0] funct7;
    wire [11:0]funct12;
assign opcode = (Instruction[6:0]);
assign funct3 = (Instruction[14:12]);
assign funct5 = (Instruction[31:27]);
assign funct6 = (Instruction[31:26]);
assign funct7 = (Instruction[31:25]);
assign funct12= (Instruction[31:20]);


    wire [63:0]imm20;		            
    wire [63:0]imm20_jal;	            
    wire [63:0]imm12_i;		            
    wire [63:0]imm12_b;		            
    wire [63:0]imm12_s;		            
    wire [63:0]imm5_csr;	            
    wire [63:0]shamt;                   

assign imm20 	= {{32{Instruction[31]}},Instruction[31:12],12'b0};				
assign imm20_jal= {{44{Instruction[31]}},Instruction[19:12],Instruction[20],Instruction[30:21],1'b0};				
assign imm12_i	= {{52{Instruction[31]}},Instruction[31:20]};						
assign imm12_b	= {{52{Instruction[31]}},Instruction[7],Instruction[30:25],Instruction[11:8],1'b0};	
assign imm12_s	= {{52{Instruction[31]}},Instruction[31:25],Instruction[11:7]};		
assign imm5_csr = {59'b0,Instruction[19:15]};
assign shamt    = {58'b0,Instruction[25:20]};	

assign rs1_index = Instruction[19:15];
assign rs2_index = Instruction[24:20];
assign rd_index  = Instruction[11:7];
assign csr_index = Instruction[31:20];




    






always@(*)begin
    if(Valid)begin
        if(DITF_FULL)begin                  
            rs1_en      = 1'b0;
            rs2_en      = 1'b0;
            rd_en       = 1'b0;
            csr_en      = 1'b0;
            Checken     = 1'b0;
            Info_jmp    = 1'b0;
            Info_ebreak = 1'b0;
            Info_ecall  = 1'b0;
            Info_illins = 1'b0;
            Info_mret   = 1'b0;
            Info_sret   = 1'b0;
            Info_fence  = 1'b0;
            Info_fencei = 1'b0;
            Info_fencevma=1'b0;
            Info_system = 1'b0;
            disp_opcode = 'hx;
            disp_opinfo = 'hx;
            disp_size   = 'hx;
            disp_ds1    = 64'hx;
            disp_ds2    = 64'hx;
            disp_dest   = DISP_NULL;
        end
        else if(InsAddrMis | InsPageFlt | InsAccessFlt)begin 
            rs1_en      = 1'b0;
            rs2_en      = 1'b0;
            rd_en       = 1'b0;
            csr_en      = 1'b0;
            Checken     = 1'b0;
            Info_jmp    = 1'b0;
            Info_ebreak = 1'b0;
            Info_ecall  = 1'b0;
            Info_illins = 1'b0;
            Info_mret   = 1'b0;
            Info_sret   = 1'b0;
            Info_fence  = 1'b0;
            Info_fencei = 1'b0;
            Info_fencevma=1'b0;
            Info_system = 1'b0;
            disp_opcode = `YSYX210152_ALU_NOP;
            disp_opinfo = `YSYX210152_Sign64;
            disp_size   = 4'h8;
            disp_ds1    = 64'hx;
            disp_ds2    = InstructionPC;
            disp_dest   = DISP_ALU;            
        end
        else begin
            case(opcode)
                `YSYX210152_lui_encode     : 
                begin 
                    
                    rs1_en      = 1'b0;
                    rs2_en      = 1'b0;
                    rd_en       = 1'b1;
                    csr_en      = 1'b0;
                    Checken     = 1'b0;
                    Info_jmp    = 1'b0;
                    Info_ebreak = 1'b0;
                    Info_ecall  = 1'b0;
                    Info_illins = 1'b0;
                    Info_mret   = 1'b0;
                    Info_sret   = 1'b0;
                    Info_fence  = 1'b0;
                    Info_fencei = 1'b0;
                    Info_fencevma=1'b0;
                    Info_system = 1'b0;
                    disp_opcode = `YSYX210152_ALU_NOP;
                    disp_opinfo = `YSYX210152_Sign64;
                    disp_size   = 4'h8;
                    disp_ds1    = imm20;
                    disp_ds2    = 64'hx;
                    disp_dest   = DISP_ALU;



                end
                `YSYX210152_auipc_encode   : 
                begin 
                    
                    rs1_en      = 1'b0;
                    rs2_en      = 1'b0;
                    rd_en       = 1'b1;            
                    csr_en      = 1'b0;
                    Checken     = 1'b0;
                    Info_jmp    = 1'b0;
                    Info_ebreak = 1'b0;
                    Info_ecall  = 1'b0;
                    Info_illins = 1'b0;
                    Info_mret   = 1'b0;
                    Info_sret   = 1'b0;
                    Info_fence  = 1'b0;
                    Info_fencei = 1'b0;
                    Info_fencevma=1'b0;
                    Info_system = 1'b0;
                    disp_opcode = `YSYX210152_ALU_ADD;
                    disp_opinfo = `YSYX210152_Sign64;
                    disp_size   = 4'h8;
                    disp_ds1    = imm20;
                    disp_ds2    = InstructionPC;
                    disp_dest   = DISP_ALU;
                end
                `YSYX210152_jal_encode     :                           
                begin 
                    
                    rs1_en      = 1'b0;
                    rs2_en      = 1'b0;
                    rd_en       = 1'b1;                    
                    csr_en      = 1'b0;
                    Checken     = 1'b0;
                    Info_jmp    = 1'b1;
                    Info_ebreak = 1'b0;
                    Info_ecall  = 1'b0;
                    Info_illins = 1'b0;
                    Info_mret   = 1'b0;
                    Info_sret   = 1'b0;
                    Info_fence  = 1'b0;
                    Info_fencei = 1'b0;
                    Info_fencevma=1'b0;
                    Info_system = 1'b0;
                    disp_opcode = `YSYX210152_ALU_JAL;
                    disp_opinfo = `YSYX210152_Sign64;
                    disp_size   = 4'h8;
                    disp_ds1    = InstructionPC;               
                    disp_ds2    = imm20_jal + InstructionPC;   
                    disp_dest   = DISP_ALU;
                end
                `YSYX210152_jalr_encode    :                           
                begin
                    
                    rs1_en      = 1'b1;                    
                    rs2_en      = 1'b0;
                    rd_en       = 1'b1;                    
                    csr_en      = 1'b0;
                    Checken     = 1'b1;                    
                    Info_jmp    = 1'b1;                    
                    Info_ebreak = 1'b0;
                    Info_ecall  = 1'b0;
                    Info_illins = 1'b0;
                    Info_mret   = 1'b0;
                    Info_sret   = 1'b0;
                    Info_fence  = 1'b0;
                    Info_fencei = 1'b0;
                    Info_fencevma=1'b0;
                    Info_system = 1'b0;
                    disp_opcode = `YSYX210152_ALU_JAL;
                    disp_opinfo = `YSYX210152_Sign64;
                    disp_size   = 4'h8;
                    disp_ds1    = InstructionPC;
                    disp_ds2    = imm12_i + rs1_data;
                    disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                end
                `YSYX210152_branch_encode  :
                begin
                case(funct3)
                    3'b000 :                
                    begin
                        
                        rs1_en      = 1'b1;
                        rs2_en      = 1'b1;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b1;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = imm12_b + InstructionPC;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                    end
                    3'b001 :                    
                    begin
                        
                        rs1_en      = 1'b1;
                        rs2_en      = 1'b1;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b1;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = imm12_b + InstructionPC;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                    end
                    3'b100 :                    
                    begin
                        
                        rs1_en      = 1'b1;
                        rs2_en      = 1'b1;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b1;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = imm12_b + InstructionPC;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                    end
                    3'b101 :                      
                    begin
                        
                        rs1_en      = 1'b1;
                        rs2_en      = 1'b1;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b1;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = imm12_b + InstructionPC;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                    end
                    3'b110 :                        
                    begin
                        
                        rs1_en      = 1'b1;
                        rs2_en      = 1'b1;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b1;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = imm12_b + InstructionPC;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                    end
                    3'b111 :                            
                    begin
                        
                        rs1_en      = 1'b1;        
                        rs2_en      = 1'b1;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b1;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = imm12_b + InstructionPC;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                    end
                    default:        
                    begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                endcase
                end
                `YSYX210152_load_encode    :                           
                begin
                case(funct3)
                    3'b000 :                        
                    begin
                        
                        rs1_en      = 1'b1;        
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;        
                        csr_en      = 1'b0;
                        Checken     = 1'b1;        
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_LSU_READ;
                        disp_opinfo = `YSYX210152_Sign64;     
                        disp_size   = 4'h1;        
                        disp_ds1    = rs1_data + imm12_i;
                        disp_ds2    = 64'hx;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU; 
                    end
                    3'b001 :                        
                    begin
                        
                        rs1_en      = 1'b1;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;        
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_LSU_READ;
                        disp_opinfo = `YSYX210152_Sign64;     
                        disp_size   = 4'h2;        
                        disp_ds1    = rs1_data + imm12_i;
                        disp_ds2    = 64'hx;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU; 
                    end
                    3'b010 :                        
                    begin
                        
                        rs1_en      = 1'b1;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;        
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_LSU_READ;
                        disp_opinfo = `YSYX210152_Sign64;     
                        disp_size   = 4'h4;        
                        disp_ds1    = rs1_data + imm12_i;
                        disp_ds2    = 64'hx;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU; 
                    end
                    3'b011 :                        
                    begin
                        
                        rs1_en      = 1'b1;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;        
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_LSU_READ;
                        disp_opinfo = `YSYX210152_Sign64;     
                        disp_size   = 4'h8;        
                        disp_ds1    = rs1_data + imm12_i;
                        disp_ds2    = 64'hx;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU; 
                    end
                    3'b100 :                        
                    begin
                        
                        rs1_en      = 1'b1;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;        
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_LSU_READ;
                        disp_opinfo = `YSYX210152_Unsign64;   
                        disp_size   = 4'h1;        
                        disp_ds1    = rs1_data + imm12_i;
                        disp_ds2    = 64'hx;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU; 
                    end
                    3'b101 :                        
                    begin
                        
                        rs1_en      = 1'b1;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;        
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_LSU_READ;
                        disp_opinfo = `YSYX210152_Unsign64;   
                        disp_size   = 4'h2;        
                        disp_ds1    = rs1_data + imm12_i;
                        disp_ds2    = 64'hx;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU; 
                    end
                    3'b110 :                        
                    begin
                        
                        rs1_en      = 1'b1;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;        
                        csr_en      = 1'b0;
                        Checken     = 1'b1;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_LSU_READ;
                        disp_opinfo = `YSYX210152_Unsign64;   
                        disp_size   = 4'h4;        
                        disp_ds1    = rs1_data + imm12_i;
                        disp_ds2    = 64'hx;
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU; 
                    end
                    default:
                    begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                endcase
                end
                `YSYX210152_store_encode   :                           
                begin
                case(funct3)
                    3'b000:
                    begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b1;                
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_LSU_WRITE;          
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h1;                
                        disp_ds1    = rs1_data + imm12_s;  
                        disp_ds2    = rs2_data;            
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                    end
                    3'b001:
                    begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b1;                
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_LSU_WRITE;          
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h2;                
                        disp_ds1    = rs1_data + imm12_s;  
                        disp_ds2    = rs2_data;            
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                    end
                    3'b010:
                    begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b1;                
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_LSU_WRITE;          
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h4;                
                        disp_ds1    = rs1_data + imm12_s;  
                        disp_ds2    = rs2_data;            
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                    end
                    3'b011:
                    begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b1;                
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_LSU_WRITE;          
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h8;                
                        disp_ds1    = rs1_data + imm12_s;  
                        disp_ds2    = rs2_data;            
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                    end
                    default:
                    begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                endcase
                end
                `YSYX210152_imm_encode     :                           
                case(funct3)
                    3'b000:
                    begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;                
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_ADD;            
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h8;                
                        disp_ds1    = rs1_data;            
                        disp_ds2    = imm12_i;             
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                    end
                    3'b001:                                 
                    begin
                        if(funct6==6'b000000)begin              
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b0;
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SL;            
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = shamt;               
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b010:
                    begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;                
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_SLT;            
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h8;                
                        disp_ds1    = rs1_data;            
                        disp_ds2    = imm12_i;             
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                    end
                    3'b011:
                    begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;                
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_SLT;            
                        disp_opinfo = `YSYX210152_Unsign64;           
                        disp_size   = 4'h8;                
                        disp_ds1    = rs1_data;            
                        disp_ds2    = imm12_i;             
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                    end
                    3'b100:
                    begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;                
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_XOR;            
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h8;                
                        disp_ds1    = rs1_data;            
                        disp_ds2    = imm12_i;             
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                    end
                    3'b101:                                 
                    begin
                        if(funct6==6'b000000)begin              
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b0;
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SR;            
                            disp_opinfo = `YSYX210152_Unsign64;           
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = shamt;               
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                        end
                        else if(funct6==6'b010000)begin              
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b0;
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SR;            
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = shamt;               
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b110:
                    begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;                
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_OR;             
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h8;                
                        disp_ds1    = rs1_data;            
                        disp_ds2    = imm12_i;             
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                    end
                    3'b111:
                    begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;                
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_AND;            
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h8;                
                        disp_ds1    = rs1_data;            
                        disp_ds2    = imm12_i;             
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                    end
                    default:
                    begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                endcase
                `YSYX210152_imm32_encode   :                           
                case(funct3)
                    3'b000 : 
                    begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;                
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_ADD;            
                        disp_opinfo = `YSYX210152_Sign32;             
                        disp_size   = 4'h4;                
                        disp_ds1    = rs1_data;            
                        disp_ds2    = imm12_i;             
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                    end
                    3'b001 : 
                    if(funct7==7'b0)begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;                
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_SL;             
                        disp_opinfo = `YSYX210152_Sign32;             
                        disp_size   = 4'h4;                
                        disp_ds1    = rs1_data;            
                        disp_ds2    = {59'b0,rs2_index};   
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                    end
                    else begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                    3'b101 :
                    if(funct7==7'b0)begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;                
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_SR;             
                        disp_opinfo = `YSYX210152_Unsign32;             
                        disp_size   = 4'h4;                
                        disp_ds1    = rs1_data;            
                        disp_ds2    = {59'b0,rs2_index};   
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                    end
                    else if(funct7==7'd32)begin
                        
                        rs1_en      = 1'b1;                
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;                
                        csr_en      = 1'b0;
                        Checken     = 1'b1;                
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_SR;             
                        disp_opinfo = `YSYX210152_Sign32;           
                        disp_size   = 4'h4;                
                        disp_ds1    = rs1_data;            
                        disp_ds2    = {59'b0,rs2_index};   
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                    end
                    else begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                    default:
                    begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                endcase
                `YSYX210152_reg_encode     :                           
                case(funct3)
                    3'b000 :                                
                    begin
                        if(funct7==7'd0)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_ADD;            
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else if(funct7==7'd1)begin                   
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_MUL;           
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else if(funct7==7'd32)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SUB;            
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b001 :                                
                    begin
                        if(funct7==7'd0)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SL;             
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_MULH;          
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b010 :                                
                    begin
                        if(funct7==7'd0)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SLT;            
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_MULHS;         
                            disp_opinfo = `YSYX210152_Unsign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b011 :                                
                    begin
                        if(funct7==7'd0)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SLT;            
                            disp_opinfo = `YSYX210152_Unsign64;           
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_MULH;          
                            disp_opinfo = `YSYX210152_Unsign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b100 :                                
                    begin
                        if(funct7==7'd0)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_XOR;            
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_DIV;           
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b101 :                                
                    begin
                        if(funct7==7'd0)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SR;             
                            disp_opinfo = `YSYX210152_Unsign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_DIV;           
                            disp_opinfo = `YSYX210152_Unsign64;           
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else if(funct7==7'd32)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SR;             
                            disp_opinfo = `YSYX210152_Sign64;           
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b110 :
                    begin
                        if(funct7==7'd0)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_OR;             
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                        end
                        else if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_REM;         
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b111 :
                    begin
                        if(funct7==7'd0)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_AND;            
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                        end
                        else if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_REM;         
                            disp_opinfo = `YSYX210152_Unsign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    default : 
                    begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                endcase
                `YSYX210152_reg32_encode   :                           
                case(funct3)
                    3'b000 :
                    begin
                        if(funct7==7'd0)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_ADD;            
                            disp_opinfo = `YSYX210152_Sign32;             
                            disp_size   = 4'h4;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_MUL;           
                            disp_opinfo = `YSYX210152_Sign32;             
                            disp_size   = 4'h4;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else if(funct7==7'd32)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SUB;            
                            disp_opinfo = `YSYX210152_Sign32;             
                            disp_size   = 4'h4;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b001 :
                    begin
                        if(funct7==7'd0)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SL;             
                            disp_opinfo = `YSYX210152_Sign32;             
                            disp_size   = 4'h4;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b100 :
                    begin
                        if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_DIV;           
                            disp_opinfo = `YSYX210152_Sign32;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b101 :
                    begin
                        if(funct7==7'd0)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SR;             
                            disp_opinfo = `YSYX210152_Unsign32;             
                            disp_size   = 4'h4;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_DIV;           
                            disp_opinfo = `YSYX210152_Unsign32;           
                            disp_size   = 4'h4;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else if(funct7==7'b0100000)begin        
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_SR;             
                            disp_opinfo = `YSYX210152_Sign32;             
                            disp_size   = 4'h4;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b110 :
                    begin
                        if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_REM;           
                            disp_opinfo = `YSYX210152_Sign32;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    3'b111 :
                    begin
                        if(funct7==7'd1)begin
                            
                            rs1_en      = 1'b1;                
                            rs2_en      = 1'b1;                
                            rd_en       = 1'b1;                
                            csr_en      = 1'b0;
                            Checken     = 1'b1;                
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_Mcop_REM;           
                            disp_opinfo = `YSYX210152_Unsign32;             
                            disp_size   = 4'h8;                
                            disp_ds1    = rs1_data;            
                            disp_ds2    = rs2_data;            
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_Mcop; 
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    end
                    default:
                    begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                endcase
                `YSYX210152_mem_encode     : 
                case(funct3)
                    3'b000 :    
                    begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b1;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b1;                
                        disp_opcode = `YSYX210152_LSU_CacheRef;       
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h8;                
                        disp_ds1    = 64'hx;               
                        disp_ds2    = 64'hx;               
                        disp_dest   = DISP_LSU; 
                    end
                    3'b001 :    
                    begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b1;
                        Info_fencevma=1'b0;
                        Info_system = 1'b1;                
                        disp_opcode = `YSYX210152_LSU_CacheRef;            
                        disp_opinfo = `YSYX210152_Unsign32;           
                        disp_size   = 4'h8;                
                        disp_ds1    = 64'hx;               
                        disp_ds2    = 64'hx;               
                        disp_dest   = DISP_LSU; 
                    end
                    default :   
                    begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                endcase
                `YSYX210152_system_encode  :                           
                case(funct3)
                    3'b000 : 
                    if(funct12==12'd0)begin                 
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b1;                
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;                
                        disp_opcode = `YSYX210152_ALU_NOP;            
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h8;                
                        disp_ds1    = 64'hx;               
                        disp_ds2    = 64'hx;               
                        disp_dest   = DISP_ALU; 
                    end
                    else if(funct12==12'd1)begin            
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b1;                
                        Info_ecall  = 1'b0;                
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;                
                        disp_opcode = `YSYX210152_ALU_NOP;            
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h8;                
                        disp_ds1    = 64'hx;               
                        disp_ds2    = 64'hx;               
                        disp_dest   = DISP_ALU; 
                    end
                    else if(funct12==12'b000100000010)begin 
                        if(CSR_tsr)begin                        
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;                
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b1;                
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b1;                
                            disp_opcode = `YSYX210152_ALU_NOP;            
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = 64'hx;               
                            disp_ds2    = 64'hx;               
                            disp_dest   = DISP_ALU;
                        end 
                    end
                    else if(funct12==12'b001100000010)begin 
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;                
                        Info_illins = 1'b0;
                        Info_mret   = 1'b1;                
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;                
                        Info_system = 1'b1;                
                        disp_opcode = `YSYX210152_ALU_NOP;            
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h8;                
                        disp_ds1    = 64'hx;               
                        disp_ds2    = 64'hx;               
                        disp_dest   = DISP_ALU; 
                    end
                    else if(funct12==12'b000100000101)begin 
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;                
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;                
                        Info_system = 1'b0;                
                        disp_opcode = `YSYX210152_ALU_NOP;            
                        disp_opinfo = `YSYX210152_Sign64;             
                        disp_size   = 4'h8;                
                        disp_ds1    = 64'hx;               
                        disp_ds2    = 64'hx;               
                        disp_dest   = DISP_ALU; 
                    end
                    else if(funct7==7'b0001001)begin        
                        if(CSR_tvm)begin                    
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                        else begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;   
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b1;                
                            Info_system = 1'b1;                
                            disp_opcode = `YSYX210152_LSU_CacheRef;       
                            disp_opinfo = `YSYX210152_Sign64;             
                            disp_size   = 4'h8;                
                            disp_ds1    = 64'hx;               
                            disp_ds2    = 64'hx;               
                            disp_dest   = DISP_LSU;
                        end 
                    end
                    else begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                    3'b001 :
                    if(InstrPriv >= csr_index[9:8])     
                    begin
                        
                        rs1_en      = 1'b1;            
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;            
                        csr_en      = 1'b1;            
                        Checken     = 1'b1;            
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b1;            
                        disp_opcode = `YSYX210152_ALU_CSRW;       
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = rs1_data;        
                        disp_ds2    = CSR_data;        
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;        
                    end
                    else begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                    3'b010 :
                    if(InstrPriv >= csr_index[9:8])
                    begin
                        
                        rs1_en      = 1'b1;            
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;            
                        csr_en      = 1'b1;            
                        Checken     = 1'b1;            
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b1;            
                        disp_opcode = `YSYX210152_ALU_CSRS;       
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = rs1_data;        
                        disp_ds2    = CSR_data;        
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                    end
                    else begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                    3'b011 :
                    if(InstrPriv >= csr_index[9:8])
                    begin
                        
                        rs1_en      = 1'b1;            
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;            
                        csr_en      = 1'b1;            
                        Checken     = 1'b1;            
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b1;            
                        disp_opcode = `YSYX210152_ALU_CSRC;       
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = rs1_data;        
                        disp_ds2    = CSR_data;        
                        disp_dest   = DepdcFind ? DISP_NULL : DISP_ALU;
                    end
                    else begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                    3'b101 :
                    if(InstrPriv >= csr_index[9:8])
                    begin
                        
                        rs1_en      = 1'b0;            
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;            
                        csr_en      = 1'b1;            
                        Checken     = 1'b1;            
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b1;            
                        disp_opcode = `YSYX210152_ALU_CSRW;       
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = imm5_csr;        
                        disp_ds2    = CSR_data;        
                        disp_dest   = DISP_ALU;        
                    end
                    else begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                    3'b110 :
                    if(InstrPriv >= csr_index[9:8])
                    begin
                        
                        rs1_en      = 1'b0;            
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;            
                        csr_en      = 1'b1;            
                        Checken     = 1'b1;            
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b1;            
                        disp_opcode = `YSYX210152_ALU_CSRS;       
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = imm5_csr;        
                        disp_ds2    = CSR_data;        
                        disp_dest   = DISP_ALU;        
                    end
                    else begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                    3'b111 :
                    if(InstrPriv >= csr_index[9:8])
                    begin
                        
                        rs1_en      = 1'b0;            
                        rs2_en      = 1'b0;
                        rd_en       = 1'b1;            
                        csr_en      = 1'b1;            
                        Checken     = 1'b1;            
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b0;
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b1;            
                        disp_opcode = `YSYX210152_ALU_CSRC;       
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = imm5_csr;        
                        disp_ds2    = CSR_data;        
                        disp_dest   = DISP_ALU;        
                    end
                    else begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                    default :
                    begin
                        
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
                    end
                endcase
                `YSYX210152_amo_encode     :
                if(funct3==3'b011)begin                     
                    case(funct5)
                        5'd2 : 
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b0;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_READ;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd3 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_WRITE;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd1 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOSWAP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd0 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOADD;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd4 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOXOR;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd12 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOAND;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd8 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOOR;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd16 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOMIN;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd20 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOMAX;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd24 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOMIN;
                            disp_opinfo = `YSYX210152_Unsign64;
                            disp_size   = 4'h8;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd28 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOMAX;
                            disp_opinfo = `YSYX210152_Unsign64;
                            disp_size   = 4'h8;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        default:
                        begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    endcase
                end
                else if(funct3==3'b010)begin                
                    case(funct5)
                        5'd2 : 
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b0;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_READ;
                            disp_opinfo = `YSYX210152_Sign32;
                            disp_size   = 4'h4;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd3 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_WRITE;
                            disp_opinfo = `YSYX210152_Sign32;
                            disp_size   = 4'h4;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd1 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOSWAP;
                            disp_opinfo = `YSYX210152_Sign32;
                            disp_size   = 4'h4;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd0 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOADD;
                            disp_opinfo = `YSYX210152_Sign32;
                            disp_size   = 4'h4;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd4 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOXOR;
                            disp_opinfo = `YSYX210152_Sign32;
                            disp_size   = 4'h4;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd12 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOAND;
                            disp_opinfo = `YSYX210152_Sign32;
                            disp_size   = 4'h4;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd8 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOOR;
                            disp_opinfo = `YSYX210152_Sign32;
                            disp_size   = 4'h4;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd16 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOMIN;
                            disp_opinfo = `YSYX210152_Sign32;
                            disp_size   = 4'h4;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd20 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOMAX;
                            disp_opinfo = `YSYX210152_Sign32;
                            disp_size   = 4'h4;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd24 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOMIN;
                            disp_opinfo = `YSYX210152_Unsign32;
                            disp_size   = 4'h4;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        5'd28 :
                        begin
                            
                            rs1_en      = 1'b1;            
                            rs2_en      = 1'b1;
                            rd_en       = 1'b1;            
                            csr_en      = 1'b0;
                            Checken     = 1'b1;            
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b0;
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_LSU_AMOMAX;
                            disp_opinfo = `YSYX210152_Unsign32;
                            disp_size   = 4'h4;            
                            disp_ds1    = rs1_data;
                            disp_ds2    = rs2_data;
                            disp_dest   = DepdcFind ? DISP_NULL : DISP_LSU;
                        end
                        default:
                        begin
                            
                            rs1_en      = 1'b0;
                            rs2_en      = 1'b0;
                            rd_en       = 1'b0;
                            csr_en      = 1'b0;
                            Checken     = 1'b0;
                            Info_jmp    = 1'b0;
                            Info_ebreak = 1'b0;
                            Info_ecall  = 1'b0;
                            Info_illins = 1'b1;            
                            Info_mret   = 1'b0;
                            Info_sret   = 1'b0;
                            Info_fence  = 1'b0;
                            Info_fencei = 1'b0;
                            Info_fencevma=1'b0;
                            Info_system = 1'b0;
                            disp_opcode = `YSYX210152_ALU_NOP;
                            disp_opinfo = `YSYX210152_Sign64;
                            disp_size   = 4'h8;
                            disp_ds1    = 64'hx;
                            disp_ds2    = 64'hx;
                            disp_dest   = DISP_ALU;
                        end
                    endcase
                end
                else begin
                    
                    rs1_en      = 1'b0;
                    rs2_en      = 1'b0;
                    rd_en       = 1'b0;
                    csr_en      = 1'b0;
                    Checken     = 1'b0;
                    Info_jmp    = 1'b0;
                    Info_ebreak = 1'b0;
                    Info_ecall  = 1'b0;
                    Info_illins = 1'b1;            
                    Info_mret   = 1'b0;
                    Info_sret   = 1'b0;
                    Info_fence  = 1'b0;
                    Info_fencei = 1'b0;
                    Info_fencevma=1'b0;
                    Info_system = 1'b0;
                    disp_opcode = `YSYX210152_ALU_NOP;
                    disp_opinfo = `YSYX210152_Sign64;
                    disp_size   = 4'h8;
                    disp_ds1    = 64'hx;
                    disp_ds2    = 64'hx;
                    disp_dest   = DISP_ALU;
                end
                default:
					 begin
						
                        rs1_en      = 1'b0;
                        rs2_en      = 1'b0;
                        rd_en       = 1'b0;
                        csr_en      = 1'b0;
                        Checken     = 1'b0;
                        Info_jmp    = 1'b0;
                        Info_ebreak = 1'b0;
                        Info_ecall  = 1'b0;
                        Info_illins = 1'b1;            
                        Info_mret   = 1'b0;
                        Info_sret   = 1'b0;
                        Info_fence  = 1'b0;
                        Info_fencei = 1'b0;
                        Info_fencevma=1'b0;
                        Info_system = 1'b0;
                        disp_opcode = `YSYX210152_ALU_NOP;
                        disp_opinfo = `YSYX210152_Sign64;
                        disp_size   = 4'h8;
                        disp_ds1    = 64'hx;
                        disp_ds2    = 64'hx;
                        disp_dest   = DISP_ALU;
					end
            endcase
        end
    end
    else begin                                  
        rs1_en      = 1'b0;
        rs2_en      = 1'b0;
        rd_en       = 1'b0;
        csr_en      = 1'b0;
        Checken     = 1'b0;
        Info_jmp    = 1'b0;
        Info_ebreak = 1'b0;
        Info_ecall  = 1'b0;
        Info_illins = 1'b0;
        Info_mret   = 1'b0;
        Info_sret   = 1'b0;
        Info_fence  = 1'b0;
        Info_fencei = 1'b0;
        Info_fencevma=1'b0;
        Info_system = 1'b0;
        disp_opcode = `YSYX210152_ALU_NOP;
        disp_opinfo = `YSYX210152_Sign64;
        disp_size   = 4'h8;
        disp_ds1    = 64'hx;
        disp_ds2    = 64'hx;
        disp_dest   = DISP_NULL;
    end
end

always@(*)begin
    if(Valid)begin
        case(opcode)
            `YSYX210152_jal_encode     :                   
            begin
                BP_address  = imm20_jal + InstructionPC;
                BP_jmp      = 1'b1;
                BP_branch   = 1'b1;
            end
            `YSYX210152_jalr_encode    :                   
            begin
                BP_address  = imm12_i + rs1_data;
                BP_jmp      = DepdcFind ? 1'b0 : 1'b1;
                BP_branch   = DepdcFind ? 1'b0 : 1'b1;
            end
            `YSYX210152_branch_encode  :                   
            case(funct3)
                3'b000 :                    
                begin
                    BP_address  = imm12_b + InstructionPC;
                    BP_jmp      = DepdcFind ? 1'b0 : (rs1_data == rs2_data);      
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                3'b001 :                    
                begin
                    BP_address  = imm12_b + InstructionPC;
                    BP_jmp      = DepdcFind ? 1'b0 : (rs1_data != rs2_data);      
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                3'b100 :                    
                if(!rs1_data[63] & rs2_data[63])begin           
                    BP_address  = imm12_b + InstructionPC;
                    BP_jmp      = 1'b0;
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                else if(rs1_data[63] & !rs2_data[63])begin           
                    BP_address  =  imm12_b + InstructionPC;
                    BP_jmp      =  DepdcFind ? 1'b0 : 1'b1;
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                else begin
                    BP_address  =  imm12_b + InstructionPC;
                    BP_jmp      =  DepdcFind ? 1'b0 : (rs1_data < rs2_data);
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                3'b101 :                      
                if(rs1_data == rs2_data)begin                       
                    BP_address  = imm12_b + InstructionPC;
                    BP_jmp      = DepdcFind ? 1'b0 : 1'b1;
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                else if(!rs1_data[63] & rs2_data[63])begin           
                    BP_address  = imm12_b + InstructionPC;
                    BP_jmp      = DepdcFind ? 1'b0 : 1'b1;
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                else if(rs1_data[63] & !rs2_data[63])begin           
                    BP_address  =  imm12_b + InstructionPC;
                    BP_jmp      =  1'b0;
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                else begin
                    BP_address  =  imm12_b + InstructionPC;
                    BP_jmp      =  DepdcFind ? 1'b0 : (rs1_data > rs2_data);
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                3'b110 :                        
                begin
                    BP_address  = imm12_b + InstructionPC;
                    BP_jmp      = DepdcFind ? 1'b0 : (rs1_data < rs2_data);      
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                3'b111 :                        
                if(rs1_data == rs2_data)begin                   
                    BP_address  = imm12_b + InstructionPC;
                    BP_jmp      = DepdcFind ? 1'b0 : 1'b1;
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                else begin
                    BP_address  = imm12_b + InstructionPC;
                    BP_jmp      = DepdcFind ? 1'b0 : (rs1_data > rs2_data);      
                    BP_branch   = DepdcFind ? 1'b0 : 1'b1;
                end
                default:                                        
                begin
                    BP_address  = imm12_b + InstructionPC;
                    BP_jmp      = 1'b0;  
                    BP_branch   = 1'b0;
                end

            endcase
            default         :
            begin
                BP_address  = imm12_b + InstructionPC;
                BP_jmp      = 1'b0;
                BP_branch   = 1'b0;
            end
        endcase
    end
    else begin
        BP_address  = imm12_b + InstructionPC;
        BP_jmp      = 1'b0;
        BP_branch   = 1'b0;
    end
end


assign disp_ALU = (disp_dest==DISP_ALU);        
assign disp_LSU = (disp_dest==DISP_LSU);        
assign disp_Mcop= (disp_dest==DISP_Mcop);       

endmodule









module ysyx_210152_DispBuffer(
    input wire              DBi_CLK,
    input wire              DBi_ARST,
    input wire              DBi_Flush,

    input wire              DBi_MSC_valid,
    input wire  [`YSYX210152_XLEN-1:0] DBi_INFO_pc,
    input wire  [1:0]       DBi_INFO_priv,
    input wire  [7:0]       DBi_INFO_ITAG,
    input wire              DBi_INFO_unpage,
    input wire  [7:0]       DBi_Opcode,
    input wire  [3:0]       DBi_OpSize,
    input wire  [1:0]       DBi_OPInfo,
    input wire  [`YSYX210152_XLEN-1:0] DBi_DATA_ds1,
    input wire  [`YSYX210152_XLEN-1:0] DBi_DATA_ds2,          
    output reg              DBo_ready,

    output reg              DBo_MSC_valid,
    output reg  [`YSYX210152_XLEN-1:0] DBo_INFO_pc,
    output reg  [1:0]       DBo_INFO_priv,
    output reg  [7:0]       DBo_INFO_ITAG,
    output reg              DBo_INFO_unpage,
    output reg  [7:0]       DBo_Opcode,
    output reg  [3:0]       DBo_OpSize,
    output reg  [1:0]       DBo_OPInfo,
    output reg  [`YSYX210152_XLEN-1:0] DBo_DATA_ds1,
    output reg  [`YSYX210152_XLEN-1:0] DBo_DATA_ds2,          
    input wire              DBi_FC_ready
);
    reg  rd_pointer, wr_pointer;            

    reg              Buffer0_MSC_valid,     Buffer1_MSC_valid;
    reg  [`YSYX210152_XLEN-1:0] Buffer0_INFO_pc,       Buffer1_INFO_pc;
    reg  [1:0]       Buffer0_INFO_priv,     Buffer1_INFO_priv;
    reg  [7:0]       Buffer0_INFO_ITAG,     Buffer1_INFO_ITAG;
    reg              Buffer0_INFO_unpage,   Buffer1_INFO_unpage;
    reg  [7:0]       Buffer0_Opcode,        Buffer1_Opcode;
    reg  [3:0]       Buffer0_OpSize,        Buffer1_OpSize;
    reg  [1:0]       Buffer0_OpInfo,        Buffer1_OpInfo;
    reg  [`YSYX210152_XLEN-1:0] Buffer0_DATA_ds1,      Buffer1_DATA_ds1;
    reg  [`YSYX210152_XLEN-1:0] Buffer0_DATA_ds2,      Buffer1_DATA_ds2;

always@(posedge DBi_CLK or posedge DBi_ARST)begin
    if(DBi_ARST)begin
        rd_pointer  <= 1'b0;
    end
    else if(DBi_Flush)begin
        rd_pointer  <= 1'b0;
    end
    else if(DBi_FC_ready)begin
        rd_pointer  <= rd_pointer + 1'b1;       
    end
end
always@(posedge DBi_CLK or posedge DBi_ARST)begin
    if(DBi_ARST)begin
        wr_pointer <= 1'b0;
    end
    else if(DBi_Flush)begin
        wr_pointer <= 1'b0;
    end
    else begin
        case(wr_pointer)
            1'b0 : if(!Buffer0_MSC_valid & DBi_MSC_valid)begin      
                        wr_pointer <= 1'b1;
                    end
            1'b1 :  if(!Buffer1_MSC_valid & DBi_MSC_valid)begin     
                        wr_pointer <= 1'b0;
                    end
        endcase
    end
end

always@(posedge DBi_CLK or posedge DBi_ARST)begin
    if(DBi_ARST)begin
        Buffer0_MSC_valid <= 1'b0;
    end
    else if(DBi_Flush)begin
        Buffer0_MSC_valid <= 1'b0;
    end
    else begin
        case(Buffer0_MSC_valid)
            1'b0 :  if(!wr_pointer & DBi_MSC_valid)begin    
                        Buffer0_MSC_valid <= 1'b1;
                        Buffer0_INFO_pc   <= DBi_INFO_pc;
                        Buffer0_INFO_priv <= DBi_INFO_priv;
                        Buffer0_INFO_ITAG <= DBi_INFO_ITAG;
                        Buffer0_INFO_unpage<=DBi_INFO_unpage;
                        Buffer0_Opcode    <= DBi_Opcode;
                        Buffer0_OpSize    <= DBi_OpSize;
                        Buffer0_OpInfo    <= DBi_OPInfo;
                        Buffer0_DATA_ds1  <= DBi_DATA_ds1;
                        Buffer0_DATA_ds2  <= DBi_DATA_ds2;
                    end
            1'b1 :  if(!rd_pointer & DBi_FC_ready)begin     
                        Buffer0_MSC_valid <= 1'b0;
                    end
        endcase
    end
end

always@(posedge DBi_CLK or posedge DBi_ARST)begin
    if(DBi_ARST)begin
        Buffer1_MSC_valid <= 1'b0;
    end
    else if(DBi_Flush)begin
        Buffer1_MSC_valid <= 1'b0;
    end
    else begin
        case(Buffer1_MSC_valid)
            1'b0 :  if(wr_pointer & DBi_MSC_valid)begin    
                        Buffer1_MSC_valid <= 1'b1;
                        Buffer1_INFO_pc   <= DBi_INFO_pc;
                        Buffer1_INFO_priv <= DBi_INFO_priv;
                        Buffer1_INFO_ITAG <= DBi_INFO_ITAG;
                        Buffer1_INFO_unpage<=DBi_INFO_unpage;
                        Buffer1_Opcode    <= DBi_Opcode;
                        Buffer1_OpSize    <= DBi_OpSize;
                        Buffer1_OpInfo    <= DBi_OPInfo;
                        Buffer1_DATA_ds1  <= DBi_DATA_ds1;
                        Buffer1_DATA_ds2  <= DBi_DATA_ds2;
                    end
            1'b1 :  if(rd_pointer & DBi_FC_ready)begin     
                        Buffer1_MSC_valid <= 1'b0;
                    end
        endcase
    end
end

always@(*)begin
    DBo_MSC_valid   = rd_pointer ? Buffer1_MSC_valid : Buffer0_MSC_valid;
    DBo_INFO_pc     = rd_pointer ? Buffer1_INFO_pc   : Buffer0_INFO_pc;
    DBo_INFO_priv   = rd_pointer ? Buffer1_INFO_priv : Buffer0_INFO_priv;
    DBo_INFO_ITAG   = rd_pointer ? Buffer1_INFO_ITAG : Buffer0_INFO_ITAG;
    DBo_INFO_unpage = rd_pointer ? Buffer1_INFO_unpage:Buffer0_INFO_unpage;
    DBo_Opcode      = rd_pointer ? Buffer1_Opcode    : Buffer0_Opcode;
    DBo_OpSize      = rd_pointer ? Buffer1_OpSize    : Buffer0_OpSize;
    DBo_OPInfo      = rd_pointer ? Buffer1_OpInfo    : Buffer0_OpInfo;
    DBo_DATA_ds1    = rd_pointer ? Buffer1_DATA_ds1  : Buffer0_DATA_ds1;
    DBo_DATA_ds2    = rd_pointer ? Buffer1_DATA_ds2  : Buffer0_DATA_ds2;
end

always@(*)begin
    if(Buffer0_MSC_valid & Buffer1_MSC_valid)begin
        DBo_ready = 1'b0;
    end
    else begin
        DBo_ready = 1'b1;
    end
end
endmodule








module ysyx_210152_MulCyc_Div
	#(
		parameter DIV_WIDTH=32,
		UNROLL_COEFF=0
	)
	(
	input clk,
	input rst,
	input flush,
	input start,
	input stall,
	input [DIV_WIDTH-1:0]DIVIDEND,
	input [DIV_WIDTH-1:0]DIVISOR,
	
	output reg[DIV_WIDTH-1:0]DIV,
	output reg[DIV_WIDTH-1:0]MOD,
	output div_idle, 
	output reg calc_done
	);
	localparam IDLE = 2'd0;
	localparam CALC = 2'd1;
	localparam FINISH = 2'd2;
	localparam DONE = 2'd3;
	localparam UNROLL_STAGE=(UNROLL_COEFF==0)?1:(2**UNROLL_COEFF);
	localparam STEP_NUM=DIV_WIDTH/UNROLL_STAGE;
	localparam STEP_WID=$clog2(STEP_NUM);
	reg [1:0]state,state_next;
	reg [STEP_WID:0]step_cnt;
	reg [2*DIV_WIDTH-1:0]middle;
	reg [DIV_WIDTH-1:0]diver_hold;
	wire [DIV_WIDTH-1:0]try_remain;

	wire can_minus;
	always@(posedge clk or posedge rst)
		if(rst)
			state<=IDLE;
		else 
			state<=state_next;
	always@(*)
	begin
	  	case(state)
			IDLE:
				if(start)
					state_next=CALC;
				else 
					state_next=IDLE;
			CALC:
				if(flush)
					state_next=IDLE;
				else if(step_cnt==STEP_NUM-1)
					state_next=DONE;
				else 
					state_next=CALC;
			DONE:
				if(flush)
					state_next=IDLE;
				else
					state_next=FINISH;
			FINISH:
				if(stall)state_next=FINISH;
				else state_next=IDLE;
			default:
				state_next=IDLE;
		endcase
	end

	always@(posedge clk or posedge rst)
	if(rst) 
		step_cnt<=0;
	else if(state==CALC)
		step_cnt<=step_cnt+1;
	else 
		step_cnt<=0;

	assign div_idle=(state==IDLE || state==FINISH);
	
	assign can_minus=(middle[2*DIV_WIDTH-1:DIV_WIDTH] >= diver_hold);
	assign try_remain=(can_minus)? (middle[2*DIV_WIDTH-1:DIV_WIDTH] - diver_hold) : middle[2*DIV_WIDTH-1:DIV_WIDTH];

	always@(posedge clk)
	if(state==CALC)
	begin
		middle<={{try_remain[DIV_WIDTH-2:0],middle[DIV_WIDTH-1:0]},can_minus};
		diver_hold<=diver_hold;
	end
	else
	if(state==DONE)
	begin
		middle<=middle;
	  	diver_hold<=diver_hold;
	end
	else
	begin 
		middle<={{DIV_WIDTH{1'b0}},DIVIDEND};
		diver_hold<=DIVISOR;
	end

	always@(posedge clk)
	if(state_next==FINISH)
	begin
		calc_done<=1'b1;
		MOD<=try_remain;
		DIV<={ middle[DIV_WIDTH-2:0],can_minus };
	end
	else 
	begin
		calc_done<=1'b0;
		MOD <= MOD;
		DIV <= DIV;
	end

endmodule











module ysyx_210152_md_execute(

    input wire clk,
    input wire arst,
    input wire stall,
    input wire flush,

    input wire[127:0] ex_data1,
    input wire[127:0] ex_data2,
    input wire ex_div, 
    input wire[7:0] ex_opcode,
    input wire[1:0] ex_opinfo,
    input wire[7:0] ex_tag,
    input wire[1:0] ex_priv,
    input wire[`YSYX210152_XLEN-1:0] ex_pc,

    output reg[63:0] d_result,
    output reg d_valid,
    output reg[7:0] d_tag,
    output reg[1:0] d_priv,
    output reg[`YSYX210152_XLEN-1:0] d_pc,
    output reg stallreq,

    input wire[63:0] q, 
    input wire[63:0] r, 
    input wire div_valid,
    input wire div_idle,
    output reg[63:0] dividend,
    output reg[63:0] divisor,
    output reg div_start
    );
    
    reg[63:0] d_result_next;
    reg d_valid_next;
    reg[7:0] d_tag_next;
    reg[1:0] d_priv_next;
    reg[`YSYX210152_XLEN-1:0] d_pc_next;
    wire div_by_zero;
    wire overflow;
    wire[127:0] mul_result;
    reg[63:0] div_result;
    wire[63:0] data1_64_comp;
    wire[63:0] data2_64_comp;
    wire[31:0] data1_32_comp;
    wire[31:0] data2_32_comp;
    reg q_64_sign;
    reg r_64_sign;
    reg q_32_sign;
    reg r_32_sign;
    reg q_64_sign_next;
    reg r_64_sign_next;
    reg q_32_sign_next;
    reg r_32_sign_next;
    reg[7:0] ex_opcode_reg;
    reg[1:0] ex_opinfo_reg;
    reg[7:0] ex_tag_reg;
    reg[1:0] ex_priv_reg;
    reg[`YSYX210152_XLEN-1:0] ex_pc_reg;
    reg[7:0] ex_opcode_reg_next;
    reg[1:0] ex_opinfo_reg_next;
    reg[7:0] ex_tag_reg_next;
    reg[1:0] ex_priv_reg_next;
    reg[`YSYX210152_XLEN-1:0] ex_pc_reg_next;
    assign div_by_zero = ex_data2[63:0] == 64'b0;
    assign overflow = (ex_opinfo == `YSYX210152_Sign32 && ex_data1[31] && ~|ex_data1[30:0] && &ex_data2[31:0]) || (ex_opinfo == `YSYX210152_Sign64 && ex_data1[63] && ~|ex_data1[62:0] && &ex_data2[63:0]);
    assign mul_result = ex_data1 + ex_data2;
    assign data1_64_comp = ~ex_data1[63:0] + 64'b1;
    assign data2_64_comp = ~ex_data2[63:0] + 64'b1;
    assign data1_32_comp = ~ex_data1[31:0] + 32'b1;
    assign data2_32_comp = ~ex_data2[31:0] + 32'b1;
	 
    always @ (*) begin
        case (ex_opinfo)
            `YSYX210152_Sign32: begin
                dividend = ex_data1[31] ? {32'b0, data1_32_comp[31:0]} : {32'b0, ex_data1[31:0]};
                divisor = ex_data2[31] ? {32'b0, data2_32_comp[31:0]} : {32'b0, ex_data2[31:0]};
            end
            `YSYX210152_Sign64: begin
                dividend = ex_data1[63] ? data1_64_comp : ex_data1[63:0];
                divisor = ex_data2[63] ? data2_64_comp : ex_data2[63:0];
            end
            `YSYX210152_Unsign32: begin
                dividend = {32'b0, ex_data1[31:0]};
                divisor = {32'b0, ex_data2[31:0]};
            end
            default: begin 
                dividend = ex_data1[63:0];
                divisor = ex_data2[63:0];
            end
        endcase
    end
	 
    always @ (*) begin
        if (div_valid)
            if (ex_opcode_reg == `YSYX210152_Mcop_DIV)
                if (ex_opinfo_reg == `YSYX210152_Sign32)
                    div_result = q_32_sign ? ~q + 1'b1 : q;
                else if (ex_opinfo_reg == `YSYX210152_Sign64)
                    div_result = q_64_sign ? ~q + 1'b1 : q;
                else if (ex_opinfo_reg == `YSYX210152_Unsign32)
                    div_result = {{32{q[31]}}, q[31:0]};
                else
                    div_result = q;
            else
                if (ex_opinfo_reg == `YSYX210152_Sign32)
                    div_result = r_32_sign ? ~r + 1'b1 : r;
                else if (ex_opinfo_reg == `YSYX210152_Sign64)
                    div_result = r_64_sign ? ~r + 1'b1 : r;
                else if (ex_opinfo_reg == `YSYX210152_Unsign32)
                    div_result = {{32{r[31]}}, r[31:0]};
                else
                    div_result = r;
        else if (div_by_zero)
            if (ex_opcode == `YSYX210152_Mcop_DIV)
                div_result = {64{1'b1}};
            else if (ex_opinfo == `YSYX210152_Sign32 || ex_opinfo == `YSYX210152_Unsign32)
                div_result = {{32{ex_data1[31]}}, ex_data1[31:0]};
            else
                div_result = ex_data1[63:0];
        else if (overflow)
            if (ex_opcode == `YSYX210152_Mcop_DIV)
                if (ex_opinfo == `YSYX210152_Sign32)
                    div_result = {{33{1'b1}}, 31'b0};
                else
                    div_result = {1'b1, 63'b0};
                else
                    div_result = 64'b0;
        else
            div_result = 64'b0;
    end
    
    always @ (*) begin
        if (flush) begin
            d_result_next = 64'b0;
            d_valid_next = 1'b0;
            d_tag_next = 8'b0;
            d_priv_next = 2'b0;
            d_pc_next = `YSYX210152_XLEN'b0;
            div_start = 1'b0;
            stallreq = 1'b0;
            q_64_sign_next = 1'b0;
            r_64_sign_next = 1'b0;
            q_32_sign_next = 1'b0;
            r_32_sign_next = 1'b0;
            ex_opcode_reg_next = 8'b0;
            ex_opinfo_reg_next = 2'b0;
            ex_tag_reg_next = 8'b0;
            ex_priv_reg_next = 2'b0;
            ex_pc_reg_next = `YSYX210152_XLEN'b0;
        end
        else if (stall) begin
            d_result_next = d_result;
            d_valid_next = d_valid;
            d_tag_next = d_tag;
            d_priv_next = d_priv;
            d_pc_next = d_pc;
            div_start = 1'b0;
            stallreq = 1'b0;
            q_64_sign_next = q_64_sign;
            r_64_sign_next = r_64_sign;
            q_32_sign_next = q_32_sign;
            r_32_sign_next = r_32_sign;
            ex_opcode_reg_next = ex_opcode_reg;
            ex_opinfo_reg_next = ex_opinfo_reg;
            ex_tag_reg_next = ex_tag_reg;
            ex_priv_reg_next = ex_priv_reg;
            ex_pc_reg_next = ex_pc_reg;
        end
        else if (div_valid) begin
            d_result_next = div_result;
            d_valid_next = 1'b1;
            d_tag_next = ex_tag_reg;
            d_priv_next = ex_priv_reg;
            d_pc_next = ex_pc_reg;
            div_start = 1'b0;
            stallreq = 1'b0;
            q_64_sign_next = q_64_sign;
            r_64_sign_next = r_64_sign;
            q_32_sign_next = q_32_sign;
            r_32_sign_next = r_32_sign;
            ex_opcode_reg_next = ex_opcode_reg;
            ex_opinfo_reg_next = ex_opinfo_reg;
            ex_tag_reg_next = ex_tag_reg;
            ex_priv_reg_next = ex_priv_reg;
            ex_pc_reg_next = ex_pc_reg;
        end
        else if (ex_div & (div_by_zero | overflow) & ~div_valid & div_idle) begin
            d_result_next = div_result;
            d_valid_next = 1'b1;
            d_tag_next = ex_tag;
            d_priv_next = ex_priv;
            d_pc_next = ex_pc;
            div_start = 1'b0;
            stallreq = 1'b0;
            q_64_sign_next = q_64_sign;
            r_64_sign_next = r_64_sign;
            q_32_sign_next = q_32_sign;
            r_32_sign_next = r_32_sign;
            ex_opcode_reg_next = ex_opcode_reg;
            ex_opinfo_reg_next = ex_opinfo_reg;
            ex_tag_reg_next = ex_tag;
            ex_priv_reg_next = ex_priv;
            ex_pc_reg_next = ex_pc;
        end
        else if (ex_div & ~div_valid & div_idle) begin
            d_result_next = 64'b0;
            d_valid_next = 1'b0;
            d_tag_next = 8'b0;
            d_priv_next = 2'b0;
            d_pc_next = `YSYX210152_XLEN'b0;
            div_start = 1'b1;
            stallreq = 1'b1;
            q_64_sign_next = ex_data1[63] ^ ex_data2[63];
            r_64_sign_next = ex_data1[63];
            q_32_sign_next = ex_data1[31] ^ ex_data2[31];
            r_32_sign_next = ex_data1[31];
            ex_opcode_reg_next = ex_opcode;
            ex_opinfo_reg_next = ex_opinfo;
            ex_tag_reg_next = ex_tag;
            ex_priv_reg_next = ex_priv;
            ex_pc_reg_next = ex_pc;
        end
        else if (~div_valid & ~div_idle) begin
            d_result_next = 64'b0;
            d_valid_next = 1'b0;
            d_tag_next = 8'b0;
            d_priv_next = 2'b0;
            d_pc_next = `YSYX210152_XLEN'b0;
            div_start = 1'b0;
            stallreq = 1'b1;
            q_64_sign_next = q_64_sign;
            r_64_sign_next = r_64_sign;
            q_32_sign_next = q_32_sign;
            r_32_sign_next = r_32_sign;
            ex_opcode_reg_next = ex_opcode_reg;
            ex_opinfo_reg_next = ex_opinfo_reg;
            ex_tag_reg_next = ex_tag_reg;
            ex_priv_reg_next = ex_priv_reg;
            ex_pc_reg_next = ex_pc_reg;
        end
        else begin
            case (ex_opcode)
                `YSYX210152_Mcop_MUL:
                    if (ex_opinfo == `YSYX210152_Sign32) begin
                        d_result_next = {{32{mul_result[31]}}, mul_result[31:0]};
                        d_valid_next = 1'b1;
                    end
                    else begin
                        d_result_next = mul_result[63:0];
                        d_valid_next = 1'b1;
                    end
                `YSYX210152_Mcop_MULH, `YSYX210152_Mcop_MULHS: begin
                    d_result_next = mul_result[127:64];
                    d_valid_next = 1'b1;
                end
                default: begin
                    d_result_next = 64'b0;
                    d_valid_next = 1'b0;
                end
            endcase
            d_tag_next = ex_tag;
            d_priv_next = ex_priv;
            d_pc_next = ex_pc;
            div_start = 1'b0;
            stallreq = 1'b0;
            q_64_sign_next = q_64_sign;
            r_64_sign_next = r_64_sign;
            q_32_sign_next = q_32_sign;
            r_32_sign_next = r_32_sign;
            ex_opcode_reg_next = ex_opcode;
            ex_opinfo_reg_next = ex_opinfo;
            ex_tag_reg_next = ex_tag;
            ex_priv_reg_next = ex_priv;
            ex_pc_reg_next = ex_pc;
        end
    end

    always @ (posedge clk or posedge arst) begin
        if (arst) begin
            d_result <= 64'b0;
            d_valid <= 1'b0;
            d_tag <= 8'b0;
            d_priv <= 2'b0;
            d_pc <= `YSYX210152_XLEN'b0;
            q_64_sign <= 1'b0;
            r_64_sign <= 1'b0;
            q_32_sign <= 1'b0;
            r_32_sign <= 1'b0;
            ex_opcode_reg <= 8'b0;
            ex_opinfo_reg <= 2'b0;
            ex_tag_reg = 8'b0;
            ex_priv_reg = 2'b0;
            ex_pc_reg = `YSYX210152_XLEN'b0;
        end
        else begin
            d_result <= d_result_next;
            d_valid <= d_valid_next;
            d_tag <= d_tag_next;
            d_priv <= d_priv_next;
            d_pc <= d_pc_next;
            q_64_sign <= q_64_sign_next;
            r_64_sign <= r_64_sign_next;
            q_32_sign <= q_32_sign_next;
            r_32_sign <= r_32_sign_next;
            ex_opcode_reg <= ex_opcode_reg_next;
            ex_opinfo_reg <= ex_opinfo_reg_next;
            ex_tag_reg = ex_tag_reg_next;
            ex_priv_reg = ex_priv_reg_next;
            ex_pc_reg = ex_pc_reg_next;
        end
    end

endmodule











module ysyx_210152_md_decode(

    input wire clk,
    input wire arst,
    input wire stall,
    input wire flush,

    input wire handshake,
    input wire[7:0] i_opcode,
    input wire[1:0] i_opinfo,
    input wire[63:0] i_data1,
    input wire[63:0] i_data2,
    input wire[7:0] i_tag,
    input wire[1:0] i_priv,
    input wire[`YSYX210152_XLEN-1:0] i_pc,

    output reg[127:0] ex_data1,
    output reg[127:0] ex_data2,
    output reg ex_div, 
    output reg[7:0] ex_opcode,
    output reg[1:0] ex_opinfo,
    output reg[7:0] ex_tag,
    output reg[1:0] ex_priv,
    output reg[`YSYX210152_XLEN-1:0] ex_pc
    );
    
    reg[127:0] ex_data1_next;
    reg[127:0] ex_data2_next;
    reg ex_div_next;
    reg[7:0] ex_opcode_next;
    reg[1:0] ex_opinfo_next;
    reg[7:0] ex_tag_next;
    reg[1:0] ex_priv_next;
    reg[`YSYX210152_XLEN-1:0] ex_pc_next;
    wire[63:0] rs1;
    wire[63:0] rs2;
    wire div;
    wire sign1, sign2;
    wire[127:0] mul_data1;
    wire[127:0] mul_data2;

    assign rs1 = i_opinfo == `YSYX210152_Sign32 ? {{32{i_data1[31]}}, i_data1[31:0]} : i_opinfo == `YSYX210152_Unsign32 ? {32'b0, i_data1[31:0]} : i_data1;
    assign rs2 = i_opinfo == `YSYX210152_Sign32 ? {{32{i_data2[31]}}, i_data2[31:0]} : i_opinfo == `YSYX210152_Unsign32 ? {32'b0, i_data2[31:0]} : i_data2;
    assign div = i_opcode == `YSYX210152_Mcop_DIV || i_opcode == `YSYX210152_Mcop_REM;
    assign sign1 = i_opinfo == `YSYX210152_Sign64 || i_opinfo == `YSYX210152_Sign32 || i_opcode == `YSYX210152_Mcop_MULHS;
    assign sign2 = i_opinfo == `YSYX210152_Sign64 || i_opinfo == `YSYX210152_Sign32;
    ysyx_210152_mul u_mul(.rs1(rs1), .rs2(rs2), .sign1(sign1), .sign2(sign2), .x(mul_data1), .y(mul_data2));
    
    always @ (*) begin
        if (flush) begin
            ex_data1_next = 128'b0;
            ex_data2_next = 128'b0;
            ex_div_next = 1'b0;
            ex_opcode_next = 8'b0;
            ex_opinfo_next = 2'b0;
            ex_tag_next = 8'b0;
            ex_priv_next = 2'b0;
            ex_pc_next = `YSYX210152_XLEN'b0;
        end
        else if (stall) begin
            ex_data1_next = ex_data1;
            ex_data2_next = ex_data2;
            ex_div_next = ex_div;
            ex_opcode_next = ex_opcode;
            ex_opinfo_next = ex_opinfo;
            ex_tag_next = ex_tag;
            ex_priv_next = ex_priv;
            ex_pc_next = ex_pc;
        end
        else if (handshake & div) begin
            ex_data1_next = {64'b0, i_data1};
            ex_data2_next = {64'b0, i_data2};
            ex_div_next = 1'b1;
            ex_opcode_next = i_opcode;
            ex_opinfo_next = i_opinfo;
            ex_tag_next = i_tag;
            ex_priv_next = i_priv;
            ex_pc_next = i_pc;
        end
        else if (handshake) begin
            ex_data1_next = mul_data1;
            ex_data2_next = mul_data2;
            ex_div_next = 1'b0;
            ex_opcode_next = i_opcode;
            ex_opinfo_next = i_opinfo;
            ex_tag_next = i_tag;
            ex_priv_next = i_priv;
            ex_pc_next = i_pc;
        end
        else begin
            ex_data1_next = 128'b0;
            ex_data2_next = 128'b0;
            ex_div_next = 1'b0;
            ex_opcode_next = 8'b0;
            ex_opinfo_next = 2'b0;
            ex_tag_next = 8'b0;
            ex_priv_next = 2'b0;
            ex_pc_next = `YSYX210152_XLEN'b0;
        end
    end

    always @ (posedge clk or posedge arst) begin
        if (arst) begin
            ex_data1 <= 128'b0;
            ex_data2 <= 128'b0;
            ex_div <= 1'b0;
            ex_opcode <= 8'b0;
            ex_opinfo <= 2'b0;
            ex_tag <= 8'b0;
            ex_priv <= 2'b0;
            ex_pc <= `YSYX210152_XLEN'b0;
        end
        else begin
            ex_data1 <= ex_data1_next;
            ex_data2 <= ex_data2_next;
            ex_div <= ex_div_next;
            ex_opcode <= ex_opcode_next;
            ex_opinfo <= ex_opinfo_next;
            ex_tag <= ex_tag_next;
            ex_priv <= ex_priv_next;
            ex_pc <= ex_pc_next;
        end
    end
    
endmodule













module ysyx_210152_ALUcore(

    input wire              Valid,              
    input wire [7:0]        Opcode,             
    input wire [1:0]        OpInfo,             
    input wire [`YSYX210152_XLEN-1:0]  DataSource1,        
    input wire [`YSYX210152_XLEN-1:0]  DataSource2,

    output  [`YSYX210152_XLEN-1:0]  DataOut1,
    output  [`YSYX210152_XLEN-1:0]  DataOut2
);





wire [3:0] Opcode_valid ;								
assign Opcode_valid = {4{Valid}} & Opcode[3:0];			

wire op_ALU_NOP;  
wire op_ALU_JAL;  
wire op_ALU_CSRW;
wire op_ALU_CSRS;
wire op_ALU_CSRC; 
wire op_ALU_ADD;  
wire op_ALU_SUB;  
wire op_ALU_SLT;  
wire op_ALU_XOR;  
wire op_ALU_OR;   
wire op_ALU_AND;  
wire op_ALU_SL;   
wire op_ALU_SR;

assign op_ALU_NOP  = (Opcode_valid == 4'h0 || Valid == 1'b0) ? 1'b1 : 1'b0;
assign op_ALU_JAL  = (Opcode_valid == 4'h3) ? 1'b1 : 1'b0;
assign op_ALU_CSRW = (Opcode_valid == 4'h4) ? 1'b1 : 1'b0;
assign op_ALU_CSRS = (Opcode_valid == 4'h5) ? 1'b1 : 1'b0;
assign op_ALU_CSRC = (Opcode_valid == 4'h6) ? 1'b1 : 1'b0;
assign op_ALU_ADD  = (Opcode_valid == 4'h8) ? 1'b1 : 1'b0;
assign op_ALU_SUB  = (Opcode_valid == 4'hF) ? 1'b1 : 1'b0;
assign op_ALU_SLT  = (Opcode_valid == 4'h9) ? 1'b1 : 1'b0;
assign op_ALU_XOR  = (Opcode_valid == 4'hA) ? 1'b1 : 1'b0;
assign op_ALU_OR   = (Opcode_valid == 4'hB) ? 1'b1 : 1'b0;
assign op_ALU_AND  = (Opcode_valid == 4'hC) ? 1'b1 : 1'b0;
assign op_ALU_SL   = (Opcode_valid == 4'hD) ? 1'b1 : 1'b0;
assign op_ALU_SR   = (Opcode_valid == 4'hE) ? 1'b1 : 1'b0;






wire [`YSYX210152_XLEN-1:0] data_ALU_NOP_1  ,data_ALU_NOP_2;
wire [`YSYX210152_XLEN-1:0] data_ALU_JAL_1  ,data_ALU_JAL_2;
wire [`YSYX210152_XLEN-1:0] data_ALU_CSRW_1 ,data_ALU_CSRW_2;
wire [`YSYX210152_XLEN-1:0] data_ALU_CSRS_1 ,data_ALU_CSRS_2;
wire [`YSYX210152_XLEN-1:0] data_ALU_CSRC_1 ,data_ALU_CSRC_2;
wire [`YSYX210152_XLEN-1:0] data_ALU_ADD;
wire [`YSYX210152_XLEN-1:0] data_ALU_SUB;
wire [`YSYX210152_XLEN-1:0] data_ALU_SLT;
wire [`YSYX210152_XLEN-1:0] data_ALU_XOR;
wire [`YSYX210152_XLEN-1:0] data_ALU_OR;
wire [`YSYX210152_XLEN-1:0] data_ALU_AND;
wire [`YSYX210152_XLEN-1:0] data_ALU_SL;
wire [`YSYX210152_XLEN-1:0] data_ALU_SR;


wire [`YSYX210152_XLEN-1:0] add_sub_result_tem;					
wire [`YSYX210152_XLEN-1:0] add_64_tem;
wire [`YSYX210152_XLEN-1:0] sub_64_tem;


assign data_ALU_NOP_1 = DataSource1;
assign data_ALU_NOP_2 = DataSource2;


assign data_ALU_JAL_1 = op_ALU_JAL ? (DataSource1 + 4) 	: {`YSYX210152_XLEN{1'b0}};
assign data_ALU_JAL_2 = op_ALU_JAL ? DataSource2 		: {`YSYX210152_XLEN{1'b0}};


assign data_ALU_CSRW_1 = op_ALU_CSRW ? DataSource2 : {`YSYX210152_XLEN{1'b0}};
assign data_ALU_CSRW_2 = op_ALU_CSRW ? DataSource1 : {`YSYX210152_XLEN{1'b0}};


assign data_ALU_CSRS_1 = op_ALU_CSRS ? DataSource2 					: {`YSYX210152_XLEN{1'b0}};
assign data_ALU_CSRS_2 = op_ALU_CSRS ? (DataSource2 | DataSource1) 	: {`YSYX210152_XLEN{1'b0}};


assign data_ALU_CSRC_1 = op_ALU_CSRC ? DataSource2 						: {`YSYX210152_XLEN{1'b0}};
assign data_ALU_CSRC_2 = op_ALU_CSRC ? (DataSource2 &( ~DataSource1)) 	: {`YSYX210152_XLEN{1'b0}};


assign add_sub_result_tem = (op_ALU_ADD | op_ALU_SUB) ? (DataSource1 + (op_ALU_SUB ? (~DataSource2) : DataSource2)) :  {`YSYX210152_XLEN{1'b0}};
assign add_64_tem = add_sub_result_tem;
assign sub_64_tem = add_sub_result_tem + 1'b1;

assign data_ALU_ADD[63:32]= (OpInfo[1] ? {32{add_64_tem[31]}} : add_64_tem[63:32]);
assign data_ALU_ADD[31:0] =  add_64_tem[31:0];

assign data_ALU_SUB[63:32]= (OpInfo[1] ? {32{sub_64_tem[31]}} : sub_64_tem[63:32]);
assign data_ALU_SUB[31:0] =  sub_64_tem[31:0];


assign data_ALU_SLT = op_ALU_SLT ? 																					
						(((~OpInfo[0]&((~DataSource2[63] & DataSource1[63]) | 										
								(DataSource2[63] && DataSource1[63] && DataSource2 > DataSource1) |
								(!DataSource2[63] && !DataSource1[63] && DataSource2 > DataSource1)))|
					    (OpInfo[0] & DataSource2 > DataSource1)) ? 64'd1: {`YSYX210152_XLEN{1'b0}}) : {`YSYX210152_XLEN{1'b0}};			


assign data_ALU_XOR = op_ALU_XOR ? (DataSource1 ^ DataSource2) : {`YSYX210152_XLEN{1'b0}};


assign data_ALU_OR = op_ALU_OR ? (DataSource1 | DataSource2) : {`YSYX210152_XLEN{1'b0}};


assign data_ALU_AND = op_ALU_AND ? (DataSource1 & DataSource2) : {`YSYX210152_XLEN{1'b0}};







wire [5:0] shiftnum;
wire [31:0]shift0_32;
wire [31:0]shift0_u32;
wire [63:0]shift0_64;
wire [63:0]shift0_u64;
wire [31:0]shift1_32;
wire [31:0]shift1_u32;
wire [63:0]shift1_64;
wire [63:0]shift1_u64;
wire [31:0]shift2_32;
wire [31:0]shift2_u32;
wire [63:0]shift2_64;
wire [63:0]shift2_u64;
wire [31:0]shift3_32;
wire [31:0]shift3_u32;
wire [63:0]shift3_64;
wire [63:0]shift3_u64;
wire [31:0]shift4_32;
wire [31:0]shift4_u32;
wire [63:0]shift4_64;
wire [63:0]shift4_u64;
wire [63:0]shift5_32;
wire [63:0]shift5_u32;
wire [63:0]shift5_64;
wire [63:0]shift5_u64;

assign shiftnum = DataSource2[5:0];


assign shift0_32= (OpInfo == 2'b10) ?
				(shiftnum[0]?
				(op_ALU_SR ? {DataSource1[31],DataSource1[31:1]}:			
				{DataSource1[30:0],1'd0}): 									
				DataSource1[31:0])											
				: {32{1'b0}};											
assign shift1_32= shiftnum[1]?
				(op_ALU_SR ? {{2{shift0_32[31]}},shift0_32[31:2]}:			
				{shift0_32[29:0],2'd0}): 									
				shift0_32;													
assign shift2_32= shiftnum[2]?
				(op_ALU_SR ? {{4{shift1_32[31]}},shift1_32[31:4]}:			
				{shift1_32[27:0],4'd0}): 									
				shift1_32;													
assign shift3_32= shiftnum[3]?
				(op_ALU_SR ? {{8{shift2_32[31]}},shift2_32[31:8]}:			
				{shift2_32[23:0],8'd0}): 									
				shift2_32;													
assign shift4_32= shiftnum[4]?
				(op_ALU_SR ? {{16{shift3_32[31]}},shift3_32[31:16]}:		
				{shift3_32[15:0],16'd0}): 									
				shift3_32;													
assign shift5_32= {{32{shift4_32[31]}},shift4_32};							


assign shift0_u32= (OpInfo == 2'b11) ?
				(shiftnum[0]?
				(op_ALU_SR ? {1'd0,DataSource1[31:1]}:						
				{DataSource1[30:0],1'd0}): 									
				{DataSource1[31:0]})										
				: {32{1'b0}};											
assign shift1_u32= shiftnum[1]?
				(op_ALU_SR ? {2'd0,shift0_u32[31:2]}:						
				{shift0_u32[29:0],2'd0}): 									
				shift0_u32;													
assign shift2_u32= shiftnum[2]?
				(op_ALU_SR ? {4'd0,shift1_u32[31:4]}:						
				{shift1_u32[27:0],4'd0}): 									
				shift1_u32;													
assign shift3_u32= shiftnum[3]?
				(op_ALU_SR ? {8'd0,shift2_u32[31:8]}:						
				{shift2_u32[23:0],8'd0}): 									
				shift2_u32;													
assign shift4_u32= shiftnum[4]?
				(op_ALU_SR ? {16'd0,shift3_u32[31:16]}:						
				{shift3_u32[15:0],16'd0}): 									
				shift3_u32;													
assign shift5_u32= {{32{shift4_u32[31]}},shift4_u32}; 						



assign shift0_64= (OpInfo == 2'b00) ?
				(shiftnum[0]?
				(op_ALU_SR ? {{2{DataSource1[63]}},DataSource1[62:1]}:			
				{DataSource1[62:0],1'd0}): 										
				DataSource1)													
				: {`YSYX210152_XLEN{1'b0}};												
assign shift1_64= shiftnum[1]?
				(op_ALU_SR ? {{3{shift0_64[63]}},shift0_64[62:2]}:				
				{shift0_64[61:0],2'd0}): 										
				shift0_64;														
assign shift2_64= shiftnum[2]?
				(op_ALU_SR ? {{5{shift1_64[63]}},shift1_64[62:4]}:				
				{shift1_64[59:0],4'd0}): 										
				shift1_64;														
assign shift3_64= shiftnum[3]?
				(op_ALU_SR ? {{9{shift2_64[63]}},shift2_64[62:8]}:				
				{shift2_64[55:0],8'd0}): 										
				shift2_64;														
assign shift4_64= shiftnum[4]?
				(op_ALU_SR ? {{17{shift3_64[63]}},shift3_64[62:16]}:			
				{shift3_64[47:0],16'd0}): 										
				shift3_64;														
assign shift5_64= shiftnum[5]?
				(op_ALU_SR ? {{33{shift4_64[63]}},shift4_64[62:32]}:			
				{shift4_64[31:0],32'd0}): 										
				shift4_64;			


assign shift0_u64= (OpInfo == 2'b01) ?
				(shiftnum[0]?
				(op_ALU_SR ? {1'd0,DataSource1[63:1]}:				
				{DataSource1[62:0],1'd0}): 							
				DataSource1)										
				: {`YSYX210152_XLEN{1'b0}};									
assign shift1_u64= shiftnum[1]?
				(op_ALU_SR ? {2'd0,shift0_u64[63:2]}:				
				{shift0_u64[61:0],2'd0}): 							
				shift0_u64;											
assign shift2_u64= shiftnum[2]?
				(op_ALU_SR ? {4'd0,shift1_u64[63:4]}:				
				{shift1_u64[59:0],4'd0}): 							
				shift1_u64;											
assign shift3_u64= shiftnum[3]?
				(op_ALU_SR ? {8'd0,shift2_u64[63:8]}:				
				{shift2_u64[55:0],8'd0}): 							
				shift2_u64;											
assign shift4_u64= shiftnum[4]?
				(op_ALU_SR ? {16'd0,shift3_u64[63:16]}:				
				{shift3_u64[47:0],16'd0}): 							
				shift3_u64;											
assign shift5_u64= shiftnum[5]?
				(op_ALU_SR ? {32'd0,shift4_u64[63:32]}:				
				{shift4_u64[31:0],32'd0}): 							
				shift4_u64;	

assign data_ALU_SL = op_ALU_SL ? (shift5_32 | shift5_u32 | shift5_64 |shift5_u64) :{`YSYX210152_XLEN{1'b0}};
assign data_ALU_SR = op_ALU_SR ? (shift5_32 | shift5_u32 | shift5_64 |shift5_u64) :{`YSYX210152_XLEN{1'b0}};







assign DataOut1 = 	(op_ALU_NOP 	? data_ALU_NOP_1 	: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_JAL 	? data_ALU_JAL_1 	: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_CSRW 	? data_ALU_CSRW_1 	: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_CSRS 	? data_ALU_CSRS_1 	: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_CSRC 	? data_ALU_CSRC_1 	: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_ADD 	? data_ALU_ADD 		: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_SUB 	? data_ALU_SUB 		: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_SLT 	? data_ALU_SLT 		: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_XOR 	? data_ALU_XOR 		: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_OR 		? data_ALU_OR 		: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_AND 	? data_ALU_AND 		: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_SL 		? data_ALU_SL 		: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_SR 		? data_ALU_SR 		: {`YSYX210152_XLEN{1'b0}}) | 64'd0;

assign DataOut2 = 	(op_ALU_NOP 	? data_ALU_NOP_2 	: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_JAL 	? data_ALU_JAL_2 	: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_CSRW 	? data_ALU_CSRW_2 	: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_CSRS 	? data_ALU_CSRS_2 	: {`YSYX210152_XLEN{1'b0}}) |
					(op_ALU_CSRC 	? data_ALU_CSRC_2 	: {`YSYX210152_XLEN{1'b0}}) | 64'd0;





endmodule







module ysyx_210152_TrapSetup(
    input wire              CLKi, ARSTi,        
    
    output wire [`YSYX210152_XLEN-1:0] mstatus, misa, mie, mcounteren,    
    output wire [`YSYX210152_XLEN-1:0] sstatus,       sie, scounteren,    
    output reg  [`YSYX210152_XLEN-1:0] mtvec, stvec, mideleg, medeleg,
    output  reg [1:0]       privilege,                                                  
    
    input wire [11:0]       csr_index,
    input wire [`YSYX210152_XLEN-1:0]  csr_data,
    input wire              csr_wren,
    
    input wire              mret, sret,
    
    input wire              trap_s, trap_m       
);


    reg         status_tsr,     status_tw,      status_tvm, status_mxr, status_sum, status_mpriv, status_spp;
    reg         status_mpie,    status_spie,    status_mie, status_sie, status_sd;
    reg [1:0]   status_mpp,     status_fs,      status_uxl, status_sxl; 
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        status_tsr  <= 1'b0;
        status_tw   <= 1'b0;
        status_tvm  <= 1'b0;
        status_mxr  <= 1'b0;
        status_sum  <= 1'b0;
        status_mpriv<= 1'b0;
        status_mpp  <= 2'b00;
        status_spp  <= 1'b0;
        status_mpie <= 1'b0;
        status_spie <= 1'b0;
        status_mie  <= 1'b0;
        status_sie  <= 1'b0;
        privilege   <= `YSYX210152_Machine;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_mstatus_index)begin        
            status_sxl  <= csr_data[35:34];
            status_uxl  <= csr_data[33:32];
            status_tsr  <= csr_data[22];
            status_tw   <= csr_data[21];
            status_tvm  <= csr_data[20];
            status_mxr  <= csr_data[19];
            status_sum  <= csr_data[18];
            status_mpriv<= csr_data[17];
            status_fs   <= csr_data[14:13];
            status_mpp  <= csr_data[12:11];
            status_spp  <= csr_data[8];
            status_mpie <= csr_data[7];
            status_spie <= csr_data[5];
            status_mie  <= csr_data[3];
            status_sie  <= csr_data[1];
        end
        else if(csr_index == `YSYX210152_srw_sstatus_index)begin   
            status_uxl  <= csr_data[33:32];
            status_mxr  <= csr_data[19];
            status_sum  <= csr_data[18];
            status_fs   <= csr_data[14:13];
            status_spp  <= csr_data[8];
            status_spie <= csr_data[5];
            status_sie  <= csr_data[1];
        end
    end
    else if(mret)begin
        status_mie <= status_mpie;
        status_mpie<= 1'b1;
        status_mpp <= 2'b00;
        privilege  <= status_mpp;
    end
    else if(sret)begin
        status_sie <= status_spie;
        status_spie<= 1'b1;
        status_spp <= 1'b0;
        privilege  <= status_spp ? `YSYX210152_Supervisior : `YSYX210152_User;
    end
    else if(trap_m)begin                    
        status_mpie<= status_mie;
        status_mie <= 1'b0;
        status_mpp <= privilege;
        privilege  <= `YSYX210152_Machine;
    end
    else if(trap_s)begin                    
        status_spie<= status_sie;
        status_sie <= 1'b0;
        status_spp <= privilege[0];
        privilege  <= `YSYX210152_Supervisior;
    end
end
always@(*)begin
    status_sd = (status_fs==2'b11);
end



assign mstatus = {status_sd,25'b0,1'b0,1'b0,status_sxl,status_uxl,9'b0,status_tsr,status_tw,status_tvm,status_mxr,status_sum,status_mpriv,2'b0,status_fs,status_mpp,2'b00,status_spp,status_mpie,1'b0,status_spie,1'b0,status_mie,1'b0,status_sie,1'b0};
assign sstatus = {status_sd,         29'b0            ,status_uxl,                 12'b0              ,status_mxr,status_sum,     1'b0   ,2'b0,status_fs,   2'b0   ,2'b00,status_spp,        2'b0    ,status_spie,        3'b0        ,status_sie,1'b0};

    reg ie_msie, ie_mtie, ie_meie;
    reg ie_ssie, ie_stie, ie_seie;
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        ie_ssie<=	'b0;
		ie_msie<=	'b0;
		ie_stie<=	'b0;
		ie_mtie<=	'b0;
		ie_seie<=	'b0;
		ie_meie<=   'b0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_mie_index)begin
            ie_ssie<=	csr_data[1];
		    ie_msie<=	csr_data[3];
		    ie_stie<=	csr_data[5];
		    ie_mtie<=	csr_data[7];
		    ie_seie<=	csr_data[9];
		    ie_meie<=   csr_data[11];
        end
        else if(csr_index == `YSYX210152_srw_sie_index)begin
            ie_ssie<=	csr_data[1];
		    ie_stie<=	csr_data[5];
		    ie_seie<=	csr_data[9];
        end
    end
end
assign mie = {52'b0,ie_meie,1'b0,ie_seie,1'b0,ie_mtie,1'b0,ie_stie,1'b0,ie_msie,1'b0,ie_ssie,1'b0};
assign sie = {54'b0,ie_seie,3'b0,ie_stie,3'b0,ie_ssie,1'b0};


always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        stvec <= 'h0;
        mtvec <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_mtvec_index)begin
            mtvec <= csr_data;
        end
        else if(csr_index == `YSYX210152_srw_stvec_index)begin
            stvec <= csr_data;
        end
    end
end

always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        mideleg <= 'h0;
        medeleg <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_medeleg_index)begin
            medeleg <= csr_data;
        end
        else if(csr_index == `YSYX210152_mrw_mideleg_index)begin
            mideleg <= csr_data;
        end
    end
end


reg mcounteren_CY, mcounteren_TM, mcounteren_IR;
reg scounteren_CY, scounteren_TM, scounteren_IR;
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        mcounteren_CY <= 1'b0;
        mcounteren_TM <= 1'b0;
        mcounteren_IR <= 1'b0;
        scounteren_CY <= 1'b0;
        scounteren_TM <= 1'b0;
        scounteren_IR <= 1'b0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_mcounteren_index)begin
            mcounteren_CY <= csr_data[0];
            mcounteren_TM <= csr_data[1];
            mcounteren_IR <= csr_data[2];
        end
        else if(csr_index == `YSYX210152_srw_scounteren_index)begin
            scounteren_CY <= csr_data[0];
            scounteren_TM <= csr_data[1];
            scounteren_IR <= csr_data[2];
        end
    end
end
assign mcounteren = {61'b0, mcounteren_IR, mcounteren_TM, mcounteren_CY};
assign scounteren = {61'b0, scounteren_IR, scounteren_TM, scounteren_CY};
assign misa       = 64'b00000000_00000000_00000000_00000000_00000000_00001010_00000001_00000001;


endmodule








module ysyx_210152_TrapManage(

    input wire [`YSYX210152_XLEN-1:0]  instr_pc, instr_VA, instr_jmpaddr,      
    input wire [1:0]        instr_priv,
    input wire              instr_jmp,                              
    input wire              instr_system,

    input wire              NMI_EccErr, NMI_PwrLost, NMI_generic,

    input wire              mige, sige,                             
    input wire              mei,  sei,                              
    input wire              meie, seie,                             
    input wire              mti,  sti,                              
    input wire              mtie, stie,
    input wire              msi,  ssi,                              
    input wire              msie, ssie,

    input wire              ecall, ebreak,                          
    input wire              ill_ins,                                
    input wire              InstPageFlt, InstAddrMis, InstAccFlt,
    input wire              LoadPageFlt, LoadAddrMis, LoadAccFlt,
    input wire              StorePageFlt,StoreAddrMis,StoreAccFlt,

    input wire [`YSYX210152_XLEN-1:0]  csr_mideleg, csr_medeleg,

    output reg [`YSYX210152_XLEN-1:0]  trap_value, trap_cause, trap_pc,
    output reg              trap_s, trap_m, trap_async               
);
/********************************************************************************************************************
                                            关于异常委托的注意事项
中断（Interrupt）异常（Exception）在RISC-V中均称为Trap，中断委托由mideleg寄存器负责，异常委托由medeleg寄存器负责。
在M模式下运行时，低于M模式的所有中断都会被屏蔽。
在S模式下运行时，M模式的中断是全局打开状态，如果S模式的中断没有被委托给S模式，则也无条件交给M模式处理；如果S模式的一个中断被委托
给了S模式，则根据sie寄存器中的开关情况开决定S模式是否处理该中断。
在U模式下运行时候,S模式和M模式的所有中断都是全局开的状态。

**********************************************************************************************************************/

always@(*)begin
    if(instr_system)begin               
        trap_m      = 1'b0;
        trap_s      = 1'b0;
        trap_async  = 1'b0;
        trap_cause  = 'h0;
        trap_value  = 'hx;
        trap_pc     = 'hx;
    end
    else begin
    case(instr_priv)
        
        `YSYX210152_Machine :
        begin
            
            if(InstPageFlt)begin                        
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_InstrPageFlt;       
                trap_value  = instr_pc;
                trap_pc     = instr_pc;
            end
            else if(InstAccFlt)begin                    
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_InstrAccFlt;
                trap_value  = instr_pc;
                trap_pc     = instr_pc;
            end
            else if(ill_ins)begin                       
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_illins;
                trap_value  = 'd0;                     
                trap_pc     = instr_pc;
            end
            else if(InstAddrMis)begin                   
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_InstrAddrMis;
                trap_value  = instr_pc;
                trap_pc     = instr_pc;
            end
            else if(ecall)begin                         
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_EcallFromM;
                trap_value  = 64'h0;
                trap_pc     = instr_pc;                 
            end
            else if(ebreak)begin                        
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_BreakPoint;
                trap_value  = instr_pc;
                trap_pc     = instr_pc + 'd4;          
            end
            else if(LoadAddrMis)begin                   
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_LoadAddrMis;
                trap_value  = instr_VA;
                trap_pc     = instr_pc;
            end
            else if(StoreAddrMis)begin                  
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_StoreAddrMis;
                trap_value  = instr_VA;
                trap_pc     = instr_pc;
            end
            else if(LoadPageFlt)begin                   
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_LoadPageFlt;
                trap_value  = instr_VA;
                trap_pc     = instr_pc;
            end
            else if(StorePageFlt)begin                  
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_StorePageFlt;
                trap_value  = instr_VA;
                trap_pc     = instr_pc;
            end
            else if(LoadAccFlt)begin
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_LoadAccFlt;
                trap_value  = instr_VA;
                trap_pc     = instr_pc;
            end
            else if(StoreAccFlt)begin
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = `YSYX210152_exc_StoreAccFlt;
                trap_value  = instr_VA;
                trap_pc     = instr_pc;
            end
            
            else if(NMI_PwrLost)begin                   
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_nmi_PwrLost;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(NMI_EccErr)begin                    
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_nmi_EccErr;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(NMI_generic)begin                   
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_nmi_generic;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            
            
            else if(mige)begin                              
                if(mti & mtie)begin                           
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_m_timer;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
                end
                else if(mei & meie)begin                           
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_m_exter;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
                end
                else if(msi & msie)begin                           
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_m_soft;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
                end
                else begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = 'dx;
                    trap_value  = 'dx;
                    trap_pc     = 'dx;
                end
            end
            else begin
                trap_m      = 1'b0;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = 'dx;
                trap_value  = 'dx;
                trap_pc     = 'dx;
            end
        end
        
        `YSYX210152_Supervisior :
        begin
            
            if(InstPageFlt)begin                        
                if(csr_medeleg[`YSYX210152_exc_InstrPageFlt])begin 
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrPageFlt;       
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
                else begin                              
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrPageFlt;       
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
            end
            else if(InstAccFlt)begin                    
                if(csr_medeleg[`YSYX210152_exc_InstrAccFlt])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrAccFlt;
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrAccFlt;
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
            end
            else if(ill_ins)begin                       
                if(csr_medeleg[`YSYX210152_exc_illins])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_illins;
                    trap_value  = 'd0;                     
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_illins;
                    trap_value  = 'd0;                     
                    trap_pc     = instr_pc;
                end
            end
            else if(InstAddrMis)begin                   
                if(csr_medeleg[`YSYX210152_exc_InstrAddrMis])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrAddrMis;
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrAddrMis;
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
            end
            else if(ecall)begin                         
                if(csr_medeleg[`YSYX210152_exc_EcallFromS])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_EcallFromS;
                    trap_value  = instr_pc;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);          
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_EcallFromS;
                    trap_value  = instr_pc;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);          
                end
            end
            else if(ebreak)begin                        
                if(csr_medeleg[`YSYX210152_exc_BreakPoint])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_BreakPoint;
                    trap_value  = instr_pc;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);          
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_BreakPoint;
                    trap_value  = instr_pc;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);          
                end
            end
            else if(LoadAddrMis)begin                   
                if(csr_medeleg[`YSYX210152_exc_LoadAddrMis])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadAddrMis;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadAddrMis;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            else if(StoreAddrMis)begin                  
                if(csr_medeleg[`YSYX210152_exc_StoreAddrMis])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StoreAddrMis;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StoreAddrMis;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            else if(LoadPageFlt)begin                   
                if(csr_medeleg[`YSYX210152_exc_LoadPageFlt])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadPageFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadPageFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            else if(StorePageFlt)begin                  
                if(csr_medeleg[`YSYX210152_exc_StorePageFlt])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StorePageFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StorePageFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            else if(LoadAccFlt)begin                  
                if(csr_medeleg[`YSYX210152_exc_LoadAccFlt])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadAccFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadAccFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            else if(StoreAccFlt)begin                  
                if(csr_medeleg[`YSYX210152_exc_StoreAccFlt])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StoreAccFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StoreAccFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            
            
            else if(NMI_PwrLost)begin                   
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_nmi_PwrLost;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(NMI_EccErr)begin                    
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_nmi_EccErr;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(NMI_generic)begin                   
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_nmi_generic;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            
            
            else if(mti)begin                           
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_int_m_timer;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(mei)begin                           
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_int_m_exter;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(msi)begin                           
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_int_m_soft;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(sti)begin                           
                if(csr_mideleg[`YSYX210152_int_s_timer])begin          
                    if(stie & sige)begin
                        trap_m      = 1'b0;
                        trap_s      = 1'b1;
                        trap_async  = 1'b1;
                        trap_cause  = `YSYX210152_int_s_timer;
                        trap_value  = 'd0;
                        trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
                    end
                    else begin
                        trap_m      = 1'b0;
                        trap_s      = 1'b0;
                        trap_async  = 1'b0;
                        trap_cause  = 'dx;
                        trap_value  = 'dx;
                        trap_pc     = 'dx;
                    end
                end
                else begin                              
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_s_timer;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4); 
                end
            end
            else if(sei)begin                           
                if(csr_mideleg[`YSYX210152_int_s_exter])begin          
                    if(stie & sige)begin
                        trap_m      = 1'b0;
                        trap_s      = 1'b1;
                        trap_async  = 1'b1;
                        trap_cause  = `YSYX210152_int_s_exter;
                        trap_value  = 'd0;
                        trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
                    end
                    else begin
                        trap_m      = 1'b0;
                        trap_s      = 1'b0;
                        trap_async  = 1'b0;
                        trap_cause  = 'dx;
                        trap_value  = 'dx;
                        trap_pc     = 'dx;
                    end
                end
                else begin                              
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_s_exter;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4); 
                end
            end
            else if(ssi)begin                           
                if(csr_mideleg[`YSYX210152_int_s_soft])begin           
                    if(stie & sige)begin
                        trap_m      = 1'b0;
                        trap_s      = 1'b1;
                        trap_async  = 1'b1;
                        trap_cause  = `YSYX210152_int_s_soft;
                        trap_value  = 'd0;
                        trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
                    end
                    else begin
                        trap_m      = 1'b0;
                        trap_s      = 1'b0;
                        trap_async  = 1'b0;
                        trap_cause  = 'dx;
                        trap_value  = 'dx;
                        trap_pc     = 'dx;
                    end
                end
                else begin                              
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_s_soft;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4); 
                end
            end
            else begin
                trap_m      = 1'b0;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = 'dx;
                trap_value  = 'dx;
                trap_pc     = 'dx;
            end
        end
        
        `YSYX210152_User :
        begin
            
            if(InstPageFlt)begin                        
                if(csr_medeleg[`YSYX210152_exc_InstrPageFlt])begin 
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrPageFlt;       
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
                else begin                              
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrPageFlt;       
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
            end
            else if(InstAccFlt)begin                    
                if(csr_medeleg[`YSYX210152_exc_InstrAccFlt])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrAccFlt;
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrAccFlt;
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
            end
            else if(ill_ins)begin                       
                if(csr_medeleg[`YSYX210152_exc_illins])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_illins;
                    trap_value  = 'd0;                     
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_illins;
                    trap_value  = 'd0;                     
                    trap_pc     = instr_pc;
                end
            end
            else if(InstAddrMis)begin                   
                if(csr_medeleg[`YSYX210152_exc_InstrAddrMis])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrAddrMis;
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_InstrAddrMis;
                    trap_value  = instr_pc;
                    trap_pc     = instr_pc;
                end
            end
            else if(ecall)begin                         
                if(csr_medeleg[`YSYX210152_exc_EcallFromS])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_EcallFromS;
                    trap_value  = instr_pc;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);          
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_EcallFromS;
                    trap_value  = instr_pc;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);          
                end
            end
            else if(ebreak)begin                        
                if(csr_medeleg[`YSYX210152_exc_BreakPoint])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_BreakPoint;
                    trap_value  = instr_pc;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);          
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_BreakPoint;
                    trap_value  = instr_pc;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);          
                end
            end
            else if(LoadAddrMis)begin                   
                if(csr_medeleg[`YSYX210152_exc_LoadAddrMis])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadAddrMis;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadAddrMis;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            else if(StoreAddrMis)begin                  
                if(csr_medeleg[`YSYX210152_exc_StoreAddrMis])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StoreAddrMis;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StoreAddrMis;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            else if(LoadPageFlt)begin                   
                if(csr_medeleg[`YSYX210152_exc_LoadPageFlt])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadPageFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadPageFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            else if(StorePageFlt)begin                  
                if(csr_medeleg[`YSYX210152_exc_StorePageFlt])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StorePageFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StorePageFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            else if(LoadAccFlt)begin                  
                if(csr_medeleg[`YSYX210152_exc_LoadAccFlt])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadAccFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_LoadAccFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            else if(StoreAccFlt)begin                  
                if(csr_medeleg[`YSYX210152_exc_StoreAccFlt])begin
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StoreAccFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
                else begin
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b0;
                    trap_cause  = `YSYX210152_exc_StoreAccFlt;
                    trap_value  = instr_VA;
                    trap_pc     = instr_pc;
                end
            end
            
            
            else if(NMI_PwrLost)begin                   
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_nmi_PwrLost;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(NMI_EccErr)begin                    
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_nmi_EccErr;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(NMI_generic)begin                   
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_nmi_generic;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            
            
            else if(mti)begin                           
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_int_m_timer;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(mei)begin                           
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_int_m_exter;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(msi)begin                           
                trap_m      = 1'b1;
                trap_s      = 1'b0;
                trap_async  = 1'b1;
                trap_cause  = `YSYX210152_int_m_soft;
                trap_value  = 'd0;
                trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
            end
            else if(sti)begin                           
                if(csr_mideleg[`YSYX210152_int_s_timer])begin          
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_s_timer;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
                end
                else begin                              
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_s_timer;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4); 
                end
            end
            else if(sei)begin                           
                if(csr_mideleg[`YSYX210152_int_s_exter])begin          
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_s_exter;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
                end
                else begin                              
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_s_exter;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4); 
                end
            end
            else if(ssi)begin                           
                if(csr_mideleg[`YSYX210152_int_s_soft])begin           
                    trap_m      = 1'b0;
                    trap_s      = 1'b1;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_s_soft;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4);
                end
                else begin                              
                    trap_m      = 1'b1;
                    trap_s      = 1'b0;
                    trap_async  = 1'b1;
                    trap_cause  = `YSYX210152_int_s_soft;
                    trap_value  = 'd0;
                    trap_pc     = instr_jmp ? instr_jmpaddr : (instr_pc + 'd4); 
                end
            end
            else begin
                trap_m      = 1'b0;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = 'dx;
                trap_value  = 'dx;
                trap_pc     = 'dx;
            end
        end
        default:
        begin
                trap_m      = 1'b0;
                trap_s      = 1'b0;
                trap_async  = 1'b0;
                trap_cause  = 'dx;
                trap_value  = 'dx;
                trap_pc     = 'dx;
        end
    endcase
    end
end

endmodule












module ysyx_210152_TrapHandle(
    input wire              CLKi, ARSTi,        
    
    input wire              Interrupt_MEI, Interrupt_MSI, Interrupt_MTI,
    input wire              Interrupt_SEI,
    
    output wire [`YSYX210152_XLEN-1:0] mip, sip,
    output reg  [`YSYX210152_XLEN-1:0] mscratch, mepc, mcause, mtval,
    output reg  [`YSYX210152_XLEN-1:0] sscratch, sepc, scause, stval,
    
    input wire [11:0]       csr_index,
    input wire [`YSYX210152_XLEN-1:0]  csr_data,
    input wire              csr_wren,
    
    input wire              trap_m, trap_s, trap_async,
    input wire [`YSYX210152_XLEN-1:0]  trap_pc, trap_value, trap_cause
);

    
    
    reg ip_meip, ip_msip, ip_mtip, ip_seip1, ip_seip2, ip_ssip, ip_stip;
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        ip_seip2<= 1'b0;
        ip_ssip <= 1'b0;
        ip_stip <= 1'b0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_mip_index)begin
            ip_seip2<= csr_data[9];
            ip_stip <= csr_data[5];
            ip_ssip <= csr_data[1];
        end
    end
end
    
always@(posedge CLKi)begin
    ip_meip <= Interrupt_MEI;
    ip_msip <= Interrupt_MSI;
    ip_mtip <= Interrupt_MTI;
    ip_seip1<= Interrupt_SEI;
end
assign mip = {52'b0,ip_meip,1'b0,(ip_seip1|ip_seip2),1'b0,ip_mtip,1'b0,ip_stip,1'b0,ip_msip,1'b0,ip_ssip,1'b0};
assign sip = {54'b0,(ip_seip1|ip_seip2),3'b0,ip_stip,3'b0,ip_ssip,1'b0};

always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        mscratch <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_mscratch_index)begin
            mscratch <= csr_data;
        end
    end
end
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        sscratch <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_srw_sscratch_index)begin
            sscratch <= csr_data;
        end
    end
end

always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        mepc <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_mepc_index)begin
            mepc <= csr_data;
        end
    end
    else if(trap_m)begin
        mepc <= trap_pc;
    end
end
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        sepc <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_srw_sepc_index)begin
            sepc <= csr_data;
        end
    end
    else if(trap_s)begin
        sepc <= trap_pc;
    end
end

always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        mcause <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_mcause_index)begin
            mcause <= csr_data;
        end
    end
    else if(trap_m)begin
        mcause <= trap_async ? {1'b1,trap_cause[62:0]} : trap_cause;
    end
end
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        scause <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_srw_scause_index)begin
            scause <= csr_data;
        end
    end
    else if(trap_s)begin
        scause <= trap_async ? {1'b1,trap_cause[62:0]} : trap_cause;
    end
end

always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        mtval <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_mtval_index)begin
            mtval <= csr_data;
        end
    end
    else if(trap_m)begin
        mtval <= trap_value;
    end
end
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        stval <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_srw_stval_index)begin
            stval <= csr_data;
        end
    end
    else if(trap_s)begin
        stval <= trap_value;
    end
end

endmodule






module ysyx_210152_InformCSR
#(
    parameter HARTID = 64'h0
)
(
    input wire              CLKi, ARSTi,        
    output wire [`YSYX210152_XLEN-1:0] mhartid, mvendorid, marchid, 
    output reg  [`YSYX210152_XLEN-1:0] mimpid,
    output reg              CSR_InhibitIcache,  
    output reg              CSR_InhibitDcache,  
    output reg              CSR_DCacheWT,       
    
    input wire [11:0]       csr_index,
    input wire [`YSYX210152_XLEN-1:0]  csr_data,
    input wire              csr_wren
);

    reg [7:0] eva;
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        eva <= 8'hff;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_evangelion_index)begin
            eva <= csr_data[7:0];
        end
    end
end

always@(*)begin
    case(eva)
        8'd0 : mimpid = 64'h004179616e616d69;
        8'd1 : mimpid = 64'h00005368696e6a69;
        8'd2 : mimpid = 64'h0000004173756b61;
    default  : mimpid = 64'h0000000000000000;
    endcase
end

always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        CSR_InhibitIcache   <= `YSYX210152_ICacheForceInhibit;
        CSR_InhibitDcache   <= `YSYX210152_DCacheForceInhibit;
        CSR_DCacheWT        <= `YSYX210152_CacheWTDefaultSwitch;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_kernelcfg_index)begin
            CSR_InhibitIcache   <= csr_data[0];
            CSR_InhibitDcache   <= csr_data[2];
            CSR_DCacheWT        <= csr_data[4];
        end
    end
end

assign mhartid      = HARTID;
assign mvendorid    = 64'h004b6f726f6c6576;     
assign marchid      = 64'h0000566f73746f6b;     

endmodule












module ysyx_210152_Counter(
    input wire              CLKi, ARSTi,        
    input wire              wb_valid,           
    
    input wire [11:0]       csr_index,
    input wire [`YSYX210152_XLEN-1:0]  csr_data,
    input wire              csr_wren,
    
    output reg [`YSYX210152_XLEN-1:0]  mcycle, minstret,
    output wire [`YSYX210152_XLEN-1:0] mcountinhibit
);

reg mcountinhibit_CY, mcountinhibit_IR;
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        mcountinhibit_CY <= 1'b0;
        mcountinhibit_IR <= 1'b0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_mcountinhibit_index)begin
            mcountinhibit_CY <= csr_data[0];
            mcountinhibit_IR <= csr_data[2];
        end
    end
end
assign mcountinhibit = {61'b0,mcountinhibit_IR,1'b0,mcountinhibit_CY};

always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        mcycle <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_mcycle_index)begin
            mcycle <= csr_data;
        end
    end
    else begin
        mcycle <= mcountinhibit_CY ? mcycle : (mcycle + 'd1);
    end
end
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        minstret <= 'h0;
    end
    else if(csr_wren)begin
        if(csr_index == `YSYX210152_mrw_minstret_index)begin
            minstret <= csr_data;
        end
    end
    else if(wb_valid)begin                      
        minstret <= mcountinhibit_IR ? minstret : (minstret + 'd1);
    end
end

endmodule







module ysyx_210152_SyncFIFO
#(
    parameter   DWID = 8,
                DDEPTH = 64
)
(
    input clk,rst,
    input ren,wen,
    input [DWID-1:0]wdata,
    output[DWID-1:0]rdata,
    output reg full,
    output empty
);
localparam CNTWID = $clog2(DDEPTH)+1;
reg empty_ff;
reg [CNTWID-1:0] wptr;
reg [CNTWID-1:0] rptr;
wire [CNTWID-1:0] wptr_next,rptr_next;
reg [DWID-1:0]memory[DDEPTH-1:0];
wire full_cmp,empty_cmp;
wire wen_internal,ren_internal;

assign wen_internal=wen;
assign ren_internal=ren;
assign full_cmp=(rptr_next=={!wptr_next[CNTWID-1],wptr_next[CNTWID-2:0]});
assign empty_cmp=(wptr_next==rptr_next);
assign wptr_next=(full)?wptr:wptr+wen_internal;
assign rptr_next=(empty_ff)?rptr:rptr+ren_internal;
assign empty=empty_ff;
always@(posedge clk or posedge rst)
begin
    if(rst) 
    begin
        wptr<=0;
        rptr<=0;
    end
    else
    begin
        if(wen_internal) 
            wptr<=wptr_next;
        else 
            wptr<=wptr;
        if(ren_internal)
            rptr<=rptr_next;
        else
            rptr<=rptr;
    end
end



wire [CNTWID-1:0]dread_ptr;
assign dread_ptr=rptr-empty_ff;
assign rdata=memory[dread_ptr[CNTWID-2:0]];




always@(posedge clk)
begin
    if(wen)
        memory[wptr[CNTWID-2:0]]<=wdata;
    else 
        memory[wptr[CNTWID-2:0]]<=memory[wptr[CNTWID-2:0]];
end

always@(posedge clk or posedge rst)
begin
    if(rst) 
    begin
        full<=0;
        empty_ff<=1'b1;
    end
    else 
    begin
        
            full<=full_cmp;
        
            empty_ff<=empty_cmp;
    end
end

endmodule











module ysyx_210152_commit(
    input wire              Global_CLK,
    input wire              Global_ARST,

    input wire              NMI_EccErr, NMI_PwrLost, NMI_generic,

    input wire [`YSYX210152_XLEN-1:0]  CSR_mideleg, CSR_medeleg,
    input wire [`YSYX210152_XLEN-1:0]  CSR_mip, CSR_mie,
    input wire              CSR_mige, CSR_sige,
    input wire              Global_Flush,

    input  wire             PIP0i_MSC_valid,
    input  wire             PIP0i_MSC_LoadPageFlt,
    input  wire             PIP0i_MSC_LoadAccFlt,
    input  wire             PIP0i_MSC_LoadAddrMis,
    input  wire             PIP0i_MSC_StorePageFlt,
    input  wire             PIP0i_MSC_StoreAccFlt,
    input  wire             PIP0i_MSC_StoreAddrMis,
    input  wire             PIP0i_INFO_ci,
    input  wire [7:0]       PIP0i_INFO_itag,
    input  wire [`YSYX210152_XLEN-1:0] PIP0i_INFO_pc,
    input  wire [1:0]       PIP0i_INFO_priv,
    input  wire [`YSYX210152_XLEN-1:0] PIP0i_DATA_data1,
    input  wire [`YSYX210152_XLEN-1:0] PIP0i_DATA_data2,
    output wire             PIP0o_FC_ready,

    input  wire             PIP1i_MSC_valid,
    input  wire             PIP1i_MSC_LoadPageFlt,
    input  wire             PIP1i_MSC_LoadAccFlt,
    input  wire             PIP1i_MSC_LoadAddrMis,
    input  wire             PIP1i_MSC_StorePageFlt,
    input  wire             PIP1i_MSC_StoreAccFlt,
    input  wire             PIP1i_MSC_StoreAddrMis,
    input  wire             PIP1i_INFO_ci,
    input  wire [7:0]       PIP1i_INFO_itag,
    input  wire [`YSYX210152_XLEN-1:0] PIP1i_INFO_pc,
    input  wire [1:0]       PIP1i_INFO_priv,
    input  wire [`YSYX210152_XLEN-1:0] PIP1i_DATA_data1,
    input  wire [`YSYX210152_XLEN-1:0] PIP1i_DATA_data2,
    output wire             PIP1o_FC_ready,

    input  wire             PIP2i_MSC_valid,
    input  wire             PIP2i_MSC_LoadPageFlt,
    input  wire             PIP2i_MSC_LoadAccFlt,
    input  wire             PIP2i_MSC_LoadAddrMis,
    input  wire             PIP2i_MSC_StorePageFlt,
    input  wire             PIP2i_MSC_StoreAccFlt,
    input  wire             PIP2i_MSC_StoreAddrMis,
    input  wire             PIP2i_INFO_ci,
    input  wire [7:0]       PIP2i_INFO_itag,
    input  wire [`YSYX210152_XLEN-1:0] PIP2i_INFO_pc,
    input  wire [1:0]       PIP2i_INFO_priv,
    input  wire [`YSYX210152_XLEN-1:0] PIP2i_DATA_data1,
    input  wire [`YSYX210152_XLEN-1:0] PIP2i_DATA_data2,
    output wire             PIP2o_FC_ready,

    input  wire             DITFo_v,                    
    input  wire [7:0]       DITFo_itag,                 




    input  wire [4:0]       DITFo_rdindex,
    input  wire             DITFo_rden,                 
    input  wire [11:0]      DITFo_csrindex,
    input  wire             DITFo_csren,                
    input  wire             DITFo_jmp,
    input  wire             DITFo_InsAccessFlt,
    input  wire             DITFo_InsPageFlt,
    input  wire             DITFo_InsAddrMis,
    input  wire             DITFo_illins,
    input  wire             DITFo_mret,
    input  wire             DITFo_sret,
    input  wire             DITFo_ecall,
    input  wire             DITFo_ebreak,
    input  wire             DITFo_fence,
    input  wire             DITFo_fencei,
    input  wire             DITFo_fencevma,
    input  wire             DITFo_system,
    output wire             DITFi_remove,               

    output  reg             CMT_valid,
    output  reg             CMT_GPRwen,
    output  reg [4:0]       CMT_GPRwindex,
    output  reg [`YSYX210152_XLEN-1:0] CMT_data1,
    output  reg [`YSYX210152_XLEN-1:0] CMT_data2,
    output  reg             CMT_csren,
    output  reg [11:0]      CMT_csrindex,
    output  reg [`YSYX210152_XLEN-1:0] CMT_pc,                      
	output  reg [1:0]       CMT_priv,
    output  reg             CMT_ci,                     
    
    output reg [`YSYX210152_XLEN-1:0]  CMT_trap_value, CMT_trap_cause, CMT_trap_pc,
    output reg              CMT_trap_s, CMT_trap_m, CMT_trap_async,               
    output reg              CMT_mret,
    output reg              CMT_sret,
    output  reg             CMT_fence,
    output  reg             CMT_fencei,
    output  reg             CMT_fencevma,
    output  reg             CMT_system
);

    wire             WB_valid;
    wire             WB_rden;
    wire [4:0]       WB_rdindex;
    wire [`YSYX210152_XLEN-1:0] WB_data1;
    wire             WB_csren;
    wire [11:0]      WB_csrindex;
    wire [`YSYX210152_XLEN-1:0] WB_data2;
    wire [`YSYX210152_XLEN-1:0] WB_pc;                      
	wire [1:0]       WB_priv;
    wire             WB_ci;
    wire             WB_jmp;
    wire             WB_InstAccFlt;
    wire             WB_InstPageFlt;
    wire             WB_InstAddrMis;
    wire             WB_LoadAccFlt;
    wire             WB_LoadPageFlt;
    wire             WB_LoadAddrMis;
    wire             WB_StoreAccFlt;
    wire             WB_StorePageFlt;
    wire             WB_StoreAddrMis;
    wire             WB_illins;
    wire             WB_mret;
    wire             WB_sret;
    wire             WB_ecall;
    wire             WB_ebreak;
    wire             WB_fence;
    wire             WB_fencei;
    wire             WB_fencevma;
    wire             WB_system;

    wire [`YSYX210152_XLEN-1:0] trap_cause,    trap_value, trap_pc;
    wire             trap_m,        trap_s,     trap_async;
ysyx_210152_WB_select               WB_select(
    .Global_Flush                (Global_Flush),
    .PIP0i_MSC_valid             (PIP0i_MSC_valid),
    .PIP0i_MSC_LoadPageFlt       (PIP0i_MSC_LoadPageFlt),
    .PIP0i_MSC_LoadAccFlt        (PIP0i_MSC_LoadAccFlt),
    .PIP0i_MSC_LoadAddrMis       (PIP0i_MSC_LoadAddrMis),
    .PIP0i_MSC_StorePageFlt      (PIP0i_MSC_StorePageFlt),
    .PIP0i_MSC_StoreAccFlt       (PIP0i_MSC_StoreAccFlt),
    .PIP0i_MSC_StoreAddrMis      (PIP0i_MSC_StoreAddrMis),
    .PIP0i_INFO_ci               (PIP0i_INFO_ci),
    .PIP0i_INFO_itag             (PIP0i_INFO_itag),
    .PIP0i_INFO_pc               (PIP0i_INFO_pc),
    .PIP0i_INFO_priv             (PIP0i_INFO_priv),
    .PIP0i_DATA_data1            (PIP0i_DATA_data1),
    .PIP0i_DATA_data2            (PIP0i_DATA_data2),
    .PIP0o_FC_ready              (PIP0o_FC_ready),
    
    .PIP1i_MSC_valid             (PIP1i_MSC_valid),
    .PIP1i_MSC_LoadPageFlt       (PIP1i_MSC_LoadPageFlt),
    .PIP1i_MSC_LoadAccFlt        (PIP1i_MSC_LoadAccFlt),
    .PIP1i_MSC_LoadAddrMis       (PIP1i_MSC_LoadAddrMis),
    .PIP1i_MSC_StorePageFlt      (PIP1i_MSC_StorePageFlt),
    .PIP1i_MSC_StoreAccFlt       (PIP1i_MSC_StoreAccFlt),
    .PIP1i_MSC_StoreAddrMis      (PIP1i_MSC_StoreAddrMis),
    .PIP1i_INFO_ci               (PIP1i_INFO_ci),
    .PIP1i_INFO_itag             (PIP1i_INFO_itag),
    .PIP1i_INFO_pc               (PIP1i_INFO_pc),
    .PIP1i_INFO_priv             (PIP1i_INFO_priv),
    .PIP1i_DATA_data1            (PIP1i_DATA_data1),
    .PIP1i_DATA_data2            (PIP1i_DATA_data2),
    .PIP1o_FC_ready              (PIP1o_FC_ready),
    
    .PIP2i_MSC_valid             (PIP2i_MSC_valid),
    .PIP2i_MSC_LoadPageFlt       (PIP2i_MSC_LoadPageFlt),
    .PIP2i_MSC_LoadAccFlt        (PIP2i_MSC_LoadAccFlt),
    .PIP2i_MSC_LoadAddrMis       (PIP2i_MSC_LoadAddrMis),
    .PIP2i_MSC_StorePageFlt      (PIP2i_MSC_StorePageFlt),
    .PIP2i_MSC_StoreAccFlt       (PIP2i_MSC_StoreAccFlt),
    .PIP2i_MSC_StoreAddrMis      (PIP2i_MSC_StoreAddrMis),
    .PIP2i_INFO_ci               (PIP2i_INFO_ci),
    .PIP2i_INFO_itag             (PIP2i_INFO_itag),
    .PIP2i_INFO_pc               (PIP2i_INFO_pc),
    .PIP2i_INFO_priv             (PIP2i_INFO_priv),
    .PIP2i_DATA_data1            (PIP2i_DATA_data1),
    .PIP2i_DATA_data2            (PIP2i_DATA_data2),
    .PIP2o_FC_ready              (PIP2o_FC_ready),
    
    .DITFo_v                     (DITFo_v),
    .DITFo_itag                  (DITFo_itag),
    .DITFo_rdindex               (DITFo_rdindex),
    .DITFo_rden                  (DITFo_rden),
    .DITFo_csrindex              (DITFo_csrindex),
    .DITFo_csren                 (DITFo_csren),
    .DITFo_jmp                   (DITFo_jmp),
    .DITFo_InsAccessFlt          (DITFo_InsAccessFlt),
    .DITFo_InsPageFlt            (DITFo_InsPageFlt),
    .DITFo_InsAddrMis            (DITFo_InsAddrMis),
    .DITFo_illins                (DITFo_illins),
    .DITFo_mret                  (DITFo_mret),
    .DITFo_sret                  (DITFo_sret),
    .DITFo_ecall                 (DITFo_ecall),
    .DITFo_ebreak                (DITFo_ebreak),
    .DITFo_fence                 (DITFo_fence),
    .DITFo_fencei                (DITFo_fencei),
    .DITFo_fencevma              (DITFo_fencevma),
    .DITFo_system                (DITFo_system),
    .DITFi_remove                (DITFi_remove),
    
    .WB_valid                    (WB_valid),
    .WB_rden                     (WB_rden),
    .WB_rdindex                  (WB_rdindex),
    .WB_data1                    (WB_data1),
    .WB_csren                    (WB_csren),
    .WB_csrindex                 (WB_csrindex),
    .WB_data2                    (WB_data2),
    .WB_pc                       (WB_pc),
    .WB_priv                     (WB_priv),
    .WB_jmp                      (WB_jmp),
    .WB_ci                       (WB_ci),
    .WB_InsAccFlt                (WB_InstAccFlt),
    .WB_InsPageFlt               (WB_InstPageFlt),
    .WB_InsAddrMis               (WB_InstAddrMis),
    .WB_LoadAccFlt               (WB_LoadAccFlt),
    .WB_LoadPageFlt              (WB_LoadPageFlt),
    .WB_LoadAddrMis              (WB_LoadAddrMis),
    .WB_StoreAccFlt              (WB_StoreAccFlt),
    .WB_StorePageFlt             (WB_StorePageFlt),
    .WB_StoreAddrMis             (WB_StoreAddrMis),
    .WB_illins                   (WB_illins),
    .WB_mret                     (WB_mret),
    .WB_sret                     (WB_sret),
    .WB_ecall                    (WB_ecall),
    .WB_ebreak                   (WB_ebreak),
    .WB_fence                    (WB_fence),
    .WB_fencei                   (WB_fencei),
    .WB_fencevma                 (WB_fencevma),
    .WB_system                   (WB_system)
);
ysyx_210152_TrapManage   TrapManage(

    .instr_pc           (WB_pc), 
    .instr_VA           (WB_data2), 
    .instr_jmpaddr      (WB_data2),
    .instr_priv         (WB_priv),
    .instr_jmp          (WB_jmp),
    .instr_system       (WB_system),

    .NMI_EccErr         (NMI_EccErr), 
    .NMI_PwrLost        (NMI_PwrLost), 
    .NMI_generic        (NMI_generic),

    .mige               (CSR_mige), 
    .sige               (CSR_sige),                     
    .mei                (CSR_mip[11]),  
    .sei                (CSR_mip[9]),                   
    .meie               (CSR_mie[11]), 
    .seie               (CSR_mie[9]),                   
    .mti                (CSR_mip[7]),  
    .sti                (CSR_mip[5]),                   
    .mtie               (CSR_mie[7]), 
    .stie               (CSR_mie[5]),
    .msi                (CSR_mip[3]),  
    .ssi                (CSR_mip[1]),                   
    .msie               (CSR_mie[3]), 
    .ssie               (CSR_mie[1]),

    .ecall              (WB_ecall), 
    .ebreak             (WB_ebreak),                         
    .ill_ins            (WB_illins),                         
    .InstPageFlt        (WB_InstPageFlt), 
    .InstAddrMis        (WB_InstAddrMis), 
    .InstAccFlt         (WB_InstAccFlt),
    .LoadPageFlt        (WB_LoadPageFlt), 
    .LoadAddrMis        (WB_LoadAddrMis), 
    .LoadAccFlt         (WB_LoadAccFlt),
    .StorePageFlt       (WB_StorePageFlt),
    .StoreAddrMis       (WB_StoreAddrMis),
    .StoreAccFlt        (WB_StoreAccFlt),

    .csr_mideleg        (CSR_mideleg), 
    .csr_medeleg        (CSR_medeleg),

    .trap_value         (trap_value), 
    .trap_cause         (trap_cause), 
    .trap_pc            (trap_pc),
    .trap_s             (trap_s), 
    .trap_m             (trap_m), 
    .trap_async         (trap_async)
);

always@(posedge Global_CLK or posedge Global_ARST)begin
    if(Global_ARST)begin
        CMT_valid       <= 1'b0;
        CMT_GPRwen      <= 1'b0;
        CMT_GPRwindex   <= 5'hx;
        CMT_data1       <= 64'hx;
        CMT_data2       <= 64'hx;
        CMT_csren       <= 1'b0;
        CMT_csrindex    <= 12'hx;
        CMT_pc          <= 64'hx;       
	    CMT_priv        <= 64'hx;
        CMT_ci          <= 1'bx;
    
        CMT_trap_value  <= 64'hx;
        CMT_trap_cause  <= 64'hx;
        CMT_trap_pc     <= 64'hx;
        CMT_trap_s      <= 1'b0;
        CMT_trap_m      <= 1'b0;
        CMT_trap_async  <= 1'b0;         
        CMT_mret        <= 1'b0;
        CMT_sret        <= 1'b0;
        CMT_fence       <= 1'b0;
        CMT_fencei      <= 1'b0;
        CMT_fencevma    <= 1'b0;
        CMT_system      <= 1'b0;
    end
    else if(Global_Flush)begin
        CMT_valid       <= 1'b0;
        CMT_GPRwen      <= 1'b0;
        CMT_GPRwindex   <= 5'hx;
        CMT_data1       <= 64'hx;
        CMT_data2       <= 64'hx;
        CMT_csren       <= 1'b0;
        CMT_csrindex    <= 12'hx;
        CMT_pc          <= 64'hx;       
	    CMT_priv        <= 64'hx;
        CMT_ci          <= 1'b0;
    
        CMT_trap_value  <= 64'hx;
        CMT_trap_cause  <= 64'hx;
        CMT_trap_pc     <= 64'hx;
        CMT_trap_s      <= 1'b0;
        CMT_trap_m      <= 1'b0;
        CMT_trap_async  <= 1'b0;         
        CMT_mret        <= 1'b0;
        CMT_sret        <= 1'b0;
        CMT_fence       <= 1'b0;
        CMT_fencei      <= 1'b0;
        CMT_fencevma    <= 1'b0;
        CMT_system      <= 1'b0;
    end
    else begin
        CMT_valid       <= WB_valid;
        CMT_GPRwen      <= WB_valid & WB_rden;
        CMT_GPRwindex   <= WB_rdindex;
        CMT_data1       <= WB_data1;
        CMT_data2       <= WB_data2;
        CMT_csren       <= WB_valid & WB_csren;
        CMT_csrindex    <= WB_csrindex;
        CMT_pc          <= WB_pc;       
	    CMT_priv        <= WB_priv;
        CMT_ci          <= WB_valid & WB_ci;
    
        CMT_trap_value  <= trap_value;
        CMT_trap_cause  <= trap_cause;
        CMT_trap_pc     <= trap_pc;
        CMT_trap_s      <= WB_valid & trap_s;
        CMT_trap_m      <= WB_valid & trap_m;
        CMT_trap_async  <= WB_valid & trap_async;         
        CMT_mret        <= WB_valid & WB_mret;
        CMT_sret        <= WB_valid & WB_sret;
        CMT_fence       <= WB_valid & WB_fence;
        CMT_fencei      <= WB_valid & WB_fencei;
        CMT_fencevma    <= WB_valid & WB_fencevma;
        CMT_system      <= WB_valid & WB_system;
    end
end
endmodule













module ysyx_210152_InstrFront
#(parameter ITLB_FIBID=8'h01)
(

    input  wire              IFi_CLK,
    input  wire              IFi_ARST,

    input  wire              IFi_GFlush,            
    input  wire [`YSYX210152_XLEN-1:0]  IFi_GPC,
    input  wire              IFi_BFlush,            
    input  wire [`YSYX210152_XLEN-1:0]  IFi_BPC,

    input  wire              IFi_fencevma,
    input  wire              IFi_fencei,

    input   wire [43:0]       CSR_satpppn,
    input   wire [3:0]        CSR_satpmode,
    input   wire [1:0]        CSR_priv,
    input   wire              CSR_InhibitIcache,    
    input   wire              CSR_mxr,
    input   wire              CSR_sum,

    input  wire               BTB_wr_req,
    input  wire [`YSYX210152_XLEN-1:0]   BTB_wr_PC,
    input  wire [`YSYX210152_XLEN-1:0]   BTB_wr_predicted_PC,
    input  wire               BTB_wr_predicted_state_bit,

    output  wire              PIP_IFo_MSC_valid,
    output  wire [`YSYX210152_XLEN-1:0]  PIP_IFo_DATA_instr,
    output  wire [`YSYX210152_XLEN-1:0]  PIP_IFo_INFO_pc,
    output  wire [`YSYX210152_XLEN-1:0]  PIP_IFo_INFO_predictedPC,
    output  wire [1:0]        PIP_IFo_INFO_priv,
    output  wire              PIP_IFo_MSC_InstPageFlt,
    output  wire              PIP_IFo_MSC_InstAccFle,
    output  wire              PIP_IFo_MSC_InstAddrMis,
    input   wire              PIP_IFi_FC_ready,     

    output  wire              ITLB_FIBo_WREN,        
    output  wire              ITLB_FIBo_REQ,         
    input   wire              ITLB_FIBi_ACK,         
    input   wire              ITLB_FIBi_FULL,        
    output  wire [7:0]        ITLB_FIBo_ID,
    output  wire [7:0]        ITLB_FIBo_CMD,
    output  wire [3:0]        ITLB_FIBo_BURST,
    output  wire [3:0]        ITLB_FIBo_SIZE,
    output  wire [`YSYX210152_XLEN-1:0]  ITLB_FIBo_ADDR,      
    output  wire [`YSYX210152_XLEN-1:0]  ITLB_FIBo_DATA,
    input   wire [7:0]        ITLB_FIBi_ID,
    input   wire [7:0]        ITLB_FIBi_RPL,
    input   wire              ITLB_FIBi_V,
    input   wire [`YSYX210152_XLEN-1:0]  ITLB_FIBi_DATA,

    output wire               IFo_AQ_V,          
    output wire [7:0]         IFo_AQ_ID,         
    output wire [7:0]         IFo_AQ_CMD,        
    output wire               IFo_AQ_CI,         
    output wire               IFo_AQ_WT,         
    output wire [15:0]        IFo_AQ_BSEL,       
    output wire [127:0]       IFo_AQ_WDATA,      
    output wire [`YSYX210152_XLEN-1:0]   IFo_AQ_ADDR,
    input wire                IFi_AQ_FULL,
    input wire                IFi_RQ_V,
    input wire [7:0]          IFi_RQ_ID,
    input wire                IFi_RQ_WRERR,
    input wire                IFi_RQ_RDERR,
    input wire                IFi_RQ_RDY,
    input wire [127:0]        IFi_RQ_RDATA,
    output wire               IFo_RQ_ACK
);

    wire [`YSYX210152_XLEN-1:0]   BTBo_predicted_PC;
	wire [1:0]         BTBo_predicted;

    wire               PIP_ATUi_MSC_valid;
    wire [`YSYX210152_XLEN-1:0]   PIP_ATUi_DATA_VA,    PIP_ATUi_DATA_predictedPC;
    wire               PIP_ATUo_FC_ready;


    wire              Tablei_WREN,          Tablei_RDEN;
    wire [7:0]        Tablei_WID,           Tablei_RID;
    wire                                    Tablei_Remove;
    wire                                    Tableo_V;
    wire [`YSYX210152_XLEN-1:0]  Tablei_ADDR,          Tableo_ADDR;
    wire [`YSYX210152_XLEN-1:0]  Tablei_PC,            Tableo_PC;
    wire [7:0]        Tablei_ITAG,          Tableo_ITAG;
    wire [1:0]        Tablei_priv,          Tableo_priv;
    wire [7:0]        Tablei_opcode,        Tableo_opcode;
    wire [1:0]        Tablei_opinfo,        Tableo_opinfo;
    wire [3:0]        Tablei_opsize,        Tableo_opsize;
    wire              Tablei_InstPageFlt,   Tableo_InstPageFlt;
    wire              Tablei_InstAddrMis,   Tableo_InstAddrmis;
    wire              Tablei_LoadPageFlt,   Tableo_LoadPageFlt;
    wire              Tablei_LoadAddrMis,   Tableo_LoadAddrMis;
    wire              Tablei_StorePageFlt,  Tableo_StorePageFlt;
    wire              Tablei_StoreAddreMis, Tableo_StoreAddrMis;
    wire              Tableo_FULL;

ysyx_210152_BTB                         BTB(

    .clk                    (IFi_CLK), 
    .rst                    (IFi_ARST | IFi_fencei | IFi_fencevma),

    .rd_PC                  (PIP_ATUi_DATA_VA),
    .rd_predicted           (BTBo_predicted),
    .rd_predicted_PC        (BTBo_predicted_PC),

    .wr_req                 (BTB_wr_req),
    .wr_PC                  (BTB_wr_PC),
    .wr_predicted_PC        (BTB_wr_predicted_PC),
    .wr_predicted_state_bit (BTB_wr_predicted_state_bit)
);

ysyx_210152_PC                          PC(
    .CLKi                   (IFi_CLK),
    .ARSTi                  (IFi_ARST),
    .B_newPC                (IFi_BPC),
    .G_newPC                (IFi_GPC),
    .B_flush                (IFi_BFlush),
    .G_flush                (IFi_GFlush),
    .BTB_predicted          (BTBo_predicted[1]),
    .BTB_predictedPC        (BTBo_predicted_PC),
    .PC_Val                 (PIP_ATUi_DATA_VA),
    .PC_valid               (PIP_ATUi_MSC_valid),
    .PCnext_predicted       (PIP_ATUi_DATA_predictedPC),
    .Ready                  (PIP_ATUo_FC_ready)
);

ysyx_210152_ATU#(
    .FIB_ID             (ITLB_FIBID),
    .TLB_entry_NUM      (`YSYX210152_ITLB_entry_NUM),
    .InstrATU           (1)                         
) inst_ATU(
    .ATUi_CLK                       (IFi_CLK),
    .ATUi_ARST                      (IFi_ARST),
    .ATUi_Flush                     (IFi_BFlush | IFi_GFlush),
    .ATUi_ModifyPermit              (1'b1),
    .ATUi_ModifyPermitID            (8'h00),
    .ATUi_TLBrefersh                (IFi_fencevma),
    .ATUi_CacheRefersh              (IFi_fencei),
    .ATUi_CSR_CacheInhibit          (CSR_InhibitIcache),
    .ATUi_CSR_CacheWT               (1'b0),                 
    .ATUi_CSR_mxr                   (CSR_mxr),
    .ATUi_CSR_sum                   (CSR_sum),
    .ATUi_CSR_satpmode              (CSR_satpmode),
    .ATUi_CSR_satpppn               (CSR_satpppn),
    .PIP_ATUi_MSC_valid             (PIP_ATUi_MSC_valid),
    .PIP_ATUi_Opcode                (`YSYX210152_LSU_eXecute),
    .PIP_ATUi_OpInfo                (`YSYX210152_Sign64),
    .PIP_ATUi_OpSize                (4'h4),
    .PIP_ATUi_INFO_ITAG             (8'h00),
    .PIP_ATUi_INFO_priv             (CSR_priv),
    .PIP_ATUi_INFO_unpage           (1'b0),
    .PIP_ATUi_INFO_PC               (PIP_ATUi_DATA_VA),             
    .PIP_ATUi_DATA_VA               (PIP_ATUi_DATA_VA),
    .PIP_ATUi_DATA_ds2              (PIP_ATUi_DATA_predictedPC),    
    .PIP_ATUo_FC_ready              (PIP_ATUo_FC_ready),

    .Tablei_WREN                    (Tablei_WREN),
    .Tablei_WID                     (Tablei_WID),
    .Tablei_ADDR                    (Tablei_ADDR),
    .Tablei_PC                      (Tablei_PC),
    .Tablei_ITAG                    (Tablei_ITAG),
    .Tablei_priv                    (Tablei_priv),
    .Tablei_opcode                  (Tablei_opcode),
    .Tablei_opinfo                  (Tablei_opinfo),
    .Tablei_opsize                  (Tablei_opsize),
    .Tablei_ci                      (),                             
    .Tablei_InstPageFlt             (Tablei_InstPageFlt),
    .Tablei_InstAddrMis             (Tablei_InstAddrMis),
    .Tablei_LoadPageFlt             (Tablei_LoadPageFlt),
    .Tablei_LoadAddrMis             (Tablei_LoadAddrMis),
    .Tablei_StorePageFlt            (Tablei_StorePageFlt),
    .Tablei_StoreAddreMis           (Tablei_StoreAddreMis),
    .Tableo_FULL                    (Tableo_FULL),

    .ATUo_AQ_V                      (IFo_AQ_V),
    .ATUo_AQ_ID                     (IFo_AQ_ID),
    .ATUo_AQ_CMD                    (IFo_AQ_CMD),
    .ATUo_AQ_CI                     (IFo_AQ_CI),
    .ATUo_AQ_WT                     (IFo_AQ_WT),
    .ATUo_AQ_BSEL                   (IFo_AQ_BSEL),
    .ATUo_AQ_WDATA                  (IFo_AQ_WDATA),
    .ATUo_AQ_ADDR                   (IFo_AQ_ADDR),
    .ATUi_AQ_FULL                   (IFi_AQ_FULL),

    .ATUo_FIB_WREN                  (ITLB_FIBo_WREN),
    .ATUo_FIB_REQ                   (ITLB_FIBo_REQ),
    .ATUi_FIB_ACK                   (ITLB_FIBi_ACK),
    .ATUi_FIB_FULL                  (ITLB_FIBi_FULL),
    .ATUo_FIB_ID                    (ITLB_FIBo_ID),
    .ATUo_FIB_CMD                   (ITLB_FIBo_CMD),
    .ATUo_FIB_BURST                 (ITLB_FIBo_BURST),
    .ATUo_FIB_SIZE                  (ITLB_FIBo_SIZE),
    .ATUo_FIB_ADDR                  (ITLB_FIBo_ADDR),
    .ATUo_FIB_DATA                  (ITLB_FIBo_DATA),
    .ATUi_FIB_ID                    (ITLB_FIBi_ID),
    .ATUi_FIB_RPL                   (ITLB_FIBi_RPL),
    .ATUi_FIB_V                     (ITLB_FIBi_V),
    .ATUi_FIB_DATA                  (ITLB_FIBi_DATA)
);

ysyx_210152_AccessTable             AccessTable(
    .GLB_CLKi                       (IFi_CLK),
    .GLB_SRSTi                      (IFi_ARST | IFi_GFlush | IFi_BFlush),

    .Table_Full                     (Tableo_FULL),
    .Table_Empty                    (),             

    .Tablei_WREN                    (Tablei_WREN),
    .Tablei_WID                     (Tablei_WID),
    .Tablei_ADDR                    (Tablei_ADDR),
    .Tablei_PC                      (Tablei_PC),
    .Tablei_ITAG                    (Tablei_ITAG),
    .Tablei_priv                    (Tablei_priv),
    .Tablei_opcode                  (Tablei_opcode),
    .Tablei_opinfo                  (Tablei_opinfo),
    .Tablei_opsize                  (Tablei_opsize),
    .Tablei_ci                      (1'b0),
    .Tablei_InstPageFlt             (Tablei_InstPageFlt),
    .Tablei_LoadPageFlt             (Tablei_LoadPageFlt),
    .Tablei_StorePageFlt            (Tablei_StorePageFlt),
    .Tablei_InstAddrmis             (Tablei_InstAddrMis),
    .Tablei_LoadAddrMis             (Tablei_LoadAddrMis),
    .Tablei_StoreAddrMis            (Tablei_StoreAddreMis),

    .Tablei_RDEN                    (Tablei_RDEN),
    .Tablei_RID                     (Tablei_RID),
    .Tablei_Remove                  (Tablei_Remove),
    .Tableo_V                       (Tableo_V),
    .Tableo_ADDR                    (Tableo_ADDR),
    .Tableo_PC                      (Tableo_PC),
    .Tableo_ITAG                    (Tableo_ITAG),
    .Tableo_priv                    (Tableo_priv),
    .Tableo_opcode                  (Tableo_opcode),
    .Tableo_opinfo                  (Tableo_opinfo),
    .Tableo_opsize                  (Tableo_opsize),
    .Tableo_ci                      (),
    .Tableo_InstPageFlt             (Tableo_InstPageFlt),
    .Tableo_LoadPageFlt             (Tableo_LoadPageFlt),
    .Tableo_StorePageFlt            (Tableo_StorePageFlt),
    .Tableo_InstAddrmis             (Tableo_InstAddrmis),
    .Tableo_LoadAddrMis             (Tableo_LoadAddrMis),
    .Tableo_StoreAddrMis            (Tableo_StoreAddrMis)	
);

ysyx_210152_ResultUnit#(.UsedAsInstrFront(1'b1))       
ResultUnit(

    .RUi_CLK                        (IFi_CLK),
    .RUi_ARST                       (IFi_ARST),
    .RUi_Flush                      (IFi_BFlush | IFi_GFlush),

    .RUi_RQ_V                       (IFi_RQ_V),
    .RUi_RQ_ID                      (IFi_RQ_ID),
    .RUi_RQ_WRERR                   (IFi_RQ_WRERR),
    .RUi_RQ_RDERR                   (IFi_RQ_RDERR),
    .RUi_RQ_RDY                     (IFi_RQ_RDY),
    .RUi_RQ_RDATA                   (IFi_RQ_RDATA),
    .RUo_RQ_ACK                     (IFo_RQ_ACK),

    .Tablei_RDEN                    (Tablei_RDEN),
    .Tablei_RID                     (Tablei_RID),
    .Tablei_Remove                  (Tablei_Remove),
    .Tableo_V                       (Tableo_V),
    .Tableo_ADDR                    (Tableo_ADDR),
    .Tableo_PC                      (Tableo_PC),
    .Tableo_ITAG                    (Tableo_ITAG),
    .Tableo_priv                    (Tableo_priv),
    .Tableo_opcode                  (Tableo_opcode),
    .Tableo_opinfo                  (Tableo_opinfo),
    .Tableo_opsize                  (Tableo_opsize),
    .Tableo_ci                      (1'b0),
    .Tableo_InstPageFlt             (Tableo_InstPageFlt),
    .Tableo_LoadPageFlt             (Tableo_LoadPageFlt),
    .Tableo_StorePageFlt            (Tableo_StorePageFlt),
    .Tableo_InstAddrmis             (Tableo_InstAddrmis),
    .Tableo_LoadAddrMis             (Tableo_LoadAddrMis),
    .Tableo_StoreAddrMis            (Tableo_StoreAddrMis),	

    .RUo_valid                      (PIP_IFo_MSC_valid),
    .RUo_InstPageFlt                (PIP_IFo_MSC_InstPageFlt),
    .RUo_InstAddrMis                (PIP_IFo_MSC_InstAddrMis),
    .RUo_InstAccFlt                 (PIP_IFo_MSC_InstAccFle),
    .RUo_LoadPageFlt                (),
    .RUo_LoadAddrMis                (),
    .RUo_LoadAccFlt                 (),
    .RUo_StorePageFlt               (),
    .RUo_StoreAddrMis               (),
    .RUo_StoreAccFlt                (),
    .RUo_ci                         (),
    .RUo_ITAG                       (),
    .RUo_priv                       (PIP_IFo_INFO_priv),
    .RUo_PC                         (PIP_IFo_INFO_pc),
    .RUo_VADDR                      (PIP_IFo_INFO_predictedPC),     
    .RUo_DATA                       (PIP_IFo_DATA_instr),
    .RUi_ready                      (PIP_IFi_FC_ready)

);

endmodule








module ysyx_210152_RegFile(
	input wire 			clk         ,
	input wire 			wr_en      ,
	input wire [4:0] 	rd0_addr    ,
	input wire [4:0] 	rs1_addr    ,
	input wire [4:0]	rs2_addr    ,
	input wire [63:0] 	rd0_data    ,
	output wire [63:0] 	rs1_data    ,
	output wire [63:0] 	rs2_data	 
	`ifdef DEBUG_FLAG    
		,output wire [64*32-1:0]snapshot
	`endif
) ;
	reg [63:0] REGFILE [31:1];
	wire w_en ;
`ifdef DEBUG_FLAG  
	genvar i;
	assign snapshot[63:0]=65'h0000_0000_0000_0000;
	generate for(i=1;i<32;i=i+1) 
		begin : U
			assign snapshot[(64*(i+1))-1:64*i]=REGFILE[i];
		end
	endgenerate
`endif
assign w_en = ( rd0_addr == 5'b00000 ) ? ( 1'b0 ) : ( wr_en ) ;


always @ ( posedge clk ) begin
	if ( w_en ) begin
		REGFILE [ rd0_addr ] <= rd0_data ;
	end
end

assign rs1_data = (rs1_addr==5'b0)?64'b0 : REGFILE [ rs1_addr ] ;
assign rs2_data = (rs2_addr==5'b0)?64'b0 : REGFILE [ rs2_addr ] ;

endmodule













module ysyx_210152_IDU(

    input wire              IDUi_CLK,
    input wire              IDUi_ARST,
    input wire              IDUi_Flush,            

    input wire              IDUi_CSR_tvm,
    input wire              IDUi_CSR_tsr,
    input wire              IDUi_CSR_mpriv,
    input wire [1:0]        IDUi_CSR_mpp,
    input wire [`YSYX210152_XLEN-1:0]  IDUi_CSR_data,          
    output wire [11:0]      IDUo_CSR_index,         
    output wire             IDUo_CSR_en,            

    output wire [4:0]       IDUo_GPR_rs1index,
    output wire             IDUo_GPR_rs1en,
    input wire  [`YSYX210152_XLEN-1:0] IDUi_GPR_rs1data,
    output wire [4:0]       IDUo_GPR_rs2index,
    output wire             IDUo_GPR_rs2en,
    input wire  [`YSYX210152_XLEN-1:0] IDUi_GPR_rs2data,

    output wire             IDUo_Checken,           
    output wire [4:0]       IDUo_CheckRs1Index,     
    output wire             IDUo_CheckRs1en,        
    output wire [4:0]       IDUo_CheckRs2Index,     
    output wire             IDUo_CheckRs2en,        
    output wire [11:0]      IDUo_CheckCSRIndex,     
    output wire             IDUo_CheckCSRen,        
    input wire              IDUi_DepdcFind,         

    output reg              IDUo_DITF_write,        
    output wire [7:0]       IDUo_DITF_itag,
    output wire [4:0]       IDUo_DITF_rs1index,
    output wire             IDUo_DITF_rs1en,
    output wire [4:0]       IDUo_DITF_rs2index,
    output wire             IDUo_DITF_rs2en,
    output wire [4:0]       IDUo_DITF_rdindex,
    output wire             IDUo_DITF_rden,
    output wire [11:0]      IDUo_DITF_csrindex,
    output wire             IDUo_DITF_csren,
    output wire             IDUo_DITF_jmp,
    output wire             IDUo_DITF_InsAccessFlt,
    output wire             IDUo_DITF_InsPageFlt,
    output wire             IDUo_DITF_InsAddrMis,
    output wire             IDUo_DITF_illins,
    output wire             IDUo_DITF_mret,
    output wire             IDUo_DITF_sret,
    output wire             IDUo_DITF_fence,
    output wire             IDUo_DITF_fencei,
    output wire             IDUo_DITF_fencevma,
    output wire             IDUo_DITF_ecall,
    output wire             IDUo_DITF_ebreak,
    output wire             IDUo_DITF_system,
    input wire              IDUi_DITF_write_ready,      

    output reg [`YSYX210152_XLEN-1:0]  IDUo_BPC,
    output reg              IDUo_BFlush,                

    output reg [`YSYX210152_XLEN-1:0]  IDUo_BTB_wrPC,              
    output reg              IDUo_BTB_wren,              
    output reg              IDUo_BTB_wr_predicatebit,   
    output reg [`YSYX210152_XLEN-1:0]  IDUo_BTB_wr_predicatePC,    

    input wire              PIP_IDUi_MSC_valid,         
    input wire [`YSYX210152_XLEN-1:0]  PIP_IDUi_DATA_instr,        
    input wire [`YSYX210152_XLEN-1:0]  PIP_IDUi_INFO_pc,           
    input wire [`YSYX210152_XLEN-1:0]  PIP_IDUi_INFO_predictedPC,
    input wire [1:0]        PIP_IDUi_INFO_priv,
    input wire              PIP_IDUi_MSC_InstPageFlt,
    input wire              PIP_IDUi_MSC_InstAddrMis,
    input wire              PIP_IDUi_MSC_InstAccFlt,
    output reg              PIP_IDUo_FC_ready,

    output wire              PIP_ALUi_MSC_valid,
    output wire  [`YSYX210152_XLEN-1:0] PIP_ALUi_INFO_pc,
    output wire  [1:0]       PIP_ALUi_INFO_priv,
    output wire  [7:0]       PIP_ALUi_INFO_ITAG,
    output wire  [7:0]       PIP_ALUi_Opcode,
    output wire  [3:0]       PIP_ALUi_OpSize,
    output wire  [1:0]       PIP_ALUi_OPInfo,
    output wire  [`YSYX210152_XLEN-1:0] PIP_ALUi_DATA_ds1,
    output wire  [`YSYX210152_XLEN-1:0] PIP_ALUi_DATA_ds2,          
    input wire              PIP_ALUo_FC_ready,          

    output wire              PIP_LSUi_MSC_valid,
    output wire  [`YSYX210152_XLEN-1:0] PIP_LSUi_INFO_pc,
    output wire  [1:0]       PIP_LSUi_INFO_priv,
    output wire  [7:0]       PIP_LSUi_INFO_ITAG,
    output wire              PIP_LSUi_INFO_unpage,       
    output wire  [7:0]       PIP_LSUi_Opcode,
    output wire  [3:0]       PIP_LSUi_OpSize,
    output wire  [1:0]       PIP_LSUi_OPInfo,
    output wire  [`YSYX210152_XLEN-1:0] PIP_LSUi_DATA_ds1,
    output wire  [`YSYX210152_XLEN-1:0] PIP_LSUi_DATA_ds2,          
    input wire              PIP_LSUo_FC_ready,          

    output wire              PIP_Mcopi_MSC_valid,
    output wire  [`YSYX210152_XLEN-1:0] PIP_Mcopi_INFO_pc,
    output wire  [1:0]       PIP_Mcopi_INFO_priv,
    output wire  [7:0]       PIP_Mcopi_INFO_ITAG,
    output wire  [7:0]       PIP_Mcopi_Opcode,
    output wire  [3:0]       PIP_Mcopi_OpSize,
    output wire  [1:0]       PIP_Mcopi_OPInfo,
    output wire  [`YSYX210152_XLEN-1:0] PIP_Mcopi_DATA_ds1,
    output wire  [`YSYX210152_XLEN-1:0] PIP_Mcopi_DATA_ds2,          
    input wire              PIP_Mcopo_FC_ready           


);

    reg [31:0]      Instruction;                           
    wire            Valid;                                 
always@(*)begin
    `ifdef DEBUG_FLAG
    case(PIP_IDUi_DATA_instr[6:0])
        7'h6b   : Instruction = 32'hcc051073;         
        7'h7b   : Instruction = 32'hcc151073;         
        default : Instruction = PIP_IDUi_DATA_instr[31:0];
    endcase
    `else 
         Instruction = PIP_IDUi_DATA_instr[31:0];
    `endif
end

assign Valid        = (IDUi_Flush | IDUo_BFlush) ? 1'b0 : PIP_IDUi_MSC_valid;

    reg             ITAG_EN;

    wire            disp_ALU,       disp_LSU,       disp_Mcop;          
    wire            disp_ALU_ready, disp_LSU_ready, disp_Mcop_ready;    
    wire [7:0]      disp_opcode;
    wire [1:0]      disp_opinfo;
    wire [3:0]      disp_opsize;                            
    wire [`YSYX210152_XLEN-1:0]disp_ds1,       disp_ds2;                     

    wire [`YSYX210152_XLEN-1:0]BP_address;
    wire            BP_jump_pending;                        
    wire            BP_jump_instr;                          


ysyx_210152_IDcore              inst_IDcore(
    .CSR_tvm            (IDUi_CSR_tvm),
    .CSR_tsr            (IDUi_CSR_tsr),
    .InstrPriv          (PIP_IDUi_INFO_priv),
    .Instruction        (Instruction),
    .InstructionPC      (PIP_IDUi_INFO_pc),
    .Valid              (Valid),
    .InsAccessFlt       (PIP_IDUi_MSC_InstAccFlt),
    .InsPageFlt         (PIP_IDUi_MSC_InstPageFlt),
    .InsAddrMis         (PIP_IDUi_MSC_InstAddrMis),
    .DITF_FULL          (!IDUi_DITF_write_ready),
    
    .rs1_index          (IDUo_CheckRs1Index),
    .rs1_en             (IDUo_CheckRs1en),
    .rs2_index          (IDUo_CheckRs2Index),
    .rs2_en             (IDUo_CheckRs2en),
    .rs1_data           (IDUi_GPR_rs1data),
    .rs2_data           (IDUi_GPR_rs2data),
    .rd_index           (IDUo_DITF_rdindex),
    .rd_en              (IDUo_DITF_rden),
    .csr_index          (IDUo_CheckCSRIndex),
    .csr_en             (IDUo_CheckCSRen),
    .CSR_data           (IDUi_CSR_data),
    .Checken            (IDUo_Checken),
    .DepdcFind          (IDUi_DepdcFind),
    
    .Info_jmp           (IDUo_DITF_jmp),
    .Info_illins        (IDUo_DITF_illins),
    .Info_mret          (IDUo_DITF_mret),
    .Info_sret          (IDUo_DITF_sret),
    .Info_fence         (IDUo_DITF_fence),
    .Info_fencei        (IDUo_DITF_fencei),
    .Info_fencevma      (IDUo_DITF_fencevma),
    .Info_ecall         (IDUo_DITF_ecall),
    .Info_ebreak        (IDUo_DITF_ebreak),
    .Info_system        (IDUo_DITF_system),
    .BP_address         (BP_address),
    .BP_jmp             (BP_jump_pending),
    .BP_branch          (BP_jump_instr),
    
    .disp_ALU           (disp_ALU),
    .disp_LSU           (disp_LSU),
    .disp_Mcop          (disp_Mcop),
    .disp_opcode        (disp_opcode),
    .disp_opinfo        (disp_opinfo),
    .disp_size          (disp_opsize),
    .disp_ds1           (disp_ds1),
    .disp_ds2           (disp_ds2)
);

assign IDUo_GPR_rs1index    = IDUo_CheckRs1Index;
assign IDUo_GPR_rs1en       = IDUo_CheckRs1en;
assign IDUo_GPR_rs2index    = IDUo_CheckRs2Index;
assign IDUo_GPR_rs2en       = IDUo_CheckRs2en;
assign IDUo_CSR_index       = IDUo_CheckCSRIndex;
assign IDUo_CSR_en          = IDUo_CheckCSRen;

ysyx_210152_TAGgen      ITAG_generate(
    .CLKi               (IDUi_CLK),             
    .ARSTi              (IDUi_ARST),            
    .ENi                (ITAG_EN),              
    .DATAo              (IDUo_DITF_itag)        
);
always@(*) begin
    if(PIP_IDUi_MSC_valid & PIP_IDUo_FC_ready)begin 
        ITAG_EN = 1'b1;
    end
    else begin
        ITAG_EN = 1'b0;
    end
end

always@(posedge IDUi_CLK or posedge IDUi_ARST)begin
    if(IDUi_ARST)begin
        IDUo_BTB_wr_predicatebit <= 1'b0;
        IDUo_BTB_wr_predicatePC  <= 64'hx;
        IDUo_BTB_wrPC            <= 64'hx;
        IDUo_BTB_wren            <= 1'b0;
        IDUo_BFlush              <= 1'b0;
        IDUo_BPC                 <= 64'hx;
    end
    else if(disp_ALU&disp_ALU_ready | disp_LSU&disp_LSU_ready | disp_Mcop&disp_Mcop_ready)begin 
        if(BP_jump_instr)begin
            if(PIP_IDUi_INFO_predictedPC != (PIP_IDUi_INFO_pc + 64'd4))begin            
                if(BP_jump_pending)begin                                                
                    if(PIP_IDUi_INFO_predictedPC == BP_address)begin                    
                        IDUo_BTB_wr_predicatebit <= 1'b1;
                        IDUo_BTB_wr_predicatePC  <= BP_address;
                        IDUo_BTB_wrPC            <= PIP_IDUi_INFO_pc;
                        IDUo_BTB_wren            <= 1'b1;
                        IDUo_BFlush              <= 1'b0;
                        IDUo_BPC                 <= 64'hx;
                    end
                    else begin              
                        IDUo_BTB_wr_predicatebit <= 1'b1;
                        IDUo_BTB_wr_predicatePC  <= BP_address;
                        IDUo_BTB_wrPC            <= PIP_IDUi_INFO_pc;
                        IDUo_BTB_wren            <= 1'b1;
                        IDUo_BFlush              <= 1'b1;
                        IDUo_BPC                 <= BP_address;
                    end
                end
                else begin                                          
                    IDUo_BTB_wr_predicatebit <= 1'b0;
                    IDUo_BTB_wr_predicatePC  <= BP_address;
                    IDUo_BTB_wrPC            <= PIP_IDUi_INFO_pc;
                    IDUo_BTB_wren            <= 1'b1;
                    IDUo_BFlush              <= 1'b1;
                    IDUo_BPC                 <= (PIP_IDUi_INFO_pc + 64'd4);
                end
            end
            else begin                                          
                if(!BP_jump_pending)begin                       
                    IDUo_BTB_wr_predicatebit <= 1'b0;
                    IDUo_BTB_wr_predicatePC  <= BP_address;
                    IDUo_BTB_wrPC            <= PIP_IDUi_INFO_pc;
                    IDUo_BTB_wren            <= 1'b1;
                    IDUo_BFlush              <= 1'b0;
                    IDUo_BPC                 <= 64'hx;
                end
                else begin      
                    IDUo_BTB_wr_predicatebit <= 1'b1;
                    IDUo_BTB_wr_predicatePC  <= BP_address;
                    IDUo_BTB_wrPC            <= PIP_IDUi_INFO_pc;
                    IDUo_BTB_wren            <= 1'b1;
                    IDUo_BFlush              <= 1'b1;
                    IDUo_BPC                 <= BP_address;
                end
            end
        end
        else begin                  
            if(PIP_IDUi_INFO_predictedPC != (PIP_IDUi_INFO_pc + 64'd4))begin    
                IDUo_BTB_wr_predicatebit <= 1'b0;
                IDUo_BTB_wr_predicatePC  <= BP_address;
                IDUo_BTB_wrPC            <= PIP_IDUi_INFO_pc;
                IDUo_BTB_wren            <= 1'b1;
                IDUo_BFlush              <= 1'b1;
                IDUo_BPC                 <= (PIP_IDUi_INFO_pc + 64'd4);
            end
            else begin              
                IDUo_BTB_wr_predicatebit <= 1'b0;
                IDUo_BTB_wr_predicatePC  <= BP_address;
                IDUo_BTB_wrPC            <= PIP_IDUi_INFO_pc;
                IDUo_BTB_wren            <= 1'b0;
                IDUo_BFlush              <= 1'b0;
                IDUo_BPC                 <= 64'hx;
            end
        end
    end
    else begin      
        IDUo_BTB_wr_predicatebit <= 1'b0;
        IDUo_BTB_wr_predicatePC  <= BP_address;
        IDUo_BTB_wrPC            <= PIP_IDUi_INFO_pc;
        IDUo_BTB_wren            <= 1'b0;
        IDUo_BFlush              <= 1'b0;
        IDUo_BPC                 <= 64'hx;
    end
end

ysyx_210152_DispBuffer                  ALU_DispBuffer(
    .DBi_CLK                    (IDUi_CLK),
    .DBi_ARST                   (IDUi_ARST),
    .DBi_Flush                  (IDUi_Flush),

    .DBi_MSC_valid              (disp_ALU),
    .DBi_INFO_pc                (PIP_IDUi_INFO_pc),
    .DBi_INFO_priv              (PIP_IDUi_INFO_priv),
    .DBi_INFO_ITAG              (IDUo_DITF_itag),
    .DBi_INFO_unpage            (1'b0),
    .DBi_Opcode                 (disp_opcode),
    .DBi_OpSize                 (disp_opsize),
    .DBi_OPInfo                 (disp_opinfo),
    .DBi_DATA_ds1               (disp_ds1),
    .DBi_DATA_ds2               (disp_ds2),
    .DBo_ready                  (disp_ALU_ready),

    .DBo_MSC_valid              (PIP_ALUi_MSC_valid),
    .DBo_INFO_pc                (PIP_ALUi_INFO_pc),
    .DBo_INFO_priv              (PIP_ALUi_INFO_priv),
    .DBo_INFO_ITAG              (PIP_ALUi_INFO_ITAG),
    .DBo_INFO_unpage            (),                          
    .DBo_Opcode                 (PIP_ALUi_Opcode),
    .DBo_OpSize                 (PIP_ALUi_OpSize),
    .DBo_OPInfo                 (PIP_ALUi_OPInfo),
    .DBo_DATA_ds1               (PIP_ALUi_DATA_ds1),
    .DBo_DATA_ds2               (PIP_ALUi_DATA_ds2),
    .DBi_FC_ready               (PIP_ALUo_FC_ready)
);

ysyx_210152_DispBuffer                  LSU_DispBuffer(
    .DBi_CLK                    (IDUi_CLK),
    .DBi_ARST                   (IDUi_ARST),
    .DBi_Flush                  (IDUi_Flush),

    .DBi_MSC_valid              (disp_LSU),
    .DBi_INFO_pc                (PIP_IDUi_INFO_pc),
    .DBi_INFO_priv              (PIP_IDUi_INFO_priv),
    .DBi_INFO_ITAG              (IDUo_DITF_itag),
    .DBi_INFO_unpage            ((PIP_IDUi_INFO_priv == `YSYX210152_Machine) & IDUi_CSR_mpriv & (IDUi_CSR_mpp==`YSYX210152_Machine)),
    .DBi_Opcode                 (disp_opcode),
    .DBi_OpSize                 (disp_opsize),
    .DBi_OPInfo                 (disp_opinfo),
    .DBi_DATA_ds1               (disp_ds1),
    .DBi_DATA_ds2               (disp_ds2),
    .DBo_ready                  (disp_LSU_ready),

    .DBo_MSC_valid              (PIP_LSUi_MSC_valid),
    .DBo_INFO_pc                (PIP_LSUi_INFO_pc),
    .DBo_INFO_priv              (PIP_LSUi_INFO_priv),
    .DBo_INFO_ITAG              (PIP_LSUi_INFO_ITAG),
    .DBo_INFO_unpage            (PIP_LSUi_INFO_unpage),
    .DBo_Opcode                 (PIP_LSUi_Opcode),
    .DBo_OpSize                 (PIP_LSUi_OpSize),
    .DBo_OPInfo                 (PIP_LSUi_OPInfo),
    .DBo_DATA_ds1               (PIP_LSUi_DATA_ds1),
    .DBo_DATA_ds2               (PIP_LSUi_DATA_ds2),
    .DBi_FC_ready               (PIP_LSUo_FC_ready)
);
ysyx_210152_DispBuffer                  Mcop_DispBuffer(
    .DBi_CLK                    (IDUi_CLK),
    .DBi_ARST                   (IDUi_ARST),
    .DBi_Flush                  (IDUi_Flush),

    .DBi_MSC_valid              (disp_Mcop),
    .DBi_INFO_pc                (PIP_IDUi_INFO_pc),
    .DBi_INFO_priv              (PIP_IDUi_INFO_priv),
    .DBi_INFO_ITAG              (IDUo_DITF_itag),
    .DBi_INFO_unpage            (1'b0),
    .DBi_Opcode                 (disp_opcode),
    .DBi_OpSize                 (disp_opsize),
    .DBi_OPInfo                 (disp_opinfo),
    .DBi_DATA_ds1               (disp_ds1),
    .DBi_DATA_ds2               (disp_ds2),
    .DBo_ready                  (disp_Mcop_ready),

    .DBo_MSC_valid              (PIP_Mcopi_MSC_valid),
    .DBo_INFO_pc                (PIP_Mcopi_INFO_pc),
    .DBo_INFO_priv              (PIP_Mcopi_INFO_priv),
    .DBo_INFO_ITAG              (PIP_Mcopi_INFO_ITAG),
    .DBo_INFO_unpage            (),                          
    .DBo_Opcode                 (PIP_Mcopi_Opcode),
    .DBo_OpSize                 (PIP_Mcopi_OpSize),
    .DBo_OPInfo                 (PIP_Mcopi_OPInfo),
    .DBo_DATA_ds1               (PIP_Mcopi_DATA_ds1),
    .DBo_DATA_ds2               (PIP_Mcopi_DATA_ds2),
    .DBi_FC_ready               (PIP_Mcopo_FC_ready)
);


assign IDUo_DITF_InsAddrMis     = PIP_IDUi_MSC_InstAddrMis;
assign IDUo_DITF_InsAccessFlt   = PIP_IDUi_MSC_InstAccFlt;
assign IDUo_DITF_InsPageFlt     = PIP_IDUi_MSC_InstPageFlt;
assign IDUo_DITF_rs1index       = IDUo_CheckRs1Index;
assign IDUo_DITF_rs1en          = IDUo_CheckRs1en;
assign IDUo_DITF_rs2index       = IDUo_CheckRs2Index;
assign IDUo_DITF_rs2en          = IDUo_CheckRs2en;
assign IDUo_DITF_csrindex       = IDUo_CheckCSRIndex;
assign IDUo_DITF_csren          = IDUo_CheckCSRen;
always@(*)begin
    if(PIP_IDUi_MSC_valid)begin
        if(disp_ALU)begin
            PIP_IDUo_FC_ready = disp_ALU_ready ? 1'b1 : 1'b0;      
            IDUo_DITF_write   = disp_ALU_ready ? 1'b1 : 1'b0;      
        end
        else if(disp_LSU)begin
            PIP_IDUo_FC_ready = disp_LSU_ready ? 1'b1 : 1'b0;
            IDUo_DITF_write   = disp_LSU_ready ? 1'b1 : 1'b0;      
        end
        else if(disp_Mcop)begin
            PIP_IDUo_FC_ready = disp_Mcop_ready ? 1'b1 : 1'b0;
            IDUo_DITF_write   = disp_Mcop_ready ? 1'b1 : 1'b0;      
        end
        else begin
            PIP_IDUo_FC_ready = (IDUi_Flush | IDUo_BFlush) ? 1'b1 : 1'b0;  
            IDUo_DITF_write   = 1'b0;
        end
    end
    else begin
        PIP_IDUo_FC_ready = 1'b0;
        IDUo_DITF_write   = 1'b0;
    end
end

endmodule



















module ysyx_210152_DITF(

    input wire          DITFi_CLK,              
    input wire          DITFi_ARST,             
	input wire 			DITFi_SRST,				

    input wire          DITFi_Checken,          
    input wire [4:0]    DITFi_CheckRs1Index,    
    input wire          DITFi_CheckRs1en,       
    input wire [4:0]    DITFi_CheckRs2Index,    
    input wire          DITFi_CheckRs2en,       
    input wire [11:0]   DITFi_CheckCSRIndex,    
    input wire          DITFi_CheckCSRen,       
    output wire         DITFo_DepdcFind,        

	output wire			DITFo_write_ready,		
    input wire          DITFi_write,            
    input wire [7:0]    DITFi_itag,
    input wire [4:0]    DITFi_rs1index,
    input wire          DITFi_rs1en,
    input wire [4:0]    DITFi_rs2index,
    input wire          DITFi_rs2en,
    input wire [4:0]    DITFi_rdindex,
    input wire          DITFi_rden,
    input wire [11:0]   DITFi_csrindex,
    input wire          DITFi_csren,
    input wire          DITFi_jmp,
    input wire          DITFi_InsAccessFlt,
    input wire          DITFi_InsPageFlt,
    input wire          DITFi_InsAddrMis,
    input wire          DITFi_illins,
    input wire          DITFi_mret,
    input wire          DITFi_sret,
    input wire          DITFi_ecall,
    input wire          DITFi_ebreak,
	input wire 			DITFi_system,
	input wire 			DITFi_fencevma,
	input wire 			DITFi_fencei,
	input wire 			DITFi_fence,
	

    input  wire          DITFi_remove,           
    output wire          DITFo_v,
    output wire [7:0]    DITFo_itag,
    output wire [4:0]    DITFo_rs1index,
    output wire          DITFo_rs1en,
    output wire [4:0]    DITFo_rs2index,
    output wire          DITFo_rs2en,
    output wire [4:0]    DITFo_rdindex,
    output wire          DITFo_rden,
    output wire [11:0]   DITFo_csrindex,
    output wire          DITFo_csren,
    output wire          DITFo_jmp,
    output wire          DITFo_InsAccessFlt,
    output wire          DITFo_InsPageFlt,
    output wire          DITFo_InsAddrMis,
    output wire          DITFo_illins,
    output wire          DITFo_mret,
    output wire          DITFo_sret,
    output wire          DITFo_ecall,
    output wire          DITFo_ebreak,
	output wire          DITFo_system,
	output wire          DITFo_fencevma,
	output wire          DITFo_fencei,
	output wire          DITFo_fence
);



	reg [51:0] r_DITF_data_0;
	reg [51:0] r_DITF_data_1;
	reg [51:0] r_DITF_data_2;
	reg [51:0] r_DITF_data_3;
	reg [51:0] r_DITF_data_4;
	reg [51:0] r_DITF_data_5;
	reg [51:0] r_DITF_data_6;
	reg [51:0] r_DITF_data_7;


reg [3:0] DITF_cnt;  


wire DITFo_DepdcFind_tem_Rs1;
wire DITFo_DepdcFind_tem_Rs2;
wire DITFo_DepdcFind_tem_CS;








always@(posedge DITFi_CLK or posedge DITFi_ARST)begin
	if(DITFi_ARST)
		DITF_cnt <= 'd0;
	else if(DITFi_SRST)begin
		DITF_cnt <= 'd0;
	end
	else begin
		case({DITFi_write,DITFi_remove})
			2'b00	: DITF_cnt <= DITF_cnt;
			2'b01	: DITF_cnt <= DITF_cnt - 1'b1;
			2'b10	: DITF_cnt <= DITF_cnt + 1'b1;
			2'b11	: DITF_cnt <= DITF_cnt;
			default	;
		endcase
	end
end

always@(posedge DITFi_CLK or posedge DITFi_ARST)
	if(DITFi_ARST) begin
		r_DITF_data_0 <= 'd0;
		r_DITF_data_1 <= 'd0;
		r_DITF_data_2 <= 'd0;
		r_DITF_data_3 <= 'd0;
		r_DITF_data_4 <= 'd0;
		r_DITF_data_5 <= 'd0;
		r_DITF_data_6 <= 'd0;
		r_DITF_data_7 <= 'd0;
		end
	else if(DITFi_write) begin
		r_DITF_data_0 <= {	DITFi_fence,
							DITFi_fencei,
							DITFi_fencevma,
							DITFi_system,
							DITFi_ebreak,
							DITFi_ecall,
							DITFi_sret,
							DITFi_mret,
							DITFi_illins,
							DITFi_InsAddrMis,
							DITFi_InsPageFlt,
							DITFi_InsAccessFlt,
							DITFi_jmp,
							DITFi_csren,
							DITFi_csrindex[11:0],
							DITFi_rden,
							DITFi_rdindex[4:0],
							DITFi_rs2en,
							DITFo_rs2index[4:0],
							DITFi_rs1en,
							DITFi_rs1index[4:0],
							DITFi_itag[7:0]};
		r_DITF_data_1 <= r_DITF_data_0;
		r_DITF_data_2 <= r_DITF_data_1;
		r_DITF_data_3 <= r_DITF_data_2;
		r_DITF_data_4 <= r_DITF_data_3;
		r_DITF_data_5 <= r_DITF_data_4;
		r_DITF_data_6 <= r_DITF_data_5;
		r_DITF_data_7 <= r_DITF_data_6;
		end	
	else ;
	

reg [8:0] DIFT_MASK;
always@(posedge DITFi_CLK or posedge DITFi_ARST)
	if(DITFi_ARST)
		DIFT_MASK <= 9'b00000001;
	else if(DITFi_SRST)begin
		DIFT_MASK <= 9'b00000001;
	end
	else begin
		case({DITFi_write,DITFi_remove})
			2'b00	: DIFT_MASK <= DIFT_MASK;
			2'b01	: DIFT_MASK <= {1'b0,DIFT_MASK[8:1]};
			2'b10	: DIFT_MASK <= {DIFT_MASK[8:0],1'b1};
			2'b11	: DIFT_MASK <= DIFT_MASK;
			default	;
		endcase
	end






assign DITFo_DepdcFind = (DITFo_DepdcFind_tem_Rs1 | DITFo_DepdcFind_tem_Rs2 | DITFo_DepdcFind_tem_CS) ? 1'b1 : 1'b0;


assign DITFo_DepdcFind_tem_Rs1 = (DITFi_Checken && (DITFi_CheckRs1en && 
							((DITFi_CheckRs1Index == r_DITF_data_0[24:20] && r_DITF_data_0[25] == 1'b1 && DIFT_MASK[1]) || 
							 (DITFi_CheckRs1Index == r_DITF_data_1[24:20] && r_DITF_data_1[25] == 1'b1 && DIFT_MASK[2]) ||
							 (DITFi_CheckRs1Index == r_DITF_data_2[24:20] && r_DITF_data_2[25] == 1'b1 && DIFT_MASK[3]) ||
							 (DITFi_CheckRs1Index == r_DITF_data_3[24:20] && r_DITF_data_3[25] == 1'b1 && DIFT_MASK[4]) ||
							 (DITFi_CheckRs1Index == r_DITF_data_4[24:20] && r_DITF_data_4[25] == 1'b1 && DIFT_MASK[5]) ||
							 (DITFi_CheckRs1Index == r_DITF_data_5[24:20] && r_DITF_data_5[25] == 1'b1 && DIFT_MASK[6]) ||
							 (DITFi_CheckRs1Index == r_DITF_data_6[24:20] && r_DITF_data_6[25] == 1'b1 && DIFT_MASK[7]) ||
							 (DITFi_CheckRs1Index == r_DITF_data_7[24:20] && r_DITF_data_7[25] == 1'b1 && DIFT_MASK[8])							 
							 ))) ? 1'b1 : 1'b0;


assign DITFo_DepdcFind_tem_Rs2 = (DITFi_Checken && (DITFi_CheckRs2en && 
							((DITFi_CheckRs2Index == r_DITF_data_0[24:20] && r_DITF_data_0[25] == 1'b1 && DIFT_MASK[1]) || 
							 (DITFi_CheckRs2Index == r_DITF_data_1[24:20] && r_DITF_data_1[25] == 1'b1 && DIFT_MASK[2]) ||
							 (DITFi_CheckRs2Index == r_DITF_data_2[24:20] && r_DITF_data_2[25] == 1'b1 && DIFT_MASK[3]) ||
							 (DITFi_CheckRs2Index == r_DITF_data_3[24:20] && r_DITF_data_3[25] == 1'b1 && DIFT_MASK[4]) ||
							 (DITFi_CheckRs2Index == r_DITF_data_4[24:20] && r_DITF_data_4[25] == 1'b1 && DIFT_MASK[5]) ||
							 (DITFi_CheckRs2Index == r_DITF_data_5[24:20] && r_DITF_data_5[25] == 1'b1 && DIFT_MASK[6]) ||
							 (DITFi_CheckRs2Index == r_DITF_data_6[24:20] && r_DITF_data_6[25] == 1'b1 && DIFT_MASK[7]) ||
							 (DITFi_CheckRs2Index == r_DITF_data_7[24:20] && r_DITF_data_7[25] == 1'b1 && DIFT_MASK[8])							 
							 ))) ? 1'b1 : 1'b0;


assign DITFo_DepdcFind_tem_CS = (DITFi_Checken && (DITFi_CheckCSRen && 
							((DITFi_CheckCSRIndex == r_DITF_data_0[37:26] && r_DITF_data_0[25] == 1'b1 && DIFT_MASK[1]) || 
							 (DITFi_CheckCSRIndex == r_DITF_data_1[37:26] && r_DITF_data_1[25] == 1'b1 && DIFT_MASK[2]) ||
							 (DITFi_CheckCSRIndex == r_DITF_data_2[37:26] && r_DITF_data_2[25] == 1'b1 && DIFT_MASK[3]) ||
							 (DITFi_CheckCSRIndex == r_DITF_data_3[37:26] && r_DITF_data_3[25] == 1'b1 && DIFT_MASK[4]) ||
							 (DITFi_CheckCSRIndex == r_DITF_data_4[37:26] && r_DITF_data_4[25] == 1'b1 && DIFT_MASK[5]) ||
							 (DITFi_CheckCSRIndex == r_DITF_data_5[37:26] && r_DITF_data_5[25] == 1'b1 && DIFT_MASK[6]) ||
							 (DITFi_CheckCSRIndex == r_DITF_data_6[37:26] && r_DITF_data_6[25] == 1'b1 && DIFT_MASK[7]) ||
							 (DITFi_CheckCSRIndex == r_DITF_data_7[37:26] && r_DITF_data_7[25] == 1'b1 && DIFT_MASK[8])							 
							 ))) ? 1'b1 : 1'b0;






assign DITFo_write_ready = (DITF_cnt == 4'd8) ? 1'b0 : 1'b1;






assign DITFo_v = (DITF_cnt == 4'd0) ? 1'b0 : 1'b1;


assign DITFo_itag = (DITF_cnt == 4'd1 	? r_DITF_data_0[7:0]	:  8'd0) |
					(DITF_cnt == 4'd2 	? r_DITF_data_1[7:0]	:  8'd0) |
					(DITF_cnt == 4'd3 	? r_DITF_data_2[7:0]	:  8'd0) |
					(DITF_cnt == 4'd4 	? r_DITF_data_3[7:0]	:  8'd0) |
					(DITF_cnt == 4'd5 	? r_DITF_data_4[7:0]	:  8'd0) |
					(DITF_cnt == 4'd6 	? r_DITF_data_5[7:0]	:  8'd0) |
					(DITF_cnt == 4'd7 	? r_DITF_data_6[7:0]	:  8'd0) |
					(DITF_cnt == 4'd8 	? r_DITF_data_7[7:0]	:  8'd0) | 8'd0;


assign DITFo_rs1index = (DITF_cnt == 4'd1 	? r_DITF_data_0[12:8]	:  5'd0) |
						(DITF_cnt == 4'd2 	? r_DITF_data_1[12:8]	:  5'd0) |
						(DITF_cnt == 4'd3 	? r_DITF_data_2[12:8]	:  5'd0) |
						(DITF_cnt == 4'd4 	? r_DITF_data_3[12:8]	:  5'd0) |
						(DITF_cnt == 4'd5 	? r_DITF_data_4[12:8]	:  5'd0) |
						(DITF_cnt == 4'd6 	? r_DITF_data_5[12:8]	:  5'd0) |
						(DITF_cnt == 4'd7 	? r_DITF_data_6[12:8]	:  5'd0) |
						(DITF_cnt == 4'd8 	? r_DITF_data_7[12:8]	:  5'd0) | 5'd0;


assign DITFo_rs1en = (DITF_cnt == 4'd1 	? r_DITF_data_0[13]	:  1'd0) |
					 (DITF_cnt == 4'd2 	? r_DITF_data_1[13]	:  1'd0) |
					 (DITF_cnt == 4'd3 	? r_DITF_data_2[13]	:  1'd0) |
					 (DITF_cnt == 4'd4 	? r_DITF_data_3[13]	:  1'd0) |
					 (DITF_cnt == 4'd5 	? r_DITF_data_4[13]	:  1'd0) |
					 (DITF_cnt == 4'd6 	? r_DITF_data_5[13]	:  1'd0) |
					 (DITF_cnt == 4'd7 	? r_DITF_data_6[13]	:  1'd0) |
					 (DITF_cnt == 4'd8 	? r_DITF_data_7[13]	:  1'd0) | 1'd0;					


assign DITFo_rs2index = (DITF_cnt == 4'd1 	? r_DITF_data_0[18:14]	:  5'd0) |
					    (DITF_cnt == 4'd2 	? r_DITF_data_1[18:14]	:  5'd0) |
					    (DITF_cnt == 4'd3 	? r_DITF_data_2[18:14]	:  5'd0) |
					    (DITF_cnt == 4'd4 	? r_DITF_data_3[18:14]	:  5'd0) |
					    (DITF_cnt == 4'd5 	? r_DITF_data_4[18:14]	:  5'd0) |
					    (DITF_cnt == 4'd6 	? r_DITF_data_5[18:14]	:  5'd0) |
						(DITF_cnt == 4'd7 	? r_DITF_data_6[18:14]	:  5'd0) |
					    (DITF_cnt == 4'd8 	? r_DITF_data_7[18:14]	:  5'd0) | 5'd0;


assign DITFo_rs2en = (DITF_cnt == 4'd1 	? r_DITF_data_0[19]	:  1'd0) |
					 (DITF_cnt == 4'd2 	? r_DITF_data_1[19]	:  1'd0) |
					 (DITF_cnt == 4'd3 	? r_DITF_data_2[19]	:  1'd0) |
					 (DITF_cnt == 4'd4 	? r_DITF_data_3[19]	:  1'd0) |
					 (DITF_cnt == 4'd5 	? r_DITF_data_4[19]	:  1'd0) |
					 (DITF_cnt == 4'd6 	? r_DITF_data_5[19]	:  1'd0) |
					 (DITF_cnt == 4'd7 	? r_DITF_data_6[19]	:  1'd0) | 
					 (DITF_cnt == 4'd8 	? r_DITF_data_7[19]	:  1'd0) | 1'd0;


assign DITFo_rdindex = (DITF_cnt == 4'd1 	? r_DITF_data_0[24:20]	:  5'd0) |
					   (DITF_cnt == 4'd2 	? r_DITF_data_1[24:20]	:  5'd0) |
					   (DITF_cnt == 4'd3 	? r_DITF_data_2[24:20]	:  5'd0) |
					   (DITF_cnt == 4'd4 	? r_DITF_data_3[24:20]	:  5'd0) |
					   (DITF_cnt == 4'd5 	? r_DITF_data_4[24:20]	:  5'd0) |
					   (DITF_cnt == 4'd6 	? r_DITF_data_5[24:20]	:  5'd0) |
					   (DITF_cnt == 4'd7 	? r_DITF_data_6[24:20]	:  5'd0) |
					   (DITF_cnt == 4'd8 	? r_DITF_data_7[24:20]	:  5'd0) | 5'd0;


assign DITFo_rden = (DITF_cnt == 4'd1 	? r_DITF_data_0[25]	:  1'd0) |
					(DITF_cnt == 4'd2 	? r_DITF_data_1[25]	:  1'd0) |
					(DITF_cnt == 4'd3 	? r_DITF_data_2[25]	:  1'd0) |
					(DITF_cnt == 4'd4 	? r_DITF_data_3[25]	:  1'd0) |
					(DITF_cnt == 4'd5 	? r_DITF_data_4[25]	:  1'd0) |
					(DITF_cnt == 4'd6 	? r_DITF_data_5[25]	:  1'd0) |
					(DITF_cnt == 4'd7 	? r_DITF_data_6[25]	:  1'd0) |
					(DITF_cnt == 4'd8 	? r_DITF_data_7[25]	:  1'd0) | 1'd0;	


assign DITFo_csrindex = (DITF_cnt == 4'd1 	? r_DITF_data_0[37:26]	:  12'd0) |
					    (DITF_cnt == 4'd2 	? r_DITF_data_1[37:26]	:  12'd0) |
					    (DITF_cnt == 4'd3 	? r_DITF_data_2[37:26]	:  12'd0) |
					    (DITF_cnt == 4'd4 	? r_DITF_data_3[37:26]	:  12'd0) |
					    (DITF_cnt == 4'd5 	? r_DITF_data_4[37:26]	:  12'd0) |
					    (DITF_cnt == 4'd6 	? r_DITF_data_5[37:26]	:  12'd0) |
						(DITF_cnt == 4'd7 	? r_DITF_data_6[37:26]	:  12'd0) |
					    (DITF_cnt == 4'd8 	? r_DITF_data_7[37:26]	:  12'd0) | 12'd0;


assign DITFo_csren = (DITF_cnt == 4'd1 	? r_DITF_data_0[38]	:  1'd0) |
					 (DITF_cnt == 4'd2 	? r_DITF_data_1[38]	:  1'd0) |
					 (DITF_cnt == 4'd3 	? r_DITF_data_2[38]	:  1'd0) |
					 (DITF_cnt == 4'd4 	? r_DITF_data_3[38]	:  1'd0) |
					 (DITF_cnt == 4'd5 	? r_DITF_data_4[38]	:  1'd0) |
					 (DITF_cnt == 4'd6 	? r_DITF_data_5[38]	:  1'd0) |
					 (DITF_cnt == 4'd7 	? r_DITF_data_6[38]	:  1'd0) |
					 (DITF_cnt == 4'd8 	? r_DITF_data_7[38]	:  1'd0) | 1'd0;		


assign DITFo_jmp = (DITF_cnt == 4'd1 	? r_DITF_data_0[39]	:  1'd0) |
				   (DITF_cnt == 4'd2 	? r_DITF_data_1[39]	:  1'd0) |
				   (DITF_cnt == 4'd3 	? r_DITF_data_2[39]	:  1'd0) |
				   (DITF_cnt == 4'd4 	? r_DITF_data_3[39]	:  1'd0) |
				   (DITF_cnt == 4'd5 	? r_DITF_data_4[39]	:  1'd0) |
				   (DITF_cnt == 4'd6 	? r_DITF_data_5[39]	:  1'd0) |
				   (DITF_cnt == 4'd7 	? r_DITF_data_6[39]	:  1'd0) |
				   (DITF_cnt == 4'd8 	? r_DITF_data_7[39]	:  1'd0) | 1'd0;		
				   

assign DITFo_InsAccessFlt = (DITF_cnt == 4'd1 	? r_DITF_data_0[40]	:  1'd0) |
					        (DITF_cnt == 4'd2 	? r_DITF_data_1[40]	:  1'd0) |
					        (DITF_cnt == 4'd3 	? r_DITF_data_2[40]	:  1'd0) |
					        (DITF_cnt == 4'd4 	? r_DITF_data_3[40]	:  1'd0) |
					        (DITF_cnt == 4'd5 	? r_DITF_data_4[40]	:  1'd0) |
					        (DITF_cnt == 4'd6 	? r_DITF_data_5[40]	:  1'd0) |
							(DITF_cnt == 4'd7 	? r_DITF_data_6[40]	:  1'd0) |
					        (DITF_cnt == 4'd8 	? r_DITF_data_7[40]	:  1'd0) | 1'd0;		


assign DITFo_InsPageFlt = (DITF_cnt == 4'd1 	? r_DITF_data_0[41]	:  1'd0) |
					      (DITF_cnt == 4'd2 	? r_DITF_data_1[41]	:  1'd0) |
					      (DITF_cnt == 4'd3 	? r_DITF_data_2[41]	:  1'd0) |
					      (DITF_cnt == 4'd4 	? r_DITF_data_3[41]	:  1'd0) |
					      (DITF_cnt == 4'd5 	? r_DITF_data_4[41]	:  1'd0) |
					      (DITF_cnt == 4'd6 	? r_DITF_data_5[41]	:  1'd0) |
						  (DITF_cnt == 4'd7 	? r_DITF_data_6[41]	:  1'd0) |
					      (DITF_cnt == 4'd8 	? r_DITF_data_7[41]	:  1'd0) | 1'd0;		


assign DITFo_InsAddrMis = (DITF_cnt == 4'd1 	? r_DITF_data_0[42]	:  1'd0) |
					      (DITF_cnt == 4'd2 	? r_DITF_data_1[42]	:  1'd0) |
					      (DITF_cnt == 4'd3 	? r_DITF_data_2[42]	:  1'd0) |
					      (DITF_cnt == 4'd4 	? r_DITF_data_3[42]	:  1'd0) |
					      (DITF_cnt == 4'd5 	? r_DITF_data_4[42]	:  1'd0) |
					      (DITF_cnt == 4'd6 	? r_DITF_data_5[42]	:  1'd0) |
						  (DITF_cnt == 4'd7 	? r_DITF_data_6[42]	:  1'd0) | 
					      (DITF_cnt == 4'd8 	? r_DITF_data_7[42]	:  1'd0) | 1'd0;		


assign DITFo_illins = (DITF_cnt == 4'd1 	? r_DITF_data_0[43]	:  1'd0) |
					  (DITF_cnt == 4'd2 	? r_DITF_data_1[43]	:  1'd0) |
					  (DITF_cnt == 4'd3 	? r_DITF_data_2[43]	:  1'd0) |
					  (DITF_cnt == 4'd4 	? r_DITF_data_3[43]	:  1'd0) |
					  (DITF_cnt == 4'd5 	? r_DITF_data_4[43]	:  1'd0) |
					  (DITF_cnt == 4'd6 	? r_DITF_data_5[43]	:  1'd0) |
					  (DITF_cnt == 4'd7 	? r_DITF_data_6[43]	:  1'd0) |
					  (DITF_cnt == 4'd8 	? r_DITF_data_7[43]	:  1'd0) | 1'd0;		


assign DITFo_mret = (DITF_cnt == 4'd1 	? r_DITF_data_0[44]	:  1'd0) |
					(DITF_cnt == 4'd2 	? r_DITF_data_1[44]	:  1'd0) |
					(DITF_cnt == 4'd3 	? r_DITF_data_2[44]	:  1'd0) |
					(DITF_cnt == 4'd4 	? r_DITF_data_3[44]	:  1'd0) |
					(DITF_cnt == 4'd5 	? r_DITF_data_4[44]	:  1'd0) |
					(DITF_cnt == 4'd6 	? r_DITF_data_5[44]	:  1'd0) |
					(DITF_cnt == 4'd7 	? r_DITF_data_6[44]	:  1'd0) |
					(DITF_cnt == 4'd8 	? r_DITF_data_7[44]	:  1'd0) | 1'd0;		


assign DITFo_sret = (DITF_cnt == 4'd1 	? r_DITF_data_0[45]	:  1'd0) |
					(DITF_cnt == 4'd2 	? r_DITF_data_1[45]	:  1'd0) |
					(DITF_cnt == 4'd3 	? r_DITF_data_2[45]	:  1'd0) |
					(DITF_cnt == 4'd4 	? r_DITF_data_3[45]	:  1'd0) |
					(DITF_cnt == 4'd5 	? r_DITF_data_4[45]	:  1'd0) |
					(DITF_cnt == 4'd6 	? r_DITF_data_5[45]	:  1'd0) |
					(DITF_cnt == 4'd7 	? r_DITF_data_6[45]	:  1'd0) |
					(DITF_cnt == 4'd8 	? r_DITF_data_7[45]	:  1'd0) | 1'd0;		


assign DITFo_ecall = (DITF_cnt == 4'd1 	? r_DITF_data_0[46]	:  1'd0) |
					 (DITF_cnt == 4'd2 	? r_DITF_data_1[46]	:  1'd0) |
					 (DITF_cnt == 4'd3 	? r_DITF_data_2[46]	:  1'd0) |
					 (DITF_cnt == 4'd4 	? r_DITF_data_3[46]	:  1'd0) |
					 (DITF_cnt == 4'd5 	? r_DITF_data_4[46]	:  1'd0) |
					 (DITF_cnt == 4'd6 	? r_DITF_data_5[46]	:  1'd0) |
					 (DITF_cnt == 4'd7 	? r_DITF_data_6[46]	:  1'd0) |
					 (DITF_cnt == 4'd8 	? r_DITF_data_7[46]	:  1'd0) | 1'd0;		


assign DITFo_ebreak = (DITF_cnt == 4'd1 	? r_DITF_data_0[47]	:  1'd0) |
					  (DITF_cnt == 4'd2 	? r_DITF_data_1[47]	:  1'd0) |
					  (DITF_cnt == 4'd3 	? r_DITF_data_2[47]	:  1'd0) |
					  (DITF_cnt == 4'd4 	? r_DITF_data_3[47]	:  1'd0) |
					  (DITF_cnt == 4'd5 	? r_DITF_data_4[47]	:  1'd0) |
					  (DITF_cnt == 4'd6 	? r_DITF_data_5[47]	:  1'd0) |
					  (DITF_cnt == 4'd7 	? r_DITF_data_6[47]	:  1'd0) |
					  (DITF_cnt == 4'd8 	? r_DITF_data_7[47]	:  1'd0) | 1'd0;		


assign DITFo_system = (DITF_cnt == 4'd1 	? r_DITF_data_0[48]	:  1'd0) |
					  (DITF_cnt == 4'd2 	? r_DITF_data_1[48]	:  1'd0) |
					  (DITF_cnt == 4'd3 	? r_DITF_data_2[48]	:  1'd0) |
					  (DITF_cnt == 4'd4 	? r_DITF_data_3[48]	:  1'd0) |
					  (DITF_cnt == 4'd5 	? r_DITF_data_4[48]	:  1'd0) |
					  (DITF_cnt == 4'd6 	? r_DITF_data_5[48]	:  1'd0) |
					  (DITF_cnt == 4'd7 	? r_DITF_data_6[48]	:  1'd0) |
					  (DITF_cnt == 4'd8 	? r_DITF_data_7[48]	:  1'd0) | 1'd0;	


assign DITFo_fencevma = (DITF_cnt == 4'd1 	? r_DITF_data_0[49]	:  1'd0) |
					     (DITF_cnt == 4'd2 	? r_DITF_data_1[49]	:  1'd0) |
					     (DITF_cnt == 4'd3 	? r_DITF_data_2[49]	:  1'd0) |
					     (DITF_cnt == 4'd4 	? r_DITF_data_3[49]	:  1'd0) |
					     (DITF_cnt == 4'd5 	? r_DITF_data_4[49]	:  1'd0) |
					     (DITF_cnt == 4'd6 	? r_DITF_data_5[49]	:  1'd0) |
					     (DITF_cnt == 4'd7 	? r_DITF_data_6[49]	:  1'd0) |
					     (DITF_cnt == 4'd8 	? r_DITF_data_7[49]	:  1'd0) | 1'd0;	
					  

assign DITFo_fencei = (DITF_cnt == 4'd1 	? r_DITF_data_0[50]	:  1'd0) |
					   (DITF_cnt == 4'd2 	? r_DITF_data_1[50]	:  1'd0) |
					   (DITF_cnt == 4'd3 	? r_DITF_data_2[50]	:  1'd0) |
					   (DITF_cnt == 4'd4 	? r_DITF_data_3[50]	:  1'd0) |
					   (DITF_cnt == 4'd5 	? r_DITF_data_4[50]	:  1'd0) |
					   (DITF_cnt == 4'd6 	? r_DITF_data_5[50]	:  1'd0) |
					   (DITF_cnt == 4'd7 	? r_DITF_data_6[50]	:  1'd0) |
					   (DITF_cnt == 4'd8 	? r_DITF_data_7[50]	:  1'd0) | 1'd0;	
					  

assign DITFo_fence = (DITF_cnt == 4'd1 	? r_DITF_data_0[51]	:  1'd0) |
					 (DITF_cnt == 4'd2 	? r_DITF_data_1[51]	:  1'd0) |
					 (DITF_cnt == 4'd3 	? r_DITF_data_2[51]	:  1'd0) |
					 (DITF_cnt == 4'd4 	? r_DITF_data_3[51]	:  1'd0) |
					 (DITF_cnt == 4'd5 	? r_DITF_data_4[51]	:  1'd0) |
					 (DITF_cnt == 4'd6 	? r_DITF_data_5[51]	:  1'd0) |
					 (DITF_cnt == 4'd7 	? r_DITF_data_6[51]	:  1'd0) |
					 (DITF_cnt == 4'd8 	? r_DITF_data_7[51]	:  1'd0) | 1'd0;	
					  
endmodule











module ysyx_210152_md_wrapper(

    input wire clk,
    input wire arst,
    input wire flush,

    input wire i_valid,
    input wire[7:0] i_opcode,
    input wire[1:0] i_opinfo,
    input wire[63:0] i_data1,
    input wire[63:0] i_data2,
    input wire[7:0] i_tag,
    input wire[1:0] i_priv,
    input wire[`YSYX210152_XLEN-1:0] i_pc,
    output wire i_ready,

    output wire[63:0] d_result,
    output wire d_valid,
    output wire[7:0] d_tag,
    output wire[1:0] d_priv,
    output wire[`YSYX210152_XLEN-1:0] d_pc,
    input wire d_ready
    );

    wire stallreq_from_execute;
    wire stallreq_from_output;
    wire flush_for_decode;
    wire stall;
    wire flush_for_execute;
    
    wire[127:0] ex_data1;
    wire[127:0] ex_data2;
    wire ex_div;
    wire[7:0] ex_opcode;
    wire[1:0] ex_opinfo;
    
    wire [63:0]diver,divee,div,mod;
    wire div_start,div_finish;
    
    wire ex_valid;
    wire[63:0] ex_result;
    wire[7:0] ex_tag;
    wire[1:0] ex_priv;
    wire[`YSYX210152_XLEN-1:0] ex_pc;
    wire div_idle;

    assign stallreq_from_output = ~arst & ~d_ready & d_valid;
    assign flush_for_decode = stallreq_from_execute | flush;
    assign flush_for_execute = flush;
    assign stall = stallreq_from_output;
    assign i_ready = ~arst & ~flush & ~stallreq_from_execute & ~stallreq_from_output & i_valid;
    ysyx_210152_md_decode               u_decode(
            .clk            (clk),
            .arst           (arst),
            .stall          (stall),
            .flush          (flush_for_decode),
            .handshake      (i_ready & i_valid),
            .i_opcode       (i_opcode),
            .i_opinfo       (i_opinfo),
            .i_data1        (i_data1),
            .i_data2        (i_data2),
            .i_tag          (i_tag),
            .i_priv         (i_priv),
            .i_pc           (i_pc),
            .ex_data1       (ex_data1),
            .ex_data2       (ex_data2),
            .ex_div         (ex_div),
            .ex_opcode      (ex_opcode),
            .ex_opinfo      (ex_opinfo),
            .ex_tag         (ex_tag),
            .ex_priv        (ex_priv),
            .ex_pc          (ex_pc)
             );
    ysyx_210152_md_execute              u_execute(
            .clk            (clk),
            .arst           (arst),
            .stall          (stall),
            .flush          (flush_for_execute),
            .ex_data1       (ex_data1),
            .ex_data2       (ex_data2),
            .ex_div         (ex_div),
            .ex_opcode      (ex_opcode),
            .ex_opinfo      (ex_opinfo),
            .ex_tag         (ex_tag),
            .ex_priv        (ex_priv),
            .ex_pc          (ex_pc),
            .d_result       (d_result),
            .d_valid        (d_valid),
            .d_tag          (d_tag),
            .d_priv         (d_priv),
            .d_pc           (d_pc),
            .stallreq       (stallreq_from_execute),

            .q              (div), 
            .r              (mod), 
            .div_valid      (div_finish),
            .div_idle       (div_idle),
            .dividend       (divee),
            .divisor        (diver),
            .div_start      (div_start)
    ); 
    ysyx_210152_MulCyc_Div#(
		.DIV_WIDTH(64),
		.UNROLL_COEFF(0)
	)DIVIDER
	(
	.clk                    (clk),
	.rst                    (arst),
	.flush                  (flush_for_execute),
	.stall                  (stall),
	.start                  (div_start),
	
	.DIVIDEND               (divee),
	.DIVISOR                (diver),
	
	.DIV                    (div),
	.MOD                    (mod),
	.div_idle               (div_idle),
	.calc_done              (div_finish) 
	);

endmodule













module ysyx_210152_LSU
#(parameter DTLB_FIBID = 8'h02)
(

    input  wire             LSUi_CLK,
    input  wire             LSUi_ARST,
    input  wire             LSUi_Flush,
    input wire              LSUi_fencevma,
    input wire              LSUi_fence,

    input wire              LSUi_ModifyPermit,
    input wire [7:0]        LSUi_ModifyPermitID,

    input  wire [43:0]      CSR_satpppn,
    input  wire [3:0]       CSR_satpmode,
    input  wire [1:0]       CSR_priv,
    input  wire             CSR_InhibitDcache,
    input  wire             CSR_DCacheWT,
    input  wire             CSR_mxr,
    input  wire             CSR_sum,

    input  wire             PIP_LSUi_MSC_valid,         
    input  wire [7:0]       PIP_LSUi_Opcode,            
    input  wire [1:0]       PIP_LSUi_OpInfo,            
    input  wire [3:0]       PIP_LSUi_OpSize, 
    input  wire [7:0]       PIP_LSUi_INFO_itag,
    input  wire [1:0]       PIP_LSUi_INFO_priv,         
    input  wire [`YSYX210152_XLEN-1:0] PIP_LSUi_INFO_pc,           
    input  wire             PIP_LSUi_INFO_unpage,       
    input  wire [`YSYX210152_XLEN-1:0] PIP_LSUi_DATA_ds1,
    input  wire [`YSYX210152_XLEN-1:0] PIP_LSUi_DATA_ds2,
    output  wire            PIP_LSUo_FC_ready,

    output                  PIP_LSUo_MSC_valid,
    output                  PIP_LSUo_MSC_LoadPageFlt ,
    output                  PIP_LSUo_MSC_LoadAccFlt  ,
    output                  PIP_LSUo_MSC_LoadAddrMis ,
    output                  PIP_LSUo_MSC_StorePageFlt,
    output                  PIP_LSUo_MSC_StoreAccFlt ,
    output                  PIP_LSUo_MSC_StoreAddrMis,
    output wire             PIP_LSUo_INFO_ci,
    output wire [7:0]       PIP_LSUo_INFO_itag,
    output wire [`YSYX210152_XLEN-1:0] PIP_LSUo_INFO_pc,
    output wire [1:0]       PIP_LSUo_INFO_priv,
    output     [`YSYX210152_XLEN-1:0]  PIP_LSUo_DATA_data1,        
    output wire [`YSYX210152_XLEN-1:0] PIP_LSUo_DATA_data2,        
    input wire              PIP_LSUi_FC_ready,           
    

    output  wire            DTLB_FIBo_WREN,        
    output  wire            DTLB_FIBo_REQ,         
    input   wire            DTLB_FIBi_ACK,         
    input   wire            DTLB_FIBi_FULL,        
    output  wire [7:0]      DTLB_FIBo_ID,
    output  wire [7:0]      DTLB_FIBo_CMD,
    output  wire [3:0]      DTLB_FIBo_BURST,
    output  wire [3:0]      DTLB_FIBo_SIZE,
    output  wire [`YSYX210152_XLEN-1:0]DTLB_FIBo_ADDR,      
    output  wire [`YSYX210152_XLEN-1:0]DTLB_FIBo_DATA,
    input   wire [7:0]      DTLB_FIBi_ID,
    input   wire [7:0]      DTLB_FIBi_RPL,
    input   wire            DTLB_FIBi_V,
    input   wire [`YSYX210152_XLEN-1:0]DTLB_FIBi_DATA,

    output wire             LSUo_AQ_V,          
    output wire [7:0]       LSUo_AQ_ID,         
    output wire [7:0]       LSUo_AQ_CMD,        
    output wire             LSUo_AQ_CI,         
    output wire             LSUo_AQ_WT,         
    output wire [15:0]      LSUo_AQ_BSEL,       
    output wire [127:0]     LSUo_AQ_WDATA,      
    output wire [`YSYX210152_XLEN-1:0] LSUo_AQ_ADDR,
    input wire              LSUi_AQ_FULL,
    input wire              LSUi_RQ_V,
    input wire [7:0]        LSUi_RQ_ID,
    input wire              LSUi_RQ_WRERR,
    input wire              LSUi_RQ_RDERR,
    input wire              LSUi_RQ_RDY,
    input wire [127:0]      LSUi_RQ_RDATA,
    output wire             LSUo_RQ_ACK
);


    wire              Tablei_WREN,          Tablei_RDEN;
    wire [7:0]        Tablei_WID,           Tablei_RID;
    wire                                    Tablei_Remove;
    wire                                    Tableo_V;
    wire [`YSYX210152_XLEN-1:0]  Tablei_ADDR,          Tableo_ADDR;
    wire [`YSYX210152_XLEN-1:0]  Tablei_PC,            Tableo_PC;
    wire [7:0]        Tablei_ITAG,          Tableo_ITAG;
    wire [1:0]        Tablei_priv,          Tableo_priv;
    wire [7:0]        Tablei_opcode,        Tableo_opcode;
    wire [1:0]        Tablei_opinfo,        Tableo_opinfo;
    wire [3:0]        Tablei_opsize,        Tableo_opsize;
    wire              Tablei_ci,            Tableo_ci;
    wire              Tablei_InstPageFlt,   Tableo_InstPageFlt;
    wire              Tablei_InstAddrMis,   Tableo_InstAddrmis;
    wire              Tablei_LoadPageFlt,   Tableo_LoadPageFlt;
    wire              Tablei_LoadAddrMis,   Tableo_LoadAddrMis;
    wire              Tablei_StorePageFlt,  Tableo_StorePageFlt;
    wire              Tablei_StoreAddreMis, Tableo_StoreAddrMis;
    wire              Tableo_FULL;


ysyx_210152_ATU#(
    .FIB_ID(DTLB_FIBID),                                          
    .TLB_entry_NUM (`YSYX210152_DTLB_entry_NUM)
) LSU_ATU(
    .ATUi_CLK                       (LSUi_CLK),
    .ATUi_ARST                      (LSUi_ARST),
    .ATUi_Flush                     (LSUi_Flush),
    .ATUi_ModifyPermit              (LSUi_ModifyPermit),
    .ATUi_ModifyPermitID            (LSUi_ModifyPermitID),
    .ATUi_TLBrefersh                (LSUi_fencevma),
    .ATUi_CacheRefersh              (LSUi_fence),
    .ATUi_CSR_CacheInhibit          (CSR_InhibitDcache),
    .ATUi_CSR_CacheWT               (CSR_DCacheWT),                 
    .ATUi_CSR_mxr                   (CSR_mxr),
    .ATUi_CSR_sum                   (CSR_sum),
    .ATUi_CSR_satpmode              (CSR_satpmode),
    .ATUi_CSR_satpppn               (CSR_satpppn),
    .PIP_ATUi_MSC_valid             (PIP_LSUi_MSC_valid),
    .PIP_ATUi_Opcode                (PIP_LSUi_Opcode),
    .PIP_ATUi_OpInfo                (PIP_LSUi_OpInfo),
    .PIP_ATUi_OpSize                (PIP_LSUi_OpSize),
    .PIP_ATUi_INFO_ITAG             (PIP_LSUi_INFO_itag),
    .PIP_ATUi_INFO_priv             (PIP_LSUi_INFO_priv),
    .PIP_ATUi_INFO_unpage           (PIP_LSUi_INFO_unpage),
    .PIP_ATUi_INFO_PC               (PIP_LSUi_INFO_pc),     
    .PIP_ATUi_DATA_VA               (PIP_LSUi_DATA_ds1),
    .PIP_ATUi_DATA_ds2              (PIP_LSUi_DATA_ds2),
    .PIP_ATUo_FC_ready              (PIP_LSUo_FC_ready),

    .Tablei_WREN                    (Tablei_WREN),
    .Tablei_WID                     (Tablei_WID),
    .Tablei_ADDR                    (Tablei_ADDR),
    .Tablei_PC                      (Tablei_PC),
    .Tablei_ITAG                    (Tablei_ITAG),
    .Tablei_priv                    (Tablei_priv),
    .Tablei_opcode                  (Tablei_opcode),
    .Tablei_opinfo                  (Tablei_opinfo),
    .Tablei_opsize                  (Tablei_opsize),
    .Tablei_ci                      (Tablei_ci),
    .Tablei_InstPageFlt             (Tablei_InstPageFlt),
    .Tablei_InstAddrMis             (Tablei_InstAddrMis),
    .Tablei_LoadPageFlt             (Tablei_LoadPageFlt),
    .Tablei_LoadAddrMis             (Tablei_LoadAddrMis),
    .Tablei_StorePageFlt            (Tablei_StorePageFlt),
    .Tablei_StoreAddreMis           (Tablei_StoreAddreMis),
    .Tableo_FULL                    (Tableo_FULL),

    .ATUo_AQ_V                      (LSUo_AQ_V),
    .ATUo_AQ_ID                     (LSUo_AQ_ID),
    .ATUo_AQ_CMD                    (LSUo_AQ_CMD),
    .ATUo_AQ_CI                     (LSUo_AQ_CI),
    .ATUo_AQ_WT                     (LSUo_AQ_WT),
    .ATUo_AQ_BSEL                   (LSUo_AQ_BSEL),
    .ATUo_AQ_WDATA                  (LSUo_AQ_WDATA),
    .ATUo_AQ_ADDR                   (LSUo_AQ_ADDR),
    .ATUi_AQ_FULL                   (LSUi_AQ_FULL),

    .ATUo_FIB_WREN                  (DTLB_FIBo_WREN),
    .ATUo_FIB_REQ                   (DTLB_FIBo_REQ),
    .ATUi_FIB_ACK                   (DTLB_FIBi_ACK),
    .ATUi_FIB_FULL                  (DTLB_FIBi_FULL),
    .ATUo_FIB_ID                    (DTLB_FIBo_ID),
    .ATUo_FIB_CMD                   (DTLB_FIBo_CMD),
    .ATUo_FIB_BURST                 (DTLB_FIBo_BURST),
    .ATUo_FIB_SIZE                  (DTLB_FIBo_SIZE),
    .ATUo_FIB_ADDR                  (DTLB_FIBo_ADDR),
    .ATUo_FIB_DATA                  (DTLB_FIBo_DATA),
    .ATUi_FIB_ID                    (DTLB_FIBi_ID),
    .ATUi_FIB_RPL                   (DTLB_FIBi_RPL),
    .ATUi_FIB_V                     (DTLB_FIBi_V),
    .ATUi_FIB_DATA                  (DTLB_FIBi_DATA)
);

ysyx_210152_AccessTable             AccessTable(
    .GLB_CLKi                       (LSUi_CLK),
    .GLB_SRSTi                      (LSUi_ARST | LSUi_Flush),

    .Table_Full                     (Tableo_FULL),
    .Table_Empty                    (),             

    .Tablei_WREN                    (Tablei_WREN),
    .Tablei_WID                     (Tablei_WID),
    .Tablei_ADDR                    (Tablei_ADDR),
    .Tablei_PC                      (Tablei_PC),
    .Tablei_ITAG                    (Tablei_ITAG),
    .Tablei_priv                    (Tablei_priv),
    .Tablei_opcode                  (Tablei_opcode),
    .Tablei_opinfo                  (Tablei_opinfo),
    .Tablei_opsize                  (Tablei_opsize),
    .Tablei_ci                      (Tablei_ci),
    .Tablei_InstPageFlt             (Tablei_InstPageFlt),
    .Tablei_LoadPageFlt             (Tablei_LoadPageFlt),
    .Tablei_StorePageFlt            (Tablei_StorePageFlt),
    .Tablei_InstAddrmis             (Tablei_InstAddrMis),
    .Tablei_LoadAddrMis             (Tablei_LoadAddrMis),
    .Tablei_StoreAddrMis            (Tablei_StoreAddreMis),

    .Tablei_RDEN                    (Tablei_RDEN),
    .Tablei_RID                     (Tablei_RID),
    .Tablei_Remove                  (Tablei_Remove),
    .Tableo_V                       (Tableo_V),
    .Tableo_ADDR                    (Tableo_ADDR),
    .Tableo_PC                      (Tableo_PC),
    .Tableo_ITAG                    (Tableo_ITAG),
    .Tableo_priv                    (Tableo_priv),
    .Tableo_opcode                  (Tableo_opcode),
    .Tableo_opinfo                  (Tableo_opinfo),
    .Tableo_opsize                  (Tableo_opsize),
    .Tableo_ci                      (Tableo_ci),
    .Tableo_InstPageFlt             (Tableo_InstPageFlt),
    .Tableo_LoadPageFlt             (Tableo_LoadPageFlt),
    .Tableo_StorePageFlt            (Tableo_StorePageFlt),
    .Tableo_InstAddrmis             (Tableo_InstAddrmis),
    .Tableo_LoadAddrMis             (Tableo_LoadAddrMis),
    .Tableo_StoreAddrMis            (Tableo_StoreAddrMis)	
);
ysyx_210152_ResultUnit              ResultUnit(

    .RUi_CLK                        (LSUi_CLK),
    .RUi_ARST                       (LSUi_ARST),
    .RUi_Flush                      (LSUi_Flush),

    .RUi_RQ_V                       (LSUi_RQ_V),
    .RUi_RQ_ID                      (LSUi_RQ_ID),
    .RUi_RQ_WRERR                   (LSUi_RQ_WRERR),
    .RUi_RQ_RDERR                   (LSUi_RQ_RDERR),
    .RUi_RQ_RDY                     (LSUi_RQ_RDY),
    .RUi_RQ_RDATA                   (LSUi_RQ_RDATA),
    .RUo_RQ_ACK                     (LSUo_RQ_ACK),

    .Tablei_RDEN                    (Tablei_RDEN),
    .Tablei_RID                     (Tablei_RID),
    .Tablei_Remove                  (Tablei_Remove),
    .Tableo_V                       (Tableo_V),
    .Tableo_ADDR                    (Tableo_ADDR),
    .Tableo_PC                      (Tableo_PC),
    .Tableo_ITAG                    (Tableo_ITAG),
    .Tableo_priv                    (Tableo_priv),
    .Tableo_opcode                  (Tableo_opcode),
    .Tableo_opinfo                  (Tableo_opinfo),
    .Tableo_opsize                  (Tableo_opsize),
    .Tableo_ci                      (Tableo_ci),
    .Tableo_InstPageFlt             (Tableo_InstPageFlt),
    .Tableo_LoadPageFlt             (Tableo_LoadPageFlt),
    .Tableo_StorePageFlt            (Tableo_StorePageFlt),
    .Tableo_InstAddrmis             (Tableo_InstAddrmis),
    .Tableo_LoadAddrMis             (Tableo_LoadAddrMis),
    .Tableo_StoreAddrMis            (Tableo_StoreAddrMis),	

    .RUo_valid                      (PIP_LSUo_MSC_valid),
    .RUo_InstPageFlt                (),
    .RUo_InstAddrMis                (),
    .RUo_InstAccFlt                 (),
    .RUo_LoadPageFlt                (PIP_LSUo_MSC_LoadPageFlt),
    .RUo_LoadAddrMis                (PIP_LSUo_MSC_LoadAddrMis),
    .RUo_LoadAccFlt                 (PIP_LSUo_MSC_LoadAccFlt),
    .RUo_StorePageFlt               (PIP_LSUo_MSC_StorePageFlt),
    .RUo_StoreAddrMis               (PIP_LSUo_MSC_StoreAddrMis),
    .RUo_StoreAccFlt                (PIP_LSUo_MSC_StoreAccFlt),
    .RUo_ci                         (PIP_LSUo_INFO_ci),
    .RUo_ITAG                       (PIP_LSUo_INFO_itag),
    .RUo_priv                       (PIP_LSUo_INFO_priv),
    .RUo_PC                         (PIP_LSUo_INFO_pc),
    .RUo_VADDR                      (PIP_LSUo_DATA_data2),
    .RUo_DATA                       (PIP_LSUo_DATA_data1),
    .RUi_ready                      (PIP_LSUi_FC_ready)

);
endmodule













module ysyx_210152_ALU(

    input  wire             ALUi_CLK,
    input  wire             ALUi_ARST,
    input  wire             ALUi_Flush,

    input  wire             PIP_ALUi_MSC_valid,         
    input  wire [7:0]       PIP_ALUi_Opcode,            
    input  wire [1:0]       PIP_ALUi_OpInfo,            
    input  wire [7:0]       PIP_ALUi_INFO_itag,
    input  wire [1:0]       PIP_ALUi_INFO_priv,         
    input  wire [`YSYX210152_XLEN-1:0] PIP_ALUi_INFO_PC,           
    input  wire [`YSYX210152_XLEN-1:0] PIP_ALUi_DATA_ds1,
    input  wire [`YSYX210152_XLEN-1:0] PIP_ALUi_DATA_ds2,
    output  reg             PIP_ALUo_FC_ready,

    output reg              PIP_ALUo_MSC_valid,
    output reg [7:0]        PIP_ALUo_INFO_itag,
    output reg [`YSYX210152_XLEN-1:0]  PIP_ALUo_INFO_pc,
    output reg [1:0]        PIP_ALUo_INFO_priv,
    output reg [`YSYX210152_XLEN-1:0]  PIP_ALUo_DATA_data1,        
    output reg [`YSYX210152_XLEN-1:0]  PIP_ALUo_DATA_data2,        
    input wire              PIP_ALUi_FC_ready           
);
    wire [`YSYX210152_XLEN-1:0]    DataOut1, DataOut2;
    wire                Valid;
assign Valid = ALUi_Flush ? 1'b0 : PIP_ALUi_MSC_valid;

ysyx_210152_ALUcore         ALUcore(
    .Valid              (Valid),
    .Opcode             (PIP_ALUi_Opcode),
    .OpInfo             (PIP_ALUi_OpInfo),
    .DataSource1        (PIP_ALUi_DATA_ds1),
    .DataSource2        (PIP_ALUi_DATA_ds2),
    .DataOut1           (DataOut1),
    .DataOut2           (DataOut2)
);

always@(posedge ALUi_CLK or posedge ALUi_ARST)begin
    if(ALUi_ARST)begin
        PIP_ALUo_MSC_valid  <= 1'b0;
        PIP_ALUo_INFO_itag  <= 8'h00;
        PIP_ALUo_INFO_pc    <= 64'h0;
        PIP_ALUo_INFO_priv  <= `YSYX210152_Machine;
        PIP_ALUo_DATA_data1 <= 64'h0;
        PIP_ALUo_DATA_data2 <= 64'h0;
    end
    else if(PIP_ALUo_MSC_valid & !PIP_ALUi_FC_ready)begin
        PIP_ALUo_MSC_valid  <= PIP_ALUo_MSC_valid;
        PIP_ALUo_INFO_itag  <= PIP_ALUo_INFO_itag;
        PIP_ALUo_INFO_pc    <= PIP_ALUo_INFO_pc;
        PIP_ALUo_INFO_priv  <= PIP_ALUo_INFO_priv;
        PIP_ALUo_DATA_data1 <= PIP_ALUo_DATA_data1;
        PIP_ALUo_DATA_data2 <= PIP_ALUo_DATA_data2;
    end
    else begin
        PIP_ALUo_MSC_valid  <= Valid;
        PIP_ALUo_INFO_itag  <= PIP_ALUi_INFO_itag;
        PIP_ALUo_INFO_pc    <= PIP_ALUi_INFO_PC;
        PIP_ALUo_INFO_priv  <= PIP_ALUi_INFO_priv;
        PIP_ALUo_DATA_data1 <= DataOut1;
        PIP_ALUo_DATA_data2 <= DataOut2;
    end
end

always@(*)begin
    if(PIP_ALUi_MSC_valid)begin         
        if(ALUi_Flush)begin
            PIP_ALUo_FC_ready = 1'b1;
        end
        else if(PIP_ALUo_MSC_valid & !PIP_ALUi_FC_ready)begin
            PIP_ALUo_FC_ready = 1'b0;            
        end
        else begin
            PIP_ALUo_FC_ready = 1'b1;
        end
    end
    else begin
        PIP_ALUo_FC_ready = 1'b0;
    end
end

endmodule







module ysyx_210152_CSR_top
#(
    parameter HARTID = 'h0
)
(
    input wire              CLKi, ARSTi,
    
    input wire [`YSYX210152_XLEN-1:0]  mtime,                                          
    input wire              Interrupt_MEI, Interrupt_MSI, Interrupt_MTI,    
    input wire              Interrupt_SEI,
    
    output reg              Global_Flush,
    output reg [`YSYX210152_XLEN-1:0]  Global_newPC,
    
    input wire              csr_rden,
    input wire [11:0]       csr_rdindex,
    output reg [`YSYX210152_XLEN-1:0]  csr_rddata,
    output wire [43:0]      csr_satpppn,
    output wire [3:0]       csr_satpmode,
    output wire             csr_tsr, csr_tvm, csr_sum, csr_mpriv, csr_mxr, csr_mige, csr_sige,
    output wire [`YSYX210152_XLEN-1:0] csr_mideleg, csr_medeleg, csr_mip, csr_mie,
    output wire [1:0]       csr_priv, csr_mpp,
    output wire             csr_InhibitIcache, csr_InhibitDcache, csr_DCacheWT,
    
    input wire              CMT_valid,
    input wire              CMT_csren,
    input wire [11:0]       CMT_csrindex,
    input wire [`YSYX210152_XLEN-1:0]  CMT_pc,
    input wire [`YSYX210152_XLEN-1:0]  CMT_data2,
    input wire              CMT_mret,
    input wire              CMT_sret,
    input wire              CMT_system,
    input wire [`YSYX210152_XLEN-1:0]  CMT_trap_cause,
    input wire [`YSYX210152_XLEN-1:0]  CMT_trap_pc,
    input wire [`YSYX210152_XLEN-1:0]  CMT_trap_value,
    input wire              CMT_trap_m,
    input wire              CMT_trap_s,
    input wire              CMT_trap_async
`ifdef DEBUG_FLAG
    ,output [ 1:0] privilege,
    output [63:0] mstatus,
    output [63:0] sstatus,
    output [63:0] mepc,
    output [63:0] sepc,
    output [63:0] mtval,
    output [63:0] stval,
    output [63:0] mtvec,
    output [63:0] stvec,
    output [63:0] mcause,
    output [63:0] scause,
    output [63:0] satp,
    output [63:0] mip,
    output [63:0] mie,
    output [63:0] mscratch,
    output [63:0] sscratch,
    output [63:0] mideleg,
    output [63:0] medeleg,
    
    output       trap_valid,
    output[ 2:0] trap_code,
    output[63:0] trap_pc,
    output[63:0] mcycle,
    output[63:0] minstret,
    
    output [31:0] intrNO,
    output [31:0] cause,
    output [63:0] exceptionPC
`endif
);
/***********************************************************************************
                                注意事项
    当指令是一条system指令时，这条指令是不会有异步异常的！ 否则就出现了中断咬人！
    执行完成system类指令后，会引起流水线全局冲刷

************************************************************************************/

`ifndef DEBUG_FLAG
    wire [`YSYX210152_XLEN-1:0] mstatus,  mie;            
    wire [`YSYX210152_XLEN-1:0] sstatus, satp ;           
    wire [`YSYX210152_XLEN-1:0] mtvec,     stvec,  mideleg,    medeleg;
    wire [1:0]       privilege;

    wire [`YSYX210152_XLEN-1:0] mip;                                  
    wire [`YSYX210152_XLEN-1:0] mscratch, mepc, mcause, mtval;             
    wire [`YSYX210152_XLEN-1:0] sscratch, sepc, scause, stval;
`endif

    wire [`YSYX210152_XLEN-1:0]  sip, sie,  scounteren,  misa,          mcounteren;            
    reg  [43:0]      satp_ppn;
    reg  [3:0]       satp_mode;

always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        satp_ppn <= 'h0;
        satp_mode<= `YSYX210152_Sv39_Bare;
    end
    else if(CMT_csren)begin
        if(CMT_csrindex == `YSYX210152_srw_satp_index)begin
            satp_ppn <= CMT_data2[43:0];
            satp_mode<= CMT_data2[63:60];
        end
    end
end
assign satp = {satp_mode,16'b0,satp_ppn};
assign csr_satpppn = satp_ppn;
assign csr_satpmode= satp_mode;

    wire [`YSYX210152_XLEN-1:0] mhartid, mvendorid, marchid, mimpid;
    reg  [`YSYX210152_XLEN-1:0] mtime_copy;                                 
always@(posedge CLKi)begin
    mtime_copy <= mtime;
end

`ifndef DEBUG_FLAG
    wire [`YSYX210152_XLEN-1:0] mcycle, minstret;
`endif
    wire [`YSYX210152_XLEN-1:0] mcountinhibit;


always@(*)begin
    if(csr_rden)begin
        case(csr_rdindex)
		`YSYX210152_uro_cycle_index		:	csr_rddata = mcycle;
		`YSYX210152_uro_time_index			:	csr_rddata = mtime_copy;
		`YSYX210152_uro_instret_index		:	csr_rddata = minstret;
		`YSYX210152_srw_sstatus_index		:	csr_rddata = sstatus;
		`YSYX210152_srw_sie_index			:	csr_rddata = sie;
		`YSYX210152_srw_stvec_index		:	csr_rddata = stvec;
		`YSYX210152_srw_scounteren_index	:	csr_rddata = scounteren;
		`YSYX210152_srw_sscratch_index		:	csr_rddata = sscratch;
		`YSYX210152_srw_sepc_index			:	csr_rddata = sepc;
		`YSYX210152_srw_scause_index		:	csr_rddata = scause;
		`YSYX210152_srw_stval_index		:	csr_rddata = stval;
		`YSYX210152_srw_sip_index			:	csr_rddata = sip;
		`YSYX210152_srw_satp_index			:	csr_rddata = satp;
		`YSYX210152_mro_mvendorid_index	:	csr_rddata = mvendorid;
		`YSYX210152_mro_marchid_index		:	csr_rddata = marchid;
		`YSYX210152_mro_mimp_index			:	csr_rddata = mimpid;
		`YSYX210152_mro_mhardid_index		:	csr_rddata = mhartid;
		`YSYX210152_mro_misa_index			:	csr_rddata = misa;
		`YSYX210152_mrw_mstatus_index		:	csr_rddata = mstatus;
		`YSYX210152_mrw_medeleg_index		:	csr_rddata = medeleg;
		`YSYX210152_mrw_mideleg_index		:	csr_rddata = mideleg;
		`YSYX210152_mrw_mie_index			:	csr_rddata = mie;
		`YSYX210152_mrw_mtvec_index		:	csr_rddata = mtvec;
		`YSYX210152_mrw_mcounteren_index	:	csr_rddata = mcounteren;
		`YSYX210152_mrw_mscratch_index		:	csr_rddata = mscratch;
		`YSYX210152_mrw_mepc_index			:	csr_rddata = mepc;
		`YSYX210152_mrw_mcause_index		:	csr_rddata = mcause;
		`YSYX210152_mrw_mtval_index		:	csr_rddata = mtval;
		`YSYX210152_mrw_mip_index			:	csr_rddata = mip;
		`YSYX210152_mrw_mcycle_index		:	csr_rddata = mcycle;
		`YSYX210152_mrw_minstret_index		:	csr_rddata = minstret;
		`YSYX210152_mrw_mcountinhibit_index: csr_rddata = mcountinhibit;
			default				:	csr_rddata = 64'h0;
	    endcase
    end
    else begin
        csr_rddata = 'h0;          
    end
end
assign csr_tsr  = mstatus[22];
assign csr_tvm  = mstatus[20];
assign csr_mxr  = mstatus[19];
assign csr_sum  = mstatus[18];
assign csr_mpriv=mstatus[17];
assign csr_mpp  = mstatus[12:11];
assign csr_mige =mstatus[3];
assign csr_sige =mstatus[1];
assign csr_priv = privilege;
assign csr_mideleg=mideleg;
assign csr_medeleg=medeleg;
assign csr_mip  = mip;
assign csr_mie  = mie;

always@(*)begin
    if(CMT_mret)begin
        Global_Flush = 1'b1;
        Global_newPC = mepc;
    end
    else if(CMT_sret)begin
        Global_Flush = 1'b1;
        Global_newPC = sepc;
    end
    else if(CMT_trap_m)begin            
        if(CMT_trap_async)begin
            Global_Flush = 1'b1;
            Global_newPC = (mtvec[1:0]==2'h1) ? ({mtvec[63:2],2'b0} + {CMT_trap_cause[61:0],2'b00}) : {mtvec[63:2],2'b0};
        end
        else begin
            Global_Flush = 1'b1;
            Global_newPC = {mtvec[63:2],2'b0};
        end
    end
    else if(CMT_trap_s)begin            
        if(CMT_trap_async)begin         
            Global_Flush = 1'b1;
            Global_newPC = (stvec[1:0]==2'h1) ? ({stvec[63:2],2'b0} + {CMT_trap_cause[61:0],2'b00}) : {stvec[63:2],2'b0};
        end
        else begin
            Global_Flush = 1'b1;   
            Global_newPC = {stvec[63:2],2'b0};
        end
    end
    else if(CMT_system)begin         
        Global_Flush = 1'b1;
        Global_newPC = CMT_pc + 'd4;
    end
    else begin
        Global_Flush = 1'b0;
        Global_newPC = 'hx;
    end
end

ysyx_210152_TrapSetup           TrapSetup(
    .CLKi               (CLKi), 
    .ARSTi              (ARSTi),
    
    .mstatus            (mstatus), 
    .misa               (misa), 
    .mie                (mie), 
    .mcounteren         (mcounteren),
    .sstatus            (sstatus),       
    .sie                (sie), 
    .scounteren         (scounteren),
    .mtvec              (mtvec), 
    .stvec              (stvec), 
    .mideleg            (mideleg), 
    .medeleg            (medeleg),
    .privilege          (privilege),
    
    .csr_index          (CMT_csrindex),
    .csr_data           (CMT_data2),
    .csr_wren           (CMT_csren),
    
    .mret               (CMT_mret), 
    .sret               (CMT_sret),
    
    .trap_s             (CMT_trap_s), 
    .trap_m             (CMT_trap_m)
);


ysyx_210152_TrapHandle          TrapHandle(
    .CLKi               (CLKi), 
    .ARSTi              (ARSTi),        
    
    .Interrupt_MEI      (Interrupt_MEI), 
    .Interrupt_MSI      (Interrupt_MSI), 
    .Interrupt_MTI      (Interrupt_MTI),
    .Interrupt_SEI      (Interrupt_SEI),
    
    .mip                (mip), 
    .sip                (sip),
    .mscratch           (mscratch), 
    .mepc               (mepc), 
    .mcause             (mcause), 
    .mtval              (mtval),
    .sscratch           (sscratch), 
    .sepc               (sepc), 
    .scause             (scause), 
    .stval              (stval),
    
    .csr_index          (CMT_csrindex),
    .csr_data           (CMT_data2),
    .csr_wren           (CMT_csren),
    
    .trap_value         (CMT_trap_value), 
    .trap_cause         (CMT_trap_cause), 
    .trap_pc            (CMT_trap_pc),
    .trap_s             (CMT_trap_s), 
    .trap_m             (CMT_trap_m), 
    .trap_async         (CMT_trap_async)
);


ysyx_210152_Counter             Counter(
    .CLKi               (CLKi), 
    .ARSTi              (ARSTi),
    .wb_valid           (CMT_valid),
    
    .csr_index          (CMT_csrindex),
    .csr_data           (CMT_data2),
    .csr_wren           (CMT_csren),
    
    .mcycle             (mcycle), 
    .minstret           (minstret),
    .mcountinhibit      (mcountinhibit)
);

ysyx_210152_InformCSR
#(
    .HARTID             (HARTID)
)InformCSR(
    .CLKi               (CLKi), 
    .ARSTi              (ARSTi),        
    .mhartid            (mhartid), 
    .mvendorid          (mvendorid), 
    .marchid            (marchid), 
    .mimpid             (mimpid),
    .CSR_InhibitIcache  (csr_InhibitIcache),
    .CSR_InhibitDcache  (csr_InhibitDcache),
    .CSR_DCacheWT       (csr_DCacheWT),
    
    .csr_index          (CMT_csrindex),
    .csr_data           (CMT_data2),
    .csr_wren           (CMT_csren)
);
`ifdef DEBUG_FLAG

`endif
endmodule





module ysyx_210152_tagman_dm
#(
    parameter WAY_DEPTH=16
    ,INDEX_WID = ((WAY_DEPTH > 1) ? $clog2(WAY_DEPTH) : 1)
    ,TAG_WID=14
    ,WBACK_ENABLE=1'b0 
)
(
    input clk,
    input rst,
    input entry_read,   
    input entry_wthru,
    input entry_wback,
    input [TAG_WID-1:0]address_tag,
    input [INDEX_WID-1:0]address_index,	
    input dfence_en,
    input valid_clear, 
    

    input fill_finish, 
    input writeback_ok, 
    output line_miss,
    output replace_dirty, 
    output [TAG_WID-1:0]writeback_addr,
    output [INDEX_WID-1:0]writeback_index
    
    
);
integer i,j,k;
reg [WAY_DEPTH-1:0]TagValidRegArray;
reg [TAG_WID-1:0]TagMemArray[WAY_DEPTH-1:0];
wire [TAG_WID-1:0]AccessTag;
wire entry_hit;

assign AccessTag = TagMemArray[address_index];
assign line_miss = (entry_read|entry_wback|entry_wthru) & (entry_hit==0);
assign entry_hit = (AccessTag == address_tag) & TagValidRegArray[address_index];
always@(posedge clk or posedge rst)
begin
    if(rst)
        TagValidRegArray	<=	0;
    else
        if( valid_clear ) 
            TagValidRegArray<=	0;
        else if(fill_finish)
            TagValidRegArray[address_index]	<=	1'b1; 
        else
            TagValidRegArray<=TagValidRegArray;
end

always@(posedge clk or posedge rst)
    if(rst)
        for(k=0;k<WAY_DEPTH;k=k+1)
        TagMemArray[k]	<=	0;
    else if(fill_finish)
        TagMemArray[address_index]	<=	address_tag;
    else
        TagMemArray[address_index]	<=	TagMemArray[address_index];

generate if(WBACK_ENABLE) 
begin : WBACK_REGS
    reg [WAY_DEPTH-1:0]TagDirtyRegArray;
    wire [WAY_DEPTH-1:0]DirtyInfoForCmp;
    assign DirtyInfoForCmp=(TagDirtyRegArray & TagValidRegArray);
    always@(posedge clk or posedge rst)
    begin
        if(rst)
        for(i=0;i<WAY_DEPTH;i=i+1)
            TagDirtyRegArray[i]   <=  0;
        else if (writeback_ok) 
        begin
            TagDirtyRegArray[writeback_index]   <=  0;
        end
        else if(entry_wback&entry_hit) 
        begin
            TagDirtyRegArray[address_index]<=1'b1;
        end
    end
    
    reg [INDEX_WID-1:0]IndexDirtyEncode[WAY_DEPTH-1:0];
    always @(*) 
    begin
        IndexDirtyEncode[0]=0;
        for(j=1;j<WAY_DEPTH;j=j+1)
            IndexDirtyEncode[j]=set_encode_cell(IndexDirtyEncode[j-1],j,DirtyInfoForCmp[j]);
    end
    
    
    function [INDEX_WID-1:0]set_encode_cell;
        input [INDEX_WID-1:0]prev_set_num;
        input [INDEX_WID-1:0]cur_set_num;
        input cur_set_bit;
        begin
            set_encode_cell=(cur_set_bit)?cur_set_num:prev_set_num;
        end
    endfunction
    assign replace_dirty=(dfence_en)?(DirtyInfoForCmp!=0):DirtyInfoForCmp[address_index];
    assign writeback_index=(dfence_en)?IndexDirtyEncode[WAY_DEPTH-1]:address_index;
    assign writeback_addr=TagMemArray[writeback_index];
end
else
begin:WRITE_THROUGH
    assign replace_dirty=1'b0;
    assign writeback_index=0;
    assign writeback_addr=0;
end
endgenerate

endmodule







module ysyx_210152_pTDPRAM_ysyx
#
(
    parameter BANK_COEFF=3
)
(
    input [5:0]addr_A,
    input [BANK_COEFF-1:0]bank_A,
    input ce_A,
    input [15:0]wbsel_A,
    output opvalid_A,
    output [127:0]dato_A,
    input [127:0]dati_A,

    input [5:0]addr_B,
    input [BANK_COEFF-1:0]bank_B,
    input ce_B,
    input [15:0]wbsel_B,
    output opvalid_B,
    output [127:0]dato_B,
    input [127:0]dati_B,

    input clk,rst
);
    localparam BANK_NUM=(2**BANK_COEFF);
    reg PrevOp_A,PrevOp_B;
    reg ce_B_Prev;
    reg blocked;
    reg [BANK_COEFF-1:0]bank_A_Hold,bank_B_Hold;
    wire [127:0]RdPortBankDat[BANK_NUM-1:0];
    wire [127:0]wmask_A,wmask_B;
    wire [BANK_NUM-1:0]BankSel_A,BankSel_B;
    wire access_block;
    wire Write_A,Write_B;
    assign Write_A=(wbsel_A!=0);
    assign Write_B=(wbsel_B!=0);
    assign access_block = (bank_A == bank_B) & (ce_A & ce_B)|
                        (bank_A == bank_B_Hold) & (ce_A & ce_B_Prev);
    assign wmask_A= ~{
                    {8{wbsel_A[15]}},
                    {8{wbsel_A[14]}},
                    {8{wbsel_A[13]}},
                    {8{wbsel_A[12]}},
                    {8{wbsel_A[11]}},
                    {8{wbsel_A[10]}},
                    {8{wbsel_A[9]}},
                    {8{wbsel_A[8]}},
                    {8{wbsel_A[7]}},
                    {8{wbsel_A[6]}},
                    {8{wbsel_A[5]}},
                    {8{wbsel_A[4]}},
                    {8{wbsel_A[3]}},
                    {8{wbsel_A[2]}},
                    {8{wbsel_A[1]}},
                    {8{wbsel_A[0]}}
                };
    assign wmask_B= ~{
                    {8{wbsel_B[15]}},
                    {8{wbsel_B[14]}},
                    {8{wbsel_B[13]}},
                    {8{wbsel_B[12]}},
                    {8{wbsel_B[11]}},
                    {8{wbsel_B[10]}},
                    {8{wbsel_B[9]}},
                    {8{wbsel_B[8]}},
                    {8{wbsel_B[7]}},
                    {8{wbsel_B[6]}},
                    {8{wbsel_B[5]}},
                    {8{wbsel_B[4]}},
                    {8{wbsel_B[3]}},
                    {8{wbsel_B[2]}},
                    {8{wbsel_B[1]}},
                    {8{wbsel_B[0]}}
                };
    assign dato_A=RdPortBankDat[bank_A_Hold];
    assign dato_B=RdPortBankDat[bank_B_Hold];
    assign opvalid_A = (Write_A | (!PrevOp_A)) & (!access_block);
    assign opvalid_B = (Write_B | (!PrevOp_B));
    genvar i;
    generate
    for(i=0;i<BANK_NUM;i=i+1)
    begin : BANKSEL_GEN
        assign BankSel_A[i]=(bank_A == i) & ce_A;
        assign BankSel_B[i]=(bank_B == i) & ce_B;
    end

    for(i=0;i<BANK_NUM;i=i+1)
    begin:CACHE_RAM_GEN
        S011HD1P_X32Y2D128_BW CACHEMEM
        (
            .Q(RdPortBankDat[i]), 
            .CLK(clk), 
            .CEN(1'b0),
            .WEN((BankSel_B[i] & ce_B)?(!Write_B): !(Write_A & BankSel_A[i])), 
            .BWEN((BankSel_B[i] & ce_B)?(wmask_B):(wmask_A | {128{!BankSel_A[i]}})),
            .A((BankSel_B[i] & ce_B)?addr_B:addr_A), 
            .D((BankSel_B[i] & ce_B)?dati_B:dati_A)
        );    
    end
    endgenerate
    
    
    always @(posedge clk) 
    begin
        PrevOp_A<=Write_A | access_block; 
        PrevOp_B<=Write_B;
        blocked<=access_block;
        bank_A_Hold<=bank_A;
        bank_B_Hold<=bank_B;
        ce_B_Prev<=ce_B;
    end



endmodule




































module ysyx_210152_pDPRAM_ysyx
#
(
    parameter BANK_COEFF=3
)
(
    input [5:0]raddr,
    input [BANK_COEFF-1:0]rbank,
    input rdce,
    output [127:0]dato,
    output rvalid,
    input [5:0]waddr,
    input [BANK_COEFF-1:0]wbank,
    input [15:0]wbsel,
    input [127:0]dati,
    input clk,rst
);
    localparam BANK_NUM=(2**BANK_COEFF);
    wire [127:0]RdPortBankDat[BANK_NUM-1:0];
    wire [127:0]wmask;
    wire [BANK_NUM-1:0]RdBankSel,WrBankSel;
    wire rw_block;
    wire write;
    assign write=(wbsel!=0);
    reg rvalid_reg;
    reg [BANK_COEFF-1:0]rbank_sel;
    assign rvalid = rvalid_reg;
    assign wmask= ~{
                    {8{wbsel[15]}},
                    {8{wbsel[14]}},
                    {8{wbsel[13]}},
                    {8{wbsel[12]}},
                    {8{wbsel[11]}},
                    {8{wbsel[10]}},
                    {8{wbsel[9]}},
                    {8{wbsel[8]}},
                    {8{wbsel[7]}},
                    {8{wbsel[6]}},
                    {8{wbsel[5]}},
                    {8{wbsel[4]}},
                    {8{wbsel[3]}},
                    {8{wbsel[2]}},
                    {8{wbsel[1]}},
                    {8{wbsel[0]}}
                };
    assign rw_block=(rbank == wbank);
    assign dato=RdPortBankDat[rbank_sel];
    
    genvar i;
    generate
    for(i=0;i<BANK_NUM;i=i+1)
    begin : BANKSEL_GEN
        assign RdBankSel[i]=~((rbank == i) & rdce);
        assign WrBankSel[i]=~((wbank == i) & (wbsel != 0));
    end

    for(i=0;i<BANK_NUM;i=i+1)
    begin:CACHE_RAM_GEN
        S011HD1P_X32Y2D128_BW CACHEMEM
        (
            .Q(RdPortBankDat[i]), 
            .CLK(clk), 
            .CEN(1'b0), 
            .WEN(WrBankSel[i]), 
            .BWEN(wmask),
            .A((!WrBankSel[i])?waddr:raddr), 
            .D(dati)
        );    
    end
    endgenerate

    always@(posedge clk or posedge rst)
    if(rst)
        rvalid_reg<=0;
    else
        rvalid_reg<=rdce & (!(rw_block & write));
    always@(posedge clk)
        rbank_sel<=rbank;
endmodule






module ysyx_210152_L1_AQBuf
#(
    parameter L1IBUF=1'b1
)
(
    input  wire             GLB_CLKi,
    input  wire             GLB_RSTi,      
    input  wire             AQi_V,
    input  wire [7:0]       AQi_ID,
    input  wire [7:0]       AQi_CMD,
    input  wire [15:0]      AQi_BSEL,
    input  wire             AQi_CI,
    input  wire             AQi_WT,
    input  wire [127:0]     AQi_WDATA,
    input  wire [`YSYX210152_PADR-1:0] AQi_ADDR,
    output wire             AQi_FULLo,

    output wire             AQo_V,
    output wire [7:0]       AQo_ID,
    output wire [7:0]       AQo_CMD,
    output wire [15:0]      AQo_BSEL,
    output wire             AQo_CI,
    output wire             AQo_WT,
    output wire [127:0]     AQo_WDATA,
    output wire [`YSYX210152_PADR-1:0] AQo_ADDR,
    input  wire             AQo_FREE

);
localparam DATAWID=(L1IBUF)?(2+32+`YSYX210152_PADR):(2+32+128+`YSYX210152_PADR);
wire [DATAWID-1:0]rdata,wdata;
wire empty;
assign AQo_V=!empty;
generate 
    if(L1IBUF)
    begin : BUFFER_WITHOUT_WDATA
        assign wdata={AQi_ADDR,AQi_BSEL,AQi_CMD,AQi_ID,AQi_WT,AQi_CI};
        assign {AQo_ADDR,AQo_BSEL,AQo_CMD,AQo_ID,AQo_WT,AQo_CI}=rdata;
        assign AQo_WDATA=128'hx;
    end
    else 
    begin : BUFFER_WITH_WDATA
        assign wdata={AQi_WDATA,AQi_ADDR,AQi_BSEL,AQi_CMD,AQi_ID,AQi_WT,AQi_CI};
        assign {AQo_WDATA,AQo_ADDR,AQo_BSEL,AQo_CMD,AQo_ID,AQo_WT,AQo_CI}=rdata;
    end
endgenerate

ysyx_210152_SyncFIFO#(
    .DWID(DATAWID),
    .DDEPTH(4)
)AQBuf(
    .clk(GLB_CLKi),
    .rst(GLB_RSTi),
    .ren(AQo_FREE),
    .wen(AQi_V),
    .wdata(wdata),
    .rdata(rdata),
    .full(AQi_FULLo),
    .empty(empty)
);

endmodule








module ysyx_210152_FIB_BIU_L1I
#(parameter FIBID=8'h00)(
    
    input GLBi_CLK,
    input GLBi_ARST,
    
    output reg BIUo_WREN,
    output [7:0] BIUo_ID,
    output reg BIUo_REQ,
    output reg [7:0] BIUo_CMD,
    output reg [3:0] BIUo_BURST,
    output reg [3:0] BIUo_SIZE,
    output reg [`YSYX210152_PADR-1:0] BIUo_ADDR,
    output [`YSYX210152_XLEN-1:0] BIUo_DATA,
    
    input BIUi_FULL,
    input BIUi_ACK,
    input BIUi_V,
    input[7:0] BIUi_ID,
    input[7:0] BIUi_RPL,
    input[`YSYX210152_XLEN-1:0] BIUi_DATA,
    

    input single_read_req,	
    input seq_read_req,		
    input [3:0]seq_size,
    input [3:0]req_bsel,    
    input [`YSYX210152_PADR-1:0]bus_addr,		
    output [63:0]bus_rdata,
    output [15:0]addr_count,
    output data_valid,			
    output reg trans_error,
    output bus_trans_finish			
);
    localparam IDLE = 3'h0;
    localparam CMDO = 3'h1;
    localparam PNDR = 3'h2;
    localparam WAIT = 3'h5;
    reg [2:0]state;
    reg [15:0]datacnt;
    reg [2:0]state_next;
    reg [7:0]cmd_decode;

    wire recv_valid,tran_valid,broadcast_valid;
    wire bw_wen;
    wire [15:0]datcnt_valcmp;
    assign datcnt_valcmp=((17'h01 << BIUo_BURST)-1);
    assign recv_valid=(FIBID == BIUi_ID) & BIUi_V;
    assign broadcast_valid = (FIBID == 8'h00) & BIUi_V;
    assign tran_valid=BIUi_ACK & !(BIUi_FULL);
    assign BIUo_ID=FIBID;
    assign data_valid= (state==PNDR) & (recv_valid & (BIUi_RPL==`YSYX210152_FIB_RPL_TRDY | BIUi_RPL==`YSYX210152_FIB_RPL_SEQ));
    assign BIUo_DATA = 64'hx;
    assign bus_rdata= BIUi_DATA;
    assign bus_trans_finish=(state_next==WAIT);

    assign addr_count=datacnt;
    always@(*)
    begin
        casez({single_read_req,seq_read_req})
            2'b10:cmd_decode=`YSYX210152_FIB_CMD_SIGR;
            2'b01:cmd_decode=`YSYX210152_FIB_CMD_SEQR;
            2'b00:cmd_decode=`YSYX210152_FIB_CMD_NOOP;
            default: cmd_decode=`YSYX210152_FIB_CMD_NOOP;
        endcase
    end
    
    
    always @(posedge GLBi_CLK or posedge GLBi_ARST) 
    begin
        if (GLBi_ARST) 
        begin
            datacnt<=0;
            BIUo_REQ<=1'b0;
            BIUo_WREN<=1'b0;
        end
        else 
        begin
        case(state_next)
            IDLE:
            begin
                datacnt<=0;
                BIUo_REQ<=1'b0;
                BIUo_WREN<=1'b0;
            end
            CMDO:
            begin
                if(state == IDLE)
                begin
                    BIUo_CMD<=cmd_decode;
                    BIUo_BURST<=seq_size;
                    BIUo_SIZE<=req_bsel;
                    BIUo_ADDR<=bus_addr;
                end
                else
                begin
                    BIUo_CMD<=BIUo_CMD;
                    BIUo_BURST<=BIUo_BURST;
                    BIUo_SIZE<=BIUo_SIZE;
                    BIUo_ADDR<=BIUo_ADDR;
                end
                BIUo_REQ<=1'b1;
                BIUo_WREN<=1'b1;
            end
            PNDR:
            begin
                BIUo_REQ<=1'b0;
                datacnt<=datacnt+
                   {15'h0,(recv_valid & (BIUi_RPL==`YSYX210152_FIB_RPL_TRDY | BIUi_RPL==`YSYX210152_FIB_RPL_SEQ))};
                BIUo_WREN<=1'b0;
            end
            WAIT:
            begin
                datacnt<=0;
                BIUo_REQ<=1'b0;
                BIUo_WREN<=1'b0;
            end
            default:
            begin
                datacnt<=0;
                BIUo_REQ<=1'b0;
                
                BIUo_WREN<=1'b0;
            end
        endcase
        end
    end

    always@(*)
    begin
        trans_error=1'b0;
        case(state)
            IDLE:
                if(cmd_decode!=`YSYX210152_FIB_CMD_NOOP) 
                    state_next=CMDO;
                else 
                    state_next=IDLE;
            CMDO:
                if(BIUi_FULL | !BIUi_ACK)
                    state_next=CMDO;
                else state_next=PNDR;
            PNDR:
                if(recv_valid & BIUi_RPL==`YSYX210152_FIB_RPL_IDLE)
                    state_next=CMDO;
                else if((recv_valid & (BIUi_RPL==`YSYX210152_FIB_RPL_TRDY | BIUi_RPL==`YSYX210152_FIB_RPL_TERR)) & 
                        (datacnt >= datcnt_valcmp))
                        begin
                            state_next=WAIT;
                            if( BIUi_RPL==`YSYX210152_FIB_RPL_TERR)trans_error=1'b1;
                        end
                else state_next=PNDR; 
            WAIT:
                if(single_read_req | seq_read_req)
                    state_next=WAIT;
                else 
                    state_next=IDLE;
            default: 
                state_next=IDLE;
        endcase
    end

    always @(posedge GLBi_CLK or posedge GLBi_ARST) begin
        if (GLBi_ARST)
            state <= IDLE;
        else
            state <= state_next;
    end

endmodule








module ysyx_210152_FIB_BIU_L1D
#(parameter FIBID=8'h00,SEQ_CNT_WID=3)(
    
    input GLBi_CLK,
    input GLBi_ARST,
    
    output     BIUo_WREN,
    output [7:0] BIUo_ID,
    output reg BIUo_REQ,
    output reg [7:0] BIUo_CMD,
    output reg [3:0] BIUo_BURST,
    output reg [3:0] BIUo_SIZE,
    output reg [`YSYX210152_PADR-1:0] BIUo_ADDR,
    output [`YSYX210152_XLEN-1:0] BIUo_DATA,
    
    input BIUi_FULL,
    input BIUi_ACK,
    input BIUi_V,
    input[7:0] BIUi_ID,
    input[7:0] BIUi_RPL,
    input[`YSYX210152_XLEN-1:0] BIUi_DATA,
    

    input single_write_req,	
    input seq_write_req,	
    input single_read_req,	
    input seq_read_req,		
    input amo_req,
    input [7:0]amo_cmd,
    input [3:0]seq_size,
    input [3:0]req_bsel,    
    input [`YSYX210152_PADR-1:0]bus_addr,		
    input [63:0]bus_wdata,
    output [63:0]bus_rdata,
    output [SEQ_CNT_WID-1:0]addr_count,
    output data_valid,			
    output reg trans_error,
    output bus_trans_finish			
);
    localparam IDLE = 3'h0;
    localparam CMDO = 3'h1;
    localparam PNDR = 3'h2;
    localparam PNDW = 3'h3;
    localparam RETW = 3'h4;
    localparam WAIT = 3'h5;
    reg [2:0]state;
    reg [SEQ_CNT_WID-1:0]datacnt;
    reg [2:0]state_next;
    reg [7:0]cmd_decode;

    wire recv_valid,tran_valid,broadcast_valid;
    wire bw_wen;
    wire [SEQ_CNT_WID-1:0]datcnt_valcmp;
    assign datcnt_valcmp=(({{SEQ_CNT_WID-2{1'h0}},1'b1} << BIUo_BURST)-1);
    assign recv_valid=(FIBID == BIUi_ID) & BIUi_V;
    assign broadcast_valid = (FIBID == 8'h00) & BIUi_V;
    assign tran_valid=BIUi_ACK & !(BIUi_FULL);
    assign BIUo_ID=FIBID;
    assign data_valid= (state==PNDR) & (recv_valid & (BIUi_RPL==`YSYX210152_FIB_RPL_TRDY | BIUi_RPL==`YSYX210152_FIB_RPL_SEQ));
    assign BIUo_DATA = bus_wdata;
    assign bus_rdata= BIUi_DATA;
    assign bus_trans_finish=(state_next==WAIT);

    assign addr_count=datacnt;
    always@(*)
    begin
        casez({amo_req,single_write_req,seq_write_req,single_read_req,seq_read_req})
            5'b1????:cmd_decode=amo_cmd;
            5'b01000:cmd_decode=`YSYX210152_FIB_CMD_SIGW;
            5'b00100:cmd_decode=`YSYX210152_FIB_CMD_SEQW;
            5'b00010:cmd_decode=`YSYX210152_FIB_CMD_SIGR;
            5'b00001:cmd_decode=`YSYX210152_FIB_CMD_SEQR;
            5'b00000:cmd_decode=`YSYX210152_FIB_CMD_NOOP;
            default: cmd_decode=`YSYX210152_FIB_CMD_NOOP;
        endcase
    end

always @(posedge GLBi_CLK or posedge GLBi_ARST) 
begin
    if (GLBi_ARST) 
        BIUo_REQ<=1'b0;
    else 
    case(state_next)
        IDLE:
            BIUo_REQ<=1'b0;
        CMDO:
            BIUo_REQ<=1'b1;
        PNDR:
            BIUo_REQ<=1'b0;
        PNDW:
            BIUo_REQ<=1'b1;
        RETW:
            BIUo_REQ<=1'b0;
        WAIT:
            BIUo_REQ<=1'b0;
        default:
            BIUo_REQ<=1'b0;
    endcase
end
assign BIUo_WREN=BIUo_REQ;

always @(posedge GLBi_CLK or posedge GLBi_ARST) 
begin
    if (GLBi_ARST) 
        datacnt<=0;
    else 
    case(state_next)
        IDLE:
            datacnt<=0;
        CMDO:
            datacnt<=0;
        PNDR:
            datacnt<=datacnt+
                {{SEQ_CNT_WID-2{1'h0}},(recv_valid & (BIUi_RPL==`YSYX210152_FIB_RPL_TRDY | BIUi_RPL==`YSYX210152_FIB_RPL_SEQ))};
        PNDW:
            datacnt<=datacnt+{{SEQ_CNT_WID-2{1'h0}},tran_valid};
        RETW:
            datacnt<=0;
        WAIT:
            datacnt<=0;
        default:
            datacnt<=0;
    endcase
end

always @(posedge GLBi_CLK) 
case(state_next)
    IDLE:
    begin
        BIUo_CMD<=cmd_decode;
        BIUo_BURST<=seq_size;
        BIUo_SIZE<=req_bsel;
        BIUo_ADDR<=bus_addr;
    end
    CMDO:
    begin
        BIUo_CMD<=cmd_decode;
        BIUo_BURST<=seq_size;
        BIUo_SIZE<=req_bsel;
        BIUo_ADDR<=bus_addr;
    end
    PNDR:
    begin
        BIUo_CMD<=BIUo_CMD;
        BIUo_BURST<=BIUo_BURST;
        BIUo_SIZE<=BIUo_SIZE;
        BIUo_ADDR<=BIUo_ADDR;
    end
    PNDW:
    begin
        BIUo_BURST<=BIUo_BURST;
        BIUo_SIZE<=BIUo_SIZE;
        BIUo_ADDR<=BIUo_ADDR;
        if(datacnt == (datcnt_valcmp - 1))BIUo_CMD<=`YSYX210152_FIB_CMD_SEQE;
        else BIUo_CMD<=BIUo_CMD;
    end
    default:
    begin
        BIUo_CMD<=0;
        BIUo_BURST<=0;
        BIUo_SIZE<=0;
        BIUo_ADDR<=0;
    end
endcase


always@(*)
begin
    trans_error=1'b0;
    case(state)
        IDLE:
            if(cmd_decode!=`YSYX210152_FIB_CMD_NOOP) 
                state_next=CMDO;
            else 
                state_next=IDLE;
        CMDO:
            if(BIUi_FULL | !BIUi_ACK)
                state_next=CMDO;
            else if(single_write_req)
                state_next=RETW;
            else if(seq_write_req)
                state_next=PNDW;
            else state_next=PNDR;
        PNDR:
            if(recv_valid & BIUi_RPL==`YSYX210152_FIB_RPL_IDLE)
                state_next=CMDO;
            else if((recv_valid & (BIUi_RPL==`YSYX210152_FIB_RPL_TRDY | BIUi_RPL==`YSYX210152_FIB_RPL_TERR)) & 
                    (datacnt >= datcnt_valcmp))
                    begin
                        state_next=WAIT;
                        if( BIUi_RPL==`YSYX210152_FIB_RPL_TERR)trans_error=1'b1;
                    end
            else state_next=PNDR; 
        PNDW:
            if(datacnt == datcnt_valcmp)
                state_next=RETW;
            else state_next=PNDW;    
        RETW:
            if(recv_valid & BIUi_RPL==`YSYX210152_FIB_RPL_IDLE )
                begin
                    state_next=CMDO;
                    trans_error=1'b1;
                end
            else if(recv_valid & (BIUi_RPL==`YSYX210152_FIB_RPL_TRDY| BIUi_RPL==`YSYX210152_FIB_RPL_TERR))
                begin
                    state_next=WAIT;
                    if( BIUi_RPL==`YSYX210152_FIB_RPL_TERR)trans_error=1'b1;
                end
            else 
                state_next=RETW; 
        WAIT:
            if(single_write_req | seq_write_req | single_read_req | seq_read_req)
                state_next=WAIT;
            else 
                state_next=IDLE;
        default: 
            state_next=IDLE;
    endcase
end

always @(posedge GLBi_CLK or posedge GLBi_ARST) 
begin
    if (GLBi_ARST)
        state <= IDLE;
    else
        state <= state_next;
end

endmodule






/*****************************************************************************************
 *    author  : Jack's Team
 *    engineer: Xingyu PAN Xiaoyu HONG
 *    e-mail  : 
 *    date    : 20210904
 *    desc    : PRV564 Main Pipeline (Kernel)
 *    version : 0010(RV64.Mext is avilible now)
 
Family 	: PRV5
Module 	: 564 Top module
Arch    : Vostok
ISA		: RISC-V 64bit Extension U,S,I,M,A

 __  __                   __           __         
/\ \/\ \                 /\ \__       /\ \        
\ \ \ \ \    ___     ____\ \ ,_\   ___\ \ \/'\    
 \ \ \ \ \  / __`\  /',__\\ \ \/  / __`\ \ , <    
  \ \ \_/ \/\ \L\ \/\__, `\\ \ \_/\ \L\ \ \ \\`\  
   \ `\___/\ \____/\/\____/ \ \__\ \____/\ \_\ \_\
    `\/__/  \/___/  \/___/   \/__/\/___/  \/_/\/_/


    This is a 64bit RISC-V processor

   "I see Earth! It is so beautiful!"
                        —— Yuri Gagarin

**********************************************************************************************/
module ysyx_210152_PRV564_Kernel
#(
    parameter HARTID = 'h0,
    ITLB_FIBID=8'h04,
    DTLB_FIBID=8'h05
)
(
    input wire                  Kernel_CLKi,
    input wire                  Kernel_ARSTi,

    output  wire              ITLB_FIBo_WREN,        
    output  wire              ITLB_FIBo_REQ,         
    input   wire              ITLB_FIBi_ACK,         
    input   wire              ITLB_FIBi_FULL,        
    output  wire [7:0]        ITLB_FIBo_ID,
    output  wire [7:0]        ITLB_FIBo_CMD,
    output  wire [3:0]        ITLB_FIBo_BURST,
    output  wire [3:0]        ITLB_FIBo_SIZE,
    output  wire [`YSYX210152_XLEN-1:0]  ITLB_FIBo_ADDR,      
    output  wire [`YSYX210152_XLEN-1:0]  ITLB_FIBo_DATA,
    input   wire [7:0]        ITLB_FIBi_ID,
    input   wire [7:0]        ITLB_FIBi_RPL,
    input   wire              ITLB_FIBi_V,
    input   wire [`YSYX210152_XLEN-1:0]  ITLB_FIBi_DATA,
    
    output  wire              DTLB_FIBo_WREN,        
    output  wire              DTLB_FIBo_REQ,         
    input   wire              DTLB_FIBi_ACK,         
    input   wire              DTLB_FIBi_FULL,        
    output  wire [7:0]        DTLB_FIBo_ID,
    output  wire [7:0]        DTLB_FIBo_CMD,
    output  wire [3:0]        DTLB_FIBo_BURST,
    output  wire [3:0]        DTLB_FIBo_SIZE,
    output  wire [`YSYX210152_XLEN-1:0]  DTLB_FIBo_ADDR,      
    output  wire [`YSYX210152_XLEN-1:0]  DTLB_FIBo_DATA,
    input   wire [7:0]        DTLB_FIBi_ID,
    input   wire [7:0]        DTLB_FIBi_RPL,
    input   wire              DTLB_FIBi_V,
    input   wire [`YSYX210152_XLEN-1:0]  DTLB_FIBi_DATA,

    output wire                 ICache_AQ_V,      DCache_AQ_V,
    output wire [7:0]           ICache_AQ_ID,     DCache_AQ_ID,
    output wire [7:0]           ICache_AQ_CMD,    DCache_AQ_CMD,
    output wire                 ICache_AQ_CI,     DCache_AQ_CI,
    output wire                 ICache_AQ_WT,     DCache_AQ_WT,
    output wire [15:0]          ICache_AQ_BSEL,   DCache_AQ_BSEL,
    output wire [127:0]                           DCache_AQ_WDATA,
    output wire [`YSYX210152_XLEN-1:0]     ICache_AQ_ADDR,   DCache_AQ_ADDR,
    input wire                  ICache_AQ_FULL,   DCache_AQ_FULL,
    input wire                  ICache_RQ_V,      DCache_RQ_V,
    input wire [7:0]            ICache_RQ_ID,     DCache_RQ_ID,
    input wire                  ICache_RQ_WRERR,  DCache_RQ_WRERR,
    input wire                  ICache_RQ_RDERR,  DCache_RQ_RDERR,
    input wire                  ICache_RQ_RDY,    DCache_RQ_RDY,
    input wire [127:0]          ICache_RQ_RDATA,  DCache_RQ_RDATA,
    output wire                 ICache_RQ_ACK,    DCache_RQ_ACK,


    input wire                  Kernel_MTIi,        
    input wire                  Kernel_MSIi,        
    input wire                  Kernel_MEIi,        
    input wire                  Kernel_SEIi,        
    input wire                  Kernel_NMIPLi,      
    input wire                  Kernel_NMIEEi,      
    input wire                  Kernel_NMIGi,       

    input wire [63:0]           Kernel_MTIMEi	    
`ifdef DEBUG_FLAG

    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
	
	
	
	

	
	
	
	
`endif
);
    wire                Global_Flush,   Branch_Flush;       
    wire [`YSYX210152_XLEN-1:0]    Global_newPC,   Branch_newPC;       
    wire                Global_fence,   Global_fencei,  Global_fencevma;
    
    wire                BTB_wren,   BTB_wr_predicatebit;
    wire [`YSYX210152_XLEN-1:0]    BTB_wrPC,   BTB_wr_predicatePC;
    
    wire                CSR_tsr,    CSR_tvm,    CSR_sum,    CSR_mpriv,  CSR_mxr;
    wire [1:0]          CSR_priv,   CSR_mpp;
	wire                CSR_mige,   CSR_sige;              
    wire [`YSYX210152_XLEN-1:0]    CSR_mideleg,CSR_medeleg,CSR_mie,    CSR_mip;
    wire [43:0]         CSR_satpppn;
    wire [3:0]          CSR_satpmode;
    wire                CSR_en;
    wire [11:0]         CSR_index;
    wire [`YSYX210152_XLEN-1:0]    CSR_data;
    wire                CSR_InhibitDcache, CSR_InhibitIcache, CSR_DCacheWT;
    
    
    wire [4:0]          RS1_index,  RS2_index;
    wire [`YSYX210152_XLEN-1:0]    RS1_data,   RS2_data;               
    reg  [`YSYX210152_XLEN-1:0]    Read_DS1,   Read_DS2;               
    
    wire                PIP_IDUi_MSC_valid,     PIP_IDUi_MSC_InstAccFlt,    PIP_IDUi_MSC_InstAddrMis,   PIP_IDUi_MSC_InstPageFlt;
    wire [`YSYX210152_XLEN-1:0]    PIP_IDUi_DATA_instr,    PIP_IDUi_INFO_pc,   PIP_IDUi_INFO_predictedPC;
    wire [1:0]          PIP_IDUi_INFO_priv;
    wire                PIP_IFi_FC_ready,       IFi_ModifyPermit;
    
    wire                PIP_ALUi_MSC_valid;
    wire [7:0]          PIP_ALUi_Opcode;
    wire [1:0]          PIP_ALUi_OpInfo;
    wire [`YSYX210152_XLEN-1:0]    PIP_ALUi_DATA_ds1;
    wire [`YSYX210152_XLEN-1:0]    PIP_ALUi_DATA_ds2;
    wire [`YSYX210152_XLEN-1:0]    PIP_ALUi_INFO_pc;
    wire [1:0]          PIP_ALUi_INFO_priv;
    wire [7:0]          PIP_ALUi_INFO_itag;
    wire                PIP_ALUo_FC_ready;
    
    wire           		PIP_ALUo_MSC_valid;
    wire [`YSYX210152_XLEN-1:0]    PIP_ALUo_DATA_data1;
    wire [`YSYX210152_XLEN-1:0]    PIP_ALUo_DATA_data2;
    wire [`YSYX210152_XLEN-1:0]    PIP_ALUo_INFO_pc;
    wire [1:0]          PIP_ALUo_INFO_priv;
    wire [7:0]          PIP_ALUo_INFO_itag;
    wire                PIP_ALUi_FC_ready;
    
    wire                PIP_Mcopi_MSC_valid;
    wire [1:0]          PIP_Mcopi_OPInfo;
    wire [7:0]          PIP_Mcopi_Opcode;
    wire [`YSYX210152_XLEN-1:0]    PIP_Mcopi_DATA_ds1;
    wire [`YSYX210152_XLEN-1:0]    PIP_Mcopi_DATA_ds2;
    wire [`YSYX210152_XLEN-1:0]    PIP_Mcopi_INFO_pc;
    wire [1:0]          PIP_Mcopi_INFO_priv;
    wire [7:0]          PIP_Mcopi_INFO_ITAG;
    wire                PIP_Mcopo_FC_ready;
    
    wire           		PIP_Mcopo_MSC_valid;
    wire [`YSYX210152_XLEN-1:0]    PIP_Mcopo_DATA_data1;
    wire [`YSYX210152_XLEN-1:0]    PIP_Mcopo_INFO_pc;
    wire [1:0]          PIP_Mcopo_INFO_priv;
    wire [7:0]          PIP_Mcopo_INFO_itag;
    wire                PIP_Mcopi_FC_ready;
    
    wire                PIP_LSUi_MSC_valid;
    wire [7:0]          PIP_LSUi_Opcode;
    wire [3:0]          PIP_LSUi_OpSize;
    wire [1:0]          PIP_LSUi_OpInfo;
    wire [`YSYX210152_XLEN-1:0]    PIP_LSUi_DATA_ds1;
    wire [`YSYX210152_XLEN-1:0]    PIP_LSUi_DATA_ds2;
    wire                PIP_LSUi_INFO_unpage;
    wire [`YSYX210152_XLEN-1:0]    PIP_LSUi_INFO_pc;
    wire [1:0]          PIP_LSUi_INFO_priv;
    wire [7:0]          PIP_LSUi_INFO_itag;
    wire                PIP_LSUo_FC_ready;
    
    wire           		PIP_LSUo_MSC_valid;
    wire           		PIP_LSUo_MSC_LoadPageFlt ;
    wire           		PIP_LSUo_MSC_LoadAccFlt  ;
    wire           		PIP_LSUo_MSC_LoadAddrMis ;
    wire           		PIP_LSUo_MSC_StorePageFlt;
    wire           		PIP_LSUo_MSC_StoreAccFlt ;
    wire           		PIP_LSUo_MSC_StoreAddrMis;
    wire [`YSYX210152_XLEN-1:0]    PIP_LSUo_DATA_data1;
    wire [`YSYX210152_XLEN-1:0]    PIP_LSUo_DATA_data2;
    wire                PIP_LSUo_INFO_ci;
    wire [`YSYX210152_XLEN-1:0]    PIP_LSUo_INFO_pc;
    wire [1:0]          PIP_LSUo_INFO_priv;
    wire [7:0]          PIP_LSUo_INFO_itag;
    wire                PIP_LSUi_FC_ready;
    
    wire                CMT_valid;
    wire                CMT_GPRwen;                         
    wire [`YSYX210152_XLEN-1:0]    CMT_pc,    CMT_data1,  CMT_data2;   
    wire [4:0]          CMT_GPRwindex;
    wire [11:0]         CMT_csrindex;
    wire                CMT_csren;
    wire [1:0]          CMT_priv;
    wire                CMT_ci;
    wire [`YSYX210152_XLEN-1:0]    CMT_trap_value, CMT_trap_cause, CMT_trap_pc;
    wire                CMT_trap_s,     CMT_trap_m,     CMT_trap_async;
    wire                CMT_mret,       CMT_sret;
    wire                CMT_system;



    wire            DITFi_Checken;          
    wire [4:0]      DITFi_CheckRs1Index;    
    wire            DITFi_CheckRs1en;       
    wire [4:0]      DITFi_CheckRs2Index;    
    wire            DITFi_CheckRs2en;       
    wire [11:0]     DITFi_CheckCSRIndex;    
    wire            DITFi_CheckCSRen;       
    wire            DITFo_DepdcFind;        

    wire            DITFi_write,        DITFi_remove;           
    wire            DITFo_write_ready;                          
    wire [7:0]      DITFi_itag,         DITFo_itag;             
    wire [4:0]      DITFi_rs1index;
    wire            DITFi_rs1en;
    wire [4:0]      DITFi_rs2index;
    wire            DITFi_rs2en;
    wire [4:0]      DITFi_rdindex,      DITFo_rdindex;
    wire            DITFi_rden,         DITFo_rden;
    wire [11:0]     DITFi_csrindex,     DITFo_csrindex;
    wire            DITFi_csren,        DITFo_csren;
    wire            DITFi_jmp,          DITFo_jmp;              
    wire            DITFi_InsAccessFlt, DITFo_InsAccessFlt;
    wire            DITFi_InsPageFlt,   DITFo_InsPageFlt;
    wire            DITFi_InsAddrMis,   DITFo_InsAddrMis;
    wire            DITFi_illins,       DITFo_illins;           
    wire            DITFi_mret,         DITFo_mret;             
    wire            DITFi_sret,         DITFo_sret;             
    wire            DITFi_ecall,        DITFo_ecall;            
    wire            DITFi_fence,        DITFo_fence;
    wire            DITFi_fencei,       DITFo_fencei;
    wire            DITFi_fencevma,     DITFo_fencevma;
    wire            DITFi_ebreak,       DITFo_ebreak;           
    wire            DITFi_system,       DITFo_system;           
    wire                                DITFo_v;

`ifdef DEBUG_FLAG
    reg [63:0] InstrPC;
    reg [63:0] exceptionPC;
    reg [63:0] intrNO;
    reg [63:0] cause;
    
    wire [(32*`YSYX210152_XLEN)-1:0]IntRegState;
    reg CommitValid;
    reg        skip;
    reg        isRVC;
    reg        scFailed;
    reg        wen;
    reg [ 7:0] wdest;
    reg [63:0] wdata;

    
    wire [ 1:0] priviledgeMode;
    wire [63:0] mstatus;
    wire [63:0] sstatus;
    wire [63:0] mepc;
    wire [63:0] sepc;
    wire [63:0] mtval;
    wire [63:0] stval;
    wire [63:0] mtvec;
    wire [63:0] stvec;
    wire [63:0] mcause;
    wire [63:0] scause;
    wire [63:0] satp;
    wire [63:0] mip;
    wire [63:0] mie;
    wire [63:0] mscratch;
    wire [63:0] sscratch;
    wire [63:0] mideleg;
    wire [63:0] medeleg;
    
    reg [ 1:0] r_priviledgeMode;
    reg [63:0] r_mstatus;
    reg [63:0] r_sstatus;
    reg [63:0] r_mepc;
    reg [63:0] r_sepc;
    reg [63:0] r_mtval;
    reg [63:0] r_stval;
    reg [63:0] r_mtvec;
    reg [63:0] r_stvec;
    reg [63:0] r_mcause;
    reg [63:0] r_scause;
    reg [63:0] r_satp;
    reg [63:0] r_mip;
    reg [63:0] r_mie;
    reg [63:0] r_mscratch;
    reg [63:0] r_sscratch;
    reg [63:0] r_mideleg;
    reg [63:0] r_medeleg;
    

    
    wire [63:0] trap_pc;
    wire trap_valid;
    wire [7:0]trap_code;
    wire [63:0] cycleCnt;
    wire [63:0] instrCnt;
`endif

ysyx_210152_InstrFront #(.ITLB_FIBID(ITLB_FIBID)) InstrFront(
    .IFi_CLK                      (Kernel_CLKi),
    .IFi_ARST                     (Kernel_ARSTi),
    .IFi_GFlush                   (Global_Flush),
    .IFi_GPC                      (Global_newPC),
    .IFi_BFlush                   (Branch_Flush),
    .IFi_BPC                      (Branch_newPC),
    .IFi_fencei                   (Global_fencei),
    .IFi_fencevma                 (Global_fencevma),
    
    .BTB_wr_req                   (BTB_wren),
    .BTB_wr_PC                    (BTB_wrPC),
    .BTB_wr_predicted_PC          (BTB_wr_predicatePC),
    .BTB_wr_predicted_state_bit   (BTB_wr_predicatebit),
    
    .CSR_satpppn                  (CSR_satpppn),
    .CSR_satpmode                 (CSR_satpmode),
    .CSR_priv                     (CSR_priv),
    .CSR_mxr                      (CSR_mxr),
    .CSR_sum                      (CSR_sum),
    .CSR_InhibitIcache            (CSR_InhibitIcache),
    
    .PIP_IFo_MSC_valid            (PIP_IDUi_MSC_valid),
    .PIP_IFo_DATA_instr           (PIP_IDUi_DATA_instr),
    .PIP_IFo_INFO_pc              (PIP_IDUi_INFO_pc),
    .PIP_IFo_INFO_predictedPC     (PIP_IDUi_INFO_predictedPC),
    .PIP_IFo_INFO_priv            (PIP_IDUi_INFO_priv),
    .PIP_IFo_MSC_InstPageFlt      (PIP_IDUi_MSC_InstPageFlt),
    .PIP_IFo_MSC_InstAccFle       (PIP_IDUi_MSC_InstAccFlt),
    .PIP_IFo_MSC_InstAddrMis      (PIP_IDUi_MSC_InstAddrMis),
    .PIP_IFi_FC_ready             (PIP_IFi_FC_ready),
    
    .ITLB_FIBo_WREN                (ITLB_FIBo_WREN),
    .ITLB_FIBo_REQ                 (ITLB_FIBo_REQ),
    .ITLB_FIBi_ACK                 (ITLB_FIBi_ACK),
    .ITLB_FIBi_FULL                (ITLB_FIBi_FULL),
    .ITLB_FIBo_ID                  (ITLB_FIBo_ID),
    .ITLB_FIBo_CMD                 (ITLB_FIBo_CMD),
    .ITLB_FIBo_BURST               (ITLB_FIBo_BURST),
    .ITLB_FIBo_SIZE                (ITLB_FIBo_SIZE),
    .ITLB_FIBo_ADDR                (ITLB_FIBo_ADDR),
    .ITLB_FIBo_DATA                (ITLB_FIBo_DATA),
    .ITLB_FIBi_ID                  (ITLB_FIBi_ID),
    .ITLB_FIBi_RPL                 (ITLB_FIBi_RPL),
    .ITLB_FIBi_V                   (ITLB_FIBi_V),
    .ITLB_FIBi_DATA                (ITLB_FIBi_DATA),
    
    .IFo_AQ_V                      (ICache_AQ_V),
    .IFo_AQ_ID                     (ICache_AQ_ID),
    .IFo_AQ_CMD                    (ICache_AQ_CMD),
    .IFo_AQ_CI                     (ICache_AQ_CI),
    .IFo_AQ_WT                     (ICache_AQ_WT),
    .IFo_AQ_BSEL                   (ICache_AQ_BSEL),
    .IFo_AQ_WDATA                  (),                        
    .IFo_AQ_ADDR                   (ICache_AQ_ADDR),
    .IFi_AQ_FULL                   (ICache_AQ_FULL),
    .IFi_RQ_V                      (ICache_RQ_V),
    .IFi_RQ_ID                     (ICache_RQ_ID),
    .IFi_RQ_WRERR                  (ICache_RQ_WRERR),
    .IFi_RQ_RDERR                  (ICache_RQ_RDERR),
    .IFi_RQ_RDY                    (ICache_RQ_RDY),
    .IFi_RQ_RDATA                  (ICache_RQ_RDATA),
    .IFo_RQ_ACK                    (ICache_RQ_ACK)
);


ysyx_210152_IDU                             IDU(
    .IDUi_CLK                      (Kernel_CLKi),
    .IDUi_ARST                     (Kernel_ARSTi),
    
    .IDUi_Flush                    (Global_Flush),
    
    .IDUi_CSR_tvm                  (CSR_tvm),
    .IDUi_CSR_tsr                  (CSR_tsr),
    .IDUi_CSR_mpriv                (CSR_mpriv),
    .IDUi_CSR_mpp                  (CSR_mpp),
    .IDUi_CSR_data                 (CSR_data),
    .IDUo_CSR_index                (CSR_index),
    .IDUo_CSR_en                   (CSR_en),
    .IDUo_GPR_rs1index             (RS1_index),
    .IDUo_GPR_rs1en                (),                  
    .IDUi_GPR_rs1data              (Read_DS1),
    .IDUo_GPR_rs2index             (RS2_index),
    .IDUo_GPR_rs2en                (),
    .IDUi_GPR_rs2data              (Read_DS2),
    
    .IDUo_Checken                  (DITFi_Checken),
    .IDUo_CheckRs1en               (DITFi_CheckRs1en),
    .IDUo_CheckRs1Index            (DITFi_CheckRs1Index),
    .IDUo_CheckRs2en               (DITFi_CheckRs2en),
    .IDUo_CheckRs2Index            (DITFi_CheckRs2Index),
    .IDUo_CheckCSRIndex            (DITFi_CheckCSRIndex),
    .IDUo_CheckCSRen               (DITFi_CheckCSRen),
    .IDUi_DepdcFind                (DITFo_DepdcFind),
    
    .IDUo_DITF_write               (DITFi_write),
    .IDUo_DITF_itag                (DITFi_itag),
    .IDUo_DITF_rs1index            (DITFi_rs1index),
    .IDUo_DITF_rs1en               (DITFi_rs1en),
    .IDUo_DITF_rs2index            (DITFi_rs2index),
    .IDUo_DITF_rs2en               (DITFi_rs2en),
    .IDUo_DITF_rdindex             (DITFi_rdindex),
    .IDUo_DITF_rden                (DITFi_rden),
    .IDUo_DITF_csrindex            (DITFi_csrindex),
    .IDUo_DITF_csren               (DITFi_csren),
    .IDUo_DITF_jmp                 (DITFi_jmp),
    .IDUo_DITF_InsAccessFlt        (DITFi_InsAccessFlt),
    .IDUo_DITF_InsPageFlt          (DITFi_InsPageFlt),
    .IDUo_DITF_InsAddrMis          (DITFi_InsAddrMis),
    .IDUo_DITF_illins              (DITFi_illins),
    .IDUo_DITF_mret                (DITFi_mret),
    .IDUo_DITF_sret                (DITFi_sret),
    .IDUo_DITF_ecall               (DITFi_ecall),
    .IDUo_DITF_ebreak              (DITFi_ebreak),
    .IDUo_DITF_fence               (DITFi_fence),
    .IDUo_DITF_fencei              (DITFi_fencei),
    .IDUo_DITF_fencevma            (DITFi_fencevma),
    .IDUo_DITF_system              (DITFi_system),
    .IDUi_DITF_write_ready         (DITFo_write_ready),     
    
    .IDUo_BFlush                   (Branch_Flush),
    .IDUo_BPC                      (Branch_newPC),
    
    .IDUo_BTB_wrPC                 (BTB_wrPC),
    .IDUo_BTB_wren                 (BTB_wren),
    .IDUo_BTB_wr_predicatebit      (BTB_wr_predicatebit),
    .IDUo_BTB_wr_predicatePC       (BTB_wr_predicatePC),
    
    .PIP_IDUi_MSC_valid            (PIP_IDUi_MSC_valid),
    .PIP_IDUi_DATA_instr           (PIP_IDUi_DATA_instr),
    .PIP_IDUi_INFO_pc              (PIP_IDUi_INFO_pc),
    .PIP_IDUi_INFO_predictedPC     (PIP_IDUi_INFO_predictedPC),
    .PIP_IDUi_INFO_priv            (PIP_IDUi_INFO_priv),
    .PIP_IDUi_MSC_InstPageFlt      (PIP_IDUi_MSC_InstPageFlt),
    .PIP_IDUi_MSC_InstAddrMis      (PIP_IDUi_MSC_InstAddrMis),
    .PIP_IDUi_MSC_InstAccFlt       (PIP_IDUi_MSC_InstAccFlt),
    .PIP_IDUo_FC_ready             (PIP_IFi_FC_ready),
    
    .PIP_ALUi_MSC_valid            (PIP_ALUi_MSC_valid),
    .PIP_ALUi_INFO_pc              (PIP_ALUi_INFO_pc),
    .PIP_ALUi_INFO_priv            (PIP_ALUi_INFO_priv),
    .PIP_ALUi_INFO_ITAG            (PIP_ALUi_INFO_itag),
    .PIP_ALUi_Opcode               (PIP_ALUi_Opcode),
    .PIP_ALUi_OpSize               (),                  
    .PIP_ALUi_OPInfo               (PIP_ALUi_OpInfo),
    .PIP_ALUi_DATA_ds1             (PIP_ALUi_DATA_ds1),
    .PIP_ALUi_DATA_ds2             (PIP_ALUi_DATA_ds2),
    .PIP_ALUo_FC_ready             (PIP_ALUo_FC_ready),
    
    .PIP_LSUi_MSC_valid            (PIP_LSUi_MSC_valid),
    .PIP_LSUi_INFO_pc              (PIP_LSUi_INFO_pc),
    .PIP_LSUi_INFO_priv            (PIP_LSUi_INFO_priv),
    .PIP_LSUi_INFO_ITAG            (PIP_LSUi_INFO_itag),
    .PIP_LSUi_INFO_unpage          (PIP_LSUi_INFO_unpage),
    .PIP_LSUi_Opcode               (PIP_LSUi_Opcode),
    .PIP_LSUi_OpSize               (PIP_LSUi_OpSize),
    .PIP_LSUi_OPInfo               (PIP_LSUi_OpInfo),
    .PIP_LSUi_DATA_ds1             (PIP_LSUi_DATA_ds1),
    .PIP_LSUi_DATA_ds2             (PIP_LSUi_DATA_ds2),
    .PIP_LSUo_FC_ready             (PIP_LSUo_FC_ready),
    
    .PIP_Mcopi_MSC_valid           (PIP_Mcopi_MSC_valid),
    .PIP_Mcopi_INFO_pc             (PIP_Mcopi_INFO_pc),
    .PIP_Mcopi_INFO_priv           (PIP_Mcopi_INFO_priv),
    .PIP_Mcopi_INFO_ITAG           (PIP_Mcopi_INFO_ITAG),
    .PIP_Mcopi_Opcode              (PIP_Mcopi_Opcode),
    .PIP_Mcopi_OpSize              (),                          
    .PIP_Mcopi_OPInfo              (PIP_Mcopi_OPInfo),
    .PIP_Mcopi_DATA_ds1            (PIP_Mcopi_DATA_ds1),
    .PIP_Mcopi_DATA_ds2            (PIP_Mcopi_DATA_ds2),
    .PIP_Mcopo_FC_ready            (PIP_Mcopo_FC_ready)
    

    

);

always@(*)begin
    if(RS1_index == 5'b0)begin
        Read_DS1 = 64'h0;
    end
    else if(CMT_GPRwen & (CMT_GPRwindex == RS1_index))begin     
        Read_DS1 = CMT_data1;
    end
    else begin
        Read_DS1 = RS1_data;
    end

    if(RS2_index == 5'b0)begin
        Read_DS2 = 64'h0;
    end
    else if(CMT_GPRwen & (CMT_GPRwindex == RS2_index))begin
        Read_DS2 = CMT_data1;
    end
    else begin
        Read_DS2 = RS2_data;
    end
end

ysyx_210152_RegFile       Regfile(
	.clk                    (Kernel_CLKi),
	.wr_en                  (CMT_GPRwen),
	.rd0_addr               (CMT_GPRwindex),
	.rs1_addr               (RS1_index),
	.rs2_addr               (RS2_index),
	.rd0_data               (CMT_data1),
	.rs1_data               (RS1_data),
	.rs2_data               (RS2_data)
    `ifdef DEBUG_FLAG
        ,.snapshot              (IntRegState)     
    `endif
) ;

ysyx_210152_DITF                    DITF0(
    .DITFi_CLK                (Kernel_CLKi),
    .DITFi_ARST               (Kernel_ARSTi),
    .DITFi_SRST               (Global_Flush),
    
    .DITFi_Checken            (DITFi_Checken),
    .DITFi_CheckRs1Index      (DITFi_CheckRs1Index),
    .DITFi_CheckRs1en         (DITFi_CheckRs1en),
    .DITFi_CheckRs2Index      (DITFi_CheckRs2Index),
    .DITFi_CheckRs2en         (DITFi_CheckRs2en),
    .DITFi_CheckCSRIndex      (DITFi_CheckCSRIndex),
    .DITFi_CheckCSRen         (DITFi_CheckCSRen),
    .DITFo_DepdcFind          (DITFo_DepdcFind),
    
    .DITFo_write_ready        (DITFo_write_ready),
    .DITFi_write              (DITFi_write),
    .DITFi_itag               (DITFi_itag),
    .DITFi_rs1index           (DITFi_rs1index),
    .DITFi_rs1en              (DITFi_rs1en),
    .DITFi_rs2index           (DITFi_rs2index),
    .DITFi_rs2en              (DITFi_rs2en),
    .DITFi_rdindex            (DITFi_rdindex),
    .DITFi_rden               (DITFi_rden),
    .DITFi_csrindex           (DITFi_csrindex),
    .DITFi_csren              (DITFi_csren),
    .DITFi_jmp                (DITFi_jmp),
    .DITFi_InsAccessFlt       (DITFi_InsAccessFlt),
    .DITFi_InsPageFlt         (DITFi_InsPageFlt),
    .DITFi_InsAddrMis         (DITFi_InsAddrMis),
    .DITFi_illins             (DITFi_illins),
    .DITFi_mret               (DITFi_mret),
    .DITFi_sret               (DITFi_sret),
    .DITFi_ecall              (DITFi_ecall),
    .DITFi_ebreak             (DITFi_ebreak),
    .DITFi_fence              (DITFi_fence),
    .DITFi_fencei             (DITFi_fencei),
    .DITFi_fencevma           (DITFi_fencevma),
    .DITFi_system             (DITFi_system),
    .DITFi_remove             (DITFi_remove),
    
    .DITFo_v                  (DITFo_v),
    .DITFo_itag               (DITFo_itag),
    .DITFo_rs1index           (),
    .DITFo_rs1en              (),
    .DITFo_rs2index           (),
    .DITFo_rs2en              (),
    .DITFo_rdindex            (DITFo_rdindex),
    .DITFo_rden               (DITFo_rden),
    .DITFo_csrindex           (DITFo_csrindex),
    .DITFo_csren              (DITFo_csren),
    .DITFo_jmp                (DITFo_jmp),
    .DITFo_InsAccessFlt       (DITFo_InsAccessFlt),
    .DITFo_InsPageFlt         (DITFo_InsPageFlt),
    .DITFo_InsAddrMis         (DITFo_InsAddrMis),
    .DITFo_illins             (DITFo_illins),
    .DITFo_mret               (DITFo_mret),
    .DITFo_sret               (DITFo_sret),
    .DITFo_ecall              (DITFo_ecall),
    .DITFo_ebreak             (DITFo_ebreak),
    .DITFo_fence              (DITFo_fence),
    .DITFo_fencei             (DITFo_fencei),
    .DITFo_fencevma           (DITFo_fencevma),
    .DITFo_system             (DITFo_system)
);

ysyx_210152_ALU                     ALU(
    .ALUi_CLK                 (Kernel_CLKi),
    .ALUi_ARST                (Kernel_ARSTi),
    .ALUi_Flush               (Global_Flush),
    
    .PIP_ALUi_MSC_valid       (PIP_ALUi_MSC_valid),
    .PIP_ALUi_Opcode          (PIP_ALUi_Opcode),
    .PIP_ALUi_OpInfo          (PIP_ALUi_OpInfo),
    .PIP_ALUi_INFO_itag       (PIP_ALUi_INFO_itag),
    .PIP_ALUi_INFO_priv       (PIP_ALUi_INFO_priv),
    .PIP_ALUi_INFO_PC         (PIP_ALUi_INFO_pc),
    .PIP_ALUi_DATA_ds1        (PIP_ALUi_DATA_ds1),
    .PIP_ALUi_DATA_ds2        (PIP_ALUi_DATA_ds2),
    .PIP_ALUo_FC_ready        (PIP_ALUo_FC_ready),
    
    .PIP_ALUo_MSC_valid       (PIP_ALUo_MSC_valid),
    .PIP_ALUo_INFO_itag       (PIP_ALUo_INFO_itag),
    .PIP_ALUo_INFO_pc         (PIP_ALUo_INFO_pc),
    .PIP_ALUo_INFO_priv       (PIP_ALUo_INFO_priv),
    .PIP_ALUo_DATA_data1      (PIP_ALUo_DATA_data1),
    .PIP_ALUo_DATA_data2      (PIP_ALUo_DATA_data2),
    .PIP_ALUi_FC_ready        (PIP_ALUi_FC_ready)
);

ysyx_210152_md_wrapper              Mcop(

    .clk                      (Kernel_CLKi),
    .arst                     (Kernel_ARSTi),
    .flush                    (Global_Flush),

    .i_valid                  (PIP_Mcopi_MSC_valid),
    .i_opcode                 (PIP_Mcopi_Opcode),
    .i_opinfo                 (PIP_Mcopi_OPInfo),
    .i_data1                  (PIP_Mcopi_DATA_ds1),
    .i_data2                  (PIP_Mcopi_DATA_ds2),
    .i_tag                    (PIP_Mcopi_INFO_ITAG),
    .i_priv                   (PIP_Mcopi_INFO_priv),
    .i_pc                     (PIP_Mcopi_INFO_pc),
    .i_ready                  (PIP_Mcopo_FC_ready),

    .d_result                 (PIP_Mcopo_DATA_data1),
    .d_valid                  (PIP_Mcopo_MSC_valid),
    .d_tag                    (PIP_Mcopo_INFO_itag),
    .d_priv                   (PIP_Mcopo_INFO_priv),
    .d_pc                     (PIP_Mcopo_INFO_pc),
    .d_ready                  (PIP_Mcopi_FC_ready)
);

ysyx_210152_LSU #(.DTLB_FIBID(DTLB_FIBID)) LSU
(
    .LSUi_CLK                     (Kernel_CLKi),
    .LSUi_ARST                    (Kernel_ARSTi),
    .LSUi_ModifyPermit            (DITFo_v),
    .LSUi_ModifyPermitID          (DITFo_itag),
    .LSUi_Flush                   (Global_Flush),
    .LSUi_fence                   (Global_fence),
    .LSUi_fencevma                (Global_fencevma),
    .CSR_satpppn                  (CSR_satpppn),
    .CSR_satpmode                 (CSR_satpmode),
    .CSR_priv                     (CSR_priv),
    .CSR_mxr                      (CSR_mxr),
    .CSR_sum                      (CSR_sum),
    .CSR_InhibitDcache            (CSR_InhibitDcache),
    .CSR_DCacheWT                 (CSR_DCacheWT),
    .PIP_LSUi_MSC_valid           (PIP_LSUi_MSC_valid),         
    .PIP_LSUi_Opcode              (PIP_LSUi_Opcode),            
    .PIP_LSUi_OpInfo              (PIP_LSUi_OpInfo),            
    .PIP_LSUi_OpSize              (PIP_LSUi_OpSize), 
    .PIP_LSUi_INFO_itag           (PIP_LSUi_INFO_itag),
    .PIP_LSUi_INFO_priv           (PIP_LSUi_INFO_priv),         
    .PIP_LSUi_INFO_pc             (PIP_LSUi_INFO_pc),           
    .PIP_LSUi_INFO_unpage         (PIP_LSUi_INFO_unpage),
    .PIP_LSUi_DATA_ds1            (PIP_LSUi_DATA_ds1),
    .PIP_LSUi_DATA_ds2            (PIP_LSUi_DATA_ds2),
    .PIP_LSUo_FC_ready            (PIP_LSUo_FC_ready),

    .PIP_LSUo_MSC_valid           (PIP_LSUo_MSC_valid),
    .PIP_LSUo_MSC_LoadPageFlt     (PIP_LSUo_MSC_LoadPageFlt),
    .PIP_LSUo_MSC_LoadAccFlt      (PIP_LSUo_MSC_LoadAccFlt),
    .PIP_LSUo_MSC_LoadAddrMis     (PIP_LSUo_MSC_LoadAddrMis),
    .PIP_LSUo_MSC_StorePageFlt    (PIP_LSUo_MSC_StorePageFlt),
    .PIP_LSUo_MSC_StoreAccFlt     (PIP_LSUo_MSC_StoreAccFlt),
    .PIP_LSUo_MSC_StoreAddrMis    (PIP_LSUo_MSC_StoreAddrMis),
    .PIP_LSUo_INFO_ci             (PIP_LSUo_INFO_ci),
    .PIP_LSUo_INFO_itag           (PIP_LSUo_INFO_itag),
    .PIP_LSUo_INFO_pc             (PIP_LSUo_INFO_pc),
    .PIP_LSUo_INFO_priv           (PIP_LSUo_INFO_priv),
    .PIP_LSUo_DATA_data1          (PIP_LSUo_DATA_data1),        
    .PIP_LSUo_DATA_data2          (PIP_LSUo_DATA_data2),
    .PIP_LSUi_FC_ready            (PIP_LSUi_FC_ready),

    .DTLB_FIBo_WREN               (DTLB_FIBo_WREN),        
    .DTLB_FIBo_REQ                (DTLB_FIBo_REQ),         
    .DTLB_FIBi_ACK                (DTLB_FIBi_ACK),         
    .DTLB_FIBi_FULL               (DTLB_FIBi_FULL),        
    .DTLB_FIBo_ID                 (DTLB_FIBo_ID),
    .DTLB_FIBo_CMD                (DTLB_FIBo_CMD),
    .DTLB_FIBo_BURST              (DTLB_FIBo_BURST),
    .DTLB_FIBo_SIZE               (DTLB_FIBo_SIZE),
    .DTLB_FIBo_ADDR               (DTLB_FIBo_ADDR),      
    .DTLB_FIBo_DATA               (DTLB_FIBo_DATA),
    .DTLB_FIBi_ID                 (DTLB_FIBi_ID),
    .DTLB_FIBi_RPL                (DTLB_FIBi_RPL),
    .DTLB_FIBi_V                  (DTLB_FIBi_V),
    .DTLB_FIBi_DATA               (DTLB_FIBi_DATA),

    .LSUo_AQ_V                    (DCache_AQ_V),
    .LSUo_AQ_ID                   (DCache_AQ_ID),
    .LSUo_AQ_CMD                  (DCache_AQ_CMD),
    .LSUo_AQ_CI                   (DCache_AQ_CI),
    .LSUo_AQ_WT                   (DCache_AQ_WT),
    .LSUo_AQ_BSEL                 (DCache_AQ_BSEL),
    .LSUo_AQ_WDATA                (DCache_AQ_WDATA),
    .LSUo_AQ_ADDR                 (DCache_AQ_ADDR),
    .LSUi_AQ_FULL                 (DCache_AQ_FULL),
    .LSUi_RQ_V                    (DCache_RQ_V),
    .LSUi_RQ_ID                   (DCache_RQ_ID),
    .LSUi_RQ_WRERR                (DCache_RQ_WRERR),
    .LSUi_RQ_RDERR                (DCache_RQ_RDERR),
    .LSUi_RQ_RDY                  (DCache_RQ_RDY),
    .LSUi_RQ_RDATA                (DCache_RQ_RDATA),
    .LSUo_RQ_ACK                  (DCache_RQ_ACK)
);


ysyx_210152_commit                  commit(
    .Global_CLK                  (Kernel_CLKi),
    .Global_ARST                 (Kernel_ARSTi),
    .Global_Flush                (Global_Flush),
    
    .CSR_mideleg                 (CSR_mideleg),
    .CSR_medeleg                 (CSR_medeleg),
    .CSR_mige                    (CSR_mige),
    .CSR_sige                    (CSR_sige),
    .CSR_mip                     (CSR_mip),
    .CSR_mie                     (CSR_mie),
    .NMI_EccErr                  (Kernel_NMIEEi),
    .NMI_PwrLost                 (Kernel_NMIPLi),
    .NMI_generic                 (Kernel_NMIGi),
    
    .PIP0i_MSC_valid             (PIP_ALUo_MSC_valid),
    .PIP0i_MSC_LoadPageFlt       (1'b0),
    .PIP0i_MSC_LoadAccFlt        (1'b0),
    .PIP0i_MSC_LoadAddrMis       (1'b0),
    .PIP0i_MSC_StorePageFlt      (1'b0),
    .PIP0i_MSC_StoreAccFlt       (1'b0),
    .PIP0i_MSC_StoreAddrMis      (1'b0),
    .PIP0i_INFO_ci               (1'b0),
    .PIP0i_INFO_itag             (PIP_ALUo_INFO_itag),
    .PIP0i_INFO_pc               (PIP_ALUo_INFO_pc),
    .PIP0i_INFO_priv             (PIP_ALUo_INFO_priv),
    .PIP0i_DATA_data1            (PIP_ALUo_DATA_data1),
    .PIP0i_DATA_data2            (PIP_ALUo_DATA_data2),
    .PIP0o_FC_ready              (PIP_ALUi_FC_ready),
    
    .PIP1i_MSC_valid             (PIP_LSUo_MSC_valid),
    .PIP1i_MSC_LoadPageFlt       (PIP_LSUo_MSC_LoadPageFlt),
    .PIP1i_MSC_LoadAccFlt        (PIP_LSUo_MSC_LoadAccFlt),
    .PIP1i_MSC_LoadAddrMis       (PIP_LSUo_MSC_LoadAddrMis),
    .PIP1i_MSC_StorePageFlt      (PIP_LSUo_MSC_StorePageFlt),
    .PIP1i_MSC_StoreAccFlt       (PIP_LSUo_MSC_StoreAccFlt),
    .PIP1i_MSC_StoreAddrMis      (PIP_LSUo_MSC_StoreAddrMis),
    .PIP1i_INFO_ci               (PIP_LSUo_INFO_ci),
    .PIP1i_INFO_itag             (PIP_LSUo_INFO_itag),
    .PIP1i_INFO_pc               (PIP_LSUo_INFO_pc),
    .PIP1i_INFO_priv             (PIP_LSUo_INFO_priv),
    .PIP1i_DATA_data1            (PIP_LSUo_DATA_data1),
    .PIP1i_DATA_data2            (PIP_LSUo_DATA_data2),
    .PIP1o_FC_ready              (PIP_LSUi_FC_ready),
    
    .PIP2i_MSC_valid             (PIP_Mcopo_MSC_valid),
    .PIP2i_MSC_LoadPageFlt       (1'b0),
    .PIP2i_MSC_LoadAccFlt        (1'b0),
    .PIP2i_MSC_LoadAddrMis       (1'b0),
    .PIP2i_MSC_StorePageFlt      (1'b0),
    .PIP2i_MSC_StoreAccFlt       (1'b0),
    .PIP2i_MSC_StoreAddrMis      (1'b0),
    .PIP2i_INFO_ci               (1'b0),
    .PIP2i_INFO_itag             (PIP_Mcopo_INFO_itag),
    .PIP2i_INFO_pc               (PIP_Mcopo_INFO_pc),
    .PIP2i_INFO_priv             (PIP_Mcopo_INFO_priv),
    .PIP2i_DATA_data1            (PIP_Mcopo_DATA_data1),
    .PIP2i_DATA_data2            (64'h0),                        
    .PIP2o_FC_ready              (PIP_Mcopi_FC_ready),
    
    .DITFo_v                     (DITFo_v),
    .DITFo_itag                  (DITFo_itag),
    .DITFo_rdindex               (DITFo_rdindex),
    .DITFo_rden                  (DITFo_rden),
    .DITFo_csrindex              (DITFo_csrindex),
    .DITFo_csren                 (DITFo_csren),
    .DITFo_jmp                   (DITFo_jmp),
    .DITFo_InsAccessFlt          (DITFo_InsAccessFlt),
    .DITFo_InsPageFlt            (DITFo_InsPageFlt),
    .DITFo_InsAddrMis            (DITFo_InsAddrMis),
    .DITFo_illins                (DITFo_illins),
    .DITFo_mret                  (DITFo_mret),
    .DITFo_sret                  (DITFo_sret),
    .DITFo_ecall                 (DITFo_ecall),
    .DITFo_ebreak                (DITFo_ebreak),
    .DITFo_fence                 (DITFo_fence),
    .DITFo_fencei                (DITFo_fencei),
    .DITFo_fencevma              (DITFo_fencevma),
    .DITFo_system                (DITFo_system),
    .DITFi_remove                (DITFi_remove),
    
    .CMT_valid                   (CMT_valid),
    .CMT_GPRwen                  (CMT_GPRwen),
    .CMT_GPRwindex               (CMT_GPRwindex),
    .CMT_data1                   (CMT_data1),
    .CMT_data2                   (CMT_data2),
    .CMT_csren                   (CMT_csren),
    .CMT_csrindex                (CMT_csrindex),
    .CMT_pc                      (CMT_pc),

`ifdef DEBUG_FLAG

	.CMT_priv                    (CMT_priv),                    
    .CMT_ci                      (CMT_ci),                      

`endif
    
    .CMT_trap_value              (CMT_trap_value), 
    .CMT_trap_cause              (CMT_trap_cause),
    .CMT_trap_pc                 (CMT_trap_pc),
    .CMT_trap_s                  (CMT_trap_s),
    .CMT_trap_m                  (CMT_trap_m),
    .CMT_trap_async              (CMT_trap_async),
    .CMT_mret                    (CMT_mret),
    .CMT_sret                    (CMT_sret),
    .CMT_fence                   (Global_fence),
    .CMT_fencei                  (Global_fencei),
    .CMT_fencevma                (Global_fencevma),
    .CMT_system                  (CMT_system)
);



ysyx_210152_CSR_top
    #(.HARTID                   (HARTID))
CSR_top(
    .CLKi                       (Kernel_CLKi), 
    .ARSTi                      (Kernel_ARSTi),
    
    .mtime                      (Kernel_MTIMEi),                                          
    .Interrupt_MEI              (Kernel_MEIi), 
    .Interrupt_MSI              (Kernel_MSIi), 
    .Interrupt_MTI              (Kernel_MTIi),    
    .Interrupt_SEI              (Kernel_SEIi),
    
    .Global_Flush               (Global_Flush),
    .Global_newPC               (Global_newPC),
    
    .csr_rden                   (CSR_en),
    .csr_rdindex                (CSR_index),
    .csr_rddata                 (CSR_data),
    .csr_tsr                    (CSR_tsr),
    .csr_tvm                    (CSR_tvm),
    .csr_sum                    (CSR_sum),
    .csr_mpriv                  (CSR_mpriv),
    .csr_mxr                    (CSR_mxr),
    .csr_priv                   (CSR_priv),
    .csr_mpp                    (CSR_mpp),
    .csr_mige                   (CSR_mige),
    .csr_sige                   (CSR_sige),
    .csr_mideleg                (CSR_mideleg),
    .csr_medeleg                (CSR_medeleg),
    .csr_mip                    (CSR_mip),
    .csr_mie                    (CSR_mie),
    .csr_satpppn                (CSR_satpppn),
    .csr_satpmode               (CSR_satpmode),
    .csr_InhibitIcache          (CSR_InhibitIcache),
    .csr_InhibitDcache          (CSR_InhibitDcache),
    .csr_DCacheWT               (CSR_DCacheWT),
    
    
    .CMT_valid                   (CMT_valid),
    .CMT_data2                   (CMT_data2),
    .CMT_csren                   (CMT_csren),
    .CMT_csrindex                (CMT_csrindex),
    .CMT_pc                      (CMT_pc),
    .CMT_mret                    (CMT_mret),
    .CMT_sret                    (CMT_sret),
	.CMT_system                  (CMT_system),
    .CMT_trap_value              (CMT_trap_value), 
    .CMT_trap_cause              (CMT_trap_cause),
    .CMT_trap_pc                 (CMT_trap_pc),
    .CMT_trap_s                  (CMT_trap_s),
    .CMT_trap_m                  (CMT_trap_m),
    .CMT_trap_async              (CMT_trap_async)
    
`ifdef DEBUG_FLAG
    ,
    .privilege                 (priviledgeMode),
    .mstatus                    (mstatus),
    .sstatus                    (sstatus),
    .mepc                       (mepc),
    .sepc                       (sepc),
    .mtval                      (mtval),
    .stval                      (stval),
    .mtvec                      (mtvec),
    .stvec                      (stvec),
    .mcause                     (mcause),
    .scause                     (scause),
    .satp                       (satp),
    .mip                        (mip),
    .mie                        (mie),
    .mscratch                   (mscratch),
    .sscratch                   (sscratch),
    .mideleg                    (mideleg),
    .medeleg                    (medeleg),
    
    
    
    .mcycle                     (cycleCnt),
    .minstret                   (instrCnt)
`endif
);
`ifdef DEBUG_FLAG
    reg [63:0] r_intrNO;
    reg [63:0] r_exceptionPC;
    reg        r_async;
    assign trap_valid   = CMT_csren & (CMT_csrindex==`YSYX210152_urw_halt_index);
    assign trap_pc      = PIP_IDUi_INFO_pc;
    assign trap_code    = IntRegState[647:640];

    always @(posedge Kernel_CLKi) 
    begin
        InstrPC     <=CMT_pc;
        wen         <=CMT_GPRwen;
        wdest       <=CMT_GPRwindex;
        wdata       <=CMT_data1;
        /********************************************************
        非常草生的东西来了：
        Arch Event送进去的东西必须要延1拍
        *********************************************************/

        if(CMT_trap_async)begin                     
            r_intrNO    <= CMT_trap_cause;
            r_exceptionPC<= CMT_trap_pc;
            r_async     <= 1'b1;
        end
        else begin
            r_async     <= 1'b0;
            r_intrNO    <= 64'h0;
        end
        r_priviledgeMode    <= priviledgeMode;
        r_mstatus           <= mstatus;
        r_sstatus           <= sstatus;
        r_mepc              <= mepc;
        r_sepc              <= sepc;
        r_mtval             <= mtval;
        r_stval             <= stval;
        r_mtvec             <= mtvec;
        r_stvec             <= stvec;
        r_mcause            <= mcause;
        r_scause            <= scause;
        r_satp              <= satp;
        r_mip               <= mip;
        r_mie               <= mie;
        r_mscratch          <= mscratch;
        r_sscratch          <= sscratch;
        r_mideleg           <= mideleg;
        r_medeleg           <= medeleg;

        intrNO      <= r_intrNO;
        exceptionPC <= r_exceptionPC;
        CommitValid <= CMT_valid;
        
        skip        <=(CMT_csren & ((CMT_csrindex==`YSYX210152_urw_print_index))) | CMT_ci;
        isRVC       <=1'b0;
        scFailed    <=1'b0;
        if(CMT_csren & (CMT_csrindex==`YSYX210152_urw_print_index))begin
            $write("%C",CMT_data2);
        end
    end
`endif

`ifdef STUCK_AUTO_STOP
reg [`YSYX210152_XLEN-1:0] dummy_cycle_cnt;
always@(posedge Kernel_CLKi)begin
    if(CMT_valid & `YSYX210152_DEBUG_RUN)begin
        
    end
    else begin
        if(dummy_cycle_cnt>5000)begin
            
            
            
            
            
            
            
        end
    end
    if(CMT_valid)begin
        if(CMT_trap_m)begin
            
        end
        else if(CMT_trap_s)begin
            
        end
    end

    if(CMT_valid)begin
        dummy_cycle_cnt <= 0;
    end
    else begin
        dummy_cycle_cnt <= dummy_cycle_cnt + 1;
    end
end
`endif
`ifdef DEBUG_FLAG

    wire [63:0]IntReg[31:0];
    genvar i;
    generate for(i=0;i<32;i=i+1) 
    begin : IntRegGen

        assign IntReg[i]=IntRegState[(64*(i+1))-1:64*i];
    end
    endgenerate
    
DifftestInstrCommit Instr_Commit
(
    .clock                  (Kernel_CLKi),
    .coreid                 (8'h00),
    .index                  (8'h00),
    .valid                  (CommitValid),
    .pc                     (InstrPC),
    .instr                  (InstrCommit),
    .skip                   (skip),
    .isRVC                  (isRVC),
    .scFailed               (scFailed),
    .wen                    (wen),
    .wdest                  (wdest),
    .wdata                  (wdata)
);
DifftestArchIntRegState IntRegCommit(
    .clock(Kernel_CLKi),
    .coreid(8'h00),
    .gpr_0(IntReg[0]),
    .gpr_1(IntReg[1]),
    .gpr_2(IntReg[2]),
    .gpr_3(IntReg[3]),
    .gpr_4(IntReg[4]),
    .gpr_5(IntReg[5]),
    .gpr_6(IntReg[6]),
    .gpr_7(IntReg[7]),
    .gpr_8(IntReg[8]),
    .gpr_9(IntReg[9]),
    .gpr_10(IntReg[10]),
    .gpr_11(IntReg[11]),
    .gpr_12(IntReg[12]),
    .gpr_13(IntReg[13]),
    .gpr_14(IntReg[14]),
    .gpr_15(IntReg[15]),
    .gpr_16(IntReg[16]),
    .gpr_17(IntReg[17]),
    .gpr_18(IntReg[18]),
    .gpr_19(IntReg[19]),
    .gpr_20(IntReg[20]),
    .gpr_21(IntReg[21]),
    .gpr_22(IntReg[22]),
    .gpr_23(IntReg[23]),
    .gpr_24(IntReg[24]),
    .gpr_25(IntReg[25]),
    .gpr_26(IntReg[26]),
    .gpr_27(IntReg[27]),
    .gpr_28(IntReg[28]),
    .gpr_29(IntReg[29]),
    .gpr_30(IntReg[30]),
    .gpr_31(IntReg[31])
);

DifftestCSRState CSRCommit(
    .clock                  (Kernel_CLKi),
    .coreid                 (8'h00),
    .priviledgeMode         (r_async ? r_priviledgeMode : priviledgeMode),
    .mstatus                (r_async ? r_mstatus : mstatus),
    .sstatus                (r_async ? r_sstatus : sstatus),
    .mepc                   (r_async ? r_mepc : mepc),
    .sepc                   (r_async ? r_sepc : sepc),
    .mtval                  (r_async ? r_mtval : mtval),
    .stval                  (r_async ? r_stval : stval),
    .mtvec                  (r_async ? r_mtvec : mtvec),
    .stvec                  (r_async ? r_stvec : stvec),
    .mcause                 (r_async ? r_mcause : mcause),
    .scause                 (r_async ? r_scause : scause),
    .satp                   (r_async ? r_satp : satp),
    .mip                    (64'h0),                
    .mie                    (r_async ? r_mie : mie),
    .mscratch               (r_async ? r_mscratch : mscratch),
    .sscratch               (r_async ? r_sscratch : sscratch),
    .mideleg                (r_async ? r_mideleg : mideleg),
    .medeleg                (r_async ? r_medeleg : medeleg)
);
DifftestArchEvent ArchEventCommit(
    .clock                  (Kernel_CLKi),
    .coreid                 (8'h00),
    .intrNO                 (intrNO),               
    .cause                  (cause),                
    .exceptionPC            (exceptionPC)
);
DifftestTrapEvent TrapEventCommit(
    .clock(Kernel_CLKi),
    .coreid(8'h00),
    .valid(trap_valid),
    .code(trap_code),
    .pc(trap_pc),
    .cycleCnt(cycleCnt),
    .instrCnt(instrCnt)
);
wire [63:0] InstrBuf;
assign InstrBuf=ram_read_helper(1'b1, InstrPC);
assign InstrCommit=(InstrPC[3])?InstrBuf[63:32]:InstrBuf[31:0];
`endif

endmodule





/*********************************************************************************
    L1 cache unit for PRV5xx processor
    
    
    
    
    
*********************************************************************************/





module ysyx_210152_L1I
#(
    parameter   SRAM_BANKCOEFF=2,
                SRAM_BANKNUM=2**SRAM_BANKCOEFF,
                CACHE_DEPTH=SRAM_BANKNUM*64,
                WAY_NUM=2,
                INDEX_DEPTH=CACHE_DEPTH/WAY_NUM/4,
                CACHE_FIBID=8'h01
)
(
    input  wire             GLB_CLKi,
    input  wire             GLB_RSTi,                      
    
    input  wire             AQ_V,
    input  wire [7:0]       AQ_ID,
    input  wire [7:0]       AQ_CMD,
    input  wire [15:0]      AQ_BSEL,
    input  wire             AQ_CI,
    input  wire             AQ_WT,
    input  wire [127:0]     AQ_WDATA,
    input  wire [`YSYX210152_PADR-1:0] AQ_ADDR,
    output wire             AQ_FULL,
    
    output reg              RQ_V,
    output reg  [7:0]       RQ_ID,
    output wire             RQ_WRERR,
    output wire             RQ_RDERR,
    output wire             RQ_RDY,
    output wire [127:0]     RQ_RDATA,
    input  wire             RQ_ACK,
    
    output L1_FIBo_REQ,
    output L1_FIBo_WREN,
    output [7:0] L1_FIBo_ID,
    output [7:0] L1_FIBo_CMD,
    output [3:0] L1_FIBo_BURST,
    output [3:0] L1_FIBo_SIZE,
    output [`YSYX210152_PADR-1:0] L1_FIBo_ADDR,
    output [`YSYX210152_XLEN-1:0] L1_FIBo_DATA,
    
    input L1_FIBi_ACK,
    input L1_FIBi_FULL,
    input L1_FIBi_V,
    input[7:0] L1_FIBi_ID,
    input[7:0] L1_FIBi_RPL,
    input[`YSYX210152_XLEN-1:0] L1_FIBi_DATA
    
);
localparam INDEX_WIDTH=$clog2(INDEX_DEPTH);
localparam TAG_WIDTH=`YSYX210152_PADR-INDEX_WIDTH-6;
localparam MEM_ADDRWID=$clog2(CACHE_DEPTH);
localparam WAYADDR_WID = $clog2(WAY_NUM);

localparam FSM_IDLE = 3'h0;
localparam FSM_FILL = 3'h1;
localparam FSM_SGRL = 3'h2;
localparam FSM_SGRH = 3'h3;
localparam FSM_FNCE = 3'h4;

wire Pipe_Stall;
assign Pipe_Stall=(RQ_V & !RQ_ACK);


wire             AQo_V;
wire [7:0]       AQo_ID;
wire [7:0]       AQo_CMD;
wire [15:0]      AQo_BSEL;
wire             AQo_CI;
wire             AQo_WT;
wire [127:0]     AQo_WDATA;
wire [`YSYX210152_PADR-1:0] AQo_ADDR;
wire             AQo_FREE;
reg CMD_FINISH;
ysyx_210152_L1_AQBuf #(.L1IBUF(1'b1))
L1I_AQBuf(
    .GLB_CLKi(GLB_CLKi),
    .GLB_RSTi(GLB_RSTi),      
    .AQi_V(AQ_V),
    .AQi_ID(AQ_ID),
    .AQi_CMD(AQ_CMD),
    .AQi_BSEL(AQ_BSEL),
    .AQi_CI(AQ_CI),
    .AQi_WT(AQ_WT),
    .AQi_WDATA(AQ_WDATA),
    .AQi_ADDR(AQ_ADDR),
    .AQi_FULLo(AQ_FULL),

    .AQo_V(AQo_V),
    .AQo_ID(AQo_ID),
    .AQo_CMD(AQo_CMD),
    .AQo_BSEL(AQo_BSEL),
    .AQo_CI(AQo_CI),
    .AQo_WT(AQo_WT),
    .AQo_WDATA(AQo_WDATA),
    .AQo_ADDR(AQo_ADDR),
    .AQo_FREE(AQo_FREE)

);
assign AQo_FREE=!Pipe_Stall & CMD_FINISH;
reg [2:0]state,state_next;
reg [127:0]Cacheless_Buffer;
wire TagFlush,CacheAccess;
wire line_miss,cacheram_rdy;

reg bus_seq_read,bus_single_read;
wire [15:0]bus_seq_cnt;
wire [63:0]bus_data_read;
wire bus_datavalid;
wire bus_finished;
wire bus_error;
wire [3:0]req_size;
wire [3:0]req_bsel;
wire [3:0]bsel_enc;
wire [127:0]bufwr_bsel;

always@(posedge GLB_CLKi or posedge GLB_RSTi)
    if(GLB_RSTi)
        state<=FSM_IDLE;
    else
        state<=state_next;
    
always@(*)
    case(state)
    FSM_IDLE:
    begin
        if(AQo_V)  
            casez ({10{(!Pipe_Stall)}}&{AQo_CI,line_miss,AQo_CMD})
                10'b??_0000_0000:
                    state_next=FSM_IDLE;
                10'b00_0000_0010:  
                    state_next=FSM_IDLE;    
                10'b1?_0000_0010: 
                    if(AQo_BSEL[7:0]==0)
                        state_next=FSM_SGRH;
                    else 
                        state_next=FSM_SGRL;
                10'b01_0000_0010: 
                    state_next=FSM_FILL;
                {2'b??,`YSYX210152_LSU_CacheRef}:
                    state_next=FSM_FNCE;
                default: 
                begin
                    state_next=FSM_IDLE;
                    
                end
            endcase
        else
            state_next=FSM_IDLE;
    end
    FSM_FILL:
    begin
        if(bus_finished)
            state_next=FSM_IDLE;
        else 
            state_next=FSM_FILL;
    end
    FSM_SGRH:
    begin
        if(bus_finished)
            state_next=FSM_IDLE;
        else 
            state_next=FSM_SGRH;
    end
    FSM_SGRL:
    if(bus_finished)
        if(AQo_BSEL[15:8]==0)
            state_next=FSM_IDLE;
        else 
            state_next=FSM_SGRH;
    else 
        state_next=FSM_SGRL;
    FSM_FNCE:
        state_next=FSM_IDLE;
    default:
        state_next=FSM_IDLE;
    endcase
always@(posedge GLB_CLKi or posedge GLB_RSTi)
    if(GLB_RSTi)
        bus_single_read<=0;
    else if((state_next == FSM_SGRL) | ((state_next == FSM_SGRH) & (state !=FSM_SGRL)))
        bus_single_read<=1;
    else 
        bus_single_read<=0;
always@(*)
    casez({AQo_CI,line_miss,AQo_CMD})
        {2'b0?,`YSYX210152_LSU_READ}:
            CMD_FINISH=(state_next == FSM_IDLE) & (state == FSM_IDLE);
        {3'b1?,`YSYX210152_LSU_READ}:
            CMD_FINISH=(state_next == FSM_IDLE);
        
        
        default:
            CMD_FINISH=1'b1;
    endcase
always@(posedge GLB_CLKi or posedge GLB_RSTi)
    if(GLB_RSTi)
        bus_seq_read<=0;
    else if(state_next == FSM_FILL)
        bus_seq_read<=1;
    else 
        bus_seq_read<=0;
reg [15:0]BSEL_Hold;
wire [127:0]CLB_WrDat;
wire CLB_WrCond;
assign CLB_WrDat=({bus_data_read,bus_data_read} & bufwr_bsel) | (Cacheless_Buffer & (~bufwr_bsel));  
assign CLB_WrCond=AQo_CI & bus_finished &((state==FSM_SGRH)|(state==FSM_SGRL));
always@(posedge GLB_CLKi)
    if(CLB_WrCond)
        Cacheless_Buffer<=CLB_WrDat;
    else 
        Cacheless_Buffer<=Cacheless_Buffer;
always@(posedge GLB_CLKi)
    if((state_next == FSM_SGRL) | ((state_next == FSM_SGRH) & (state !=FSM_SGRL)))
        BSEL_Hold<=AQo_BSEL;
    else 
        BSEL_Hold<=BSEL_Hold;


wire [INDEX_WIDTH+3:4]index_addr;
wire [TAG_WIDTH-1:0]tag_addr;
wire [1:0]entry_addr;
assign CacheAccess=(AQo_CMD==`YSYX210152_LSU_READ) & (!AQo_CI);
assign TagFlush=(state_next==FSM_FNCE);

assign index_addr=AQo_ADDR[INDEX_WIDTH+5:6];
assign tag_addr=AQo_ADDR[`YSYX210152_PADR-1:INDEX_WIDTH+6];
assign entry_addr=AQo_ADDR[5:4];
wire [MEM_ADDRWID-1:0]CacheAccessAddr;
wire [MEM_ADDRWID-1:0]CacheMemWAddr;

generate if(WAY_NUM>1)
begin : WAY_ASSOCIATIVE
    wire [WAYADDR_WID-1:0]WayReplace_Addr,WayAccess_addr;
    ysyx_210152_tagman_wa#(
        .WAY_DEPTH(INDEX_DEPTH), 
        .WAY_NUM(WAY_NUM),
        .TAG_WID(TAG_WIDTH),
        .WBACK_ENABLE(1'b0) 
    )
    TAG_MANAGER_L1I(
        .clk(GLB_CLKi),
        .rst(GLB_RSTi),
        
        .entry_read(CacheAccess),   
        .entry_wthru(1'b0),
        .entry_wback(1'b0),
        .address_tag(tag_addr),
        .address_index(index_addr),	
        .valid_clear(TagFlush), 
        .dfence_en(1'b0),
        
        .fill_finish(bus_finished), 
        .writeback_ok(1'b0),
        .line_miss(line_miss),
        .replace_dirty(),
        .dirty_comp(),
        .dirty_index(),
        .way_dirty_addr(),
        .way_replace_addr(WayReplace_Addr),
        .way_access_addr(WayAccess_addr)
    );
    assign CacheAccessAddr={WayAccess_addr,index_addr,entry_addr};
    assign CacheMemWAddr={WayReplace_Addr,index_addr,bus_seq_cnt[2:1]};
end
else
begin : DIRECT_MAPPED
    ysyx_210152_tagman_dm #(
        .WAY_DEPTH(INDEX_DEPTH),
        .TAG_WID(TAG_WIDTH),
        .WBACK_ENABLE(1'b0) 
    )TAGMAN_DM
    (
        .clk(GLB_CLKi),
        .rst(GLB_RSTi),
        
        .entry_read(CacheAccess),   
        .entry_wthru(1'b0),
        .entry_wback(1'b0),
        .address_tag(tag_addr),
        .address_index(index_addr),	
        .valid_clear(TagFlush), 
        .dfence_en(1'b0),

        .fill_finish(bus_finished), 
        .writeback_ok(1'b0),
        .line_miss(line_miss),
        .replace_dirty(),
        .writeback_addr(),
        .writeback_index()
    );
    assign CacheAccessAddr={index_addr,entry_addr};
    assign CacheMemWAddr={index_addr,bus_seq_cnt[2:1]};
end
endgenerate

reg Cache_CI,Cache_V;
reg  [7:0]Cache_ID;
reg  [MEM_ADDRWID-1:0] CacheMemRAddr_reg,CacheMemRAddr_hold;
wire [MEM_ADDRWID-1:0]CacheMemRAddr;
assign CacheMemRAddr=(Pipe_Stall)?CacheMemRAddr_hold:CacheMemRAddr_reg;

always@(posedge GLB_CLKi or posedge GLB_RSTi)
begin
    if(GLB_RSTi)
        Cache_V <=1'b0;
    else if(Pipe_Stall)
        Cache_V <=Cache_V;    
    else 
        Cache_V <=(AQo_V & CMD_FINISH);
end
always@(posedge GLB_CLKi or posedge GLB_RSTi)
begin
    if(GLB_RSTi)
    begin
        Cache_ID <=0;
        Cache_CI <=0;
    end
    else if(Pipe_Stall | !(AQo_V & CMD_FINISH))
    begin   
        Cache_ID <=Cache_ID;
        Cache_CI <=Cache_CI;
    end
    else 
    begin
        Cache_ID <=AQo_ID;
        Cache_CI <=AQo_CI;
    end
end

always@(posedge GLB_CLKi) 
begin
    if( Pipe_Stall | !(AQo_V & (state_next == FSM_IDLE) & (state == FSM_IDLE)))
    begin
        CacheMemRAddr_reg  <=CacheMemRAddr_reg;
        CacheMemRAddr_hold <=CacheMemRAddr_hold;
    end
    else 
    begin   
        CacheMemRAddr_reg  <=CacheAccessAddr;
        CacheMemRAddr_hold <=CacheMemRAddr_reg;
    end
       
end


wire [127:0]CacheMemDi,CacheMemDo;
wire CacheMemWe;
wire [15:0]CacheMemBsel;


assign CacheMemDi={bus_data_read,bus_data_read};
assign CacheMemBsel=(bus_seq_cnt[0])?16'hff00:16'h00ff;
assign CacheMemWe=(!AQo_CI)&bus_datavalid;



wire [SRAM_BANKCOEFF-1:0]rbank_addr,wbank_addr;
wire [5:0]sram_raddr,sram_waddr;
assign rbank_addr=CacheMemRAddr[SRAM_BANKCOEFF+1:2];
assign wbank_addr=CacheMemWAddr[SRAM_BANKCOEFF+1:2];
assign sram_raddr={CacheMemRAddr[MEM_ADDRWID-1:SRAM_BANKCOEFF+2],CacheMemRAddr[1:0]};
assign sram_waddr={CacheMemWAddr[MEM_ADDRWID-1:SRAM_BANKCOEFF+2],CacheMemWAddr[1:0]};

ysyx_210152_pDPRAM_ysyx#(.BANK_COEFF(SRAM_BANKCOEFF))
CACHE_MEMORY
(
    .raddr(sram_raddr),
    .rbank(rbank_addr),
    .rdce(1'b1),
    .dato(CacheMemDo),
    .rvalid(cacheram_rdy),
    .waddr(sram_waddr),
    .wbank(wbank_addr),
    .wbsel(CacheMemBsel&{16{CacheMemWe}}),
    .dati(CacheMemDi),
    .clk(GLB_CLKi),
    .rst(GLB_RSTi)
);

assign RQ_RDATA=(Cache_CI)?Cacheless_Buffer:CacheMemDo;
always@(posedge GLB_CLKi or posedge GLB_RSTi)
begin
    if(GLB_RSTi)
    begin
        RQ_V <=0;     
        RQ_ID    <=0;
    end
    else if(Pipe_Stall)
    begin   
        RQ_V <=RQ_V;     
        RQ_ID    <=RQ_ID;
    end
    else 
    begin  
        RQ_V         <=Cache_V ;
        RQ_ID        <=Cache_ID;
    end
end
assign bufwr_bsel={
        {8{BSEL_Hold[15]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[14]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[13]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[12]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[11]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[10]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[9]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[8]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[7]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[6]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[5]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[4]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[3]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[2]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[1]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[0]&(state==FSM_SGRL)}}
                };
assign bsel_enc=4'h2+`YSYX210152_AXI_DIFF;
assign req_size=(bus_seq_read)?4'h3:4'h0;
assign req_bsel=(bus_seq_read)?4'h3:bsel_enc;

    
ysyx_210152_FIB_BIU_L1I #(.FIBID(CACHE_FIBID)) BIU (
    .GLBi_CLK(GLB_CLKi),
    .GLBi_ARST(GLB_RSTi),
    .BIUo_WREN(L1_FIBo_WREN),
    .BIUo_REQ(L1_FIBo_REQ),
    .BIUo_ID(L1_FIBo_ID),
    .BIUo_CMD(L1_FIBo_CMD),
    .BIUo_BURST(L1_FIBo_BURST),
    .BIUo_SIZE(L1_FIBo_SIZE),
    .BIUo_ADDR(L1_FIBo_ADDR[`YSYX210152_PADR-1:0]),
    .BIUo_DATA(L1_FIBo_DATA),
    .BIUi_FULL(L1_FIBi_FULL),
    .BIUi_V(L1_FIBi_V),
    .BIUi_ACK(L1_FIBi_ACK),
    .BIUi_ID(L1_FIBi_ID),
    .BIUi_RPL(L1_FIBi_RPL),
    .BIUi_DATA(L1_FIBi_DATA),
    .single_read_req(bus_single_read),			
    .seq_read_req(bus_seq_read),		
    .seq_size(req_size),
    .req_bsel(req_bsel),
    .bus_addr(AQo_ADDR & {{`YSYX210152_PADR-6{1'b1}},{6{AQ_CI}}}),	
    .bus_rdata(bus_data_read),
    .addr_count(bus_seq_cnt),
    .data_valid(bus_datavalid),			
    .trans_error(bus_error),
    .bus_trans_finish(bus_finished)			
);

assign RQ_RDERR= (state != FSM_IDLE)& bus_error;
assign RQ_WRERR=1'b0;
assign RQ_RDY=cacheram_rdy;
endmodule







/*********************************************************************************
    L1 cache unit for PRV5xx processor
    
    
    
    
    
*********************************************************************************/


`define LSU_AMOCMD 8'b0010_????
module ysyx_210152_L1D
#(
    parameter   SRAM_BANKCOEFF=2,
                SRAM_BANKNUM=2**SRAM_BANKCOEFF,
                CACHE_DEPTH=SRAM_BANKNUM*64, 
                WAY_NUM=2,
                INDEX_DEPTH=CACHE_DEPTH/WAY_NUM/4,
                CACHE_FIBID=8'h01
)
(
    input  wire             GLB_CLKi,
    input  wire             GLB_RSTi,                      
    
    input  wire             AQ_V,
    input  wire [7:0]       AQ_ID,
    input  wire [7:0]       AQ_CMD,
    input  wire [15:0]      AQ_BSEL,
    input  wire             AQ_CI,
    input  wire             AQ_WT,
    input  wire [127:0]     AQ_WDATA,
    input  wire [`YSYX210152_PADR-1:0] AQ_ADDR,
    output wire             AQ_FULL,
    
    output reg              RQ_V,
    output reg  [7:0]       RQ_ID,
    output wire             RQ_WRERR,
    output wire             RQ_RDERR,
    output wire             RQ_RDY,
    output wire [127:0]     RQ_RDATA,
    input  wire             RQ_ACK,
    
    output L1_FIBo_REQ,
    output L1_FIBo_WREN,
    output [7:0] L1_FIBo_ID,
    output [7:0] L1_FIBo_CMD,
    output [3:0] L1_FIBo_BURST,
    output [3:0] L1_FIBo_SIZE,
    output [`YSYX210152_PADR-1:0] L1_FIBo_ADDR,
    output [`YSYX210152_XLEN-1:0] L1_FIBo_DATA,
    
    input L1_FIBi_ACK,
    input L1_FIBi_FULL,
    input L1_FIBi_V,
    input[7:0] L1_FIBi_ID,
    input[7:0] L1_FIBi_RPL,
    input[`YSYX210152_XLEN-1:0] L1_FIBi_DATA
    
);
localparam INDEX_WIDTH=$clog2(INDEX_DEPTH);
localparam TAG_WIDTH=`YSYX210152_PADR-INDEX_WIDTH-6;
localparam MEM_ADDRWID=$clog2(CACHE_DEPTH);
localparam WAYADDR_WID = $clog2(WAY_NUM);

localparam FSM_IDLE = 4'h0;
localparam FSM_FILL = 4'h1;
localparam FSM_SGRL = 4'h2;
localparam FSM_SGRH = 4'h3;
localparam FSM_WBAK = 4'h4;
localparam FSM_SGWL = 4'h5;
localparam FSM_SGWH = 4'h6;
localparam FSM_FNCE = 4'h7;
localparam FSM_RTOW = 4'h8;
localparam FSM_WTOR = 4'h9;
localparam FSM_AMOC = 4'hA;


wire             AQo_V;
wire [7:0]       AQo_ID;
wire [7:0]       AQo_CMD;
wire [15:0]      AQo_BSEL;
wire             AQo_CI;
wire             AQo_WT;
wire [127:0]     AQo_WDATA;
wire [`YSYX210152_PADR-1:0] AQo_ADDR;
wire             AQo_FREE;
reg              CMD_FINISH;
ysyx_210152_L1_AQBuf #(.L1IBUF(1'b0))
L1D_AQBuf(
    .GLB_CLKi(GLB_CLKi),
    .GLB_RSTi(GLB_RSTi),      
    .AQi_V(AQ_V),
    .AQi_ID(AQ_ID),
    .AQi_CMD(AQ_CMD),
    .AQi_BSEL(AQ_BSEL),
    .AQi_CI(AQ_CI),
    .AQi_WT(AQ_WT),
    .AQi_WDATA(AQ_WDATA),
    .AQi_ADDR(AQ_ADDR),
    .AQi_FULLo(AQ_FULL),

    .AQo_V(AQo_V),
    .AQo_ID(AQo_ID),
    .AQo_CMD(AQo_CMD),
    .AQo_BSEL(AQo_BSEL),
    .AQo_CI(AQo_CI),
    .AQo_WT(AQo_WT),
    .AQo_WDATA(AQo_WDATA),
    .AQo_ADDR(AQo_ADDR),
    .AQo_FREE(AQo_FREE)

);

wire Pipe_Stall;
assign AQo_FREE=!Pipe_Stall & CMD_FINISH;
reg [3:0]state,state_next;
reg [127:0]Cacheless_Buffer;
wire TagFlush,CacheAccess,CacheWB,CacheWT;
wire line_miss,cacheram_rdy,write;

reg Cache_CI,Cache_V;

assign Pipe_Stall=(RQ_V & !RQ_ACK) | !(Cache_CI | cacheram_rdy);

reg bus_seq_read,bus_single_read;
reg bus_seq_write,bus_single_write;
wire [`YSYX210152_PADR-1:0]bus_access_addr;
wire [TAG_WIDTH-1:0]wbak_tag;
wire [2:0]bus_seq_cnt;
wire [63:0]bus_data_read;
reg  [63:0]bus_data_write;
wire bus_datavalid;
wire bus_finished;
wire bus_error;
wire dirty_comp;
wire [3:0]req_size;
wire [3:0]req_bsel;
wire [3:0]bsel_enc;
wire [127:0]bufwr_bsel;
reg do_fence,amo_opreq;
wire replace_dirty;


always@(posedge GLB_CLKi or posedge GLB_RSTi)
    if(GLB_RSTi)
        state<=FSM_IDLE;
    else 
        state<=state_next;

always@(*)
    case(state)
        FSM_IDLE:
        begin
            if(AQo_V)
                casez ({AQo_CI,AQo_WT,line_miss,AQo_CMD})
                    {3'b???,`YSYX210152_LSU_NOP}:
                        state_next=FSM_IDLE;
                    {3'b0?0,`YSYX210152_LSU_READ}:  
                        state_next=FSM_IDLE;    
                    {3'b000,`YSYX210152_LSU_WRITE}:  
                        state_next=FSM_IDLE;     
                    {3'b1??,`YSYX210152_LSU_READ}: 
                        if(AQo_BSEL[7:0]==0)state_next=FSM_SGRH;
                        else state_next=FSM_SGRL;
                    {3'b1??,`YSYX210152_LSU_WRITE}: 
                        if(AQo_BSEL[7:0]==0)state_next=FSM_SGWH;
                        else state_next=FSM_SGWL;
                    {3'b0?1,`YSYX210152_LSU_READ}: 
                        if(replace_dirty)state_next=FSM_WBAK;
                        else state_next=FSM_FILL;
                    {3'b0?1,`YSYX210152_LSU_WRITE}: 
                        if(replace_dirty)state_next=FSM_WBAK;
                        else state_next=FSM_FILL;
                    {3'b010,`YSYX210152_LSU_WRITE}: 
                        if(AQo_BSEL[7:0]==0)state_next=FSM_SGWH;
                        else state_next=FSM_SGWL;
                    {3'b?0?,`YSYX210152_LSU_CacheRef}:
                        state_next=FSM_FNCE;
                    {3'b?1?,`YSYX210152_LSU_CacheRef}:
                        state_next=FSM_IDLE;
                    {3'b???,`LSU_AMOCMD}:
                        if((!AQ_CI) & dirty_comp & (!line_miss))
                            state_next=FSM_FNCE;
                        else
                            case(AQo_CMD)
                                `YSYX210152_LSU_READ_Lock:
                                    if(AQo_BSEL[7:0]==0)state_next=FSM_SGRH;
                                    else state_next=FSM_SGRL;
                                `YSYX210152_LSU_WRITE_Unloc:
                                    if(AQo_BSEL[7:0]==0)state_next=FSM_SGWH;
                                    else state_next=FSM_SGWL;
                                default: state_next=FSM_AMOC;
                            endcase
                    default: 
                    begin
                        state_next=FSM_IDLE;
                        
                    end
                endcase
            else
                state_next=FSM_IDLE;
        end
        FSM_FILL:
        begin
            if(bus_finished)
                if(AQo_WT & AQo_CMD==`YSYX210152_LSU_WRITE)
                    state_next = FSM_RTOW;
                else state_next=FSM_IDLE;
            else 
                state_next=FSM_FILL;
        end
        FSM_SGRH:
        begin
            if(bus_finished)
                state_next=FSM_IDLE;
            else 
                state_next=FSM_SGRH;
        end
        FSM_SGRL:
        begin
            if(bus_finished)
                if(AQo_BSEL[15:8]==0)
                    state_next=FSM_IDLE;
                else 
                    state_next=FSM_SGRH;
            else 
                state_next=FSM_SGRL;
        end
        FSM_WBAK:
        begin
            if(bus_finished)
                if(do_fence)
                    state_next=FSM_FNCE;
                else 
                    state_next=FSM_WTOR;
            else state_next=FSM_WBAK;
        end
        FSM_SGWH:
        begin
            if(bus_finished)
                state_next=FSM_IDLE;
            else
                state_next=FSM_SGWH;
        end
        FSM_SGWL:
        begin
            if(bus_finished)
                if(AQo_BSEL[15:8]==0)
                    state_next=FSM_IDLE;
                else 
                    state_next=FSM_SGWH;
            else state_next=FSM_SGWL;
        end
        FSM_FNCE:
        begin
            if(replace_dirty & (!AQ_WT))
                state_next=FSM_WBAK;
            else if(AQo_CMD[7:4]==4'h2)
                case(AQo_CMD)
                    `YSYX210152_LSU_READ_Lock:
                        if(AQo_BSEL[7:0]==0)state_next=FSM_SGRH;
                        else state_next=FSM_SGRL;
                    `YSYX210152_LSU_WRITE_Unloc:
                        if(AQo_BSEL[7:0]==0)state_next=FSM_SGWH;
                        else state_next=FSM_SGWL;
                    default: state_next=FSM_AMOC;
                endcase
            else state_next=FSM_IDLE; 
        end
        FSM_AMOC:
        begin
            if(bus_finished)
                state_next=FSM_IDLE;
            else
                state_next=FSM_AMOC;
        end
        FSM_RTOW:
        begin
            if(!bus_finished)
                if(AQo_BSEL[7:0]==0)state_next=FSM_SGWH;
                else state_next=FSM_SGWL;
            else
                state_next=FSM_RTOW;
        end
        FSM_WTOR:
        begin
            if(!bus_finished)
                state_next=FSM_FILL;
            else
                state_next=FSM_WTOR;
        end
        default:
            state_next=FSM_IDLE;
    endcase

always@(*)
    casez({AQo_CI,AQo_WT,line_miss,AQo_CMD})
        {3'b0??,`YSYX210152_LSU_READ},
        {3'b00?,`YSYX210152_LSU_WRITE}:
            CMD_FINISH=(state_next == FSM_IDLE) & (state == FSM_IDLE);
        {3'b01?,`YSYX210152_LSU_WRITE},
        {3'b1??,`YSYX210152_LSU_READ},
        {3'b1??,`YSYX210152_LSU_WRITE},
        {3'b???,`YSYX210152_LSU_CacheRef},
        {3'b???,`LSU_AMOCMD}:
            CMD_FINISH=(state_next == FSM_IDLE);
        {3'b???,`YSYX210152_LSU_NOP}:
            CMD_FINISH=1'b1;
        default:
            CMD_FINISH=1'b1;
    endcase

always@(posedge GLB_CLKi or posedge GLB_RSTi)
    if(GLB_RSTi)
        do_fence<=1'b0;
    else if(state_next==FSM_FNCE)
        do_fence<=1'b1;
    else if(state_next==FSM_IDLE)
        do_fence<=1'b0;
    else
        do_fence<=do_fence;

always@(posedge GLB_CLKi or posedge GLB_RSTi)
    if(GLB_RSTi)
        bus_seq_read<=0;
    else if (state_next==FSM_FILL)
        bus_seq_read<=1'b1;
    else
        bus_seq_read<=0;

always@(posedge GLB_CLKi or posedge GLB_RSTi)
    if(GLB_RSTi)
        bus_seq_write<=0;
    else if (state_next==FSM_WBAK)
        bus_seq_write<=1'b1;
    else
        bus_seq_write<=0;

always@(posedge GLB_CLKi or posedge GLB_RSTi)
    if(GLB_RSTi)
        bus_single_read<=0;
    else 
    case(state_next)
        FSM_SGRH:
        begin
            if(state == FSM_SGRL)
                bus_single_read<=1'b0;
            else bus_single_read<=1'b1;

        end
        FSM_SGRL:
            bus_single_read<=1'b1;
        default:
            bus_single_read<=0;
    endcase

always@(posedge GLB_CLKi or posedge GLB_RSTi)
    if(GLB_RSTi)
        bus_single_write<=0;
    else 
    case(state_next)
        FSM_SGWH:
            if(state == FSM_SGWL)bus_single_write<=1'b0;
            else bus_single_write<=1'b1;
        FSM_SGWL:
            bus_single_write<=1'b1;
        default:
            bus_single_write<=0;
    endcase

always@(posedge GLB_CLKi or posedge GLB_RSTi)    
    if(GLB_RSTi)
        amo_opreq<=1'b0;
    else if(AQo_V)
        amo_opreq<=(AQo_CMD[7:4]==4'h2);
    else if(state_next == FSM_IDLE)
        amo_opreq<=1'b0;
    else
        amo_opreq<=amo_opreq;



wire [127:0]CLB_WrDat;
wire CLB_WrCond;
assign CLB_WrCond=AQo_CI & bus_finished &((state==FSM_SGRH)|(state==FSM_SGRL));
assign CLB_WrDat=({bus_data_read,bus_data_read} & bufwr_bsel) | (Cacheless_Buffer & (~bufwr_bsel));  
always@(posedge GLB_CLKi)
    if(CLB_WrCond)
        Cacheless_Buffer<=CLB_WrDat;
    else 
        Cacheless_Buffer<=Cacheless_Buffer;

reg [15:0]BSEL_Hold;
wire BSEL_Hold_Trig;
assign BSEL_Hold_Trig=  (state_next == FSM_SGRL) | 
                        ((state_next == FSM_SGRH) & (state !=FSM_SGRL)) |
                        (state_next == FSM_SGWL) | 
                        ((state_next == FSM_SGWH) & (state !=FSM_SGWL));
always@(posedge GLB_CLKi)
    if(BSEL_Hold_Trig)
        BSEL_Hold<=AQo_BSEL;
    else 
        BSEL_Hold<=BSEL_Hold;

wire [INDEX_WIDTH+3:4]index_addr;
wire [INDEX_WIDTH-1:0]dirty_index;
wire [TAG_WIDTH-1:0]tag_addr;
wire [1:0]entry_addr;
assign write=(AQo_CMD == `YSYX210152_LSU_WRITE);
assign CacheAccess=((AQo_CMD==`YSYX210152_LSU_READ) & (!AQo_CI)) | (AQo_CMD[7:4]==4'h2);
assign CacheWT=(!AQo_CI) & AQo_WT & write;
assign CacheWB=(!AQo_CI) & (!AQo_WT) & write;
assign TagFlush=(state==FSM_FNCE) & (state_next == FSM_IDLE)|
                ((AQo_CMD==`YSYX210152_LSU_CacheRef) & AQo_WT);

assign index_addr=AQo_ADDR[INDEX_WIDTH+5:6];
assign tag_addr=AQo_ADDR[`YSYX210152_PADR-1:INDEX_WIDTH+6];
assign entry_addr=AQo_ADDR[5:4];

wire [MEM_ADDRWID-1:0]CacheAccessAddr;
wire [MEM_ADDRWID-1:0]BusMemAddr;

wire [2:0]bcnt_p1;
assign bcnt_p1=(bus_seq_cnt+L1_FIBo_REQ);
generate if(WAY_NUM>1)
begin : WAY_ASSOCIATIVE
    wire [WAYADDR_WID-1:0]WayReplace_Addr,WayAccess_addr;
    ysyx_210152_tagman_wa#(
        .WAY_DEPTH(INDEX_DEPTH), 
        .WAY_NUM(WAY_NUM),
        .TAG_WID(TAG_WIDTH),
        .WBACK_ENABLE(1'b1) 
    )
    TAG_MANAGER_L1D(
        .clk(GLB_CLKi),
        .rst(GLB_RSTi),
        
        .entry_read(CacheAccess),   
        .entry_wthru(CacheWT),
        .entry_wback(CacheWB),
        .address_tag(tag_addr),
        .address_index(index_addr),	
        .dfence_en(do_fence),
        .valid_clear(TagFlush), 
        .fill_finish((state == FSM_FILL) & bus_finished), 
        .writeback_ok((state == FSM_WBAK) & bus_finished),
        .line_miss(line_miss),
        .replace_dirty(replace_dirty), 
        .dirty_comp(dirty_comp),
        .dirty_index(dirty_index),
        .way_dirty_addr(wbak_tag),
        .way_replace_addr(WayReplace_Addr), 
        .way_access_addr(WayAccess_addr)
    );
    assign CacheAccessAddr={WayAccess_addr,index_addr,entry_addr};
    assign BusMemAddr=(bus_seq_write)?{WayReplace_Addr,dirty_index,bcnt_p1[2:1]} : {WayReplace_Addr,dirty_index,bus_seq_cnt[2:1]};
end
else
begin : DIRECT_MAPPED
    ysyx_210152_tagman_dm #(
        .WAY_DEPTH(INDEX_DEPTH),
        .TAG_WID(TAG_WIDTH),
        .WBACK_ENABLE(1'b1) 
    )TAGMAN_DM
    (
        .clk(GLB_CLKi),
        .rst(GLB_RSTi),
        
        .entry_read(CacheAccess),   
        .entry_wthru(CacheWT),
        .entry_wback(CacheWB),
        .address_tag(tag_addr),
        .address_index(index_addr),	
        .valid_clear(TagFlush), 
        .dfence_en(do_fence),

        .fill_finish((state == FSM_FILL) & bus_finished), 
        .writeback_ok((state == FSM_WBAK) & bus_finished),
        .line_miss(line_miss),
        .replace_dirty(replace_dirty), 
        .writeback_addr(wbak_tag),
        .writeback_index(dirty_index)
    );
    assign dirty_comp=replace_dirty;
    assign CacheAccessAddr={index_addr,entry_addr};
    assign BusMemAddr= (bus_seq_write)?{dirty_index,bcnt_p1[2:1]}:{dirty_index,bus_seq_cnt[2:1]};
end
endgenerate


wire Cache_FlowCond;
reg  [7:0]Cache_ID;
assign Cache_FlowCond=AQo_V & CMD_FINISH;

reg  [MEM_ADDRWID-1:0] PipeMemAddr_reg,PipeMemAddr_hold;
wire [MEM_ADDRWID-1:0] PipeMemAddr;
reg  [127:0]PipeMemDi;
reg  PipeMemWe;
reg  [15:0]PipeMemBsel;
assign PipeMemAddr=(RQ_V & !RQ_ACK)?PipeMemAddr_hold:PipeMemAddr_reg;


always@(posedge GLB_CLKi or posedge GLB_RSTi)
begin
    if(GLB_RSTi)
        Cache_V <=1'b0;
    else if(Pipe_Stall)
        Cache_V <=Cache_V;    
    else 
        Cache_V <=Cache_FlowCond;
end

always@(posedge GLB_CLKi or posedge GLB_RSTi)
begin
    if(GLB_RSTi)
    begin
        Cache_ID <=0;
        Cache_CI <=0;
    end
    else if(Pipe_Stall | !Cache_FlowCond)
    begin   
        Cache_ID <=Cache_ID;
        Cache_CI <=Cache_CI;
    end
    else 
    begin
        Cache_ID <=AQo_ID;
        Cache_CI <=AQo_CI | amo_opreq;
    end
        
end

always@(posedge GLB_CLKi)
begin
    if( Pipe_Stall | !Cache_FlowCond)
    begin
        PipeMemAddr_reg  <=PipeMemAddr_reg;
        PipeMemAddr_hold <=PipeMemAddr_hold;
    end
    else 
    begin   
        PipeMemAddr_reg  <=CacheAccessAddr;
        PipeMemAddr_hold <=PipeMemAddr_reg;
    end
end

always@(posedge GLB_CLKi or posedge GLB_RSTi)
begin
    if(GLB_RSTi)
    begin
        PipeMemWe <=1'b0;
    end
    else if(Pipe_Stall)
    begin
        PipeMemWe <= PipeMemWe;
    end
    else 
    begin
        PipeMemWe <=(CacheWT | CacheWB) & Cache_FlowCond;
    end
end

always@(posedge GLB_CLKi)
begin
    if( Pipe_Stall | (!Cache_FlowCond))
    begin
        PipeMemDi  <=PipeMemDi;
        PipeMemBsel<=PipeMemBsel;
    end
    else
    begin   
        PipeMemDi<=AQo_WDATA;
        PipeMemBsel<=AQo_BSEL;
    end

end

wire [127:0]PipeMemDo;

wire [127:0]BusMemDi,BusMemDo;
wire BusMemWe;
wire [15:0]BusMemBsel;

assign BusMemDi= {bus_data_read,bus_data_read};
assign BusMemBsel= ((bus_seq_cnt[0])?16'hff00:16'h00ff);
assign BusMemWe = ((state == FSM_FILL) & bus_datavalid);

wire [SRAM_BANKCOEFF-1:0]sram_pipebank,sram_busbank;
wire [5:0]sram_pipeaddr,sram_busaddr;
assign sram_pipebank=PipeMemAddr[SRAM_BANKCOEFF+1:2];
assign sram_pipeaddr={PipeMemAddr[MEM_ADDRWID-1:SRAM_BANKCOEFF+2],PipeMemAddr[1:0]};
assign sram_busbank=BusMemAddr[SRAM_BANKCOEFF+1:2];
assign sram_busaddr={BusMemAddr[MEM_ADDRWID-1:SRAM_BANKCOEFF+2],BusMemAddr[1:0]};

ysyx_210152_pTDPRAM_ysyx #(.BANK_COEFF(SRAM_BANKCOEFF))
CACHE_MEMORY(
    .addr_A(sram_pipeaddr),
    .bank_A(sram_pipebank),
    .ce_A(Cache_V),
    .wbsel_A(PipeMemBsel&{16{PipeMemWe}}),
    .opvalid_A(cacheram_rdy),
    .dato_A(PipeMemDo),
    .dati_A(PipeMemDi),

    .addr_B(sram_busaddr),
    .bank_B(sram_busbank),
    .ce_B(state!=FSM_IDLE),
    .wbsel_B(BusMemBsel&{16{BusMemWe}}),
    .opvalid_B(),
    .dato_B(BusMemDo),
    .dati_B(BusMemDi),

    .clk(GLB_CLKi),
    .rst(GLB_RSTi)
);


assign RQ_RDATA=(Cache_CI)?Cacheless_Buffer:PipeMemDo;

always@(posedge GLB_CLKi or posedge GLB_RSTi)
begin
    if(GLB_RSTi)
    begin
        RQ_V <=0;     
        RQ_ID    <=0;
    end
    else if(Pipe_Stall)
    begin   
        RQ_V <=RQ_V;     
        RQ_ID    <=RQ_ID;
    end
    else 
    begin  
        RQ_V         <=Cache_V ;
        RQ_ID        <=Cache_ID;
    end
end
assign bufwr_bsel={
        {8{BSEL_Hold[15]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[14]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[13]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[12]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[11]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[10]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[9]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[8]&(state==FSM_SGRH)}},
        {8{BSEL_Hold[7]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[6]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[5]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[4]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[3]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[2]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[1]&(state==FSM_SGRL)}},
        {8{BSEL_Hold[0]&(state==FSM_SGRL)}}
                };
assign bsel_enc=log_cnt8(((state_next==FSM_SGRH)|(state_next==FSM_SGWH))?BSEL_Hold[15:8]:BSEL_Hold[7:0]);
assign req_size=(bus_seq_read | bus_seq_write)?4'h3:4'h0;
assign req_bsel=(bus_seq_read | bus_seq_write | (bus_single_read & `YSYX210152_AXI_DIFF))?4'h3:bsel_enc;    
assign bus_access_addr=(state_next==FSM_WBAK)?
                            ((do_fence)?{wbak_tag,dirty_index,6'h00}:{wbak_tag,index_addr,6'h00}):
                        (AQo_ADDR[`YSYX210152_PADR-1:0]&{{`YSYX210152_PADR-6{1'b1}},{6{state_next!=FSM_FILL}}});
reg bcnt_hold;

always@(posedge GLB_CLKi)
    bcnt_hold<=bcnt_p1[0];
always@(*)
    case(state_next)
        FSM_FNCE,
        FSM_WBAK:
            bus_data_write = (bcnt_hold)?BusMemDo[127:64]:BusMemDo[63:0];
        FSM_SGWH:
            bus_data_write = AQo_WDATA[127:64];
        FSM_SGWL:
            bus_data_write = AQo_WDATA[63:0];
        default:
            bus_data_write = 64'h0000_010A_9FC7_0042;
    endcase
    
ysyx_210152_FIB_BIU_L1D #(.FIBID(CACHE_FIBID)) BIU (
    .GLBi_CLK(GLB_CLKi),
    .GLBi_ARST(GLB_RSTi),
    .BIUo_WREN(L1_FIBo_WREN),
    .BIUo_REQ(L1_FIBo_REQ),
    .BIUo_ID(L1_FIBo_ID),
    .BIUo_CMD(L1_FIBo_CMD),
    .BIUo_BURST(L1_FIBo_BURST),
    .BIUo_SIZE(L1_FIBo_SIZE),
    .BIUo_ADDR(L1_FIBo_ADDR[`YSYX210152_PADR-1:0]),
    .BIUo_DATA(L1_FIBo_DATA),
    .BIUi_FULL(L1_FIBi_FULL),
    .BIUi_V(L1_FIBi_V),
    .BIUi_ACK(L1_FIBi_ACK),
    .BIUi_ID(L1_FIBi_ID),
    .BIUi_RPL(L1_FIBi_RPL),
    .BIUi_DATA(L1_FIBi_DATA),
    
    .single_write_req(bus_single_write),	
    .seq_write_req(bus_seq_write),	
    .single_read_req(bus_single_read),			
    .seq_read_req(bus_seq_read),		
    .amo_cmd(AQo_CMD),
    .amo_req(amo_opreq),
    .seq_size(req_size),
    .req_bsel(req_bsel),
    .bus_addr(bus_access_addr),		
    .bus_wdata(bus_data_write),
    .bus_rdata(bus_data_read),
    .addr_count(bus_seq_cnt),
    .data_valid(bus_datavalid),			
    .trans_error(bus_error),
    .bus_trans_finish(bus_finished)			
);

function [3:0]log_cnt8;
 input [7:0]datain;
   integer x;
    reg [1:0]as1[3:0];
    reg [2:0]as2[1:0];
    reg [3:0]as3;
    begin
    for (x=0;x<4;x=x+1)
        as1[x]=datain[2*x+1]+datain[2*x];
    for (x=0;x<2;x=x+1)
        as2[x]=as1[2*x+1]+as1[2*x];
    as3=as2[0]+as2[1];
    log_cnt8=(as3[3] | as3[2:0]>3'h4 )? 4'h3:
    (as3[2] | as3[1:0] > 2'h2)?4'h2:
    (as3[1])?4'h1:4'h0;
    end
endfunction

assign RQ_RDY=1'b1;
assign RQ_RDERR= (state != FSM_IDLE)& bus_error;
assign RQ_WRERR=(state == FSM_SGWH | state_next == FSM_SGWL | state_next == FSM_WBAK) & bus_error;
endmodule









/*****************************************************************************************
 *    author : Jack's Team
 *    e-mail : 
 *    date   : 20210726
 *    desc   : PRV564 kernal Top level file
 *    version: 0001
 
Family 	: PRV5
Module 	: 564 Top module
Arch    : Vostok
ISA		: RISC-V 64bit Extension U,S,I,M,A,F,D,X
L1I		: 16K 4 Way Set Associative NRU
L1D		: 32K 8 Way Set Associative NRU
TLB-I	: Automatic 32-entry TLB-I              
TLB-D	: Automatic 32-entry TLB-D              

 __  __                   __           __         
/\ \/\ \                 /\ \__       /\ \        
\ \ \ \ \    ___     ____\ \ ,_\   ___\ \ \/'\    
 \ \ \ \ \  / __`\  /',__\\ \ \/  / __`\ \ , <    
  \ \ \_/ \/\ \L\ \/\__, `\\ \ \_/\ \L\ \ \ \\`\  
   \ `\___/\ \____/\/\____/ \ \__\ \____/\ \_\ \_\
    `\/__/  \/___/  \/___/   \/__/\/___/  \/_/\/_/


    This is a 64bit RISC-V processor

   "I see Earth! It is so beautiful!"
                        —— Yuri Gagarin

**********************************************************************************************/
module ysyx_210152_PRV564_top
#(parameter HART_ID=8'h00,
            ITLB_FIBID=8'h01,
            DTLB_FIBID=8'h02,
            ICACHE_FIBID=8'h03,
            DCACHE_FIBID=8'h04,
            L1I_WAYNUM=1,
            L1D_WAYNUM=1
)
(
    input wire                  GLB_CLKi,
    input wire                  GLB_ARSTi,

    output  wire                ITLB_FIB_WRENo, DTLB_FIB_WRENo,        
    output  wire                ITLB_FIB_REQo,  DTLB_FIB_REQo,        
    input   wire                ITLB_FIB_ACKi,  DTLB_FIB_ACKi,        
    input   wire                ITLB_FIB_FULLi, DTLB_FIB_FULLi,       
    output  wire [7:0]          ITLB_FIB_IDo,   DTLB_FIB_IDo,
    output  wire [7:0]          ITLB_FIB_CMDo,  DTLB_FIB_CMDo,
    output  wire [3:0]          ITLB_FIB_BURSTo,DTLB_FIB_BURSTo,
    output  wire [3:0]          ITLB_FIB_SIZEo, DTLB_FIB_SIZEo,
    output  wire [`YSYX210152_PADR-1:0]    ITLB_FIB_ADDRo, DTLB_FIB_ADDRo,    
    output  wire [`YSYX210152_XLEN-1:0]    ITLB_FIB_DATAo, DTLB_FIB_DATAo,
    input   wire [7:0]          ITLB_FIB_IDi,   DTLB_FIB_IDi,
    input   wire [7:0]          ITLB_FIB_RPLi,  DTLB_FIB_RPLi,
    input   wire                ITLB_FIB_Vi,    DTLB_FIB_Vi,
    input   wire [`YSYX210152_XLEN-1:0]    ITLB_FIB_DATAi, DTLB_FIB_DATAi,

    output  wire                ICache_FIB_WRENo, DCache_FIB_WRENo,        
    output  wire                ICache_FIB_REQo,  DCache_FIB_REQo,        
    input   wire                ICache_FIB_ACKi,  DCache_FIB_ACKi,        
    input   wire                ICache_FIB_FULLi, DCache_FIB_FULLi,       
    output  wire [7:0]          ICache_FIB_IDo,   DCache_FIB_IDo,
    output  wire [7:0]          ICache_FIB_CMDo,  DCache_FIB_CMDo,
    output  wire [3:0]          ICache_FIB_BURSTo,DCache_FIB_BURSTo,
    output  wire [3:0]          ICache_FIB_SIZEo, DCache_FIB_SIZEo,
    output  wire [`YSYX210152_PADR-1:0]    ICache_FIB_ADDRo, DCache_FIB_ADDRo,    
    output  wire [`YSYX210152_XLEN-1:0]    ICache_FIB_DATAo, DCache_FIB_DATAo,
    input   wire [7:0]          ICache_FIB_IDi,   DCache_FIB_IDi,
    input   wire [7:0]          ICache_FIB_RPLi,  DCache_FIB_RPLi,
    input   wire                ICache_FIB_Vi,    DCache_FIB_Vi,
    input   wire [`YSYX210152_XLEN-1:0]    ICache_FIB_DATAi, DCache_FIB_DATAi,

    input wire                  Kernel_MTIi,        
    input wire                  Kernel_MSIi,        
    input wire                  Kernel_MEIi,        
    input wire                  Kernel_SEIi,        
    input wire                  Kernel_NMIPLi,      
    input wire                  Kernel_NMIEEi,      
    input wire                  Kernel_NMIGi,       

    input wire [63:0]           Kernel_MTIMEi	    
);

    wire                 ICache_AQ_V,      DCache_AQ_V;
    wire [7:0]           ICache_AQ_ID,     DCache_AQ_ID;
    wire [7:0]           ICache_AQ_CMD,    DCache_AQ_CMD;
    wire                 ICache_AQ_CI,     DCache_AQ_CI;
    wire                 ICache_AQ_WT,     DCache_AQ_WT;
    wire [15:0]          ICache_AQ_BSEL,   DCache_AQ_BSEL;
    wire [127:0]                           DCache_AQ_WDATA;
    wire [`YSYX210152_PADR-1:0]     ICache_AQ_ADDR,   DCache_AQ_ADDR;
    wire                 ICache_AQ_FULL,   DCache_AQ_FULL;
    wire                 ICache_RQ_V,      DCache_RQ_V;
    wire [7:0]           ICache_RQ_ID,     DCache_RQ_ID;
    wire                 ICache_RQ_WRERR,  DCache_RQ_WRERR;
    wire                 ICache_RQ_RDERR,  DCache_RQ_RDERR;
    wire                 ICache_RQ_RDY,    DCache_RQ_RDY;
    wire [127:0]         ICache_RQ_RDATA,  DCache_RQ_RDATA;
    wire                 ICache_RQ_ACK,    DCache_RQ_ACK;

    wire [`YSYX210152_XLEN-`YSYX210152_PADR-1:0]IAQ_ADDR_SINK,   DAQ_ADDR_SINK;
    wire [`YSYX210152_XLEN-`YSYX210152_PADR-1:0]ITLB_ADDR_SINK,  DTLB_ADDR_SINK;
`ifdef WAVEDUMP
initial 
begin
    $dumpfile("./temp/Vostok564_dbg.vcd");
    $dumpvars();
end
`endif
ysyx_210152_PRV564_Kernel #(
    .HARTID                     (HART_ID),
    .ITLB_FIBID                 (ITLB_FIBID),
    .DTLB_FIBID                 (DTLB_FIBID))
Kernel(
    .Kernel_CLKi                (GLB_CLKi),
    .Kernel_ARSTi               (GLB_ARSTi),

    .ITLB_FIBo_WREN             (ITLB_FIB_WRENo),        
    .ITLB_FIBo_REQ              (ITLB_FIB_REQo),         
    .ITLB_FIBi_ACK              (ITLB_FIB_ACKi),         
    .ITLB_FIBi_FULL             (ITLB_FIB_FULLi),        
    .ITLB_FIBo_ID               (ITLB_FIB_IDo),
    .ITLB_FIBo_CMD              (ITLB_FIB_CMDo),
    .ITLB_FIBo_BURST            (ITLB_FIB_BURSTo),
    .ITLB_FIBo_SIZE             (ITLB_FIB_SIZEo),
    .ITLB_FIBo_ADDR             ({ITLB_ADDR_SINK,ITLB_FIB_ADDRo}),      
    .ITLB_FIBo_DATA             (ITLB_FIB_DATAo),
    .ITLB_FIBi_ID               (ITLB_FIB_IDi),
    .ITLB_FIBi_RPL              (ITLB_FIB_RPLi),
    .ITLB_FIBi_V                (ITLB_FIB_Vi),
    .ITLB_FIBi_DATA             (ITLB_FIB_DATAi),
    
    .DTLB_FIBo_WREN             (DTLB_FIB_WRENo),        
    .DTLB_FIBo_REQ              (DTLB_FIB_REQo),         
    .DTLB_FIBi_ACK              (DTLB_FIB_ACKi),         
    .DTLB_FIBi_FULL             (DTLB_FIB_FULLi),        
    .DTLB_FIBo_ID               (DTLB_FIB_IDo),
    .DTLB_FIBo_CMD              (DTLB_FIB_CMDo),
    .DTLB_FIBo_BURST            (DTLB_FIB_BURSTo),
    .DTLB_FIBo_SIZE             (DTLB_FIB_SIZEo),
    .DTLB_FIBo_ADDR             ({DTLB_ADDR_SINK,DTLB_FIB_ADDRo}),      
    .DTLB_FIBo_DATA             (DTLB_FIB_DATAo),
    .DTLB_FIBi_ID               (DTLB_FIB_IDi),
    .DTLB_FIBi_RPL              (DTLB_FIB_RPLi),
    .DTLB_FIBi_V                (DTLB_FIB_Vi),
    .DTLB_FIBi_DATA             (DTLB_FIB_DATAi),

    .ICache_AQ_V                (ICache_AQ_V),      
    .DCache_AQ_V                (DCache_AQ_V),
    .ICache_AQ_ID               (ICache_AQ_ID),     
    .DCache_AQ_ID               (DCache_AQ_ID),
    .ICache_AQ_CMD              (ICache_AQ_CMD),    
    .DCache_AQ_CMD              (DCache_AQ_CMD),
    .ICache_AQ_CI               (ICache_AQ_CI),     
    .DCache_AQ_CI               (DCache_AQ_CI),
    .ICache_AQ_WT               (ICache_AQ_WT),     
    .DCache_AQ_WT               (DCache_AQ_WT),
    .ICache_AQ_BSEL             (ICache_AQ_BSEL),   
    .DCache_AQ_BSEL             (DCache_AQ_BSEL),
    .DCache_AQ_WDATA            (DCache_AQ_WDATA),
    .ICache_AQ_ADDR             ({IAQ_ADDR_SINK,ICache_AQ_ADDR}),   
    .DCache_AQ_ADDR             ({DAQ_ADDR_SINK,DCache_AQ_ADDR}),
    .ICache_AQ_FULL             (ICache_AQ_FULL),   
    .DCache_AQ_FULL             (DCache_AQ_FULL),
    .ICache_RQ_V                (ICache_RQ_V),      
    .DCache_RQ_V                (DCache_RQ_V),
    .ICache_RQ_ID               (ICache_RQ_ID),     
    .DCache_RQ_ID               (DCache_RQ_ID),
    .ICache_RQ_WRERR            (ICache_RQ_WRERR),  
    .DCache_RQ_WRERR            (DCache_RQ_WRERR),
    .ICache_RQ_RDERR            (ICache_RQ_RDERR),  
    .DCache_RQ_RDERR            (DCache_RQ_RDERR),
    .ICache_RQ_RDY              (ICache_RQ_RDY),    
    .DCache_RQ_RDY              (DCache_RQ_RDY),
    .ICache_RQ_RDATA            (ICache_RQ_RDATA),  
    .DCache_RQ_RDATA            (DCache_RQ_RDATA),
    .ICache_RQ_ACK              (ICache_RQ_ACK),    
    .DCache_RQ_ACK              (DCache_RQ_ACK),
    .Kernel_MTIi                (Kernel_MTIi),        
    .Kernel_MSIi                (Kernel_MSIi),        
    .Kernel_MEIi                (Kernel_MEIi),        
    .Kernel_SEIi                (Kernel_SEIi),        
    .Kernel_NMIPLi              (Kernel_NMIPLi),      
    .Kernel_NMIEEi              (Kernel_NMIEEi),      
    .Kernel_NMIGi               (Kernel_NMIGi),       
    .Kernel_MTIMEi              (Kernel_MTIMEi)	      
);

ysyx_210152_L1I #(
  .WAY_NUM          (L1I_WAYNUM),
  .CACHE_FIBID      (ICACHE_FIBID)
  )
L1I(
    .GLB_CLKi                   (GLB_CLKi),
    .GLB_RSTi                   (GLB_ARSTi),                      
    
    .AQ_V                       (ICache_AQ_V),
    .AQ_ID                      (ICache_AQ_ID),
    .AQ_CMD                     (ICache_AQ_CMD),
    .AQ_BSEL                    (ICache_AQ_BSEL),
    .AQ_CI                      (ICache_AQ_CI),
    .AQ_WT                      (ICache_AQ_WT),
    .AQ_WDATA                   (128'h0),
    .AQ_ADDR                    (ICache_AQ_ADDR),
    .AQ_FULL                    (ICache_AQ_FULL),
    
    .RQ_V                       (ICache_RQ_V),
    .RQ_ID                      (ICache_RQ_ID),
    .RQ_WRERR                   (ICache_RQ_WRERR),
    .RQ_RDERR                   (ICache_RQ_RDERR),
    .RQ_RDY                     (ICache_RQ_RDY),
    .RQ_RDATA                   (ICache_RQ_RDATA),
    .RQ_ACK                     (ICache_RQ_ACK),
    
    .L1_FIBo_REQ                (ICache_FIB_REQo),
    .L1_FIBo_WREN               (ICache_FIB_WRENo),
    .L1_FIBo_ID                 (ICache_FIB_IDo),
    .L1_FIBo_CMD                (ICache_FIB_CMDo),
    .L1_FIBo_BURST              (ICache_FIB_BURSTo),
    .L1_FIBo_SIZE               (ICache_FIB_SIZEo),
    .L1_FIBo_ADDR               (ICache_FIB_ADDRo),
    .L1_FIBo_DATA               (ICache_FIB_DATAo),
    .L1_FIBi_FULL               (ICache_FIB_FULLi),
    .L1_FIBi_V                  (ICache_FIB_Vi),
    .L1_FIBi_ACK                (ICache_FIB_ACKi),
    .L1_FIBi_ID                 (ICache_FIB_IDi),
    .L1_FIBi_RPL                (ICache_FIB_RPLi),
    .L1_FIBi_DATA               (ICache_FIB_DATAi)
);
ysyx_210152_L1D #(
  .WAY_NUM              (L1D_WAYNUM),
  .CACHE_FIBID          (DCACHE_FIBID)
  )
L1D(
    .GLB_CLKi                   (GLB_CLKi),
    .GLB_RSTi                   (GLB_ARSTi),                      
    
    .AQ_V                       (DCache_AQ_V),
    .AQ_ID                      (DCache_AQ_ID),
    .AQ_CMD                     (DCache_AQ_CMD),
    .AQ_BSEL                    (DCache_AQ_BSEL),
    .AQ_CI                      (DCache_AQ_CI),
    .AQ_WT                      (DCache_AQ_WT),
    .AQ_WDATA                   (DCache_AQ_WDATA),
    .AQ_ADDR                    (DCache_AQ_ADDR),
    .AQ_FULL                    (DCache_AQ_FULL),
    
    .RQ_V                       (DCache_RQ_V),
    .RQ_ID                      (DCache_RQ_ID),
    .RQ_WRERR                   (DCache_RQ_WRERR),
    .RQ_RDERR                   (DCache_RQ_RDERR),
    .RQ_RDY                     (DCache_RQ_RDY),
    .RQ_RDATA                   (DCache_RQ_RDATA),
    .RQ_ACK                     (DCache_RQ_ACK),
    
    .L1_FIBo_REQ                (DCache_FIB_REQo),
    .L1_FIBo_WREN               (DCache_FIB_WRENo),
    .L1_FIBo_ID                 (DCache_FIB_IDo),
    .L1_FIBo_CMD                (DCache_FIB_CMDo),
    .L1_FIBo_BURST              (DCache_FIB_BURSTo),
    .L1_FIBo_SIZE               (DCache_FIB_SIZEo),
    .L1_FIBo_ADDR               (DCache_FIB_ADDRo),
    .L1_FIBo_DATA               (DCache_FIB_DATAo),
    .L1_FIBi_FULL               (DCache_FIB_FULLi),
    .L1_FIBi_V                  (DCache_FIB_Vi),
    .L1_FIBi_ACK                (DCache_FIB_ACKi),
    .L1_FIBi_ID                 (DCache_FIB_IDi),
    .L1_FIBi_RPL                (DCache_FIB_RPLi),
    .L1_FIBi_DATA               (DCache_FIB_DATAi)
);


`ifdef STUCK_AUTO_STOP
always@(posedge GLB_CLKi)begin
    if(DCache_AQ_V& `YSYX210152_DEBUG_RUN)begin
        
    end

    if(DCache_RQ_V & `YSYX210152_DEBUG_RUN)begin
        
    end
end
`endif
endmodule







module ysyx_210152_SyncFIFO_Bus
#(
    parameter   DWID = 8,
                DDEPTH = 64
)
(
    input clk,rst,
    input ren,wen,
    input [DWID-1:0]wdata,
    output[DWID-1:0]rdata,
    output reg full,
    output empty
);
localparam CNTWID = $clog2(DDEPTH)+1;
reg empty_ff;
reg [CNTWID-1:0] wptr;
reg [CNTWID-1:0] rptr;
wire [CNTWID-1:0] wptr_next,rptr_next;
reg [DWID-1:0]memory[DDEPTH-1:0];
wire full_cmp,empty_cmp;
wire wen_internal,ren_internal;

assign wen_internal=wen;
assign ren_internal=ren;
assign full_cmp=(rptr_next=={!wptr_next[CNTWID-1],wptr_next[CNTWID-2:0]});
assign empty_cmp=(wptr_next==rptr_next);
assign wptr_next=(full)?wptr:wptr+wen_internal;
assign rptr_next=(empty_ff)?rptr:rptr+ren_internal;
assign empty=empty_ff;
always@(posedge clk or posedge rst)
begin
    if(rst) 
    begin
        wptr<=0;
        rptr<=0;
    end
    else
    begin
        if(wen_internal) 
            wptr<=wptr_next;
        else 
            wptr<=wptr;
        if(ren_internal)
            rptr<=rptr_next;
        else
            rptr<=rptr;
    end
end



assign rdata=memory[(empty_ff)?(rptr[CNTWID-2:0]-1):rptr[CNTWID-2:0]];




always@(posedge clk)
begin
    if(wen)
        memory[wptr[CNTWID-2:0]]<=wdata;
    else 
        memory[wptr[CNTWID-2:0]]<=memory[wptr[CNTWID-2:0]];
end

always@(posedge clk or posedge rst)
begin
    if(rst) 
    begin
        full<=0;
        empty_ff<=1'b1;
    end
    else 
    begin
        
            full<=full_cmp;
        
            empty_ff<=empty_cmp;
    end
end

endmodule





/*****************************************************************************************
 *    author  : Jack's Team
 *    engineer: Jack PAN
 *    e-mail  : 
 *    date    : 20210828
 *    desc    : PRV564 SFR (include CLINT and other SFR)
 *    version : 0000 (Original)
 
**********************************************************************************************/
module ysyx_210152_SFR(

    
    input  wire             CLKi,
    input  wire             ARSTi,
    
    input  wire [`YSYX210152_XLEN-1:0] SFRi_ADDR,
    input  wire [`YSYX210152_XLEN-1:0] SFRi_DATA,
    input  wire             SFRi_CS,
    input  wire             SFRi_WR,
    output  reg [`YSYX210152_XLEN-1:0] SFRo_DATA,
    
    output wire             CLINT_MTI,
    output wire             CLINT_MSI,
    output wire [`YSYX210152_XLEN-1:0] CLINT_MTIME
);
    reg [`YSYX210152_XLEN-1:0] mtime,  mtimecmp,   msoftinterrupt;

always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        mtime           <= 64'h0;
        mtimecmp        <= 64'h0;
        msoftinterrupt  <= 64'h0;
    end
    else if(SFRi_CS & SFRi_WR)begin
        case(SFRi_ADDR)
            `YSYX210152_SFR_MTIME_ADDR    :begin 
                                    mtime          <= SFRi_DATA;
                                    
                                end
            `YSYX210152_SFR_MTIMECMP_ADDR :begin
                                    mtimecmp       <= SFRi_DATA;
                                    
                                end
            `YSYX210152_SFR_MSOFTINT_ADDR :begin
                                    msoftinterrupt <= SFRi_DATA;
                                    
                                end
            default:
            begin
                mtimecmp<=mtimecmp;
                msoftinterrupt <=msoftinterrupt ;
                mtime <= mtime + 64'd1;
            end
        endcase
    end
    else begin
        mtime <= mtime + 64'd1;
    end
end
always@(*)begin
    case(SFRi_ADDR)
        `YSYX210152_SFR_MTIME_ADDR     : SFRo_DATA = mtime;
        `YSYX210152_SFR_MTIMECMP_ADDR  : SFRo_DATA = mtimecmp;
        `YSYX210152_SFR_MSOFTINT_ADDR  : SFRo_DATA = msoftinterrupt;
        default : SFRo_DATA = 64'hx;
    endcase
end
assign CLINT_MTI    = (mtime > mtimecmp);
assign CLINT_MSI    = msoftinterrupt[0];
assign CLINT_MTIME  = mtime;

endmodule







module ysyx_210152_reset_gen(
    input wire  clk,
    input wire  rst_async,
    output wire rst_sync
);
reg rst_s1,rst_s2;
always @ (posedge clk or posedge rst_async)
begin
    if (rst_async) begin
        rst_s1 <= 1'b1;
        rst_s2 <= 1'b1;
    end
    else begin
        rst_s1 <= 1'b0;
        rst_s2 <= rst_s1;
    end
end
assign rst_sync = rst_s2;

endmodule











module ysyx_210152_FIB_arb
#(
    parameter MASTER_NUM = 4                            
)
(
    input wire                  CLKi,
    input wire                  ARSTi,

    input wire [MASTER_NUM-1:0]   Master_REQ,         
    output reg [MASTER_NUM-1:0]   Master_ACK          
    
);
    localparam FIB_M0 = 4'h0,        
               FIB_M1 = 4'h1,        
               FIB_M2 = 4'h2,        
               FIB_M3 = 4'h3,        
               FIB_M4 = 4'h4,        
               FIB_IDLE = 4'hf;
    reg [7:0] Select_FSM;
always@(posedge CLKi or posedge ARSTi)begin
    if(ARSTi)begin
        Select_FSM <= FIB_IDLE;
    end
    else begin
        case(Select_FSM)
            FIB_M0  :begin
                        if(Master_REQ[0])begin
                            Select_FSM <= Select_FSM;   
                        end
                        else if(Master_REQ[1])begin
                            Select_FSM <= FIB_M1;
                        end
                        else if(Master_REQ[2])begin
                            Select_FSM <= FIB_M2;
                        end
                        else if(Master_REQ[3])begin
                            Select_FSM <= FIB_M3;
                        end
                     end
            FIB_M1  :begin
                        if(Master_REQ[1])begin
                            Select_FSM <= Select_FSM;   
                        end
                        else if(Master_REQ[0])begin
                            Select_FSM <= FIB_M0;
                        end
                        else if(Master_REQ[2])begin
                            Select_FSM <= FIB_M2;
                        end
                        else if(Master_REQ[3])begin
                            Select_FSM <= FIB_M3;
                        end
                     end
            FIB_M2  :begin
                        if(Master_REQ[2])begin
                            Select_FSM <= Select_FSM;   
                        end
                        else if(Master_REQ[0])begin
                            Select_FSM <= FIB_M0;
                        end
                        else if(Master_REQ[1])begin
                            Select_FSM <= FIB_M1;
                        end
                        else if(Master_REQ[3])begin
                            Select_FSM <= FIB_M3;
                        end
                     end
            FIB_M3  :begin
                        if(Master_REQ[3])begin
                            Select_FSM <= Select_FSM;   
                        end
                        else if(Master_REQ[0])begin
                            Select_FSM <= FIB_M0;
                        end
                        else if(Master_REQ[1])begin
                            Select_FSM <= FIB_M1;
                        end
                        else if(Master_REQ[2])begin
                            Select_FSM <= FIB_M2;
                        end
                     end
            FIB_IDLE:begin
                        if(Master_REQ[0])begin
                            Select_FSM <= FIB_M0;   
                        end
                        else if(Master_REQ[1])begin
                            Select_FSM <= FIB_M1;
                        end
                        else if(Master_REQ[2])begin
                            Select_FSM <= FIB_M2;
                        end
                        else if(Master_REQ[3])begin
                            Select_FSM <= FIB_M3;
                        end
                     end
            default :begin
                        if(Master_REQ[0])begin
                            Select_FSM <= FIB_M0;   
                        end
                        else if(Master_REQ[1])begin
                            Select_FSM <= FIB_M1;
                        end
                        else if(Master_REQ[2])begin
                            Select_FSM <= FIB_M2;
                        end
                        else if(Master_REQ[3])begin
                            Select_FSM <= FIB_M3;
                        end
                     end
        endcase
    end
end
always@(*)begin
    case(Select_FSM)
        FIB_IDLE :begin
                    if(Master_REQ[0])begin
                        Master_ACK = 4'b0001;
                    end
                    else if(Master_REQ[1])begin
                        Master_ACK = 4'b0010;
                    end
                    else if(Master_REQ[2])begin
                        Master_ACK = 4'b0100;
                    end
                    else if(Master_REQ[3])begin
                        Master_ACK = 4'b1000;
                    end
                    else begin
                        Master_ACK = 4'b0000;
                    end
                  end
        FIB_M0   :begin
                    if(Master_REQ[0])begin
                        Master_ACK = 4'b0001;
                    end
                    else if(Master_REQ[1])begin
                        Master_ACK = 4'b0010;
                    end
                    else if(Master_REQ[2])begin
                        Master_ACK = 4'b0100;
                    end
                    else if(Master_REQ[3])begin
                        Master_ACK = 4'b1000;
                    end
                    else begin
                        Master_ACK = 4'b0000;
                    end
                  end
        FIB_M1   :begin
                    if(Master_REQ[1])begin
                        Master_ACK = 4'b0010;
                    end
                    else if(Master_REQ[0])begin
                        Master_ACK = 4'b0001;
                    end
                    else if(Master_REQ[2])begin
                        Master_ACK = 4'b0100;
                    end
                    else if(Master_REQ[3])begin
                        Master_ACK = 4'b1000;
                    end
                    else begin
                        Master_ACK = 4'b0000;
                    end
                  end
        FIB_M2   :begin
                    if(Master_REQ[2])begin
                        Master_ACK = 4'b0100;
                    end
                    else if(Master_REQ[0])begin
                        Master_ACK = 4'b0001;
                    end
                    else if(Master_REQ[1])begin
                        Master_ACK = 4'b0010;
                    end
                    else if(Master_REQ[3])begin
                        Master_ACK = 4'b1000;
                    end
                    else begin
                        Master_ACK = 4'b0000;
                    end
                  end
        FIB_M3   :begin
                    if(Master_REQ[3])begin
                        Master_ACK = 4'b1000;
                    end
                    else if(Master_REQ[0])begin
                        Master_ACK = 4'b0001;
                    end
                    else if(Master_REQ[1])begin
                        Master_ACK = 4'b0010;
                    end
                    else if(Master_REQ[2])begin
                        Master_ACK = 4'b0100;
                    end
                    else begin
                        Master_ACK = 4'b0000;
                    end
                  end
        default  : Master_ACK = 4'b0000;
    endcase
end

endmodule


















module ysyx_210152_FIB2AXI #(
	parameter AXI_ID_WIDTH 	= 8,
	parameter AXI_ADDR_WID  = 32,
	parameter AXI_AXCACHE 	= 4'd0,
	parameter AXI_AXPROT  	= 3'd0,
	parameter AXI_AXQOS		= 4'd0,
	parameter AXI_AXREGION	= 4'd0
)
(
    input  wire             		CLKi,
    input  wire             		RSTi,

    output  reg             		FIBo_ACK,         
    input  wire             		FIBi_V,           
    input  wire [7:0]       		FIBi_ID,
    input  wire [7:0]       		FIBi_CMD,
    input  wire [3:0]       		FIBi_BURST,
    input  wire [3:0]       		FIBi_SIZE,
    input  wire [`YSYX210152_PADR-1:0] 		FIBi_ADDR,      
    input  wire [`YSYX210152_XLEN-1:0] 		FIBi_DATA,
    
    output  reg [7:0]       		FIBo_ID,
    output  reg [7:0]       		FIBo_RPL,			
    output  reg             		FIBo_WREN,
    input  wire             		FIBi_FULL,         

    output  reg [`YSYX210152_XLEN-1:0] 		FIBo_DATA,

    
    
    
    
    
    
    
    
    
	
    output  reg [`YSYX210152_PADR-1:0] 		FIBo_SFRi_ADDR,
    output  reg [`YSYX210152_XLEN-1:0] 		FIBo_SFRi_DATA,
    output  reg             		FIBo_SFRi_CS,            
    output  reg             		FIBo_SFRi_WR,            
    input  wire [`YSYX210152_XLEN-1:0] 		FIBi_SFRo_DATA,


    output reg [AXI_ID_WIDTH-1:0]  	FIBo_AXI_awid,
    output reg [`YSYX210152_PADR-1:0]    		FIBo_AXI_awaddr,
    output reg [7:0]               	FIBo_AXI_awlen,
    output reg [2:0]               	FIBo_AXI_awsize,
    output reg [1:0]               	FIBo_AXI_awburst,






    output reg                     	FIBo_AXI_awvalid,
    input  wire                     FIBi_AXI_awready,

    output reg [`YSYX210152_XLEN-1:0]  		FIBo_AXI_wdata,
    output reg [7:0]  				FIBo_AXI_wstrb,
    output reg                     	FIBo_AXI_wlast,

    output reg                     	FIBo_AXI_wvalid,
    input  wire                     FIBi_AXI_wready,

    input  wire [AXI_ID_WIDTH-1:0]  FIBi_AXI_bid,
    input  wire [1:0]               FIBi_AXI_bresp,

    input  wire                     FIBi_AXI_bvalid,
    output wire                     FIBo_AXI_bready,

    output reg [AXI_ID_WIDTH-1:0]   FIBo_AXI_arid,
    output reg [`YSYX210152_PADR-1:0]    		FIBo_AXI_araddr,
    output reg [7:0]               	FIBo_AXI_arlen,
    output reg [2:0]               	FIBo_AXI_arsize,
    output reg [1:0]               	FIBo_AXI_arburst,






    output reg                     	FIBo_AXI_arvalid,
    input  wire                     FIBi_AXI_arready,

    input  wire [AXI_ID_WIDTH-1:0]  FIBi_AXI_rid,
    input  wire [`YSYX210152_XLEN-1:0]  		FIBi_AXI_rdata,
    input  wire [1:0]               FIBi_AXI_rresp,
    input  wire                     FIBi_AXI_rlast,

    input  wire                     FIBi_AXI_rvalid,
    output wire                     FIBo_AXI_rready
);







	wire 							op_NOOP;					
	wire 							op_SIGR;					
	wire 							op_SIGW;					
	wire 							op_SEQR;					
	wire 							op_SEQW;					
	wire 							op_WAPR;					
	wire 							op_WAPW;					
	wire 							op_AMOR;					
	wire 							op_AMOW;					
	wire 							op_SEQE;					
	wire 							op_LR;
	wire 							op_SC;
	wire 							op_AMOSWAP;
	wire 							op_AMOADD;
	wire 							op_AMOXOR;
	wire 							op_AMOAND;
	wire 							op_AMOOR;
	wire 							op_AMOMIN;
	wire 							op_AMOMAX;
	wire 							op_AMOMINU;
	wire 							op_AMOMAXU;
	wire 							op_DEC_ERR;				
	






	reg 		[4:0] 				FIB_state;
	
	localparam IDLE_s 					= 5'd0;								
	localparam SFR_W_s 					= 5'd1;								
	localparam SFR_R_s 					= 5'd2;								
	localparam SFR_B_s 					= 5'd3;								
	localparam GENERAL_W_WA_S 			= 5'd4;								
	localparam GENERAL_W_WD_S 			= 5'd5;
	localparam GENERAL_W_B_S 			= 5'd6;	
										  
	localparam GENERAL_R_RA_S 			= 5'd7;								
	localparam GENERAL_R_B_S 			= 5'd8;	
										  
	localparam SEQW_WA_s 				= 5'd9;								
	localparam SEQW_WD_s 				= 5'd10;								
	localparam SEQW_B_s 				= 5'd11;								
	localparam SEQR_RA_s 				= 5'd12;								
	localparam SEQR_B_s 				= 5'd13;								
	localparam AMO_RA_s					= 5'd14;								
	localparam AMO_RB_s					= 5'd15;								
	localparam AMO_WA_s					= 5'd16;								
	localparam AMO_WD_s					= 5'd17;								
	localparam AMO_WB_s					= 5'd18;								
	
	localparam DEC_ERR_s				= 5'd19;								


	wire 						FIB_RA_access;				
	wire 						FIB_WA_access;				
	wire 						FIB_WD_access;				
	

	reg 	[7:0] 				FIBo_AXI_axlen_tem;
	wire 	[1:0] 				FIBo_AXI_axburst_tem;
	wire 						FIBo_AXI_axlock_tem;
	reg 	[7:0] 				AXI_WSTRB;					
	

	reg 						FIBo_WREN_ready;
	
	reg 	[7:0] 				AXI_BRPL;					
	reg 	[7:0] 				AXI_RRPL;					



	reg		[AXI_ID_WIDTH-1:0]	SFR_ID_reg;
	
	


	reg 	[`YSYX210152_XLEN-1:0]			AMO_bo_data;
	reg 	[2:0]				AMO_bo_awsize;
	reg 	[`YSYX210152_XLEN-1:0]			AMO_bo_awaddr;
	reg 	[7:0]				AMO_bo_wstrb;	
	reg 	[8:0]				AMO_bo_CMD;
	reg 	[AXI_ID_WIDTH-1:0]	AMO_bo_ID;
	reg 						AMO_bo_valid;



	reg 	[`YSYX210152_XLEN-1:0]			AMO_ao_data;
	reg 						AMO_ao_valid;



    reg 	[AXI_ID_WIDTH-1:0]  AMO_Feedback_ID;
    reg 	[`YSYX210152_XLEN-1:0] 	    AMO_Feedback_data;
	reg							AMO_Feedback_valid;

	

	reg 	[`YSYX210152_XLEN-1:0]			AMO_TX_data;
	reg 	[2:0]				AMO_TX_awsize;
	reg 	[`YSYX210152_XLEN-1:0]			AMO_TX_awaddr;
	reg 	[7:0]				AMO_TX_wstrb;		
	reg 	[AXI_ID_WIDTH-1:0]	AMO_TX_ID;
	reg 						AMO_TX_valid;



	reg							LR_sent_flag;
	reg 	[AXI_ID_WIDTH-1:0]	LR_sent_ID;



	reg							SC_sent_flag;
	reg 	[AXI_ID_WIDTH-1:0]	SC_sent_ID;

	


	wire 	[`YSYX210152_XLEN-1:0]  		sourse1;				
	wire 	[`YSYX210152_XLEN-1:0]  		sourse2;				
	

	reg 						sourse1_Symbol;			
	reg 						sourse2_Symbol;			


	wire 	[`YSYX210152_XLEN-1:0]			result1;				
	wire 	[`YSYX210152_XLEN-1:0]			result2;				
	wire 	[`YSYX210152_XLEN-1:0]			data_AMOSWAP;
	wire 	[`YSYX210152_XLEN-1:0]			data_AMOADD;
	wire 	[`YSYX210152_XLEN-1:0]			data_AMOXOR;
	wire 	[`YSYX210152_XLEN-1:0]			data_AMOAND;
	wire 	[`YSYX210152_XLEN-1:0]			data_AMOOR;
	wire 	[`YSYX210152_XLEN-1:0]			data_AMOMIN;
	wire 	[`YSYX210152_XLEN-1:0]			data_AMOMAX;
	wire 	[`YSYX210152_XLEN-1:0]			data_AMOMINU;
	wire 	[`YSYX210152_XLEN-1:0]			data_AMOMAXU;	
	





assign op_NOOP 		= (FIBi_CMD == `YSYX210152_FIB_CMD_NOOP) 	? 1'b1 : 1'b0;
assign op_SIGR 		= (FIBi_CMD == `YSYX210152_FIB_CMD_SIGR) 	? 1'b1 : 1'b0;
assign op_SIGW 		= (FIBi_CMD == `YSYX210152_FIB_CMD_SIGW) 	? 1'b1 : 1'b0;
assign op_SEQR 		= (FIBi_CMD == `YSYX210152_FIB_CMD_SEQR) 	? 1'b1 : 1'b0;
assign op_SEQW 		= (FIBi_CMD == `YSYX210152_FIB_CMD_SEQW) 	? 1'b1 : 1'b0;
assign op_WAPR 		= (FIBi_CMD == `YSYX210152_FIB_CMD_WAPR) 	? 1'b1 : 1'b0;
assign op_WAPW 		= (FIBi_CMD == `YSYX210152_FIB_CMD_WAPW) 	? 1'b1 : 1'b0;
assign op_AMOR 		= (FIBi_CMD == `YSYX210152_FIB_CMD_AMOR) 	? 1'b1 : 1'b0;
assign op_AMOW 		= (FIBi_CMD == `YSYX210152_FIB_CMD_AMOW) 	? 1'b1 : 1'b0;
assign op_SEQE 		= (FIBi_CMD == `YSYX210152_FIB_CMD_SEQE) 	? 1'b1 : 1'b0;
assign op_LR 		= (FIBi_CMD == `YSYX210152_FIB_CMD_LR) 	? 1'b1 : 1'b0;
assign op_SC 		= (FIBi_CMD == `YSYX210152_FIB_CMD_SC) 	? 1'b1 : 1'b0;
assign op_AMOSWAP 	= (FIBi_CMD == `YSYX210152_FIB_CMD_AMOSWAP)? 1'b1 : 1'b0;
assign op_AMOADD 	= (FIBi_CMD == `YSYX210152_FIB_CMD_AMOADD) ? 1'b1 : 1'b0;
assign op_AMOXOR 	= (FIBi_CMD == `YSYX210152_FIB_CMD_AMOXOR) ? 1'b1 : 1'b0;
assign op_AMOAND 	= (FIBi_CMD == `YSYX210152_FIB_CMD_AMOAND) ? 1'b1 : 1'b0;
assign op_AMOOR 	= (FIBi_CMD == `YSYX210152_FIB_CMD_AMOOR) 	? 1'b1 : 1'b0;
assign op_AMOMIN 	= (FIBi_CMD == `YSYX210152_FIB_CMD_MIN) 	? 1'b1 : 1'b0;
assign op_AMOMAX 	= (FIBi_CMD == `YSYX210152_FIB_CMD_MAX) 	? 1'b1 : 1'b0;
assign op_AMOMINU 	= (FIBi_CMD == `YSYX210152_FIB_CMD_MINU) 	? 1'b1 : 1'b0;
assign op_AMOMAXU 	= (FIBi_CMD == `YSYX210152_FIB_CMD_MAXU) 	? 1'b1 : 1'b0;

assign op_DEC_ERR = (!(op_NOOP|op_SIGR|op_SIGW|op_SEQR|op_SEQW|op_WAPR|op_WAPW|op_AMOR|op_AMOW|op_SEQE|op_LR|op_SC|op_AMOSWAP|op_AMOADD|op_AMOXOR|op_AMOAND|op_AMOOR|op_AMOMIN|op_AMOMAX|op_AMOMINU|op_AMOMAXU)) ? 1'b1 : 1'b0; 







always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin
		FIB_state <= IDLE_s;

		end
	else begin
		case(FIB_state) 
			IDLE_s 			: begin
								if(FIBi_V && !FIBi_FULL) begin
									if(op_SIGW & (FIBi_ADDR & `YSYX210152_SFR_ADDR_MASK) == `YSYX210152_SFR_ADDR_SEG) begin
										FIB_state <= SFR_W_s;

										end
									else if(op_SIGR & (FIBi_ADDR & `YSYX210152_SFR_ADDR_MASK) == `YSYX210152_SFR_ADDR_SEG) begin
										FIB_state <= SFR_R_s;

										end
									else if(op_SIGW|op_AMOW|op_SC|op_WAPW) begin
										FIB_state <= GENERAL_W_WA_S;

										end
									else if(op_SIGR|op_WAPR|op_AMOR|op_LR) begin
										FIB_state <= GENERAL_R_RA_S;

										end
									else if(op_SEQR) begin
										FIB_state <= SEQR_RA_s;

										end
									else if(op_SEQW) begin
										FIB_state <= SEQW_WA_s;

										end
									else if(op_AMOSWAP|op_AMOADD|op_AMOXOR|op_AMOAND|op_AMOOR|op_AMOMIN|op_AMOMAX|op_AMOMINU|op_AMOMAXU) begin
										FIB_state <= AMO_RA_s;

										end
									else if(op_DEC_ERR) begin
										FIB_state <= DEC_ERR_s;

										end
									else begin
										FIB_state <= IDLE_s;

										end
									end
								else begin
									FIB_state <= FIB_state;
									end
								end
			SFR_W_s			:begin
								FIB_state <= SFR_B_s;

								end									
			SFR_R_s			:begin
								FIB_state <= SFR_B_s;

								end	
			SFR_B_s			:begin
								FIB_state <= IDLE_s;

								end								
			GENERAL_W_WA_S	:begin
								if(FIBi_AXI_awready) begin
									FIB_state <= GENERAL_W_WD_S;
									end
								else begin
									FIB_state <= FIB_state;
									end
								end
			GENERAL_W_WD_S	:begin
									FIB_state <= GENERAL_W_B_S;
								end
			GENERAL_W_B_S	:begin 
								if(FIBi_AXI_bvalid & FIBo_WREN_ready) begin
									FIB_state <= IDLE_s;

									end
								else begin
									FIB_state <= FIB_state;
									end
								end
			GENERAL_R_RA_S	:begin
									FIB_state <= GENERAL_R_B_S;
								end
			GENERAL_R_B_S	:begin 
								if(FIBi_AXI_rvalid & FIBo_WREN_ready) begin
									FIB_state <= IDLE_s;

									end
								else begin
									FIB_state <= FIB_state;
									end
								end
			SEQW_WA_s		:begin
								if(FIBi_AXI_awready) begin
									FIB_state <= SEQW_WD_s;
									end	
								else begin
									FIB_state <= FIB_state;
									end
								end
			SEQW_WD_s		:begin
								if(FIBo_AXI_wvalid & FIBi_AXI_wready) begin
									if(op_SEQE) begin
										FIB_state <= SEQW_B_s;

										end
									else begin
										FIB_state <= FIB_state;
										end
									end
								else begin
									FIB_state <= FIB_state;
									end
								end
			SEQW_B_s		:begin 
								if(FIBi_AXI_bvalid & FIBo_WREN_ready) begin
									FIB_state <= IDLE_s;

									end
								else begin
									FIB_state <= FIB_state;
									end
								end
			SEQR_RA_s		:begin
									FIB_state <= SEQR_B_s;
								end	
			SEQR_B_s		:begin 
								if(FIBi_AXI_rvalid & FIBi_AXI_rlast & FIBo_WREN_ready) begin
									FIB_state <= IDLE_s;

									end
								else begin
									FIB_state <= FIB_state;
									end
								end
			AMO_RA_s		:begin
									FIB_state <= AMO_RB_s;
								end	
			AMO_RB_s		:begin
								if(AMO_TX_valid) begin
									FIB_state <= AMO_WA_s;		

									end	
								else begin
									FIB_state <= FIB_state;
									end
								end
			AMO_WA_s		:begin
								if(FIBi_AXI_awready) begin
									FIB_state <= AMO_WD_s;
									end
								else begin
									FIB_state <= FIB_state;
									end
								end	
			AMO_WD_s		:begin
									FIB_state <= AMO_WB_s;
								end	
			AMO_WB_s		:begin 
								if(FIBi_AXI_bvalid & FIBo_WREN_ready) begin
									FIB_state <= IDLE_s;

									end
								else begin
									FIB_state <= FIB_state;
									end
								end
			DEC_ERR_s		:begin 
								FIB_state <= IDLE_s;

								end
			default			:begin
								FIB_state <= IDLE_s;

								end
		endcase
		end
	end





assign FIB_RA_access = (FIB_state == IDLE_s && ((op_SIGR && ((FIBi_ADDR & `YSYX210152_SFR_ADDR_MASK) != `YSYX210152_SFR_ADDR_SEG))|op_WAPR|op_AMOR|op_LR|op_SEQR|op_AMOSWAP|op_AMOADD|op_AMOXOR|op_AMOAND|op_AMOOR|op_AMOMIN|op_AMOMAX|op_AMOMINU|op_AMOMAXU));
assign FIB_WA_access = (FIB_state == IDLE_s && ((op_SIGW && ((FIBi_ADDR & `YSYX210152_SFR_ADDR_MASK) != `YSYX210152_SFR_ADDR_SEG))|op_AMOW|op_SC|op_WAPW|op_SEQW));
assign FIB_WD_access = (FIB_state == GENERAL_W_WD_S || FIB_state == SEQW_WD_s);
	



always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin
		LR_sent_flag 		<= 'd0;
		LR_sent_ID  		<= 'd0;
		end
	else if(FIBi_V) begin
		if(op_LR) begin
			LR_sent_flag 	<= FIBi_V;
			LR_sent_ID  	<= FIBi_ID;

			end
		else if(op_SC && FIB_state == IDLE_s ) begin
			LR_sent_flag 	<= 'd0;
			LR_sent_ID  	<= 'd0;

			end	
		else begin
			LR_sent_flag 	<= LR_sent_flag;
			LR_sent_ID  	<= LR_sent_ID;
			end	
		end
	else begin
		LR_sent_flag 	<= LR_sent_flag;
		LR_sent_ID  	<= LR_sent_ID;
		end	
	end


always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin
		SC_sent_flag 		<= 'd0;
		SC_sent_ID  		<= 'd0;
		end
	else if(FIBi_V) begin
		if(op_SC) begin
			SC_sent_flag 	<= FIBi_V;
			SC_sent_ID  	<= FIBi_ID;

			end
		else if(FIBi_AXI_bvalid && SC_sent_flag) begin
			SC_sent_flag 	<= 'd0;
			SC_sent_ID  	<= 'd0;

			end	
		else begin
			SC_sent_flag 	<= SC_sent_flag;
			SC_sent_ID  	<= SC_sent_ID;
			end	
		end
	else begin
		SC_sent_flag 	<= SC_sent_flag;
		SC_sent_ID  	<= SC_sent_ID;
		end	
	end	
	




always@(*) begin
	case(FIBi_BURST[3:0]) 
		4'd0 	: begin FIBo_AXI_axlen_tem = 8'b00000000; end
		4'd1 	: begin FIBo_AXI_axlen_tem = 8'b00000001; end
		4'd2 	: begin FIBo_AXI_axlen_tem = 8'b00000011; end
		4'd3 	: begin FIBo_AXI_axlen_tem = 8'b00000111; end
		4'd4 	: begin FIBo_AXI_axlen_tem = 8'b00001111; end
		4'd5 	: begin FIBo_AXI_axlen_tem = 8'b00011111; end
		4'd6 	: begin FIBo_AXI_axlen_tem = 8'b00111111; end
		4'd7 	: begin FIBo_AXI_axlen_tem = 8'b01111111; end
		4'd8 	: begin FIBo_AXI_axlen_tem = 8'b11111111; end
		default : begin FIBo_AXI_axlen_tem = 8'b00000000; end
	endcase
	end


assign FIBo_AXI_axburst_tem = (op_WAPR | op_WAPW) ?  2'b10 : 2'b01;  


assign FIBo_AXI_axlock_tem = (op_LR | op_SC) ? 1'b1 : 1'b0;


always@(*) begin
	case(FIBi_SIZE)
		4'd0	: begin
					case(FIBi_ADDR[2:0])
						3'd0	: begin AXI_WSTRB = 8'b00000001; end
						3'd1	: begin AXI_WSTRB = 8'b00000010; end
						3'd2	: begin AXI_WSTRB = 8'b00000100; end
						3'd3	: begin AXI_WSTRB = 8'b00001000; end
						3'd4	: begin AXI_WSTRB = 8'b00010000; end
						3'd5	: begin AXI_WSTRB = 8'b00100000; end
						3'd6	: begin AXI_WSTRB = 8'b01000000; end
						3'd7	: begin AXI_WSTRB = 8'b10000000; end
						default	: begin AXI_WSTRB = 8'b00000000; end
					endcase
					end
		4'd1	: begin 
					case(FIBi_ADDR[2:1]) 
						2'd0	: begin AXI_WSTRB = 8'b00000011; end
						2'd1	: begin AXI_WSTRB = 8'b00001100; end
						2'd2	: begin AXI_WSTRB = 8'b00110000; end
						2'd3	: begin AXI_WSTRB = 8'b11000000; end
						default	: begin AXI_WSTRB = 8'b00000000; end
					endcase
					end
		4'd2	: begin
					case(FIBi_ADDR[2])
						1'b0	: begin AXI_WSTRB = 8'b00001111; end
						1'b1	: begin AXI_WSTRB = 8'b11110000; end
						default	: begin AXI_WSTRB = 8'b00000000; end
					endcase
					end
		4'd3	: begin AXI_WSTRB = 8'b11111111; end
		default	: begin AXI_WSTRB = 8'b00000000; end
	endcase
	end	




always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin      
		AMO_bo_data     <=  'd0;
		AMO_bo_awsize	<=  'd0;
		AMO_bo_awaddr   <=  'd0;
		AMO_bo_wstrb    <=  'd0;
		AMO_bo_CMD      <=  'd0;
		AMO_bo_ID       <=  'd0;
		AMO_bo_valid    <=  'd0;
		end
	else if(AMO_bo_valid && !AMO_ao_valid ) begin
		AMO_bo_data     <=  AMO_bo_data;
		AMO_bo_awsize	<=  AMO_bo_awsize;
		AMO_bo_awaddr   <=  AMO_bo_awaddr;
		AMO_bo_wstrb    <=  AMO_bo_wstrb;
		AMO_bo_CMD      <=  AMO_bo_CMD;
		AMO_bo_ID       <=  AMO_bo_ID;
		AMO_bo_valid    <=  AMO_bo_valid;
		end		
	else if(FIBi_V & (op_AMOSWAP|op_AMOADD|op_AMOXOR|op_AMOAND|op_AMOOR|op_AMOMIN|op_AMOMAX|op_AMOMINU|op_AMOMAXU)) begin
		AMO_bo_data     <=  FIBi_DATA;
		AMO_bo_awsize	<=  FIBi_SIZE[2:0];
		AMO_bo_awaddr   <=  FIBi_ADDR;
		AMO_bo_wstrb    <=  AXI_WSTRB;
		AMO_bo_CMD      <=  {op_AMOSWAP,op_AMOADD,op_AMOXOR,op_AMOAND,op_AMOOR,op_AMOMIN,op_AMOMAX,op_AMOMINU,op_AMOMAXU};
		AMO_bo_ID       <=  FIBi_ID;
		AMO_bo_valid    <=  FIBi_V;
		end	
	else begin
		AMO_bo_data     <=  'd0;
		AMO_bo_awsize	<=  'd0;
		AMO_bo_awaddr   <=  'd0;
		AMO_bo_wstrb    <=  'd0;
		AMO_bo_CMD      <=  'd0;
		AMO_bo_ID       <=  'd0;
		AMO_bo_valid    <=  'd0;
		end
	end
	



always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin
		AMO_ao_data		<= 'd0;
		AMO_ao_valid	<= 'd0;
		end	
	else if(FIBi_AXI_rvalid && FIB_state == AMO_RB_s && FIBi_AXI_rresp == 2'b00) begin
		AMO_ao_data		<= FIBi_AXI_rdata;
		AMO_ao_valid	<= FIBi_AXI_rvalid;
		end
	else begin
		AMO_ao_data		<= 'd0;
		AMO_ao_valid	<= 'd0;
		end
	end




/*
由于AMO操作的位数是不确定的，有可能不足64位，在这中情况下，有效数据在AXI数据总线中的位置也是不确定的，在AMO操作时要特殊的处理
除去有符号的比大小，其他的操作可以通过strb对数据进行掩码后无脑的进行操作
有符号数的比大小，先通过地址来判断符号位的位置，再无脑的比大小就可以
*/

assign sourse1 = {((AMO_bo_wstrb[7])? AMO_bo_data[63:56]:8'd0),((AMO_bo_wstrb[6])? AMO_bo_data[55:48]:8'd0),((AMO_bo_wstrb[5])? AMO_bo_data[47:40]:8'd0),((AMO_bo_wstrb[4])? AMO_bo_data[39:32] :8'd0),
				  ((AMO_bo_wstrb[3])? AMO_bo_data[31:24]:8'd0),((AMO_bo_wstrb[2])? AMO_bo_data[23:16]:8'd0),((AMO_bo_wstrb[1])? AMO_bo_data[15:8] :8'd0),((AMO_bo_wstrb[0]) ? AMO_bo_data[7:0]	:8'd0)};
assign sourse2 = {((AMO_bo_wstrb[7])? AMO_ao_data[63:56]:8'd0),((AMO_bo_wstrb[6])? AMO_ao_data[55:48]:8'd0),((AMO_bo_wstrb[5])? AMO_ao_data[47:40]:8'd0),((AMO_bo_wstrb[4])? AMO_ao_data[39:32] :8'd0),
				  ((AMO_bo_wstrb[3])? AMO_ao_data[31:24]:8'd0),((AMO_bo_wstrb[2])? AMO_ao_data[23:16]:8'd0),((AMO_bo_wstrb[1])? AMO_ao_data[15:8] :8'd0),((AMO_bo_wstrb[0]) ? AMO_ao_data[7:0]	:8'd0)};



always@(*) begin
	case(AMO_bo_awsize)
		3'd3	: begin
					case(AMO_bo_awaddr[2:0])
						3'd0	: begin sourse1_Symbol = sourse1[7]; end
						3'd1	: begin sourse1_Symbol = sourse1[15]; end
						3'd2	: begin sourse1_Symbol = sourse1[23]; end
						3'd3	: begin sourse1_Symbol = sourse1[31]; end
						3'd4	: begin sourse1_Symbol = sourse1[39]; end
						3'd5	: begin sourse1_Symbol = sourse1[47]; end
						3'd6	: begin sourse1_Symbol = sourse1[55]; end
						3'd7	: begin sourse1_Symbol = sourse1[63]; end
						default	: begin sourse1_Symbol = 1'b0; end
					endcase
					end
		3'd4	: begin 
					case(AMO_bo_awaddr[2:1]) 
						2'd0	: begin sourse1_Symbol = sourse1[15]; end
						2'd1	: begin sourse1_Symbol = sourse1[31]; end
						2'd2	: begin sourse1_Symbol = sourse1[47]; end
						2'd3	: begin sourse1_Symbol = sourse1[63]; end
						default	: begin sourse1_Symbol = 1'b0; end
					endcase
					end
		3'd5	: begin
					case(AMO_bo_awaddr[2])
						1'b0	: begin sourse1_Symbol = sourse1[31]; end
						1'b1	: begin sourse1_Symbol = sourse1[63]; end
						default	: begin sourse1_Symbol = 1'b0; end
					endcase
					end
		3'd6	: begin sourse1_Symbol = sourse1[63]; end
		default	: begin sourse1_Symbol = 1'b0; end
	endcase
	end	
	
always@(*) begin
	case(AMO_bo_awsize)
		3'd3	: begin
					case(AMO_bo_awaddr[2:0])
						3'd0	: begin sourse2_Symbol = sourse2[7]; end
						3'd1	: begin sourse2_Symbol = sourse2[15]; end
						3'd2	: begin sourse2_Symbol = sourse2[23]; end
						3'd3	: begin sourse2_Symbol = sourse2[31]; end
						3'd4	: begin sourse2_Symbol = sourse2[39]; end
						3'd5	: begin sourse2_Symbol = sourse2[47]; end
						3'd6	: begin sourse2_Symbol = sourse2[55]; end
						3'd7	: begin sourse2_Symbol = sourse2[63]; end
						default	: begin sourse2_Symbol = 1'b0; end
					endcase
					end
		3'd4	: begin 
					case(AMO_bo_awaddr[2:1]) 
						2'd0	: begin sourse2_Symbol = sourse2[15]; end
						2'd1	: begin sourse2_Symbol = sourse2[31]; end
						2'd2	: begin sourse2_Symbol = sourse2[47]; end
						2'd3	: begin sourse2_Symbol = sourse2[63]; end
						default	: begin sourse2_Symbol = 1'b0; end
					endcase
					end
		3'd5	: begin
					case(AMO_bo_awaddr[2])
						1'b0	: begin sourse2_Symbol = sourse2[31]; end
						1'b1	: begin sourse2_Symbol = sourse2[63]; end
						default	: begin sourse2_Symbol = 1'b0; end
					endcase
					end
		3'd6	: begin sourse2_Symbol = sourse2[63]; end
		default	: begin sourse2_Symbol = 1'b0; end
	endcase
	end	



assign data_AMOSWAP = sourse1;
assign data_AMOADD = sourse1 + sourse2;
assign data_AMOXOR =  sourse1 ^ sourse2;
assign data_AMOAND = sourse1 & sourse2;
assign data_AMOOR =  sourse1 | sourse2;
assign data_AMOMIN = ((sourse1_Symbol & !sourse2_Symbol) || (sourse1_Symbol == sourse2_Symbol && sourse1 < sourse2)) ? sourse1 : sourse2;
assign data_AMOMAX = ((sourse1_Symbol & !sourse2_Symbol) || (sourse1_Symbol == sourse2_Symbol && sourse1 < sourse2)) ? sourse2 : sourse1;
assign data_AMOMINU = (sourse1 < sourse2) ? sourse1 : sourse2;
assign data_AMOMAXU = (sourse1 < sourse2) ? sourse2 : sourse1;

assign result1 = (AMO_bo_CMD[8]   ? data_AMOSWAP : {`YSYX210152_XLEN{1'b0}}) |
				 (AMO_bo_CMD[7]   ? data_AMOADD  : {`YSYX210152_XLEN{1'b0}}) |
				 (AMO_bo_CMD[6]   ? data_AMOXOR  : {`YSYX210152_XLEN{1'b0}}) |
				 (AMO_bo_CMD[5]   ? data_AMOAND  : {`YSYX210152_XLEN{1'b0}}) |
				 (AMO_bo_CMD[4]   ? data_AMOOR   : {`YSYX210152_XLEN{1'b0}}) |
				 (AMO_bo_CMD[3]   ? data_AMOMIN  : {`YSYX210152_XLEN{1'b0}}) |
				 (AMO_bo_CMD[2]   ? data_AMOMAX  : {`YSYX210152_XLEN{1'b0}}) |
				 (AMO_bo_CMD[1]   ? data_AMOMINU : {`YSYX210152_XLEN{1'b0}}) |
				 (AMO_bo_CMD[0]   ? data_AMOMAXU : {`YSYX210152_XLEN{1'b0}}) ;

assign result2 = sourse2;




always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin
		AMO_Feedback_ID 	<= 'd0;
		AMO_Feedback_data	<= 'd0;
		AMO_Feedback_valid	<= 'd0;
		end
	else if(AMO_ao_valid) begin
		AMO_Feedback_ID 	<= AMO_bo_ID;
		AMO_Feedback_data	<= result2;
		AMO_Feedback_valid	<= AMO_ao_valid;
		end		
	else begin
		AMO_Feedback_ID 	<= AMO_Feedback_ID;
		AMO_Feedback_data	<= AMO_Feedback_data;
		AMO_Feedback_valid	<= AMO_Feedback_valid;
		end	
	end
	




always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin
		AMO_TX_data		<= 'd0;
		AMO_TX_awsize	<= 'd0;
		AMO_TX_awaddr	<= 'd0;
		AMO_TX_wstrb	<= 'd0;
		AMO_TX_ID		<= 'd0;
		AMO_TX_valid	<= 'd0;
		end
	else if(AMO_ao_valid) begin
		AMO_TX_data		<= result1;
		AMO_TX_awsize	<= AMO_bo_awsize;
		AMO_TX_awaddr	<= AMO_bo_awaddr;
		AMO_TX_wstrb	<= AMO_bo_wstrb;
		AMO_TX_ID		<= AMO_bo_ID;
		AMO_TX_valid	<= AMO_ao_valid;
		end	
	else if(FIB_state == AMO_WD_s)begin
		AMO_TX_data		<= 'd0;
		AMO_TX_awsize	<= 'd0;
		AMO_TX_awaddr	<= 'd0;
		AMO_TX_wstrb	<= 'd0;
		AMO_TX_ID		<= 'd0;
		AMO_TX_valid	<= 'd0;
		end
	else begin
		AMO_TX_data		<= AMO_TX_data;
		AMO_TX_awsize	<= AMO_TX_awsize;
		AMO_TX_awaddr	<= AMO_TX_awaddr;
		AMO_TX_wstrb	<= AMO_TX_wstrb;
		AMO_TX_ID		<= AMO_TX_ID;
		AMO_TX_valid	<= AMO_TX_valid;
		end
	end



always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin
		FIBo_ID 		<= 'd0;
		FIBo_RPL 		<= 'd0;
		FIBo_WREN 		<= 'd0;
		FIBo_DATA    	<= 'd0;
		end
	else if(FIBo_WREN && FIBi_FULL) begin
		FIBo_ID 		<= FIBo_ID;
		FIBo_RPL 		<= FIBo_RPL;
		FIBo_WREN 		<= FIBo_WREN;
		FIBo_DATA    	<= FIBo_DATA;
		end	
	else if(FIB_state == IDLE_s && op_DEC_ERR && FIBi_V) begin
		FIBo_ID 		<= FIBi_ID;
		FIBo_RPL 		<= 8'hf0;
		FIBo_WREN 		<= FIBi_V;
		FIBo_DATA    	<= 'd0;	
		end		
	else if(FIB_state == SFR_R_s || FIB_state == SFR_W_s ) begin
		FIBo_ID 		<= SFR_ID_reg;
		FIBo_RPL 		<= 8'h10;
		FIBo_WREN 		<= 1'b1;
		FIBo_DATA    	<= FIBi_SFRo_DATA;	
		end	
	else if(FIBi_AXI_bvalid) begin
			if(AMO_Feedback_valid && FIB_state == AMO_WB_s) begin
				FIBo_ID 		<= AMO_Feedback_ID;
				FIBo_RPL 		<= AXI_BRPL;
				FIBo_WREN 		<= FIBi_AXI_bvalid;
				FIBo_DATA    	<= AMO_Feedback_data;	
				end
			else begin
				FIBo_ID 		<= FIBi_AXI_bid;
				FIBo_RPL 		<= AXI_BRPL;
				FIBo_WREN 		<= FIBi_AXI_bvalid;
				FIBo_DATA    	<= 'd0;	
				end
			end
	else if(FIBi_AXI_rvalid && FIB_state != AMO_RB_s) begin
		FIBo_ID 		<= FIBi_AXI_rid;
		FIBo_RPL 		<= AXI_RRPL;
		FIBo_WREN 		<= FIBi_AXI_rvalid;
		FIBo_DATA    	<= FIBi_AXI_rdata;	
		end	
	else begin
		FIBo_ID 		<= 'd0;
		FIBo_RPL 		<= 'd0;
		FIBo_WREN 		<= 'd0;
		FIBo_DATA    	<= 'd0;
		end
	end
		

always@(*) begin
	if(FIBi_AXI_rvalid | FIBi_AXI_bvalid) begin
		if(FIBo_WREN && FIBi_FULL) begin
			FIBo_WREN_ready = 1'b0;
			end
		else begin
			FIBo_WREN_ready = 1'b1;
			end
		end
	else begin
		FIBo_WREN_ready = 1'b0;
		end
	end

	

always@(*) begin
	if(FIBi_V & !FIBi_FULL) begin
		case(FIB_state) 
			IDLE_s			: begin
								if(op_NOOP|op_SIGR|(op_SIGW && ((FIBi_ADDR & `YSYX210152_SFR_ADDR_MASK) == `YSYX210152_SFR_ADDR_SEG))|op_SEQR|op_WAPR|op_AMOR|op_LR|op_AMOSWAP|op_AMOADD|op_AMOXOR|op_AMOAND|op_AMOOR|op_AMOMIN|op_AMOMAX|op_AMOMINU|op_AMOMAXU|op_DEC_ERR) begin
									FIBo_ACK = 1'b1;
									end
								else begin
									FIBo_ACK = 1'b0;
									end
								end
			GENERAL_W_WD_S	:begin
								FIBo_ACK = FIBi_AXI_wready;
								end
			SEQW_WD_s		:begin
								FIBo_ACK = FIBi_AXI_wready & ~FIBo_AXI_wlast;
								end
			default			: begin
								FIBo_ACK = 1'b0;
								end
		endcase
		end
	else begin
		FIBo_ACK = 1'b0;
		end
	end





always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin
		FIBo_SFRi_ADDR  <= 'd0;
		FIBo_SFRi_DATA	<= 'd0;
		FIBo_SFRi_CS	<= 'd0;
		FIBo_SFRi_WR	<= 'd0;
		SFR_ID_reg 		<= 'd0;
		end
	else if(FIBi_V && (FIB_state == IDLE_s) && (op_SIGW || op_SIGR) && (FIBi_ADDR & `YSYX210152_SFR_ADDR_MASK) == `YSYX210152_SFR_ADDR_SEG) begin
		FIBo_SFRi_ADDR  <= FIBi_ADDR;
		FIBo_SFRi_DATA	<= FIBi_DATA;
		FIBo_SFRi_CS	<= FIBi_V;
		FIBo_SFRi_WR	<= !op_SIGR;
		SFR_ID_reg 		<= FIBi_ID;
		end
	else begin
		FIBo_SFRi_ADDR  <= 'd0;
		FIBo_SFRi_DATA	<= 'd0;
		FIBo_SFRi_CS	<= 'd0;
		FIBo_SFRi_WR	<= 'd0;
		SFR_ID_reg 		<= 'd0;
		end
	end




always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin
		FIBo_AXI_awid 		<= 'd0;
		FIBo_AXI_awaddr 	<= 'd0;
		FIBo_AXI_awlen 		<= 'd0;
		FIBo_AXI_awsize 	<= 'd0;
		FIBo_AXI_awburst 	<= 'd0;





		FIBo_AXI_awvalid 	<= 'd0;
		end
	else if(FIBo_AXI_awvalid & !FIBi_AXI_awready) begin
		FIBo_AXI_awid 		<= FIBo_AXI_awid;
		FIBo_AXI_awaddr 	<= FIBo_AXI_awaddr;
		FIBo_AXI_awlen 		<= FIBo_AXI_awlen;
		FIBo_AXI_awsize 	<= FIBo_AXI_awsize;
		FIBo_AXI_awburst 	<= FIBo_AXI_awburst;





		FIBo_AXI_awvalid 	<= FIBo_AXI_awvalid;
		end
	else if(FIB_state == AMO_WA_s) begin			
		FIBo_AXI_awid 		<= AMO_TX_ID;
		FIBo_AXI_awaddr 	<= AMO_TX_awaddr;
		FIBo_AXI_awlen 		<= 'd0;
		FIBo_AXI_awsize 	<= AMO_TX_awsize;
		FIBo_AXI_awburst 	<= 2'b01;





		FIBo_AXI_awvalid 	<= AMO_TX_valid;		
		end
	else if(FIB_WA_access) begin				
		FIBo_AXI_awid 		<= FIBi_ID;
		FIBo_AXI_awaddr 	<= FIBi_ADDR;
		FIBo_AXI_awlen 		<= FIBo_AXI_axlen_tem;
		FIBo_AXI_awsize 	<= FIBi_SIZE[2:0];
		FIBo_AXI_awburst 	<= FIBo_AXI_axburst_tem;





		FIBo_AXI_awvalid 	<= FIBi_V;		
		end	
	else begin
		FIBo_AXI_awid 		<= 'd0;
		FIBo_AXI_awaddr 	<= 'd0;
		FIBo_AXI_awlen 		<= 'd0;
		FIBo_AXI_awsize 	<= 'd0;
		FIBo_AXI_awburst 	<= 'd0;





		FIBo_AXI_awvalid 	<= 'd0;
		end
	end


always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin
		FIBo_AXI_wdata 		<= 'd0;
		FIBo_AXI_wstrb 		<= 'd0;
		FIBo_AXI_wlast 		<= 'd0;
		FIBo_AXI_wvalid    	<= 'd0;
		end
	else if(FIBo_AXI_wvalid & !FIBi_AXI_wready) begin
		FIBo_AXI_wdata 		<= FIBo_AXI_wdata;
		FIBo_AXI_wstrb 		<= FIBo_AXI_wstrb;
		FIBo_AXI_wlast 		<= FIBo_AXI_wlast;
		FIBo_AXI_wvalid    	<= FIBo_AXI_wvalid;
		end
	else if(FIB_state == AMO_WD_s) begin
		FIBo_AXI_wdata 		<= AMO_TX_data;
		FIBo_AXI_wstrb 		<= AMO_TX_wstrb;
		FIBo_AXI_wlast 		<= 1'b1;
		FIBo_AXI_wvalid    	<= AMO_TX_valid;
		end
	else if(FIB_WD_access) begin
		FIBo_AXI_wdata 		<= FIBi_DATA;
		FIBo_AXI_wstrb 		<= AXI_WSTRB;
		FIBo_AXI_wlast 		<= op_SIGR|op_SIGW|op_WAPR|op_WAPW|op_AMOR|op_AMOW|op_SEQE|op_LR|op_SC;
		FIBo_AXI_wvalid    	<= 1'b1;
		end
	else begin
		FIBo_AXI_wdata 		<= 'd0;
		FIBo_AXI_wstrb 		<= 'd0;
		FIBo_AXI_wlast 		<= 'd0;
		FIBo_AXI_wvalid    	<= 'd0;
		end
	end




always@(*) begin
	if(SC_sent_flag && FIBi_AXI_bvalid && FIBi_AXI_bid == SC_sent_ID) begin
		if(FIBi_AXI_bresp == 2'b01) begin	
			AXI_BRPL = 8'h10;
			end
		else begin
			AXI_BRPL = 8'hF0;
			end
		end
	else if(FIBi_AXI_bvalid)begin
		if(FIBi_AXI_bresp == 2'b00) begin	
			AXI_BRPL = 8'h10;
			end
		else begin
			AXI_BRPL = 8'hF0;
			end
		end
	else begin
		AXI_BRPL = 'd0;
		end	
	end


assign FIBo_AXI_bready = 1'b1;


always@(posedge CLKi or posedge RSTi) begin
	if(RSTi) begin
		FIBo_AXI_arid 		<= 'd0;
		FIBo_AXI_araddr 	<= 'd0;
		FIBo_AXI_arlen 		<= 'd0;
		FIBo_AXI_arsize 	<= 'd0;
		FIBo_AXI_arburst 	<= 'd0;





		FIBo_AXI_arvalid 	<= 'd0;
		end
	else if(FIBo_AXI_arvalid & !FIBi_AXI_arready) begin
		FIBo_AXI_arid 		<= FIBo_AXI_arid;
		FIBo_AXI_araddr 	<= FIBo_AXI_araddr;
		FIBo_AXI_arlen 		<= FIBo_AXI_arlen;
		FIBo_AXI_arsize 	<= FIBo_AXI_arsize;
		FIBo_AXI_arburst 	<= FIBo_AXI_arburst;





		FIBo_AXI_arvalid 	<= FIBo_AXI_arvalid;
		end
	else if(FIB_RA_access) begin
		FIBo_AXI_arid 		<= FIBi_ID;
		FIBo_AXI_araddr 	<= FIBi_ADDR;
		FIBo_AXI_arlen 		<= FIBo_AXI_axlen_tem;
		FIBo_AXI_arsize 	<= FIBi_SIZE[2:0];
		FIBo_AXI_arburst 	<= FIBo_AXI_axburst_tem;





		FIBo_AXI_arvalid 	<= FIBi_V;		
		end
	else begin
		FIBo_AXI_arid 		<= 'd0;
		FIBo_AXI_araddr 	<= 'd0;
		FIBo_AXI_arlen 		<= 'd0;
		FIBo_AXI_arsize 	<= 'd0;
		FIBo_AXI_arburst 	<= 'd0;





		FIBo_AXI_arvalid 	<= 'd0;
		end
	end




always@(*) begin
	if(FIBi_AXI_rvalid && LR_sent_flag && FIBi_AXI_rid == LR_sent_ID) begin
		if(FIBi_AXI_rresp == 2'b01) begin	
			AXI_RRPL = 8'h10;
			end
		else begin
			AXI_RRPL = 8'hF0;
			end
		end
	else if(FIBi_AXI_rvalid)begin		
		if(FIBi_AXI_rresp == 2'b00) begin	
			if(FIBi_AXI_rlast) begin
				AXI_RRPL = 8'h10;			
				end
			else begin
				AXI_RRPL = 8'h14;			
				end
			end
		else begin
			AXI_RRPL = 8'hF0;
			end
		end
	else begin
		AXI_RRPL = 'd0;
		end
	end

assign FIBo_AXI_rready = FIBo_WREN_ready;


endmodule





/*****************************************************************************************
 *    author : Jack's Team
 *    e-mail : 
 *    date   : 20210726
 *    desc   : Vostok564_top level entry, include PRV564_top and SFR registers
               This project is build by:
               Chen Yuheng
               Huang Junguang
               Hong Xiaoyu
               Liu Dingbang
               Pan Xingyu
               Ying Chengbing
               Zhou Cong
               
 *    version: 0000
 
 __  __                   __           __         
/\ \/\ \                 /\ \__       /\ \        
\ \ \ \ \    ___     ____\ \ ,_\   ___\ \ \/'\    
 \ \ \ \ \  / __`\  /',__\\ \ \/  / __`\ \ , <    
  \ \ \_/ \/\ \L\ \/\__, `\\ \ \_/\ \L\ \ \ \\`\  
   \ `\___/\ \____/\/\____/ \ \__\ \____/\ \_\ \_\
    `\/__/  \/___/  \/___/   \/__/\/___/  \/_/\/_/


    This is a 64bit RISC-V processor

   "I see Earth! It is so beautiful!"
                        —— Yuri Gagarin

**********************************************************************************************/
module ysyx_210152_Vostok564_top
(

    input wire                      clock,   
    input wire                      reset,   

    input wire                      io_interrupt,

    output wire [3:0]               io_master_awid,
    output wire [`YSYX210152_PADR-1:0]    		io_master_awaddr,
    output wire [7:0]               io_master_awlen,
    output wire [2:0]               io_master_awsize,
    output wire [1:0]               io_master_awburst,
    output wire                     io_master_awvalid,
    input  wire                     io_master_awready,

    output wire [`YSYX210152_XLEN-1:0]  		io_master_wdata,
    output wire [7:0]  				io_master_wstrb,
    output wire                     io_master_wlast,
    output wire                     io_master_wvalid,
    input  wire                     io_master_wready,

    input  wire [3:0]               io_master_bid,
    input  wire [1:0]               io_master_bresp,
    input  wire                     io_master_bvalid,
    output wire                     io_master_bready,

    output wire [3:0]               io_master_arid,
    output wire [`YSYX210152_PADR-1:0]    		io_master_araddr,
    output wire [7:0]               io_master_arlen,
    output wire [2:0]               io_master_arsize,
    output wire [1:0]               io_master_arburst,
    output wire                     io_master_arvalid,
    input  wire                     io_master_arready,

    input  wire [3:0]  io_master_rid,
    input  wire [`YSYX210152_XLEN-1:0]  		io_master_rdata,
    input  wire [1:0]               io_master_rresp,
    input  wire                     io_master_rlast,

    input  wire                     io_master_rvalid,
    output wire                     io_master_rready
);
    wire                Core_SRST;                                  

    wire [`YSYX210152_XLEN-1:0]    Kernel_MTIMEi;
    wire                Kernel_MTIi, Kernel_MSIi;                   
    wire                Kernel_SEIi;

    wire                ICache_FIB_WRENo,   DCache_FIB_WRENo;
    wire                ICache_FIB_REQo,    DCache_FIB_REQo;
    reg                 ICache_FIB_ACKi,    DCache_FIB_ACKi;
    wire [7:0]          ICache_FIB_IDo,     DCache_FIB_IDo;
    wire [7:0]          ICache_FIB_CMDo,    DCache_FIB_CMDo;
    wire [3:0]          ICache_FIB_BURSTo,  DCache_FIB_BURSTo;
    wire [3:0]          ICache_FIB_SIZEo,   DCache_FIB_SIZEo;
    wire [`YSYX210152_PADR-1:0]    ICache_FIB_ADDRo,   DCache_FIB_ADDRo;    
    wire [`YSYX210152_XLEN-1:0]    ICache_FIB_DATAo,   DCache_FIB_DATAo;
    
    wire                ITLB_FIB_WRENo,     DTLB_FIB_WRENo;
    wire                ITLB_FIB_REQo,      DTLB_FIB_REQo;
    reg                 ITLB_FIB_ACKi,      DTLB_FIB_ACKi;
    wire [7:0]          ITLB_FIB_IDo,       DTLB_FIB_IDo;
    wire [7:0]          ITLB_FIB_CMDo,      DTLB_FIB_CMDo;
    wire [3:0]          ITLB_FIB_BURSTo,    DTLB_FIB_BURSTo;
    wire [3:0]          ITLB_FIB_SIZEo,     DTLB_FIB_SIZEo;
    wire [`YSYX210152_PADR-1:0]    ITLB_FIB_ADDRo,     DTLB_FIB_ADDRo;    
    wire [`YSYX210152_XLEN-1:0]    ITLB_FIB_DATAo,     DTLB_FIB_DATAo;

    wire [3:0]          FIB_select;
    
    reg                 FIB_AQ_WREN;
    reg                 FIB_AQ_V;
    wire                FIB_AQ_FULL;
    reg [7:0]           FIB_AQ_ID;
    reg [7:0]           FIB_AQ_CMD;
    reg [3:0]           FIB_AQ_BURST;
    reg [3:0]           FIB_AQ_SIZE;
    reg [`YSYX210152_PADR-1:0]     FIB_AQ_ADDR;
    reg [`YSYX210152_XLEN-1:0]     FIB_AQ_DATA;
    
    wire                FIB_RQ_V;
    wire [7:0]          FIB_RQ_ID;
    wire [7:0]          FIB_RQ_AXIID;
    wire [7:0]          FIB_RQ_RPL;
    wire [`YSYX210152_XLEN-1:0]    FIB_RQ_DATA;
    
    wire                FIB2AXI_AQ_V,       FIB2AXI_AQ_ACK;
    wire [7:0]          FIB2AXI_AQ_ID,      FIB2AXI_AQ_CMD;
    wire [3:0]          FIB2AXI_AQ_BURST,   FIB2AXI_AQ_SIZE;
    wire [`YSYX210152_XLEN-1:0]    FIB2AXI_AQ_DATA;
    wire [`YSYX210152_PADR-1:0]    FIB2AXI_AQ_ADDR;

    wire [`YSYX210152_PADR-1:0]    SFRi_ADDR;
    wire [`YSYX210152_XLEN-1:0]    SFRi_DATA,  SFRo_DATA;
    wire                SFRi_WR,    SFRi_CS;
assign FIB_RQ_ID=8'h00|FIB_RQ_AXIID;
ysyx_210152_reset_gen       RST_SYNC(
    .clk                        (clock),
    .rst_async                  (reset),
    .rst_sync                   (Core_SRST)
);

ysyx_210152_PRV564_top
#(
    .HART_ID        (8'h0)
    
    
    
    
    
    
    
    
)PRV564_top(
    .GLB_CLKi                   (clock),
    .GLB_ARSTi                  (Core_SRST),

    .ITLB_FIB_WRENo             (ITLB_FIB_WRENo), 
    .DTLB_FIB_WRENo             (DTLB_FIB_WRENo),
    .ITLB_FIB_REQo              (ITLB_FIB_REQo),  
    .DTLB_FIB_REQo              (DTLB_FIB_REQo),
    .ITLB_FIB_ACKi              (ITLB_FIB_ACKi),  
    .DTLB_FIB_ACKi              (DTLB_FIB_ACKi),
    .ITLB_FIB_FULLi             (FIB_AQ_FULL), 
    .DTLB_FIB_FULLi             (FIB_AQ_FULL),
    .ITLB_FIB_IDo               (ITLB_FIB_IDo),   
    .DTLB_FIB_IDo               (DTLB_FIB_IDo),
    .ITLB_FIB_CMDo              (ITLB_FIB_CMDo),  
    .DTLB_FIB_CMDo              (DTLB_FIB_CMDo),
    .ITLB_FIB_BURSTo            (ITLB_FIB_BURSTo),
    .DTLB_FIB_BURSTo            (DTLB_FIB_BURSTo),
    .ITLB_FIB_SIZEo             (ITLB_FIB_SIZEo), 
    .DTLB_FIB_SIZEo             (DTLB_FIB_SIZEo),
    .ITLB_FIB_ADDRo             (ITLB_FIB_ADDRo), 
    .DTLB_FIB_ADDRo             (DTLB_FIB_ADDRo),    
    .ITLB_FIB_DATAo             (ITLB_FIB_DATAo),
    .DTLB_FIB_DATAo             (DTLB_FIB_DATAo),
    
    .ITLB_FIB_IDi               (FIB_RQ_ID),
    .DTLB_FIB_IDi               (FIB_RQ_ID),
    .ITLB_FIB_RPLi              (FIB_RQ_RPL),  
    .DTLB_FIB_RPLi              (FIB_RQ_RPL),
    .ITLB_FIB_Vi                (FIB_RQ_V),
    .DTLB_FIB_Vi                (FIB_RQ_V),
    .ITLB_FIB_DATAi             (FIB_RQ_DATA),
    .DTLB_FIB_DATAi             (FIB_RQ_DATA),

    .ICache_FIB_WRENo           (ICache_FIB_WRENo), 
    .DCache_FIB_WRENo           (DCache_FIB_WRENo),
    .ICache_FIB_REQo            (ICache_FIB_REQo),  
    .DCache_FIB_REQo            (DCache_FIB_REQo),
    .ICache_FIB_ACKi            (ICache_FIB_ACKi),  
    .DCache_FIB_ACKi            (DCache_FIB_ACKi),
    .ICache_FIB_FULLi           (FIB_AQ_FULL),
    .DCache_FIB_FULLi           (FIB_AQ_FULL),
    .ICache_FIB_IDo             (ICache_FIB_IDo),
    .DCache_FIB_IDo             (DCache_FIB_IDo),
    .ICache_FIB_CMDo            (ICache_FIB_CMDo),
    .DCache_FIB_CMDo            (DCache_FIB_CMDo),
    .ICache_FIB_BURSTo          (ICache_FIB_BURSTo),
    .DCache_FIB_BURSTo          (DCache_FIB_BURSTo),
    .ICache_FIB_SIZEo           (ICache_FIB_SIZEo), 
    .DCache_FIB_SIZEo           (DCache_FIB_SIZEo),
    .ICache_FIB_ADDRo           (ICache_FIB_ADDRo), 
    .DCache_FIB_ADDRo           (DCache_FIB_ADDRo),    
    .ICache_FIB_DATAo           (ICache_FIB_DATAo), 
    .DCache_FIB_DATAo           (DCache_FIB_DATAo),
    
    .ICache_FIB_IDi             (FIB_RQ_ID),
    .DCache_FIB_IDi             (FIB_RQ_ID),
    .ICache_FIB_RPLi            (FIB_RQ_RPL),
    .DCache_FIB_RPLi            (FIB_RQ_RPL),
    .ICache_FIB_Vi              (FIB_RQ_V),
    .DCache_FIB_Vi              (FIB_RQ_V),
    .ICache_FIB_DATAi           (FIB_RQ_DATA), 
    .DCache_FIB_DATAi           (FIB_RQ_DATA),

    .Kernel_MTIi                (Kernel_MTIi),          
    .Kernel_MSIi                (Kernel_MSIi),          
    .Kernel_MEIi                (io_interrupt),         
    .Kernel_SEIi                (1'b0),                 
    .Kernel_NMIPLi              (1'b0),                 
    .Kernel_NMIEEi              (1'b0),
    .Kernel_NMIGi               (1'b0),

    .Kernel_MTIMEi              (Kernel_MTIMEi)	        
);


ysyx_210152_FIB_arb         FIB_arb
(
    .CLKi                       (clock),
    .ARSTi                      (Core_SRST),

    .Master_REQ                 ({DCache_FIB_REQo, ICache_FIB_REQo, DTLB_FIB_REQo, ITLB_FIB_REQo}),
    .Master_ACK                 (FIB_select)
);
always@(*)begin
    case(FIB_select)
        4'b0001 : begin
                    FIB_AQ_WREN = ITLB_FIB_WRENo;
                    FIB_AQ_V    = ITLB_FIB_WRENo;
                    FIB_AQ_ID   = ITLB_FIB_IDo;
                    FIB_AQ_CMD  = ITLB_FIB_CMDo;
                    FIB_AQ_BURST= ITLB_FIB_BURSTo;
                    FIB_AQ_SIZE = ITLB_FIB_SIZEo;
                    FIB_AQ_ADDR = ITLB_FIB_ADDRo;
                    FIB_AQ_DATA = ITLB_FIB_DATAo;
                    ITLB_FIB_ACKi= 1'b1;
                    DTLB_FIB_ACKi= 1'b0;
                    ICache_FIB_ACKi=1'b0;
                    DCache_FIB_ACKi=1'b0;
                 end
        4'b0010 : begin
                    FIB_AQ_WREN = DTLB_FIB_WRENo;
                    FIB_AQ_V    = DTLB_FIB_WRENo;
                    FIB_AQ_ID   = DTLB_FIB_IDo;
                    FIB_AQ_CMD  = DTLB_FIB_CMDo;
                    FIB_AQ_BURST= DTLB_FIB_BURSTo;
                    FIB_AQ_SIZE = DTLB_FIB_SIZEo;
                    FIB_AQ_ADDR = DTLB_FIB_ADDRo;
                    FIB_AQ_DATA = DTLB_FIB_DATAo;
                    ITLB_FIB_ACKi= 1'b0;
                    DTLB_FIB_ACKi= 1'b1;
                    ICache_FIB_ACKi=1'b0;
                    DCache_FIB_ACKi=1'b0;
                 end
        4'b0100 : begin
                    FIB_AQ_WREN = ICache_FIB_WRENo;
                    FIB_AQ_V    = ICache_FIB_WRENo;
                    FIB_AQ_ID   = ICache_FIB_IDo;
                    FIB_AQ_CMD  = ICache_FIB_CMDo;
                    FIB_AQ_BURST= ICache_FIB_BURSTo;
                    FIB_AQ_SIZE = ICache_FIB_SIZEo;
                    FIB_AQ_ADDR = ICache_FIB_ADDRo;
                    FIB_AQ_DATA = ICache_FIB_DATAo;
                    ITLB_FIB_ACKi= 1'b0;
                    DTLB_FIB_ACKi= 1'b0;
                    ICache_FIB_ACKi=1'b1;
                    DCache_FIB_ACKi=1'b0;
                 end
        4'b1000 : begin
                    FIB_AQ_WREN = DCache_FIB_WRENo;
                    FIB_AQ_V    = DCache_FIB_WRENo;
                    FIB_AQ_ID   = DCache_FIB_IDo;
                    FIB_AQ_CMD  = DCache_FIB_CMDo;
                    FIB_AQ_BURST= DCache_FIB_BURSTo;
                    FIB_AQ_SIZE = DCache_FIB_SIZEo;
                    FIB_AQ_ADDR = DCache_FIB_ADDRo;
                    FIB_AQ_DATA = DCache_FIB_DATAo;
                    ITLB_FIB_ACKi= 1'b0;
                    DTLB_FIB_ACKi= 1'b0;
                    ICache_FIB_ACKi=1'b0;
                    DCache_FIB_ACKi=1'b1;
                 end
        default: begin
                    FIB_AQ_WREN = 1'b0;
                    FIB_AQ_V    = 1'b0;
                    FIB_AQ_ID   = 'hx;
                    FIB_AQ_CMD  = 'hx;
                    FIB_AQ_BURST= 'hx;
                    FIB_AQ_SIZE = 'hx;
                    FIB_AQ_ADDR = 'hx;
                    FIB_AQ_DATA = 'hx;
                    ITLB_FIB_ACKi= 1'b0;
                    DTLB_FIB_ACKi= 1'b0;
                    ICache_FIB_ACKi=1'b0;
                    DCache_FIB_ACKi=1'b0;
                 end
    endcase
end



ysyx_210152_SFR              SFR(

    
    .CLKi                       (clock),
    .ARSTi                      (Core_SRST),
    
    .SFRi_ADDR                  ({32'h0000_0000,SFRi_ADDR}),
    .SFRi_DATA                  (SFRi_DATA),
    .SFRi_CS                    (SFRi_CS),
    .SFRi_WR                    (SFRi_WR),
    .SFRo_DATA                  (SFRo_DATA),
    
    .CLINT_MTI                  (Kernel_MTIi),
    .CLINT_MSI                  (Kernel_MSIi),
    .CLINT_MTIME                (Kernel_MTIMEi)
);

wire busfifo_empty;
assign FIB2AXI_AQ_V=(!busfifo_empty);
ysyx_210152_SyncFIFO_Bus #( .DWID(120), .DDEPTH(8))
BUSFIFO(
    .clk(clock),
    .rst(Core_SRST),
    .ren(FIB2AXI_AQ_ACK),
    .wen(FIB_AQ_WREN),
    .wdata({FIB_AQ_ID, FIB_AQ_CMD, FIB_AQ_BURST, FIB_AQ_SIZE, FIB_AQ_DATA, FIB_AQ_ADDR}),
    .rdata({FIB2AXI_AQ_ID, FIB2AXI_AQ_CMD, FIB2AXI_AQ_BURST, FIB2AXI_AQ_SIZE, FIB2AXI_AQ_DATA, FIB2AXI_AQ_ADDR}),
    .full(FIB_AQ_FULL),
    .empty(busfifo_empty)
);

ysyx_210152_FIB2AXI #(
    .AXI_ID_WIDTH               (4),
    .AXI_ADDR_WID               (32)
)FIB2AXI(
    .CLKi                       (clock),
    .RSTi                       (Core_SRST),


    .FIBo_ACK                   (FIB2AXI_AQ_ACK),
    .FIBi_V                     (FIB2AXI_AQ_V),
    .FIBi_ID                    (FIB2AXI_AQ_ID),
    .FIBi_CMD                   (FIB2AXI_AQ_CMD),
    .FIBi_BURST                 (FIB2AXI_AQ_BURST),
    .FIBi_SIZE                  (FIB2AXI_AQ_SIZE),
    .FIBi_ADDR                  (FIB2AXI_AQ_ADDR),
    .FIBi_DATA                  (FIB2AXI_AQ_DATA),
    
    .FIBo_ID                    (FIB_RQ_AXIID),
    .FIBo_RPL                   (FIB_RQ_RPL),
    .FIBo_WREN                  (FIB_RQ_V),
    .FIBi_FULL                  (1'b0),

    .FIBo_DATA                  (FIB_RQ_DATA),

    .FIBo_SFRi_ADDR             (SFRi_ADDR),
    .FIBo_SFRi_DATA             (SFRi_DATA),
    .FIBo_SFRi_CS               (SFRi_CS),
    .FIBo_SFRi_WR               (SFRi_WR),
    .FIBi_SFRo_DATA             (SFRo_DATA),


    .FIBo_AXI_awid              (io_master_awid),
    .FIBo_AXI_awaddr            (io_master_awaddr),
    .FIBo_AXI_awlen             (io_master_awlen),
    .FIBo_AXI_awsize            (io_master_awsize),
     .FIBo_AXI_awburst           (io_master_awburst),
    
    
    
    
    

    .FIBo_AXI_awvalid           (io_master_awvalid),
    .FIBi_AXI_awready           (io_master_awready),

    .FIBo_AXI_wdata             (io_master_wdata),
    .FIBo_AXI_wstrb             (io_master_wstrb),
    .FIBo_AXI_wlast             (io_master_wlast),
    .FIBo_AXI_wvalid            (io_master_wvalid),
    .FIBi_AXI_wready            (io_master_wready),

    .FIBi_AXI_bid               (io_master_bid),
    .FIBi_AXI_bresp             (io_master_bresp),
    .FIBi_AXI_bvalid            (io_master_bvalid),
    .FIBo_AXI_bready            (io_master_bready),

    .FIBo_AXI_arid              (io_master_arid),
    .FIBo_AXI_araddr            (io_master_araddr),
    .FIBo_AXI_arlen             (io_master_arlen),
    .FIBo_AXI_arsize            (io_master_arsize),
    .FIBo_AXI_arburst           (io_master_arburst),
    
    
    
    
    
    .FIBo_AXI_arvalid           (io_master_arvalid),
    .FIBi_AXI_arready           (io_master_arready),

    .FIBi_AXI_rid               (io_master_rid),
    .FIBi_AXI_rdata             (io_master_rdata),
    .FIBi_AXI_rresp             (io_master_rresp),
    .FIBi_AXI_rlast             (io_master_rlast),
    .FIBi_AXI_rvalid            (io_master_rvalid),
    .FIBo_AXI_rready            (io_master_rready)
);


`ifdef STUCK_AUTO_STOP
reg [63:0] bus_stuck_cnt;
always@(posedge clock)begin
    if(FIB2AXI_AQ_V)begin
        if(FIB2AXI_AQ_ACK)begin
            bus_stuck_cnt <= 0;
        end
        else begin
            bus_stuck_cnt <= bus_stuck_cnt + 1;
        end
    end
    if(bus_stuck_cnt > 4000)begin
        
        
    end
end
`endif 

endmodule



/**************************
#PREPROCESS_START
    sed -i 's/.\/RTL\/Cache\/S011HD1P_X32Y2D128_BW.v
#PREPROCESS_END
***************************/
module ysyx_210152
(
    input clock,
    input reset,
    input io_interrupt,

    input 		io_master_awready,
    output 		io_master_awvalid,
    output 	[31:0] 	io_master_awaddr, 	
    output 	[3:0] 	io_master_awid, 	
    output 	[7:0] 	io_master_awlen, 	
    output 	[2:0] 	io_master_awsize, 	
    output 	[1:0] 	io_master_awburst, 	

    input 		io_master_wready, 	
    output 		io_master_wvalid, 	
    output 	[63:0] 	io_master_wdata, 	
    output 	[7:0] 	io_master_wstrb, 	
    output 		io_master_wlast, 

    output 		io_master_bready,
    input 		io_master_bvalid,
    input 	[1:0] 	io_master_bresp,
    input 	[3:0] 	io_master_bid,

    input 		io_master_arready,
    output 		io_master_arvalid,
    output 	[31:0] 	io_master_araddr,
    output 	[3:0] 	io_master_arid,
    output 	[7:0] 	io_master_arlen,
    output 	[2:0] 	io_master_arsize,
    output 	[1:0] 	io_master_arburst,


    output 		io_master_rready,
    input 		io_master_rvalid, 	
    input 	[1:0] 	io_master_rresp,
    input 	[63:0] 	io_master_rdata, 	
    input 		io_master_rlast, 	
    input 	[3:0] 	io_master_rid,
    
    output 		io_slave_awready,
    input 		io_slave_awvalid,
    input 	[31:0] 	io_slave_awaddr,
    input 	[3:0] 	io_slave_awid,
    input 	[7:0] 	io_slave_awlen,
    input 	[2:0] 	io_slave_awsize,
    input 	[1:0] 	io_slave_awburst,

    output 		io_slave_wready,
    input 		io_slave_wvalid,
    input 	[63:0] 	io_slave_wdata,
    input 	[7:0] 	io_slave_wstrb,
    input 		io_slave_wlast,

    input 		io_slave_bready, 	
    output 		io_slave_bvalid,
    output 	[1:0] 	io_slave_bresp,
    output 	[3:0] 	io_slave_bid,
    
    output 		io_slave_arready,
    input 		io_slave_arvalid,
    input 	[31:0] 	io_slave_araddr,
    input 	[3:0] 	io_slave_arid,
    input 	[7:0] 	io_slave_arlen,
    input 	[2:0] 	io_slave_arsize,
    input 	[1:0] 	io_slave_arburst,

    input 		io_slave_rready,
    output 		io_slave_rvalid, 	
    output 	[1:0] 	io_slave_rresp,
    output 	[63:0] 	io_slave_rdata,
    output 		io_slave_rlast, 	
    output 	[3:0] 	io_slave_rid
);

ysyx_210152_Vostok564_top  Core_N1(

    .clock(clock),   
    .reset(reset),   
    .io_interrupt(io_interrupt),

    .io_master_awid(io_master_awid),
    .io_master_awaddr(io_master_awaddr),
    .io_master_awlen(io_master_awlen),
    .io_master_awsize(io_master_awsize),
    .io_master_awburst(io_master_awburst),
    .io_master_awvalid(io_master_awvalid),
    .io_master_awready(io_master_awready),

    .io_master_wdata(io_master_wdata),
    .io_master_wstrb(io_master_wstrb),
    .io_master_wlast(io_master_wlast),
    .io_master_wvalid(io_master_wvalid),
    .io_master_wready(io_master_wready),

    .io_master_bid(io_master_bid),
    .io_master_bresp(io_master_bresp),
    .io_master_bvalid(io_master_bvalid),
    .io_master_bready(io_master_bready),

    .io_master_arid(io_master_arid),
    .io_master_araddr(io_master_araddr),
    .io_master_arlen(io_master_arlen),
    .io_master_arsize(io_master_arsize),
    .io_master_arburst(io_master_arburst),
    .io_master_arvalid(io_master_arvalid),
    .io_master_arready(io_master_arready),

    .io_master_rid(io_master_rid),
    .io_master_rdata(io_master_rdata),
    .io_master_rresp(io_master_rresp),
    .io_master_rlast(io_master_rlast),
    .io_master_rvalid(io_master_rvalid),
    .io_master_rready(io_master_rready)
);

endmodule




