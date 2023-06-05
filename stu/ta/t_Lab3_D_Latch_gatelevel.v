`timescale 1ns / 1ns
module t_Lab3_D_Latch_gatelevel;
    reg D;
    reg E;
    wire Q;
    wire Qb;
    Lab3_D_Latch_gatelevel M1(D, E, Q, Qb);
    
    initial begin
        $dumpfile("t_Lab3_D_Latch_gatelevel.vcd");
        $dumpvars;
    end
    
    initial fork
        #0  {D, E} = 2'b00;
        #5  {D, E} = 2'b01;
        #10 {D, E} = 2'b00;
        #15 {D, E} = 2'b10;
        #20 {D, E} = 2'b11;
        #25 {D, E} = 2'b00;
        #30 {D, E} = 2'b01;
        #35 {D, E} = 2'b00;
        #50 {D, E} = 2'b11;
        #51 {D, E} = 2'b10;
        #70 $finish;
    join
endmodule
