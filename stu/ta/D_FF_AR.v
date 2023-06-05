`timescale 1ns / 1ns
module D_FF_AR(
    input D,
    input Clk,
    input Rst,
    output reg Q
);
    always @(posedge Clk, negedge Rst)
        if (!Rst) Q <= 1'b0;
        else Q <= D;
endmodule
