`timescale 1ns/1ps

module adder_tb;
    localparam WIDTH = 8;
    localparam integer NUM_VECTORS = 1000;

    reg [WIDTH-1:0] a;
    reg [WIDTH-1:0] b;
    wire [WIDTH:0] sum;
    reg [WIDTH:0] expected;

    integer i;
    integer errors;
    integer seed;

    adder #(.WIDTH(WIDTH)) dut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        seed = 32'hC0FFEE;
        errors = 0;
        a = '0;
        b = '0;

        for (i = 0; i < NUM_VECTORS; i = i + 1) begin
            a = $random(seed);
            b = $random(seed);
            #1;
            expected = a + b;
            if (sum !== expected) begin
                errors = errors + 1;
                $display("Mismatch %0d: a=%0h b=%0h expected=%0h got=%0h", i, a, b, expected, sum);
            end
        end

        if (errors > 0) begin
            $display("Test completed with %0d mismatches out of %0d vectors.", errors, NUM_VECTORS);
            $fatal(1, "Adder produced mismatches.");
        end else begin
            $display("Test passed: all %0d random vectors matched expected sums.", NUM_VECTORS);
            $finish;
        end
    end
endmodule
