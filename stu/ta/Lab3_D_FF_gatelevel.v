`timescale 1ns / 1ns
module Lab3_D_FF_gatelevel(
    input D,
    input Clk,
    output Q,
    output Qb
);
    wire Clkb;
    wire Clkbb;
    wire Y;
    wire Yb;
    
    not #1 (Clkb, Clk);
    not #1 (Clkbb, Clkb);
    Lab3_D_Latch_gatelevel M1(D, Clkb, Y, Yb);
    Lab3_D_Latch_gatelevel M2(Y, Clkbb, Q, Qb);
endmodule
