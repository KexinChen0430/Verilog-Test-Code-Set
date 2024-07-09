
// [例1] 宇宙飞船控制器的状态机
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
//设置独热码状态的参数 
parameter  HOLD=5'h1, SEQUENCE=5'h2, LAUNCH=5'h4; 
parameter  ON_MISSION=5'h8, LAND=5'h10;
reg   [4:0]  present_state,  next_state;
 
always @(negedge clk or posedge abort_mission) 
begin 
/****把输出设置成某个缺省值,在下面的case语句中 
           就不必再设置输出的缺省值*******/
{launch_shuttle, land_shuttle, start_trip_meter, start_countdown} =4'b0; 
/*检查异步reset的值即abort_mission的值*/ 
if(abort_mission) 
next_state=LAND; 
else  
begin   // if-else-begin 
/*如果reset为零,把next_state赋值为present_state*/ 
next_state = present_state; 
/*根据 present_state 和输入信号,设置 next_state 
和输出output*/ 
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
//取消使命前，一直留在使命状态 
if(just_launched) 
start_trip_meter = 1; 
LAND: if(is_landed) 
next_state = HOLD; 
else land_shuttle = 1; 
/*把缺省状态设置为'bx(无关)或某种已知状态，使其 
在做仿真时，在复位前就与实际情况相一致*/ 
default:  next_state = 'bx; 
endcase 
end  // end of if-else 
 
/*把当前状态变量设置为下一状态，待下一有效时钟沿来到 
时当前状态变量已设置了正确的状态值*/ 
present_state = next_state; 
end  //end of always 
endmodule 
