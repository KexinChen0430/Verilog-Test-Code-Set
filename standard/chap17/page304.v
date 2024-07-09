module page304;


wire       a1, a2, a3, a4, a5, a6, a7;
reg        b1, b2, b3;
wire [1:7] awire;
reg  [1:3] breg;
$async$and$array(mem,{a1,a2,a3,a4,a5,a6,a7},{b1,b2,b3}); 

$async$and$array(mem,awire, breg);

$sync$or$plane(mem,{a1,a2,a3,a4,a5,a6,a7}, {b1,b2,b3});

$async$nor$plane(mem,{a1,a2,a3,a4,a5,a6,a7},{b1,b2,b3});

$sync$nand$plane(mem,{a1,a2,a3,a4,a5,a6,a7}, {b1,b2,b3});

reg [1:n] mem[1:m];

endmodule