	.file	"bits.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
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
	li	a3,65536
	slliw	a2,a0,24
	srliw	a5,a0,24
	srliw	a4,a0,8
	addi	a3,a3,-256
	and	a4,a4,a3
	or	a5,a5,a2
	li	a3,16711680
	slliw	a0,a0,8
	or	a5,a5,a4
	and	a0,a0,a3
	or	a0,a5,a0
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
	li	a4,1431654400
	srliw	a5,a0,1
	addi	a4,a4,1365
	and	a5,a5,a4
	subw	a0,a0,a5
	li	a5,858992640
	addi	a5,a5,819
	srliw	a4,a0,2
	and	a4,a4,a5
	and	a0,a0,a5
	addw	a0,a0,a4
	srliw	a5,a0,4
	li	a4,252645376
	addw	a5,a5,a0
	addi	a4,a4,-241
	and	a5,a5,a4
	slliw	a4,a5,8
	addw	a5,a4,a5
	slliw	a0,a5,16
	addw	a0,a0,a5
	srliw	a0,a0,24
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
	negw	a5,a0
	li	a4,125612032
	and	a5,a5,a0
	addiw	a4,a4,1329
	mulw	a5,a5,a4
	lla	a4,.LANCHOR0
	srliw	a5,a5,27
	add	a5,a4,a5
	lbu	a0,0(a5)
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
	.string	"bswap32"
	.align	3
.LC11:
	.string	"ctz32"
	.align	3
.LC12:
	.string	"clz32"
	.align	3
.LC13:
	.string	"is_pow2"
	.align	3
.LC15:
	.string	"sign_extend"
	.align	3
.LC16:
	.string	"FAIL %-12s got %lld, want %lld\n"
	.align	3
.LC19:
	.string	"sat_add32"
	.align	3
.LC20:
	.string	"FAIL next_pow2(%llu) = %llu\n"
	.align	3
.LC21:
	.string	"FAILED: %d\n"
	.align	3
.LC22:
	.string	"OK"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB46:
	.cfi_startproc
	addi	sp,sp,-288
	.cfi_def_cfa_offset 288
	la	a4,__stack_chk_guard
	ld	a5, 0(a4)
	sd	a5, 168(sp)
	li	a5, 0
	sd	ra,280(sp)
	sd	s0,272(sp)
	sd	s1,264(sp)
	sd	s2,256(sp)
	sd	s3,248(sp)
	sd	s5,232(sp)
	sd	s6,224(sp)
	sd	s7,216(sp)
	sd	s8,208(sp)
	sd	s9,200(sp)
	sd	s10,192(sp)
	li	a5,1
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.cfi_offset 18, -32
	.cfi_offset 19, -40
	.cfi_offset 21, -56
	.cfi_offset 22, -64
	.cfi_offset 23, -72
	.cfi_offset 24, -80
	.cfi_offset 25, -88
	.cfi_offset 26, -96
	ble	a0,a5,.L66
	ld	a3,8(a1)
	li	a4,45
	lbu	a3,0(a3)
	beq	a3,a4,.L74
.L66:
	sd	s4,240(sp)
	li	s1,200704
	li	s5,1662976
	.cfi_offset 20, -48
	li	s4,1013903360
	li	s7,1431654400
	li	s3,858992640
	li	s6,252645376
	sd	s11,184(sp)
	mv	s9,a5
	addi	s1,s1,-704
	li	a4,14
	addiw	s5,s5,1549
	addiw	s4,s4,863
	addi	s7,s7,1365
	addi	s3,s3,819
	addi	s6,s6,-241
	lla	s8,.LANCHOR0
	li	s0,9
	.cfi_offset 27, -104
.L31:
	mulw	s2,s9,s5
	addw	s9,s4,s2
	srliw	a3,s9,1
	and	a3,a3,s7
	subw	a3,s9,a3
	srliw	a2,a3,2
	and	a2,a2,s3
	and	a3,a3,s3
	addw	a3,a3,a2
	srliw	a2,a3,4
	addw	a3,a2,a3
	and	a3,a3,s6
	slliw	a2,a3,8
	addw	a2,a2,a3
	slliw	a3,a2,16
	addw	a3,a3,a2
	srliw	a3,a3,24
	beq	a3,a4,.L32
	lw	a2,.LANCHOR1
	ble	a2,s0,.L75
.L33:
	addiw	a2,a2,1
	sw	a2,.LANCHOR1,a4
.L32:
	srliw	a3,s9,16
	xor	a3,a3,s9
	srliw	a4,a3,8
	xor	a3,a3,a4
	srliw	a4,a3,4
	xor	a3,a3,a4
	srliw	a4,a3,2
	xor	a3,a3,a4
	slli	s10,s9,32
	srliw	a4,a3,1
	srli	s10,s10,32
	xor	a3,a3,a4
	mv	a0,s10
	andi	s11,a3,1
	call	__paritydi2@plt
	sext.w	a4,a0
	beq	s11,a4,.L34
	lw	a3,.LANCHOR1
	ble	a3,s0,.L76
.L35:
	addiw	a3,a3,1
	sw	a3,.LANCHOR1,a4
.L34:
	li	a3,65536
	addi	a3,a3,-256
	srliw	a4,s9,8
	and	a4,a4,a3
	srliw	s11,s9,24
	slliw	a3,s9,24
	or	s11,s11,a3
	or	s11,s11,a4
	li	a3,16711680
	slliw	a4,s9,8
	and	a4,a4,a3
	mv	a0,s9
	or	s11,s11,a4
	call	__bswapsi2@plt
	slli	s11,s11,32
	slli	a4,a0,32
	srli	s11,s11,32
	srli	a4,a4,32
	beq	s11,a4,.L36
	lw	a3,.LANCHOR1
	ble	a3,s0,.L77
.L37:
	addiw	a3,a3,1
	sw	a3,.LANCHOR1,a4
.L36:
	beq	s9,zero,.L39
	li	a4,-1013903360
	addiw	a4,a4,-863
	subw	a4,a4,s2
	li	a3,125612032
	addiw	a3,a3,1329
	and	a4,a4,s9
	mulw	a4,a4,a3
	mv	a0,s10
	srliw	a4,a4,27
	add	a4,s8,a4
	lbu	s11,0(a4)
	call	__ctzdi2@plt
	sext.w	a4,a0
	beq	s11,a4,.L40
	lw	a2,.LANCHOR1
	ble	a2,s0,.L78
.L41:
	addiw	a2,a2,1
	sw	a2,.LANCHOR1,a4
.L40:
	mv	a0,s9
	call	clz32
	slli	s11,a0,32
	mv	a0,s10
	call	__clzdi2@plt
	addi	a3,s10,-1
	and	s10,a3,s10
	srli	s11,s11,32
	addiw	a4,a0,-32
	seqz	s10,s10
	beq	s11,a4,.L42
	lw	a3,.LANCHOR1
	ble	a3,s0,.L79
.L43:
	addiw	a3,a3,1
	sw	a3,.LANCHOR1,a4
.L42:
	li	a4,1013903360
	addiw	a4,a4,862
	addw	a4,a4,s2
	and	a4,a4,s9
	seqz	a4,a4
	beq	a4,s10,.L39
	lw	a2,.LANCHOR1
	ble	a2,s0,.L80
.L45:
	addiw	a2,a2,1
	sw	a2,.LANCHOR1,a4
.L39:
	addiw	s1,s1,-1
	beq	s1,zero,.L81
	mulw	a0,s5,s9
	addw	a0,s4,a0
	slli	a0,a0,32
	srli	a0,a0,32
	call	__popcountdi2@plt
	sext.w	a4,a0
	j	.L31
.L80:
	lla	a2,.LC13
	mv	a3,s10
	lla	a1,.LC8
	li	a0,2
	call	__printf_chk@plt
	lw	a2,.LANCHOR1
	j	.L45
.L75:
	lla	a2,.LC7
	lla	a1,.LC8
	li	a0,2
	call	__printf_chk@plt
	lw	a2,.LANCHOR1
	j	.L33
.L76:
	mv	a3,s11
	lla	a2,.LC9
	lla	a1,.LC8
	li	a0,2
	call	__printf_chk@plt
	lw	a3,.LANCHOR1
	j	.L35
.L77:
	mv	a3,s11
	lla	a2,.LC10
	lla	a1,.LC8
	li	a0,2
	call	__printf_chk@plt
	lw	a3,.LANCHOR1
	j	.L37
.L78:
	lla	a2,.LC11
	mv	a3,s11
	lla	a1,.LC8
	li	a0,2
	call	__printf_chk@plt
	lw	a2,.LANCHOR1
	j	.L41
.L79:
	mv	a3,s11
	lla	a2,.LC12
	lla	a1,.LC8
	li	a0,2
	call	__printf_chk@plt
	lw	a3,.LANCHOR1
	j	.L43
.L81:
	li	a4,252645376
	addi	a4,a4,-241
	slli	s3,a4,32
	add	s3,s3,a4
	li	s5,-1
	mv	s4,s3
	slli	s7,s5,63
	xor	s3,s3,s5
	li	s1,63
	li	s6,9
	j	.L51
.L48:
	addiw	a5,a5,1
	sw	a5,.LANCHOR1,a4
.L47:
	and	a3,s0,s3
	xor	a3,a3,s2
	sll	a4,s3,s1
	sub	a3,a3,s2
	sra	a4,a4,s1
	beq	a4,a3,.L49
	lw	a5,.LANCHOR1
	ble	a5,s6,.L82
.L50:
	addiw	a5,a5,1
	sw	a5,.LANCHOR1,a4
.L49:
	addiw	s1,s1,-1
	beq	s1,s5,.L83
.L51:
	srl	s0,s5,s1
	srl	s2,s7,s1
	and	a3,s0,s4
	xor	a3,a3,s2
	sll	a4,s4,s1
	sub	a3,a3,s2
	sra	a4,a4,s1
	beq	a4,a3,.L47
	lw	a5,.LANCHOR1
	bgt	a5,s6,.L48
	lla	a2,.LC15
	lla	a1,.LC16
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR1
	j	.L48
.L82:
	lla	a2,.LC15
	lla	a1,.LC16
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR1
	j	.L50
.L83:
	li	a5,50565120
	slli	a5,a5,20
	addi	a5,a5,1
	ld	a3,.LC18
	li	s5,-2147483648
	sd	a5,56(sp)
	li	a5,-12288
	xori	s2,s5,-1
	srli	s1,s1,32
	addi	a5,a5,-57
	sd	s1,48(sp)
	sd	a3,40(sp)
	sw	a5,64(sp)
	mv	s1,s2
	mv	s6,s2
	mv	s11,s2
	addi	s4,sp,68
	addi	s10,sp,40
.L52:
	srliw	s3,s2,31
	addw	s3,s1,s3
	addi	s0,sp,40
	li	s7,9
.L57:
	lw	a4,0(s0)
	addw	a3,a4,s2
	xor	a2,a3,a4
	xor	a5,a3,s2
	and	a5,a5,a2
	sraiw	a5,a5,31
	xor	a2,a3,s3
	and	a5,a5,a2
	add	a4,a4,s2
	xor	a3,a3,a5
	bge	a4,s5,.L53
	li	a4,-2147483648
.L53:
	ble	a4,s6,.L54
	mv	a4,s11
.L54:
	beq	a3,a4,.L55
	lw	a5,.LANCHOR1
	ble	a5,s7,.L84
.L56:
	addiw	a5,a5,1
	sw	a5,.LANCHOR1,a4
.L55:
	addi	s0,s0,4
	bne	s4,s0,.L57
	addi	s10,s10,4
	beq	s4,s10,.L58
	lw	s2,0(s10)
	j	.L52
.L84:
	lla	a2,.LC19
	lla	a1,.LC16
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR1
	j	.L56
.L58:
	ld	t5,32(s8)
	ld	t4,40(s8)
	ld	t3,48(s8)
	ld	t1,56(s8)
	ld	a7,64(s8)
	ld	a6,72(s8)
	ld	a0,80(s8)
	ld	a1,88(s8)
	ld	a2,96(s8)
	ld	a3,104(s8)
	ld	a4,112(s8)
	ld	a5,120(s8)
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
.L61:
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
	bgtu	a2,a3,.L59
	and	a5,a5,a3
	bne	a5,zero,.L59
	bleu	a2,s1,.L60
	srli	a5,a3,1
	bgtu	a2,a5,.L60
.L59:
	lla	a1,.LC20
	li	a0,2
	call	__printf_chk@plt
	lw	a5,.LANCHOR1
	addiw	a5,a5,1
	sw	a5,.LANCHOR1,a4
.L60:
	addi	s2,s2,8
	bne	s0,s2,.L61
	lw	a2,.LANCHOR1
	bne	a2,zero,.L85
	lla	a0,.LC22
	call	puts@plt
	li	a0,0
	ld	s4,240(sp)
	.cfi_remember_state
	.cfi_restore 20
	ld	s11,184(sp)
	.cfi_restore 27
	j	.L63
.L85:
	.cfi_restore_state
	lla	a1,.LC21
	li	a0,2
	call	__printf_chk@plt
	ld	s4,240(sp)
	.cfi_restore 20
	ld	s11,184(sp)
	.cfi_restore 27
	li	a0,1
.L63:
	la	a5,__stack_chk_guard
	ld	a4, 168(sp)
	ld	a5, 0(a5)
	xor	a5, a4, a5
	li	a4, 0
	bne	a5,zero,.L86
	ld	ra,280(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,272(sp)
	.cfi_restore 8
	ld	s1,264(sp)
	.cfi_restore 9
	ld	s2,256(sp)
	.cfi_restore 18
	ld	s3,248(sp)
	.cfi_restore 19
	ld	s5,232(sp)
	.cfi_restore 21
	ld	s6,224(sp)
	.cfi_restore 22
	ld	s7,216(sp)
	.cfi_restore 23
	ld	s8,208(sp)
	.cfi_restore 24
	ld	s9,200(sp)
	.cfi_restore 25
	ld	s10,192(sp)
	.cfi_restore 26
	addi	sp,sp,288
	.cfi_def_cfa_offset 0
	jr	ra
.L74:
	.cfi_restore_state
	li	a4,-1831432192
	addi	a4,a4,-862
	lla	s6,a.0+16777216
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
	bne	s6,a3,.L27
	li	s8,1431654400
	li	s5,858992640
	li	s7,252645376
	addi	s1,sp,72
	addi	s8,s8,1365
	addi	s5,s5,819
	addi	s7,s7,-241
	li	s0,0
	addi	s2,sp,24
	li	s3,5
.L29:
	mv	a1,s2
	li	a0,1
	call	clock_gettime@plt
	ld	a5,24(sp)
	ld	a4,32(sp)
	lla	a2,a.0
	fcvt.d.l	fa5,a5
	lla	a5,.LC2
	fcvt.d.l	fa4,a4
	fld	fa3,0(a5)
	li	s10,0
	fmul.d	fa4,fa4,fa3
	fadd.d	fa4,fa4,fa5
.L28:
	lw	a5,0(a2)
	addi	a2,a2,4
	srliw	a4,a5,1
	and	a4,a4,s8
	subw	a5,a5,a4
	srliw	a3,a5,2
	and	a3,a3,s5
	and	a5,a5,s5
	addw	a5,a5,a3
	srliw	a3,a5,4
	addw	a5,a3,a5
	and	a5,a5,s7
	slliw	a3,a5,8
	addw	a3,a3,a5
	slliw	a5,a3,16
	addw	a5,a5,a3
	srliw	a5,a5,24
	add	s10,s10,a5
	bne	s6,a2,.L28
	mv	a1,s2
	li	a0,1
	fsd	fa4,8(sp)
	call	clock_gettime@plt
	ld	a5,24(sp)
	ld	a4,32(sp)
	addiw	s0,s0,1
	fcvt.d.l	fa3,a5
	lla	a5,.LC2
	fld	fa4,0(a5)
	fcvt.d.l	fa5,a4
	mv	a2,s0
	mv	a4,s10
	fmul.d	fa5,fa5,fa4
	fld	fa4,8(sp)
	lla	a1,.LC3
	li	a0,2
	addi	s1,s1,8
	fadd.d	fa5,fa5,fa3
	fsub.d	fa5,fa5,fa4
	fmv.x.d	a3,fa5
	fsd	fa5,-8(s1)
	call	__printf_chk@plt
	bne	s0,s3,.L29
	mv	a1,s0
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
	j	.L63
.L86:
	sd	s4,240(sp)
	sd	s11,184(sp)
	.cfi_offset 20, -48
	.cfi_offset 27, -104
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
.LC18:
	.dword	-9223372034707292161
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	debruijn_ctz, @object
	.size	debruijn_ctz, 32
debruijn_ctz:
	.base64	"AAEcAh0OGAMeFhQPGREECB8bDRcVExAHGgwSBgsFCgk="
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
	.set	.LANCHOR1,. + 0
	.type	fails, @object
	.size	fails, 4
fails:
	.zero	4
	.zero	4
	.type	a.0, @object
	.size	a.0, 16777216
a.0:
	.zero	16777216
	.globl	__clzdi2
	.globl	__ctzdi2
	.globl	__bswapsi2
	.globl	__paritydi2
	.globl	__popcountdi2
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
