module page108;

`define   ON   1 'b 1
`define  OFF  1 'b 0
 wire ControlSwitch;
 wire [7:0] Out, In;
 assign  Out =  (ControlSwith == `ON) ? In  : 8 'h00;

`define   ON   1 'b 1
`define  OFF  1 'b 0
 wire  LinkBusSwitch;
 wire [7:0]  outbuf;
 inout [7:0] bus;
 assign  bus =  (LinkBusSwitch== `ON) ? outbuf : 8 'hzz;
 
 endmodule