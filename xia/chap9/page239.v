/****************************************************************************
Intel 8085a 微处理器仿真模块的Verilog源代码 
注意：作者不能保证本模块的完整和精确，使用本模块者如遇问题一切责任自负 
*****************************************************************************/ 
  
module intel_8085a 
        (clock, x2, resetff, sodff, sid, trap, rst7p5, rst6p5, rst5p5,  
         intr, intaff, ad, a, s0, aleff, writeout, readout, s1,iomout,  
         ready, nreset, clockff, hldaff, hold); 
 
    reg [8:1]      dflags; 
    initial         dflags = 'b011; 
    // diag flags: 
    // 1 = trace instructions 
    // 2 = trace IN and OUT instructions 
    // 3 = trace instruction count 
 
    output 
        resetff, sodff, intaff, s0, aleff, 
        writeout, readout, s1, iomout, clockff, hldaff; 
 
    inout[7:0] ad, a; 

    input 
            clock, x2, sid, trap, 
            rst7p5, rst6p5, rst5p5, 
            intr, ready, nreset, hold; 
 
    reg[15:0] 
        pc,        // program counter 
        sp,        // stack pointer 
        addr;      // address output 
 
    reg[8:0] 
        intmask;   // interrupt mask and status 
 
    reg[7:0] 
        acc,       // accumulator 
        regb,      // general 
        regc,      // general 
        regd,      // general 
        rege,      // general 
        regh,      // general 
        regl,      // general 
        ir,        // instruction 
        data;      // data output 
 
    reg 
        aleff,     // address latch enable 
        s0ff,      // status line 0 
        s1ff,      // status line 1 
        hldaff,    // hold acknowledge 
        holdff,    // internal hold 
        intaff,    // interrupt acknowledge 
        trapff,    // trap interrupt request 
        trapi,     // trap execution for RIM instruction 
        inte,      // previous state of interrupt enable flag 
        int,       // interrupt acknowledge in progress 
        validint,  // interrupt pending 
        haltff,    // halt request 
        resetff,   // reset output 
        clockff,   // clock output 
        sodff,     // serial output data 
        read,      // read request signal 
        write,     // write request signal 
        iomff,     // i/o memory select 
        acontrol,  // address output control 
        dcontrol,  // data output control
        s,         // data source control 
        cs,        // sign condition code 
        cz,        // zero condition code 
        cac,       // aux carry condition code 
        cp,        // parity condition code 
        cc;        // carry condition code 
 
    wire 
        s0 = s0ff & ~haltff, 
        s1 = s1ff & ~haltff; 
 
    tri[7:0] 
        ad = dcontrol ? (s ? data : addr[7:0]) : 'bz, 
        a = acontrol ? addr[15:8] : 'bz; 
 
    tri 
        readout = acontrol ? read : 'bz, 
        writeout = acontrol ? write : 'bz, 
        iomout = acontrol ? iomff : 'bz; 
 
    event 
        ec1, // clock 1 event 
        ec2; // clock 2 event 
 
    // internal clock generation 
    always begin 
        @(posedge clock) -> ec1; 
        @(posedge clock) -> ec2; 
    end 
 
    integer instruction; // instruction count 
    initial instruction = 0; 
 
    always begin:run_processor 
        #1 reset_sequence; 
        fork                                             
            execute_instructions;             // Instructions executed 
            wait(!nreset)                     // in parallel with reset   
                @ec2 disable run_processor; // control. Reset will      
        join                                  // disable run_processor    
    end                                       // and all tasks and        
                                              // functions enabled from   
                                              // it when nreset set to 0. 
     task reset_sequence;
    begin 
        wait(!nreset) 
        fork 
            begin 
                $display("Performing 8085(%m) reset sequence"); 
                read = 1; 
                write = 1; 
                resetff = 1; 
                dcontrol = 0; 
                @ec1 // synchronized with clock 1 event 
                    pc = 0; 
                    ir = 0; 
                    intmask[3:0] = 7; 
                    intaff = 1; 
                    acontrol = 0; 
                    aleff = 0; 
                    intmask[7:5] = 0; 
                    sodff = 0; 
                    trapff = 0; 
                    trapi = 0; 
                    iomff = 0; 
                    haltff = 0; 
                    holdff = 0; 
                    hldaff = 0; 
                    validint = 0; 
                    int = 0; 
                disable check_reset; 
            end 
            begin:check_reset 
                wait(nreset)               // Check, in parallel with the 
                    disable run_processor; // reset sequence, that nreset 
            end                            // remains at 0. 
        join 
        wait(nreset) @ec1 @ec2 resetff = 0; 
    end 
    endtask 
 
 
    /* fetch and execute instructions */ 
    task execute_instructions; 
    forever begin 
        instruction = instruction + 1; 
        if(dflags[3]) 
            $display("executing instruction %d", instruction); 

        @ec1 // clock cycle 1 
            addr = pc; 
            s = 0; 
            iomff = 0; 
            read = 1; 
            write = 1; 
            acontrol = 1; 
            dcontrol = 1; 
            aleff = 1; 
            if(haltff) begin 
                haltff = 1; 
                s0ff = 0; 
                s1ff = 0; 
                haltreq; 
            end 
            else begin 
                s0ff = 1; 
                s1ff = 1; 
            end 
        @ec2 
            aleff = 0; 
 
        @ec1 // clock cycle 2 
            read = 0; 
            dcontrol = 0; 
        @ec2 
            ready_hold; 
 
        @ec2 // clock cycle 3 
            read = 1; 
            data = ad; 
            ir = ad; 
 
        @ec1 // clock cycle 4 
            if(do6cycles(ir)) begin 
                // do a 6-cycle instruction fetch 
                @ec1 @ec2 // conditional clock cycle 5 
                    if(hold) begin 
                        holdff =1 ; 
                        acontrol = 0; 
                        dcontrol = 0; 
                        @ec2 hldaff = 1; 
                    end 
                    else begin 
                        holdff = 0;
                        hldaff = 0; 
                    end 
 
                @ec1; // conditional clock cycle 6 
            end 
 
            if(holdff) holdit; 
            checkint; 
            do_instruction; 
 
            while(hold) @ec2 begin 
                acontrol = 0; 
                dcontrol = 0; 
            end 
            holdff = 0; 
            hldaff = 0; 
            if(validint) interrupt; 
    end 
    endtask 
 
 
    function do6cycles; 
    input[7:0] ireg; 
    begin 
        do6cycles = 0; 
        case(ireg[2:0]) 
            0, 4, 5, 7: if(ireg[7:6] == 3) do6cycles = 1; 
            1: if((ireg[3] == 1) && (ireg[7:5] == 7)) do6cycles = 1; 
            3: if(ireg[7:6] == 0) do6cycles = 1; 
        endcase 
    end 
    endfunction 
 
 
    task checkint; 
    begin 
        if(rst6p5) 
            if((intmask[3] == 1) && (intmask[1] == 0)) intmask[6] = 1; 
        else 
            intmask[6] = 0; 
 
        if(rst5p5) 
            if((intmask[3] == 1) && (intmask[0] == 0)) intmask[5] = 1; 
        else 
            intmask[5] = 0;
 
        if({intmask[7], intmask[3:2]} == 6) 
            intmask[4] = 1; 
        else 
            intmask[4] = 0; 
 
        validint = (intmask[6:4] == 7) | trapff | intr; 
    end 
    endtask 
 
 
    // concurently with executing instructions, 
    // process primary inputs for processor interrupt 
    always @(posedge trap) trapff = 1; 
 
    always @(negedge trap) trapff = 0; 
 
    always @(posedge rst7p5) intmask[7] = 1; 
 
 
    /* check condition of ready and hold inputs */ 
    task ready_hold; 
    begin 
        while(!ready) @ec2; 
        @ec1 
            if(hold) begin 
                holdff = 1; 
                @ec2 hldaff = 1; 
            end 
    end 
    endtask 
 
 
    /* hold */ 
    task holdit; 
    begin 
        while(hold) @ec2 begin 
            acontrol = 0; 
            dcontrol = 0; 
        end 
        holdff = 0; 
        @ec2 hldaff = 0; 
    end 
    endtask 

 
    /* halt request */ 
    task haltreq; 
    forever begin 
        @ec2 
            if(validint) begin 
                haltff = 0; 
                interrupt; 
                disable haltreq; 
            end 
            else begin 
                while(hold) @ec2 hldaff = 1; 
                hldaff = 0; 
                @ec2; 
            end 
 
        @ec1 #10 
            dcontrol = 0; 
            acontrol = 0; 
            checkint; 
    end 
    endtask 
 
    /* memory read */ 
    task memread; 
    output[7:0] rdata; 
    input[15:0] raddr; 
    begin 
        @ec1 
            addr = raddr; 
            s = 0; 
            acontrol = 1; 
            dcontrol = 1; 
            iomff = int; 
            s0ff = int; 
            s1ff = 1; 
            aleff = 1; 
        @ec2 
            aleff = 0; 
 
        @ec1  
            dcontrol = 0; 
            if(int) 
                intaff = 0;
            else 
                read = 0; 
        @ec2 
            ready_hold; 
            checkint; 
 
        @ec2 
            intaff = 1; 
            read = 1; 
            rdata = ad; 
        if(holdff) holdit; 
    end 
    endtask 
 
    /* memory write */ 
    task memwrite; 
    input[7:0] wdata; 
    input[15:0] waddr; 
    begin 
        @ec1 
            aleff = 1; 
            s0ff = 1; 
            s1ff = 0; 
            s = 0; 
            iomff = 0; 
            addr = waddr; 
            acontrol = 1; 
            dcontrol = 1; 
        @ec2 
            aleff = 0; 
 
        @ec1 
            data = wdata; 
            write = 0; 
            s = 1; 
        @ec2 
            ready_hold; 
            checkint; 
 
        @ec2 
            write = 1; 
        if(holdff) holdit; 
    end 
    endtask 

    /* reads from an i/o port */ 
    task ioread; 
    input[7:0] sa; 
    begin 
        @ec1 
            aleff = 1; 
            s0ff = 0; 
            s1ff = 1; 
            s = 0; 
            iomff = 1; 
            addr = {sa, sa}; 
            acontrol = 1; 
            dcontrol = 1; 
 
        @ec2 
            aleff = 0; 
 
        @ec1 
            dcontrol = 0; 
            if(int) 
                intaff = 0; 
            else 
                read = 0; 
 
        @ec2 
            ready_hold; 
 
            checkint; 
 
        @ec2 
            intaff = 1; 
            read = 1; 
            acc = ad; 
            if(dflags[2]) 
                $display("IN %h   data = %h", sa, acc); 
    end 
    endtask 
 
    /* writes into i/o port */ 
    task iowrite; 
    input[7:0] sa; 
    begin 
        @ec1 
            addr = {sa, sa}; 
            aleff = 1;
            s0ff = 1; 
            s1ff = 0; 
            s = 0; 
            iomff = 1; 
            acontrol = 1; 
            dcontrol = 1; 
 
        @ec2 
            aleff = 0; 
 
        @ec1 
            data = acc; 
            write = 0; 
            s = 1; 
 
            if(dflags[2]) 
                $display("OUT %h   data = %h", sa, acc); 
 
        @ec2 
            ready_hold; 
 
            checkint; 
 
        @ec2 
            write = 1; 
            if(holdff) holdit; 
    end 
    endtask 
 
    task interrupt; 
    begin 
        @ec1 
            if(hold) begin 
                holdff = 1; 
                holdit; 
                @ec2 hldaff = 1; 
            end 
            if(trapff) begin 
                inte = intmask[3]; 
                trapi = 1; 
                intic; 
                pc = 'h24; 
                trapi = 1; 
                trapff = 0; 
            end
            else if(intmask[7]) begin 
                intic; 
                pc = 'h3c; 
                intmask[7] = 0; 
            end 
            else if(intmask[6]) begin 
                intic; 
                pc = 'h34; 
                intmask[6] = 0; 
            end 
            else if(intmask[5]) begin 
                intic; 
                pc = 'h2c; 
                intmask[5] = 0; 
            end 
            else if(intr) begin 
                //? 
            end 
    end 
    endtask 
 
    task intic; 
    begin 
        aleff = 1; 
        s0ff = 1; 
        s1ff = 1; 
        s = 0; 
        iomff = 1; 
        addr = pc; 
        read = 1; 
        write = 1; 
        acontrol = 1; 
        dcontrol = 1; 
 
        @ec2 aleff = 0; 
        @ec1 dcontrol = 0; 
        repeat(4) @ec1; 
        push2b(pc[15:8], pc[7:0]); 
    end 
    endtask 
 
 
    /* execute instruction */ 
    task do_instruction; 
    begin
      if(dflags[1]) 
        $display( "C%bZ%bM%bE%bI%b A=%h B=%h%h D=%h%h H=%h%h S=%h P=%h IR=%h", 
                  cc, cz, cs, cp, cac, acc, regb,regc, regd,rege, regh,regl, 
                  sp, pc, ir); 
 
        pc = pc + 1; 
        @ec2 // instruction decode synchronized with clock 2 event 
            case(ir[7:6]) 
                0: 
                    case(ir[2:0]) 
                        0: newops; 
                        1: if(ir[3]) addhl; else lrpi; 
                        2: sta_lda; 
                        3: inx_dcx; 
                        4: inr; 
                        5: dcr; 
                        6: movi; 
                        7: racc_spec; 
                    endcase 
                1: 
                    move; 
                2: 
                    rmop; 
                3: 
                    case(ir[2:0]) 
                        0, 
                        2, 
                        4: condjcr; 
                        1: if(ir[3]) decode1; else pop; 
                        3: decode2; 
                        5: if(ir[3]) decode3; else push; 
                        6: immacc; 
                        7: restart; 
                    endcase 
            endcase 
    end 
    endtask 
 
    /* move register to register */ 
    task move; 
        case(ir[2:0]) 
            0: rmov(regb); // MOV -,B 
            1: rmov(regc); // MOV -,C 
            2: rmov(regd); // MOV -,D 
            3: rmov(rege); // MOV -,E
            4: rmov(regh); // MOV -,H 
            5: rmov(regl); // MOV -,L 
            6: 
                if(ir[5:3] == 6) haltff = 1; // HLT 
                else begin // MOV -,M 
                    memread(data, {regh, regl}); 
                    rmov(data); 
                end 
 
            7: rmov(acc); // MOV -,A 
        endcase 
    endtask 
 
    /* enabled only by move */ 
    task rmov; 
    input[7:0] fromreg; 
        case(ir[5:3]) 
            0: regb = fromreg; // MOV B,- 
            1: regc = fromreg; // MOV C,- 
            2: regd = fromreg; // MOV D,- 
            3: rege = fromreg; // MOV E,- 
            4: regh = fromreg; // MOV H,- 
            5: regl = fromreg; // MOV L,- 
            6: memwrite(fromreg, {regh, regl}); // MOV M,- 
            7: acc = fromreg; // MOV A,- 
        endcase 
    endtask 
 
    /* move register and memory immediate */ 
    task movi; 
    begin 
        case(ir[5:3]) 
            0: memread(regb, pc); // MVI B 
            1: memread(regc, pc); // MVI C 
            2: memread(regd, pc); // MVI D 
            3: memread(rege, pc); // MVI E 
            4: memread(regh, pc); // MVI H 
            5: memread(regl, pc); // MVI L 
            6: // MVI M 
                begin 
                    memread(data, pc); 
                    memwrite(data, {regh, regl}); 
                end 
            7: memread(acc, pc); // MVI A
        endcase 
        pc = pc + 1; 
    end 
    endtask 
 
    /* increment register and memory contents */ 
    task inr; 
        case(ir[5:3]) 
            0: doinc(regb); // INR B 
            1: doinc(regc); // INR C 
            2: doinc(regd); // INR D 
            3: doinc(rege); // INR E 
            4: doinc(regh); // INR H 
            5: doinc(regl); // INR L 
            6: // INR M 
                begin 
                    memread(data, {regh, regl}); 
                    doinc(data); 
                    memwrite(data, {regh, regl}); 
                end 
 
            7: doinc(acc); // INR A 
        endcase 
    endtask 
 
    /* enabled only from incrm */ 
    task doinc; 
    inout[7:0] sr; 
    begin 
        cac = sr[3:0] == 'b1111; 
        sr = sr + 1; 
        calpsz(sr); 
    end 
    endtask 
 
    /* decrement register and memory contents */ 
    task dcr; 
        case(ir[5:3]) 
            0: dodec(regb); // DCR B 
            1: dodec(regc); // DCR C 
            2: dodec(regd); // DCR D 
            3: dodec(rege); // DCR E 
            4: dodec(regh); // DCR H 
            5: dodec(regl); // DCR L 
            6: // DCR M
                begin 
                    memread(data, {regh, regl}); 
                    dodec(data); 
                    memwrite(data, {regh, regl}); 
                end 
 
            7: dodec(acc); // DCR A 
        endcase 
    endtask 
 
    /* enabled only from decrm */ 
    task dodec; 
    inout[7:0] sr; 
    begin 
        cac = sr[3:0] == 0; 
        sr = sr - 1; 
        calpsz(sr); 
    end 
    endtask 
 
    /* register and memory acc instructions */ 
    task rmop; 
        case(ir[2:0]) 
            0: doacci(regb); 
            1: doacci(regc); 
            2: doacci(regd); 
            3: doacci(rege); 
            4: doacci(regh); 
            5: doacci(regl); 
            6: 
                begin 
                    memread(data, {regh, regl}); 
                    doacci(data); 
                end 
 
            7: doacci(acc); 
        endcase 
    endtask 
 
 
    /* immediate acc instructions */ 
    task immacc; 
    begin 
        memread(data, pc); 
        pc = pc + 1;
        doacci(data); 
    end 
    endtask 
 
 
    /* operate on accumulator */ 
    task doacci; 
    input[7:0] sr; 
    reg[3:0] null4; 
    reg[7:0] null8; 
        case(ir[5:3]) 
            0: // ADD ADI 
                begin 
                    {cac, null4} = acc + sr; 
                    {cc, acc} = {1'b0, acc} + sr; 
                    calpsz(acc); 
                end 
 
            1: // ADC ACI 
                begin 
                    {cac, null4} = acc + sr + cc; 
                    {cc, acc} = {1'b0, acc} + sr + cc; 
                    calpsz(acc); 
                end 
 
            2: // SUB SUI 
                begin 
                    {cac, null4} = acc - sr; 
                    {cc, acc} = {1'b0, acc} - sr; 
                    calpsz(acc); 
                end 
 
            3: // SBB SBI 
                begin 
                    {cac, null4} = acc - sr - cc; 
                    {cc, acc} = {1'b0, acc} - sr - cc; 
                    calpsz(acc); 
                end 
 
            4: // ANA ANI 
                begin 
                    acc = acc & sr; 
                    cac = 1; 
                    cc = 0; 
                    calpsz(acc);
                end 
 
            5: // XRA XRI 
                begin 
                    acc = acc ^ sr; 
                    cac = 0; 
                    cc = 0; 
                    calpsz(acc); 
                end 
 
            6: // ORA ORI 
                begin 
                    acc = acc | sr; 
                    cac = 0; 
                    cc = 0; 
                    calpsz(acc); 
                end 
 
            7: // CMP CPI 
                begin 
                    {cac, null4} = acc - sr; 
                    {cc, null8} = {1'b0, acc} - sr; 
                    calpsz(null8); 
                end 
        endcase 
    endtask 
 
    /* rotate acc and special instructions */ 
    task racc_spec; 
        case(ir[5:3]) 
            0: // RLC 
                begin 
                    acc = {acc[6:0], acc[7]}; 
                    cc = acc[7]; 
                end 
 
            1: // RRC 
                begin 
                    acc = {acc[0], acc[7:1]}; 
                    cc = acc[0]; 
                end 
 
            2: // RAL 
                {cc, acc} = {acc, cc}; 

            3: // RAR 
                {acc, cc} = {cc, acc}; 
 
            4: // DAA, decimal adjust 
                begin 
                    if((acc[3:0] > 9) || cac) acc = acc + 6; 
                    if((acc[7:4] > 9) || cc) {cc, acc} = {1'b0, acc} + 'h60; 
                end 
 
            5: // CMA 
                acc = ~acc; 
 
            6: // STC 
                cc = 1; 
 
            7: // CMC 
                cc = ~cc; 
        endcase 
    endtask 
 
 
    /* increment and decrement register pair */ 
    task inx_dcx; 
        case(ir[5:3]) 
            0: {regb, regc} = {regb, regc} + 1; // INX B 
            1: {regb, regc} = {regb, regc} - 1; // DCX B 
            2: {regd, rege} = {regd, rege} + 1; // INX D 
            3: {regd, rege} = {regd, rege} - 1; // DCX D 
            4: {regh, regl} = {regh, regl} + 1; // INX H 
            5: {regh, regl} = {regh, regl} - 1; // DCX H 
            6: sp = sp + 1;                     // INX SP 
            7: sp = sp - 1;                     // DCX SP 
        endcase 
    endtask 
 
    /* load register pair immediate */ 
    task lrpi; 
        case(ir[5:4]) 
            0: adread({regb, regc}); // LXI B 
            1: adread({regd, rege}); // LXI D 
            2: adread({regh, regl}); // LXI H
            3: adread(sp);           // LXI SP
        endcase
    endtask

    /* add into regh, regl pair */
    task addhl;
    begin
        case(ir[5:4])
            0: {cc, regh, regl} = {1'b0, regh, regl} + {regb, regc}; // DAD B
            1: {cc, regh, regl} = {1'b0, regh, regl} + {regd, rege}; // DAD D
            2: {cc, regh, regl} = {1'b0, regh, regl} + {regh, regl}; // DAD H
            3: {cc, regh, regl} = {1'b0, regh, regl} + sp;           // DAD SP
        endcase
        holdreq;
        holdreq;
    end
    endtask


    /* store and load instruction */
    task sta_lda;
    reg[15:0] ra;
        case(ir[5:3])
            0: memwrite(acc, {regb, regc}); // STAX B
            1: memread(acc, {regb, regc});  // LDAX B
            2: memwrite(acc, {regd, rege}); // STAX D
            3: memread(acc, {regd, rege});  // LDAX D

            4: // SHLD 
                begin 
                    adread(ra); 
                    memwrite(regl, ra); 
                    memwrite(regh, ra + 1); 
                end 
            5: // LHLD 
                begin 
                    adread(ra); 
                    memread(regl, ra); 
                    memread(regh, ra + 1); 
                end 
 
            6: // STA 
                begin 
                    adread(ra); 
                    memwrite(acc, ra); 
                end 
            7: // LDA 
                begin
                    adread(ra); 
                    memread(acc, ra); 
                end 
        endcase 
    endtask 
 
    /* push register pair from stack */
    task push; 
        case(ir[5:4]) 
            0: push2b(regb, regc); // PUSH B 
            1: push2b(regd, rege); // PUSH D 
            2: push2b(regh, regl); // PUSH H 
            3: push2b(acc, {cs,cz,1'b1,cac,1'b1,cp,1'b1,cc}); // PUSH PSW 
        endcase 
    endtask 
 
    /* push 2 bytes onto stack */ 
    task push2b; 
    input[7:0] highb, lowb; 
    begin 
        sp = sp - 1; 
        memwrite(highb, sp); 
        sp = sp - 1; 
        memwrite(lowb, sp); 
    end 
    endtask 
 
 
    /* pop register pair from stack */ 
    task pop; 
    reg null1; 
        case(ir[5:4]) 
            0: pop2b(regb, regc); // POP B 
            1: pop2b(regd, rege); // POP D
            2: pop2b(regh, regl); // POP H 
            3: pop2b(acc, 
                {cs, cz, null1, cac, null1, cp, null1, cc}); // POP PSW 
        endcase 
    endtask 
 
    /* pop 2 bytes from stack */ 
    task pop2b; 
    output[7:0] highb, lowb; 
    begin 
        memread(lowb, sp);
        sp = sp + 1; 
        memread(highb, sp); 
        sp = sp + 1; 
    end 
    endtask 
 
    /* check hold request */ 
    task holdreq; 
    begin 
        aleff = 0; 
        s0ff = 0; 
        s1ff = 1; 
        iomff = 0; 
        addr = pc; 
        if(hold) begin 
            holdff = 1;
            acontrol = 0; 
            dcontrol = 0; 
            @ec2 hldaff = 1; 
        end 
        else begin 
            acontrol = 1; 
            dcontrol = 1; 
        end 
        @ec1 dcontrol = 0; 
        @ec1 @ec2; 
    end 
    endtask 
 
    /* conditional jump, call and return instructions */ 
    task condjcr; 
    reg branch; 
    begin 
        case(ir[5:3]) 
            0: branch = !cz; // JNZ CNZ RNZ 
            1: branch = cz;  // JZ  CZ  RZ 
            2: branch = !cc; // JNC CNC RNC 
            3: branch = cc;  // JC  CC  RC 
            4: branch = !cp; // JPO CPO RPO 
            5: branch = cp;  // JPE CPE RPE 
            6: branch = !cs; // JP  CP  RP 
            7: branch = cs;  // JM  CM  RM 
        endcase
        if(branch) 
        memread(lowb, sp);
        sp = sp + 1; 
        memread(highb, sp); 
        sp = sp + 1; 
    end 
    endtask 
 
    /* check hold request */ 
    task holdreq; 
    begin 
        aleff = 0; 
        s0ff = 0; 
        s1ff = 1; 
        iomff = 0; 
        addr = pc; 
        if(hold) begin 
            holdff = 1; 
            acontrol = 0; 
            dcontrol = 0; 
            @ec2 hldaff = 1; 
        end 
        else begin 
            acontrol = 1; 
            dcontrol = 1; 
        end 
        @ec1 dcontrol = 0;
        @ec1 @ec2; 
    end 
    endtask 
 
    /* conditional jump, call and return instructions */ 
    task condjcr; 
    reg branch; 
    begin 
        case(ir[5:3]) 
            0: branch = !cz; // JNZ CNZ RNZ 
            1: branch = cz;  // JZ  CZ  RZ 
            2: branch = !cc; // JNC CNC RNC 
            3: branch = cc;  // JC  CC  RC 
            4: branch = !cp; // JPO CPO RPO 
            5: branch = cp;  // JPE CPE RPE 
            6: branch = !cs; // JP  CP  RP 
            7: branch = cs;  // JM  CM  RM 
        endcase 
        if(branch) 
    end
    endtask 
 
 
    /* new instructions - except for NOP */ 
    task newops; 
        case(ir[5:3]) 
            0: ; // NOP
 
            4: // RIM 
                begin 
                    acc = {sid, intmask[7:5], intmask[3:0]}; 
                    if(trapi) begin 
                        intmask[3] = inte; 
                        trapi = 0; 
                    end 
                end 
 
            6: // SIM 
                begin 
                    if(acc[3]) begin 
                        intmask[2:0] = acc[2:0]; 
                        intmask[6:5] = intmask[6:5] & acc[1:0]; 
                    end 
                    intmask[8] = acc[4]; 
                    if(acc[6]) @ec1 @ec1 @ec2 sodff = acc[7]; 
                end 
 
            default no_instruction; 
        endcase 
    endtask 
 
 
    /* decode 1 instructions */ 
    task decode1;
        case(ir[5:4]) 
            0: pop2b(pc[15:8], pc[7:0]); // RET 
            2: pc = {regh, regl}; // PCHL 
            3: sp = {regh, regl}; // SPHL 
            default no_instruction; 
        endcase 
    endtask 
 
 
    /* decode 2 instructions */ 
    task decode2;
    reg[7:0] saveh, savel; 
        case(ir[5:3]) 
            0: adread(pc); // JMP 
 
            2: // OUT 
                begin 
                    memread(data, pc); 
                    pc = pc + 1; 
                    iowrite(data); 
                end 
 
            3: // IN 
                begin 
                    memread(data, pc); 
                    pc = pc + 1; 
                    ioread(data);
                end 
 
            4: // XTHL 
                begin 
                    saveh = regh; 
                    savel = regl; 
                    pop2b(regh, regl); 
                    push2b(saveh, savel); 
                end 
 
            5: // XCHG 
                begin 
                    saveh = regh; 
                    savel = regl; 
                    regh = regd;
                    regl = rege; 
                    regd = saveh; 
                    rege = savel; 
                end 
 
            6: // DI, disable interrupt 
                {intmask[6:5], intmask[3]} = 0; 
 
            7: // EI, enable interrupt 
                intmask[3] = 1; 
 
            default no_instruction;
        endcase 
    endtask
 
 
    /* decode 3 instructions */ 
    task decode3; 
        case(ir[5:4]) 
            0: // CALL 
                begin :call
                    reg [15:0] newpc; 
                    adread(newpc); 
                    push2b(pc[15:8], pc[7:0]); 
                    pc = newpc; 
                end 
 
            default no_instruction; 
        endcase 
    endtask 
 
 
    /* fetch address from pc+1, pc+2 */ 
    task adread; 
    output[15:0] address; 
    begin 
        memread(address[7:0], pc); 
        pc = pc + 1; 
        memread(address[15:8], pc);
        if(!int) pc = pc + 1; 
    end 
    endtask
 
 
    /* calculate cp cs and cz */ 
    task calpsz; 
    input[7:0] tr; 
    begin 
        cp = ^tr; 
        cz = tr == 0; 
        cs = tr[7]; 
    end 
    endtask 
 
 
    /* undefined instruction */ 
    task no_instruction; 
    begin 
        $display("Undefined instruction");
        dumpstate; 
        $finish; 
    end 
    endtask 
 
 
    /* print the state of the 8085a */
    task dumpstate; 
    begin 
        $write( "\nDUMP OF 8085A REGISTERS\n", 
            "acc=%h regb=%h regc=%h regd=%h rege=%h regh=%h regl=%h\n", 
                acc, regb, regc, regd, rege, regh, regl, 
            "cs=%h cz=%h cac=%h cp=%h cc=%h\n", 
                cs, cz, cac, cp, cc, 
            "pc=%h sp=%h addr=%h ir=%h data=%h\n", 
                pc, sp, ir, addr, data, 
            "intmask=%h aleff=%h s0ff=%h s1ff=%h hldaff=%h holdff=%h\n", 
                intmask, aleff, s0ff, s1ff, hldaff, holdff, 
            "intaff=%h trapff=%h trapi=%h inte=%h int=%h validint=%h\n", 
                intaff, trapff, trapi, inte, int, validint, 
            "haltff=%h resetff=%h clockff=%h sodff=%h\n", 
                haltff, resetff, clockff, sodff, 
            "read=%h write=%h iomff=%h acontrol=%h dcontrol=%h s=%h\n", 
                read, write, iomff, acontrol, dcontrol, s, 
            "clock=%h x2=%h sid=%h trap=%h rst7p5=%h rst6p5=%h rst5p5=%h\n",
                clock, x2, sid, trap, rst7p5, rst6p5, rst5p5, 
            "intr=%h nreset=%h hold=%h ready=%h a=%h ad=%h\n\n", 
                intr, nreset, hold, ready, a, ad, 
            "instructions executed = %d\n\n", instruction); 
    end 
    endtask 
 
endmodule /* of i85 */   
