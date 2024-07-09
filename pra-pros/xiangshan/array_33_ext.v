// name:array_33_ext depth:2048 width:16 masked:true maskGran:2 maskSeg:8
module array_33_ext(
  input RW0_clk,
  input [10:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [7:0] RW0_wmask,
  input [15:0] RW0_wdata,
  output [15:0] RW0_rdata
);


  reg reg_RW0_ren;
  reg [10:0] reg_RW0_addr;
  reg [15:0] ram [2047:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 2048; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      if (RW0_wmask[0]) ram[RW0_addr][1:0] <= RW0_wdata[1:0];
      if (RW0_wmask[1]) ram[RW0_addr][3:2] <= RW0_wdata[3:2];
      if (RW0_wmask[2]) ram[RW0_addr][5:4] <= RW0_wdata[5:4];
      if (RW0_wmask[3]) ram[RW0_addr][7:6] <= RW0_wdata[7:6];
      if (RW0_wmask[4]) ram[RW0_addr][9:8] <= RW0_wdata[9:8];
      if (RW0_wmask[5]) ram[RW0_addr][11:10] <= RW0_wdata[11:10];
      if (RW0_wmask[6]) ram[RW0_addr][13:12] <= RW0_wdata[13:12];
      if (RW0_wmask[7]) ram[RW0_addr][15:14] <= RW0_wdata[15:14];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[15:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule