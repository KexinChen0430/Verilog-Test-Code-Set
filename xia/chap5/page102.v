
module SampleOfBus( DataBus, link_bus,write );
inout [11:0] DataBus;         // 总线双向端口
input link_bus;               // 向总线输出数据的控制电平
reg [11:0] outsigs;

assign DataBus = (link_bus) ? outsigs : 12'h zzz ;  
      //当link_bus为高电平时通过总线把存在outsigs的计算结果输出 
 
always @(posedge write)       //每当write信号上跳沿时 
   begin                      //接收总线上数据并乘以五 
    outsigs <= DataBus * 5;   //把计算结果存入outsigs 
   end 
 
endmodule