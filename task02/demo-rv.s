	.file	"demo.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	f_and
	.type	f_and, @function
f_and:
.LFB0:
	.cfi_startproc
	andi	a0,a0,0xff
	ret
	.cfi_endproc
.LFE0:
	.size	f_and, .-f_and
	.align	1
	.globl	f_or
	.type	f_or, @function
f_or:
.LFB1:
	.cfi_startproc
	ori	a0,a0,1
	ret
	.cfi_endproc
.LFE1:
	.size	f_or, .-f_or
	.align	1
	.globl	f_shl
	.type	f_shl, @function
f_shl:
.LFB2:
	.cfi_startproc
	slli	a5,a0,35
	srai	a0,a5,35
	slli	a0,a0,3
	ret
	.cfi_endproc
.LFE2:
	.size	f_shl, .-f_shl
	.align	1
	.globl	f_sar
	.type	f_sar, @function
f_sar:
.LFB3:
	.cfi_startproc
	srai	a0,a0,3
	ret
	.cfi_endproc
.LFE3:
	.size	f_sar, .-f_sar
	.align	1
	.globl	f_xor
	.type	f_xor, @function
f_xor:
.LFB4:
	.cfi_startproc
	srliw	a5,a0,16
	xor	a0,a5,a0
	ret
	.cfi_endproc
.LFE4:
	.size	f_xor, .-f_xor
	.align	1
	.globl	d7
	.type	d7, @function
d7:
.LFB5:
	.cfi_startproc
	li	a5,-1840701440
	addi	a5,a5,1171
	mul	a5,a0,a5
	sraiw	a4,a0,31
	srli	a5,a5,32
	addw	a0,a0,a5
	sraiw	a0,a0,2
	subw	a0,a0,a4
	ret
	.cfi_endproc
.LFE5:
	.size	d7, .-d7
	.align	1
	.globl	m7
	.type	m7, @function
m7:
.LFB6:
	.cfi_startproc
	li	a5,-1840701440
	addi	a5,a5,1171
	mul	a5,a0,a5
	sraiw	a4,a0,31
	srli	a5,a5,32
	addw	a5,a0,a5
	sraiw	a5,a5,2
	subw	a5,a5,a4
	slliw	a4,a5,3
	subw	a5,a4,a5
	subw	a0,a0,a5
	ret
	.cfi_endproc
.LFE6:
	.size	m7, .-m7
	.align	1
	.globl	dv
	.type	dv, @function
dv:
.LFB7:
	.cfi_startproc
	divw	a0,a0,a1
	ret
	.cfi_endproc
.LFE7:
	.size	dv, .-dv
	.align	1
	.globl	mv
	.type	mv, @function
mv:
.LFB8:
	.cfi_startproc
	remw	a0,a0,a1
	ret
	.cfi_endproc
.LFE8:
	.size	mv, .-mv
	.align	1
	.globl	rot3_tmp
	.type	rot3_tmp, @function
rot3_tmp:
.LFB9:
	.cfi_startproc
	lw	a4,0(a1)
	lw	a5,0(a0)
	sw	a4,0(a0)
	lw	a4,0(a2)
	sw	a4,0(a1)
	sw	a5,0(a2)
	ret
	.cfi_endproc
.LFE9:
	.size	rot3_tmp, .-rot3_tmp
	.align	1
	.globl	rot3_xor
	.type	rot3_xor, @function
rot3_xor:
.LFB10:
	.cfi_startproc
	lw	a4,0(a1)
	lw	a5,0(a0)
	xor	a5,a5,a4
	sw	a5,0(a0)
	lw	a4,0(a1)
	xor	a5,a5,a4
	sw	a5,0(a1)
	lw	a4,0(a0)
	xor	a5,a5,a4
	sw	a5,0(a0)
	lw	a4,0(a2)
	lw	a5,0(a1)
	xor	a5,a5,a4
	sw	a5,0(a1)
	lw	a4,0(a2)
	xor	a5,a5,a4
	sw	a5,0(a2)
	lw	a4,0(a1)
	xor	a5,a5,a4
	sw	a5,0(a1)
	ret
	.cfi_endproc
.LFE10:
	.size	rot3_xor, .-rot3_xor
	.align	1
	.globl	rot3_arith
	.type	rot3_arith, @function
rot3_arith:
.LFB11:
	.cfi_startproc
	lw	a3,0(a1)
	lw	a5,0(a2)
	lw	a4,0(a0)
	addw	a5,a5,a3
	addw	a4,a4,a5
	sw	a4,0(a0)
	lw	a3,0(a1)
	lw	a5,0(a2)
	addw	a5,a5,a3
	subw	a3,a4,a5
	sw	a3,0(a2)
	lw	a3,0(a0)
	lw	a6,0(a1)
	addw	a3,a3,a5
	subw	a5,a3,a6
	subw	a5,a5,a4
	sw	a5,0(a1)
	lw	a2,0(a2)
	lw	a5,0(a0)
	subw	a6,a6,a2
	addw	a5,a5,a6
	addw	a5,a5,a4
	subw	a5,a5,a3
	sw	a5,0(a0)
	ret
	.cfi_endproc
.LFE11:
	.size	rot3_arith, .-rot3_arith
	.align	1
	.globl	max_tern
	.type	max_tern, @function
max_tern:
.LFB12:
	.cfi_startproc
	mv	a5,a1
	bge	a1,a0,.L15
	mv	a5,a0
.L15:
	sext.w	a0,a5
	ret
	.cfi_endproc
.LFE12:
	.size	max_tern, .-max_tern
	.align	1
	.globl	sel_tern
	.type	sel_tern, @function
sel_tern:
.LFB13:
	.cfi_startproc
	beq	a0,zero,.L17
	mv	a2,a1
.L17:
	mv	a0,a2
	ret
	.cfi_endproc
.LFE13:
	.size	sel_tern, .-sel_tern
	.align	1
	.globl	sat_add32_tern
	.type	sat_add32_tern, @function
sat_add32_tern:
.LFB14:
	.cfi_startproc
	addw	a5,a0,a1
	xor	a1,a5,a1
	xor	a4,a0,a5
	and	a4,a4,a1
	blt	a4,zero,.L24
	mv	a0,a5
	ret
.L24:
	li	a5,-2147483648
	xori	a5,a5,-1
	sraiw	a0,a0,31
	xor	a0,a0,a5
	ret
	.cfi_endproc
.LFE14:
	.size	sat_add32_tern, .-sat_add32_tern
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
