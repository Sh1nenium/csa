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
	.type	rec, @function
rec:
	push	r15
	push	r14
	push	r13
	push	r12
	mov	r12, rcx
	push	rbp
	push	rbx
	mov	ebx, edi
	sub	rsp, 280
	mov	eax, DWORD PTR 336[rsp]
	mov	QWORD PTR 32[rsp], rsi
	mov	DWORD PTR 40[rsp], edx
	mov	DWORD PTR 48[rsp], r8d
	mov	QWORD PTR 80[rsp], r9
	mov	DWORD PTR 76[rsp], eax
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 264[rsp], rax
	xor	eax, eax
	cmp	edi, 64
	jle	.L74
	mov	edx, DWORD PTR 40[rsp]
	sar	ebx
	mov	rsi, QWORD PTR 32[rsp]
	movsxd	rax, ebx
	imul	edx, eax
	lea	rbx, 0[0+rax*8]
	mov	DWORD PTR 8[rsp], eax
	lea	rcx, [rsi+rbx]
	lea	r13, [r12+rbx]
	mov	QWORD PTR 136[rsp], rcx
	movsxd	rdx, edx
	lea	r14, [rsi+rdx*8]
	add	rdx, rax
	lea	rsi, [rsi+rdx*8]
	mov	edx, DWORD PTR 48[rsp]
	mov	QWORD PTR 56[rsp], rsi
	imul	edx, eax
	movsxd	rdx, edx
	lea	rbp, [r12+rdx*8]
	add	rdx, rax
	lea	rsi, [r12+rdx*8]
	mov	edx, DWORD PTR 76[rsp]
	mov	QWORD PTR 64[rsp], rsi
	imul	edx, eax
	movsxd	rsi, edx
	mov	QWORD PTR 88[rsp], rsi
	add	rsi, rax
	imul	rax, rax
	mov	QWORD PTR 96[rsp], rsi
	lea	r15, 0[0+rax*8]
	add	rax, r15
	lea	rdi, 0[0+rax*8]
	call	malloc@PLT
	mov	edi, DWORD PTR 8[rsp]
	lea	rcx, 264[rsp]
	mov	rsi, rax
	mov	QWORD PTR 176[rsp], rax
	mov	edx, edi
	imul	edx, edi
	lea	eax, 0[0+rdx*8]
	sub	eax, edx
	mov	rdx, rsi
	cdqe
	lea	rax, [rsi+rax*8]
	mov	QWORD PTR 16[rsp], rax
	add	rax, r15
	mov	QWORD PTR 24[rsp], rax
	lea	rax, 208[rsp]
	.p2align 4
	.p2align 4
	.p2align 3
.L20:
	mov	QWORD PTR [rax], rdx
	add	rax, 8
	add	rdx, r15
	cmp	rax, rcx
	jne	.L20
	mov	rsi, QWORD PTR 56[rsp]
	mov	rdi, QWORD PTR 16[rsp]
	xor	r8d, r8d
	movsxd	rax, DWORD PTR 40[rsp]
	mov	rcx, QWORD PTR 32[rsp]
	mov	QWORD PTR 152[rsp], rsi
	mov	r9d, DWORD PTR 8[rsp]
	mov	QWORD PTR 144[rsp], rdi
	sal	rax, 3
	mov	r11, rcx
	.p2align 4
	.p2align 3
.L23:
	xor	edx, edx
	.p2align 5
	.p2align 4
	.p2align 3
.L22:
	movsd	xmm0, QWORD PTR [rcx+rdx]
	addsd	xmm0, QWORD PTR [rsi+rdx]
	movsd	QWORD PTR [rdi+rdx], xmm0
	add	rdx, 8
	cmp	rbx, rdx
	jne	.L22
	add	r8d, 1
	add	rcx, rax
	add	rsi, rax
	add	rdi, rbx
	cmp	r9d, r8d
	jne	.L23
	mov	rsi, QWORD PTR 64[rsp]
	mov	rdi, QWORD PTR 24[rsp]
	mov	r10, r12
	mov	rcx, r12
	movsxd	r15, DWORD PTR 48[rsp]
	mov	r9d, DWORD PTR 8[rsp]
	xor	r8d, r8d
	mov	QWORD PTR 168[rsp], rsi
	mov	QWORD PTR 160[rsp], rdi
	sal	r15, 3
	.p2align 4
	.p2align 3
.L24:
	xor	edx, edx
	.p2align 5
	.p2align 4
	.p2align 3
.L25:
	movsd	xmm0, QWORD PTR [rcx+rdx]
	addsd	xmm0, QWORD PTR [rsi+rdx]
	movsd	QWORD PTR [rdi+rdx], xmm0
	add	rdx, 8
	cmp	rbx, rdx
	jne	.L25
	add	r8d, 1
	add	rcx, r15
	add	rsi, r15
	add	rdi, rbx
	cmp	r9d, r8d
	jne	.L24
	mov	r9, QWORD PTR 208[rsp]
	mov	QWORD PTR 120[rsp], r10
	sub	rsp, 8
	mov	QWORD PTR 136[rsp], r11
	mov	QWORD PTR 120[rsp], rax
	mov	QWORD PTR 112[rsp], r9
	mov	edx, DWORD PTR 16[rsp]
	push	rdx
	mov	rcx, QWORD PTR 40[rsp]
	mov	r8d, edx
	mov	edi, edx
	mov	rsi, QWORD PTR 32[rsp]
	mov	DWORD PTR 24[rsp], edx
	call	rec
	pop	rax
	pop	rdx
	mov	rcx, r14
	mov	rdi, QWORD PTR 16[rsp]
	mov	rsi, QWORD PTR 56[rsp]
	xor	r8d, r8d
	mov	r9d, DWORD PTR 8[rsp]
	mov	r11, QWORD PTR 128[rsp]
	mov	r10, QWORD PTR 120[rsp]
	mov	rax, QWORD PTR 112[rsp]
	.p2align 4
	.p2align 3
.L27:
	xor	edx, edx
	.p2align 5
	.p2align 4
	.p2align 3
.L28:
	movsd	xmm0, QWORD PTR [rcx+rdx]
	addsd	xmm0, QWORD PTR [rsi+rdx]
	movsd	QWORD PTR [rdi+rdx], xmm0
	add	rdx, 8
	cmp	rbx, rdx
	jne	.L28
	add	r8d, 1
	add	rcx, rax
	add	rsi, rax
	add	rdi, rbx
	cmp	r9d, r8d
	jne	.L27
	mov	r9, QWORD PTR 216[rsp]
	mov	QWORD PTR 184[rsp], r11
	sub	rsp, 8
	mov	rcx, r12
	mov	QWORD PTR 136[rsp], r10
	mov	QWORD PTR 128[rsp], rax
	mov	QWORD PTR 120[rsp], r9
	mov	edx, DWORD PTR 16[rsp]
	push	rdx
	mov	r8d, DWORD PTR 64[rsp]
	mov	edi, edx
	mov	rsi, QWORD PTR 32[rsp]
	mov	DWORD PTR 24[rsp], edx
	call	rec
	pop	r11
	pop	rax
	mov	rcx, r13
	mov	rdi, QWORD PTR 24[rsp]
	mov	rsi, QWORD PTR 64[rsp]
	xor	r8d, r8d
	mov	r9d, DWORD PTR 8[rsp]
	mov	r11, QWORD PTR 184[rsp]
	mov	r10, QWORD PTR 128[rsp]
	mov	rax, QWORD PTR 120[rsp]
	.p2align 4
	.p2align 3
.L30:
	xor	edx, edx
	.p2align 5
	.p2align 4
	.p2align 3
.L31:
	movsd	xmm0, QWORD PTR [rcx+rdx]
	subsd	xmm0, QWORD PTR [rsi+rdx]
	movsd	QWORD PTR [rdi+rdx], xmm0
	add	rdx, 8
	cmp	rbx, rdx
	jne	.L31
	add	r8d, 1
	add	rcx, r15
	add	rsi, r15
	add	rdi, rbx
	cmp	r9d, r8d
	jne	.L30
	mov	r9, QWORD PTR 224[rsp]
	mov	QWORD PTR 192[rsp], r11
	sub	rsp, 8
	mov	QWORD PTR 192[rsp], r10
	mov	QWORD PTR 136[rsp], rax
	mov	QWORD PTR 128[rsp], r9
	mov	r8d, DWORD PTR 16[rsp]
	push	r8
	mov	rcx, QWORD PTR 40[rsp]
	mov	edi, r8d
	mov	rsi, QWORD PTR 48[rsp]
	mov	edx, DWORD PTR 56[rsp]
	mov	DWORD PTR 24[rsp], r8d
	call	rec
	pop	r9
	pop	r10
	mov	rcx, r12
	mov	rdi, QWORD PTR 24[rsp]
	mov	r9d, DWORD PTR 8[rsp]
	mov	rsi, rbp
	xor	r8d, r8d
	mov	r11, QWORD PTR 192[rsp]
	mov	r10, QWORD PTR 184[rsp]
	mov	rax, QWORD PTR 128[rsp]
	.p2align 4
	.p2align 3
.L33:
	xor	edx, edx
	.p2align 5
	.p2align 4
	.p2align 3
.L34:
	movsd	xmm0, QWORD PTR [rsi+rdx]
	subsd	xmm0, QWORD PTR [rcx+rdx]
	movsd	QWORD PTR [rdi+rdx], xmm0
	add	rdx, 8
	cmp	rbx, rdx
	jne	.L34
	add	r8d, 1
	add	rsi, r15
	add	rcx, r15
	add	rdi, rbx
	cmp	r9d, r8d
	jne	.L33
	mov	r9, QWORD PTR 232[rsp]
	mov	QWORD PTR 200[rsp], r11
	sub	rsp, 8
	mov	QWORD PTR 200[rsp], r10
	mov	QWORD PTR 192[rsp], rax
	mov	QWORD PTR 136[rsp], r9
	mov	r8d, DWORD PTR 16[rsp]
	push	r8
	mov	rcx, QWORD PTR 40[rsp]
	mov	edi, r8d
	mov	rsi, QWORD PTR 72[rsp]
	mov	edx, DWORD PTR 56[rsp]
	mov	DWORD PTR 24[rsp], r8d
	call	rec
	mov	r12, QWORD PTR 152[rsp]
	pop	rdi
	pop	r8
	mov	rdi, QWORD PTR 16[rsp]
	xor	r8d, r8d
	mov	rcx, QWORD PTR 32[rsp]
	mov	r9d, DWORD PTR 8[rsp]
	mov	rsi, r12
	mov	r11, QWORD PTR 200[rsp]
	mov	r10, QWORD PTR 192[rsp]
	mov	rax, QWORD PTR 184[rsp]
	.p2align 4
	.p2align 3
.L36:
	xor	edx, edx
	.p2align 5
	.p2align 4
	.p2align 3
.L37:
	movsd	xmm0, QWORD PTR [rcx+rdx]
	addsd	xmm0, QWORD PTR [rsi+rdx]
	movsd	QWORD PTR [rdi+rdx], xmm0
	add	rdx, 8
	cmp	rbx, rdx
	jne	.L37
	add	r8d, 1
	add	rcx, rax
	add	rsi, rax
	add	rdi, rbx
	cmp	r9d, r8d
	jne	.L36
	mov	r9, QWORD PTR 240[rsp]
	mov	QWORD PTR 56[rsp], r10
	sub	rsp, 8
	mov	QWORD PTR 144[rsp], r11
	mov	QWORD PTR 48[rsp], rax
	mov	QWORD PTR 40[rsp], r9
	mov	edx, DWORD PTR 16[rsp]
	push	rdx
	mov	r8d, DWORD PTR 64[rsp]
	mov	edi, edx
	mov	rcx, QWORD PTR 80[rsp]
	mov	rsi, QWORD PTR 32[rsp]
	mov	DWORD PTR 24[rsp], edx
	call	rec
	pop	rcx
	pop	rsi
	xor	esi, esi
	mov	rcx, QWORD PTR 16[rsp]
	mov	edi, DWORD PTR 8[rsp]
	mov	r11, QWORD PTR 136[rsp]
	mov	r10, QWORD PTR 56[rsp]
	mov	rax, QWORD PTR 40[rsp]
	.p2align 4
	.p2align 3
.L39:
	xor	edx, edx
	.p2align 5
	.p2align 4
	.p2align 3
.L40:
	movsd	xmm0, QWORD PTR [r14+rdx]
	subsd	xmm0, QWORD PTR [r11+rdx]
	movsd	QWORD PTR [rcx+rdx], xmm0
	add	rdx, 8
	cmp	rbx, rdx
	jne	.L40
	add	esi, 1
	add	r14, rax
	add	r11, rax
	add	rcx, rbx
	cmp	edi, esi
	jne	.L39
	mov	rcx, QWORD PTR 24[rsp]
	mov	edi, DWORD PTR 8[rsp]
	xor	esi, esi
	.p2align 4
	.p2align 3
.L41:
	xor	edx, edx
	.p2align 5
	.p2align 4
	.p2align 3
.L42:
	movsd	xmm0, QWORD PTR [r10+rdx]
	addsd	xmm0, QWORD PTR 0[r13+rdx]
	movsd	QWORD PTR [rcx+rdx], xmm0
	add	rdx, 8
	cmp	rbx, rdx
	jne	.L42
	add	esi, 1
	add	r10, r15
	add	r13, r15
	add	rcx, rbx
	cmp	edi, esi
	jne	.L41
	mov	QWORD PTR 48[rsp], rax
	mov	rax, QWORD PTR 248[rsp]
	sub	rsp, 8
	mov	QWORD PTR 48[rsp], rax
	mov	r14d, DWORD PTR 16[rsp]
	mov	r9, rax
	push	r14
	mov	rcx, QWORD PTR 40[rsp]
	mov	r8d, r14d
	mov	edx, r14d
	mov	rsi, QWORD PTR 32[rsp]
	mov	edi, r14d
	call	rec
	pop	rax
	pop	rdx
	xor	ecx, ecx
	mov	rsi, QWORD PTR 144[rsp]
	mov	rdi, QWORD PTR 152[rsp]
	mov	r8d, r14d
	mov	rax, QWORD PTR 48[rsp]
	.p2align 4
	.p2align 3
.L44:
	xor	edx, edx
	.p2align 5
	.p2align 4
	.p2align 3
.L45:
	movsd	xmm0, QWORD PTR [r12+rdx]
	subsd	xmm0, QWORD PTR [rdi+rdx]
	movsd	QWORD PTR [rsi+rdx], xmm0
	add	rdx, 8
	cmp	rbx, rdx
	jne	.L45
	add	ecx, 1
	add	r12, rax
	add	rdi, rax
	add	rsi, rbx
	cmp	r8d, ecx
	jne	.L44
	mov	edi, DWORD PTR 8[rsp]
	mov	rcx, QWORD PTR 160[rsp]
	xor	edx, edx
	mov	rsi, QWORD PTR 168[rsp]
	.p2align 4
	.p2align 3
.L46:
	xor	eax, eax
	.p2align 5
	.p2align 4
	.p2align 3
.L47:
	movsd	xmm0, QWORD PTR 0[rbp+rax]
	addsd	xmm0, QWORD PTR [rsi+rax]
	movsd	QWORD PTR [rcx+rax], xmm0
	add	rax, 8
	cmp	rbx, rax
	jne	.L47
	add	edx, 1
	add	rbp, r15
	add	rsi, r15
	add	rcx, rbx
	cmp	edi, edx
	jne	.L46
	mov	r12, QWORD PTR 256[rsp]
	sub	rsp, 8
	mov	edi, DWORD PTR 16[rsp]
	mov	r9, r12
	push	rdi
	mov	rcx, QWORD PTR 40[rsp]
	mov	r8d, edi
	mov	edx, edi
	mov	rsi, QWORD PTR 32[rsp]
	call	rec
	mov	rdx, QWORD PTR 96[rsp]
	mov	rax, QWORD PTR 104[rsp]
	mov	r8, r12
	movsxd	r14, DWORD PTR 92[rsp]
	mov	rbp, QWORD PTR 120[rsp]
	lea	r12, [rdx+rax*8]
	mov	rax, QWORD PTR 112[rsp]
	mov	r11, QWORD PTR 144[rsp]
	lea	r13, [rdx+rbx]
	mov	r10, QWORD PTR 48[rsp]
	mov	rcx, QWORD PTR 56[rsp]
	sal	r14, 3
	mov	rdi, QWORD PTR 136[rsp]
	mov	rsi, QWORD PTR 128[rsp]
	lea	r9, [rdx+rax*8]
	pop	rax
	pop	r15
	xor	r15d, r15d
	.p2align 4
	.p2align 3
.L49:
	xor	eax, eax
	.p2align 4
	.p2align 3
.L50:
	movsd	xmm0, QWORD PTR 0[rbp+rax]
	movsd	xmm2, QWORD PTR [r11+rax]
	movsd	xmm3, QWORD PTR [r10+rax]
	movapd	xmm1, xmm0
	addsd	xmm1, xmm2
	subsd	xmm1, xmm3
	addsd	xmm1, QWORD PTR [r8+rax]
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
	movsd	QWORD PTR [r9+rax], xmm0
	add	rax, 8
	cmp	rbx, rax
	jne	.L50
	add	r15d, 1
	add	rbp, rbx
	add	r11, rbx
	add	r10, rbx
	add	r8, rbx
	add	rdx, r14
	add	rdi, rbx
	add	r13, r14
	add	rsi, rbx
	add	r12, r14
	add	rcx, rbx
	add	r9, r14
	cmp	DWORD PTR 8[rsp], r15d
	jne	.L49
	mov	rax, QWORD PTR 264[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L73
	mov	rdi, QWORD PTR 176[rsp]
	add	rsp, 280
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	jmp	free@PLT
.L74:
	test	edi, edi
	jle	.L13
	movsxd	rax, edx
	movsxd	r15, edi
	mov	ebp, edi
	movsxd	r10, r8d
	sal	rax, 3
	sal	r15, 3
	xor	r11d, r11d
	mov	QWORD PTR 16[rsp], rax
	lea	r9, [rsi+r15]
	sal	rbp, 3
	sal	r10, 3
	movsxd	rax, DWORD PTR 76[rsp]
	mov	rsi, QWORD PTR 80[rsp]
	mov	r13d, ebp
	sal	rax, 3
	add	rsi, r15
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	.p2align 4
	.p2align 3
.L16:
	mov	r8, rsi
	mov	r14, r12
	sub	r8, r15
	lea	rdi, 8[r8]
	mov	rcx, r8
	mov	QWORD PTR [r8], 0
	mov	QWORD PTR -8[r8+r13], 0
	and	rdi, -8
	sub	rcx, rdi
	add	ecx, ebp
	shr	ecx, 3
	rep stosq
	mov	rdi, r9
	sub	rdi, r15
	.p2align 4
	.p2align 3
.L18:
	movsd	xmm1, QWORD PTR [rdi]
	mov	rcx, r14
	mov	rdx, r8
	.p2align 5
	.p2align 4
	.p2align 3
.L17:
	movsd	xmm0, QWORD PTR [rcx]
	add	rdx, 8
	add	rcx, 8
	mulsd	xmm0, xmm1
	addsd	xmm0, QWORD PTR -8[rdx]
	movsd	QWORD PTR -8[rdx], xmm0
	cmp	rsi, rdx
	jne	.L17
	add	rdi, 8
	add	r14, r10
	cmp	r9, rdi
	jne	.L18
	add	r11d, 1
	add	r9, QWORD PTR 16[rsp]
	add	rsi, QWORD PTR 8[rsp]
	cmp	ebx, r11d
	jne	.L16
.L13:
	mov	rax, QWORD PTR 264[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L73
	add	rsp, 280
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L73:
	call	__stack_chk_fail@PLT
	.size	rec, .-rec
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"strassen"
.LC2:
	.string	"naive"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"n,method,run,seconds,gflops,maxdiff"
	.section	.rodata.str1.1
.LC8:
	.string	"%d,%s,%d,%.6f,%.3f,%.3e\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r15
	lea	rdi, .LC3[rip]
	push	r14
	push	r13
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 168
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 152[rsp], rax
	xor	eax, eax
	lea	rbx, 128[rsp]
	movabs	rax, 4398046511616
	mov	DWORD PTR 132[rsp], 256
	mov	QWORD PTR 136[rsp], rax
	call	puts@PLT
	lea	rax, 144[rsp]
	mov	r10d, 128
	mov	QWORD PTR 96[rsp], rax
	lea	rax, 112[rsp]
	mov	QWORD PTR 40[rsp], rax
.L95:
	mov	DWORD PTR n[rip], r10d
	test	r10d, r10d
	jle	.L76
	movsxd	rax, r10d
	mov	DWORD PTR 8[rsp], r10d
	lea	r15, b[rip]
	lea	rbp, a[rip]
	mov	QWORD PTR 16[rsp], rbx
	lea	r13, 0[0+rax*8]
	sal	rax, 13
	add	rbp, r13
	lea	r12, [rax+r15]
	.p2align 4
	.p2align 3
.L77:
	mov	r14, rbp
	mov	rbx, r15
	sub	r14, r13
	.p2align 4
	.p2align 3
.L78:
	call	rand@PLT
	pxor	xmm0, xmm0
	add	r14, 8
	add	rbx, 8
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC4[rip]
	movsd	QWORD PTR -8[r14], xmm0
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC4[rip]
	movsd	QWORD PTR -8[rbx], xmm0
	cmp	r14, rbp
	jne	.L78
	add	r15, 8192
	add	rbp, 8192
	cmp	r15, r12
	jne	.L77
	mov	r10d, DWORD PTR 8[rsp]
	mov	rbx, QWORD PTR 16[rsp]
.L76:
	lea	rdi, ref[rip]
	mov	DWORD PTR 8[rsp], r10d
	xor	r14d, r14d
	call	naive
	mov	QWORD PTR 104[rsp], rbx
	mov	r10d, DWORD PTR 8[rsp]
	lea	rax, .LC2[rip]
	mov	QWORD PTR 72[rsp], rax
.L93:
	mov	DWORD PTR 68[rsp], r14d
	mov	r14d, r10d
	mov	DWORD PTR 64[rsp], 1
	test	r14d, r14d
	jle	.L91
.L116:
	movsxd	r15, r14d
	lea	r12, c[rip]
	mov	ebx, r14d
	mov	rbp, r15
	mov	rcx, r12
	sal	rbx, 3
	sal	rbp, 13
	add	rbp, r12
	.p2align 4
	.p2align 3
.L80:
	mov	rdi, rcx
	mov	rdx, rbx
	xor	esi, esi
	call	memset@PLT
	lea	rcx, 8192[rax]
	cmp	rcx, rbp
	jne	.L80
	mov	rsi, QWORD PTR 40[rsp]
	mov	edi, 1
	call	clock_gettime@PLT
	pxor	xmm0, xmm0
	pxor	xmm1, xmm1
	cvtsi2sd	xmm0, QWORD PTR 120[rsp]
	mulsd	xmm0, QWORD PTR .LC5[rip]
	cvtsi2sd	xmm1, QWORD PTR 112[rsp]
	mov	r8d, DWORD PTR 68[rsp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR 48[rsp], xmm0
	test	r8d, r8d
	je	.L81
	cmp	r14d, 1
	je	.L98
	.p2align 3
	.p2align 4
	.p2align 3
.L83:
	add	r8d, r8d
	cmp	r8d, r14d
	jl	.L83
	movsxd	r12, r8d
	mov	rbx, r12
	imul	rbx, r12
	lea	r13, 0[0+rbx*8]
.L82:
	mov	rdi, rbx
	mov	esi, 8
	sal	r12, 3
	mov	DWORD PTR 8[rsp], r8d
	call	calloc@PLT
	mov	rdi, rbx
	mov	esi, 8
	lea	rbp, 0[0+r15*8]
	mov	QWORD PTR 24[rsp], rax
	sal	r15, 13
	lea	rbx, b[rip]
	call	calloc@PLT
	mov	rdi, r13
	mov	QWORD PTR 16[rsp], rax
	call	malloc@PLT
	mov	r8d, DWORD PTR 8[rsp]
	mov	QWORD PTR 80[rsp], r15
	lea	r11, a[rip]
	mov	QWORD PTR 56[rsp], rax
	lea	rax, [r11+r15]
	mov	r15, r11
	mov	QWORD PTR 32[rsp], rax
	mov	DWORD PTR 88[rsp], r8d
	mov	DWORD PTR 92[rsp], r14d
	xor	r14d, r14d
	.p2align 4
	.p2align 3
.L84:
	cmp	r13, r14
	mov	rcx, r14
	mov	rax, QWORD PTR 24[rsp]
	mov	rsi, r15
	cmovnb	rcx, r13
	mov	rdx, rbp
	add	r15, 8192
	lea	rdi, [rax+r14]
	sub	rcx, r14
	mov	QWORD PTR 8[rsp], rcx
	call	__memcpy_chk@PLT
	mov	rax, QWORD PTR 16[rsp]
	mov	rsi, rbx
	mov	rdx, rbp
	mov	rcx, QWORD PTR 8[rsp]
	add	rbx, 8192
	lea	rdi, [rax+r14]
	add	r14, r12
	call	__memcpy_chk@PLT
	cmp	r15, QWORD PTR 32[rsp]
	jne	.L84
	mov	r8d, DWORD PTR 88[rsp]
	mov	r14d, DWORD PTR 92[rsp]
	sub	rsp, 8
	xor	ebx, ebx
	push	r8
	mov	r13, QWORD PTR 72[rsp]
	mov	edi, r8d
	mov	edx, r8d
	mov	rcx, QWORD PTR 32[rsp]
	mov	rsi, QWORD PTR 40[rsp]
	mov	r9, r13
	call	rec
	pop	rdi
	pop	r8
	mov	r15, QWORD PTR 80[rsp]
	.p2align 4
	.p2align 3
.L85:
	mov	ecx, 8388608
	lea	rax, c[rip]
	mov	rsi, r13
	mov	rdx, rbp
	cmp	rbx, rcx
	lea	rdi, [rax+rbx]
	cmovnb	rcx, rbx
	add	r13, r12
	sub	rcx, rbx
	add	rbx, 8192
	call	__memcpy_chk@PLT
	cmp	rbx, r15
	jne	.L85
.L96:
	mov	rdi, QWORD PTR 24[rsp]
	call	free@PLT
	mov	rdi, QWORD PTR 16[rsp]
	call	free@PLT
	mov	rdi, QWORD PTR 56[rsp]
	call	free@PLT
.L86:
	mov	rsi, QWORD PTR 40[rsp]
	mov	edi, 1
	call	clock_gettime@PLT
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, QWORD PTR 120[rsp]
	pxor	xmm0, xmm0
	mulsd	xmm3, QWORD PTR .LC5[rip]
	cvtsi2sd	xmm0, QWORD PTR 112[rsp]
	addsd	xmm3, xmm0
	subsd	xmm3, QWORD PTR 48[rsp]
	test	r14d, r14d
	jle	.L99
	movsxd	rsi, r14d
	lea	rdx, c[rip]
	lea	rcx, ref[rip]
	mov	rdi, rsi
	pxor	xmm2, xmm2
	sal	rsi, 3
	sal	rdi, 13
	add	rdi, rdx
	.p2align 4
	.p2align 3
.L88:
	xor	eax, eax
	.p2align 6
	.p2align 4
	.p2align 3
.L89:
	movsd	xmm0, QWORD PTR [rdx+rax]
	subsd	xmm0, QWORD PTR [rcx+rax]
	add	rax, 8
	andpd	xmm0, XMMWORD PTR .LC6[rip]
	maxsd	xmm0, xmm2
	movapd	xmm2, xmm0
	cmp	rax, rsi
	jne	.L89
	add	rdx, 8192
	add	rcx, 8192
	cmp	rdi, rdx
	jne	.L88
.L87:
	pxor	xmm0, xmm0
	mov	ebx, DWORD PTR 64[rsp]
	mov	rcx, QWORD PTR 72[rsp]
	mov	edx, r14d
	cvtsi2sd	xmm0, r14d
	movapd	xmm1, xmm0
	mov	edi, 2
	lea	rsi, .LC8[rip]
	addsd	xmm1, xmm0
	mov	r8d, ebx
	mov	eax, 3
	mulsd	xmm1, xmm0
	mulsd	xmm1, xmm0
	movapd	xmm0, xmm3
	divsd	xmm1, xmm3
	divsd	xmm1, QWORD PTR .LC7[rip]
	call	__printf_chk@PLT
	lea	eax, 1[rbx]
	mov	DWORD PTR 64[rsp], eax
	cmp	eax, 6
	je	.L90
	mov	r14d, DWORD PTR n[rip]
	test	r14d, r14d
	jg	.L116
.L91:
	mov	rsi, QWORD PTR 40[rsp]
	mov	edi, 1
	lea	r12, c[rip]
	call	clock_gettime@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, QWORD PTR 120[rsp]
	pxor	xmm1, xmm1
	mulsd	xmm0, QWORD PTR .LC5[rip]
	cvtsi2sd	xmm1, QWORD PTR 112[rsp]
	mov	ecx, DWORD PTR 68[rsp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR 48[rsp], xmm0
	test	ecx, ecx
	je	.L81
	mov	esi, 8
	mov	edi, 1
	call	calloc@PLT
	mov	esi, 8
	mov	edi, 1
	mov	QWORD PTR 24[rsp], rax
	mov	r15, rax
	call	calloc@PLT
	mov	edi, 8
	mov	QWORD PTR 16[rsp], rax
	mov	rbx, rax
	call	malloc@PLT
	sub	rsp, 8
	mov	rcx, rbx
	mov	rsi, r15
	mov	QWORD PTR 64[rsp], rax
	mov	r9, rax
	mov	edx, 1
	mov	r8d, 1
	push	1
	mov	edi, 1
	call	rec
	pop	rax
	pop	rdx
	jmp	.L96
.L81:
	mov	rdi, r12
	call	naive
	jmp	.L86
.L90:
	mov	esi, DWORD PTR 68[rsp]
	test	esi, esi
	je	.L117
	mov	rbx, QWORD PTR 104[rsp]
	add	rbx, 4
	cmp	rbx, QWORD PTR 96[rsp]
	je	.L94
	mov	r10d, DWORD PTR [rbx]
	jmp	.L95
.L117:
	lea	rax, .LC1[rip]
	mov	r10d, DWORD PTR n[rip]
	mov	r14d, 1
	mov	QWORD PTR 72[rsp], rax
	jmp	.L93
.L99:
	pxor	xmm2, xmm2
	jmp	.L87
.L94:
	mov	rax, QWORD PTR 152[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L118
	add	rsp, 168
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L98:
	mov	r8d, 1
	mov	r13d, 8
	mov	ebx, 1
	mov	r12d, 1
	jmp	.L82
.L118:
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	-4194304
	.long	1105199103
	.align 8
.LC5:
	.long	-400107883
	.long	1041313291
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC7:
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
