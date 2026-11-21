	.file	"isa.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zbb1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	max2
	.type	max2, @function
max2:
.LFB0:
	.cfi_startproc
	max	a0,a1,a0
	ret
	.cfi_endproc
.LFE0:
	.size	max2, .-max2
	.align	1
	.globl	max3
	.type	max3, @function
max3:
.LFB1:
	.cfi_startproc
	max	a0,a0,a2
	max	a0,a0,a1
	ret
	.cfi_endproc
.LFE1:
	.size	max3, .-max3
	.align	1
	.globl	sum
	.type	sum, @function
sum:
.LFB2:
	.cfi_startproc
	ble	a1,zero,.L7
	slli	a1,a1,3
	mv	a5,a0
	add	a1,a0,a1
	li	a0,0
.L6:
	ld	a4,0(a5)
	addi	a5,a5,8
	add	a0,a0,a4
	bne	a5,a1,.L6
	ret
.L7:
	li	a0,0
	ret
	.cfi_endproc
.LFE2:
	.size	sum, .-sum
	.align	1
	.globl	f
	.type	f, @function
f:
.LFB3:
	.cfi_startproc
	ble	a0,zero,.L12
	li	a5,0
	li	a4,0
.L11:
	mul	a3,a5,a5
	addi	a5,a5,1
	add	a4,a4,a3
	bne	a0,a5,.L11
	mv	a0,a4
	ret
.L12:
	li	a4,0
	mv	a0,a4
	ret
	.cfi_endproc
.LFE3:
	.size	f, .-f
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
