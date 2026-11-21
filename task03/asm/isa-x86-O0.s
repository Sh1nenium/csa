	.file	"isa.c"
	.intel_syntax noprefix
	.text
	.globl	max2
	.type	max2, @function
max2:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -4[rbp], edi
	mov	DWORD PTR -8[rbp], esi
	mov	edx, DWORD PTR -8[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cmp	edx, eax
	cmovge	eax, edx
	pop	rbp
	ret
	.size	max2, .-max2
	.globl	max3
	.type	max3, @function
max3:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -24[rbp], esi
	mov	DWORD PTR -28[rbp], edx
	mov	edx, DWORD PTR -24[rbp]
	mov	eax, DWORD PTR -20[rbp]
	cmp	edx, eax
	cmovge	eax, edx
	mov	DWORD PTR -4[rbp], eax
	mov	edx, DWORD PTR -28[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cmp	edx, eax
	cmovge	eax, edx
	pop	rbp
	ret
	.size	max3, .-max3
	.globl	sum
	.type	sum, @function
sum:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -16[rbp], 0
	mov	QWORD PTR -8[rbp], 0
	jmp	.L6
.L7:
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	add	QWORD PTR -16[rbp], rax
	add	QWORD PTR -8[rbp], 1
.L6:
	mov	rax, QWORD PTR -8[rbp]
	cmp	rax, QWORD PTR -32[rbp]
	jl	.L7
	mov	rax, QWORD PTR -16[rbp]
	pop	rbp
	ret
	.size	sum, .-sum
	.globl	f
	.type	f, @function
f:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -16[rbp], 0
	mov	QWORD PTR -8[rbp], 0
	jmp	.L10
.L11:
	mov	rax, QWORD PTR -8[rbp]
	imul	rax, rax
	add	QWORD PTR -16[rbp], rax
	add	QWORD PTR -8[rbp], 1
.L10:
	mov	rax, QWORD PTR -8[rbp]
	cmp	rax, QWORD PTR -24[rbp]
	jl	.L11
	mov	rax, QWORD PTR -16[rbp]
	pop	rbp
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
