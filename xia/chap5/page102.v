
module SampleOfBus( DataBus, link_bus,write );
inout [11:0] DataBus;         // ����˫��˿�
input link_bus;               // ������������ݵĿ��Ƶ�ƽ
reg [11:0] outsigs;

assign DataBus = (link_bus) ? outsigs : 12'h zzz ;  
      //��link_busΪ�ߵ�ƽʱͨ�����߰Ѵ���outsigs�ļ�������� 
 
always @(posedge write)       //ÿ��write�ź�������ʱ 
   begin                      //�������������ݲ������� 
    outsigs <= DataBus * 5;   //�Ѽ���������outsigs 
   end 
 
endmodule