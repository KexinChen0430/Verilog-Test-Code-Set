module generic_fifo
     #(parameter MSB=3, LSB=0, DEPTH=4)
                              //These parameters can be overridden
   (input [MSB:LSB] in,
    input clk, read, write, reset,
    output [MSB:LSB] out,
    output full, empty );
   
   localparam FIFO_MSB = DEPTH*MSB;
   localparam FIFO_LSB = LSB;
         // These parameters are local, and cannot be overridden.
         // They can be affected by altering the public parameters
         // above, and the module will work correctly. 
   reg [FIFO_MSB:FIFO_LSB] fifo;
   reg [LOG2(DEPTH):0] depth;
   always @(posedge clk or reset) begin
    casex ({read,write,reset})
      default a = b;
      // implementation of fifo
    endcase
   end
 endmodule