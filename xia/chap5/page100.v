
module compare_n ( X, Y, XGY, XSY, XEY); 
input [width-1:0]  X, Y; 
output  XGY,  XSY, XEY; 
reg   XGY,  XSY,  XEY; 
parameter width = 8; 
 
always @ ( X or Y )                    //  ÿ�� X �� Y �仯ʱ 
 begin 
          if ( X == Y ) 
                   XEY = 1;         // ����X ����Y���ź�Ϊ1 
          else  XEY = 0; 
              
          if (X > Y) 
                   XGY = 1;         // ����X ����Y���ź�Ϊ1 
          else  XGY = 0; 
              
          if (X < Y) 
                     XSY = 1;       // ����X С��Y���ź�Ϊ1 
          else     XSY =  0; 
 end 
endmodule 
