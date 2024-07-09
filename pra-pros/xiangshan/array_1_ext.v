// name:array_1_ext depth:1024 width:328 masked:true maskGran:82 maskSeg:4
module array_1_ext(
  input RW0_clk,
  input [9:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [3:0] RW0_wmask,
  input [327:0] RW0_wdata,
  output [327:0] RW0_rdata
);


  reg reg_RW0_ren;
  reg [9:0] reg_RW0_addr;
  reg [327:0] ram [1023:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 1024; initvar = initvar+1)
        ram[initvar] = {11 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      if (RW0_wmask[0]) ram[RW0_addr][81:0] <= RW0_wdata[81:0];
      if (RW0_wmask[1]) ram[RW0_addr][163:82] <= RW0_wdata[163:82];
      if (RW0_wmask[2]) ram[RW0_addr][245:164] <= RW0_wdata[245:164];
      if (RW0_wmask[3]) ram[RW0_addr][327:246] <= RW0_wdata[327:246];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [351:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random, $random, $random, $random, $random, $random, $random, $random, $random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[327:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule