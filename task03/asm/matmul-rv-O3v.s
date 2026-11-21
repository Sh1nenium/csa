	.file	"matmul.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.type	mul_ijk, @function
mul_ijk:
.LFB30:
	.cfi_startproc
	lw	t0,.LANCHOR0
	ble	t0,zero,.L8
	slli	t5,t0,1
	add	t5,t5,t0
	slli	t5,t5,11
	lla	t4,a
	li	a1,8192
	add	t2,t4,t5
	addi	a1,a1,-2048
	lla	t6,c
.L3:
	mv	t3,t6
	mv	a7,t0
	mv	a6,t6
	lla	a0,b
.L6:
	vsetvli	a4,a7,e64,m1,ta,ma
	vle64.v	v1,0(t3)
	slli	t1,a4,3
	add	a2,a0,t5
	mv	a3,t4
	mv	a5,a0
.L4:
	vle64.v	v3,0(a5)
	fld	fa5,0(a3)
	add	a5,a5,a1
	addi	a3,a3,8
	vfmv.v.f	v2,fa5
	vfmacc.vv	v1,v3,v2
	bne	a5,a2,.L4
	vse64.v	v1,0(a6)
	sub	a7,a7,a4
	add	a0,a0,t1
	add	t3,t3,t1
	add	a6,a6,t1
	bne	a7,zero,.L6
	add	t4,t4,a1
	add	t6,t6,a1
	bne	t4,t2,.L3
.L8:
	ret
	.cfi_endproc
.LFE30:
	.size	mul_ijk, .-mul_ijk
	.align	1
	.type	mul_ikj, @function
mul_ikj:
.LFB31:
	.cfi_startproc
	lw	t3,.LANCHOR0
	ble	t3,zero,.L27
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	addiw	t5,t3,-3
	sd	s1,48(sp)
	sd	s2,40(sp)
	andi	t5,t5,-2
	.cfi_offset 9, -16
	.cfi_offset 18, -24
	lla	s2,c
	lla	s1,a
	li	t4,8192
	sd	s0,56(sp)
	sd	s3,32(sp)
	sd	s4,24(sp)
	sd	s5,16(sp)
	sd	s6,8(sp)
	sd	s7,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 19, -32
	.cfi_offset 20, -40
	.cfi_offset 21, -48
	.cfi_offset 22, -56
	.cfi_offset 23, -64
	addiw	t5,t5,2
	mv	t1,s2
	mv	t2,s1
	addi	t4,t4,-2048
	li	t0,0
	lla	s0,b
	li	s3,2
	li	t6,12288
.L12:
	li	s7,0
	ble	t3,s3,.L19
	lla	s5,b
	mv	s7,t5
	mv	s4,t2
	li	s6,0
.L14:
	fld	fa5,0(s4)
	vsetvli	a5,zero,e64,m1,ta,ma
	mv	a7,t1
	vfmv.v.f	v4,fa5
	fld	fa5,8(s4)
	mv	a6,s5
	add	a0,s5,t4
	vfmv.v.f	v3,fa5
	mv	a1,t3
	mv	a2,t1
	mv	a3,t1
.L13:
	vsetvli	a5,a1,e64,m1,ta,ma
	vle64.v	v2,0(a6)
	vle64.v	v1,0(a7)
	slli	a4,a5,3
	sub	a1,a1,a5
	add	a7,a7,a4
	add	a6,a6,a4
	vfmacc.vv	v1,v4,v2
	vse64.v	v1,0(a3)
	add	a3,a3,a4
	vle64.v	v2,0(a0)
	add	a0,a0,a4
	vfmacc.vv	v1,v3,v2
	vse64.v	v1,0(a2)
	add	a2,a2,a4
	bne	a1,zero,.L13
	addiw	s6,s6,2
	addi	s4,s4,16
	add	s5,s5,t6
	bne	s6,t5,.L14
.L19:
	slli	a7,t0,1
	add	a7,a7,t0
	slli	a7,a7,11
	add	s4,s1,a7
	mv	a6,s7
	add	a7,s2,a7
.L16:
	slli	a5,a6,3
	add	a5,s4,a5
	fld	fa5,0(a5)
	vsetvli	a4,zero,e64,m1,ta,ma
	slli	a2,a6,1
	add	a2,a2,a6
	vfmv.v.f	v3,fa5
	slli	a2,a2,11
	add	a2,a2,s0
	mv	a3,t3
	mv	a4,a7
	mv	a0,a7
.L15:
	vsetvli	a5,a3,e64,m1,ta,ma
	vle64.v	v1,0(a0)
	vle64.v	v2,0(a2)
	slli	a1,a5,3
	sub	a3,a3,a5
	add	a0,a0,a1
	add	a2,a2,a1
	vfmacc.vv	v1,v3,v2
	vse64.v	v1,0(a4)
	add	a4,a4,a1
	bne	a3,zero,.L15
	addi	a6,a6,1
	sext.w	a5,a6
	bgt	t3,a5,.L16
	addi	t0,t0,1
	add	t1,t1,t4
	add	t2,t2,t4
	bne	t3,t0,.L12
	ld	s0,56(sp)
	.cfi_restore 8
	ld	s1,48(sp)
	.cfi_restore 9
	ld	s2,40(sp)
	.cfi_restore 18
	ld	s3,32(sp)
	.cfi_restore 19
	ld	s4,24(sp)
	.cfi_restore 20
	ld	s5,16(sp)
	.cfi_restore 21
	ld	s6,8(sp)
	.cfi_restore 22
	ld	s7,0(sp)
	.cfi_restore 23
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
.L27:
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
	ble	a5,zero,.L37
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
.L32:
	lla	a0,a
	mv	a1,t1
.L35:
	fld	fa5,0(a1)
	mv	a5,a6
	mv	a4,a0
.L33:
	fld	fa3,0(a4)
	fld	fa4,0(a5)
	add	a5,a5,a3
	addi	a4,a4,8
	fmadd.d	fa5,fa3,fa4,fa5
	bne	a5,a2,.L33
	fsd	fa5,0(a1)
	add	a0,a0,a3
	add	a1,a1,a3
	bne	a0,a7,.L35
	addi	t1,t1,8
	addi	a6,a6,8
	addi	a2,a2,8
	bne	t1,t3,.L32
.L37:
	ret
	.cfi_endproc
.LFE32:
	.size	mul_jik, .-mul_jik
	.align	1
	.type	mul_jki, @function
mul_jki:
.LFB33:
	.cfi_startproc
	lw	t5,.LANCHOR0
	ble	t5,zero,.L55
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	s0,56(sp)
	.cfi_offset 8, -8
	slli	s0,t5,1
	add	s0,s0,t5
	addiw	t1,t5,-3
	sd	s1,48(sp)
	sd	s2,40(sp)
	slli	s0,s0,11
	lla	t2,a
	andi	t1,t1,-2
	.cfi_offset 9, -16
	.cfi_offset 18, -24
	lla	s2,c
	lla	s1,b
	li	a2,8192
	sd	s3,32(sp)
	sd	s4,24(sp)
	sd	s5,16(sp)
	sd	s6,8(sp)
	.cfi_offset 19, -32
	.cfi_offset 20, -40
	.cfi_offset 21, -48
	.cfi_offset 22, -56
	add	s0,s0,t2
	addiw	t1,t1,2
	mv	a7,s2
	mv	t0,s1
	addi	a2,a2,-2048
	li	t6,0
	li	s3,2
	lla	t4,a-8
	li	t3,12288
.L40:
	li	s6,0
	ble	t5,s3,.L47
	mv	s6,t1
	mv	a6,s0
	mv	s4,t0
	li	a1,8
	li	a0,0
	li	s5,0
.L42:
	fld	fa3,0(s4)
	add	a5,s4,a2
	fld	fa2,0(a5)
	mv	a4,a7
	add	a5,t4,a1
.L41:
	fld	fa5,0(a4)
	fld	fa4,0(a5)
	add	a3,a5,a0
	add	a3,a3,a1
	fmadd.d	fa4,fa4,fa3,fa5
	fld	fa5,0(a3)
	add	a5,a5,a2
	fmadd.d	fa5,fa5,fa2,fa4
	fsd	fa5,0(a4)
	add	a4,a4,a2
	bne	a5,a6,.L41
	addiw	s5,s5,2
	add	s4,s4,t3
	addi	a0,a0,-16
	addi	a1,a1,16
	addi	a6,a6,16
	bne	s5,t1,.L42
.L47:
	slli	s5,t6,3
	mv	s4,s6
	add	s6,s1,s5
	add	s5,s2,s5
.L44:
	slli	a5,s4,1
	add	a5,a5,s4
	slli	a5,a5,11
	add	a5,s6,a5
	fld	fa5,0(a5)
	vsetvli	a4,zero,e64,m1,ta,ma
	slli	a1,s4,3
	vfmv.v.f	v3,fa5
	add	a1,a1,t2
	mv	a3,t5
	mv	a6,s5
	mv	a0,s5
.L43:
	vsetvli	a4,a3,e64,m1,ta,ma
	vlse64.v	v2,0(a0),a2
	vlse64.v	v1,0(a1),a2
	slli	a5,a4,1
	add	a5,a5,a4
	slli	a5,a5,11
	sub	a3,a3,a4
	add	a0,a0,a5
	vfmadd.vv	v1,v3,v2
	add	a1,a1,a5
	vsse64.v	v1,0(a6),a2
	add	a6,a6,a5
	bne	a3,zero,.L43
	addi	s4,s4,1
	sext.w	a5,s4
	bgt	t5,a5,.L44
	addi	t6,t6,1
	addi	a7,a7,8
	addi	t0,t0,8
	bne	t6,t5,.L40
	ld	s0,56(sp)
	.cfi_restore 8
	ld	s1,48(sp)
	.cfi_restore 9
	ld	s2,40(sp)
	.cfi_restore 18
	ld	s3,32(sp)
	.cfi_restore 19
	ld	s4,24(sp)
	.cfi_restore 20
	ld	s5,16(sp)
	.cfi_restore 21
	ld	s6,8(sp)
	.cfi_restore 22
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
.L55:
	ret
	.cfi_endproc
.LFE33:
	.size	mul_jki, .-mul_jki
	.align	1
	.type	mul_kij, @function
mul_kij:
.LFB34:
	.cfi_startproc
	lw	t4,.LANCHOR0
	ble	t4,zero,.L65
	slli	a5,t4,1
	add	a5,a5,t4
	slli	a5,a5,11
	lla	t3,b
	lla	t5,c
	li	t1,8192
	add	t0,t3,a5
	add	t5,t5,a5
	addi	t1,t1,-2048
	lla	t6,a
.L60:
	lla	a6,c
	mv	a7,t6
.L63:
	fld	fa5,0(a7)
	vsetvli	a5,zero,e64,m1,ta,ma
	mv	a0,a6
	vfmv.v.f	v3,fa5
	mv	a1,t3
	mv	a3,t4
	mv	a4,a6
.L61:
	vsetvli	a5,a3,e64,m1,ta,ma
	vle64.v	v2,0(a0)
	vle64.v	v1,0(a1)
	slli	a2,a5,3
	sub	a3,a3,a5
	add	a0,a0,a2
	add	a1,a1,a2
	vfmadd.vv	v1,v3,v2
	vse64.v	v1,0(a4)
	add	a4,a4,a2
	bne	a3,zero,.L61
	add	a6,a6,t1
	add	a7,a7,t1
	bne	t5,a6,.L63
	add	t3,t3,t1
	addi	t6,t6,8
	bne	t3,t0,.L60
.L65:
	ret
	.cfi_endproc
.LFE34:
	.size	mul_kij, .-mul_kij
	.align	1
	.type	mul_kji, @function
mul_kji:
.LFB35:
	.cfi_startproc
	lw	t5,.LANCHOR0
	ble	t5,zero,.L73
	addiw	a5,t5,-1
	slli	a5,a5,32
	srli	a5,a5,32
	slli	t4,a5,1
	slli	t0,t5,1
	add	t4,t4,a5
	add	t0,t0,t5
	slli	t4,t4,11
	lla	a5,c+6144
	slli	t0,t0,11
	lla	t3,b
	li	t1,8192
	add	t4,t4,a5
	add	t0,t0,t3
	addi	t1,t1,-2048
	lla	t6,a
.L68:
	lla	a6,c
	mv	a7,t6
.L71:
	fld	fa5,0(a7)
	vsetvli	a5,zero,e64,m1,ta,ma
	mv	a0,a6
	vfmv.v.f	v3,fa5
	mv	a1,t3
	mv	a3,t5
	mv	a4,a6
.L69:
	vsetvli	a5,a3,e64,m1,ta,ma
	vle64.v	v2,0(a1)
	vle64.v	v1,0(a0)
	slli	a2,a5,3
	sub	a3,a3,a5
	add	a0,a0,a2
	add	a1,a1,a2
	vfmacc.vv	v1,v3,v2
	vse64.v	v1,0(a4)
	add	a4,a4,a2
	bne	a3,zero,.L69
	add	a6,a6,t1
	add	a7,a7,t1
	bne	a6,t4,.L71
	add	t3,t3,t1
	addi	t6,t6,8
	bne	t3,t0,.L68
.L73:
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
	vsetivli	zero,2,e32,mf2,ta,ma
	vid.v	v1
	li	a4,256
	vsll.vi	v1,v1,7
	addi	sp,sp,-304
	.cfi_def_cfa_offset 304
	sd	s9,216(sp)
	vadd.vx	v1,v1,a4
	li	a4,512
	addi	a5,sp,44
	sd	ra,296(sp)
	sd	s0,288(sp)
	sd	s1,280(sp)
	sd	s2,272(sp)
	sd	s3,264(sp)
	sd	s4,256(sp)
	sd	s6,240(sp)
	sd	s7,232(sp)
	sd	s8,224(sp)
	sd	s10,208(sp)
	sd	s11,200(sp)
	fsd	fs0,184(sp)
	fsd	fs1,176(sp)
	fsd	fs2,168(sp)
	fsd	fs3,160(sp)
	sw	a4,52(sp)
	.cfi_offset 25, -88
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 26, -96
	.cfi_offset 27, -104
	.cfi_offset 40, -120
	.cfi_offset 41, -128
	.cfi_offset 50, -136
	.cfi_offset 51, -144
	addi	s9,sp,56
	la	a4,__stack_chk_guard
	vse32.v	v1,0(a5)
	mv	a3,s9
	ld	a5, 0(a4)
	sd	a5, 152(sp)
	li	a5, 0
	lla	a2,.LANCHOR1
	li	a4,96
.L75:
	vsetvli	a5,a4,e8,m1,ta,ma
	vle8.v	v1,0(a2)
	sub	a4,a4,a5
	add	a2,a2,a5
	vse8.v	v1,0(a3)
	add	a3,a3,a5
	bne	a4,zero,.L75
	lla	a0,.LC9
	call	puts@plt
	fld	fs1,.LC11,a5
	fld	fs2,.LC12,a5
	fld	fs0,.LC10,a5
	li	s2,8192
	addi	a5,sp,152
	addi	s8,sp,40
	sd	a5,8(sp)
	addi	s2,s2,-2048
	li	s1,128
	lla	s6,c+45056
.L86:
	sw	s1,.LANCHOR0,a5
	ble	s1,zero,.L76
	slli	s4,s1,1
	add	s4,s4,s1
	slli	s4,s4,11
	lla	s3,b
	slli	s7,s1,3
	lla	a5,a
	add	s4,s4,s3
	add	s0,s7,a5
.L77:
	sub	s11,s0,s7
	mv	s10,s3
.L78:
	call	rand@plt
	fcvt.d.w	fa5,a0
	addi	s11,s11,8
	addi	s10,s10,8
	fdiv.d	fa5,fa5,fs0
	fsd	fa5,-8(s11)
	call	rand@plt
	fcvt.d.w	fa5,a0
	fdiv.d	fa5,fa5,fs0
	fsd	fa5,-8(s10)
	bne	s11,s0,.L78
	add	s3,s3,s2
	add	s0,s0,s2
	bne	s3,s4,.L77
.L76:
	mv	s4,s9
	li	s7,6
	li	s3,1
.L84:
	ble	s1,zero,.L82
	slli	s0,s1,1
	add	s0,s0,s1
	slli	s0,s0,11
	lla	a5,c
	slli	a4,s1,32
	srli	s1,a4,29
	add	s0,s0,a5
.L80:
	mv	a0,a5
	mv	a2,s1
	li	a1,0
	call	memset@plt
	add	a5,a0,s2
	bne	a5,s0,.L80
.L82:
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
	beq	s3,s7,.L81
	lw	s1,.LANCHOR0
	j	.L84
.L81:
	ld	a5,8(sp)
	addi	s4,s4,16
	beq	s4,a5,.L83
	lw	s1,.LANCHOR0
	li	s3,1
	j	.L84
.L83:
	addi	s8,s8,4
	beq	s8,s9,.L85
	lw	s1,0(s8)
	j	.L86
.L85:
	la	a5,__stack_chk_guard
	ld	a4, 152(sp)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L93
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
.L93:
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
