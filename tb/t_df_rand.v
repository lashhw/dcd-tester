`timescale 1ns / 1ns
module t_df_rand;
    reg D;
    reg Clk;
    wire Q;
    wire Qb;

    Lab3_D_FF_gatelevel M1(D, Clk, Q, Qb);

    always #1 $display(D, Clk, Q, Qb);
    always #({$random} % 30) D = ~D;

    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    initial begin
        $dumpfile("t_df_rand.vcd");
        $dumpvars;
        D = 0;
        #10000 $finish;
    end
endmodule
