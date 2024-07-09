module page290;

c = $fgetc ( fd ); 

code = $ungetc ( c, fd ); 

integer code ;
code = $fgets ( str, fd ); 

// page 291
integer code ;
code = $fscanf ( fd, format, args );
code = $sscanf ( str, format, args );

// page 293

integer code ;
code = $fread( myreg, fd);
code = $fread( mem, fd);
code = $fread( mem, fd, start);
code = $fread( mem, fd, start, count);
code = $fread( mem, fd, , count);

endmodule