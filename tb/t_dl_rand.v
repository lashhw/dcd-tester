`timescale 1ns / 1ns
module t_dl_rand;
    reg D;
    reg E;
    wire Q;
    wire Qb;

    Lab3_D_Latch_gatelevel M1(.D(D), .E(E), .Q(Q), .Qb(Qb));

    always #1 $strobe(D, E, Q, Qb);
    always #({$random} % 30) D = ~D;
    always #({$random} % 30) E = ~E;

    initial begin
        // $dumpfile("t_dl_rand.vcd");
        // $dumpvars;
        D = 1'b0;
        E = 1'b0;
        #10000 $finish;
    end
endmodule