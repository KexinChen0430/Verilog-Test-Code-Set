module tri_latch (qout, nqout, clock, data, enable);
output qout, nqout;
input clock, data, enable;
tri qout, nqout;

not #5        n1 (ndata,data);
nand #(3,5)   n2 (wa,data,clock),
              n3 (wb,ndata,clock);
nand #(12,15) n4 (q,nq,wa),
              n5 (nq,q,wb);
bufif1 #(3,7,13) q_drive(qout,q,enable),
                 nq_drive(nqout,nq,enable);
endmodule