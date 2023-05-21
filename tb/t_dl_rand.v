`timescale 1ns / 1ns
module t_dl_rand;
    reg D;
    reg E;
    wire Q;
    wire Qb;

    Lab3_D_Latch_gatelevel M1(D, E, Q, Qb);

    always #1 $display(D, E, Q, Qb);
    always #({$random} % 30) D = ~D;
    always #({$random} % 30) E = ~E;

    initial begin
        $dumpfile("t_dl_rand.vcd");
        $dumpvars;
        D = 0;
        E = 0;
        #10000 $finish;
    end
endmodule