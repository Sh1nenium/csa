#define _POSIX_C_SOURCE 200809L
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAXN 1024
#define RUNS 5
#define THRESH 64

static int n;
static double a[MAXN][MAXN], b[MAXN][MAXN];
static double c[MAXN][MAXN], ref[MAXN][MAXN];

static double now(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + ts.tv_nsec * 1e-9;
}

static void init(void) {
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++) {
            a[i][j] = (double)rand() / RAND_MAX;
            b[i][j] = (double)rand() / RAND_MAX;
        }
}

/* Эталон: обычное умножение, нужно для проверки и как базовый случай. */
static void naive(double out[MAXN][MAXN]) {
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++) {
            double s = 0;
            for (int k = 0; k < n; k++)
                s += a[i][k] * b[k][j];
            out[i][j] = s;
        }
}

static void addsub(int m, const double *A, int sa, const double *B, int sb,
                   double *C, int sc, double sign) {
    for (int i = 0; i < m; i++)
        for (int j = 0; j < m; j++)
            C[i*sc + j] = A[i*sa + j] + sign * B[i*sb + j];
}

static void base(int m, const double *A, int sa, const double *B, int sb,
                 double *C, int sc) {
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < m; j++) C[i*sc + j] = 0;
        for (int k = 0; k < m; k++) {
            double x = A[i*sa + k];
            for (int j = 0; j < m; j++)
                C[i*sc + j] += x * B[k*sb + j];
        }
    }
}

static void rec(int m, const double *A, int sa, const double *B, int sb, double *C, int sc) {
    if (m <= THRESH) { base(m, A, sa, B, sb, C, sc); return; }

    int h = m / 2;
    const double *A11 = A, *A12 = A + h, *A21 = A + h*sa, *A22 = A + h*sa + h;
    const double *B11 = B, *B12 = B + h, *B21 = B + h*sb, *B22 = B + h*sb + h;
    double *C11 = C, *C12 = C + h, *C21 = C + h*sc, *C22 = C + h*sc + h;

    double *buf = malloc(sizeof(double) * 9 * h * h);
    double *M[7], *T1 = buf + 7*h*h, *T2 = buf + 8*h*h;
    for (int i = 0; i < 7; i++) M[i] = buf + i*h*h;

    addsub(h, A11, sa, A22, sa, T1, h, +1); 
    addsub(h, B11, sb, B22, sb, T2, h, +1);
    rec(h, T1, h, T2, h, M[0], h); /* M1=(A11+A22)(B11+B22) */
    addsub(h, A21, sa, A22, sa, T1, h, +1);
    rec(h, T1, h, B11, sb, M[1], h); /* M2=(A21+A22)B11 */
    addsub(h, B12, sb, B22, sb, T2, h, -1);
    rec(h, A11, sa, T2, h, M[2], h); /* M3=A11(B12-B22) */
    addsub(h, B21, sb, B11, sb, T2, h, -1);
    rec(h, A22, sa, T2, h, M[3], h); /* M4=A22(B21-B11) */
    addsub(h, A11, sa, A12, sa, T1, h, +1);
    rec(h, T1, h, B22, sb, M[4], h); /* M5=(A11+A12)B22 */
    addsub(h, A21, sa, A11, sa, T1, h, -1); 
    addsub(h, B11, sb, B12, sb, T2, h, +1);
    rec(h, T1, h, T2, h, M[5], h); /* M6=(A21-A11)(B11+B12) */
    addsub(h, A12, sa, A22, sa, T1, h, -1); 
    addsub(h, B21, sb, B22, sb, T2, h, +1);
    rec(h, T1, h, T2, h, M[6], h); /* M7=(A12-A22)(B21+B22) */

    for (int i = 0; i < h; i++)
        for (int j = 0; j < h; j++) {
            int k = i*h + j;
            C11[i*sc + j] = M[0][k] + M[3][k] - M[4][k] + M[6][k];
            C12[i*sc + j] = M[2][k] + M[4][k];
            C21[i*sc + j] = M[1][k] + M[3][k];
            C22[i*sc + j] = M[0][k] - M[1][k] + M[2][k] + M[5][k];
        }
    free(buf);
}

static void strassen(void) {
    int m = 1;
    while (m < n) m *= 2;
    double *A = calloc((size_t)m*m, sizeof(double));
    double *B = calloc((size_t)m*m, sizeof(double));
    double *C = malloc(sizeof(double) * m*m);
    for (int i = 0; i < n; i++) {
        memcpy(A + i*m, a[i], sizeof(double) * n);
        memcpy(B + i*m, b[i], sizeof(double) * n);
    }
    rec(m, A, m, B, m, C, m);
    for (int i = 0; i < n; i++)
        memcpy(c[i], C + i*m, sizeof(double) * n);
    free(A); free(B); free(C);
}

static double maxdiff(void) {
    double d = 0;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++) {
            double x = fabs(c[i][j] - ref[i][j]);
            if (x > d) d = x;
        }
    return d;
}

int main(void) {
    const int sizes[] = {128, 256, 512, 1024};
    const int nsizes = (int)(sizeof sizes / sizeof sizes[0]);

    printf("n,method,run,seconds,gflops,maxdiff\n");
    for (int s = 0; s < nsizes; s++) {
        n = sizes[s];
        init();
        naive(ref);

        for (int m = 0; m < 2; m++) {
            const char *name = m ? "strassen" : "naive";
            for (int r = 1; r <= RUNS; r++) {
                for (int i = 0; i < n; i++)
                    for (int j = 0; j < n; j++)
                        c[i][j] = 0.0;

                double t0 = now();
                if (m) strassen();
                else   naive(c);
                double t = now() - t0;

                printf("%d,%s,%d,%.6f,%.3f,%.3e\n",
                       n, name, r, t, 2.0 * n * n * n / t / 1e9, maxdiff());
            }
        }
    }
    return 0;
}
