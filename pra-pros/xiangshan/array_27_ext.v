// name:array_27_ext depth:512 width:210 masked:true maskGran:21 maskSeg:10
module array_27_ext(
  input RW0_clk,
  input [8:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [9:0] RW0_wmask,
  input [209:0] RW0_wdata,
  output [209:0] RW0_rdata
);


  reg reg_RW0_ren;
  reg [8:0] reg_RW0_addr;
  reg [209:0] ram [511:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 512; initvar = initvar+1)
        ram[initvar] = {7 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      if (RW0_wmask[0]) ram[RW0_addr][20:0] <= RW0_wdata[20:0];
      if (RW0_wmask[1]) ram[RW0_addr][41:21] <= RW0_wdata[41:21];
      if (RW0_wmask[2]) ram[RW0_addr][62:42] <= RW0_wdata[62:42];
      if (RW0_wmask[3]) ram[RW0_addr][83:63] <= RW0_wdata[83:63];
      if (RW0_wmask[4]) ram[RW0_addr][104:84] <= RW0_wdata[104:84];
      if (RW0_wmask[5]) ram[RW0_addr][125:105] <= RW0_wdata[125:105];
      if (RW0_wmask[6]) ram[RW0_addr][146:126] <= RW0_wdata[146:126];
      if (RW0_wmask[7]) ram[RW0_addr][167:147] <= RW0_wdata[167:147];
      if (RW0_wmask[8]) ram[RW0_addr][188:168] <= RW0_wdata[188:168];
      if (RW0_wmask[9]) ram[RW0_addr][209:189] <= RW0_wdata[209:189];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [223:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random, $random, $random, $random, $random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random, $random, $random, $random, $random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[209:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule