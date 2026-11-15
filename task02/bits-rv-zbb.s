	.file	"bits.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zbb1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.type	cmp_double, @function
cmp_double:
.LFB44:
	.cfi_startproc
	fld	fa4,0(a0)
	fld	fa5,0(a1)
	fgt.d	a0,fa4,fa5
	flt.d	a5,fa4,fa5
	subw	a0,a0,a5
	ret
	.cfi_endproc
.LFE44:
	.size	cmp_double, .-cmp_double
	.align	1
	.globl	bswap32
	.type	bswap32, @function
bswap32:
.LFB28:
	.cfi_startproc
	rev8	a0,a0
	srai	a0,a0,32
	ret
	.cfi_endproc
.LFE28:
	.size	bswap32, .-bswap32
	.align	1
	.globl	is_pow2
	.type	is_pow2, @function
is_pow2:
.LFB29:
	.cfi_startproc
	addi	a5,a0,-1
	and	a5,a5,a0
	seqz	a5,a5
	snez	a0,a0
	and	a0,a5,a0
	ret
	.cfi_endproc
.LFE29:
	.size	is_pow2, .-is_pow2
	.align	1
	.globl	parity32
	.type	parity32, @function
parity32:
.LFB30:
	.cfi_startproc
	srliw	a5,a0,16
	xor	a0,a5,a0
	srliw	a5,a0,8
	xor	a5,a5,a0
	srliw	a0,a5,4
	xor	a0,a0,a5
	srliw	a5,a0,2
	xor	a5,a5,a0
	srliw	a0,a5,1
	xor	a0,a0,a5
	andi	a0,a0,1
	ret
	.cfi_endproc
.LFE30:
	.size	parity32, .-parity32
	.align	1
	.globl	popcount32
	.type	popcount32, @function
popcount32:
.LFB31:
	.cfi_startproc
	cpopw	a0,a0
	ret
	.cfi_endproc
.LFE31:
	.size	popcount32, .-popcount32
	.align	1
	.globl	ctz32
	.type	ctz32, @function
ctz32:
.LFB32:
	.cfi_startproc
	ctzw	a0,a0
	andi	a0,a0,31
	ret
	.cfi_endproc
.LFE32:
	.size	ctz32, .-ctz32
	.align	1
	.globl	clz32
	.type	clz32, @function
clz32:
.LFB33:
	.cfi_startproc
	li	a1,65536
	addi	a1,a1,-1
	sgtu	a1,a0,a1
	seqz	a1,a1
	slliw	a1,a1,4
	li	a4,16777216
	sllw	a5,a0,a1
	addi	a4,a4,-1
	sgtu	a4,a5,a4
	seqz	a4,a4
	slliw	a4,a4,3
	li	a2,268435456
	sllw	a5,a5,a4
	addi	a2,a2,-1
	sgtu	a2,a5,a2
	seqz	a2,a2
	slliw	a2,a2,2
	li	a3,1073741824
	sllw	a5,a5,a2
	addi	a3,a3,-1
	sgtu	a3,a5,a3
	seqz	a3,a3
	slliw	a3,a3,1
	sllw	a5,a5,a3
	addw	a0,a4,a1
	not	a4,a5
	srliw	a4,a4,31
	addw	a0,a0,a2
	addw	a0,a0,a3
	sllw	a5,a5,a4
	seqz	a5,a5
	addw	a0,a0,a4
	add	a0,a0,a5
	ret
	.cfi_endproc
.LFE33:
	.size	clz32, .-clz32
	.align	1
	.globl	next_pow2
	.type	next_pow2, @function
next_pow2:
.LFB34:
	.cfi_startproc
	snez	a5,a0
	sub	a0,a0,a5
	srli	a5,a0,1
	or	a5,a5,a0
	srli	a4,a5,2
	or	a4,a4,a5
	srli	a5,a4,4
	or	a5,a5,a4
	srli	a4,a5,8
	or	a4,a4,a5
	srli	a5,a4,16
	or	a5,a5,a4
	srli	a0,a5,32
	or	a0,a0,a5
	addi	a0,a0,1
	ret
	.cfi_endproc
.LFE34:
	.size	next_pow2, .-next_pow2
	.align	1
	.globl	sign_extend
	.type	sign_extend, @function
sign_extend:
.LFB35:
	.cfi_startproc
	li	a4,64
	subw	a4,a4,a1
	li	a5,-1
	addiw	a1,a1,-1
	srl	a5,a5,a4
	li	a4,1
	and	a5,a5,a0
	sll	a0,a4,a1
	xor	a5,a5,a0
	sub	a0,a5,a0
	ret
	.cfi_endproc
.LFE35:
	.size	sign_extend, .-sign_extend
	.align	1
	.globl	sat_add32
	.type	sat_add32, @function
sat_add32:
.LFB36:
	.cfi_startproc
	addw	a3,a0,a1
	li	a4,-2147483648
	xor	a5,a0,a3
	xor	a1,a3,a1
	srliw	a0,a0,31
	addiw	a4,a4,-1
	and	a5,a5,a1
	addw	a4,a4,a0
	xor	a4,a3,a4
	sraiw	a5,a5,31
	and	a5,a5,a4
	xor	a0,a3,a5
	ret
	.cfi_endproc
.LFE36:
	.size	sat_add32, .-sat_add32
	.align	1
	.globl	is_pow2_branchy
	.type	is_pow2_branchy, @function
is_pow2_branchy:
.LFB37:
	.cfi_startproc
	beq	a0,zero,.L13
	li	a4,1
	bne	a0,a4,.L14
	ret
.L20:
	beq	a0,a4,.L19
.L14:
	andi	a5,a0,1
	srli	a0,a0,1
	beq	a5,zero,.L20
	li	a0,0
.L13:
	ret
.L19:
	ret
	.cfi_endproc
.LFE37:
	.size	is_pow2_branchy, .-is_pow2_branchy
	.align	1
	.globl	sat_add32_branchy
	.type	sat_add32_branchy, @function
sat_add32_branchy:
.LFB38:
	.cfi_startproc
	li	a5,-2147483648
	add	a1,a0,a1
	xori	a0,a5,-1
	bgt	a1,a0,.L22
	blt	a1,a5,.L24
	sext.w	a0,a1
	ret
.L24:
	mv	a0,a5
.L22:
	ret
	.cfi_endproc
.LFE38:
	.size	sat_add32_branchy, .-sat_add32_branchy
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC3:
	.string	"run %d: %.6f s, sum %llu\n"
	.align	3
.LC6:
	.string	"median %.6f s, min %.6f, max %.6f, ns/element %.2f\n"
	.align	3
.LC7:
	.string	"popcount32"
	.align	3
.LC8:
	.string	"FAIL %-12s got %llu, want %llu\n"
	.align	3
.LC9:
	.string	"parity32"
	.align	3
.LC10:
	.string	"ctz32"
	.align	3
.LC11:
	.string	"clz32"
	.align	3
.LC12:
	.string	"is_pow2"
	.align	3
.LC14:
	.string	"sign_extend"
	.align	3
.LC15:
	.string	"FAIL %-12s got %lld, want %lld\n"
	.align	3
.LC18:
	.string	"sat_add32"
	.align	3
.LC19:
	.string	"FAIL next_pow2(%llu) = %llu\n"
	.align	3
.LC20:
	.string	"FAILED: %d\n"
	.align	3
.LC21:
	.string	"OK"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB46:
	.cfi_startproc
	addi	sp,sp,-272
	.cfi_def_cfa_offset 272
	sd	s4,224(sp)
	.cfi_offset 20, -48
	la	s4,__stack_chk_guard
	sd	s0,256(sp)
	sd	ra,264(sp)
	sd	s1,248(sp)
	sd	s2,240(sp)
	sd	s3,232(sp)
	sd	s5,216(sp)
	sd	s6,208(sp)
	ld	a5, 0(s4)
	sd	a5, 168(sp)
	li	a5, 0
	.cfi_offset 8, -16
	.cfi_offset 1, -8
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	li	s0,1
	ble	a0,s0,.L62
	ld	a4,8(a1)
	li	a5,45
	lbu	a4,0(a4)
	beq	a4,a5,.L70
.L62:
	li	a4,14
	li	s5,200704
	li	s3,1662976
	li	s2,1013903360
	sd	s7,200(sp)
	sd	s8,192(sp)
	sd	s9,184(sp)
	addi	s5,s5,-704
	mv	a5,a4
	addiw	s3,s3,1549
	addiw	s2,s2,863
	li	s1,9
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
.L31:
	mulw	s6,s0,s3
	slli	a3,a5,32
	srli	a3,a3,32
	addw	s0,s2,s6
	beq	a5,a4,.L32
	lw	a5,.LANCHOR0
	ble	a5,s1,.L71
.L33:
	addiw	a5,a5,1
	sw	a5,.LANCHOR0,a4
.L32:
	slli	s8,s0,32
	srli	s8,s8,32
	cpop	a4,s8
	srliw	a3,s0,16
	xor	a3,a3,s0
	srliw	a5,a3,8
	xor	a3,a3,a5
	srliw	a5,a3,4
	xor	a3,a3,a5
	srliw	a5,a3,2
	xor	a3,a3,a5
	srliw	a5,a3,1
	xor	a3,a3,a5
	andi	a3,a3,1
	andi	a4,a4,1
	beq	a3,a4,.L34
	lw	a5,.LANCHOR0
	ble	a5,s1,.L72
.L35:
	addiw	a5,a5,1
	sw	a5,.LANCHOR0,a4
.L34:
	beq	s0,zero,.L37
	mv	a0,s0
	call	clz32
	slli	a3,a0,32
	addi	s7,s8,-1
	and	s7,s7,s8
	srli	a3,a3,32
	clzw	a4,s0
	seqz	s7,s7
	beq	a3,a4,.L40
	lw	a5,.LANCHOR0
	ble	a5,s1,.L73
.L41:
	addiw	a5,a5,1
	sw	a5,.LANCHOR0,a4
.L40:
	li	a4,1013903360
	addiw	a4,a4,862
	addw	a4,a4,s6
	and	a4,a4,s0
	seqz	a4,a4
	beq	a4,s7,.L37
	lw	a5,.LANCHOR0
	ble	a5,s1,.L74
.L43:
	addiw	a5,a5,1
	sw	a5,.LANCHOR0,a4
.L37:
	addiw	s5,s5,-1
	beq	s5,zero,.L75
	mulw	a5,s3,s0
	addw	a5,s2,a5
	cpopw	a5,a5
	mv	a4,a5
	j	.L31
.L71:
	lla	a2,.LC7
	lla	a1,.LC8
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR0
	j	.L33
.L74:
	mv	a3,s7
	lla	a2,.LC12
	lla	a1,.LC8
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR0
	j	.L43
.L72:
	lla	a2,.LC9
	lla	a1,.LC8
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR0
	j	.L35
.L73:
	lla	a2,.LC11
	lla	a1,.LC8
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR0
	j	.L41
.L75:
	li	a4,252645376
	addi	a4,a4,-241
	slli	s3,a4,32
	add	s3,s3,a4
	li	s6,-1
	mv	s5,s3
	slli	s8,s6,63
	xor	s3,s3,s6
	li	s1,63
	li	s7,9
	j	.L49
.L46:
	addiw	a5,a5,1
	sw	a5,.LANCHOR0,a4
.L45:
	and	a3,s0,s3
	xor	a3,a3,s2
	sll	a4,s3,s1
	sub	a3,a3,s2
	sra	a4,a4,s1
	beq	a4,a3,.L47
	lw	a5,.LANCHOR0
	ble	a5,s7,.L76
.L48:
	addiw	a5,a5,1
	sw	a5,.LANCHOR0,a4
.L47:
	addiw	s1,s1,-1
	beq	s1,s6,.L77
.L49:
	srl	s0,s6,s1
	srl	s2,s8,s1
	and	a3,s0,s5
	xor	a3,a3,s2
	sll	a4,s5,s1
	sub	a3,a3,s2
	sra	a4,a4,s1
	beq	a4,a3,.L45
	lw	a5,.LANCHOR0
	bgt	a5,s7,.L46
	lla	a2,.LC14
	lla	a1,.LC15
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR0
	j	.L46
.L76:
	lla	a2,.LC14
	lla	a1,.LC15
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR0
	j	.L48
.L77:
	li	a5,50565120
	slli	a5,a5,20
	addi	a5,a5,1
	ld	a3,.LC17
	li	s6,-2147483648
	sd	a5,56(sp)
	li	a5,-12288
	srli	s1,s1,32
	xori	s2,s6,-1
	addi	a5,a5,-57
	sd	s1,48(sp)
	sd	a3,40(sp)
	sw	a5,64(sp)
	mv	s1,s2
	mv	s7,s2
	addi	s5,sp,68
	addi	s9,sp,40
	li	s8,9
.L50:
	srliw	s3,s2,31
	addw	s3,s1,s3
	addi	s0,sp,40
	j	.L53
.L52:
	addiw	a5,a5,1
	sw	a5,.LANCHOR0,a4
.L51:
	addi	s0,s0,4
	beq	s5,s0,.L78
.L53:
	lw	a4,0(s0)
	addw	a3,a4,s2
	xor	a2,a3,a4
	xor	a5,a3,s2
	and	a5,a5,a2
	sraiw	a5,a5,31
	xor	a2,a3,s3
	add	a4,a4,s2
	max	a4,a4,s6
	and	a5,a5,a2
	min	a4,a4,s7
	xor	a3,a3,a5
	beq	a3,a4,.L51
	lw	a5,.LANCHOR0
	bgt	a5,s8,.L52
	lla	a2,.LC18
	lla	a1,.LC15
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR0
	j	.L52
.L78:
	addi	s9,s9,4
	beq	s5,s9,.L54
	lw	s2,0(s9)
	j	.L50
.L54:
	lla	a5,.LANCHOR1
	ld	t5,0(a5)
	ld	t4,8(a5)
	ld	t3,16(a5)
	ld	t1,24(a5)
	ld	a7,32(a5)
	ld	a6,40(a5)
	ld	a0,48(a5)
	ld	a1,56(a5)
	ld	a2,64(a5)
	ld	a3,72(a5)
	ld	a4,80(a5)
	ld	a5,88(a5)
	sd	t5,72(sp)
	sd	t4,80(sp)
	sd	t3,88(sp)
	sd	t1,96(sp)
	sd	a7,104(sp)
	sd	a6,112(sp)
	sd	a0,120(sp)
	sd	a1,128(sp)
	sd	a2,136(sp)
	sd	a3,144(sp)
	sd	a4,152(sp)
	sd	a5,160(sp)
	addi	s2,sp,72
	addi	s0,sp,168
	li	s1,1
.L57:
	ld	a2,0(s2)
	snez	a5,a2
	sub	a5,a2,a5
	srli	a4,a5,1
	or	a5,a5,a4
	srli	a4,a5,2
	or	a5,a5,a4
	srli	a4,a5,4
	or	a5,a5,a4
	srli	a4,a5,8
	or	a5,a5,a4
	srli	a4,a5,16
	or	a5,a5,a4
	srli	a4,a5,32
	or	a5,a5,a4
	addi	a3,a5,1
	bgtu	a2,a3,.L55
	and	a5,a5,a3
	bne	a5,zero,.L55
	bleu	a2,s1,.L56
	srli	a5,a3,1
	bgtu	a2,a5,.L56
.L55:
	lla	a1,.LC19
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR0
	addiw	a5,a5,1
	sw	a5,.LANCHOR0,a4
.L56:
	addi	s2,s2,8
	bne	s0,s2,.L57
	lw	a2,.LANCHOR0
	bne	a2,zero,.L79
	lla	a0,.LC21
	call	puts@plt
	li	a0,0
	ld	s7,200(sp)
	.cfi_remember_state
	.cfi_restore 23
	ld	s8,192(sp)
	.cfi_restore 24
	ld	s9,184(sp)
	.cfi_restore 25
	j	.L59
.L79:
	.cfi_restore_state
	lla	a1,.LC20
	li	a0,2
	call	__printf_chk@plt
	ld	s7,200(sp)
	.cfi_restore 23
	ld	s8,192(sp)
	.cfi_restore 24
	ld	s9,184(sp)
	.cfi_restore 25
	li	a0,1
.L59:
	ld	a4, 168(sp)
	ld	a5, 0(s4)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L80
	ld	ra,264(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,256(sp)
	.cfi_restore 8
	ld	s1,248(sp)
	.cfi_restore 9
	ld	s2,240(sp)
	.cfi_restore 18
	ld	s3,232(sp)
	.cfi_restore 19
	ld	s4,224(sp)
	.cfi_restore 20
	ld	s5,216(sp)
	.cfi_restore 21
	ld	s6,208(sp)
	.cfi_restore 22
	addi	sp,sp,272
	.cfi_def_cfa_offset 0
	jr	ra
.L70:
	.cfi_restore_state
	li	a4,-1831432192
	addi	a4,a4,-862
	lla	s1,a.0+16777216
	lla	a3,a.0
.L27:
	slliw	a5,a4,13
	xor	a5,a5,a4
	srliw	a4,a5,17
	xor	a5,a5,a4
	slliw	a4,a5,5
	xor	a4,a5,a4
	sw	a4,0(a3)
	addi	a3,a3,4
	bne	s1,a3,.L27
	addi	s3,sp,72
	li	s2,0
	addi	s5,sp,24
	li	s6,5
.L29:
	mv	a1,s5
	li	a0,1
	call	clock_gettime@plt
	ld	a4,24(sp)
	ld	a3,32(sp)
	lla	a5,a.0
	fcvt.d.l	fa5,a4
	lla	a4,.LC2
	fcvt.d.l	fa4,a3
	fld	fa3,0(a4)
	li	s0,0
	fmul.d	fa4,fa4,fa3
	fadd.d	fa4,fa4,fa5
.L28:
	lw	a3,0(a5)
	addi	a5,a5,4
	cpopw	a3,a3
	add	s0,s0,a3
	bne	s1,a5,.L28
	mv	a1,s5
	li	a0,1
	fsd	fa4,8(sp)
	call	clock_gettime@plt
	ld	a5,24(sp)
	ld	a4,32(sp)
	addiw	s2,s2,1
	fcvt.d.l	fa3,a5
	lla	a5,.LC2
	fld	fa4,0(a5)
	fcvt.d.l	fa5,a4
	mv	a2,s2
	mv	a4,s0
	fmul.d	fa5,fa5,fa4
	fld	fa4,8(sp)
	lla	a1,.LC3
	li	a0,2
	addi	s3,s3,8
	fadd.d	fa5,fa5,fa3
	fsub.d	fa5,fa5,fa4
	fmv.x.d	a3,fa5
	fsd	fa5,-8(s3)
	call	__printf_chk@plt
	bne	s2,s6,.L29
	mv	a1,s2
	addi	a0,sp,72
	lla	a3,cmp_double
	li	a2,8
	call	qsort@plt
	fld	fa5,88(sp)
	fld	fa3,.LC4,a5
	fld	fa4,.LC5,a5
	fmv.x.d	a2,fa5
	fmul.d	fa5,fa5,fa3
	ld	a4,104(sp)
	ld	a3,72(sp)
	lla	a1,.LC6
	li	a0,2
	fmul.d	fa5,fa5,fa4
	fmv.x.d	a5,fa5
	call	__printf_chk@plt
	li	a0,0
	j	.L59
.L80:
	sd	s7,200(sp)
	sd	s8,192(sp)
	sd	s9,184(sp)
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	call	__stack_chk_fail@plt
	.cfi_endproc
.LFE46:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC2:
	.word	-400107883
	.word	1041313291
	.align	3
.LC4:
	.word	0
	.word	1104006501
	.align	3
.LC5:
	.word	0
	.word	1049624576
	.align	3
.LC17:
	.dword	-9223372034707292161
	.section	.rodata
	.align	3
	.set	.LANCHOR1,. + 0
.LC1:
	.dword	0
	.dword	1
	.dword	2
	.dword	3
	.dword	7
	.dword	8
	.dword	9
	.dword	2147483647
	.dword	2147483648
	.dword	4611686018427387903
	.dword	4611686018427387904
	.dword	-9223372036854775808
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	fails, @object
	.size	fails, 4
fails:
	.zero	4
	.zero	4
	.type	a.0, @object
	.size	a.0, 16777216
a.0:
	.zero	16777216
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
