	.file	"isa.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	max2
	.type	max2, @function
max2:
	endbr64
	cmp	esi, edi
	mov	eax, edi
	cmovge	eax, esi
	ret
	.size	max2, .-max2
	.p2align 4
	.globl	max3
	.type	max3, @function
max3:
	endbr64
	cmp	edi, edx
	mov	eax, esi
	cmovl	edi, edx
	cmp	edi, esi
	cmovge	eax, edi
	ret
	.size	max3, .-max3
	.p2align 4
	.globl	sum
	.type	sum, @function
sum:
	endbr64
	test	rsi, rsi
	jle	.L7
	lea	rdx, [rdi+rsi*8]
	xor	eax, eax
	.p2align 4
	.p2align 4
	.p2align 3
.L6:
	add	rax, QWORD PTR [rdi]
	add	rdi, 8
	cmp	rdi, rdx
	jne	.L6
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	xor	eax, eax
	ret
	.size	sum, .-sum
	.p2align 4
	.globl	f
	.type	f, @function
f:
	endbr64
	test	rdi, rdi
	jle	.L12
	xor	eax, eax
	xor	edx, edx
	.p2align 5
	.p2align 4
	.p2align 3
.L11:
	mov	rcx, rax
	imul	rcx, rax
	add	rax, 1
	add	rdx, rcx
	cmp	rdi, rax
	jne	.L11
	mov	rax, rdx
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	xor	edx, edx
	mov	rax, rdx
	ret
	.size	f, .-f
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
