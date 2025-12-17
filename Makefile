IVERILOG ?= iverilog
VVP ?= vvp
BUILD_DIR := build

SRC := $(wildcard src/*.v)
TB  := $(wildcard tb/*.v)

.DEFAULT_GOAL := run

$(BUILD_DIR)/counter_tb.vvp: $(SRC) $(TB)
	@mkdir -p $(BUILD_DIR)
	$(IVERILOG) -g2012 -o $@ $^

.PHONY: run
run: $(BUILD_DIR)/counter_tb.vvp
	$(VVP) $<

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)/*
