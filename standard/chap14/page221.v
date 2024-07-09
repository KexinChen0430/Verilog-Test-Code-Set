module page221;

specify
// Unknown polarity
(In1 => q) = In_to_q ;
(s  *> q) = s_to_q ;

// Positive polarity
(In1 +=> q) = In_to_q ;
(s +*> q) = s_to_q ;

// Negative polarity
(In1 -=> q) = In_to_q ;
(s  -*> q) = s_to_q ;

endspecify

endmodule