# my codex try

## Prerequisites
- [Icarus Verilog](http://iverilog.icarus.com/) (`iverilog`) installed and on your `PATH`.
- GNU `make` available to drive the simulations.

## How to run
1. From the repository root, build and run the testbench:
   ```sh
   make sim
   ```
2. The Makefile compiles the adder and its testbench with `iverilog` and then runs the resulting simulation image.
3. On success you should see a single `PASS` line summarizing the vectors covered. Any mismatch triggers a `FAIL` line and stops the run with a non-zero exit code.

**Expected output (successful run):**
```
iverilog -o build/adder_tb adder.v adder_tb.v
vvp build/adder_tb
PASS: 1003/1003 test vectors matched expected sums and carry bits
```

## Adder interface
- **Parameter**: `WIDTH` (default: 8) — bit-width of the operands and sum.
- **Ports**:
  - `input  [WIDTH-1:0] a`
  - `input  [WIDTH-1:0] b`
  - `output [WIDTH-1:0] sum`
  - `output             carry_out` (final carry bit for overflow detection)

## Test coverage
The testbench exercises a wide set of cases to validate correctness:
- Zero vector: `a = 0`, `b = 0`.
- All-ones vector: `a = 2^WIDTH - 1`, `b = 2^WIDTH - 1`.
- Max-plus-one overflow check: `a = 2^WIDTH - 1`, `b = 1` (verifies carry-out behavior).
- 1000 random operand pairs to sample the remaining space.

Each vector compares the simulated sum and carry-out against the expected arithmetic result. The simulation exits with `PASS` when every vector matches, or `FAIL` at the first mismatch.
