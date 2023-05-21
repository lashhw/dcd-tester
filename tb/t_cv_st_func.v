`timescale 1ns / 1ns
module t_cv_st_func;
    reg X;
    reg Clk;
    reg Rst;
    wire Z;
    
    Lab3_Converter_structure M1(X, Clk, Rst, Z);

    initial begin
        Clk = 1;
        forever #5 Clk = ~Clk;
    end
    
    integer digit;
    reg [3:0] Excess3;
    reg [3:0] BCD;
    initial begin
        $dumpfile("t_cv_st_func.vcd");
        $dumpvars;
        Rst = 1'b0;
        @(posedge Clk);
        repeat (10000) begin
            Excess3 = {$random} % 10 + 3;
            for (digit = 0; digit <= 3; digit = digit + 1) begin
                #2;
                X = Excess3[digit];
                Rst = 1'b1;
                @(negedge Clk)
                BCD[digit] = Z;
                @(posedge Clk);
            end
            $display("%b -> %b", Excess3, BCD);
        end
        $finish;
    end
endmodule
