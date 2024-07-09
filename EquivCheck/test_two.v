module RVCExpander(
  input  [31:0] io_in,
  output [31:0] io_out_bits
);
  wire [6:0] _T_2 = |io_in[12:5] ? 7'h13 : 7'h1f; // @[RVC.scala 53:20]
  wire [29:0] _T_10 = {io_in[10:7],io_in[12:11],io_in[5],io_in[6],2'h0,5'h2,3'h0,2'h1,io_in[4:2],_T_2}; // @[Cat.scala 30:58]
  wire [7:0] _T_18 = {io_in[6:5],io_in[12:10],3'h0}; // @[Cat.scala 30:58]
  wire [27:0] _T_23 = {io_in[6:5],io_in[12:10],3'h0,2'h1,io_in[9:7],3'h3,2'h1,io_in[4:2],7'h7}; // @[Cat.scala 30:58]
  wire [6:0] _T_34 = {io_in[5],io_in[12:10],io_in[6],2'h0}; // @[Cat.scala 30:58]
  wire [26:0] _T_39 = {io_in[5],io_in[12:10],io_in[6],2'h0,2'h1,io_in[9:7],3'h2,2'h1,io_in[4:2],7'h3}; // @[Cat.scala 30:58]
  wire [27:0] _T_54 = {io_in[6:5],io_in[12:10],3'h0,2'h1,io_in[9:7],3'h3,2'h1,io_in[4:2],7'h3}; // @[Cat.scala 30:58]
  wire [26:0] _T_76 = {_T_34[6:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h2,_T_34[4:0],7'h3f}; // @[Cat.scala 30:58]
  wire [27:0] _T_96 = {_T_18[7:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h3,_T_18[4:0],7'h27}; // @[Cat.scala 30:58]
  wire [26:0] _T_118 = {_T_34[6:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h2,_T_34[4:0],7'h23}; // @[Cat.scala 30:58]
  wire [27:0] _T_138 = {_T_18[7:5],2'h1,io_in[4:2],2'h1,io_in[9:7],3'h3,_T_18[4:0],7'h23}; // @[Cat.scala 30:58]
  wire [6:0] _T_148 = io_in[12] ? 7'h7f : 7'h0; // @[Bitwise.scala 72:12]
  wire [11:0] _T_150 = {_T_148,io_in[6:2]}; // @[Cat.scala 30:58]
  wire [31:0] _T_153 = {_T_148,io_in[6:2],io_in[11:7],3'h0,io_in[11:7],7'h13}; // @[Cat.scala 30:58]
  wire  _T_160 = |io_in[11:7]; // @[RVC.scala 77:24]
  wire [6:0] _T_161 = |io_in[11:7] ? 7'h1b : 7'h1f; // @[RVC.scala 77:20]
  wire [31:0] _T_169 = {_T_148,io_in[6:2],io_in[11:7],3'h0,io_in[11:7],_T_161}; // @[Cat.scala 30:58]
  wire [31:0] _T_181 = {_T_148,io_in[6:2],5'h0,3'h0,io_in[11:7],7'h13}; // @[Cat.scala 30:58]
  wire  _T_191 = |_T_150; // @[RVC.scala 90:29]
  wire [6:0] _T_192 = |_T_150 ? 7'h37 : 7'h3f; // @[RVC.scala 90:20]
  wire [14:0] _T_195 = io_in[12] ? 15'h7fff : 15'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_197 = {_T_195,io_in[6:2],12'h0}; // @[Cat.scala 30:58]
  wire [31:0] _T_200 = {_T_197[31:12],io_in[11:7],_T_192}; // @[Cat.scala 30:58]
  wire [6:0] _T_217 = _T_191 ? 7'h13 : 7'h1f; // @[RVC.scala 86:20]
  wire [2:0] _T_220 = io_in[12] ? 3'h7 : 3'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_228 = {_T_220,io_in[4:3],io_in[5],io_in[2],io_in[6],4'h0,io_in[11:7],3'h0,io_in[11:7],_T_217}; // @[Cat.scala 30:58]
  wire [31:0] _T_234_bits = io_in[11:7] == 5'h0 | io_in[11:7] == 5'h2 ? _T_228 : _T_200; // @[RVC.scala 92:10]
  wire [25:0] _T_242 = {io_in[12],io_in[6:2],2'h1,io_in[9:7],3'h5,2'h1,io_in[9:7],7'h13}; // @[Cat.scala 30:58]
  wire [30:0] _GEN_0 = {{5'd0}, _T_242}; // @[RVC.scala 99:23]
  wire [30:0] _T_251 = _GEN_0 | 31'h40000000; // @[RVC.scala 99:23]
  wire [31:0] _T_261 = {_T_148,io_in[6:2],2'h1,io_in[9:7],3'h7,2'h1,io_in[9:7],7'h13}; // @[Cat.scala 30:58]
  wire [2:0] _T_264 = {io_in[12],io_in[6:5]}; // @[Cat.scala 30:58]
  wire [2:0] _T_266 = _T_264 == 3'h1 ? 3'h4 : 3'h0; // @[package.scala 32:76]
  wire [2:0] _T_268 = _T_264 == 3'h2 ? 3'h6 : _T_266; // @[package.scala 32:76]
  wire [2:0] _T_270 = _T_264 == 3'h3 ? 3'h7 : _T_268; // @[package.scala 32:76]
  wire [2:0] _T_272 = _T_264 == 3'h4 ? 3'h0 : _T_270; // @[package.scala 32:76]
  wire [2:0] _T_274 = _T_264 == 3'h5 ? 3'h0 : _T_272; // @[package.scala 32:76]
  wire [2:0] _T_276 = _T_264 == 3'h6 ? 3'h2 : _T_274; // @[package.scala 32:76]
  wire [2:0] _T_278 = _T_264 == 3'h7 ? 3'h3 : _T_276; // @[package.scala 32:76]
  wire [30:0] _T_281 = io_in[6:5] == 2'h0 ? 31'h40000000 : 31'h0; // @[RVC.scala 103:22]
  wire [6:0] _T_283 = io_in[12] ? 7'h3b : 7'h33; // @[RVC.scala 104:22]
  wire [24:0] _T_290 = {2'h1,io_in[4:2],2'h1,io_in[9:7],_T_278,2'h1,io_in[9:7],_T_283}; // @[Cat.scala 30:58]
  wire [30:0] _GEN_1 = {{6'd0}, _T_290}; // @[RVC.scala 105:43]
  wire [30:0] _T_291 = _GEN_1 | _T_281; // @[RVC.scala 105:43]
  wire [30:0] _T_294 = io_in[11:10] == 2'h1 ? _T_251 : {{5'd0}, _T_242}; // @[package.scala 32:76]
  wire [31:0] _T_296 = io_in[11:10] == 2'h2 ? _T_261 : {{1'd0}, _T_294}; // @[package.scala 32:76]
  wire [31:0] _T_298 = io_in[11:10] == 2'h3 ? {{1'd0}, _T_291} : _T_296; // @[package.scala 32:76]
  wire [9:0] _T_308 = io_in[12] ? 10'h3ff : 10'h0; // @[Bitwise.scala 72:12]
  wire [20:0] _T_316 = {_T_308,io_in[8],io_in[10:9],io_in[6],io_in[7],io_in[2],io_in[11],io_in[5:3],1'h0}; // @[Cat.scala 30:58]
  wire [31:0] _T_354 = {_T_316[20],_T_316[10:1],_T_316[11],_T_316[19:12],5'h0,7'h6f}; // @[Cat.scala 30:58]
  wire [4:0] _T_362 = io_in[12] ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [12:0] _T_367 = {_T_362,io_in[6:5],io_in[2],io_in[11:10],io_in[4:3],1'h0}; // @[Cat.scala 30:58]
  wire [31:0] _T_398 = {_T_367[12],_T_367[10:5],5'h0,2'h1,io_in[9:7],3'h0,_T_367[4:1],_T_367[11],7'h63}; // @[Cat.scala 30:58]
  wire [31:0] _T_442 = {_T_367[12],_T_367[10:5],5'h0,2'h1,io_in[9:7],3'h1,_T_367[4:1],_T_367[11],7'h63}; // @[Cat.scala 30:58]
  wire [6:0] _T_448 = _T_160 ? 7'h3 : 7'h1f; // @[RVC.scala 113:23]
  wire [25:0] _T_454 = {io_in[12],io_in[6:2],io_in[11:7],3'h1,io_in[11:7],7'h13}; // @[Cat.scala 30:58]
  wire [28:0] _T_464 = {io_in[4:2],io_in[12],io_in[6:5],3'h0,5'h2,3'h3,io_in[11:7],7'h7}; // @[Cat.scala 30:58]
  wire [27:0] _T_473 = {io_in[3:2],io_in[12],io_in[6:4],2'h0,5'h2,3'h2,io_in[11:7],_T_448}; // @[Cat.scala 30:58]
  wire [28:0] _T_482 = {io_in[4:2],io_in[12],io_in[6:5],3'h0,5'h2,3'h3,io_in[11:7],_T_448}; // @[Cat.scala 30:58]
  wire [19:0] _T_488 = {io_in[6:2],3'h0,io_in[11:7],7'h13}; // @[Cat.scala 30:58]
  wire [24:0] _T_495 = {io_in[6:2],io_in[11:7],3'h0,io_in[11:7],7'h33}; // @[Cat.scala 30:58]
  wire [24:0] _T_502 = {io_in[6:2],io_in[11:7],3'h0,12'h67}; // @[Cat.scala 30:58]
  wire [24:0] _T_504 = {_T_502[24:7],7'h1f}; // @[Cat.scala 30:58]
  wire [24:0] _T_507 = _T_160 ? _T_502 : _T_504; // @[RVC.scala 134:33]
  wire  _T_512 = |io_in[6:2]; // @[RVC.scala 135:27]
  wire [31:0] _WIRE_21_bits = {{12'd0}, _T_488}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _WIRE_23_bits = {{7'd0}, _T_507}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_513_bits = |io_in[6:2] ? _WIRE_21_bits : _WIRE_23_bits; // @[RVC.scala 135:22]
  wire [24:0] _T_516 = {io_in[6:2],io_in[11:7],3'h0,12'he7}; // @[Cat.scala 30:58]
  wire [24:0] _T_518 = {_T_502[24:7],7'h73}; // @[Cat.scala 30:58]
  wire [24:0] _T_519 = _T_518 | 25'h100000; // @[RVC.scala 137:46]
  wire [24:0] _T_522 = _T_160 ? _T_516 : _T_519; // @[RVC.scala 138:33]
  wire [31:0] _WIRE_22_bits = {{7'd0}, _T_495}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _WIRE_24_bits = {{7'd0}, _T_522}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_528_bits = _T_512 ? _WIRE_22_bits : _WIRE_24_bits; // @[RVC.scala 139:25]
  wire [31:0] _T_530_bits = io_in[12] ? _T_528_bits : _T_513_bits; // @[RVC.scala 140:10]
  wire [8:0] _T_533 = {io_in[9:7],io_in[12:10],3'h0}; // @[Cat.scala 30:58]
  wire [28:0] _T_540 = {_T_533[8:5],io_in[6:2],5'h2,3'h3,_T_533[4:0],7'h27}; // @[Cat.scala 30:58]
  wire [7:0] _T_546 = {io_in[8:7],io_in[12:9],2'h0}; // @[Cat.scala 30:58]
  wire [27:0] _T_553 = {_T_546[7:5],io_in[6:2],5'h2,3'h2,_T_546[4:0],7'h23}; // @[Cat.scala 30:58]
  wire [28:0] _T_566 = {_T_533[8:5],io_in[6:2],5'h2,3'h3,_T_533[4:0],7'h23}; // @[Cat.scala 30:58]
  wire [4:0] _T_604 = {io_in[1:0],io_in[15:13]}; // @[Cat.scala 30:58]
  wire [31:0] _WIRE_1_bits = {{4'd0}, _T_23}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _WIRE_bits = {{2'd0}, _T_10}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_606_bits = _T_604 == 5'h1 ? _WIRE_1_bits : _WIRE_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_2_bits = {{5'd0}, _T_39}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_608_bits = _T_604 == 5'h2 ? _WIRE_2_bits : _T_606_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_3_bits = {{4'd0}, _T_54}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_610_bits = _T_604 == 5'h3 ? _WIRE_3_bits : _T_608_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_4_bits = {{5'd0}, _T_76}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_612_bits = _T_604 == 5'h4 ? _WIRE_4_bits : _T_610_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_5_bits = {{4'd0}, _T_96}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_614_bits = _T_604 == 5'h5 ? _WIRE_5_bits : _T_612_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_6_bits = {{5'd0}, _T_118}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_616_bits = _T_604 == 5'h6 ? _WIRE_6_bits : _T_614_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_7_bits = {{4'd0}, _T_138}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_618_bits = _T_604 == 5'h7 ? _WIRE_7_bits : _T_616_bits; // @[package.scala 32:76]
  wire [31:0] _T_620_bits = _T_604 == 5'h8 ? _T_153 : _T_618_bits; // @[package.scala 32:76]
  wire [31:0] _T_622_bits = _T_604 == 5'h9 ? _T_169 : _T_620_bits; // @[package.scala 32:76]
  wire [31:0] _T_624_bits = _T_604 == 5'ha ? _T_181 : _T_622_bits; // @[package.scala 32:76]
  wire [31:0] _T_626_bits = _T_604 == 5'hb ? _T_234_bits : _T_624_bits; // @[package.scala 32:76]
  wire [31:0] _T_628_bits = _T_604 == 5'hc ? _T_298 : _T_626_bits; // @[package.scala 32:76]
  wire [31:0] _T_630_bits = _T_604 == 5'hd ? _T_354 : _T_628_bits; // @[package.scala 32:76]
  wire [31:0] _T_632_bits = _T_604 == 5'he ? _T_398 : _T_630_bits; // @[package.scala 32:76]
  wire [31:0] _T_634_bits = _T_604 == 5'hf ? _T_442 : _T_632_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_17_bits = {{6'd0}, _T_454}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_636_bits = _T_604 == 5'h10 ? _WIRE_17_bits : _T_634_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_18_bits = {{3'd0}, _T_464}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_638_bits = _T_604 == 5'h11 ? _WIRE_18_bits : _T_636_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_19_bits = {{4'd0}, _T_473}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_640_bits = _T_604 == 5'h12 ? _WIRE_19_bits : _T_638_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_20_bits = {{3'd0}, _T_482}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_642_bits = _T_604 == 5'h13 ? _WIRE_20_bits : _T_640_bits; // @[package.scala 32:76]
  wire [31:0] _T_644_bits = _T_604 == 5'h14 ? _T_530_bits : _T_642_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_25_bits = {{3'd0}, _T_540}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_646_bits = _T_604 == 5'h15 ? _WIRE_25_bits : _T_644_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_26_bits = {{4'd0}, _T_553}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_648_bits = _T_604 == 5'h16 ? _WIRE_26_bits : _T_646_bits; // @[package.scala 32:76]
  wire [31:0] _WIRE_27_bits = {{3'd0}, _T_566}; // @[RVC.scala 21:19 22:14]
  wire [31:0] _T_650_bits = _T_604 == 5'h17 ? _WIRE_27_bits : _T_648_bits; // @[package.scala 32:76]
  wire [31:0] _T_652_bits = _T_604 == 5'h18 ? io_in : _T_650_bits; // @[package.scala 32:76]
  wire [31:0] _T_654_bits = _T_604 == 5'h19 ? io_in : _T_652_bits; // @[package.scala 32:76]
  wire [31:0] _T_656_bits = _T_604 == 5'h1a ? io_in : _T_654_bits; // @[package.scala 32:76]
  wire [31:0] _T_658_bits = _T_604 == 5'h1b ? io_in : _T_656_bits; // @[package.scala 32:76]
  wire [31:0] _T_660_bits = _T_604 == 5'h1c ? io_in : _T_658_bits; // @[package.scala 32:76]
  wire [31:0] _T_662_bits = _T_604 == 5'h1d ? io_in : _T_660_bits; // @[package.scala 32:76]
  wire [31:0] _T_664_bits = _T_604 == 5'h1e ? io_in : _T_662_bits; // @[package.scala 32:76]
  assign io_out_bits = _T_604 == 5'h1f ? io_in : _T_664_bits; // @[package.scala 32:76]
endmodule

// module dff(
//   input clk,
//   input in,
//   input en,
//   output reg out
// );

//   always @(posedge clk)
//     if(!en)
//       out <= 0;
//     else
//       out <= in;

// endmodule

// module gt(
//   input a,
//   input b,
//   output out
// );
//   assign out = a > b ;

// endmodule

// module top(
//   input clock,
//   input reset,
//   input pos,
//   input clk,
//   input a,
//   input b,
//   input c,
//   output out
// );
// 	  reg temp;
//     reg temp1;
	  
//     // if (reset)
//     //   temp <= a;
//     // else if (clock)
//     //   temp <= b;
//     // else if (clk)
//     //   temp <= a;
//     // else
//     //   temp <= c;
//     // assign temp = a;
//     // assign temp = b;

	  
// 	  // always @(posedge clock) begin
// 	  //   if (reset)
// 		// 	 temp <= a;
// 		//  else
// 		//    temp <= b;
//     //   temp <= a;
//     //   temp1 <= b;
//  	  // end

//     // assign out = temp;
// endmodule

// module top(
//   input [1:0] a,
//   input [1:0] b,
//   input pos,
//   input pos_one,
//   input reset,
//   input clk,
//   output [1:0] out
//   //output out
// );
//   reg [1:0] temp [0:1];
//   if (a != b)
//     out = a;
//   //reg [1:0] temp;
//   // temp[pos_one] <= a;
//   // assign out = reset ? a : b;
//   //assign out = temp[pos] & a;
//   // assign out = a | b;
//   //assign out = pos ? a : b;
//   // assign out = temp[pos];
//   // assign temp[pos_one] = a;
//   //_1_ = a;
//   //\temp[0]  = pos_one ? \temp[0] : _1_;
//   //\temp[1]  = pos_one ? _1_ : \temp[1];
//   //assign out = pos ? \temp[1] : \temp[0];
//   // always @(posedge clk) begin
//   //   if (reset != pos)
//   //     temp[pos_one] <= a;
//   // end

// endmodule

// module top(
//   input          clock,
//   input          reset,
//   output         io_enq_ready,
//   input          io_enq_valid,
//   input   io_enq_bits_data,
//   input          io_deq_ready,
//   output         io_deq_valid,
//   output  io_deq_bits_data
// );
//   reg  ram_data [0:1]; // @[Decoupled.scala 224:95]
//   wire  ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 224:95]
//   wire  ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 224:95]
//   wire  ram_data_MPORT_data; // @[Decoupled.scala 224:95]
//   wire  ram_data_MPORT_addr; // @[Decoupled.scala 224:95]
//   wire  ram_data_MPORT_mask; // @[Decoupled.scala 224:95]
//   wire  ram_data_MPORT_en; // @[Decoupled.scala 224:95]
//   reg  value; // @[Counter.scala 60:40]
//   reg  value_1; // @[Counter.scala 60:40]
//   reg  maybe_full; // @[Decoupled.scala 227:27]
//   wire  ptr_match = value == value_1; // @[Decoupled.scala 228:33]
//   wire  full = ptr_match & maybe_full; // @[Decoupled.scala 230:24]
//   wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
//   wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
//   assign ram_data_io_deq_bits_MPORT_addr = value_1;
//   assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 224:95]
//   assign ram_data_MPORT_data = io_enq_bits_data;
//   assign ram_data_MPORT_addr = value;
//   assign ram_data_MPORT_mask = 1'h1;
//   assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
//   assign io_enq_ready = ~full; // @[Decoupled.scala 254:19]
//   assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 262:17]
//   always @(posedge clock) begin
//     if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
//       ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[Decoupled.scala 224:95]
//     end
//     if (reset) begin // @[Counter.scala 60:40]
//       value <= 1'h0; // @[Counter.scala 60:40]
//     end else if (do_enq) begin // @[Decoupled.scala 237:17]
//       value <= value + 1'h1; // @[Counter.scala 76:15]
//     end
//     if (reset) begin // @[Counter.scala 60:40]
//       value_1 <= 1'h0; // @[Counter.scala 60:40]
//     end else if (do_deq) begin // @[Decoupled.scala 241:17]
//       value_1 <= value_1 + 1'h1; // @[Counter.scala 76:15]
//     end
//     if (reset) begin // @[Decoupled.scala 227:27]
//       maybe_full <= 1'h0; // @[Decoupled.scala 227:27]
//     end else if (do_enq != do_deq) begin // @[Decoupled.scala 244:28]
//       maybe_full <= do_enq; // @[Decoupled.scala 245:16]
//     end 
//   end

// endmodule