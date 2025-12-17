# Verilog Counter Example

This repository contains a simple parameterizable counter and matching testbench built with plain Verilog and `make`.

## Directory layout
- `src/` – RTL modules (currently `counter.v`).
- `tb/` – Testbenches (currently `counter_tb.v`).
- `build/` – Output directory for compiled simulations and waveforms.

## Usage
1. Install a Verilog simulator such as `iverilog`/`vvp`.
2. Build and run the testbench:
   ```bash
   make run
   ```
   This compiles the RTL and testbench into `build/counter_tb.vvp` and runs it, producing `build/counter_tb.vcd`.
3. Clean generated artifacts:
   ```bash
   make clean
   ```

The design can be adjusted by editing the RTL in `src/` or adding additional testbenches in `tb/`.
