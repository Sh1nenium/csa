#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

gcc -std=c17 -O2 -Wall -Wextra -Wpedantic -fsanitize=undefined -o bits-check bits.c
./bits-check

gcc -std=c17 -O2 -S -masm=intel -fno-asynchronous-unwind-tables -o bits.s bits.c
gcc -std=c17 -O2 -march=x86-64-v3 -S -masm=intel -fno-asynchronous-unwind-tables -o bits-v3.s bits.c
gcc -std=c17 -O2 -S -masm=intel -fno-asynchronous-unwind-tables -o demo.s demo.c
listings="bits.s bits-v3.s"

riscv64-linux-gnu-gcc -std=c17 -O2 -march=rv64gc     -S -o bits-rv.s     bits.c
riscv64-linux-gnu-gcc -std=c17 -O2 -march=rv64gc_zbb -S -o bits-rv-zbb.s bits.c
riscv64-linux-gnu-gcc -std=c17 -O2 -march=rv64gc     -S -o demo-rv.s     demo.c
listings="$listings bits-rv.s bits-rv-zbb.s"

python3 count.py $listings

gcc -std=c17 -O2                                       -o bits          bits.c
gcc -std=c17 -O2 -march=x86-64-v3                      -o bits-v3       bits.c
gcc -std=c17 -O2 -fno-tree-vectorize                   -o bits-novec    bits.c
gcc -std=c17 -O2 -march=x86-64-v3 -fno-tree-vectorize  -o bits-v3-novec bits.c
for b in bits bits-v3 bits-novec bits-v3-novec; do
    for r in 1 2 3; do echo "$b #$r: $(./$b --bench | tail -1)"; done
done
