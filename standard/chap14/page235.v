module page235;

specify
(a=>out)=(2,3);
(b =>out)=(3,4);
endspecify

specify
(a=>out)=(2,3);
showcancelled out;
(b =>out)=(3,4);
endspecify

specify
showcancelled out;
pulsestyle_ondetect out;
(a => out) = (2,3);
(b => out) = (4,5);
showcancelled out_b;
pulsestyle_ondetect out_b;
(a => out_b) = (3,4);
(b => out_b) = (5,6);
endspecify
specify
showcancelled out,out_b;
pulsestyle_ondetect out,out_b;
(a => out) = (2,3);
(b => out) = (4,5);
(a => out_b) = (3,4);
(b => out_b) = (5,6);
endspecify

endmodule