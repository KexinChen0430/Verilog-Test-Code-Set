// --------------- fdivision.v -----------------------------
module fdivision(RESET,F10M,F500K); 
input F10M,RESET; 
output F500K; 
reg F500K; 
reg [7:0]j; 
  always @(posedge F10M) 
    if(!RESET)          //低电平复位。
      begin
        F500K <= 0;
        j <= 0;
      end
    else
      begin
        if(j==19)      //对计数器进行判断，以确定F500K信号是否反转。
          begin
            j <= 0;
            F500K <= ~F500K;
          end
        else
          j <= j+1;
      end
endmodule
