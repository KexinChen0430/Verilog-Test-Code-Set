module bitlength();
   reg [3:0] a,b,c;
   reg [4:0] d;
   initial begin
     a = 9;
     b = 8;
     c = 1;
     $display("answer = %b", c ? (a&b) : d);
     end
     
reg [3:0] a;
reg [5:0] b;
reg [15:0] c;
initial begin
   a = 4'hF;
   b = 6'hA;
   $display("a*b=%h", a*b);// expression size is self-determined
   c = {a**b};           // expression a**b is self-determined
                         // due to concatenation operator {}
       $display("a**b=%h", c);
   c = a**b;             // expression size is determined by c
   $display("c=%h", c);
end

reg [7:0] regA, regB;
reg signed [7:0] regS;
regA = $unsigned(-4);     // regA = 8'b11111100 
regB = $unsigned(-4'sd4); // regB = 8'b00001100 
regS = $signed  (4'b1100); // regS = -4

// page 66
reg      [5:0] a;
reg signed [4:0] b;
initial begin
  a = 8'hff; // After the assignment, a = 6'h3f
  b = 8'hff; // After the assignment, b = 5'h1f
end

// page 65
reg      [0:5] a;
reg signed [0:4] b, c;  
initial begin
  a = 8'sh8f; // After the assignment, a = 6'h0f
  b = 8'sh8f; // After the assignment, b = 5'h0f
  c = -113;   // After the assignment, c = 15
  
    // 1000_1111 = (-'h71 = -113) truncates to ('h0F = 15)
end

reg      [7:0] a;
reg signed [7:0] b;  
reg signed [5:0] c, d;
initial begin
  a = 8'hff;
  c = a;      // After the assignment, c = 6'h3f
  b = -113;
  d = b;      // After the assignment, d = 6'h0f
end
   endmodule