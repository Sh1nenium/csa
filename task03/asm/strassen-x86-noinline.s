	.file	"strassen.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.type	naive, @function
naive:
	movsxd	r9, DWORD PTR n[rip]
	test	r9d, r9d
	jle	.L9
	lea	r11, 0[0+r9*8]
	lea	r8, a[rip]
	sal	r9, 13
	push	rbx
	lea	r10, b[rip]
	add	rdi, r11
	lea	rbx, [r8+r9]
	add	r10, r9
	.p2align 4
	.p2align 3
.L3:
	mov	rsi, rdi
	mov	rcx, r10
	sub	rsi, r11
	.p2align 4
	.p2align 3
.L6:
	mov	rax, rcx
	mov	rdx, r8
	pxor	xmm1, xmm1
	sub	rax, r9
	.p2align 5
	.p2align 4
	.p2align 3
.L4:
	movsd	xmm0, QWORD PTR [rdx]
	mulsd	xmm0, QWORD PTR [rax]
	add	rax, 8192
	add	rdx, 8
	addsd	xmm1, xmm0
	cmp	rax, rcx
	jne	.L4
	movsd	QWORD PTR [rsi], xmm1
	add	rsi, 8
	lea	rcx, 8[rax]
	cmp	rsi, rdi
	jne	.L6
	add	r8, 8192
	add	rdi, 8192
	cmp	r8, rbx
	jne	.L3
	pop	rbx
	ret
.L9:
	ret
	.size	naive, .-naive
	.p2align 4
	.type	addsub, @function
addsub:
	test	edi, edi
	jle	.L19
	push	rbx
	movsxd	rbx, DWORD PTR 16[rsp]
	movsxd	r11, edx
	movsxd	r8, r8d
	mov	rdx, rcx
	mov	rcx, rsi
	movsxd	rsi, edi
	sal	r11, 3
	lea	r10, 0[0+r8*8]
	movapd	xmm1, xmm0
	sal	rbx, 3
	xor	r8d, r8d
	sal	rsi, 3
	.p2align 4
	.p2align 3
.L15:
	xor	eax, eax
	.p2align 5
	.p2align 4
	.p2align 3
.L16:
	movsd	xmm0, QWORD PTR [rdx+rax]
	mulsd	xmm0, xmm1
	addsd	xmm0, QWORD PTR [rcx+rax]
	movsd	QWORD PTR [r9+rax], xmm0
	add	rax, 8
	cmp	rsi, rax
	jne	.L16
	add	r8d, 1
	add	rcx, r11
	add	rdx, r10
	add	r9, rbx
	cmp	edi, r8d
	jne	.L15
	pop	rbx
	ret
.L19:
	ret
	.size	addsub, .-addsub
	.p2align 4
	.type	base, @function
base:
	test	edi, edi
	jle	.L30
	push	r15
	movsxd	rax, r8d
	push	r14
	mov	r14, r9
	movsxd	r9, edi
	push	r13
	push	r12
	push	rbp
	lea	rbp, 0[0+r9*8]
	push	rbx
	lea	r15, [r14+rbp]
	mov	r13, rbp
	lea	rbx, 0[0+rax*8]
	xor	r14d, r14d
	add	rbp, rsi
	sub	rsp, 40
	mov	QWORD PTR 16[rsp], rcx
	movsxd	rcx, edx
	movsxd	r12, DWORD PTR 96[rsp]
	sal	rcx, 3
	mov	DWORD PTR 28[rsp], edi
	mov	QWORD PTR [rsp], rcx
	mov	ecx, edi
	sal	r12, 3
	sal	rcx, 3
	mov	QWORD PTR 8[rsp], rcx
	.p2align 4
	.p2align 3
.L24:
	mov	rdx, QWORD PTR 8[rsp]
	mov	rdi, r15
	xor	esi, esi
	sub	rdi, r13
	call	memset@PLT
	mov	rsi, rbp
	mov	r11, QWORD PTR 16[rsp]
	mov	rdi, rax
	sub	rsi, r13
	.p2align 4
	.p2align 3
.L26:
	movsd	xmm1, QWORD PTR [rsi]
	mov	rdx, r11
	mov	rax, rdi
	.p2align 5
	.p2align 4
	.p2align 3
.L25:
	movsd	xmm0, QWORD PTR [rdx]
	add	rax, 8
	add	rdx, 8
	mulsd	xmm0, xmm1
	addsd	xmm0, QWORD PTR -8[rax]
	movsd	QWORD PTR -8[rax], xmm0
	cmp	rax, r15
	jne	.L25
	add	rsi, 8
	add	r11, rbx
	cmp	rbp, rsi
	jne	.L26
	add	r14d, 1
	add	rbp, QWORD PTR [rsp]
	add	r15, r12
	cmp	DWORD PTR 28[rsp], r14d
	jne	.L24
	add	rsp, 40
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L30:
	ret
	.size	base, .-base
	.p2align 4
	.type	maxdiff, @function
maxdiff:
	movsxd	rax, DWORD PTR n[rip]
	test	eax, eax
	jle	.L37
	mov	rdi, rax
	lea	rdx, c[rip]
	pxor	xmm1, xmm1
	sal	rdi, 13
	lea	rcx, ref[rip]
	lea	rsi, 0[0+rax*8]
	add	rdi, rdx
	.p2align 4
	.p2align 3
.L35:
	xor	eax, eax
	.p2align 6
	.p2align 4
	.p2align 3
.L36:
	movsd	xmm0, QWORD PTR [rdx+rax]
	subsd	xmm0, QWORD PTR [rcx+rax]
	add	rax, 8
	andpd	xmm0, XMMWORD PTR .LC1[rip]
	maxsd	xmm0, xmm1
	movapd	xmm1, xmm0
	cmp	rsi, rax
	jne	.L36
	add	rdx, 8192
	add	rcx, 8192
	cmp	rdx, rdi
	jne	.L35
	movapd	xmm0, xmm1
	ret
.L37:
	pxor	xmm1, xmm1
	movapd	xmm0, xmm1
	ret
	.size	maxdiff, .-maxdiff
	.p2align 4
	.type	init, @function
init:
	mov	eax, DWORD PTR n[rip]
	test	eax, eax
	jle	.L45
	push	r15
	push	r14
	push	r13
	movsxd	r13, eax
	push	r12
	lea	r14, 0[0+r13*8]
	lea	r12, b[rip]
	sal	r13, 13
	push	rbp
	lea	rbp, a[rip]
	add	r13, r12
	push	rbx
	add	rbp, r14
	sub	rsp, 8
	.p2align 4
	.p2align 3
.L41:
	mov	rbx, rbp
	mov	r15, r12
	sub	rbx, r14
	.p2align 4
	.p2align 3
.L42:
	call	rand@PLT
	pxor	xmm0, xmm0
	add	rbx, 8
	add	r15, 8
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC2[rip]
	movsd	QWORD PTR -8[rbx], xmm0
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC2[rip]
	movsd	QWORD PTR -8[r15], xmm0
	cmp	rbx, rbp
	jne	.L42
	add	r12, 8192
	add	rbp, 8192
	cmp	r12, r13
	jne	.L41
	add	rsp, 8
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L45:
	ret
	.size	init, .-init
	.p2align 4
	.type	rec, @function
rec:
	push	r15
	push	r14
	push	r13
	mov	r13d, edx
	push	r12
	mov	r12d, r8d
	push	rbp
	mov	rbp, rsi
	push	rbx
	sub	rsp, 216
	mov	eax, DWORD PTR 272[rsp]
	mov	QWORD PTR 8[rsp], rcx
	mov	QWORD PTR 40[rsp], r9
	mov	DWORD PTR 36[rsp], eax
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 200[rsp], rax
	xor	eax, eax
	cmp	edi, 64
	jle	.L61
	sar	edi
	movsxd	rax, edi
	mov	rdi, QWORD PTR 8[rsp]
	mov	edx, eax
	lea	rbx, 0[0+rax*8]
	mov	r15, rax
	imul	edx, r13d
	lea	rcx, [rsi+rbx]
	mov	QWORD PTR 64[rsp], rcx
	movsxd	rdx, edx
	lea	rcx, [rsi+rdx*8]
	add	rdx, rax
	mov	QWORD PTR 72[rsp], rcx
	lea	rcx, [rsi+rdx*8]
	mov	edx, eax
	imul	edx, r8d
	mov	QWORD PTR 16[rsp], rcx
	lea	rcx, [rdi+rbx]
	mov	QWORD PTR 80[rsp], rcx
	movsxd	rdx, edx
	lea	rsi, [rdi+rdx*8]
	add	rdx, rax
	lea	rcx, [rdi+rdx*8]
	mov	edx, DWORD PTR 36[rsp]
	mov	QWORD PTR 88[rsp], rsi
	mov	QWORD PTR 24[rsp], rcx
	imul	edx, eax
	movsxd	rsi, edx
	mov	QWORD PTR 96[rsp], rsi
	add	rsi, rax
	imul	rax, rax
	mov	QWORD PTR 104[rsp], rsi
	lea	rcx, 0[0+rax*8]
	add	rax, rcx
	mov	QWORD PTR [rsp], rcx
	lea	rdi, 0[0+rax*8]
	call	malloc@PLT
	mov	edx, r15d
	mov	rcx, QWORD PTR [rsp]
	imul	edx, r15d
	mov	rsi, rax
	mov	QWORD PTR 112[rsp], rax
	lea	eax, 0[0+rdx*8]
	sub	eax, edx
	mov	rdx, rsi
	cdqe
	lea	r14, [rsi+rax*8]
	lea	rsi, 200[rsp]
	lea	rax, [r14+rcx]
	mov	QWORD PTR [rsp], rax
	lea	rax, 144[rsp]
	.p2align 4
	.p2align 4
	.p2align 3
.L51:
	mov	QWORD PTR [rax], rdx
	add	rax, 8
	add	rdx, rcx
	cmp	rax, rsi
	jne	.L51
	sub	rsp, 8
	mov	edi, r15d
	mov	r9, r14
	mov	r8d, r13d
	push	r15
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	edx, r13d
	mov	rsi, rbp
	mov	rcx, QWORD PTR 32[rsp]
	call	addsub
	mov	r9, QWORD PTR 16[rsp]
	mov	r8d, r12d
	mov	edx, r12d
	mov	rcx, QWORD PTR 40[rsp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	DWORD PTR [rsp], r15d
	mov	rsi, QWORD PTR 24[rsp]
	call	addsub
	mov	rcx, QWORD PTR 16[rsp]
	mov	r8d, r15d
	mov	edx, r15d
	mov	r11, QWORD PTR 160[rsp]
	mov	rsi, r14
	mov	DWORD PTR [rsp], r15d
	mov	r9, r11
	mov	QWORD PTR 152[rsp], r11
	call	rec
	mov	rcx, QWORD PTR 32[rsp]
	mov	edi, r15d
	mov	r9, r14
	mov	rsi, QWORD PTR 88[rsp]
	mov	r8d, r13d
	mov	edx, r13d
	mov	DWORD PTR [rsp], r15d
	movsd	xmm0, QWORD PTR .LC3[rip]
	call	addsub
	mov	rcx, QWORD PTR 24[rsp]
	mov	r8d, r12d
	mov	edx, r15d
	mov	rax, QWORD PTR 168[rsp]
	mov	rsi, r14
	mov	DWORD PTR [rsp], r15d
	mov	r9, rax
	mov	QWORD PTR 64[rsp], rax
	call	rec
	mov	r9, QWORD PTR 16[rsp]
	mov	edi, r15d
	mov	r8d, r12d
	movsd	xmm0, QWORD PTR .LC4[rip]
	mov	rcx, QWORD PTR 40[rsp]
	mov	edx, r12d
	mov	DWORD PTR [rsp], r15d
	mov	rsi, QWORD PTR 96[rsp]
	call	addsub
	mov	rcx, QWORD PTR 16[rsp]
	mov	r8d, r15d
	mov	edx, r13d
	mov	rax, QWORD PTR 176[rsp]
	mov	rsi, rbp
	mov	DWORD PTR [rsp], r15d
	mov	r9, rax
	mov	QWORD PTR 72[rsp], rax
	call	rec
	mov	r9, QWORD PTR 16[rsp]
	mov	edi, r15d
	mov	r8d, r12d
	movsd	xmm0, QWORD PTR .LC4[rip]
	mov	rcx, QWORD PTR 24[rsp]
	mov	edx, r12d
	mov	DWORD PTR [rsp], r15d
	mov	rsi, QWORD PTR 104[rsp]
	call	addsub
	mov	rcx, QWORD PTR 16[rsp]
	mov	r8d, r15d
	mov	edx, r13d
	mov	r10, QWORD PTR 184[rsp]
	mov	rsi, QWORD PTR 32[rsp]
	mov	DWORD PTR [rsp], r15d
	mov	r9, r10
	mov	QWORD PTR 144[rsp], r10
	call	rec
	mov	rcx, QWORD PTR 80[rsp]
	mov	edi, r15d
	mov	r9, r14
	mov	r8d, r13d
	mov	edx, r13d
	mov	rsi, rbp
	mov	DWORD PTR [rsp], r15d
	movsd	xmm0, QWORD PTR .LC3[rip]
	call	addsub
	mov	rcx, QWORD PTR 40[rsp]
	mov	r8d, r12d
	mov	edx, r15d
	mov	rax, QWORD PTR 192[rsp]
	mov	rsi, r14
	mov	DWORD PTR [rsp], r15d
	mov	r9, rax
	mov	QWORD PTR 136[rsp], rax
	call	rec
	mov	rsi, QWORD PTR 88[rsp]
	mov	edi, r15d
	mov	r9, r14
	mov	r8d, r13d
	mov	rcx, rbp
	mov	edx, r13d
	mov	DWORD PTR [rsp], r15d
	movsd	xmm0, QWORD PTR .LC4[rip]
	call	addsub
	mov	r9, QWORD PTR 16[rsp]
	mov	r8d, r12d
	mov	edx, r12d
	mov	rcx, QWORD PTR 96[rsp]
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	DWORD PTR [rsp], r15d
	mov	rsi, QWORD PTR 24[rsp]
	call	addsub
	mov	rcx, QWORD PTR 16[rsp]
	mov	r8d, r15d
	mov	edx, r15d
	mov	rbp, QWORD PTR 200[rsp]
	mov	rsi, r14
	mov	DWORD PTR [rsp], r15d
	mov	r9, rbp
	call	rec
	mov	rcx, QWORD PTR 32[rsp]
	mov	edi, r15d
	mov	r9, r14
	mov	rsi, QWORD PTR 80[rsp]
	mov	r8d, r13d
	mov	edx, r13d
	mov	DWORD PTR [rsp], r15d
	movsd	xmm0, QWORD PTR .LC4[rip]
	call	addsub
	mov	r13, QWORD PTR 16[rsp]
	mov	r8d, r12d
	mov	edx, r12d
	mov	rcx, QWORD PTR 40[rsp]
	mov	rsi, QWORD PTR 104[rsp]
	mov	DWORD PTR [rsp], r15d
	movsd	xmm0, QWORD PTR .LC3[rip]
	mov	r9, r13
	call	addsub
	mov	r8d, r15d
	mov	rcx, r13
	mov	edx, r15d
	mov	r12, QWORD PTR 208[rsp]
	mov	rsi, r14
	mov	DWORD PTR [rsp], r15d
	mov	r9, r12
	call	rec
	mov	rdx, QWORD PTR 56[rsp]
	mov	r9, r12
	mov	rcx, rbp
	mov	rax, QWORD PTR 112[rsp]
	movsxd	r14, DWORD PTR 52[rsp]
	mov	rdi, QWORD PTR 72[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	lea	r13, [rdx+rbx]
	lea	r12, [rdx+rax*8]
	mov	rax, QWORD PTR 120[rsp]
	mov	r11, QWORD PTR 152[rsp]
	sal	r14, 3
	mov	r10, QWORD PTR 144[rsp]
	mov	r8, QWORD PTR 136[rsp]
	add	rsp, 16
	mov	DWORD PTR [rsp], r15d
	lea	rbp, [rdx+rax*8]
	xor	r15d, r15d
	.p2align 4
	.p2align 3
.L52:
	xor	eax, eax
	.p2align 4
	.p2align 3
.L53:
	movsd	xmm0, QWORD PTR [r11+rax]
	movsd	xmm2, QWORD PTR [r10+rax]
	movsd	xmm3, QWORD PTR [r8+rax]
	movapd	xmm1, xmm0
	addsd	xmm1, xmm2
	subsd	xmm1, xmm3
	addsd	xmm1, QWORD PTR [r9+rax]
	movsd	QWORD PTR [rdx+rax], xmm1
	movsd	xmm1, QWORD PTR [rdi+rax]
	addsd	xmm3, xmm1
	movsd	QWORD PTR 0[r13+rax], xmm3
	movsd	xmm3, QWORD PTR [rsi+rax]
	subsd	xmm0, xmm3
	addsd	xmm2, xmm3
	addsd	xmm0, xmm1
	addsd	xmm0, QWORD PTR [rcx+rax]
	movsd	QWORD PTR [r12+rax], xmm2
	movsd	QWORD PTR 0[rbp+rax], xmm0
	add	rax, 8
	cmp	rbx, rax
	jne	.L53
	add	r15d, 1
	add	r11, rbx
	add	r10, rbx
	add	r8, rbx
	add	r9, rbx
	add	rdx, r14
	add	rdi, rbx
	add	r13, r14
	add	rsi, rbx
	add	r12, r14
	add	rcx, rbx
	add	rbp, r14
	cmp	DWORD PTR [rsp], r15d
	jne	.L52
	mov	rax, QWORD PTR 200[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L60
	mov	rdi, QWORD PTR 112[rsp]
	add	rsp, 216
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	jmp	free@PLT
.L61:
	mov	rax, QWORD PTR 200[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L60
	mov	eax, DWORD PTR 36[rsp]
	mov	r9, QWORD PTR 40[rsp]
	mov	rcx, QWORD PTR 8[rsp]
	mov	DWORD PTR 272[rsp], eax
	add	rsp, 216
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	jmp	base
.L60:
	call	__stack_chk_fail@PLT
	.size	rec, .-rec
	.p2align 4
	.type	strassen, @function
strassen:
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 72
	mov	ebx, DWORD PTR n[rip]
	cmp	ebx, 1
	jle	.L63
	mov	r8d, 1
	.p2align 3
	.p2align 4
	.p2align 3
.L64:
	add	r8d, r8d
	cmp	r8d, ebx
	jl	.L64
	movsxd	r12, r8d
	mov	esi, 8
	mov	DWORD PTR 8[rsp], r8d
	mov	rbp, r12
	imul	rbp, r12
	mov	rdi, rbp
	lea	r13, 0[0+rbp*8]
	call	calloc@PLT
	mov	esi, 8
	mov	rdi, rbp
	mov	QWORD PTR 24[rsp], rax
	call	calloc@PLT
	mov	rdi, r13
	mov	QWORD PTR 16[rsp], rax
	call	malloc@PLT
	mov	r8d, DWORD PTR 8[rsp]
	mov	QWORD PTR 40[rsp], rax
.L65:
	movsxd	rax, ebx
	lea	r15, a[rip]
	mov	DWORD PTR 60[rsp], r8d
	sal	r12, 3
	lea	rbx, 0[0+rax*8]
	sal	rax, 13
	mov	r14, r15
	mov	QWORD PTR 48[rsp], rax
	add	rax, r15
	lea	rbp, b[rip]
	xor	r15d, r15d
	mov	QWORD PTR 32[rsp], rax
	.p2align 4
	.p2align 3
.L67:
	cmp	r13, r15
	mov	rcx, r15
	mov	rax, QWORD PTR 24[rsp]
	mov	rsi, r14
	cmovnb	rcx, r13
	mov	rdx, rbx
	add	r14, 8192
	lea	rdi, [rax+r15]
	sub	rcx, r15
	mov	QWORD PTR 8[rsp], rcx
	call	__memcpy_chk@PLT
	mov	rax, QWORD PTR 16[rsp]
	mov	rsi, rbp
	mov	rdx, rbx
	mov	rcx, QWORD PTR 8[rsp]
	add	rbp, 8192
	lea	rdi, [rax+r15]
	add	r15, r12
	call	__memcpy_chk@PLT
	cmp	r14, QWORD PTR 32[rsp]
	jne	.L67
	mov	r8d, DWORD PTR 60[rsp]
	sub	rsp, 8
	xor	r13d, r13d
	lea	r14, c[rip]
	push	r8
	mov	rbp, QWORD PTR 56[rsp]
	mov	edx, r8d
	mov	edi, r8d
	mov	rcx, QWORD PTR 32[rsp]
	mov	rsi, QWORD PTR 40[rsp]
	mov	r9, rbp
	call	rec
	pop	rcx
	pop	rsi
	mov	r15, QWORD PTR 48[rsp]
	.p2align 4
	.p2align 3
.L68:
	mov	ecx, 8388608
	lea	rdi, [r14+r13]
	mov	rsi, rbp
	mov	rdx, rbx
	cmp	r13, rcx
	cmovnb	rcx, r13
	add	rbp, r12
	sub	rcx, r13
	add	r13, 8192
	call	__memcpy_chk@PLT
	cmp	r13, r15
	jne	.L68
.L69:
	mov	rdi, QWORD PTR 24[rsp]
	call	free@PLT
	mov	rdi, QWORD PTR 16[rsp]
	call	free@PLT
	mov	rdi, QWORD PTR 40[rsp]
	add	rsp, 72
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L63:
	mov	esi, 8
	mov	edi, 1
	call	calloc@PLT
	mov	esi, 8
	mov	edi, 1
	mov	QWORD PTR 24[rsp], rax
	call	calloc@PLT
	mov	edi, 8
	mov	QWORD PTR 16[rsp], rax
	call	malloc@PLT
	mov	QWORD PTR 40[rsp], rax
	cmp	ebx, 1
	je	.L74
	sub	rsp, 8
	mov	edx, 1
	mov	r8d, 1
	mov	edi, 1
	push	1
	mov	r9, QWORD PTR 56[rsp]
	mov	rcx, QWORD PTR 32[rsp]
	mov	rsi, QWORD PTR 40[rsp]
	call	rec
	pop	rax
	pop	rdx
	jmp	.L69
.L74:
	mov	r8d, 1
	mov	r13d, 8
	mov	r12d, 1
	jmp	.L65
	.size	strassen, .-strassen
	.p2align 4
	.type	now, @function
now:
	sub	rsp, 40
	mov	edi, 1
	mov	rsi, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rsi
	mov	rsi, rsp
	call	clock_gettime@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, QWORD PTR 8[rsp]
	pxor	xmm1, xmm1
	mulsd	xmm0, QWORD PTR .LC5[rip]
	cvtsi2sd	xmm1, QWORD PTR [rsp]
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR 24[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L78
	add	rsp, 40
	ret
.L78:
	call	__stack_chk_fail@PLT
	.size	now, .-now
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"strassen"
.LC7:
	.string	"naive"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"n,method,run,seconds,gflops,maxdiff"
	.section	.rodata.str1.1
.LC10:
	.string	"%d,%s,%d,%.6f,%.3f,%.3e\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r15
	lea	rdi, .LC8[rip]
	push	r14
	lea	r14, c[rip]
	push	r13
	push	r12
	mov	r12d, 128
	push	rbp
	push	rbx
	sub	rsp, 72
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 56[rsp], rax
	xor	eax, eax
	mov	DWORD PTR 36[rsp], 256
	movabs	rax, 4398046511616
	mov	QWORD PTR 40[rsp], rax
	call	puts@PLT
	lea	rax, 32[rsp]
	mov	QWORD PTR 16[rsp], rax
	lea	rax, 48[rsp]
	mov	QWORD PTR 24[rsp], rax
.L89:
	mov	DWORD PTR n[rip], r12d
	xor	r15d, r15d
	call	init
	lea	rdi, ref[rip]
	call	naive
	lea	rax, .LC7[rip]
	mov	QWORD PTR 8[rsp], rax
.L88:
	mov	r13d, 1
	test	r12d, r12d
	jle	.L81
.L80:
	movsxd	rbx, r12d
	mov	ebp, r12d
	lea	rcx, c[rip]
	sal	rbx, 13
	sal	rbp, 3
	add	rbx, r14
	.p2align 4
	.p2align 3
.L82:
	mov	rdi, rcx
	mov	rdx, rbp
	xor	esi, esi
	call	memset@PLT
	lea	rcx, 8192[rax]
	cmp	rbx, rcx
	jne	.L82
.L81:
	call	now
	movapd	xmm1, xmm0
	test	r15d, r15d
	je	.L83
.L87:
	movsd	QWORD PTR [rsp], xmm1
	call	strassen
	call	now
	pxor	xmm4, xmm4
	mov	r8d, r13d
	add	r13d, 1
	cvtsi2sd	xmm4, r12d
	movapd	xmm3, xmm0
	subsd	xmm3, QWORD PTR [rsp]
	call	maxdiff
	movapd	xmm1, xmm4
	mov	edx, r12d
	mov	rcx, QWORD PTR 8[rsp]
	addsd	xmm1, xmm4
	movapd	xmm2, xmm0
	mov	edi, 2
	mov	eax, 3
	movapd	xmm0, xmm3
	lea	rsi, .LC10[rip]
	mulsd	xmm1, xmm4
	mulsd	xmm1, xmm4
	divsd	xmm1, xmm3
	divsd	xmm1, QWORD PTR .LC9[rip]
	call	__printf_chk@PLT
	cmp	r13d, 6
	je	.L101
	mov	r12d, DWORD PTR n[rip]
	test	r12d, r12d
	jg	.L80
	call	now
	movapd	xmm1, xmm0
	jmp	.L87
.L102:
	call	now
	movapd	xmm1, xmm0
.L83:
	mov	rdi, r14
	movsd	QWORD PTR [rsp], xmm1
	call	naive
	call	now
	pxor	xmm4, xmm4
	mov	r8d, r13d
	add	r13d, 1
	cvtsi2sd	xmm4, r12d
	movapd	xmm3, xmm0
	subsd	xmm3, QWORD PTR [rsp]
	call	maxdiff
	movapd	xmm1, xmm4
	mov	edx, r12d
	mov	rcx, QWORD PTR 8[rsp]
	addsd	xmm1, xmm4
	movapd	xmm2, xmm0
	mov	edi, 2
	mov	eax, 3
	movapd	xmm0, xmm3
	lea	rsi, .LC10[rip]
	mulsd	xmm1, xmm4
	mulsd	xmm1, xmm4
	divsd	xmm1, xmm3
	divsd	xmm1, QWORD PTR .LC9[rip]
	call	__printf_chk@PLT
	mov	r12d, DWORD PTR n[rip]
	cmp	r13d, 6
	je	.L86
	test	r12d, r12d
	jg	.L80
	jmp	.L102
.L86:
	lea	rax, .LC6[rip]
	mov	r15d, 1
	mov	QWORD PTR 8[rsp], rax
	jmp	.L88
.L101:
	add	QWORD PTR 16[rsp], 4
	mov	rdx, QWORD PTR 24[rsp]
	cmp	QWORD PTR 16[rsp], rdx
	je	.L103
	mov	rax, QWORD PTR 16[rsp]
	mov	r12d, DWORD PTR [rax]
	jmp	.L89
.L103:
	mov	rax, QWORD PTR 56[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L104
	add	rsp, 72
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L104:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.local	ref
	.comm	ref,8388608,32
	.local	c
	.comm	c,8388608,32
	.local	b
	.comm	b,8388608,32
	.local	a
	.comm	a,8388608,32
	.local	n
	.comm	n,4,4
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	-4194304
	.long	1105199103
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	0
	.long	-1074790400
	.align 8
.LC5:
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
