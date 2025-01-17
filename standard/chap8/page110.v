primitive latch (q, clock, data);
output q; reg q;
input clock, data;
// clock data q q+

table
0 1 : ? : 1 ;
0 0 : ? : 0 ;
1 ? : ? : - ;// - = no change
endtable
endprimitive

primitive d_edge_ff (q, clock, data);
output q; reg q;
input clock, data;
table
// clock dataqq+
// obtain output on rising edge of clock
(01) 0:?:0;
(01) 1:?:1;
(0?) 1:1:1;
(0?) 0:0:0;
// ignore negative edge of clock
(?0) ?:?:-;
// ignore data changes on steady clock
 ?(??):?:-;
endtable
endprimitive

