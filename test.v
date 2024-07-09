module Sine_Wave_Oscillation ()
    wire INOUT, SINOUT, ABSOUT, OUTPUT, EXPOUT, GND;
    
    VSIN V1(INOUT, GND);
    SINV M1(INOUT, SINOUT);
    ABSV M2(SINOUT, ABSOUT);
    ADDV M3(ABSOUT, OUTPUT);
    EXPV M4(INOUT,EXPOUT);
    Res2 R1(GND,INOUT);
    Res2 R2(GND,OUTPUT);    
endmodule