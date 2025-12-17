`timescale 1ns/1ps

module counter_tb;
    localparam WIDTH = 4;
    reg clk;
    reg rst_n;
    reg en;
    wire [WIDTH-1:0] count;

    counter #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz clock equivalent
    end

    initial begin
        $dumpfile("build/counter_tb.vcd");
        $dumpvars(0, counter_tb);

        rst_n = 0;
        en    = 0;
        #20;

        rst_n = 1;
        en    = 1;
        #100;

        en    = 0;
        #40;

        $display("Final count: %0d", count);
        $finish;
    end
endmodule
