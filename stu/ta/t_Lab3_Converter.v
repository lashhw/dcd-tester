`timescale 1ns / 1ns
module t_Lab3_Converter;
    reg X;
    reg Clk;
    reg Rst;
    wire Z_state_diagram;
    wire Z_structure;
    
    integer i;
    reg [3:0] Excess3;
    reg [3:0] BCD_state_diagram;
    reg [3:0] BCD_structure;
    
    Lab3_Converter_state_diagram M1(X, Clk, Rst, Z_state_diagram);
    Lab3_Converter_structure M2(X, Clk, Rst, Z_structure);
    
    initial begin
        $dumpfile("t_Lab3_Converter.vcd");
        $dumpvars;
        Clk = 1;
        forever #5 Clk = ~Clk;
    end
    
    initial begin
        Rst = 1;
        #1 Rst = 0;
        #1 Rst = 1;
        for (Excess3 = 3; Excess3 <= 12; Excess3 = Excess3 + 1) begin
            for (i = 0; i <= 3; i = i + 1) begin
                X = Excess3[i];
                #3;
                // negedge
                BCD_state_diagram[i] = Z_state_diagram;
                BCD_structure[i] = Z_structure;
                #7;
            end
            $display("%b -> %b (state_diagram)", Excess3, BCD_state_diagram);
            $display("%b -> %b (structure)", Excess3, BCD_structure);
        end
        $finish;
    end
endmodule
