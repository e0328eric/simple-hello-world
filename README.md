# Simple way to print `Hello, World!`

```console
fasm hello.asm
wasmtime --dir=. backjoon.wasm hello.bin hello.c
gcc hello.c -std=c99 -Wno-implicit-int -Wno-implicit-function-declaration -o hello
./hello
```

