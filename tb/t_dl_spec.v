`timescale 1ns / 1ns
module t_dl_spec;
    reg D;
    reg E;
    wire Q;
    wire Qb;

    Lab3_D_Latch_gatelevel M1(D, E, Q, Qb);

    always #1 $strobe(D, E, Q, Qb);

    initial begin
        // $dumpfile("t_dl_spec.vcd");
        // $dumpvars;
    end
    
    initial fork
        #0   {D, E} = 2'b00;
        #5   {D, E} = 2'b01;
        #10  {D, E} = 2'b00;
        #15  {D, E} = 2'b10;
        #20  {D, E} = 2'b11;
        #25  {D, E} = 2'b00;
        #30  {D, E} = 2'b01;
        #35  {D, E} = 2'b00;
        #50  {D, E} = 2'b11;
        #51  {D, E} = 2'b10;
        #100 $finish;
    join
endmodule
