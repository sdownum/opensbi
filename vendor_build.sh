#!/bin/bash

## Setup
export PATH=$PATH:./toolchain/sifive/tools/bin/:./toolchain/sifive/qemu/bin/
export CROSS_COMPILE=riscv64-unknown-elf-
export PLATFORM=qemu/virt
export VENDOR_NAME=eremitix
export VENDOR_TEMPLATE=./include/vendor/${VENDOR_NAME}/
export USERDEFS="-DVENDOR=${VENDOR_NAME}" 

## Create vendor header


## Build
echo +++ ${VENDOR_NAME} build for OpenSBI +++
make clean
make
echo +++  ${VENDOR_NAME} build finished   +++


## TODO: Generate vendor-specific header file on build
## TODO: Create argument to run qemu after build
## TODO: Test for existence of SiFive RISC-V build chain and QEMU in source tree
