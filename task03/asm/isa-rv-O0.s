	.file	"isa.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	max2
	.type	max2, @function
max2:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	mv	a4,a1
	sw	a5,-20(s0)
	mv	a5,a4
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	mv	a2,a5
	lw	a5,-24(s0)
	mv	a3,a5
	sext.w	a4,a3
	sext.w	a5,a2
	bge	a4,a5,.L2
	mv	a3,a2
.L2:
	sext.w	a5,a3
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	max2, .-max2
	.align	1
	.globl	max3
	.type	max3, @function
max3:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	mv	a3,a1
	mv	a4,a2
	sw	a5,-36(s0)
	mv	a5,a3
	sw	a5,-40(s0)
	mv	a5,a4
	sw	a5,-44(s0)
	lw	a5,-36(s0)
	mv	a2,a5
	lw	a5,-40(s0)
	sext.w	a3,a5
	sext.w	a4,a2
	bge	a3,a4,.L5
	mv	a5,a2
.L5:
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a2,a5
	lw	a5,-44(s0)
	mv	a3,a5
	sext.w	a4,a3
	sext.w	a5,a2
	bge	a4,a5,.L6
	mv	a3,a2
.L6:
	sext.w	a5,a3
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	max3, .-max3
	.align	1
	.globl	sum
	.type	sum, @function
sum:
.LFB2:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	zero,-32(s0)
	sd	zero,-24(s0)
	j	.L9
.L10:
	ld	a5,-24(s0)
	slli	a5,a5,3
	ld	a4,-40(s0)
	add	a5,a4,a5
	ld	a5,0(a5)
	ld	a4,-32(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L9:
	ld	a4,-24(s0)
	ld	a5,-48(s0)
	blt	a4,a5,.L10
	ld	a5,-32(s0)
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	sum, .-sum
	.align	1
	.globl	f
	.type	f, @function
f:
.LFB3:
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	zero,-32(s0)
	sd	zero,-24(s0)
	j	.L13
.L14:
	ld	a5,-24(s0)
	mul	a5,a5,a5
	ld	a4,-32(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L13:
	ld	a4,-24(s0)
	ld	a5,-40(s0)
	blt	a4,a5,.L14
	ld	a5,-32(s0)
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	f, .-f
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
