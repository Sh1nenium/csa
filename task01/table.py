import csv
import math
import statistics
import sys

src = sys.argv[1] if len(sys.argv) > 1 else "matmul.csv"
t, ctrl = {}, {}
for r in csv.DictReader(open(src)):  # noqa: SIM115
    n = int(r["n"])
    t.setdefault((r["method"], n), []).append(float(r["seconds"]))
    ctrl.setdefault(n, set()).add(r["control"])

methods = ["ijk", "ikj", "jik", "jki", "kij", "kji"]
sizes = sorted({n for _, n in t})

print("| order | " + " | ".join(map(str, sizes)) + " | slope | GFLOPS@max |")
print("|---" * (len(sizes) + 3) + "|")
for m in methods:
    med = [statistics.median(t[(m, n)]) for n in sizes]
    slope = math.log(med[-1] / med[0]) / math.log(sizes[-1] / sizes[0])
    gf = 2 * sizes[-1] ** 3 / med[-1] / 1e9
    print(f"| {m} | " + " | ".join(f"{x:.4f}" for x in med) + f" | {slope:.2f} | {gf:.2f} |")

for n in sizes:
    print(f"control n={n}: {'OK' if len(ctrl[n]) == 1 else 'MISMATCH ' + str(ctrl[n])}")
