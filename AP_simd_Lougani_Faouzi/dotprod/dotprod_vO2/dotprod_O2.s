	.file	"dotprod.c"
	.text
	.p2align 4
	.globl	dotprod_1
	.type	dotprod_1, @function
dotprod_1:
.LFB556:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L4
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	.p2align 4,,10
	.p2align 3
.L3:
	movsd	(%rdi,%rax,8), %xmm0
	mulsd	(%rsi,%rax,8), %xmm0
	addq	$1, %rax
	addsd	%xmm0, %xmm1
	cmpq	%rax, %rdx
	jne	.L3
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm1, %xmm1
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE556:
	.size	dotprod_1, .-dotprod_1
	.p2align 4
	.globl	dotprod_11
	.type	dotprod_11, @function
dotprod_11:
.LFB557:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L10
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	.p2align 4,,10
	.p2align 3
.L9:
	movss	(%rdi,%rax,4), %xmm0
	mulss	(%rsi,%rax,4), %xmm0
	addq	$1, %rax
	addss	%xmm0, %xmm1
	cmpq	%rax, %rdx
	jne	.L9
	movaps	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	pxor	%xmm1, %xmm1
	movaps	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE557:
	.size	dotprod_11, .-dotprod_11
	.p2align 4
	.globl	dotprod_2
	.type	dotprod_2, @function
dotprod_2:
.LFB558:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L15
	movsd	(%rsi), %xmm1
	mulsd	(%rdi), %xmm1
	pxor	%xmm4, %xmm4
	leaq	8(%rdi), %rax
	leaq	(%rax,%rdx,8), %rdx
	movapd	%xmm4, %xmm5
	movapd	%xmm4, %xmm6
	addq	$8, %rsi
	movapd	%xmm4, %xmm0
	movapd	%xmm4, %xmm3
	.p2align 4,,10
	.p2align 3
.L14:
	movsd	8(%rax), %xmm2
	addsd	%xmm1, %xmm3
	movsd	(%rsi), %xmm1
	addq	$8, %rax
	mulsd	8(%rsi), %xmm2
	addq	$8, %rsi
	mulsd	-8(%rax), %xmm1
	addsd	%xmm2, %xmm6
	movsd	8(%rax), %xmm2
	mulsd	8(%rsi), %xmm2
	addsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm5
	movsd	16(%rax), %xmm2
	mulsd	16(%rsi), %xmm2
	addsd	%xmm2, %xmm4
	cmpq	%rdx, %rax
	jne	.L14
	addsd	%xmm3, %xmm0
	addsd	%xmm6, %xmm0
	addsd	%xmm5, %xmm0
	addsd	%xmm4, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	pxor	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE558:
	.size	dotprod_2, .-dotprod_2
	.p2align 4
	.globl	dotprod_22
	.type	dotprod_22, @function
dotprod_22:
.LFB559:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L20
	movss	(%rsi), %xmm1
	mulss	(%rdi), %xmm1
	pxor	%xmm4, %xmm4
	leaq	4(%rdi), %rax
	leaq	(%rax,%rdx,4), %rdx
	movaps	%xmm4, %xmm5
	movaps	%xmm4, %xmm6
	addq	$4, %rsi
	movaps	%xmm4, %xmm0
	movaps	%xmm4, %xmm3
	.p2align 4,,10
	.p2align 3
.L19:
	movss	4(%rax), %xmm2
	addss	%xmm1, %xmm3
	movss	(%rsi), %xmm1
	addq	$4, %rax
	mulss	4(%rsi), %xmm2
	addq	$4, %rsi
	mulss	-4(%rax), %xmm1
	addss	%xmm2, %xmm6
	movss	4(%rax), %xmm2
	mulss	4(%rsi), %xmm2
	addss	%xmm1, %xmm0
	addss	%xmm2, %xmm5
	movss	8(%rax), %xmm2
	mulss	8(%rsi), %xmm2
	addss	%xmm2, %xmm4
	cmpq	%rdx, %rax
	jne	.L19
	addss	%xmm3, %xmm0
	addss	%xmm6, %xmm0
	addss	%xmm5, %xmm0
	addss	%xmm4, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	pxor	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE559:
	.size	dotprod_22, .-dotprod_22
	.p2align 4
	.globl	dotprod_3
	.type	dotprod_3, @function
dotprod_3:
.LFB560:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L25
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L24:
	movsd	(%rdi,%rax,8), %xmm1
	mulsd	(%rsi,%rax,8), %xmm1
	addq	$1, %rax
	addsd	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L24
	movapd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	pxor	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE560:
	.size	dotprod_3, .-dotprod_3
	.p2align 4
	.globl	dotprod_4
	.type	dotprod_4, @function
dotprod_4:
.LFB561:
	.cfi_startproc
	endbr64
	testq	%rdx, %rdx
	je	.L30
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L29:
	movups	(%rdi,%rax,4), %xmm1
	movups	(%rsi,%rax,4), %xmm2
	addq	$1, %rax
	mulps	%xmm2, %xmm1
	addps	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L29
	ret
	.p2align 4,,10
	.p2align 3
.L30:
	pxor	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE561:
	.size	dotprod_4, .-dotprod_4
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC9:
	.string	"dotprod_1 result :%lf\n"
.LC10:
	.string	"dotprod_2 result :%lf\n"
.LC11:
	.string	"dotprod_11 result :%f\n"
.LC12:
	.string	"dotprod_22 result :%f\n"
.LC13:
	.string	"dotprod_3 result :%f\n"
.LC14:
	.string	"dotprod_4 result :%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB562:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	.LC9(%rip), %rsi
	movl	$1, %edi
	movabsq	$4611686019492741120, %rdx
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$168, %rsp
	.cfi_def_cfa_offset 208
	movsd	.LC6(%rip), %xmm0
	movsd	.LC2(%rip), %xmm4
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	leaq	112(%rsp), %r13
	leaq	64(%rsp), %r12
	movq	%rdx, (%rsp)
	movsd	%xmm0, 96(%rsp)
	movq	%rsp, %rbp
	leaq	32(%rsp), %rbx
	movsd	.LC3(%rip), %xmm3
	movsd	.LC4(%rip), %xmm2
	movsd	%xmm4, 64(%rsp)
	movsd	.LC5(%rip), %xmm1
	movabsq	$4647714816524288000, %rax
	movsd	%xmm0, 144(%rsp)
	movss	.LC7(%rip), %xmm0
	movq	%rax, 8(%rsp)
	movss	%xmm0, 16(%rsp)
	movss	%xmm0, 48(%rsp)
	movsd	.LC8(%rip), %xmm0
	movq	%rax, 40(%rsp)
	movl	$1, %eax
	movsd	%xmm3, 72(%rsp)
	movsd	%xmm2, 80(%rsp)
	movsd	%xmm1, 88(%rsp)
	movsd	%xmm4, 112(%rsp)
	movsd	%xmm3, 120(%rsp)
	movsd	%xmm2, 128(%rsp)
	movsd	%xmm1, 136(%rsp)
	movq	%rdx, 32(%rsp)
	call	__printf_chk@PLT
	movl	$5, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	dotprod_2
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC10(%rip), %rsi
	call	__printf_chk@PLT
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L33:
	movss	0(%rbp,%rax,4), %xmm1
	mulss	(%rbx,%rax,4), %xmm1
	addq	$1, %rax
	addss	%xmm1, %xmm0
	cmpq	$5, %rax
	jne	.L33
	leaq	.LC11(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	cvtss2sd	%xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$5, %edx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	dotprod_22
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC12(%rip), %rsi
	cvtss2sd	%xmm0, %xmm0
	call	__printf_chk@PLT
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L34:
	movsd	(%r12,%rax,8), %xmm1
	mulsd	0(%r13,%rax,8), %xmm1
	addq	$1, %rax
	addsd	%xmm1, %xmm0
	cmpq	$5, %rax
	jne	.L34
	movapd	%xmm0, %xmm1
	movl	$1, %edi
	movl	$1, %eax
	addsd	%xmm0, %xmm1
	leaq	.LC13(%rip), %rsi
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	pxor	%xmm1, %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L35:
	movups	0(%rbp,%rax,4), %xmm0
	movups	(%rbx,%rax,4), %xmm5
	addq	$1, %rax
	mulps	%xmm5, %xmm0
	addps	%xmm0, %xmm1
	cmpq	$5, %rax
	jne	.L35
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC14(%rip), %rsi
	cvtss2sd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movq	152(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L41
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L41:
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
	.long	1084227584
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	0
	.long	1078689792
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
