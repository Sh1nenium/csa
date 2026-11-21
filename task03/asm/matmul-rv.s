	.file	"matmul.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.type	mul_ijk, @function
mul_ijk:
.LFB30:
	.cfi_startproc
	lw	a5,.LANCHOR0
	ble	a5,zero,.L1
	slli	t3,a5,1
	add	t3,t3,a5
	slli	t3,t3,11
	lla	a4,b
	slli	a5,a5,3
	lla	a6,a
	li	a2,8192
	add	t4,a6,t3
	add	a7,a5,a4
	add	t3,a4,t3
	addi	a2,a2,-2048
	lla	t1,c
.L3:
	mv	a3,t3
	lla	a0,b
	mv	a1,t1
.L6:
	fld	fa5,0(a1)
	mv	a5,a0
	mv	a4,a6
.L4:
	fld	fa3,0(a4)
	fld	fa4,0(a5)
	add	a5,a5,a2
	addi	a4,a4,8
	fmadd.d	fa5,fa3,fa4,fa5
	bne	a5,a3,.L4
	fsd	fa5,0(a1)
	addi	a0,a0,8
	addi	a1,a1,8
	addi	a3,a5,8
	bne	a0,a7,.L6
	add	a6,a6,a2
	add	t1,t1,a2
	bne	a6,t4,.L3
.L1:
	ret
	.cfi_endproc
.LFE30:
	.size	mul_ijk, .-mul_ijk
	.align	1
	.type	mul_ikj, @function
mul_ikj:
.LFB31:
	.cfi_startproc
	lw	a5,.LANCHOR0
	ble	a5,zero,.L9
	slli	a4,a5,1
	add	a4,a4,a5
	slli	a4,a4,11
	slli	a5,a5,3
	lla	t1,a
	lla	a7,b
	lla	a6,c
	li	a0,8192
	add	t3,t1,a4
	add	a7,a7,a4
	add	a3,a5,a6
	addi	a0,a0,-2048
.L11:
	lla	a2,b
	mv	a1,t1
.L14:
	fld	fa3,0(a1)
	mv	a4,a2
	mv	a5,a6
.L12:
	fld	fa4,0(a5)
	fld	fa5,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fmadd.d	fa5,fa3,fa5,fa4
	fsd	fa5,-8(a5)
	bne	a5,a3,.L12
	add	a2,a2,a0
	addi	a1,a1,8
	bne	a2,a7,.L14
	add	t1,t1,a0
	add	a6,a6,a0
	add	a3,a3,a0
	bne	t1,t3,.L11
.L9:
	ret
	.cfi_endproc
.LFE31:
	.size	mul_ikj, .-mul_ikj
	.align	1
	.type	mul_jik, @function
mul_jik:
.LFB32:
	.cfi_startproc
	lw	a5,.LANCHOR0
	ble	a5,zero,.L16
	slli	a4,a5,1
	add	a4,a4,a5
	slli	a4,a4,11
	slli	a5,a5,3
	lla	a6,b
	lla	a7,a
	lla	t1,c
	li	a3,8192
	add	a2,a6,a4
	add	a7,a7,a4
	add	t3,a5,t1
	addi	a3,a3,-2048
.L18:
	lla	a0,a
	mv	a1,t1
.L21:
	fld	fa5,0(a1)
	mv	a5,a6
	mv	a4,a0
.L19:
	fld	fa3,0(a4)
	fld	fa4,0(a5)
	add	a5,a5,a3
	addi	a4,a4,8
	fmadd.d	fa5,fa3,fa4,fa5
	bne	a5,a2,.L19
	fsd	fa5,0(a1)
	add	a0,a0,a3
	add	a1,a1,a3
	bne	a0,a7,.L21
	addi	t1,t1,8
	addi	a6,a6,8
	addi	a2,a2,8
	bne	t1,t3,.L18
.L16:
	ret
	.cfi_endproc
.LFE32:
	.size	mul_jik, .-mul_jik
	.align	1
	.type	mul_jki, @function
mul_jki:
.LFB33:
	.cfi_startproc
	lw	a5,.LANCHOR0
	ble	a5,zero,.L23
	slli	a2,a5,1
	add	a2,a2,a5
	slli	a2,a2,11
	slli	a5,a5,3
	lla	a6,c
	lla	t1,b
	lla	a7,a
	li	a3,8192
	add	a2,a2,a6
	add	t3,t1,a5
	add	a7,a7,a5
	addi	a3,a3,-2048
.L25:
	lla	a1,a
	mv	a0,t1
.L28:
	fld	fa3,0(a0)
	mv	a4,a1
	mv	a5,a6
.L26:
	fld	fa4,0(a5)
	fld	fa5,0(a4)
	add	a4,a4,a3
	fmadd.d	fa5,fa5,fa3,fa4
	fsd	fa5,0(a5)
	add	a5,a5,a3
	bne	a5,a2,.L26
	addi	a1,a1,8
	add	a0,a0,a3
	bne	a1,a7,.L28
	addi	t1,t1,8
	addi	a6,a6,8
	addi	a2,a2,8
	bne	t1,t3,.L25
.L23:
	ret
	.cfi_endproc
.LFE33:
	.size	mul_jki, .-mul_jki
	.align	1
	.type	mul_kij, @function
mul_kij:
.LFB34:
	.cfi_startproc
	lw	a5,.LANCHOR0
	ble	a5,zero,.L30
	slli	a7,a5,1
	add	a7,a7,a5
	slli	a7,a7,11
	lla	a4,c
	slli	a5,a5,3
	lla	a6,b
	li	a1,8192
	add	t4,a6,a7
	add	t3,a5,a4
	add	a7,a4,a7
	addi	a1,a1,-2048
	lla	t1,a
.L32:
	mv	a3,t3
	lla	a2,c
	mv	a0,t1
.L35:
	fld	fa3,0(a0)
	mv	a4,a6
	mv	a5,a2
.L33:
	fld	fa4,0(a5)
	fld	fa5,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fmadd.d	fa5,fa3,fa5,fa4
	fsd	fa5,-8(a5)
	bne	a5,a3,.L33
	add	a2,a2,a1
	add	a0,a0,a1
	add	a3,a5,a1
	bne	a2,a7,.L35
	add	a6,a6,a1
	addi	t1,t1,8
	bne	a6,t4,.L32
.L30:
	ret
	.cfi_endproc
.LFE34:
	.size	mul_kij, .-mul_kij
	.align	1
	.type	mul_kji, @function
mul_kji:
.LFB35:
	.cfi_startproc
	lw	a5,.LANCHOR0
	ble	a5,zero,.L37
	slli	t4,a5,1
	add	t4,t4,a5
	lla	a7,c
	slli	a5,a5,3
	slli	t4,t4,11
	lla	a6,a
	li	a3,8192
	add	t4,t4,a7
	add	t3,a6,a5
	add	a7,a7,a5
	addi	a3,a3,-2048
	lla	t1,b
.L39:
	mv	a2,t4
	lla	a1,c
	mv	a0,t1
.L42:
	fld	fa3,0(a0)
	mv	a4,a6
	mv	a5,a1
.L40:
	fld	fa4,0(a5)
	fld	fa5,0(a4)
	add	a4,a4,a3
	fmadd.d	fa5,fa5,fa3,fa4
	fsd	fa5,0(a5)
	add	a5,a5,a3
	bne	a5,a2,.L40
	addi	a1,a1,8
	addi	a0,a0,8
	addi	a2,a5,8
	bne	a1,a7,.L42
	addi	a6,a6,8
	add	t1,t1,a3
	bne	a6,t3,.L39
.L37:
	ret
	.cfi_endproc
.LFE35:
	.size	mul_kji, .-mul_kji
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC9:
	.string	"n,method,run,seconds,gflops,control"
	.align	3
.LC13:
	.string	"%d,%s,%d,%.6f,%.3f,%.9f\n"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB36:
	.cfi_startproc
	lla	a5,.LANCHOR1
	ld	a1,0(a5)
	ld	a2,8(a5)
	ld	a3,16(a5)
	addi	sp,sp,-304
	.cfi_def_cfa_offset 304
	sd	a1,56(sp)
	sd	a2,64(sp)
	ld	a1,24(a5)
	ld	a2,32(a5)
	sd	a3,72(sp)
	ld	a3,40(a5)
	sd	a1,80(sp)
	sd	a2,88(sp)
	ld	a1,48(a5)
	ld	a2,56(a5)
	sd	a3,96(sp)
	ld	a3,64(a5)
	sd	ra,296(sp)
	sd	s1,280(sp)
	sd	s2,272(sp)
	sd	s6,240(sp)
	sd	s8,224(sp)
	sd	s11,200(sp)
	fsd	fs0,184(sp)
	fsd	fs1,176(sp)
	fsd	fs2,168(sp)
	sd	s0,288(sp)
	sd	s3,264(sp)
	sd	s4,256(sp)
	sd	s7,232(sp)
	sd	s9,216(sp)
	sd	s10,208(sp)
	fsd	fs3,160(sp)
	sd	a1,104(sp)
	sd	a2,112(sp)
	sd	a3,120(sp)
	ld	a2,72(a5)
	ld	a3,80(a5)
	ld	a5,88(a5)
	li	a4,1
	lla	a0,.LC9
	sd	a5,144(sp)
	slli	a5,a4,41
	addi	a5,a5,384
	sd	a5,48(sp)
	la	a4,__stack_chk_guard
	li	a5,256
	sw	a5,44(sp)
	ld	a5, 0(a4)
	sd	a5, 152(sp)
	li	a5, 0
	sd	a2,128(sp)
	sd	a3,136(sp)
	.cfi_offset 1, -8
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 22, -64
	.cfi_offset 24, -80
	.cfi_offset 27, -104
	.cfi_offset 40, -120
	.cfi_offset 41, -128
	.cfi_offset 50, -136
	.cfi_offset 8, -16
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 23, -72
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 51, -144
	call	puts@plt
	fld	fs1,.LC11,a5
	fld	fs2,.LC12,a5
	fld	fs0,.LC10,a5
	li	s2,8192
	addi	a5,sp,152
	addi	s8,sp,40
	addi	s11,sp,56
	sd	a5,8(sp)
	addi	s2,s2,-2048
	li	s1,128
	lla	s6,c+45056
.L55:
	sw	s1,.LANCHOR0,a5
	ble	s1,zero,.L45
	slli	s4,s1,1
	add	s4,s4,s1
	slli	s4,s4,11
	lla	s3,b
	slli	s7,s1,3
	lla	a5,a
	add	s4,s4,s3
	add	s0,s7,a5
.L46:
	sub	s10,s0,s7
	mv	s9,s3
.L47:
	call	rand@plt
	fcvt.d.w	fa5,a0
	addi	s10,s10,8
	addi	s9,s9,8
	fdiv.d	fa5,fa5,fs0
	fsd	fa5,-8(s10)
	call	rand@plt
	fcvt.d.w	fa5,a0
	fdiv.d	fa5,fa5,fs0
	fsd	fa5,-8(s9)
	bne	s10,s0,.L47
	add	s3,s3,s2
	add	s0,s0,s2
	bne	s3,s4,.L46
.L45:
	mv	s4,s11
	li	s7,6
	li	s3,1
.L53:
	ble	s1,zero,.L51
	slli	s0,s1,1
	add	s0,s0,s1
	slli	s0,s0,11
	lla	a5,c
	slli	a4,s1,32
	srli	s1,a4,29
	add	s0,s0,a5
.L49:
	mv	a0,a5
	mv	a2,s1
	li	a1,0
	call	memset@plt
	add	a5,a0,s2
	bne	s0,a5,.L49
.L51:
	addi	a1,sp,24
	li	a0,1
	call	clock_gettime@plt
	ld	a3,32(sp)
	ld	a4,24(sp)
	ld	a5,8(s4)
	fcvt.d.l	fs3,a3
	fcvt.d.l	fa5,a4
	fmadd.d	fs3,fs3,fs1,fa5
	jalr	a5
	addi	a1,sp,24
	li	a0,1
	call	clock_gettime@plt
	lw	a2,.LANCHOR0
	ld	a4,32(sp)
	ld	a5,24(sp)
	fcvt.d.w	fa3,a2
	fcvt.d.l	fa4,a4
	fcvt.d.l	fa2,a5
	fadd.d	fa5,fa3,fa3
	ld	a7,-1992(s6)
	fmadd.d	fa4,fa4,fs1,fa2
	ld	a3,0(s4)
	mv	a4,s3
	lla	a1,.LC13
	li	a0,2
	fmul.d	fa5,fa5,fa3
	addiw	s3,s3,1
	fsub.d	fa4,fa4,fs3
	fmul.d	fa5,fa5,fa3
	fmv.x.d	a5,fa4
	fdiv.d	fa5,fa5,fa4
	fdiv.d	fa5,fa5,fs2
	fmv.x.d	a6,fa5
	call	__printf_chk@plt
	beq	s3,s7,.L50
	lw	s1,.LANCHOR0
	j	.L53
.L50:
	ld	a5,8(sp)
	addi	s4,s4,16
	beq	a5,s4,.L52
	lw	s1,.LANCHOR0
	li	s3,1
	j	.L53
.L52:
	addi	s8,s8,4
	beq	s8,s11,.L54
	lw	s1,0(s8)
	j	.L55
.L54:
	la	a5,__stack_chk_guard
	ld	a4, 152(sp)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L60
	ld	ra,296(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,288(sp)
	.cfi_restore 8
	ld	s1,280(sp)
	.cfi_restore 9
	ld	s2,272(sp)
	.cfi_restore 18
	ld	s3,264(sp)
	.cfi_restore 19
	ld	s4,256(sp)
	.cfi_restore 20
	ld	s6,240(sp)
	.cfi_restore 22
	ld	s7,232(sp)
	.cfi_restore 23
	ld	s8,224(sp)
	.cfi_restore 24
	ld	s9,216(sp)
	.cfi_restore 25
	ld	s10,208(sp)
	.cfi_restore 26
	ld	s11,200(sp)
	.cfi_restore 27
	fld	fs0,184(sp)
	.cfi_restore 40
	fld	fs1,176(sp)
	.cfi_restore 41
	fld	fs2,168(sp)
	.cfi_restore 50
	fld	fs3,160(sp)
	.cfi_restore 51
	li	a0,0
	addi	sp,sp,304
	.cfi_def_cfa_offset 0
	jr	ra
.L60:
	.cfi_restore_state
	sd	s5,248(sp)
	.cfi_offset 21, -56
	call	__stack_chk_fail@plt
	.cfi_endproc
.LFE36:
	.size	main, .-main
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"ijk"
	.align	3
.LC2:
	.string	"ikj"
	.align	3
.LC3:
	.string	"jik"
	.align	3
.LC4:
	.string	"jki"
	.align	3
.LC5:
	.string	"kij"
	.align	3
.LC6:
	.string	"kji"
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC10:
	.word	-4194304
	.word	1105199103
	.align	3
.LC11:
	.word	-400107883
	.word	1041313291
	.align	3
.LC12:
	.word	0
	.word	1104006501
	.data
	.align	3
	.set	.LANCHOR1,. + 0
.LC8:
	.dword	.LC1
	.dword	mul_ijk
	.dword	.LC2
	.dword	mul_ikj
	.dword	.LC3
	.dword	mul_jik
	.dword	.LC4
	.dword	mul_jki
	.dword	.LC5
	.dword	mul_kij
	.dword	.LC6
	.dword	mul_kji
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.zero	4
	.type	c, @object
	.size	c, 4718592
c:
	.zero	4718592
	.type	b, @object
	.size	b, 4718592
b:
	.zero	4718592
	.type	a, @object
	.size	a, 4718592
a:
	.zero	4718592
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
