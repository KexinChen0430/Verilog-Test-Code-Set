module page286;

forever @(negedge clock)
$strobe ("At time %d, data is %h",$time,data);

endmodule