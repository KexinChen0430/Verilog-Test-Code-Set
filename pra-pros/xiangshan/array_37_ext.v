// name:array_37_ext depth:4096 width:144 masked:true maskGran:18 maskSeg:8
module array_37_ext(
  input RW0_clk,
  input [11:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [7:0] RW0_wmask,
  input [143:0] RW0_wdata,
  output [143:0] RW0_rdata
);


  reg reg_RW0_ren;
  reg [11:0] reg_RW0_addr;
  reg [143:0] ram [4095:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 4096; initvar = initvar+1)
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
      if (RW0_wmask[0]) ram[RW0_addr][17:0] <= RW0_wdata[17:0];
      if (RW0_wmask[1]) ram[RW0_addr][35:18] <= RW0_wdata[35:18];
      if (RW0_wmask[2]) ram[RW0_addr][53:36] <= RW0_wdata[53:36];
      if (RW0_wmask[3]) ram[RW0_addr][71:54] <= RW0_wdata[71:54];
      if (RW0_wmask[4]) ram[RW0_addr][89:72] <= RW0_wdata[89:72];
      if (RW0_wmask[5]) ram[RW0_addr][107:90] <= RW0_wdata[107:90];
      if (RW0_wmask[6]) ram[RW0_addr][125:108] <= RW0_wdata[125:108];
      if (RW0_wmask[7]) ram[RW0_addr][143:126] <= RW0_wdata[143:126];
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
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[143:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule