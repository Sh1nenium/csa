	.file	"demo.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	f_and
	.type	f_and, @function
f_and:
	endbr64
	movzx	eax, dil
	ret
	.size	f_and, .-f_and
	.p2align 4
	.globl	f_or
	.type	f_or, @function
f_or:
	endbr64
	mov	eax, edi
	or	eax, 1
	ret
	.size	f_or, .-f_or
	.p2align 4
	.globl	f_shl
	.type	f_shl, @function
f_shl:
	endbr64
	lea	eax, 0[0+rdi*8]
	ret
	.size	f_shl, .-f_shl
	.p2align 4
	.globl	f_sar
	.type	f_sar, @function
f_sar:
	endbr64
	mov	eax, edi
	sar	eax, 3
	ret
	.size	f_sar, .-f_sar
	.p2align 4
	.globl	f_xor
	.type	f_xor, @function
f_xor:
	endbr64
	mov	eax, edi
	shr	eax, 16
	xor	eax, edi
	ret
	.size	f_xor, .-f_xor
	.p2align 4
	.globl	d7
	.type	d7, @function
d7:
	endbr64
	movsxd	rax, edi
	imul	rax, rax, -1840700269
	shr	rax, 32
	add	eax, edi
	sar	edi, 31
	sar	eax, 2
	sub	eax, edi
	ret
	.size	d7, .-d7
	.p2align 4
	.globl	m7
	.type	m7, @function
m7:
	endbr64
	movsxd	rax, edi
	mov	edx, edi
	imul	rax, rax, -1840700269
	sar	edx, 31
	shr	rax, 32
	add	eax, edi
	sar	eax, 2
	sub	eax, edx
	lea	edx, 0[0+rax*8]
	sub	edx, eax
	mov	eax, edi
	sub	eax, edx
	ret
	.size	m7, .-m7
	.p2align 4
	.globl	dv
	.type	dv, @function
dv:
	endbr64
	mov	eax, edi
	cdq
	idiv	esi
	ret
	.size	dv, .-dv
	.p2align 4
	.globl	mv
	.type	mv, @function
mv:
	endbr64
	mov	eax, edi
	cdq
	idiv	esi
	mov	eax, edx
	ret
	.size	mv, .-mv
	.p2align 4
	.globl	rot3_tmp
	.type	rot3_tmp, @function
rot3_tmp:
	endbr64
	mov	ecx, DWORD PTR [rsi]
	mov	eax, DWORD PTR [rdi]
	mov	DWORD PTR [rdi], ecx
	mov	ecx, DWORD PTR [rdx]
	mov	DWORD PTR [rsi], ecx
	mov	DWORD PTR [rdx], eax
	ret
	.size	rot3_tmp, .-rot3_tmp
	.p2align 4
	.globl	rot3_xor
	.type	rot3_xor, @function
rot3_xor:
	endbr64
	mov	eax, DWORD PTR [rdi]
	xor	eax, DWORD PTR [rsi]
	mov	DWORD PTR [rdi], eax
	xor	eax, DWORD PTR [rsi]
	mov	DWORD PTR [rsi], eax
	xor	DWORD PTR [rdi], eax
	mov	eax, DWORD PTR [rsi]
	xor	eax, DWORD PTR [rdx]
	mov	DWORD PTR [rsi], eax
	xor	eax, DWORD PTR [rdx]
	mov	DWORD PTR [rdx], eax
	xor	DWORD PTR [rsi], eax
	ret
	.size	rot3_xor, .-rot3_xor
	.p2align 4
	.globl	rot3_arith
	.type	rot3_arith, @function
rot3_arith:
	endbr64
	mov	r8, rsi
	mov	rsi, rdx
	mov	edx, DWORD PTR [rdx]
	add	edx, DWORD PTR [r8]
	add	edx, DWORD PTR [rdi]
	mov	DWORD PTR [rdi], edx
	mov	eax, edx
	mov	ecx, DWORD PTR [rsi]
	add	ecx, DWORD PTR [r8]
	sub	eax, ecx
	mov	DWORD PTR [rsi], eax
	mov	eax, DWORD PTR [r8]
	add	ecx, DWORD PTR [rdi]
	mov	r9d, ecx
	sub	r9d, eax
	sub	r9d, edx
	mov	DWORD PTR [r8], r9d
	sub	eax, DWORD PTR [rsi]
	add	eax, DWORD PTR [rdi]
	add	eax, edx
	sub	eax, ecx
	mov	DWORD PTR [rdi], eax
	ret
	.size	rot3_arith, .-rot3_arith
	.p2align 4
	.globl	max_tern
	.type	max_tern, @function
max_tern:
	endbr64
	cmp	esi, edi
	mov	eax, edi
	cmovge	eax, esi
	ret
	.size	max_tern, .-max_tern
	.p2align 4
	.globl	sel_tern
	.type	sel_tern, @function
sel_tern:
	endbr64
	test	rdi, rdi
	mov	rax, rsi
	cmove	rax, rdx
	ret
	.size	sel_tern, .-sel_tern
	.p2align 4
	.globl	sat_add32_tern
	.type	sat_add32_tern, @function
sat_add32_tern:
	endbr64
	lea	eax, [rdi+rsi]
	mov	edx, edi
	sar	edi, 31
	xor	edx, eax
	xor	esi, eax
	xor	edi, 2147483647
	test	edx, esi
	cmovs	eax, edi
	ret
	.size	sat_add32_tern, .-sat_add32_tern
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
