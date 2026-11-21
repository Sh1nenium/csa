#!/usr/bin/env bash
# все листинги в asm/: ./run.sh
set -e
cd "$(dirname "$0")"
mkdir -p asm
X="gcc -S -masm=intel -fno-asynchronous-unwind-tables"
R="riscv64-linux-gnu-gcc -S"

for f in matmul strassen isa; do
    $X -O2                $f.c -o asm/$f-x86.s
    $R -O2 -march=rv64gc  $f.c -o asm/$f-rv.s
done
$X -O3 -march=native   matmul.c -o asm/matmul-x86-O3.s
$R -O3 -march=rv64gcv  matmul.c -o asm/matmul-rv-O3v.s
$X -O0                 isa.c    -o asm/isa-x86-O0.s
$R -O0 -march=rv64gc   isa.c    -o asm/isa-rv-O0.s
$R -O2 -march=rv64gc_zbb isa.c  -o asm/isa-rv-zbb.s
$X -O2 -fno-inline     strassen.c -o asm/strassen-x86-noinline.s
