import csv
import statistics
import sys

import matplotlib.pyplot as plt

# python plot_orders.py [matmul.csv] [matmul-orders.png]
src = sys.argv[1] if len(sys.argv) > 1 else "matmul.csv"
out = sys.argv[2] if len(sys.argv) > 2 else "matmul-orders.png"

data = {}
with open(src) as f:
    for row in csv.DictReader(f):
        key = (row["method"], int(row["n"]))
        data.setdefault(key, []).append(float(row["seconds"]))

methods = ["ijk", "ikj", "jik", "jki", "kij", "kji"]
colors  = ["#0072B2", "#E69F00", "#009E73", "#D55E00", "#CC79A7", "#56B4E9"]
markers = ["o", "s", "^", "D", "v", "P"]

for method, color, marker in zip(methods, colors, markers):
    ns = sorted(n for (m, n) in data if m == method)
    med = [statistics.median(data[(method, n)]) for n in ns]
    plt.plot(ns, med, marker=marker, color=color, label=method)

plt.xscale("log")
plt.yscale("log")
plt.xlabel("размер матрицы n")
plt.ylabel("медиана времени, с")
plt.title(src)
plt.legend()
plt.grid(True, which="both")
plt.tight_layout()
plt.savefig(out, dpi=150)
