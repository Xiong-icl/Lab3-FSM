#!/bin/bash

~/Documents/iac/lab0-devtools/tools/attach_usb.sh

# Translate Verilog -> C++ including testbench
verilator   -Wall --trace \
            -cc f1_fsm.sv \
            --exe f1_fsm_tb.cpp \
            --prefix "Vdut" \
            -o Vdut \
            -LDFLAGS "-lgtest -lgtest_main -lpthread" \

# Build C++ project with automatically generated Makefile
make -j -C obj_dir/ -f Vdut.mk

# Run executable simulation file
./obj_dir/Vdut
    