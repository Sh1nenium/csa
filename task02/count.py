import re
import sys

FUNCS = ["bswap32", "is_pow2", "parity32", "popcount32", "ctz32", "clz32",
         "next_pow2", "sign_extend", "sat_add32",
         "is_pow2_branchy", "sat_add32_branchy"]
JUMP = re.compile(r"^(j(?!r$)[a-z]*|beqz?|bnez?|bltu?|bgeu?|bgtu?|bleu?|bltz|bgez|bgtz|blez)$")


def parse(path):
    funcs, cur = {}, None
    for line in open(path):  # noqa: SIM115
        m = re.match(r"^([A-Za-z_][\w.]*):", line)
        if m:
            name = m.group(1)
            cur = name if name in FUNCS else (cur if name.startswith(".L") else None)
            if cur and cur not in funcs:
                funcs[cur] = []
            continue
        s = line.strip()
        if cur and s and not s.startswith(".") and not s.startswith("#") and s != "endbr64":
            funcs[cur].append(s.split()[0])
    return funcs


files = sys.argv[1:]
data = [parse(f) for f in files]
print("| функция | " + " | ".join(files) + " |")
print("|---|" + "---|" * len(files))
for fn in FUNCS:
    cells = []
    for d in data:
        ops = d.get(fn, [])
        jumps = [o for o in ops if JUMP.match(o)]
        cells.append(f"{len(ops)}" + (f" ({', '.join(sorted(set(jumps)))})" if jumps else ""))
    print(f"| {fn} | " + " | ".join(cells) + " |")
