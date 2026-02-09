#!/usr/bin/env bash

set -xe

fasm hello.asm
wasmtime --dir=. backjoon.wasm hello.bin hello.c
gcc hello.c -std=c99 -Wno-all -o hello
