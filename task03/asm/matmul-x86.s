	.file	"matmul.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.type	mul_ijk, @function
mul_ijk:
	endbr64
	mov	r11d, DWORD PTR n[rip]
	test	r11d, r11d
	jle	.L19
	movsxd	rax, r11d
	push	r15
	lea	rdi, a[rip]
	xor	r10d, r10d
	push	r14
	push	r13
	lea	r13, [rax+rax*2]
	push	r12
	mov	r8, r13
	mov	r12d, r11d
	sal	r13, 8
	push	rbp
	sal	r8, 11
	lea	rbp, c[rip]
	shr	r12d
	push	rbx
	lea	rbx, b[rip]
	mov	r9, rbp
	sal	r12, 4
	lea	r14, [rbx+r8]
.L3:
	cmp	r11d, 1
	je	.L11
.L9:
	lea	r15, [r12+r9]
	mov	rcx, r14
	mov	rsi, r9
	.p2align 4
	.p2align 3
.L5:
	mov	rax, rcx
	movapd	xmm1, XMMWORD PTR [rsi]
	mov	rdx, rdi
	sub	rax, r8
	.p2align 6
	.p2align 4
	.p2align 3
.L4:
	movsd	xmm0, QWORD PTR [rdx]
	add	rax, 6144
	add	rdx, 8
	unpcklpd	xmm0, xmm0
	mulpd	xmm0, XMMWORD PTR -6144[rax]
	addpd	xmm1, xmm0
	cmp	rax, rcx
	jne	.L4
	movaps	XMMWORD PTR [rsi], xmm1
	add	rsi, 16
	lea	rcx, 16[rax]
	cmp	rsi, r15
	jne	.L5
	test	r11b, 1
	je	.L6
	mov	esi, r11d
	and	esi, -2
.L10:
	movsxd	r15, r10d
	movsxd	rsi, esi
	lea	rax, [r15+r15*2]
	lea	rdx, [rsi+r13]
	sal	rax, 8
	lea	rcx, [rbx+rdx*8]
	mov	rdx, rdi
	add	rax, rsi
	movsd	xmm1, QWORD PTR 0[rbp+rax*8]
	lea	rax, [rbx+rsi*8]
	.p2align 5
	.p2align 4
	.p2align 3
.L7:
	movsd	xmm0, QWORD PTR [rax]
	mulsd	xmm0, QWORD PTR [rdx]
	add	rax, 6144
	add	rdx, 8
	addsd	xmm1, xmm0
	cmp	rax, rcx
	jne	.L7
	lea	rax, [r15+r15*2]
	add	r10d, 1
	add	rdi, 6144
	add	r9, 6144
	sal	rax, 8
	add	rax, rsi
	movsd	QWORD PTR 0[rbp+rax*8], xmm1
	cmp	r10d, r11d
	jne	.L3
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L6:
	add	r10d, 1
	add	rdi, 6144
	add	r9, 6144
	cmp	r11d, r10d
	jne	.L9
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L11:
	xor	esi, esi
	jmp	.L10
.L19:
	ret
	.size	mul_ijk, .-mul_ijk
	.p2align 4
	.type	mul_ikj, @function
mul_ikj:
	endbr64
	mov	r8d, DWORD PTR n[rip]
	test	r8d, r8d
	jle	.L38
	mov	esi, r8d
	lea	r9, c[rip]
	push	r14
	lea	r10, a[rip]
	shr	esi
	push	r13
	mov	rdx, r9
	push	r12
	sal	rsi, 4
	xor	r12d, r12d
	push	rbp
	lea	rbp, b[rip]
	push	rbx
	movsxd	rbx, r8d
	.p2align 4
	.p2align 3
.L25:
	movsxd	rax, r12d
	lea	rcx, b[rip]
	xor	edi, edi
	lea	r11, [rax+rax*2]
	sal	r11, 8
	.p2align 4
	.p2align 3
.L27:
	movsd	xmm2, QWORD PTR [r10+rdi*8]
	movsxd	r13, edi
	cmp	r8d, 1
	je	.L33
.L31:
	movapd	xmm1, xmm2
	xor	eax, eax
	unpcklpd	xmm1, xmm1
	.p2align 5
	.p2align 4
	.p2align 3
.L29:
	movapd	xmm0, XMMWORD PTR [rcx+rax]
	mulpd	xmm0, xmm1
	addpd	xmm0, XMMWORD PTR [rdx+rax]
	movaps	XMMWORD PTR [rdx+rax], xmm0
	add	rax, 16
	cmp	rsi, rax
	jne	.L29
	test	r8b, 1
	je	.L26
	mov	r14d, r8d
	and	r14d, -2
.L32:
	lea	r13, 0[r13+r13*2]
	movsxd	r14, r14d
	add	rdi, 1
	add	rcx, 6144
	sal	r13, 8
	lea	rax, [r11+r14]
	add	r13, r14
	mulsd	xmm2, QWORD PTR 0[rbp+r13*8]
	addsd	xmm2, QWORD PTR [r9+rax*8]
	movsd	QWORD PTR [r9+rax*8], xmm2
	cmp	rdi, rbx
	jne	.L27
.L28:
	add	r12d, 1
	add	rdx, 6144
	add	r10, 6144
	cmp	r12d, r8d
	jne	.L25
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	add	rdi, 1
	cmp	rbx, rdi
	je	.L28
	movsd	xmm2, QWORD PTR [r10+rdi*8]
	add	rcx, 6144
	movsxd	r13, edi
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L33:
	xor	r14d, r14d
	jmp	.L32
.L38:
	ret
	.size	mul_ikj, .-mul_ikj
	.p2align 4
	.type	mul_jik, @function
mul_jik:
	endbr64
	movsxd	rax, DWORD PTR n[rip]
	test	eax, eax
	jle	.L49
	lea	r9, [rax+rax*2]
	lea	r8, b[rip]
	push	rbx
	sal	r9, 11
	lea	r10, c[rip]
	lea	r11, a[rip]
	lea	rcx, [r8+r9]
	lea	rbx, [r10+rax*8]
	add	r9, r11
	.p2align 4
	.p2align 3
.L43:
	mov	rdi, r11
	mov	rsi, r10
	.p2align 4
	.p2align 3
.L46:
	movsd	xmm1, QWORD PTR [rsi]
	mov	rax, r8
	mov	rdx, rdi
	.p2align 5
	.p2align 4
	.p2align 3
.L44:
	movsd	xmm0, QWORD PTR [rdx]
	mulsd	xmm0, QWORD PTR [rax]
	add	rax, 6144
	add	rdx, 8
	addsd	xmm1, xmm0
	cmp	rax, rcx
	jne	.L44
	add	rdi, 6144
	movsd	QWORD PTR [rsi], xmm1
	add	rsi, 6144
	cmp	rdi, r9
	jne	.L46
	add	r10, 8
	add	r8, 8
	add	rcx, 8
	cmp	r10, rbx
	jne	.L43
	pop	rbx
	ret
.L49:
	ret
	.size	mul_jik, .-mul_jik
	.p2align 4
	.type	mul_jki, @function
mul_jki:
	endbr64
	movsxd	rax, DWORD PTR n[rip]
	test	eax, eax
	jle	.L60
	lea	rcx, [rax+rax*2]
	lea	r8, c[rip]
	sal	rax, 3
	push	rbx
	sal	rcx, 11
	lea	r10, b[rip]
	lea	r11, a[rip]
	add	rcx, r8
	lea	rbx, [r10+rax]
	lea	r9, [r11+rax]
	.p2align 4
	.p2align 3
.L54:
	mov	rsi, r11
	mov	rdi, r10
	.p2align 4
	.p2align 3
.L57:
	movsd	xmm1, QWORD PTR [rdi]
	mov	rdx, rsi
	mov	rax, r8
	.p2align 6
	.p2align 4
	.p2align 3
.L55:
	movsd	xmm0, QWORD PTR [rdx]
	add	rax, 6144
	add	rdx, 6144
	mulsd	xmm0, xmm1
	addsd	xmm0, QWORD PTR -6144[rax]
	movsd	QWORD PTR -6144[rax], xmm0
	cmp	rax, rcx
	jne	.L55
	add	rsi, 8
	add	rdi, 6144
	cmp	rsi, r9
	jne	.L57
	add	r10, 8
	add	r8, 8
	add	rcx, 8
	cmp	r10, rbx
	jne	.L54
	pop	rbx
	ret
.L60:
	ret
	.size	mul_jki, .-mul_jki
	.p2align 4
	.type	mul_kij, @function
mul_kij:
	endbr64
	mov	r8d, DWORD PTR n[rip]
	test	r8d, r8d
	jle	.L78
	mov	esi, r8d
	push	r13
	lea	r10, c[rip]
	push	r12
	shr	esi
	lea	r12, a[rip]
	push	rbp
	sal	rsi, 4
	xor	ebp, ebp
	push	rbx
	lea	rbx, b[rip]
	mov	rcx, rbx
	.p2align 4
	.p2align 3
.L65:
	movsxd	rax, ebp
	lea	rdx, c[rip]
	mov	r9, r12
	xor	edi, edi
	lea	r11, [rax+rax*2]
	sal	r11, 8
	.p2align 4
	.p2align 3
.L67:
	movsd	xmm2, QWORD PTR [r9]
	cmp	r8d, 1
	je	.L73
.L71:
	movapd	xmm1, xmm2
	xor	eax, eax
	unpcklpd	xmm1, xmm1
	.p2align 5
	.p2align 4
	.p2align 3
.L69:
	movapd	xmm0, XMMWORD PTR [rcx+rax]
	mulpd	xmm0, xmm1
	addpd	xmm0, XMMWORD PTR [rdx+rax]
	movaps	XMMWORD PTR [rdx+rax], xmm0
	add	rax, 16
	cmp	rsi, rax
	jne	.L69
	test	r8b, 1
	je	.L66
	mov	r13d, r8d
	and	r13d, -2
.L72:
	movsxd	rax, edi
	movsxd	r13, r13d
	add	edi, 1
	add	r9, 6144
	lea	rax, [rax+rax*2]
	add	rdx, 6144
	sal	rax, 8
	add	rax, r13
	add	r13, r11
	mulsd	xmm2, QWORD PTR [rbx+r13*8]
	addsd	xmm2, QWORD PTR [r10+rax*8]
	movsd	QWORD PTR [r10+rax*8], xmm2
	cmp	edi, r8d
	jne	.L67
.L68:
	add	ebp, 1
	add	rcx, 6144
	add	r12, 8
	cmp	ebp, r8d
	jne	.L65
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
	.p2align 4,,10
	.p2align 3
.L66:
	add	edi, 1
	cmp	r8d, edi
	je	.L68
	add	r9, 6144
	add	rdx, 6144
	movsd	xmm2, QWORD PTR [r9]
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L73:
	xor	r13d, r13d
	jmp	.L72
.L78:
	ret
	.size	mul_kij, .-mul_kij
	.p2align 4
	.type	mul_kji, @function
mul_kji:
	endbr64
	mov	r10d, DWORD PTR n[rip]
	test	r10d, r10d
	jle	.L99
	movsxd	rax, r10d
	push	r13
	lea	rcx, a[rip]
	xor	r9d, r9d
	push	r12
	lea	r12, b[rip]
	lea	r11, c[rip]
	push	rbp
	lea	rbp, [rax+rax*2]
	mov	r8, r12
	push	rbx
	mov	ebx, r10d
	mov	rsi, rbp
	sal	rbp, 8
	shr	ebx
	sal	rsi, 11
	sal	rbx, 4
.L83:
	cmp	r10d, 1
	je	.L91
.L89:
	lea	rdx, c[rip]
	lea	r13, [rbx+r8]
	mov	rdi, r8
	.p2align 4
	.p2align 3
.L85:
	movapd	xmm1, XMMWORD PTR [rdi]
	xor	eax, eax
	.p2align 6
	.p2align 4
	.p2align 3
.L84:
	movsd	xmm0, QWORD PTR [rcx+rax]
	unpcklpd	xmm0, xmm0
	mulpd	xmm0, xmm1
	addpd	xmm0, XMMWORD PTR [rdx+rax]
	movaps	XMMWORD PTR [rdx+rax], xmm0
	add	rax, 6144
	cmp	rax, rsi
	jne	.L84
	add	rdi, 16
	add	rdx, 16
	cmp	rdi, r13
	jne	.L85
	test	r10b, 1
	je	.L86
	mov	edx, r10d
	and	edx, -2
.L90:
	movsxd	rax, r9d
	movsxd	rdx, edx
	lea	rax, [rax+rax*2]
	sal	rax, 8
	add	rax, rdx
	movsd	xmm1, QWORD PTR [r12+rax*8]
	lea	rax, [r11+rdx*8]
	add	rdx, rbp
	lea	rdi, [r11+rdx*8]
	mov	rdx, rcx
	.p2align 6
	.p2align 4
	.p2align 3
.L87:
	movsd	xmm0, QWORD PTR [rdx]
	add	rax, 6144
	add	rdx, 6144
	mulsd	xmm0, xmm1
	addsd	xmm0, QWORD PTR -6144[rax]
	movsd	QWORD PTR -6144[rax], xmm0
	cmp	rax, rdi
	jne	.L87
	add	r9d, 1
	add	rcx, 8
	add	r8, 6144
	cmp	r9d, r10d
	jne	.L83
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
.L86:
	add	r9d, 1
	add	rcx, 8
	add	r8, 6144
	cmp	r10d, r9d
	jne	.L89
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	ret
.L91:
	xor	edx, edx
	jmp	.L90
.L99:
	ret
	.size	mul_kji, .-mul_kji
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"ijk"
.LC1:
	.string	"ikj"
.LC2:
	.string	"jik"
.LC3:
	.string	"jki"
.LC4:
	.string	"kij"
.LC5:
	.string	"kji"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"n,method,run,seconds,gflops,control"
	.section	.rodata.str1.1
.LC10:
	.string	"%d,%s,%d,%.6f,%.3f,%.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r15
	lea	rdi, .LC6[rip]
	lea	r15, c[rip]
	push	r14
	push	r13
	push	r12
	push	rbp
	push	rbx
	mov	ebx, 128
	sub	rsp, 200
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 184[rsp], rax
	xor	eax, eax
	mov	DWORD PTR 68[rsp], 256
	movabs	rax, 2199023255936
	mov	QWORD PTR 72[rsp], rax
	lea	rax, .LC0[rip]
	mov	QWORD PTR 80[rsp], rax
	lea	rax, mul_ijk[rip]
	mov	QWORD PTR 88[rsp], rax
	lea	rax, .LC1[rip]
	mov	QWORD PTR 96[rsp], rax
	lea	rax, mul_ikj[rip]
	mov	QWORD PTR 104[rsp], rax
	lea	rax, .LC2[rip]
	mov	QWORD PTR 112[rsp], rax
	lea	rax, mul_jik[rip]
	mov	QWORD PTR 120[rsp], rax
	lea	rax, .LC3[rip]
	mov	QWORD PTR 128[rsp], rax
	lea	rax, mul_jki[rip]
	mov	QWORD PTR 136[rsp], rax
	lea	rax, .LC4[rip]
	mov	QWORD PTR 144[rsp], rax
	lea	rax, mul_kij[rip]
	mov	QWORD PTR 152[rsp], rax
	lea	rax, .LC5[rip]
	mov	QWORD PTR 160[rsp], rax
	lea	rax, mul_kji[rip]
	mov	QWORD PTR 168[rsp], rax
	call	puts@PLT
	lea	rax, 64[rsp]
	mov	QWORD PTR 24[rsp], rax
	lea	rax, 80[rsp]
	mov	QWORD PTR 40[rsp], rax
	lea	rax, 176[rsp]
	mov	QWORD PTR 32[rsp], rax
	lea	rax, 48[rsp]
	mov	QWORD PTR 16[rsp], rax
.L113:
	mov	DWORD PTR n[rip], ebx
	test	ebx, ebx
	jle	.L103
	movsxd	r13, ebx
	lea	rbp, a[rip]
	lea	r12, b[rip]
	lea	rax, 0[r13+r13*2]
	sal	r13, 3
	sal	rax, 11
	add	rax, rbp
	mov	QWORD PTR 8[rsp], rax
.L104:
	xor	r14d, r14d
	.p2align 4
	.p2align 3
.L105:
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC7[rip]
	movsd	QWORD PTR 0[rbp+r14], xmm0
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC7[rip]
	movsd	QWORD PTR [r12+r14], xmm0
	add	r14, 8
	cmp	r14, r13
	jne	.L105
	add	rbp, 6144
	add	r12, 6144
	cmp	rbp, QWORD PTR 8[rsp]
	jne	.L104
.L103:
	mov	r13, QWORD PTR 40[rsp]
.L106:
	mov	r12d, 1
.L111:
	test	ebx, ebx
	jle	.L109
	movsxd	rax, ebx
	mov	ebx, ebx
	lea	rcx, c[rip]
	lea	rbp, [rax+rax*2]
	sal	rbx, 3
	sal	rbp, 11
	add	rbp, r15
	.p2align 4
	.p2align 3
.L107:
	mov	rdi, rcx
	mov	rdx, rbx
	xor	esi, esi
	call	memset@PLT
	lea	rcx, 6144[rax]
	cmp	rcx, rbp
	jne	.L107
.L109:
	mov	rbx, QWORD PTR 16[rsp]
	mov	edi, 1
	mov	rsi, rbx
	call	clock_gettime@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, QWORD PTR 56[rsp]
	pxor	xmm1, xmm1
	mulsd	xmm0, QWORD PTR .LC8[rip]
	cvtsi2sd	xmm1, QWORD PTR 48[rsp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR 8[rsp], xmm0
	call	[QWORD PTR 8[r13]]
	mov	rsi, rbx
	mov	edi, 1
	call	clock_gettime@PLT
	pxor	xmm0, xmm0
	pxor	xmm2, xmm2
	mov	r8d, r12d
	cvtsi2sd	xmm0, QWORD PTR 56[rsp]
	pxor	xmm1, xmm1
	mov	rcx, QWORD PTR 0[r13]
	mov	edx, DWORD PTR n[rip]
	cvtsi2sd	xmm1, QWORD PTR 48[rsp]
	lea	rsi, .LC10[rip]
	mov	edi, 2
	mov	eax, 3
	mulsd	xmm0, QWORD PTR .LC8[rip]
	cvtsi2sd	xmm2, edx
	add	r12d, 1
	addsd	xmm0, xmm1
	movapd	xmm1, xmm2
	subsd	xmm0, QWORD PTR 8[rsp]
	addsd	xmm1, xmm2
	mulsd	xmm1, xmm2
	mulsd	xmm1, xmm2
	movsd	xmm2, QWORD PTR 43064[r15]
	divsd	xmm1, xmm0
	divsd	xmm1, QWORD PTR .LC9[rip]
	call	__printf_chk@PLT
	cmp	r12d, 6
	je	.L108
	mov	ebx, DWORD PTR n[rip]
	jmp	.L111
.L108:
	add	r13, 16
	cmp	QWORD PTR 32[rsp], r13
	je	.L110
	mov	ebx, DWORD PTR n[rip]
	jmp	.L106
.L110:
	add	QWORD PTR 24[rsp], 4
	mov	rax, QWORD PTR 24[rsp]
	cmp	rax, QWORD PTR 40[rsp]
	je	.L112
	mov	ebx, DWORD PTR [rax]
	jmp	.L113
.L112:
	mov	rax, QWORD PTR 184[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L118
	add	rsp, 200
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L118:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.local	c
	.comm	c,4718592,32
	.local	b
	.comm	b,4718592,32
	.local	a
	.comm	a,4718592,32
	.local	n
	.comm	n,4,4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	-4194304
	.long	1105199103
	.align 8
.LC8:
	.long	-400107883
	.long	1041313291
	.align 8
.LC9:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
