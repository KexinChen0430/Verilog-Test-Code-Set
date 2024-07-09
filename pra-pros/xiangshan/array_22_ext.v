// name:array_22_ext depth:256 width:48 masked:true maskGran:6 maskSeg:8
module array_22_ext(
  input RW0_clk,
  input [7:0] RW0_addr,
  input RW0_en,
  input RW0_wmode,
  input [7:0] RW0_wmask,
  input [47:0] RW0_wdata,
  output [47:0] RW0_rdata
);


  reg reg_RW0_ren;
  reg [7:0] reg_RW0_addr;
  reg [47:0] ram [255:0];
  `ifdef RANDOMIZE_MEM_INIT
    integer initvar;
    initial begin
      #`RANDOMIZE_DELAY begin end
      for (initvar = 0; initvar < 256; initvar = initvar+1)
        ram[initvar] = {2 {$random}};
      reg_RW0_addr = {1 {$random}};
    end
  `endif
  always @(posedge RW0_clk)
    reg_RW0_ren <= RW0_en && !RW0_wmode;
  always @(posedge RW0_clk)
    if (RW0_en && !RW0_wmode) reg_RW0_addr <= RW0_addr;
  always @(posedge RW0_clk)
    if (RW0_en && RW0_wmode) begin
      if (RW0_wmask[0]) ram[RW0_addr][5:0] <= RW0_wdata[5:0];
      if (RW0_wmask[1]) ram[RW0_addr][11:6] <= RW0_wdata[11:6];
      if (RW0_wmask[2]) ram[RW0_addr][17:12] <= RW0_wdata[17:12];
      if (RW0_wmask[3]) ram[RW0_addr][23:18] <= RW0_wdata[23:18];
      if (RW0_wmask[4]) ram[RW0_addr][29:24] <= RW0_wdata[29:24];
      if (RW0_wmask[5]) ram[RW0_addr][35:30] <= RW0_wdata[35:30];
      if (RW0_wmask[6]) ram[RW0_addr][41:36] <= RW0_wdata[41:36];
      if (RW0_wmask[7]) ram[RW0_addr][47:42] <= RW0_wdata[47:42];
    end
  `ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] RW0_random;
  `ifdef RANDOMIZE_MEM_INIT
    initial begin
      #`RANDOMIZE_DELAY begin end
      RW0_random = {$random, $random};
      reg_RW0_ren = RW0_random[0];
    end
  `endif
  always @(posedge RW0_clk) RW0_random <= {$random, $random};
  assign RW0_rdata = reg_RW0_ren ? ram[reg_RW0_addr] : RW0_random[47:0];
  `else
  assign RW0_rdata = ram[reg_RW0_addr];
  `endif

endmodule