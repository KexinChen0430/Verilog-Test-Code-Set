// name:array_34_ext depth:2048 width:152 masked:true maskGran:19 maskSeg:8
module array_34_ext(
  input RW0_clk,
  input [10:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [7:0] RW0_wmask,
  input [151:0] RW0_wdata,
  output [151:0] RW0_rdata
);


  reg reg_RW0_ren;
  reg [10:0] reg_RW0_addr;
  reg [151:0] ram [2047:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 2048; initvar = initvar+1)
        ram[initvar] = {5 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      if (RW0_wmask[0]) ram[RW0_addr][18:0] <= RW0_wdata[18:0];
      if (RW0_wmask[1]) ram[RW0_addr][37:19] <= RW0_wdata[37:19];
      if (RW0_wmask[2]) ram[RW0_addr][56:38] <= RW0_wdata[56:38];
      if (RW0_wmask[3]) ram[RW0_addr][75:57] <= RW0_wdata[75:57];
      if (RW0_wmask[4]) ram[RW0_addr][94:76] <= RW0_wdata[94:76];
      if (RW0_wmask[5]) ram[RW0_addr][113:95] <= RW0_wdata[113:95];
      if (RW0_wmask[6]) ram[RW0_addr][132:114] <= RW0_wdata[132:114];
      if (RW0_wmask[7]) ram[RW0_addr][151:133] <= RW0_wdata[151:133];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [159:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random, $random, $random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random, $random, $random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[151:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule