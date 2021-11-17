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
	je	.L7
	cmpq	$1, %rdx
	je	.L8
	movq	%rdx, %rcx
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	shrq	%rcx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L4:
	movupd	(%rdi,%rax), %xmm1
	movupd	(%rsi,%rax), %xmm2
	addq	$16, %rax
	mulpd	%xmm2, %xmm1
	addpd	%xmm1, %xmm0
	cmpq	%rax, %rcx
	jne	.L4
	movq	%rdx, %rax
	movapd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm1
	andq	$-2, %rax
	andl	$1, %edx
	addpd	%xmm0, %xmm1
	je	.L1
.L3:
	movsd	(%rsi,%rax,8), %xmm0
	mulsd	(%rdi,%rax,8), %xmm0
	addsd	%xmm0, %xmm1
.L1:
	movapd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	pxor	%xmm1, %xmm1
	movapd	%xmm1, %xmm0
	ret
.L8:
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	jmp	.L3
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
	je	.L17
	leaq	-1(%rdx), %rax
	cmpq	$2, %rax
	jbe	.L18
	movq	%rdx, %rcx
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	shrq	$2, %rcx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L14:
	movups	(%rdi,%rax), %xmm0
	movups	(%rsi,%rax), %xmm2
	addq	$16, %rax
	mulps	%xmm2, %xmm0
	addps	%xmm0, %xmm1
	cmpq	%rcx, %rax
	jne	.L14
	movaps	%xmm1, %xmm0
	movq	%rdx, %rax
	movhlps	%xmm1, %xmm0
	andq	$-4, %rax
	addps	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	shufps	$85, %xmm1, %xmm0
	addps	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	testb	$3, %dl
	je	.L20
.L13:
	movss	(%rdi,%rax,4), %xmm1
	mulss	(%rsi,%rax,4), %xmm1
	leaq	1(%rax), %rcx
	addss	%xmm1, %xmm0
	cmpq	%rcx, %rdx
	jbe	.L11
	movss	(%rdi,%rcx,4), %xmm1
	mulss	(%rsi,%rcx,4), %xmm1
	addq	$2, %rax
	addss	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jbe	.L11
	movss	(%rsi,%rax,4), %xmm1
	mulss	(%rdi,%rax,4), %xmm1
	addss	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L17:
	pxor	%xmm0, %xmm0
.L11:
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	ret
.L18:
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	jmp	.L13
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, -32(%rsp)
	testq	%rdx, %rdx
	je	.L28
	movq	%rdx, %rax
	cmpq	$1, %rdx
	je	.L29
	shrq	%rax
	leaq	8(%rdi), %r8
	leaq	8(%rsi), %r9
	movq	%rax, %r15
	leaq	-1(%rax), %rax
	leaq	16(%rdi), %r10
	leaq	16(%rsi), %r11
	leaq	24(%rdi), %rbx
	leaq	24(%rsi), %rbp
	leaq	32(%rdi), %rcx
	leaq	32(%rsi), %rdx
	cmpq	$1, %rax
	jbe	.L30
	movupd	(%rsi), %xmm4
	movupd	(%rdi), %xmm7
	leaq	-3(%r15), %rax
	pxor	%xmm2, %xmm2
	movupd	16(%rsi), %xmm5
	andq	$-2, %rax
	xorl	%r14d, %r14d
	movapd	%xmm2, %xmm1
	mulpd	%xmm4, %xmm7
	movupd	16(%rdi), %xmm0
	movupd	8(%rsi), %xmm4
	movq	%rax, -24(%rsp)
	movupd	8(%rdi), %xmm6
	addq	$2, %rax
	movapd	%xmm2, %xmm3
	mulpd	%xmm5, %xmm0
	movapd	%xmm2, %xmm5
	mulpd	%xmm4, %xmm6
	movapd	%xmm2, %xmm4
.L25:
	movupd	-8(%rcx), %xmm8
	movupd	-8(%rdx), %xmm10
	movapd	%xmm7, %xmm9
	movq	%rcx, -16(%rsp)
	movupd	(%rcx), %xmm7
	movupd	(%rdx), %xmm11
	leaq	8(%rcx), %r8
	movq	%rdx, %r13
	mulpd	%xmm10, %xmm8
	leaq	8(%rdx), %r9
	leaq	16(%rcx), %r10
	movq	%r14, %r12
	mulpd	%xmm11, %xmm7
	leaq	16(%rdx), %r11
	leaq	24(%rcx), %rbx
	addq	$2, %r14
	addpd	%xmm0, %xmm9
	movupd	16(%rdx), %xmm12
	leaq	24(%rdx), %rbp
	addq	$32, %rcx
	addq	$32, %rdx
	addpd	%xmm8, %xmm6
	addpd	%xmm9, %xmm4
	addpd	%xmm7, %xmm0
	addpd	%xmm6, %xmm5
	movupd	-24(%rcx), %xmm6
	addpd	%xmm0, %xmm3
	movupd	-24(%rdx), %xmm0
	mulpd	%xmm0, %xmm6
	movupd	-16(%rcx), %xmm0
	mulpd	%xmm12, %xmm0
	addpd	%xmm6, %xmm8
	addpd	%xmm8, %xmm1
	movapd	%xmm7, %xmm8
	addpd	%xmm0, %xmm8
	addpd	%xmm8, %xmm2
	cmpq	-24(%rsp), %r12
	jne	.L25
	movq	-16(%rsp), %r12
.L24:
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L26:
	movupd	(%r12,%r14), %xmm0
	movupd	0(%r13,%r14), %xmm7
	addq	$1, %rax
	movupd	(%r9,%r14), %xmm6
	mulpd	%xmm7, %xmm0
	movupd	(%r11,%r14), %xmm7
	addpd	%xmm0, %xmm4
	movupd	(%r8,%r14), %xmm0
	mulpd	%xmm6, %xmm0
	movupd	0(%rbp,%r14), %xmm6
	addpd	%xmm0, %xmm5
	movupd	(%r10,%r14), %xmm0
	mulpd	%xmm7, %xmm0
	movupd	(%rdx,%r14), %xmm7
	addpd	%xmm0, %xmm3
	movupd	(%rbx,%r14), %xmm0
	mulpd	%xmm6, %xmm0
	addpd	%xmm0, %xmm1
	movupd	(%rcx,%r14), %xmm0
	addq	$16, %r14
	mulpd	%xmm7, %xmm0
	addpd	%xmm0, %xmm2
	cmpq	%rax, %r15
	ja	.L26
	movapd	%xmm2, %xmm0
	movq	-32(%rsp), %rax
	unpckhpd	%xmm2, %xmm0
	addpd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	movq	%rax, %rdx
	unpckhpd	%xmm1, %xmm0
	andq	$-2, %rdx
	addpd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movapd	%xmm3, %xmm1
	unpckhpd	%xmm3, %xmm1
	addpd	%xmm1, %xmm3
	movapd	%xmm5, %xmm1
	unpckhpd	%xmm5, %xmm1
	addpd	%xmm1, %xmm5
	movapd	%xmm4, %xmm1
	unpckhpd	%xmm4, %xmm1
	addpd	%xmm1, %xmm4
	testb	$1, %al
	je	.L27
.L23:
	movsd	(%rsi,%rdx,8), %xmm1
	mulsd	(%rdi,%rdx,8), %xmm1
	leaq	0(,%rdx,8), %rax
	addsd	%xmm1, %xmm4
	movsd	8(%rsi,%rax), %xmm1
	mulsd	8(%rdi,%rax), %xmm1
	addsd	%xmm1, %xmm5
	movsd	16(%rsi,%rax), %xmm1
	mulsd	16(%rdi,%rax), %xmm1
	addsd	%xmm1, %xmm3
	movsd	24(%rsi,%rax), %xmm1
	mulsd	24(%rdi,%rax), %xmm1
	addsd	%xmm1, %xmm0
	movsd	32(%rsi,%rax), %xmm1
	mulsd	32(%rdi,%rax), %xmm1
	addsd	%xmm1, %xmm2
.L27:
	addsd	%xmm5, %xmm3
	addsd	%xmm0, %xmm2
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	movapd	%xmm3, %xmm0
	addsd	%xmm2, %xmm0
	addsd	%xmm4, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	.cfi_restore_state
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	pxor	%xmm0, %xmm0
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L29:
	.cfi_restore_state
	pxor	%xmm2, %xmm2
	xorl	%edx, %edx
	movapd	%xmm2, %xmm0
	movapd	%xmm2, %xmm3
	movapd	%xmm2, %xmm5
	movapd	%xmm2, %xmm4
	jmp	.L23
.L30:
	pxor	%xmm2, %xmm2
	movq	%rsi, %r13
	movq	%rdi, %r12
	xorl	%eax, %eax
	movapd	%xmm2, %xmm1
	movapd	%xmm2, %xmm3
	movapd	%xmm2, %xmm5
	movapd	%xmm2, %xmm4
	jmp	.L24
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
	je	.L40
	leaq	-1(%rdx), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	cmpq	$2, %rax
	jbe	.L41
	movq	%rdx, %r8
	movups	(%rdi), %xmm3
	movups	(%rsi), %xmm0
	pxor	%xmm1, %xmm1
	shrq	$2, %r8
	leaq	4(%rsi), %rcx
	movaps	%xmm1, %xmm2
	movq	%rdi, %rax
	mulps	%xmm3, %xmm0
	salq	$4, %r8
	movaps	%xmm1, %xmm3
	movaps	%xmm1, %xmm5
	addq	%rdi, %r8
	movaps	%xmm1, %xmm4
	.p2align 4,,10
	.p2align 3
.L37:
	movups	4(%rax), %xmm7
	addps	%xmm0, %xmm4
	movups	(%rcx), %xmm0
	addq	$16, %rax
	movups	4(%rcx), %xmm6
	addq	$16, %rcx
	mulps	%xmm7, %xmm0
	movups	-8(%rcx), %xmm7
	addps	%xmm0, %xmm5
	movups	-8(%rax), %xmm0
	mulps	%xmm6, %xmm0
	movups	-4(%rcx), %xmm6
	addps	%xmm0, %xmm2
	movups	-4(%rax), %xmm0
	mulps	%xmm7, %xmm0
	addps	%xmm0, %xmm3
	movups	(%rax), %xmm0
	mulps	%xmm6, %xmm0
	addps	%xmm0, %xmm1
	cmpq	%r8, %rax
	jne	.L37
	movaps	%xmm1, %xmm6
	movaps	%xmm3, %xmm0
	movq	%rdx, %r8
	movhlps	%xmm1, %xmm6
	movhlps	%xmm3, %xmm0
	andq	$-4, %r8
	addps	%xmm6, %xmm1
	addps	%xmm0, %xmm3
	movaps	%xmm1, %xmm6
	movaps	%xmm3, %xmm0
	shufps	$85, %xmm1, %xmm6
	addps	%xmm6, %xmm1
	shufps	$85, %xmm3, %xmm0
	addps	%xmm0, %xmm3
	movaps	%xmm5, %xmm0
	movhlps	%xmm5, %xmm0
	movaps	%xmm1, %xmm6
	movaps	%xmm2, %xmm1
	addps	%xmm0, %xmm5
	movhlps	%xmm2, %xmm1
	addps	%xmm1, %xmm2
	movaps	%xmm5, %xmm0
	shufps	$85, %xmm5, %xmm0
	addps	%xmm0, %xmm5
	movaps	%xmm2, %xmm1
	shufps	$85, %xmm2, %xmm1
	addps	%xmm1, %xmm2
	movaps	%xmm5, %xmm0
	movaps	%xmm2, %xmm1
	movaps	%xmm4, %xmm2
	movhlps	%xmm4, %xmm2
	addps	%xmm2, %xmm4
	movaps	%xmm4, %xmm2
	shufps	$85, %xmm4, %xmm2
	addps	%xmm2, %xmm4
	testb	$3, %dl
	je	.L38
.L36:
	leaq	1(%r8), %rcx
	leaq	-2(%rdx), %r11
	cmpq	%r11, %rcx
	leaq	0(,%r8,4), %rax
	setb	%bl
	leaq	(%rsi,%rax), %r9
	leaq	(%rdi,%rax), %r10
	cmpq	%rdx, %rcx
	setbe	%cl
	testb	%cl, %bl
	je	.L42
	cmpq	$1, %rdx
	jbe	.L42
	movss	4(%rdi,%rax), %xmm10
	movss	8(%r10), %xmm9
	leaq	3(%r8), %rcx
	mulss	8(%r9), %xmm9
	movss	(%r10), %xmm5
	mulss	4(%rsi,%rax), %xmm10
	movss	16(%rdi,%rax), %xmm2
	mulss	(%r9), %xmm5
	movss	12(%r10), %xmm7
	mulss	16(%rsi,%rax), %xmm2
	movss	20(%rdi,%rax), %xmm8
	mulss	12(%r9), %xmm7
	mulss	20(%rsi,%rax), %xmm8
	addss	%xmm9, %xmm10
	addss	%xmm5, %xmm4
	movss	24(%rdi,%rax), %xmm5
	mulss	24(%rsi,%rax), %xmm5
	leaq	4(%r8), %rax
	addss	%xmm2, %xmm1
	addss	%xmm2, %xmm6
	addss	%xmm7, %xmm0
	addss	%xmm7, %xmm3
	addss	%xmm10, %xmm4
	movss	4(%r10), %xmm10
	mulss	4(%r9), %xmm10
	addss	%xmm9, %xmm10
	addss	%xmm7, %xmm9
	addss	%xmm9, %xmm1
	movaps	%xmm2, %xmm9
	addss	%xmm10, %xmm0
	addss	%xmm8, %xmm9
	addss	%xmm5, %xmm8
	addss	%xmm9, %xmm3
	addss	%xmm8, %xmm6
	cmpq	%rax, %r11
	ja	.L54
.L39:
	movss	(%rsi,%rcx,4), %xmm2
	mulss	(%rdi,%rcx,4), %xmm2
	leaq	0(,%rcx,4), %rax
	leaq	1(%rcx), %r8
	addss	%xmm2, %xmm4
	movss	4(%rsi,%rax), %xmm2
	mulss	4(%rdi,%rax), %xmm2
	addss	%xmm2, %xmm0
	movss	8(%rdi,%rax), %xmm2
	mulss	8(%rsi,%rax), %xmm2
	addss	%xmm2, %xmm1
	movss	12(%rdi,%rax), %xmm2
	mulss	12(%rsi,%rax), %xmm2
	addss	%xmm2, %xmm3
	movss	16(%rdi,%rax), %xmm2
	mulss	16(%rsi,%rax), %xmm2
	addss	%xmm2, %xmm6
	cmpq	%r8, %rdx
	jbe	.L38
	movss	(%rdi,%r8,4), %xmm2
	mulss	(%rsi,%r8,4), %xmm2
	leaq	0(,%r8,4), %rax
	addq	$2, %rcx
	addss	%xmm2, %xmm4
	movss	4(%rdi,%rax), %xmm2
	mulss	4(%rsi,%rax), %xmm2
	addss	%xmm2, %xmm0
	movss	8(%rdi,%rax), %xmm2
	mulss	8(%rsi,%rax), %xmm2
	addss	%xmm2, %xmm1
	movss	12(%rdi,%rax), %xmm2
	mulss	12(%rsi,%rax), %xmm2
	addss	%xmm2, %xmm3
	movss	16(%rdi,%rax), %xmm2
	mulss	16(%rsi,%rax), %xmm2
	addss	%xmm2, %xmm6
	cmpq	%rcx, %rdx
	jbe	.L38
	movss	(%rdi,%rcx,4), %xmm2
	mulss	(%rsi,%rcx,4), %xmm2
	leaq	0(,%rcx,4), %rax
	addss	%xmm2, %xmm4
	movss	4(%rdi,%rax), %xmm2
	mulss	4(%rsi,%rax), %xmm2
	addss	%xmm2, %xmm0
	movss	8(%rdi,%rax), %xmm2
	mulss	8(%rsi,%rax), %xmm2
	addss	%xmm2, %xmm1
	movss	12(%rdi,%rax), %xmm2
	mulss	12(%rsi,%rax), %xmm2
	addss	%xmm2, %xmm3
	movss	16(%rdi,%rax), %xmm2
	mulss	16(%rsi,%rax), %xmm2
	addss	%xmm2, %xmm6
.L38:
	addss	%xmm3, %xmm6
	addss	%xmm0, %xmm1
	popq	%rbx
	.cfi_def_cfa_offset 8
	movaps	%xmm6, %xmm0
	addss	%xmm1, %xmm0
	addss	%xmm4, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	.cfi_restore 3
	pxor	%xmm0, %xmm0
	ret
.L41:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	pxor	%xmm6, %xmm6
	xorl	%r8d, %r8d
	movaps	%xmm6, %xmm3
	movaps	%xmm6, %xmm1
	movaps	%xmm6, %xmm0
	movaps	%xmm6, %xmm4
	jmp	.L36
.L42:
	movq	%r8, %rcx
	jmp	.L39
.L54:
	leaq	0(,%rcx,4), %rax
	addss	%xmm5, %xmm0
	movss	16(%rdi,%rax), %xmm2
	movss	4(%rdi,%rax), %xmm11
	addss	%xmm5, %xmm3
	mulss	4(%rsi,%rax), %xmm11
	movss	8(%rdi,%rax), %xmm10
	mulss	8(%rsi,%rax), %xmm10
	movss	20(%rdi,%rax), %xmm7
	addss	%xmm9, %xmm0
	mulss	16(%rsi,%rax), %xmm2
	movss	24(%rdi,%rax), %xmm5
	mulss	20(%rsi,%rax), %xmm7
	mulss	24(%rsi,%rax), %xmm5
	leaq	7(%r8), %rax
	addss	%xmm10, %xmm11
	movss	(%rdi,%rcx,4), %xmm10
	mulss	(%rsi,%rcx,4), %xmm10
	leaq	6(%r8), %rcx
	addss	%xmm2, %xmm1
	addss	%xmm2, %xmm6
	addss	%xmm8, %xmm1
	addss	%xmm10, %xmm4
	movaps	%xmm2, %xmm10
	addss	%xmm7, %xmm10
	addss	%xmm5, %xmm7
	addss	%xmm11, %xmm4
	addss	%xmm10, %xmm3
	addss	%xmm7, %xmm6
	cmpq	%rax, %r11
	jbe	.L39
	leaq	0(,%rcx,4), %rax
	addss	%xmm5, %xmm0
	movss	16(%rsi,%rax), %xmm2
	mulss	16(%rdi,%rax), %xmm2
	addss	%xmm5, %xmm3
	movss	20(%rdi,%rax), %xmm9
	mulss	20(%rsi,%rax), %xmm9
	movss	4(%rdi,%rax), %xmm11
	movss	8(%rdi,%rax), %xmm8
	addss	%xmm10, %xmm0
	mulss	8(%rsi,%rax), %xmm8
	mulss	4(%rsi,%rax), %xmm11
	movaps	%xmm2, %xmm5
	addss	%xmm2, %xmm1
	addss	%xmm2, %xmm6
	addss	%xmm9, %xmm5
	addss	%xmm7, %xmm1
	addss	%xmm8, %xmm11
	addss	%xmm5, %xmm3
	movss	(%rsi,%rcx,4), %xmm8
	movss	24(%rdi,%rax), %xmm5
	mulss	(%rdi,%rcx,4), %xmm8
	leaq	9(%r8), %rcx
	mulss	24(%rsi,%rax), %xmm5
	addss	%xmm8, %xmm4
	addss	%xmm9, %xmm5
	addss	%xmm11, %xmm4
	addss	%xmm5, %xmm6
	jmp	.L39
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
	je	.L60
	cmpq	$1, %rdx
	je	.L61
	movq	%rdx, %rcx
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	shrq	%rcx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L58:
	movupd	(%rdi,%rax), %xmm0
	movupd	(%rsi,%rax), %xmm2
	addq	$16, %rax
	mulpd	%xmm2, %xmm0
	addpd	%xmm0, %xmm1
	cmpq	%rax, %rcx
	jne	.L58
	movq	%rdx, %rax
	movapd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm0
	andq	$-2, %rax
	andl	$1, %edx
	addpd	%xmm1, %xmm0
	je	.L59
.L57:
	movsd	(%rsi,%rax,8), %xmm1
	mulsd	(%rdi,%rax,8), %xmm1
	addsd	%xmm1, %xmm0
.L59:
	mulsd	.LC2(%rip), %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L60:
	pxor	%xmm0, %xmm0
	ret
.L61:
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	jmp	.L57
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
	je	.L66
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L65:
	movups	(%rdi,%rax,4), %xmm1
	movups	(%rsi,%rax,4), %xmm2
	addq	$1, %rax
	mulps	%xmm2, %xmm1
	addps	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L65
	ret
	.p2align 4,,10
	.p2align 3
.L66:
	pxor	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE561:
	.size	dotprod_4, .-dotprod_4
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC8:
	.string	"dotprod_1 result :%lf\n"
.LC9:
	.string	"dotprod_2 result :%lf\n"
.LC10:
	.string	"dotprod_11 result :%f\n"
.LC11:
	.string	"dotprod_22 result :%f\n"
.LC12:
	.string	"dotprod_3 result :%f\n"
.LC13:
	.string	"dotprod_4 result :%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB562:
	.cfi_startproc
	endbr64
	subq	$168, %rsp
	.cfi_def_cfa_offset 176
	movapd	.LC4(%rip), %xmm0
	movl	$1, %edi
	movapd	.LC3(%rip), %xmm1
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	movq	.LC2(%rip), %rax
	leaq	.LC8(%rip), %rsi
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm0, 128(%rsp)
	movss	.LC6(%rip), %xmm0
	movaps	%xmm1, 64(%rsp)
	movaps	%xmm1, 112(%rsp)
	movaps	.LC5(%rip), %xmm1
	movss	%xmm0, 16(%rsp)
	movss	%xmm0, 48(%rsp)
	movsd	.LC7(%rip), %xmm0
	movq	%rax, 96(%rsp)
	movq	%rax, 144(%rsp)
	movl	$1, %eax
	movaps	%xmm1, (%rsp)
	movaps	%xmm1, 32(%rsp)
	call	__printf_chk@PLT
	movl	$5, %edx
	leaq	112(%rsp), %rsi
	leaq	64(%rsp), %rdi
	call	dotprod_2
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC9(%rip), %rsi
	call	__printf_chk@PLT
	movaps	(%rsp), %xmm0
	mulps	32(%rsp), %xmm0
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	movaps	%xmm0, %xmm1
	movhlps	%xmm0, %xmm1
	addps	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	shufps	$85, %xmm1, %xmm0
	addps	%xmm1, %xmm0
	movaps	%xmm0, %xmm1
	movss	48(%rsp), %xmm0
	mulss	16(%rsp), %xmm0
	addss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	__printf_chk@PLT
	movl	$5, %edx
	movq	%rsp, %rdi
	leaq	32(%rsp), %rsi
	call	dotprod_22
	movl	$1, %edi
	movl	$1, %eax
	leaq	.LC11(%rip), %rsi
	cvtss2sd	%xmm0, %xmm0
	call	__printf_chk@PLT
	movapd	64(%rsp), %xmm1
	movapd	128(%rsp), %xmm0
	mulpd	112(%rsp), %xmm1
	movl	$1, %edi
	movl	$1, %eax
	mulpd	80(%rsp), %xmm0
	leaq	.LC12(%rip), %rsi
	addpd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm1
	addpd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	144(%rsp), %xmm0
	mulsd	96(%rsp), %xmm0
	addsd	%xmm1, %xmm0
	mulsd	.LC2(%rip), %xmm0
	call	__printf_chk@PLT
	movups	8(%rsp), %xmm0
	movups	40(%rsp), %xmm3
	leaq	.LC13(%rip), %rsi
	movups	12(%rsp), %xmm1
	movups	44(%rsp), %xmm4
	movl	$1, %edi
	movl	$1, %eax
	mulps	%xmm3, %xmm0
	movups	4(%rsp), %xmm2
	movups	36(%rsp), %xmm5
	mulps	%xmm4, %xmm1
	mulps	%xmm5, %xmm2
	addps	%xmm1, %xmm0
	movaps	(%rsp), %xmm1
	mulps	32(%rsp), %xmm1
	addps	%xmm2, %xmm1
	addps	%xmm1, %xmm0
	movaps	16(%rsp), %xmm1
	mulps	48(%rsp), %xmm1
	addps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	__printf_chk@PLT
	movq	152(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L71
	xorl	%eax, %eax
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L71:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE562:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1075052544
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	0
	.long	1072693248
	.long	0
	.long	1073741824
	.align 16
.LC4:
	.long	0
	.long	1074266112
	.long	0
	.long	1074790400
	.align 16
.LC5:
	.long	1065353216
	.long	1073741824
	.long	1077936128
	.long	1082130432
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC6:
	.long	1084227584
	.section	.rodata.cst8
	.align 8
.LC7:
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
