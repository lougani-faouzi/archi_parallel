	.file	"dotprod.c"
	.text
	.globl	dotprod_1
	.type	dotprod_1, @function
dotprod_1:
.LFB556:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L4
	movl	$0, %eax
	pxor	%xmm1, %xmm1
.L3:
	movsd	(%rdi,%rax,8), %xmm0
	mulsd	(%rsi,%rax,8), %xmm0
	addsd	%xmm0, %xmm1
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L3
.L1:
	movapd	%xmm1, %xmm0
	ret
.L4:
	pxor	%xmm1, %xmm1
	jmp	.L1
	.cfi_endproc
.LFE556:
	.size	dotprod_1, .-dotprod_1
	.globl	dotprod_11
	.type	dotprod_11, @function
dotprod_11:
.LFB557:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L9
	movl	$0, %eax
	pxor	%xmm1, %xmm1
.L8:
	movss	(%rdi,%rax,4), %xmm0
	mulss	(%rsi,%rax,4), %xmm0
	addss	%xmm0, %xmm1
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L8
.L6:
	movaps	%xmm1, %xmm0
	ret
.L9:
	pxor	%xmm1, %xmm1
	jmp	.L6
	.cfi_endproc
.LFE557:
	.size	dotprod_11, .-dotprod_11
	.globl	dotprod_2
	.type	dotprod_2, @function
dotprod_2:
.LFB558:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L14
	movq	%rdi, %rax
	leaq	(%rdi,%rdx,8), %rdx
	pxor	%xmm3, %xmm3
	movapd	%xmm3, %xmm4
	movapd	%xmm3, %xmm5
	movapd	%xmm3, %xmm0
	movapd	%xmm3, %xmm2
.L13:
	movsd	(%rax), %xmm1
	mulsd	(%rsi), %xmm1
	addsd	%xmm1, %xmm2
	movsd	8(%rax), %xmm1
	mulsd	8(%rsi), %xmm1
	addsd	%xmm1, %xmm0
	movsd	16(%rax), %xmm1
	mulsd	16(%rsi), %xmm1
	addsd	%xmm1, %xmm5
	movsd	24(%rax), %xmm1
	mulsd	24(%rsi), %xmm1
	addsd	%xmm1, %xmm4
	movsd	32(%rax), %xmm1
	mulsd	32(%rsi), %xmm1
	addsd	%xmm1, %xmm3
	addq	$8, %rax
	addq	$8, %rsi
	cmpq	%rdx, %rax
	jne	.L13
.L12:
	addsd	%xmm2, %xmm0
	addsd	%xmm5, %xmm0
	addsd	%xmm4, %xmm0
	addsd	%xmm3, %xmm0
	ret
.L14:
	pxor	%xmm3, %xmm3
	movapd	%xmm3, %xmm4
	movapd	%xmm3, %xmm5
	movapd	%xmm3, %xmm0
	movapd	%xmm3, %xmm2
	jmp	.L12
	.cfi_endproc
.LFE558:
	.size	dotprod_2, .-dotprod_2
	.globl	dotprod_22
	.type	dotprod_22, @function
dotprod_22:
.LFB559:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L19
	movq	%rdi, %rax
	leaq	(%rdi,%rdx,4), %rdx
	pxor	%xmm3, %xmm3
	movaps	%xmm3, %xmm4
	movaps	%xmm3, %xmm5
	movaps	%xmm3, %xmm0
	movaps	%xmm3, %xmm2
.L18:
	movss	(%rax), %xmm1
	mulss	(%rsi), %xmm1
	addss	%xmm1, %xmm2
	movss	4(%rax), %xmm1
	mulss	4(%rsi), %xmm1
	addss	%xmm1, %xmm0
	movss	8(%rax), %xmm1
	mulss	8(%rsi), %xmm1
	addss	%xmm1, %xmm5
	movss	12(%rax), %xmm1
	mulss	12(%rsi), %xmm1
	addss	%xmm1, %xmm4
	movss	16(%rax), %xmm1
	mulss	16(%rsi), %xmm1
	addss	%xmm1, %xmm3
	addq	$4, %rax
	addq	$4, %rsi
	cmpq	%rdx, %rax
	jne	.L18
.L17:
	addss	%xmm2, %xmm0
	addss	%xmm5, %xmm0
	addss	%xmm4, %xmm0
	addss	%xmm3, %xmm0
	ret
.L19:
	pxor	%xmm3, %xmm3
	movaps	%xmm3, %xmm4
	movaps	%xmm3, %xmm5
	movaps	%xmm3, %xmm0
	movaps	%xmm3, %xmm2
	jmp	.L17
	.cfi_endproc
.LFE559:
	.size	dotprod_22, .-dotprod_22
	.globl	dotprod_3
	.type	dotprod_3, @function
dotprod_3:
.LFB560:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L24
	movl	$0, %eax
	pxor	%xmm3, %xmm3
	movapd	%xmm3, %xmm4
	movapd	%xmm3, %xmm5
	movapd	%xmm3, %xmm0
	movapd	%xmm3, %xmm2
.L23:
	movsd	(%rdi,%rax,8), %xmm1
	mulsd	(%rsi,%rax,8), %xmm1
	addsd	%xmm1, %xmm2
	addsd	%xmm1, %xmm0
	addsd	%xmm1, %xmm5
	addsd	%xmm1, %xmm4
	addsd	%xmm1, %xmm3
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L23
.L22:
	addsd	%xmm2, %xmm0
	addsd	%xmm5, %xmm0
	addsd	%xmm4, %xmm0
	addsd	%xmm3, %xmm0
	ret
.L24:
	pxor	%xmm3, %xmm3
	movapd	%xmm3, %xmm4
	movapd	%xmm3, %xmm5
	movapd	%xmm3, %xmm0
	movapd	%xmm3, %xmm2
	jmp	.L22
	.cfi_endproc
.LFE560:
	.size	dotprod_3, .-dotprod_3
	.globl	dotprod_4
	.type	dotprod_4, @function
dotprod_4:
.LFB561:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L29
	movl	$0, %eax
	pxor	%xmm0, %xmm0ps
.L28:
	movups	(%rdi,%rax,4), %xmm1
	movups	(%rsi,%rax,4), %xmm2
	mulps	%xmm2, %xmm1
	addps	%xmm1, %xmm0
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L28
	ret
.L29:
	pxor	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE561:
	.size	dotprod_4, .-dotprod_4
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC12:
	.string	"dotprod_1 result :%lf\n"
.LC13:
	.string	"dotprod_2 result :%lf\n"
.LC14:
	.string	"dotprod_11 result :%f\n"
.LC15:
	.string	"dotprod_22 result :%f\n"
.LC16:
	.string	"dotprod_3 result :%f\n"
.LC17:
	.string	"dotprod_4 result :%f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB562:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$160, %rsp
	.cfi_def_cfa_offset 208
	movl	$40, %r14d
	movq	%fs:(%r14), %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	movsd	.LC2(%rip), %xmm4
	movsd	%xmm4, 64(%rsp)
	movsd	.LC3(%rip), %xmm3
	movsd	%xmm3, 72(%rsp)
	movsd	.LC4(%rip), %xmm2
	movsd	%xmm2, 80(%rsp)
	movsd	.LC5(%rip), %xmm1
	movsd	%xmm1, 88(%rsp)
	movsd	.LC6(%rip), %xmm0
	movsd	%xmm0, 96(%rsp)
	movsd	%xmm4, 112(%rsp)
	movsd	%xmm3, 120(%rsp)
	movsd	%xmm2, 128(%rsp)
	movsd	%xmm1, 136(%rsp)
	movsd	%xmm0, 144(%rsp)
	movss	.LC7(%rip), %xmm4
	movss	%xmm4, (%rsp)
	movss	.LC8(%rip), %xmm3
	movss	%xmm3, 4(%rsp)
	movss	.LC9(%rip), %xmm2
	movss	%xmm2, 8(%rsp)
	movss	.LC10(%rip), %xmm1
	movss	%xmm1, 12(%rsp)
	movss	.LC11(%rip), %xmm0
	movss	%xmm0, 16(%rsp)
	movss	%xmm4, 32(%rsp)
	movss	%xmm3, 36(%rsp)
	movss	%xmm2, 40(%rsp)
	movss	%xmm1, 44(%rsp)
	movss	%xmm0, 48(%rsp)
	leaq	112(%rsp), %r13
	leaq	64(%rsp), %r12
	movl	$5, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	dotprod_1
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	$5, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	dotprod_2
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	leaq	32(%rsp), %rbp
	movq	%rsp, %rbx
	movl	$5, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	dotprod_11
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	$5, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	dotprod_22
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	$5, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	dotprod_3
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	$5, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	dotprod_4
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	152(%rsp), %rax
	xorq	%fs:(%r14), %rax
	jne	.L34
	movl	$0, %eax
	addq	$160, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L34:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE562:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	0
	.long	1073741824
	.align 8
.LC4:
	.long	0
	.long	1074266112
	.align 8
.LC5:
	.long	0
	.long	1074790400
	.align 8
.LC6:
	.long	0
	.long	1075052544
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC7:
	.long	1065353216
	.align 4
.LC8:
	.long	1073741824
	.align 4
.LC9:
	.long	1077936128
	.align 4
.LC10:
	.long	1082130432
	.align 4
.LC11:
	.long	1084227584
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
