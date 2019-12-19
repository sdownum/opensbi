#!/bin/bash

## Setup
export PATH=$PATH:./toolchain/sifive/tools/bin/:./toolchain/sifive/qemu/bin/
export CROSS_COMPILE=riscv64-unknown-elf-
export PLATFORM=qemu/virt
export PLATFORM_TAG=`echo ${PLATFORM} | sed s*/*-*g`
export VENDOR_NAME=eremitix
export VENDOR_BUILD_TAG=${VENDOR_NAME}-${PLATFORM_TAG}-`date +"%d.%m.%Y.%H%M"`
export USERDEFS="-DVENDOR=${VENDOR_NAME} -DVENDOR_BUILD_TAG=${VENDOR_BUILD_TAG}" 


## Build
echo +++ ${VENDOR_NAME} build for OpenSBI +++
echo +++       ${VENDOR_BUILD_TAG}        +++
make clean
make
echo +++  ${VENDOR_NAME} build finished   +++


## Run QEMU, if requested
if [[ $# -eq 1 ]] && [[ $1 == "--qemu" ]]; then
    qemu-system-riscv64  -machine virt -kernel ./build/platform/qemu/virt/firmware/fw_payload.elf -display none -serial stdio
fi