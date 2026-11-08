#!/usr/bin/env bash
# весь прогон целиком: ./run.sh
set -e
cd "$(dirname "$0")"

uv run cpuinfo.py
uv run bench.py
uv run plot_python.py

gcc -O0                matmul.c -o matmul_O0
gcc -O2                matmul.c -o matmul
gcc -O3 -march=native  matmul.c -o matmul_O3
./matmul_O0 > matmul-O0.csv
./matmul    > matmul.csv
./matmul_O3 > matmul-O3.csv
uv run plot_orders.py matmul.csv     matmul-orders.png
uv run plot_orders.py matmul-O0.csv  matmul-orders-O0.png
uv run plot_orders.py matmul-O3.csv  matmul-orders-O3.png
uv run table.py matmul.csv

gcc -O2 strassen.c -o strassen -lm
./strassen > strassen.csv
uv run plot_strassen.py
