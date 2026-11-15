	.file	"bits.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.type	cmp_double, @function
cmp_double:
	endbr64
	movsd	xmm0, QWORD PTR [rdi]
	movsd	xmm1, QWORD PTR [rsi]
	xor	eax, eax
	comisd	xmm0, xmm1
	seta	al
	xor	edx, edx
	comisd	xmm1, xmm0
	seta	dl
	sub	eax, edx
	ret
	.size	cmp_double, .-cmp_double
	.p2align 4
	.globl	bswap32
	.type	bswap32, @function
bswap32:
	endbr64
	mov	eax, edi
	bswap	eax
	ret
	.size	bswap32, .-bswap32
	.p2align 4
	.globl	is_pow2
	.type	is_pow2, @function
is_pow2:
	endbr64
	lea	rax, -1[rdi]
	test	rax, rdi
	sete	dl
	xor	eax, eax
	test	rdi, rdi
	setne	al
	and	eax, edx
	ret
	.size	is_pow2, .-is_pow2
	.p2align 4
	.globl	parity32
	.type	parity32, @function
parity32:
	endbr64
	mov	eax, edi
	shr	eax, 16
	xor	eax, edi
	mov	edx, eax
	shr	edx, 8
	xor	edx, eax
	mov	eax, edx
	shr	eax, 4
	xor	eax, edx
	mov	edx, eax
	shr	edx, 2
	xor	edx, eax
	mov	eax, edx
	shr	eax
	xor	eax, edx
	and	eax, 1
	ret
	.size	parity32, .-parity32
	.p2align 4
	.globl	popcount32
	.type	popcount32, @function
popcount32:
	endbr64
	mov	eax, edi
	shr	eax
	and	eax, 1431655765
	sub	edi, eax
	mov	edx, edi
	shr	edi, 2
	and	edx, 858993459
	and	edi, 858993459
	add	edx, edi
	mov	eax, edx
	shr	eax, 4
	add	eax, edx
	and	eax, 252645135
	imul	eax, eax, 16843009
	shr	eax, 24
	ret
	.size	popcount32, .-popcount32
	.p2align 4
	.globl	ctz32
	.type	ctz32, @function
ctz32:
	endbr64
	mov	eax, edi
	lea	rdx, debruijn_ctz[rip]
	neg	eax
	and	eax, edi
	imul	eax, eax, 125613361
	shr	eax, 27
	movzx	eax, BYTE PTR [rdx+rax]
	ret
	.size	ctz32, .-ctz32
	.p2align 4
	.globl	clz32
	.type	clz32, @function
clz32:
	endbr64
	xor	eax, eax
	cmp	edi, 65535
	setbe	al
	sal	eax, 4
	mov	ecx, eax
	sal	edi, cl
	xor	ecx, ecx
	cmp	edi, 16777215
	setbe	cl
	sal	ecx, 3
	sal	edi, cl
	add	eax, ecx
	xor	ecx, ecx
	cmp	edi, 268435455
	setbe	cl
	sal	ecx, 2
	sal	edi, cl
	add	eax, ecx
	xor	ecx, ecx
	cmp	edi, 1073741823
	setbe	cl
	add	ecx, ecx
	sal	edi, cl
	add	eax, ecx
	mov	ecx, edi
	not	ecx
	shr	ecx, 31
	sal	edi, cl
	cmp	edi, 1
	adc	eax, ecx
	ret
	.size	clz32, .-clz32
	.p2align 4
	.globl	next_pow2
	.type	next_pow2, @function
next_pow2:
	endbr64
	cmp	rdi, 1
	adc	rdi, -1
	mov	rdx, rdi
	shr	rdx
	or	rdx, rdi
	mov	rax, rdx
	shr	rax, 2
	or	rax, rdx
	mov	rdx, rax
	shr	rdx, 4
	or	rdx, rax
	mov	rax, rdx
	shr	rax, 8
	or	rax, rdx
	mov	rdx, rax
	shr	rdx, 16
	or	rdx, rax
	mov	rax, rdx
	shr	rax, 32
	or	rax, rdx
	add	rax, 1
	ret
	.size	next_pow2, .-next_pow2
	.p2align 4
	.globl	sign_extend
	.type	sign_extend, @function
sign_extend:
	endbr64
	lea	ecx, -1[rsi]
	mov	rax, rdi
	mov	edi, 1
	mov	rdx, -1
	sal	rdi, cl
	mov	ecx, esi
	neg	ecx
	shr	rdx, cl
	and	rax, rdx
	xor	rax, rdi
	sub	rax, rdi
	ret
	.size	sign_extend, .-sign_extend
	.p2align 4
	.globl	sat_add32
	.type	sat_add32, @function
sat_add32:
	endbr64
	lea	edx, [rdi+rsi]
	mov	eax, edi
	shr	edi, 31
	xor	eax, edx
	xor	esi, edx
	add	edi, 2147483647
	and	eax, esi
	xor	edi, edx
	sar	eax, 31
	and	eax, edi
	xor	eax, edx
	ret
	.size	sat_add32, .-sat_add32
	.p2align 4
	.globl	is_pow2_branchy
	.type	is_pow2_branchy, @function
is_pow2_branchy:
	endbr64
	xor	eax, eax
	test	rdi, rdi
	jne	.L20
	ret
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L14:
	test	dil, 1
	jne	.L17
	shr	rdi
.L20:
	cmp	rdi, 1
	jne	.L14
	mov	eax, 1
	ret
	.p2align 4,,10
	.p2align 3
.L17:
	xor	eax, eax
.L12:
	ret
	.size	is_pow2_branchy, .-is_pow2_branchy
	.p2align 4
	.globl	sat_add32_branchy
	.type	sat_add32_branchy, @function
sat_add32_branchy:
	endbr64
	movsxd	rdi, edi
	movsxd	rsi, esi
	mov	eax, 2147483647
	add	rdi, rsi
	cmp	rdi, 2147483647
	jg	.L21
	cmp	rdi, -2147483648
	mov	eax, -2147483648
	cmovge	eax, edi
.L21:
	ret
	.size	sat_add32_branchy, .-sat_add32_branchy
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"run %d: %.6f s, sum %llu\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"median %.6f s, min %.6f, max %.6f, ns/element %.2f\n"
	.section	.rodata.str1.1
.LC8:
	.string	"popcount32"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"FAIL %-12s got %llu, want %llu\n"
	.section	.rodata.str1.1
.LC10:
	.string	"parity32"
.LC11:
	.string	"ctz32"
.LC12:
	.string	"clz32"
.LC13:
	.string	"is_pow2"
.LC14:
	.string	"sign_extend"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"FAIL %-12s got %lld, want %lld\n"
	.section	.rodata.str1.1
.LC18:
	.string	"sat_add32"
.LC25:
	.string	"FAIL next_pow2(%llu) = %llu\n"
.LC26:
	.string	"FAILED: %d\n"
.LC27:
	.string	"OK"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	endbr64
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 200
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 184[rsp], rax
	xor	eax, eax
	cmp	edi, 1
	jle	.L62
	mov	rax, QWORD PTR 8[rsi]
	cmp	BYTE PTR [rax], 45
	je	.L70
.L62:
	mov	ebx, 200000
	mov	eax, 14
	mov	r12d, 1
	lea	rbp, debruijn_ctz[rip]
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L33:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L32:
	mov	ecx, r12d
	mov	eax, r12d
	xor	r8d, r8d
	shr	ecx, 16
	xor	eax, ecx
	xor	al, ah
	setnp	r8b
	xor	ecx, r12d
	mov	eax, ecx
	shr	eax, 8
	xor	ecx, eax
	mov	eax, ecx
	shr	eax, 4
	xor	ecx, eax
	mov	eax, ecx
	shr	eax, 2
	xor	ecx, eax
	mov	eax, ecx
	shr	eax
	xor	ecx, eax
	and	ecx, 1
	cmp	r8, rcx
	je	.L34
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jle	.L71
.L35:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L34:
	test	r12d, r12d
	je	.L37
	mov	eax, -1013904223
	xor	r8d, r8d
	sub	eax, r13d
	rep bsf	r8d, r12d
	and	eax, r12d
	imul	eax, eax, 125613361
	shr	eax, 27
	movzx	ecx, BYTE PTR 0[rbp+rax]
	cmp	r8, rcx
	je	.L38
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jle	.L72
.L39:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L38:
	mov	edi, r12d
	bsr	r8d, r12d
	call	clz32
	xor	r8d, 31
	mov	ecx, eax
	cmp	r8, rcx
	je	.L40
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jle	.L73
.L41:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L40:
	mov	eax, r12d
	add	r13d, 1013904222
	xor	r8d, r8d
	lea	rdx, -1[rax]
	test	r13d, r12d
	sete	r8b
	xor	ecx, ecx
	test	rdx, rax
	sete	cl
	cmp	r8, rcx
	je	.L37
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jle	.L74
.L43:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L37:
	sub	ebx, 1
	je	.L75
	imul	eax, r12d, 1664525
	lea	edi, 1013904223[rax]
	call	__popcountdi2@PLT
.L31:
	imul	r13d, r12d, 1664525
	movsxd	r8, eax
	lea	r12d, 1013904223[r13]
	mov	eax, r12d
	mov	edx, r12d
	shr	eax
	and	eax, 1431655765
	sub	edx, eax
	mov	eax, edx
	shr	edx, 2
	and	eax, 858993459
	and	edx, 858993459
	add	eax, edx
	mov	ecx, eax
	shr	ecx, 4
	add	ecx, eax
	and	ecx, 252645135
	imul	ecx, ecx, 16843009
	shr	ecx, 24
	cmp	r8, rcx
	je	.L32
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jg	.L33
	lea	rdx, .LC8[rip]
	lea	rsi, .LC9[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L74:
	lea	rdx, .LC13[rip]
	lea	rsi, .LC9[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L71:
	lea	rdx, .LC10[rip]
	lea	rsi, .LC9[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L73:
	lea	rdx, .LC12[rip]
	lea	rsi, .LC9[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L72:
	lea	rdx, .LC11[rip]
	lea	rsi, .LC9[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L39
.L75:
	movabs	r14, 1085102592571150095
	mov	ebp, 63
	movabs	r12, -9223372036854775808
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L46:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L45:
	movabs	rax, -1085102592571150096
	mov	ecx, ebp
	mov	r8, rax
	and	rbx, rax
	sal	r8, cl
	sar	r8, cl
	mov	rcx, rbx
	xor	rcx, r13
	sub	rcx, r13
	cmp	rcx, r8
	je	.L47
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jle	.L76
.L48:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L47:
	sub	ebp, 1
	jb	.L77
.L49:
	mov	ecx, ebp
	mov	r8, r14
	mov	rbx, -1
	mov	r13, r12
	sal	r8, cl
	shr	rbx, cl
	shr	r13, cl
	sar	r8, cl
	mov	rcx, rbx
	and	rcx, r14
	xor	rcx, r13
	sub	rcx, r13
	cmp	rcx, r8
	je	.L45
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jg	.L46
	lea	rdx, .LC14[rip]
	lea	rsi, .LC15[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L76:
	lea	rdx, .LC14[rip]
	lea	rsi, .LC15[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L48
.L77:
	lea	r13, 76[rsp]
	lea	r15, 48[rsp]
	mov	ebp, 2147483647
	mov	rax, QWORD PTR .LC17[rip]
	movdqa	xmm0, XMMWORD PTR .LC16[rip]
	mov	DWORD PTR 72[rsp], -12345
	mov	QWORD PTR 64[rsp], rax
	movaps	XMMWORD PTR 48[rsp], xmm0
	.p2align 4
	.p2align 3
.L50:
	mov	r12d, ebp
	movsxd	r14, ebp
	lea	rbx, 48[rsp]
	shr	r12d, 31
	add	r12d, 2147483647
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L52:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L51:
	add	rbx, 4
	cmp	rbx, r13
	je	.L78
.L53:
	movsxd	r8, DWORD PTR [rbx]
	mov	rdx, -2147483648
	mov	rax, r8
	add	r8, r14
	cmp	r8, rdx
	cmovl	r8, rdx
	mov	edx, 2147483647
	cmp	r8, rdx
	cmovg	r8, rdx
	lea	edx, [rax+rbp]
	mov	ecx, edx
	xor	eax, edx
	xor	ecx, ebp
	and	ecx, eax
	mov	eax, edx
	sar	ecx, 31
	xor	eax, r12d
	and	ecx, eax
	xor	ecx, edx
	movsxd	rcx, ecx
	cmp	rcx, r8
	je	.L51
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jg	.L52
	lea	rdx, .LC18[rip]
	lea	rsi, .LC15[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L78:
	add	r15, 4
	cmp	r13, r15
	je	.L54
	mov	ebp, DWORD PTR [r15]
	jmp	.L50
.L54:
	movdqa	xmm0, XMMWORD PTR .LC19[rip]
	lea	rbp, 80[rsp]
	lea	rbx, 176[rsp]
	movaps	XMMWORD PTR 80[rsp], xmm0
	movdqa	xmm0, XMMWORD PTR .LC20[rip]
	movaps	XMMWORD PTR 96[rsp], xmm0
	movdqa	xmm0, XMMWORD PTR .LC21[rip]
	movaps	XMMWORD PTR 112[rsp], xmm0
	movdqa	xmm0, XMMWORD PTR .LC22[rip]
	movaps	XMMWORD PTR 128[rsp], xmm0
	movdqa	xmm0, XMMWORD PTR .LC23[rip]
	movaps	XMMWORD PTR 144[rsp], xmm0
	movdqa	xmm0, XMMWORD PTR .LC24[rip]
	movaps	XMMWORD PTR 160[rsp], xmm0
	.p2align 4
	.p2align 3
.L57:
	mov	rdx, QWORD PTR 0[rbp]
	cmp	rdx, 1
	mov	rax, rdx
	adc	rax, -1
	mov	rcx, rax
	shr	rcx
	or	rax, rcx
	mov	rcx, rax
	shr	rcx, 2
	or	rax, rcx
	mov	rcx, rax
	shr	rcx, 4
	or	rax, rcx
	mov	rcx, rax
	shr	rcx, 8
	or	rax, rcx
	mov	rcx, rax
	shr	rcx, 16
	or	rax, rcx
	mov	rcx, rax
	shr	rcx, 32
	or	rax, rcx
	lea	rcx, 1[rax]
	cmp	rcx, rdx
	jb	.L55
	test	rax, rcx
	jne	.L55
	cmp	rdx, 1
	jbe	.L56
	mov	rax, rcx
	shr	rax
	cmp	rax, rdx
	jb	.L56
	.p2align 4
	.p2align 3
.L55:
	lea	rsi, .LC25[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	add	DWORD PTR fails[rip], 1
.L56:
	add	rbp, 8
	cmp	rbx, rbp
	jne	.L57
	mov	edx, DWORD PTR fails[rip]
	test	edx, edx
	jne	.L79
	lea	rdi, .LC27[rip]
	call	puts@PLT
	xor	eax, eax
	jmp	.L25
.L79:
	lea	rsi, .LC26[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, 1
.L25:
	mov	rdx, QWORD PTR 184[rsp]
	sub	rdx, QWORD PTR fs:40
	jne	.L80
	add	rsp, 200
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L70:
	lea	rbx, a.0[rip]
	mov	edx, -1831433054
	lea	r14, 16777216[rbx]
	mov	rcx, rbx
	.p2align 6
	.p2align 4
	.p2align 3
.L27:
	mov	eax, edx
	add	rcx, 4
	sal	eax, 13
	xor	eax, edx
	mov	edx, eax
	shr	edx, 17
	xor	eax, edx
	mov	edx, eax
	sal	edx, 5
	xor	edx, eax
	mov	DWORD PTR -4[rcx], edx
	cmp	r14, rcx
	jne	.L27
	mov	ebp, 1
	lea	r12, 32[rsp]
.L29:
	mov	rsi, r12
	mov	edi, 1
	call	clock_gettime@PLT
	pxor	xmm0, xmm0
	pxor	xmm1, xmm1
	mov	rax, rbx
	cvtsi2sd	xmm0, QWORD PTR 40[rsp]
	mulsd	xmm0, QWORD PTR .LC0[rip]
	cvtsi2sd	xmm1, QWORD PTR 32[rsp]
	movdqa	xmm4, XMMWORD PTR .LC3[rip]
	movdqa	xmm3, XMMWORD PTR .LC2[rip]
	movdqa	xmm5, XMMWORD PTR .LC1[rip]
	pxor	xmm6, xmm6
	pxor	xmm2, xmm2
	addsd	xmm0, xmm1
	movsd	QWORD PTR 8[rsp], xmm0
	.p2align 4
	.p2align 3
.L28:
	movdqa	xmm0, XMMWORD PTR [rax]
	add	rax, 16
	movdqa	xmm1, xmm0
	psrld	xmm1, 1
	pand	xmm1, xmm5
	psubd	xmm0, xmm1
	movdqa	xmm1, xmm0
	pand	xmm0, xmm3
	psrld	xmm1, 2
	pand	xmm1, xmm3
	paddd	xmm0, xmm1
	movdqa	xmm1, xmm0
	psrld	xmm1, 4
	paddd	xmm1, xmm0
	pand	xmm1, xmm4
	movdqa	xmm0, xmm1
	pslld	xmm0, 8
	paddd	xmm0, xmm1
	movdqa	xmm1, xmm0
	pslld	xmm1, 16
	paddd	xmm0, xmm1
	psrld	xmm0, 24
	movdqa	xmm1, xmm0
	punpckldq	xmm0, xmm2
	punpckhdq	xmm1, xmm2
	paddq	xmm0, xmm1
	paddq	xmm6, xmm0
	cmp	r14, rax
	jne	.L28
	mov	rsi, r12
	mov	edi, 1
	movaps	XMMWORD PTR 16[rsp], xmm6
	call	clock_gettime@PLT
	pxor	xmm0, xmm0
	pxor	xmm1, xmm1
	mov	edx, ebp
	movdqa	xmm6, XMMWORD PTR 16[rsp]
	cvtsi2sd	xmm0, QWORD PTR 40[rsp]
	mulsd	xmm0, QWORD PTR .LC0[rip]
	cvtsi2sd	xmm1, QWORD PTR 32[rsp]
	lea	rsi, .LC4[rip]
	mov	edi, 2
	mov	eax, 1
	addsd	xmm0, xmm1
	movdqa	xmm1, xmm6
	subsd	xmm0, QWORD PTR 8[rsp]
	psrldq	xmm1, 8
	paddq	xmm6, xmm1
	movsd	QWORD PTR 72[rsp+rbp*8], xmm0
	movq	rcx, xmm6
	add	rbp, 1
	call	__printf_chk@PLT
	cmp	rbp, 6
	jne	.L29
	mov	edx, 8
	mov	esi, 5
	lea	rdi, 80[rsp]
	lea	rcx, cmp_double[rip]
	call	qsort@PLT
	movsd	xmm0, QWORD PTR 96[rsp]
	mov	edi, 2
	movsd	xmm3, QWORD PTR .LC5[rip]
	movsd	xmm2, QWORD PTR 112[rsp]
	movsd	xmm1, QWORD PTR 80[rsp]
	mov	eax, 4
	lea	rsi, .LC7[rip]
	mulsd	xmm3, xmm0
	mulsd	xmm3, QWORD PTR .LC6[rip]
	call	__printf_chk@PLT
	xor	eax, eax
	jmp	.L25
.L80:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.local	a.0
	.comm	a.0,16777216,32
	.local	fails
	.comm	fails,4,4
	.section	.rodata
	.align 32
	.type	debruijn_ctz, @object
	.size	debruijn_ctz, 32
debruijn_ctz:
	.base64	"AAEcAh0OGAMeFhQPGREECB8bDRcVExAHGgwSBgsFCgk="
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-400107883
	.long	1041313291
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.long	1431655765
	.align 16
.LC2:
	.long	858993459
	.long	858993459
	.long	858993459
	.long	858993459
	.align 16
.LC3:
	.long	252645135
	.long	252645135
	.long	252645135
	.long	252645135
	.section	.rodata.cst8
	.align 8
.LC5:
	.long	0
	.long	1104006501
	.align 8
.LC6:
	.long	0
	.long	1049624576
	.section	.rodata.cst16
	.align 16
.LC16:
	.long	2147483647
	.long	-2147483648
	.long	-1
	.long	0
	.section	.rodata.cst8
	.align 8
.LC17:
	.long	1
	.long	12345
	.section	.rodata.cst16
	.align 16
.LC19:
	.quad	0
	.quad	1
	.align 16
.LC20:
	.quad	2
	.quad	3
	.align 16
.LC21:
	.quad	7
	.quad	8
	.align 16
.LC22:
	.quad	9
	.quad	2147483647
	.align 16
.LC23:
	.quad	2147483648
	.quad	4611686018427387903
	.align 16
.LC24:
	.quad	4611686018427387904
	.quad	-9223372036854775808
	.globl	__popcountdi2
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
