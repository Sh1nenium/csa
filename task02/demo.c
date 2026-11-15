#include <stdint.h>

unsigned f_and(unsigned x) { return x & 0xff; }
unsigned f_or (unsigned x) { return x | 1; }
unsigned f_shl(unsigned x) { return x << 3; }
int      f_sar(int x)      { return x >> 3; }
unsigned f_xor(unsigned x) { return x ^ (x >> 16); }

int d7(int x) { return x / 7; }
int m7(int x) { return x % 7; }
int dv(int x, int y) { return x / y; }
int mv(int x, int y) { return x % y; }

void rot3_tmp(int *a, int *b, int *c) {
    int t = *a; *a = *b; *b = *c; *c = t;
}

void rot3_xor(int *a, int *b, int *c) {
    *a ^= *b; *b ^= *a; *a ^= *b;
    *b ^= *c; *c ^= *b; *b ^= *c;
}

void rot3_arith(unsigned *a, unsigned *b, unsigned *c) {
    *a = *a + *b + *c;
    *c = *a - *b - *c;
    *b = *a - *b - *c;
    *a = *a - *b - *c;
}

int max_tern(int a, int b) { return a > b ? a : b; }
long sel_tern(long c, long a, long b) { return c ? a : b; }
int32_t sat_add32_tern(int32_t a, int32_t b) {
    uint32_t s = (uint32_t)a + (uint32_t)b;
    int ov = (int32_t)((((uint32_t)a ^ s) & ((uint32_t)b ^ s))) < 0;
    return ov ? (a < 0 ? INT32_MIN : INT32_MAX) : (int32_t)s;
}
