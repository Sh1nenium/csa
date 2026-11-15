	.file	"bits.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.type	cmp_double, @function
cmp_double:
	endbr64
	vmovsd	xmm0, QWORD PTR [rdi]
	vmovsd	xmm1, QWORD PTR [rsi]
	xor	eax, eax
	vcomisd	xmm0, xmm1
	seta	al
	xor	edx, edx
	vcomisd	xmm1, xmm0
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
	blsr	rax, rdi
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
	xor	eax, eax
	popcnt	eax, edi
	ret
	.size	popcount32, .-popcount32
	.p2align 4
	.globl	ctz32
	.type	ctz32, @function
ctz32:
	endbr64
	xor	eax, eax
	tzcnt	eax, edi
	and	eax, 31
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
	xor	ecx, ecx
	sal	eax, 4
	shlx	edx, edi, eax
	cmp	edx, 16777215
	setbe	cl
	sal	ecx, 3
	add	eax, ecx
	shlx	edx, edx, ecx
	xor	ecx, ecx
	cmp	edx, 268435455
	setbe	cl
	sal	ecx, 2
	add	eax, ecx
	shlx	edx, edx, ecx
	xor	ecx, ecx
	cmp	edx, 1073741823
	setbe	cl
	add	ecx, ecx
	add	eax, ecx
	shlx	edx, edx, ecx
	mov	ecx, edx
	not	ecx
	shr	ecx, 31
	shlx	edx, edx, ecx
	cmp	edx, 1
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
	lea	eax, -1[rsi]
	mov	rdx, -1
	neg	esi
	mov	ecx, 1
	shlx	rcx, rcx, rax
	shrx	rax, rdx, rsi
	and	rax, rdi
	xor	rax, rcx
	sub	rax, rcx
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
.LC1:
	.string	"run %d: %.6f s, sum %llu\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"median %.6f s, min %.6f, max %.6f, ns/element %.2f\n"
	.section	.rodata.str1.1
.LC5:
	.string	"popcount32"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"FAIL %-12s got %llu, want %llu\n"
	.section	.rodata.str1.1
.LC7:
	.string	"parity32"
.LC8:
	.string	"ctz32"
.LC9:
	.string	"clz32"
.LC10:
	.string	"is_pow2"
.LC11:
	.string	"sign_extend"
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"FAIL %-12s got %lld, want %lld\n"
	.section	.rodata.str1.1
.LC15:
	.string	"sat_add32"
.LC19:
	.string	"FAIL next_pow2(%llu) = %llu\n"
.LC20:
	.string	"FAILED: %d\n"
.LC21:
	.string	"OK"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	endbr64
	lea	r10, 8[rsp]
	and	rsp, -32
	push	QWORD PTR -8[r10]
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	r10
	push	rbx
	sub	rsp, 192
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	cmp	edi, 1
	jle	.L62
	mov	rax, QWORD PTR 8[rsi]
	cmp	BYTE PTR [rax], 45
	je	.L70
.L62:
	mov	ebx, 200000
	mov	ecx, 14
	mov	r8d, 14
	mov	r12d, 1
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L33:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L32:
	mov	ecx, r12d
	xor	r8d, r8d
	shr	ecx, 16
	popcnt	r8d, r12d
	and	r8d, 1
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
	mov	edi, r12d
	xor	r8d, r8d
	call	clz32
	lzcnt	r8d, r12d
	mov	ecx, eax
	cmp	r8, rcx
	je	.L40
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jle	.L72
.L41:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L40:
	add	r13d, 1013904222
	xor	r8d, r8d
	mov	eax, r12d
	test	r13d, r12d
	sete	r8b
	xor	ecx, ecx
	blsr	rax, rax
	sete	cl
	cmp	r8, rcx
	je	.L37
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jle	.L73
.L43:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L37:
	sub	ebx, 1
	je	.L74
	imul	r8d, r12d, 1664525
	add	r8d, 1013904223
	popcnt	r8d, r8d
	mov	ecx, r8d
.L31:
	imul	r13d, r12d, 1664525
	lea	r12d, 1013904223[r13]
	cmp	r8, rcx
	je	.L32
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jg	.L33
	lea	rdx, .LC5[rip]
	lea	rsi, .LC6[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L73:
	lea	rdx, .LC10[rip]
	lea	rsi, .LC6[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L71:
	lea	rdx, .LC7[rip]
	lea	rsi, .LC6[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L72:
	lea	rdx, .LC9[rip]
	lea	rsi, .LC6[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L41
.L74:
	movabs	r15, 1085102592571150095
	mov	r13d, 63
	movabs	r12, -9223372036854775808
	jmp	.L49
	.p2align 4,,10
	.p2align 3
.L46:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L45:
	movabs	rax, -1085102592571150096
	and	rbx, rax
	shlx	r8, rax, r13
	sarx	r8, r8, r13
	mov	rcx, rbx
	xor	rcx, r14
	sub	rcx, r14
	cmp	rcx, r8
	je	.L47
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jle	.L75
.L48:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L47:
	sub	r13d, 1
	jb	.L76
.L49:
	mov	rbx, -1
	shrx	r14, r12, r13
	shlx	r8, r15, r13
	sarx	r8, r8, r13
	shrx	rbx, rbx, r13
	mov	rcx, rbx
	and	rcx, r15
	xor	rcx, r14
	sub	rcx, r14
	cmp	rcx, r8
	je	.L45
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jg	.L46
	lea	rdx, .LC11[rip]
	lea	rsi, .LC12[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L75:
	lea	rdx, .LC11[rip]
	lea	rsi, .LC12[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	jmp	.L48
.L76:
	mov	rax, QWORD PTR .LC14[rip]
	vmovdqa	xmm0, XMMWORD PTR .LC13[rip]
	mov	DWORD PTR -184[rbp], -12345
	lea	r14, -180[rbp]
	lea	r9, -208[rbp]
	mov	r12d, 2147483647
	mov	QWORD PTR -192[rbp], rax
	vmovdqa	XMMWORD PTR -208[rbp], xmm0
	.p2align 4
	.p2align 3
.L50:
	mov	r13d, r12d
	movsxd	r15, r12d
	lea	rbx, -208[rbp]
	shr	r13d, 31
	add	r13d, 2147483647
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L52:
	add	eax, 1
	mov	DWORD PTR fails[rip], eax
.L51:
	add	rbx, 4
	cmp	rbx, r14
	je	.L77
.L53:
	movsxd	r8, DWORD PTR [rbx]
	mov	rax, -2147483648
	mov	rdx, r8
	add	r8, r15
	cmp	r8, rax
	lea	ecx, [rdx+r12]
	cmovl	r8, rax
	mov	eax, 2147483647
	cmp	r8, rax
	cmovg	r8, rax
	mov	eax, ecx
	xor	edx, ecx
	xor	eax, r12d
	and	eax, edx
	sar	eax, 31
	andn	ecx, eax, ecx
	and	eax, r13d
	or	ecx, eax
	movsxd	rcx, ecx
	cmp	rcx, r8
	je	.L51
	mov	eax, DWORD PTR fails[rip]
	cmp	eax, 9
	jg	.L52
	lea	rdx, .LC15[rip]
	lea	rsi, .LC12[rip]
	mov	edi, 2
	xor	eax, eax
	mov	QWORD PTR -232[rbp], r9
	call	__printf_chk@PLT
	mov	eax, DWORD PTR fails[rip]
	mov	r9, QWORD PTR -232[rbp]
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L77:
	add	r9, 4
	cmp	r14, r9
	je	.L54
	mov	r12d, DWORD PTR [r9]
	jmp	.L50
.L54:
	vmovdqa	ymm0, YMMWORD PTR .LC16[rip]
	lea	r12, -176[rbp]
	lea	rbx, -80[rbp]
	vmovdqa	YMMWORD PTR -176[rbp], ymm0
	vmovdqa	ymm0, YMMWORD PTR .LC17[rip]
	vmovdqa	YMMWORD PTR -144[rbp], ymm0
	vmovdqa	ymm0, YMMWORD PTR .LC18[rip]
	vmovdqa	YMMWORD PTR -112[rbp], ymm0
	vzeroupper
	.p2align 4
	.p2align 3
.L57:
	mov	rdx, QWORD PTR [r12]
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
	lea	rsi, .LC19[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	add	DWORD PTR fails[rip], 1
.L56:
	add	r12, 8
	cmp	rbx, r12
	jne	.L57
	mov	edx, DWORD PTR fails[rip]
	test	edx, edx
	jne	.L78
	lea	rdi, .LC21[rip]
	call	puts@PLT
	xor	eax, eax
	jmp	.L25
.L78:
	lea	rsi, .LC20[rip]
	mov	edi, 2
	xor	eax, eax
	call	__printf_chk@PLT
	mov	eax, 1
.L25:
	mov	rdx, QWORD PTR -56[rbp]
	sub	rdx, QWORD PTR fs:40
	jne	.L79
	add	rsp, 192
	pop	rbx
	pop	r10
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	lea	rsp, -8[r10]
	ret
.L70:
	lea	r13, a.0[rip]
	mov	edx, -1831433054
	lea	r14, 16777216[r13]
	mov	rcx, r13
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
	lea	rax, -176[rbp]
	mov	ebx, 1
	lea	r12, -224[rbp]
	mov	QWORD PTR -240[rbp], rax
.L29:
	mov	rsi, r12
	mov	edi, 1
	xor	r15d, r15d
	call	clock_gettime@PLT
	vxorpd	xmm4, xmm4, xmm4
	mov	rax, r13
	vcvtsi2sd	xmm0, xmm4, QWORD PTR -216[rbp]
	vmulsd	xmm0, xmm0, QWORD PTR .LC0[rip]
	vcvtsi2sd	xmm1, xmm4, QWORD PTR -224[rbp]
	vaddsd	xmm6, xmm0, xmm1
	vmovsd	QWORD PTR -232[rbp], xmm6
	.p2align 5
	.p2align 4
	.p2align 3
.L28:
	xor	edx, edx
	add	rax, 4
	popcnt	edx, DWORD PTR -4[rax]
	add	r15, rdx
	cmp	r14, rax
	jne	.L28
	mov	rsi, r12
	mov	edi, 1
	call	clock_gettime@PLT
	vxorpd	xmm5, xmm5, xmm5
	mov	edx, ebx
	mov	rcx, r15
	vcvtsi2sd	xmm0, xmm5, QWORD PTR -216[rbp]
	vmulsd	xmm0, xmm0, QWORD PTR .LC0[rip]
	vcvtsi2sd	xmm1, xmm5, QWORD PTR -224[rbp]
	mov	rax, QWORD PTR -240[rbp]
	lea	rsi, .LC1[rip]
	mov	edi, 2
	vaddsd	xmm0, xmm0, xmm1
	vsubsd	xmm0, xmm0, QWORD PTR -232[rbp]
	vmovsd	QWORD PTR -8[rax+rbx*8], xmm0
	mov	eax, 1
	add	rbx, 1
	call	__printf_chk@PLT
	cmp	rbx, 6
	jne	.L29
	mov	rdi, QWORD PTR -240[rbp]
	mov	edx, 8
	mov	esi, 5
	lea	rcx, cmp_double[rip]
	call	qsort@PLT
	vmovsd	xmm0, QWORD PTR -160[rbp]
	vmulsd	xmm3, xmm0, QWORD PTR .LC2[rip]
	lea	rsi, .LC4[rip]
	vmulsd	xmm3, xmm3, QWORD PTR .LC3[rip]
	mov	edi, 2
	mov	eax, 4
	vmovsd	xmm2, QWORD PTR -144[rbp]
	vmovsd	xmm1, QWORD PTR -176[rbp]
	call	__printf_chk@PLT
	xor	eax, eax
	jmp	.L25
.L79:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.local	a.0
	.comm	a.0,16777216,32
	.local	fails
	.comm	fails,4,4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-400107883
	.long	1041313291
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.align 8
.LC3:
	.long	0
	.long	1049624576
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC13:
	.long	2147483647
	.long	-2147483648
	.long	-1
	.long	0
	.section	.rodata.cst8
	.align 8
.LC14:
	.long	1
	.long	12345
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC16:
	.quad	0
	.quad	1
	.quad	2
	.quad	3
	.align 32
.LC17:
	.quad	7
	.quad	8
	.quad	9
	.quad	2147483647
	.align 32
.LC18:
	.quad	2147483648
	.quad	4611686018427387903
	.quad	4611686018427387904
	.quad	-9223372036854775808
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
