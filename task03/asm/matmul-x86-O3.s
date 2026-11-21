	.file	"matmul.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.type	mul_ijk, @function
mul_ijk:
	endbr64
	mov	r11d, DWORD PTR n[rip]
	test	r11d, r11d
	jle	.L26
	push	rbp
	movsxd	rax, r11d
	lea	r10, c[rip]
	lea	rdx, a[rip]
	lea	rdi, [rax+rax*2]
	lea	eax, -1[r11]
	xor	r9d, r9d
	mov	rbp, rsp
	push	r15
	lea	r15, b[rip]
	push	r14
	mov	r14d, r11d
	shr	r14d, 2
	sal	r14, 5
	push	r13
	mov	r13, rdi
	sal	rdi, 11
	mov	rcx, r14
	sal	r13, 8
	push	r12
	mov	r12d, r11d
	and	r12d, -4
	push	rbx
	and	rsp, -32
	mov	DWORD PTR -20[rsp], eax
	lea	rax, [r15+rdi]
	mov	QWORD PTR -16[rsp], rax
	.p2align 4,,10
	.p2align 3
.L3:
	cmp	DWORD PTR -20[rsp], 2
	jbe	.L13
.L11:
	mov	r8, QWORD PTR -16[rsp]
	lea	r14, [rcx+r10]
	mov	rbx, r10
	.p2align 4,,10
	.p2align 3
.L5:
	mov	rax, r8
	vmovapd	ymm0, YMMWORD PTR [rbx]
	mov	rsi, rdx
	sub	rax, rdi
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L4:
	vbroadcastsd	ymm1, QWORD PTR [rsi]
	add	rax, 6144
	add	rsi, 8
	vfmadd231pd	ymm0, ymm1, YMMWORD PTR -6144[rax]
	cmp	rax, r8
	jne	.L4
	vmovapd	YMMWORD PTR [rbx], ymm0
	add	rbx, 32
	lea	r8, 32[rax]
	cmp	rbx, r14
	jne	.L5
	movsxd	r8, r12d
	cmp	r11d, r12d
	je	.L30
.L12:
	lea	rax, [r9+r8]
	lea	rbx, c[rip]
	mov	QWORD PTR -8[rsp], r9
	lea	rbx, [rbx+rax*8]
	lea	rax, [r8+r13]
	lea	rsi, [r15+rax*8]
	lea	rax, a[rip]
	lea	r14, [rax+r9*8]
.L8:
	mov	rax, rsi
	vmovsd	xmm0, QWORD PTR [rbx]
	mov	r9, r14
	sub	rax, rdi
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L7:
	vmovsd	xmm2, QWORD PTR [rax]
	add	rax, 6144
	add	r9, 8
	vfmadd231sd	xmm0, xmm2, QWORD PTR -8[r9]
	cmp	rax, rsi
	jne	.L7
	inc	r8
	vmovsd	QWORD PTR [rbx], xmm0
	lea	rsi, 8[rax]
	add	rbx, 8
	cmp	r11d, r8d
	jg	.L8
	mov	r9, QWORD PTR -8[rsp]
	add	rdx, 6144
	add	r10, 6144
	add	r9, 768
	cmp	r9, r13
	jne	.L3
.L23:
	vzeroupper
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
.L30:
	add	r9, 768
	add	rdx, 6144
	add	r10, 6144
	cmp	r9, r13
	jne	.L11
	jmp	.L23
.L13:
	xor	r8d, r8d
	jmp	.L12
.L26:
	ret
	.size	mul_ijk, .-mul_ijk
	.p2align 4
	.type	mul_ikj, @function
mul_ikj:
	endbr64
	mov	esi, DWORD PTR n[rip]
	test	esi, esi
	jle	.L76
	push	rbp
	lea	edx, -3[rsi]
	lea	eax, -1[rsi]
	and	edx, -2
	mov	rbp, rsp
	push	r15
	lea	r15, b[rip]
	push	r14
	lea	r14, c[rip]
	push	r13
	lea	r13d, 2[rdx]
	mov	edx, esi
	shr	edx, 2
	sal	rdx, 5
	push	r12
	lea	r12, a[rip+8]
	push	rbx
	and	rsp, -32
	mov	QWORD PTR -16[rsp], 0
	mov	DWORD PTR -24[rsp], 0
	mov	QWORD PTR -48[rsp], r12
	mov	DWORD PTR -20[rsp], eax
	mov	rax, r14
	.p2align 4,,10
	.p2align 3
.L33:
	xor	r8d, r8d
	cmp	esi, 2
	jle	.L50
	movsxd	rdi, DWORD PTR -24[rsp]
	mov	DWORD PTR -40[rsp], r13d
	lea	rcx, b[rip]
	xor	r12d, r12d
	mov	QWORD PTR -8[rsp], rax
	mov	r9, QWORD PTR -48[rsp]
	xor	r10d, r10d
	lea	rdi, [rdi+rdi*2]
	sal	rdi, 8
	mov	QWORD PTR -32[rsp], rdi
	.p2align 4,,10
	.p2align 3
.L40:
	cmp	DWORD PTR -20[rsp], 2
	vmovsd	xmm3, QWORD PTR -8[r9]
	mov	rax, QWORD PTR -8[rsp]
	je	.L79
.L37:
	vbroadcastsd	ymm1, QWORD PTR [r9]
	vbroadcastsd	ymm2, xmm3
	lea	r8, 6144[rcx]
	xor	edi, edi
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L34:
	vmovapd	ymm0, YMMWORD PTR [rcx+rdi]
	vfmadd213pd	ymm0, ymm2, YMMWORD PTR [rax+rdi]
	vmovapd	YMMWORD PTR [rax+rdi], ymm0
	vfmadd231pd	ymm0, ymm1, YMMWORD PTR [r8+rdi]
	vmovapd	YMMWORD PTR [rax+rdi], ymm0
	add	rdi, 32
	cmp	rdx, rdi
	jne	.L34
	mov	edi, esi
	and	edi, -4
	mov	r8d, edi
	cmp	esi, edi
	je	.L80
	mov	r11d, esi
	mov	QWORD PTR -8[rsp], rax
	sub	r11d, edi
	cmp	r11d, 1
	je	.L38
.L48:
	mov	rbx, QWORD PTR -16[rsp]
	vmovddup	xmm0, xmm3
	vmovddup	xmm1, QWORD PTR [r9]
	lea	rax, b[rip+6144]
	add	rbx, r8
	add	r8, r12
	vmovapd	xmm4, XMMWORD PTR [r14+rbx*8]
	vfmadd132pd	xmm0, xmm4, XMMWORD PTR [r15+r8*8]
	vmovapd	XMMWORD PTR [r14+rbx*8], xmm0
	vfmadd231pd	xmm0, xmm1, XMMWORD PTR [rax+r8*8]
	vmovapd	XMMWORD PTR [r14+rbx*8], xmm0
	test	r11b, 1
	je	.L39
	and	r11d, -2
	add	edi, r11d
.L38:
	mov	rax, QWORD PTR -32[rsp]
	movsxd	rdi, edi
	movsxd	r11, r10d
	lea	r8d, 1[r10]
	lea	r11, [r11+r11*2]
	movsxd	r8, r8d
	vmovsd	xmm6, QWORD PTR [r9]
	lea	rbx, [rax+rdi]
	sal	r11, 8
	lea	r8, [r8+r8*2]
	vmovsd	xmm5, QWORD PTR [r14+rbx*8]
	add	r11, rdi
	sal	r8, 8
	add	r8, rdi
	vfmadd132sd	xmm3, xmm5, QWORD PTR [r15+r11*8]
	vfmadd231sd	xmm3, xmm6, QWORD PTR [r15+r8*8]
	vmovsd	QWORD PTR [r14+rbx*8], xmm3
.L39:
	add	r10d, 2
	add	rcx, 12288
	add	r12, 1536
	add	r9, 16
	cmp	r10d, r13d
	jne	.L40
	movsxd	r8, DWORD PTR -40[rsp]
	mov	rax, QWORD PTR -8[rsp]
.L50:
	mov	rbx, QWORD PTR -16[rsp]
	movsxd	r9, DWORD PTR -24[rsp]
	lea	rdi, [r8+r8*2]
	sal	rdi, 11
	lea	rcx, 0[0+rbx*8]
	lea	r9, [r9+r9*2]
	add	rdi, r15
	lea	rbx, a[rip]
	sal	r9, 8
	add	rbx, rcx
	mov	QWORD PTR -40[rsp], r9
	add	rcx, r14
	mov	QWORD PTR -32[rsp], rbx
.L47:
	mov	rbx, QWORD PTR -32[rsp]
	cmp	DWORD PTR -20[rsp], 2
	mov	DWORD PTR -8[rsp], r8d
	vmovsd	xmm2, QWORD PTR [rbx+r8*8]
	jbe	.L51
.L44:
	vbroadcastsd	ymm1, xmm2
	xor	r9d, r9d
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L42:
	vmovapd	ymm0, YMMWORD PTR [rdi+r9]
	vfmadd213pd	ymm0, ymm1, YMMWORD PTR [rcx+r9]
	vmovapd	YMMWORD PTR [rcx+r9], ymm0
	add	r9, 32
	cmp	rdx, r9
	jne	.L42
	mov	r9d, esi
	and	r9d, -4
	mov	r10d, r9d
	cmp	r9d, esi
	je	.L81
.L41:
	mov	ebx, esi
	sub	ebx, r10d
	cmp	ebx, 1
	je	.L45
	mov	r11, QWORD PTR -16[rsp]
	vmovddup	xmm0, xmm2
	add	r11, r10
	lea	r12, [r14+r11*8]
	lea	r11, [r8+r8*2]
	vmovapd	xmm7, XMMWORD PTR [r12]
	sal	r11, 8
	add	r11, r10
	vfmadd132pd	xmm0, xmm7, XMMWORD PTR [r15+r11*8]
	vmovapd	XMMWORD PTR [r12], xmm0
	test	bl, 1
	je	.L46
	and	ebx, -2
	add	r9d, ebx
.L45:
	mov	rbx, QWORD PTR -40[rsp]
	movsxd	r11, DWORD PTR -8[rsp]
	movsxd	r9, r9d
	lea	r10, [rbx+r9]
	lea	r11, [r11+r11*2]
	vmovsd	xmm7, QWORD PTR [r14+r10*8]
	sal	r11, 8
	add	r11, r9
	vfmadd132sd	xmm2, xmm7, QWORD PTR [r15+r11*8]
	vmovsd	QWORD PTR [r14+r10*8], xmm2
.L46:
	inc	r8
	add	rdi, 6144
	cmp	esi, r8d
	jg	.L47
.L43:
	inc	DWORD PTR -24[rsp]
	add	rax, 6144
	add	QWORD PTR -48[rsp], 6144
	add	QWORD PTR -16[rsp], 768
	mov	ebx, DWORD PTR -24[rsp]
	cmp	ebx, esi
	jne	.L33
	vzeroupper
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.p2align 4,,10
	.p2align 3
.L80:
	add	r10d, 2
	cmp	r10d, r13d
	je	.L69
	add	r9, 16
	add	rcx, 12288
	add	r12, 1536
	vmovsd	xmm3, QWORD PTR -8[r9]
	jmp	.L37
.L79:
	mov	r11d, 3
	xor	r8d, r8d
	xor	edi, edi
	jmp	.L48
.L81:
	inc	r8
	cmp	esi, r8d
	jle	.L43
	mov	rbx, QWORD PTR -32[rsp]
	mov	DWORD PTR -8[rsp], r8d
	add	rdi, 6144
	vmovsd	xmm2, QWORD PTR [rbx+r8*8]
	jmp	.L44
.L69:
	movsxd	r8, DWORD PTR -40[rsp]
	jmp	.L50
.L51:
	xor	r10d, r10d
	xor	r9d, r9d
	jmp	.L41
.L76:
	ret
	.size	mul_ikj, .-mul_ikj
	.p2align 4
	.type	mul_jik, @function
mul_jik:
	endbr64
	mov	esi, DWORD PTR n[rip]
	test	esi, esi
	jle	.L101
	push	rbp
	lea	r11, b[rip]
	lea	rdx, c[rip]
	mov	rbp, rsp
	push	r15
	lea	r15d, -1[rsi]
	push	r14
	mov	r14d, esi
	shr	r14d, 2
	sal	r14, 5
	push	r13
	mov	r13, r11
	push	r12
	xor	r12d, r12d
	push	rbx
	lea	rbx, a[rip]
	and	rsp, -32
	.p2align 4,,10
	.p2align 3
.L84:
	mov	DWORD PTR -4[rsp], r12d
	lea	r9, a[rip]
	mov	rcx, rdx
	xor	r8d, r8d
	mov	QWORD PTR -16[rsp], rdx
	movsxd	r10, r12d
	.p2align 4,,10
	.p2align 3
.L92:
	vmovsd	xmm1, QWORD PTR [rcx]
	cmp	r15d, 2
	jbe	.L93
.L90:
	lea	rdi, [r14+r9]
	mov	rax, r13
	mov	rdx, r9
	.p2align 4,,10
	.p2align 3
.L87:
	vmovsd	xmm2, QWORD PTR 12288[rax]
	vmovsd	xmm0, QWORD PTR [rax]
	add	rdx, 32
	add	rax, 24576
	vmovhpd	xmm2, xmm2, QWORD PTR -6144[rax]
	vmovhpd	xmm0, xmm0, QWORD PTR -18432[rax]
	vinsertf64x2	ymm0, ymm0, xmm2, 0x1
	vmulpd	ymm0, ymm0, YMMWORD PTR -32[rdx]
	vaddsd	xmm1, xmm1, xmm0
	vunpckhpd	xmm3, xmm0, xmm0
	vaddsd	xmm1, xmm1, xmm3
	vextractf64x2	xmm3, ymm0, 1
	valignq	ymm0, ymm0, ymm0, 3
	vaddsd	xmm1, xmm1, xmm3
	vaddsd	xmm1, xmm1, xmm0
	cmp	rdi, rdx
	jne	.L87
	test	sil, 3
	je	.L85
	mov	eax, esi
	and	eax, -4
.L91:
	movsxd	rdi, r8d
	movsxd	rdx, eax
	lea	rdi, [rdi+rdi*2]
	sal	rdi, 8
	lea	r12, [rdi+rdx]
	lea	rdx, [rdx+rdx*2]
	vmovsd	xmm4, QWORD PTR [rbx+r12*8]
	sal	rdx, 8
	add	rdx, r10
	vfmadd231sd	xmm1, xmm4, QWORD PTR [r11+rdx*8]
	lea	edx, 1[rax]
	cmp	esi, edx
	jle	.L86
	movsxd	rdx, edx
	add	eax, 2
	lea	r12, [rdi+rdx]
	lea	rdx, [rdx+rdx*2]
	vmovsd	xmm5, QWORD PTR [rbx+r12*8]
	sal	rdx, 8
	add	rdx, r10
	vfmadd231sd	xmm1, xmm5, QWORD PTR [r11+rdx*8]
	cmp	esi, eax
	jle	.L86
	cdqe
	lea	rdx, [rax+rax*2]
	add	rax, rdi
	sal	rdx, 8
	add	rdx, r10
	vmovsd	xmm6, QWORD PTR [r11+rdx*8]
	vfmadd231sd	xmm1, xmm6, QWORD PTR [rbx+rax*8]
.L86:
	inc	r8d
	vmovsd	QWORD PTR [rcx], xmm1
	add	r9, 6144
	add	rcx, 6144
	cmp	r8d, esi
	jne	.L92
.L97:
	mov	r12d, DWORD PTR -4[rsp]
	mov	rdx, QWORD PTR -16[rsp]
	add	r13, 8
	inc	r12d
	add	rdx, 8
	cmp	r12d, esi
	jne	.L84
	vzeroupper
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	inc	r8d
	vmovsd	QWORD PTR [rcx], xmm1
	cmp	esi, r8d
	je	.L97
	add	rcx, 6144
	add	r9, 6144
	vmovsd	xmm1, QWORD PTR [rcx]
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L93:
	xor	eax, eax
	jmp	.L91
.L101:
	ret
	.size	mul_jik, .-mul_jik
	.p2align 4
	.type	mul_jki, @function
mul_jki:
	endbr64
	mov	eax, DWORD PTR n[rip]
	test	eax, eax
	jle	.L127
	push	rbp
	movsxd	rcx, eax
	lea	r9, c[rip]
	xor	r8d, r8d
	lea	rdx, [rcx+rcx*2]
	sal	rdx, 11
	mov	rbp, rsp
	push	r15
	add	rdx, r9
	push	r14
	push	r13
	push	r12
	push	rbx
	mov	ebx, eax
	lea	eax, -1[rax]
	and	rsp, -32
	mov	QWORD PTR -48[rsp], rcx
	lea	ecx, -3[rbx]
	shr	ecx
	mov	DWORD PTR -36[rsp], eax
	mov	rax, r9
	inc	ecx
	mov	QWORD PTR -64[rsp], rcx
	mov	ecx, ebx
	shr	ecx, 2
	lea	rcx, [rcx+rcx*2]
	sal	rcx, 13
	mov	QWORD PTR -56[rsp], rcx
	lea	rcx, b[rip]
	.p2align 4,,10
	.p2align 3
.L106:
	movsxd	r13, r8d
	xor	edi, edi
	cmp	ebx, 2
	jle	.L116
	mov	rdi, QWORD PTR -64[rsp]
	mov	DWORD PTR -8[rsp], ebx
	lea	r14, a[rip+8]
	mov	r11, rcx
	mov	r12d, 1
	xor	r10d, r10d
	lea	r15, [rdi+rdi]
	.p2align 4,,10
	.p2align 3
.L108:
	mov	rbx, r10
	vmovsd	xmm2, QWORD PTR [r11]
	vmovsd	xmm1, QWORD PTR 6144[r11]
	mov	rdi, r14
	mov	rsi, rax
	sub	rbx, r12
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L107:
	vmovsd	xmm0, QWORD PTR [rdi+rbx*8]
	add	rsi, 6144
	add	rdi, 6144
	vfmadd213sd	xmm0, xmm2, QWORD PTR -6144[rsi]
	vfmadd231sd	xmm0, xmm1, QWORD PTR -6144[rdi]
	vmovsd	QWORD PTR -6144[rsi], xmm0
	cmp	rsi, rdx
	jne	.L107
	lea	rsi, 2[r10]
	add	r11, 12288
	add	r14, 16
	add	r12, 2
	cmp	rsi, r15
	je	.L130
	mov	r10, rsi
	jmp	.L108
	.p2align 4,,10
	.p2align 3
.L130:
	mov	ebx, DWORD PTR -8[rsp]
	lea	edi, 2[r10]
.L116:
	lea	rsi, a[rip]
	movsxd	rdi, edi
	lea	r14, b[rip]
	mov	QWORD PTR -32[rsp], r8
	lea	r12, [rsi+rdi*8]
	lea	rsi, 0[0+r8*8]
	add	r14, rsi
	add	rsi, r9
	mov	QWORD PTR -16[rsp], r14
	mov	r14, QWORD PTR -56[rsp]
	mov	QWORD PTR -24[rsp], rsi
	lea	r10, [r14+rsi]
	mov	r14d, ebx
	mov	QWORD PTR -8[rsp], r10
	and	r14d, -4
.L114:
	mov	r8, QWORD PTR -16[rsp]
	lea	rsi, [rdi+rdi*2]
	movsxd	r11, edi
	sal	rsi, 11
	cmp	DWORD PTR -36[rsp], 2
	vmovsd	xmm4, QWORD PTR [r8+rsi]
	jbe	.L118
	mov	r10, QWORD PTR -8[rsp]
	mov	r8d, r14d
.L112:
	mov	rsi, QWORD PTR -24[rsp]
	vbroadcastsd	ymm3, xmm4
	mov	r15, r12
	.p2align 4,,10
	.p2align 3
.L110:
	vmovsd	xmm1, QWORD PTR 12288[r15]
	vmovsd	xmm0, QWORD PTR [r15]
	add	rsi, 24576
	add	r15, 24576
	vmovsd	xmm2, QWORD PTR -12288[rsi]
	vmovhpd	xmm1, xmm1, QWORD PTR -6144[r15]
	vmovhpd	xmm0, xmm0, QWORD PTR -18432[r15]
	vinsertf64x2	ymm0, ymm0, xmm1, 0x1
	vmovsd	xmm1, QWORD PTR -24576[rsi]
	vmovhpd	xmm2, xmm2, QWORD PTR -6144[rsi]
	vmovhpd	xmm1, xmm1, QWORD PTR -18432[rsi]
	vinsertf64x2	ymm1, ymm1, xmm2, 0x1
	vfmadd132pd	ymm0, ymm1, ymm3
	vextractf64x2	xmm1, ymm0, 1
	vmovlpd	QWORD PTR -24576[rsi], xmm0
	vmovhpd	QWORD PTR -18432[rsi], xmm0
	valignq	ymm0, ymm0, ymm0, 3
	vmovsd	QWORD PTR -12288[rsi], xmm1
	vmovsd	QWORD PTR -6144[rsi], xmm0
	cmp	rsi, r10
	jne	.L110
	cmp	ebx, r14d
	je	.L131
	mov	QWORD PTR -8[rsp], r10
.L109:
	movsxd	rsi, r8d
	lea	r10, a[rip]
	lea	rsi, [rsi+rsi*2]
	sal	rsi, 8
	lea	r15, [rsi+r13]
	add	rsi, r11
	vmovsd	xmm0, QWORD PTR [r10+rsi*8]
	lea	esi, 1[r8]
	vfmadd213sd	xmm0, xmm4, QWORD PTR [r9+r15*8]
	vmovsd	QWORD PTR [r9+r15*8], xmm0
	cmp	ebx, esi
	jle	.L113
	movsxd	rsi, esi
	add	r8d, 2
	lea	rsi, [rsi+rsi*2]
	sal	rsi, 8
	lea	r15, [rsi+r13]
	add	rsi, r11
	vmovsd	xmm0, QWORD PTR [r10+rsi*8]
	vfmadd213sd	xmm0, xmm4, QWORD PTR [r9+r15*8]
	vmovsd	QWORD PTR [r9+r15*8], xmm0
	cmp	ebx, r8d
	jle	.L113
	movsxd	r8, r8d
	lea	rsi, [r8+r8*2]
	sal	rsi, 8
	lea	r8, [rsi+r13]
	add	rsi, r11
	vmovsd	xmm5, QWORD PTR [r9+r8*8]
	vfmadd132sd	xmm4, xmm5, QWORD PTR [r10+rsi*8]
	vmovsd	QWORD PTR [r9+r8*8], xmm4
.L113:
	inc	rdi
	add	r12, 8
	cmp	ebx, edi
	jg	.L114
.L123:
	mov	r8, QWORD PTR -32[rsp]
	add	rcx, 8
	add	rax, 8
	add	rdx, 8
	inc	r8
	cmp	r8, QWORD PTR -48[rsp]
	jne	.L106
	vzeroupper
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
.L131:
	inc	rdi
	cmp	ebx, edi
	jle	.L123
	mov	r15, QWORD PTR -16[rsp]
	lea	rsi, [rdi+rdi*2]
	add	r12, 8
	movsxd	r11, edi
	sal	rsi, 11
	vmovsd	xmm4, QWORD PTR [r15+rsi]
	jmp	.L112
.L118:
	xor	r8d, r8d
	jmp	.L109
.L127:
	ret
	.size	mul_jki, .-mul_jki
	.p2align 4
	.type	mul_kij, @function
mul_kij:
	endbr64
	mov	r9d, DWORD PTR n[rip]
	test	r9d, r9d
	jle	.L158
	push	rbp
	lea	eax, -1[r9]
	mov	ecx, r9d
	xor	edi, edi
	shr	ecx, 2
	sal	rcx, 5
	mov	rbp, rsp
	push	r15
	xor	r15d, r15d
	push	r14
	lea	r14, a[rip]
	push	r13
	lea	r13, b[rip]
	mov	rdx, r13
	push	r12
	lea	r12, c[rip]
	push	rbx
	and	rsp, -32
	mov	DWORD PTR -4[rsp], eax
	.p2align 4,,10
	.p2align 3
.L134:
	movsxd	rsi, edi
	mov	DWORD PTR -8[rsp], edi
	lea	rax, c[rip]
	xor	r8d, r8d
	lea	rsi, [rsi+rsi*2]
	xor	r10d, r10d
	sal	rsi, 8
	mov	QWORD PTR -16[rsp], rsi
	.p2align 4,,10
	.p2align 3
.L142:
	cmp	DWORD PTR -4[rsp], 2
	vmovsd	xmm2, QWORD PTR [r14+r8*8]
	jbe	.L143
.L137:
	vbroadcastsd	ymm1, xmm2
	xor	esi, esi
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L140:
	vmovapd	ymm0, YMMWORD PTR [rdx+rsi]
	vfmadd213pd	ymm0, ymm1, YMMWORD PTR [rax+rsi]
	vmovapd	YMMWORD PTR [rax+rsi], ymm0
	add	rsi, 32
	cmp	rcx, rsi
	jne	.L140
	mov	esi, r9d
	and	esi, -4
	mov	edi, esi
	cmp	esi, r9d
	je	.L161
.L135:
	mov	r11d, r9d
	sub	r11d, edi
	cmp	r11d, 1
	je	.L138
	lea	rbx, [r8+rdi]
	vmovddup	xmm0, xmm2
	add	rdi, r15
	vmovapd	xmm3, XMMWORD PTR [r12+rbx*8]
	vfmadd132pd	xmm0, xmm3, XMMWORD PTR 0[r13+rdi*8]
	vmovapd	XMMWORD PTR [r12+rbx*8], xmm0
	test	r11b, 1
	je	.L139
	and	r11d, -2
	add	esi, r11d
.L138:
	movsxd	rdi, r10d
	movsxd	rsi, esi
	lea	rdi, [rdi+rdi*2]
	sal	rdi, 8
	add	rdi, rsi
	add	rsi, QWORD PTR -16[rsp]
	vmovsd	xmm4, QWORD PTR [r12+rdi*8]
	vfmadd132sd	xmm2, xmm4, QWORD PTR 0[r13+rsi*8]
	vmovsd	QWORD PTR [r12+rdi*8], xmm2
.L139:
	inc	r10d
	add	rax, 6144
	add	r8, 768
	cmp	r10d, r9d
	jne	.L142
.L154:
	mov	edi, DWORD PTR -8[rsp]
	add	rdx, 6144
	add	r14, 8
	add	r15, 768
	inc	edi
	cmp	edi, r9d
	jne	.L134
	vzeroupper
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.p2align 4,,10
	.p2align 3
.L161:
	inc	r10d
	cmp	r9d, r10d
	je	.L154
	add	r8, 768
	add	rax, 6144
	vmovsd	xmm2, QWORD PTR [r14+r8*8]
	jmp	.L137
	.p2align 4,,10
	.p2align 3
.L143:
	xor	edi, edi
	xor	esi, esi
	jmp	.L135
.L158:
	ret
	.size	mul_kij, .-mul_kij
	.p2align 4
	.type	mul_kji, @function
mul_kji:
	endbr64
	mov	r9d, DWORD PTR n[rip]
	test	r9d, r9d
	jle	.L188
	push	rbp
	lea	eax, -1[r9]
	mov	ecx, r9d
	xor	edi, edi
	shr	ecx, 2
	sal	rcx, 5
	mov	rbp, rsp
	push	r15
	xor	r15d, r15d
	push	r14
	lea	r14, a[rip]
	push	r13
	lea	r13, b[rip]
	mov	rdx, r13
	push	r12
	lea	r12, c[rip]
	push	rbx
	and	rsp, -32
	mov	DWORD PTR -4[rsp], eax
	.p2align 4,,10
	.p2align 3
.L164:
	movsxd	rsi, edi
	mov	DWORD PTR -8[rsp], edi
	lea	rax, c[rip]
	xor	r8d, r8d
	lea	rsi, [rsi+rsi*2]
	xor	r10d, r10d
	sal	rsi, 8
	mov	QWORD PTR -16[rsp], rsi
	.p2align 4,,10
	.p2align 3
.L172:
	cmp	DWORD PTR -4[rsp], 2
	vmovsd	xmm2, QWORD PTR [r14+r8*8]
	jbe	.L173
.L167:
	vbroadcastsd	ymm1, xmm2
	xor	esi, esi
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L170:
	vmovapd	ymm0, YMMWORD PTR [rdx+rsi]
	vfmadd213pd	ymm0, ymm1, YMMWORD PTR [rax+rsi]
	vmovapd	YMMWORD PTR [rax+rsi], ymm0
	add	rsi, 32
	cmp	rcx, rsi
	jne	.L170
	mov	esi, r9d
	and	esi, -4
	mov	edi, esi
	cmp	r9d, esi
	je	.L191
.L165:
	mov	r11d, r9d
	sub	r11d, edi
	cmp	r11d, 1
	je	.L168
	lea	rbx, [r8+rdi]
	vmovddup	xmm0, xmm2
	add	rdi, r15
	vmovapd	xmm3, XMMWORD PTR [r12+rbx*8]
	vfmadd132pd	xmm0, xmm3, XMMWORD PTR 0[r13+rdi*8]
	vmovapd	XMMWORD PTR [r12+rbx*8], xmm0
	test	r11b, 1
	je	.L169
	and	r11d, -2
	add	esi, r11d
.L168:
	movsxd	rdi, r10d
	movsxd	rsi, esi
	lea	rdi, [rdi+rdi*2]
	sal	rdi, 8
	add	rdi, rsi
	add	rsi, QWORD PTR -16[rsp]
	vmovsd	xmm4, QWORD PTR [r12+rdi*8]
	vfmadd132sd	xmm2, xmm4, QWORD PTR 0[r13+rsi*8]
	vmovsd	QWORD PTR [r12+rdi*8], xmm2
.L169:
	inc	r10d
	add	rax, 6144
	add	r8, 768
	cmp	r9d, r10d
	jne	.L172
.L184:
	mov	edi, DWORD PTR -8[rsp]
	add	rdx, 6144
	add	r14, 8
	add	r15, 768
	inc	edi
	cmp	edi, r9d
	jne	.L164
	vzeroupper
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.p2align 4,,10
	.p2align 3
.L191:
	inc	r10d
	cmp	r9d, r10d
	je	.L184
	add	r8, 768
	add	rax, 6144
	vmovsd	xmm2, QWORD PTR [r14+r8*8]
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L173:
	xor	edi, edi
	xor	esi, esi
	jmp	.L165
.L188:
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
	movabs	rax, 2199023255936
	mov	DWORD PTR 68[rsp], 256
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
	mov	QWORD PTR 8[rsp], rax
.L203:
	mov	DWORD PTR n[rip], ebx
	test	ebx, ebx
	jle	.L193
	movsxd	r14, ebx
	lea	r12, a[rip]
	lea	r13, b[rip]
	lea	rax, [r14+r14*2]
	sal	r14, 3
	sal	rax, 11
	add	rax, r12
	mov	QWORD PTR 16[rsp], rax
.L194:
	xor	ebp, ebp
	.p2align 4,,10
	.p2align 3
.L195:
	call	rand@PLT
	vxorpd	xmm3, xmm3, xmm3
	vcvtsi2sd	xmm0, xmm3, eax
	vdivsd	xmm0, xmm0, QWORD PTR .LC7[rip]
	vmovsd	QWORD PTR [r12+rbp], xmm0
	call	rand@PLT
	vxorpd	xmm3, xmm3, xmm3
	vcvtsi2sd	xmm0, xmm3, eax
	vdivsd	xmm0, xmm0, QWORD PTR .LC7[rip]
	vmovsd	QWORD PTR 0[r13+rbp], xmm0
	add	rbp, 8
	cmp	rbp, r14
	jne	.L195
	add	r12, 6144
	add	r13, 6144
	cmp	r12, QWORD PTR 16[rsp]
	jne	.L194
.L193:
	mov	r13, QWORD PTR 40[rsp]
.L196:
	mov	r12d, 1
.L201:
	test	ebx, ebx
	jle	.L199
	movsxd	rax, ebx
	mov	ebx, ebx
	lea	rcx, c[rip]
	lea	rbp, [rax+rax*2]
	sal	rbx, 3
	sal	rbp, 11
	add	rbp, r15
	.p2align 4,,10
	.p2align 3
.L197:
	mov	rdi, rcx
	mov	rdx, rbx
	xor	esi, esi
	call	memset@PLT
	lea	rcx, 6144[rax]
	cmp	rbp, rcx
	jne	.L197
.L199:
	mov	r14, QWORD PTR 8[rsp]
	mov	edi, 1
	mov	rsi, r14
	call	clock_gettime@PLT
	vxorpd	xmm4, xmm4, xmm4
	vcvtsi2sd	xmm0, xmm4, QWORD PTR 56[rsp]
	vmovapd	xmm1, xmm0
	vcvtsi2sd	xmm0, xmm4, QWORD PTR 48[rsp]
	vfmadd132sd	xmm1, xmm0, QWORD PTR .LC8[rip]
	vmovq	rbx, xmm1
	call	[QWORD PTR 8[r13]]
	mov	rsi, r14
	mov	edi, 1
	call	clock_gettime@PLT
	mov	edx, DWORD PTR n[rip]
	vxorpd	xmm4, xmm4, xmm4
	vmovq	xmm5, rbx
	vcvtsi2sd	xmm1, xmm4, QWORD PTR 48[rsp]
	vcvtsi2sd	xmm0, xmm4, QWORD PTR 56[rsp]
	vfmadd132sd	xmm0, xmm1, QWORD PTR .LC8[rip]
	mov	rcx, QWORD PTR 0[r13]
	mov	r8d, r12d
	vcvtsi2sd	xmm2, xmm4, edx
	vaddsd	xmm1, xmm2, xmm2
	lea	rsi, .LC10[rip]
	mov	edi, 2
	mov	eax, 3
	inc	r12d
	vmulsd	xmm1, xmm1, xmm2
	vsubsd	xmm0, xmm0, xmm5
	vmulsd	xmm1, xmm1, xmm2
	vmovsd	xmm2, QWORD PTR 43064[r15]
	vdivsd	xmm1, xmm1, xmm0
	vdivsd	xmm1, xmm1, QWORD PTR .LC9[rip]
	call	__printf_chk@PLT
	cmp	r12d, 6
	je	.L198
	mov	ebx, DWORD PTR n[rip]
	jmp	.L201
.L198:
	add	r13, 16
	cmp	QWORD PTR 32[rsp], r13
	je	.L200
	mov	ebx, DWORD PTR n[rip]
	jmp	.L196
.L200:
	add	QWORD PTR 24[rsp], 4
	mov	rax, QWORD PTR 24[rsp]
	cmp	rax, QWORD PTR 40[rsp]
	je	.L202
	mov	ebx, DWORD PTR [rax]
	jmp	.L203
.L202:
	mov	rax, QWORD PTR 184[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L208
	add	rsp, 200
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L208:
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
