`timescale 1ns / 1ns
module t_cv_sd_rst;
    reg X;
    reg Clk;
    reg Rst;
    wire Z;
    
    Lab3_Converter_state_diagram M1(X, Clk, Rst, Z);

    initial begin
        Clk = 1;
        forever #5 Clk = ~Clk;
    end

    always @(posedge Clk) begin
        #2;
        X = {$random};
    end

    always @(posedge Clk) begin
        #2;
        Rst = ({$random} % 10 == 0) ? 1'b0 : 1'b1;
    end

    integer digit;
    integer count;
    reg invalid;
    reg [3:0] Excess3;
    reg [3:0] BCD;
    initial begin
        // $dumpfile("t_cv_sd_rst.vcd");
        // $dumpvars;
        digit = 0;
        count = 0;
        invalid = 1'b1;
        while (count < 10000) begin
            @(negedge Clk or negedge Rst);
            if (~Rst) begin
                digit = 0;
                invalid = 1'b0;
            end else begin
                Excess3[digit] = X;
                BCD[digit] = Z;
                if (digit == 3) begin
                    if (Excess3 < 3 || Excess3 > 12)
                        invalid = 1'b1;
                    if (~invalid) begin
                        $strobe("%t: %b -> %b", $time, Excess3, BCD);
                        count = count + 1;
                    end
                end
                digit = (digit + 1) % 4;
            end
        end
        $finish;
    end
endmodule
