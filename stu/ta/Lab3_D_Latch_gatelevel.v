`timescale 1ns / 1ns
module Lab3_D_Latch_gatelevel(
    input D,
    input E,
    output Q,
    output Qb
);
    wire Db;
    wire R;
    wire S;
    
    not #1 (Db, D);
    and #1 (R, Db, E);
    and #1 (S, E, D);
    nor #1 (Q, R, Qb);
    nor #1 (Qb, Q, S);
endmodule
