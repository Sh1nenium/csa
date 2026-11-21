int max2(int a, int b) {
    return a > b ? a : b;
}

int max3(int a, int b, int c) {
    int m = a > b ? a : b;
    return m > c ? m : c;
}

long sum(const long *a, long n) {
    long s = 0;
    for (long i = 0; i < n; i++)
        s += a[i];
    return s;
}

long f(long n) {
    long s = 0;
    for (long i = 0; i < n; i++) s += i * i;
    return s;
}
