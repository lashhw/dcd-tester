`timescale 1ns / 1ns
module t_Lab3_D_FF_gatelevel;
    reg D;
    reg Clk;
    wire Q;
    wire Qb;
    Lab3_D_FF_gatelevel M1(D, Clk, Q, Qb);
    
    initial begin
        $dumpfile("t_Lab3_D_FF_gatelevel.vcd");
        $dumpvars;
        Clk = 0;
        forever #5 Clk = ~Clk;
    end
    
    initial fork
        #0  D = 0;
        #7  D = 1;
        #17 D = 0;
        #37 D = 1;
        #47 D = 0;
        #57 D = 1;
        #77 D = 0;
        #81 D = 1;
        #100 $finish;
    join
endmodule
