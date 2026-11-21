	.file	"strassen.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.type	naive, @function
naive:
.LFB40:
	.cfi_startproc
	lw	a5,.LANCHOR0
	ble	a5,zero,.L1
	slli	t3,a5,13
	lla	a6,a
	slli	a5,a5,3
	lla	a7,b
	mv	t1,a0
	add	t3,a0,t3
	add	a2,a6,a5
	add	a7,a7,a5
	li	a3,8192
.L3:
	lla	a1,b
	mv	a0,t1
.L6:
	fmv.d.x	fa5,zero
	mv	a4,a1
	mv	a5,a6
.L4:
	fld	fa3,0(a5)
	fld	fa4,0(a4)
	addi	a5,a5,8
	add	a4,a4,a3
	fmadd.d	fa5,fa3,fa4,fa5
	bne	a5,a2,.L4
	fsd	fa5,0(a0)
	addi	a1,a1,8
	addi	a0,a0,8
	bne	a1,a7,.L6
	add	t1,t1,a3
	add	a6,a6,a3
	add	a2,a2,a3
	bne	t1,t3,.L3
.L1:
	ret
	.cfi_endproc
.LFE40:
	.size	naive, .-naive
	.align	1
	.type	rec, @function
rec:
.LFB43:
	.cfi_startproc
	addi	sp,sp,-336
	.cfi_def_cfa_offset 336
	sd	s0,320(sp)
	.cfi_offset 8, -16
	la	s0,__stack_chk_guard
	sd	s7,264(sp)
	.cfi_offset 23, -72
	mv	s7,a0
	ld	a0, 0(s0)
	sd	a0, 216(sp)
	li	a0, 0
	sd	s5,280(sp)
	sd	ra,328(sp)
	li	a0,64
	sd	a2,24(sp)
	sd	a4,32(sp)
	sd	a5,80(sp)
	sd	a6,64(sp)
	.cfi_offset 21, -56
	.cfi_offset 1, -8
	mv	s5,a1
	mv	a7,a3
	ble	s7,a0,.L71
	sd	s6,272(sp)
	.cfi_offset 22, -64
	sraiw	s6,s7,1
	slli	s0,s6,3
	add	a4,a1,s0
	sd	a4,56(sp)
	add	a4,a3,s0
	mul	a5,s6,s6
	sd	a4,72(sp)
	ld	a4,24(sp)
	sd	s2,304(sp)
	sd	s10,240(sp)
	sd	s1,312(sp)
	sd	a7,96(sp)
	sd	s3,296(sp)
	sd	s4,288(sp)
	sd	s8,256(sp)
	mulw	a4,s6,a4
	.cfi_offset 18, -32
	.cfi_offset 26, -96
	.cfi_offset 9, -24
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 24, -80
	slli	s2,a5,3
	add	a5,s2,a5
	slli	a0,a5,3
	ld	a5,32(sp)
	sd	s9,248(sp)
	sd	s11,232(sp)
	add	s10,s6,a4
	slli	a4,a4,3
	add	s1,a1,a4
	ld	a4,64(sp)
	mulw	a5,s6,a5
	slli	s10,s10,3
	add	a3,a1,s10
	sd	a3,40(sp)
	mulw	a3,s6,a4
	add	a4,s6,a5
	slli	a5,a5,3
	add	a5,a7,a5
	slli	a4,a4,3
	add	a4,a7,a4
	sd	a5,112(sp)
	sd	a4,48(sp)
	add	a5,s6,a3
	sd	a3,120(sp)
	sd	a5,88(sp)
	.cfi_offset 25, -88
	.cfi_offset 27, -104
	call	malloc@plt
	mulw	a2,s6,s6
	ld	a7,96(sp)
	sd	a0,128(sp)
	addi	a5,sp,160
	addi	a3,sp,216
	mv	a4,a0
	slliw	s7,a2,3
	subw	s7,s7,a2
	slli	s7,s7,3
	add	a2,a0,s7
	sd	a2,8(sp)
	add	a2,a2,s2
	sd	a2,16(sp)
.L16:
	sd	a4,0(a5)
	addi	a5,a5,8
	add	a4,a4,s2
	bne	a5,a3,.L16
	ld	a5,24(sp)
	ld	a0,40(sp)
	ld	t1,8(sp)
	ld	a2,56(sp)
	slli	s11,a5,3
	mv	s7,a0
	mv	s8,t1
	mv	t6,s5
	mv	s3,a2
	li	a1,0
.L19:
	sub	a5,a2,s0
	mv	a3,t1
	mv	a4,a0
.L18:
	fld	fa5,0(a5)
	fld	fa4,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fadd.d	fa5,fa5,fa4
	addi	a3,a3,8
	fsd	fa5,-8(a3)
	bne	a5,a2,.L18
	addiw	a1,a1,1
	add	a0,a0,s11
	add	t1,t1,s0
	add	a2,a5,s11
	bne	s6,a1,.L19
	ld	a5,32(sp)
	ld	a0,48(sp)
	ld	t2,16(sp)
	ld	a2,72(sp)
	slli	s4,a5,3
	mv	s10,a0
	mv	s9,t2
	mv	t0,a7
	mv	s2,a2
	li	a1,0
.L20:
	sub	a5,a2,s0
	mv	a3,t2
	mv	a4,a0
.L21:
	fld	fa5,0(a5)
	fld	fa4,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fadd.d	fa5,fa5,fa4
	addi	a3,a3,8
	fsd	fa5,-8(a3)
	bne	a5,a2,.L21
	addiw	a1,a1,1
	add	a0,a0,s4
	add	t2,t2,s0
	add	a2,a5,s4
	bne	s6,a1,.L20
	ld	a5,160(sp)
	ld	a1,8(sp)
	ld	a3,16(sp)
	mv	a2,s6
	mv	a0,s6
	mv	a6,s6
	mv	a4,s6
	sd	t6,144(sp)
	sd	t0,136(sp)
	sd	a7,104(sp)
	sd	a5,96(sp)
	call	rec
	ld	t2,8(sp)
	ld	a0,40(sp)
	ld	t6,144(sp)
	ld	t0,136(sp)
	ld	a7,104(sp)
	add	s1,s1,s0
	mv	a2,s1
	li	a1,0
.L23:
	sub	a5,a2,s0
	mv	a3,t2
	mv	a4,a0
.L24:
	fld	fa5,0(a5)
	fld	fa4,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fadd.d	fa5,fa5,fa4
	addi	a3,a3,8
	fsd	fa5,-8(a3)
	bne	a5,a2,.L24
	addiw	a1,a1,1
	add	a0,a0,s11
	add	t2,t2,s0
	add	a2,a5,s11
	bne	s6,a1,.L23
	ld	a5,168(sp)
	ld	a1,8(sp)
	ld	a4,32(sp)
	mv	a3,a7
	mv	a2,s6
	mv	a0,s6
	mv	a6,s6
	sd	t6,144(sp)
	sd	t0,136(sp)
	sd	a5,104(sp)
	call	rec
	ld	a7,72(sp)
	ld	t2,16(sp)
	ld	a0,48(sp)
	ld	t6,144(sp)
	ld	t0,136(sp)
	add	a2,a7,s0
	li	a1,0
.L26:
	sub	a5,a2,s0
	mv	a3,t2
	mv	a4,a0
.L27:
	fld	fa5,0(a5)
	fld	fa4,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fsub.d	fa5,fa5,fa4
	addi	a3,a3,8
	fsd	fa5,-8(a3)
	bne	a5,a2,.L27
	addiw	a1,a1,1
	add	a0,a0,s4
	add	t2,t2,s0
	add	a2,a5,s4
	bne	s6,a1,.L26
	ld	a5,176(sp)
	ld	a2,24(sp)
	ld	a3,16(sp)
	mv	a1,s5
	mv	a0,s6
	mv	a6,s6
	mv	a4,s6
	sd	t6,152(sp)
	sd	a7,144(sp)
	sd	t0,136(sp)
	sd	a5,72(sp)
	call	rec
	ld	a5,112(sp)
	ld	a0,16(sp)
	ld	t6,152(sp)
	ld	a7,144(sp)
	ld	t0,136(sp)
	add	s5,a5,s0
	mv	a2,s5
	li	a1,0
.L29:
	sub	a5,a2,s0
	mv	a3,a0
	mv	a4,t0
.L30:
	fld	fa5,0(a5)
	fld	fa4,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fsub.d	fa5,fa5,fa4
	addi	a3,a3,8
	fsd	fa5,-8(a3)
	bne	a5,a2,.L30
	addiw	a1,a1,1
	add	t0,t0,s4
	add	a0,a0,s0
	add	a2,a5,s4
	bne	s6,a1,.L29
	ld	a5,184(sp)
	ld	a2,24(sp)
	ld	a1,40(sp)
	ld	a3,16(sp)
	mv	a0,s6
	mv	a6,s6
	mv	a4,s6
	sd	t6,144(sp)
	sd	a7,136(sp)
	sd	a5,112(sp)
	call	rec
	ld	a0,8(sp)
	ld	a1,56(sp)
	ld	t6,144(sp)
	ld	a7,136(sp)
	li	a2,0
.L32:
	sub	a5,s3,s0
	mv	a3,a0
	mv	a4,a1
.L33:
	fld	fa5,0(a5)
	fld	fa4,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fadd.d	fa5,fa5,fa4
	addi	a3,a3,8
	fsd	fa5,-8(a3)
	bne	s3,a5,.L33
	addiw	a2,a2,1
	add	a1,a1,s11
	add	a0,a0,s0
	add	s3,s3,s11
	bne	s6,a2,.L32
	ld	s3,192(sp)
	ld	a1,8(sp)
	ld	a4,32(sp)
	ld	a3,48(sp)
	mv	a2,s6
	mv	a5,s3
	mv	a6,s6
	mv	a0,s6
	sd	t6,40(sp)
	sd	a7,24(sp)
	call	rec
	ld	a1,8(sp)
	ld	t6,40(sp)
	ld	a7,24(sp)
	li	a2,0
.L35:
	sub	a5,s1,s0
	mv	a3,a1
	mv	a4,t6
.L36:
	fld	fa5,0(a5)
	fld	fa4,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fsub.d	fa5,fa5,fa4
	addi	a3,a3,8
	fsd	fa5,-8(a3)
	bne	s1,a5,.L36
	addiw	a2,a2,1
	add	t6,t6,s11
	add	a1,a1,s0
	add	s1,s1,s11
	bne	s6,a2,.L35
	ld	a1,16(sp)
	li	a2,0
.L37:
	sub	a5,s2,s0
	mv	a3,a1
	mv	a4,a7
.L38:
	fld	fa5,0(a5)
	fld	fa4,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fadd.d	fa5,fa5,fa4
	addi	a3,a3,8
	fsd	fa5,-8(a3)
	bne	s2,a5,.L38
	addiw	a2,a2,1
	add	a7,a7,s4
	add	a1,a1,s0
	add	s2,s2,s4
	bne	s6,a2,.L37
	ld	s1,200(sp)
	ld	a1,8(sp)
	ld	a3,16(sp)
	mv	a5,s1
	mv	a2,s6
	mv	a6,s6
	mv	a4,s6
	mv	a0,s6
	call	rec
	ld	a5,56(sp)
	li	a1,0
	add	a2,a5,s0
.L40:
	sub	a5,a2,s0
	mv	a3,s8
	mv	a4,s7
.L41:
	fld	fa5,0(a5)
	fld	fa4,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fsub.d	fa5,fa5,fa4
	addi	a3,a3,8
	fsd	fa5,-8(a3)
	bne	a2,a5,.L41
	addiw	a1,a1,1
	add	s7,s7,s11
	add	s8,s8,s0
	add	a2,a2,s11
	bne	s6,a1,.L40
	li	a2,0
.L42:
	sub	a5,s5,s0
	mv	a3,s9
	mv	a4,s10
.L43:
	fld	fa5,0(a5)
	fld	fa4,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fadd.d	fa5,fa5,fa4
	addi	a3,a3,8
	fsd	fa5,-8(a3)
	bne	s5,a5,.L43
	addiw	a2,a2,1
	add	s10,s10,s4
	add	s9,s9,s0
	add	s5,s5,s4
	bne	s6,a2,.L42
	ld	s2,208(sp)
	ld	a3,16(sp)
	ld	a1,8(sp)
	mv	a5,s2
	mv	a0,s6
	mv	a6,s6
	mv	a4,s6
	mv	a2,s6
	call	rec
	ld	a5,64(sp)
	mv	a0,s2
	ld	t1,80(sp)
	slli	a7,a5,3
	ld	a5,120(sp)
	ld	t3,96(sp)
	ld	t4,112(sp)
	slli	s2,a5,3
	ld	a5,88(sp)
	ld	t6,72(sp)
	ld	t0,104(sp)
	mv	t5,s3
	slli	t2,a5,3
	li	s3,0
.L45:
	mv	a4,t1
	li	a5,0
.L46:
	add	a2,t3,a5
	add	a3,t4,a5
	fld	fa5,0(a2)
	fld	fa3,0(a3)
	add	a3,t0,a5
	fld	fa1,0(a3)
	fadd.d	fa4,fa5,fa3
	add	a3,t5,a5
	fsub.d	fa5,fa5,fa1
	fld	fa2,0(a3)
	add	a3,t6,a5
	fld	fa0,0(a3)
	add	a3,a0,a5
	fsub.d	fa4,fa4,fa2
	fld	ft1,0(a3)
	fadd.d	fa5,fa5,fa0
	add	a3,s1,a5
	fld	ft0,0(a3)
	fadd.d	fa2,fa2,fa0
	fadd.d	fa3,fa3,fa1
	fadd.d	fa4,fa4,ft1
	add	a1,a4,s0
	fadd.d	fa5,fa5,ft0
	add	a2,a4,s2
	add	a3,a4,t2
	addi	a5,a5,8
	addi	a4,a4,8
	fsd	fa4,-8(a4)
	fsd	fa2,0(a1)
	fsd	fa3,0(a2)
	fsd	fa5,0(a3)
	bne	s0,a5,.L46
	addiw	s3,s3,1
	add	t1,t1,a7
	add	t3,t3,s0
	add	t4,t4,s0
	add	t5,t5,s0
	add	a0,a0,s0
	add	t6,t6,s0
	add	t0,t0,s0
	add	s1,s1,s0
	bne	s6,s3,.L45
	la	a5,__stack_chk_guard
	ld	a4, 216(sp)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L70
	ld	s0,320(sp)
	.cfi_restore 8
	ld	a0,128(sp)
	ld	s1,312(sp)
	.cfi_restore 9
	ld	s2,304(sp)
	.cfi_restore 18
	ld	s3,296(sp)
	.cfi_restore 19
	ld	s4,288(sp)
	.cfi_restore 20
	ld	s6,272(sp)
	.cfi_restore 22
	ld	s8,256(sp)
	.cfi_restore 24
	ld	s9,248(sp)
	.cfi_restore 25
	ld	s10,240(sp)
	.cfi_restore 26
	ld	s11,232(sp)
	.cfi_restore 27
	ld	ra,328(sp)
	.cfi_restore 1
	ld	s5,280(sp)
	.cfi_restore 21
	ld	s7,264(sp)
	.cfi_restore 23
	addi	sp,sp,336
	.cfi_def_cfa_offset 0
	tail	free@plt
.L71:
	.cfi_def_cfa_offset 336
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 21, -56
	.cfi_offset 23, -72
	ble	s7,zero,.L9
	ld	a5,80(sp)
	sd	s4,288(sp)
	.cfi_offset 20, -48
	slli	s4,s7,3
	add	s0,a5,s4
	slli	a5,s7,32
	sd	s1,312(sp)
	sd	s2,304(sp)
	sd	s3,296(sp)
	sd	s6,272(sp)
	sd	s8,256(sp)
	sd	s9,248(sp)
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 22, -64
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	slli	s1,a6,3
	slli	s9,a2,3
	slli	s6,a4,3
	add	s5,a1,s4
	srli	s2,a5,29
	li	s3,0
	mv	s8,a3
.L12:
	mv	a2,s2
	sub	a0,s0,s4
	li	a1,0
	call	memset@plt
	mv	a6,a0
	sub	a3,s5,s4
	mv	a2,s8
.L14:
	fld	fa3,0(a3)
	mv	a4,a2
	mv	a5,a6
.L13:
	fld	fa5,0(a4)
	fld	fa4,0(a5)
	addi	a5,a5,8
	addi	a4,a4,8
	fmadd.d	fa5,fa3,fa5,fa4
	fsd	fa5,-8(a5)
	bne	a5,s0,.L13
	addi	a3,a3,8
	add	a2,a2,s6
	bne	s5,a3,.L14
	addiw	s3,s3,1
	add	s5,s5,s9
	add	s0,s0,s1
	bne	s7,s3,.L12
	ld	s1,312(sp)
	.cfi_restore 9
	ld	s2,304(sp)
	.cfi_restore 18
	ld	s3,296(sp)
	.cfi_restore 19
	ld	s4,288(sp)
	.cfi_restore 20
	ld	s6,272(sp)
	.cfi_restore 22
	ld	s8,256(sp)
	.cfi_restore 24
	ld	s9,248(sp)
	.cfi_restore 25
.L9:
	la	a5,__stack_chk_guard
	ld	a4, 216(sp)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L72
	ld	ra,328(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,320(sp)
	.cfi_restore 8
	ld	s5,280(sp)
	.cfi_restore 21
	ld	s7,264(sp)
	.cfi_restore 23
	addi	sp,sp,336
	.cfi_def_cfa_offset 0
	jr	ra
.L72:
	.cfi_restore_state
	sd	s1,312(sp)
	sd	s2,304(sp)
	sd	s3,296(sp)
	sd	s4,288(sp)
	sd	s6,272(sp)
	sd	s8,256(sp)
	sd	s9,248(sp)
	sd	s10,240(sp)
	sd	s11,232(sp)
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 20, -48
	.cfi_offset 22, -64
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 27, -104
.L70:
	call	__stack_chk_fail@plt
	.cfi_endproc
.LFE43:
	.size	rec, .-rec
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"strassen"
	.align	3
.LC2:
	.string	"naive"
	.align	3
.LC3:
	.string	"n,method,run,seconds,gflops,maxdiff"
	.align	3
.LC7:
	.string	"%d,%s,%d,%.6f,%.3f,%.3e\n"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB46:
	.cfi_startproc
	li	a5,1
	slli	a5,a5,42
	addi	sp,sp,-256
	.cfi_def_cfa_offset 256
	addi	a5,a5,512
	sd	a5,96(sp)
	la	a4,__stack_chk_guard
	li	a5,256
	sw	a5,92(sp)
	lla	a0,.LC3
	ld	a5, 0(a4)
	sd	a5, 104(sp)
	li	a5, 0
	sd	s0,240(sp)
	sd	s2,224(sp)
	sd	s4,208(sp)
	sd	s11,152(sp)
	fsd	fs0,136(sp)
	fsd	fs1,128(sp)
	fsd	fs2,120(sp)
	sd	ra,248(sp)
	sd	s1,232(sp)
	sd	s3,216(sp)
	sd	s5,200(sp)
	sd	s6,192(sp)
	sd	s7,184(sp)
	sd	s8,176(sp)
	sd	s9,168(sp)
	sd	s10,160(sp)
	fsd	fs3,112(sp)
	.cfi_offset 8, -16
	.cfi_offset 18, -32
	.cfi_offset 20, -48
	.cfi_offset 27, -104
	.cfi_offset 40, -120
	.cfi_offset 41, -128
	.cfi_offset 50, -136
	.cfi_offset 1, -8
	.cfi_offset 9, -24
	.cfi_offset 19, -40
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	.cfi_offset 51, -144
	call	puts@plt
	fld	fs1,.LC5,a5
	fld	fs2,.LC6,a5
	fld	fs0,.LC4,a5
	addi	s2,sp,104
	addi	a5,sp,72
	sd	a5,0(sp)
	li	s11,128
	li	s0,8192
	addi	s4,sp,88
.L97:
	sw	s11,.LANCHOR0,a5
	ble	s11,zero,.L74
	lla	s6,b
	slli	s7,s11,13
	slli	s8,s11,3
	lla	s5,a
	add	s7,s6,s7
	add	s5,s5,s8
.L75:
	sub	s1,s5,s8
	mv	s3,s6
.L76:
	call	rand@plt
	fcvt.d.w	fa5,a0
	addi	s1,s1,8
	addi	s3,s3,8
	fdiv.d	fa5,fa5,fs0
	fsd	fa5,-8(s1)
	call	rand@plt
	fcvt.d.w	fa5,a0
	fdiv.d	fa5,fa5,fs0
	fsd	fa5,-8(s3)
	bne	s1,s5,.L76
	add	s6,s6,s0
	add	s5,s5,s0
	bne	s6,s7,.L75
.L74:
	lla	a0,ref
	call	naive
	li	a7,0
	lla	a5,.LC2
	sd	s4,48(sp)
	sd	s2,56(sp)
.L95:
	mv	t1,s11
	sd	a7,16(sp)
	li	s8,1
	lla	s7,a
	mv	s2,a5
	ble	t1,zero,.L93
.L119:
	lla	a5,c
	slli	s3,t1,13
	slli	a4,t1,32
	add	s4,s3,a5
	srli	s1,a4,29
	mv	s5,t1
.L78:
	mv	a0,a5
	mv	a2,s1
	li	a1,0
	call	memset@plt
	add	a5,a0,s0
	bne	a5,s4,.L78
	ld	a1,0(sp)
	li	a0,1
	sd	s5,8(sp)
	call	clock_gettime@plt
	ld	a4,80(sp)
	ld	a5,72(sp)
	ld	a6,16(sp)
	fcvt.d.l	fs3,a4
	fcvt.d.l	fa5,a5
	ld	t1,8(sp)
	fmadd.d	fs3,fs3,fs1,fa5
	beq	a6,zero,.L79
	li	a5,1
	beq	t1,a5,.L100
.L81:
	slliw	a6,a6,1
	blt	a6,t1,.L81
	mul	s1,a6,a6
	slli	s4,s1,3
.L80:
	li	a1,8
	mv	a0,s1
	sd	t1,32(sp)
	sd	a6,24(sp)
	call	calloc@plt
	li	a1,8
	mv	s9,a0
	mv	a0,s1
	call	calloc@plt
	mv	s6,a0
	mv	a0,s4
	call	malloc@plt
	ld	t1,32(sp)
	ld	a6,24(sp)
	sd	a0,8(sp)
	sd	s2,24(sp)
	slli	s1,t1,3
	mv	s2,s4
	slli	s5,a6,3
	li	s11,0
	sd	s8,32(sp)
	sd	a6,40(sp)
	li	s4,0
	mv	s10,t1
.L83:
	mv	a3,s2
	bgeu	s2,s11,.L82
	mv	a3,s11
.L82:
	sub	s8,a3,s11
	add	a1,s7,s4
	mv	a3,s8
	mv	a2,s1
	add	a0,s9,s11
	call	__memcpy_chk@plt
	lla	a5,b
	add	a1,a5,s4
	add	a0,s6,s11
	mv	a3,s8
	mv	a2,s1
	add	s4,s4,s0
	call	__memcpy_chk@plt
	add	s11,s11,s5
	bne	s4,s3,.L83
	ld	a6,40(sp)
	ld	s2,24(sp)
	sd	s10,24(sp)
	ld	s10,8(sp)
	mv	a4,a6
	mv	a3,s6
	mv	a5,s10
	mv	a2,a6
	mv	a0,a6
	mv	a1,s9
	ld	s8,32(sp)
	call	rec
	ld	s11,24(sp)
	lla	a5,c
	li	s4,0
.L85:
	li	a4,8388608
	mv	a3,s4
	bgeu	s4,a4,.L84
	mv	a3,a4
.L84:
	sub	a3,a3,s4
	mv	a1,s10
	mv	a0,a5
	mv	a2,s1
	call	__memcpy_chk@plt
	add	s4,s4,s0
	add	a5,a0,s0
	add	s10,s10,s5
	bne	s4,s3,.L85
	mv	t1,s11
.L98:
	mv	a0,s9
	sd	t1,24(sp)
	call	free@plt
	mv	a0,s6
	call	free@plt
	ld	a0,8(sp)
	call	free@plt
	ld	t1,24(sp)
.L86:
	ld	a1,0(sp)
	li	a0,1
	sd	t1,8(sp)
	call	clock_gettime@plt
	ld	t1,8(sp)
	ld	a4,80(sp)
	ld	a5,72(sp)
	fcvt.d.w	fa4,t1
	fcvt.d.l	fa2,a4
	fcvt.d.l	fa3,a5
	fadd.d	fa5,fa4,fa4
	fmadd.d	fa2,fa2,fs1,fa3
	fmul.d	fa5,fa5,fa4
	fsub.d	fa2,fa2,fs3
	fmul.d	fa5,fa5,fa4
	fdiv.d	fa5,fa5,fa2
	fdiv.d	fa5,fa5,fs2
	fmv.x.d	a6,fa5
	ble	t1,zero,.L101
	fmv.d.x	fa4,zero
	lla	a1,ref
	slli	a0,t1,13
	slli	a7,t1,3
	lla	a2,c
	add	a0,a0,a1
	add	a2,a7,a2
.L88:
	sub	a5,a2,a7
	mv	a4,a1
.L91:
	fld	fa5,0(a5)
	fld	fa1,0(a4)
	fmv.d	fa3,fa4
	fsub.d	fa5,fa5,fa1
	fabs.d	fa5,fa5
	fgt.d	a3,fa5,fa4
	beq	a3,zero,.L90
	fmv.d	fa3,fa5
.L90:
	addi	a5,a5,8
	fmv.d	fa4,fa3
	addi	a4,a4,8
	bne	a2,a5,.L91
	add	a1,a1,s0
	add	a2,a2,s0
	bne	a1,a0,.L88
.L87:
	fmv.x.d	a5,fa2
	fmv.x.d	a7,fa4
	mv	a4,s8
	mv	a2,t1
	mv	a3,s2
	lla	a1,.LC7
	li	a0,2
	call	__printf_chk@plt
	addiw	s8,s8,1
	li	a5,6
	beq	s8,a5,.L92
	lw	t1,.LANCHOR0
	bgt	t1,zero,.L119
.L93:
	ld	a1,0(sp)
	li	a0,1
	sd	t1,8(sp)
	call	clock_gettime@plt
	ld	a5,72(sp)
	ld	a4,80(sp)
	ld	t1,8(sp)
	fcvt.d.l	fa5,a5
	fcvt.d.l	fs3,a4
	ld	a5,16(sp)
	fmadd.d	fs3,fs3,fs1,fa5
	beq	a5,zero,.L79
	li	a1,8
	li	a0,1
	sd	t1,24(sp)
	call	calloc@plt
	li	a1,8
	mv	s9,a0
	li	a0,1
	call	calloc@plt
	mv	s6,a0
	li	a0,8
	call	malloc@plt
	li	a6,1
	mv	a5,a0
	sd	a0,8(sp)
	mv	a3,s6
	mv	a1,s9
	mv	a4,a6
	mv	a2,a6
	mv	a0,a6
	call	rec
	ld	t1,24(sp)
	j	.L98
.L79:
	lla	a0,c
	sd	t1,8(sp)
	call	naive
	ld	t1,8(sp)
	j	.L86
.L92:
	ld	a7,16(sp)
	beq	a7,zero,.L120
	ld	s4,48(sp)
	ld	s2,56(sp)
	addi	s4,s4,4
	beq	s4,s2,.L96
	lw	s11,0(s4)
	j	.L97
.L120:
	lw	s11,.LANCHOR0
	li	a7,1
	lla	a5,.LC1
	j	.L95
.L101:
	fmv.d.x	fa4,zero
	j	.L87
.L96:
	la	a5,__stack_chk_guard
	ld	a4, 104(sp)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L121
	ld	ra,248(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,240(sp)
	.cfi_restore 8
	ld	s1,232(sp)
	.cfi_restore 9
	ld	s2,224(sp)
	.cfi_restore 18
	ld	s3,216(sp)
	.cfi_restore 19
	ld	s4,208(sp)
	.cfi_restore 20
	ld	s5,200(sp)
	.cfi_restore 21
	ld	s6,192(sp)
	.cfi_restore 22
	ld	s7,184(sp)
	.cfi_restore 23
	ld	s8,176(sp)
	.cfi_restore 24
	ld	s9,168(sp)
	.cfi_restore 25
	ld	s10,160(sp)
	.cfi_restore 26
	ld	s11,152(sp)
	.cfi_restore 27
	fld	fs0,136(sp)
	.cfi_restore 40
	fld	fs1,128(sp)
	.cfi_restore 41
	fld	fs2,120(sp)
	.cfi_restore 50
	fld	fs3,112(sp)
	.cfi_restore 51
	li	a0,0
	addi	sp,sp,256
	.cfi_def_cfa_offset 0
	jr	ra
.L100:
	.cfi_restore_state
	mv	a6,t1
	li	s4,8
	mv	s1,t1
	j	.L80
.L121:
	call	__stack_chk_fail@plt
	.cfi_endproc
.LFE46:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC4:
	.word	-4194304
	.word	1105199103
	.align	3
.LC5:
	.word	-400107883
	.word	1041313291
	.align	3
.LC6:
	.word	0
	.word	1104006501
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.zero	4
	.type	ref, @object
	.size	ref, 8388608
ref:
	.zero	8388608
	.type	c, @object
	.size	c, 8388608
c:
	.zero	8388608
	.type	b, @object
	.size	b, 8388608
b:
	.zero	8388608
	.type	a, @object
	.size	a, 8388608
a:
	.zero	8388608
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
