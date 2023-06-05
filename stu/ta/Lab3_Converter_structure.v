`timescale 1ns / 1ns
module Lab3_Converter_structure(
    input X,
    input Clk,
    input Rst,
    output Z
);
    wire [2:0] S;
    wire Xb = ~X;
    wire [2:0] Sb = ~S;
    wire [2:0] D;
    
    D_FF_AR M1(D[2], Clk, Rst, S[2]);
    D_FF_AR M2(D[1], Clk, Rst, S[1]);
    D_FF_AR M3(D[0], Clk, Rst, S[0]);
    
    assign D[2] = (Sb[1] & Xb) | (S[2] & Sb[1] & Sb[0]);
    assign D[1] = (S[2] & S[0]) | (Sb[1] & S[0] & X) | (Sb[2] & S[1] & Sb[0]);
    assign D[0] = (Sb[2] & Sb[0] & X) | (Sb[2] & S[1] & Sb[0]) | (S[2] & Sb[1] & Sb[0]) | (S[2] & Sb[1] & X) | (Sb[2] & Sb[1] & S[0] & Xb);
    assign Z = (Sb[2] & Sb[1] & Xb) | (Sb[1] & S[0] & Xb) | (Sb[2] & S[1] & X) | (S[2] & Sb[1] & Sb[0] & X);
endmodule
