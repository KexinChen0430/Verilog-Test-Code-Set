
// [��1] ����ɴ���������״̬��
module  statmch1( launch_shuttle, land_shuttle, start_countdown, 
 start_trip_meter, clk, all_systems_go,  
just_launched, is_landed, cnt, abort_mission); 
output   launch_shuttle, land_shuttle, start_countdown, 
start_trip_meter; 
input     clk, just_launched, is_landed, abort_mission, 
 all_systems_go; 
input  [3:0]  cnt; 
reg      launch_shuttle, land_shuttle, start_countdown, 
          start_trip_meter; 
//���ö�����״̬�Ĳ��� 
parameter  HOLD=5'h1, SEQUENCE=5'h2, LAUNCH=5'h4; 
parameter  ON_MISSION=5'h8, LAND=5'h10;
reg   [4:0]  present_state,  next_state;
 
always @(negedge clk or posedge abort_mission) 
begin 
/****��������ó�ĳ��ȱʡֵ,�������case����� 
           �Ͳ��������������ȱʡֵ*******/
{launch_shuttle, land_shuttle, start_trip_meter, start_countdown} =4'b0; 
/*����첽reset��ֵ��abort_mission��ֵ*/ 
if(abort_mission) 
next_state=LAND; 
else  
begin   // if-else-begin 
/*���resetΪ��,��next_state��ֵΪpresent_state*/ 
next_state = present_state; 
/*���� present_state �������ź�,���� next_state 
�����output*/ 
case ( present_state ) 
HOLD: if(all_systems_go)

begin 
next_state = SEQUENCE; 
start_countdown = 1; 
end 
SEQUENCE: if(cnt==0) 
next_state = LAUNCH; 
 
LAUNCH: 
begin 
next_state = ON_MISSION; 
launch_shuttle = 1; 
end 
ON_MISSION:
//ȡ��ʹ��ǰ��һֱ����ʹ��״̬ 
if(just_launched) 
start_trip_meter = 1; 
LAND: if(is_landed) 
next_state = HOLD; 
else land_shuttle = 1; 
/*��ȱʡ״̬����Ϊ'bx(�޹�)��ĳ����֪״̬��ʹ�� 
��������ʱ���ڸ�λǰ����ʵ�������һ��*/ 
default:  next_state = 'bx; 
endcase 
end  // end of if-else 
 
/*�ѵ�ǰ״̬��������Ϊ��һ״̬������һ��Чʱ�������� 
ʱ��ǰ״̬��������������ȷ��״ֵ̬*/ 
present_state = next_state; 
end  //end of always 
endmodule 
