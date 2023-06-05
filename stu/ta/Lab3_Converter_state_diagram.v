`timescale 1ns / 1ns
module Lab3_Converter_state_diagram(
    input X,
    input Clk,
    input Rst,
    output reg Z
);
    reg [2:0] S, NS;
    localparam S0 = 3'b000,
               S1 = 3'b001,
               S2 = 3'b010,
               S3 = 3'b011,
               S4 = 3'b100,
               S5 = 3'b101,
               S6 = 3'b110,
               Sx = 3'bxxx;
    
    always @(posedge Clk, negedge Rst)
        if (!Rst) S <= S0;
        else S <= NS;

    always @(*)
        case(S)
            S0: NS = (X == 0) ? S4 : S1;
            S1: NS = (X == 0) ? S5 : S2;
            S2: NS = (X == 0) ? S3 : S3;
            S3: NS = (X == 0) ? S0 : S0;
            S4: NS = (X == 0) ? S5 : S5;
            S5: NS = (X == 0) ? S6 : S3;
            S6: NS = (X == 0) ? Sx : S0;
        endcase

    always @(*)
        case(S)
            S0: Z = (X == 0) ? 1'b1 : 1'b0;
            S1: Z = (X == 0) ? 1'b1 : 1'b0;
            S2: Z = (X == 0) ? 1'b0 : 1'b1;
            S3: Z = (X == 0) ? 1'b0 : 1'b1;
            S4: Z = (X == 0) ? 1'b0 : 1'b1;
            S5: Z = (X == 0) ? 1'b1 : 1'b0;
            S6: Z = (X == 0) ? 1'bx : 1'b0;
        endcase
endmodule
