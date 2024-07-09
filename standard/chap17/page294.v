module page294;

integer pos ;
pos = $ftell ( fd ); 

code = $fseek ( fd, offset, operation );
code = $rewind ( fd ); 

// page 295
$fflush ( mcd );
$fflush ( fd );
$fflush ( );

integer errno ;
errno = $ferror ( fd, str );

// page 296
integer code;
code = $feof ( fd );

// page 297
initial $readmemh("mem.data", mem);
initial $readmemh("mem.data", mem, 16);
initial $readmemh("mem.data", mem, 128, 1);

endmodule