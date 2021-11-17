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
	movupd	(%rsi,%rax), %xmm3
	addq	$16, %rax
	mulpd	%xmm3, %xmm1
	movapd	%xmm1, %xmm2
	unpckhpd	%xmm1, %xmm1
	addsd	%xmm0, %xmm2
	movapd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	cmpq	%rax, %rcx
	jne	.L4
	movq	%rdx, %rax
	andq	$-2, %rax
	andl	$1, %edx
	je	.L11
.L3:
	movsd	(%rsi,%rax,8), %xmm1
	mulsd	(%rdi,%rax,8), %xmm1
	addsd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	pxor	%xmm0, %xmm0
	ret
.L8:
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
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
	je	.L18
	leaq	-1(%rdx), %rax
	cmpq	$2, %rax
	jbe	.L19
	movq	%rdx, %rcx
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	shrq	$2, %rcx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L15:
	movups	(%rdi,%rax), %xmm1
	movups	(%rsi,%rax), %xmm3
	addq	$16, %rax
	mulps	%xmm3, %xmm1
	addss	%xmm1, %xmm0
	movaps	%xmm1, %xmm2
	shufps	$85, %xmm1, %xmm2
	addss	%xmm2, %xmm0
	movaps	%xmm1, %xmm2
	unpckhps	%xmm1, %xmm2
	shufps	$255, %xmm1, %xmm1
	addss	%xmm0, %xmm2
	movaps	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	cmpq	%rcx, %rax
	jne	.L15
	movq	%rdx, %rax
	andq	$-4, %rax
	testb	$3, %dl
	je	.L21
.L14:
	movss	(%rdi,%rax,4), %xmm1
	mulss	(%rsi,%rax,4), %xmm1
	leaq	1(%rax), %rcx
	addss	%xmm1, %xmm0
	cmpq	%rcx, %rdx
	jbe	.L12
	movss	(%rdi,%rcx,4), %xmm1
	mulss	(%rsi,%rcx,4), %xmm1
	addq	$2, %rax
	addss	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jbe	.L12
	movss	(%rsi,%rax,4), %xmm1
	mulss	(%rdi,%rax,4), %xmm1
	addss	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	pxor	%xmm0, %xmm0
.L12:
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	ret
.L19:
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	jmp	.L14
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
	je	.L29
	movq	%rdx, %rax
	cmpq	$1, %rdx
	je	.L30
	shrq	%rax
	leaq	8(%rdi), %r8
	leaq	8(%rsi), %r9
	movq	%rax, %r14
	leaq	-1(%rax), %rax
	leaq	16(%rdi), %r10
	leaq	16(%rsi), %r11
	leaq	24(%rdi), %rbx
	leaq	24(%rsi), %rbp
	leaq	32(%rdi), %rdx
	leaq	32(%rsi), %rcx
	cmpq	$1, %rax
	jbe	.L31
	movupd	(%rsi), %xmm2
	movupd	16(%rsi), %xmm5
	leaq	-3(%r14), %r13
	pxor	%xmm9, %xmm9
	movupd	(%rdi), %xmm3
	movupd	16(%rdi), %xmm0
	andq	$-2, %r13
	movapd	%xmm9, %xmm1
	movupd	8(%rsi), %xmm7
	movupd	8(%rdi), %xmm6
	movq	%r13, -24(%rsp)
	leaq	2(%r13), %rax
	mulpd	%xmm2, %xmm3
	xorl	%r13d, %r13d
	movapd	%xmm9, %xmm2
	mulpd	%xmm5, %xmm0
	movapd	%xmm9, %xmm5
	mulpd	%xmm7, %xmm6
	movapd	%xmm9, %xmm7
	movapd	%xmm3, %xmm13
	unpckhpd	%xmm3, %xmm3
	movapd	%xmm0, %xmm12
	unpckhpd	%xmm0, %xmm0
	movapd	%xmm3, %xmm11
	movapd	%xmm6, %xmm8
	movapd	%xmm0, %xmm10
	unpckhpd	%xmm6, %xmm6
.L26:
	movupd	-8(%rcx), %xmm3
	addsd	%xmm8, %xmm1
	movupd	-8(%rdx), %xmm8
	addsd	%xmm12, %xmm7
	movupd	(%rcx), %xmm4
	addsd	%xmm13, %xmm2
	leaq	8(%rdx), %r8
	movq	%rcx, %r12
	mulpd	%xmm3, %xmm8
	movupd	(%rdx), %xmm3
	leaq	8(%rcx), %r9
	movq	%r13, %r15
	addsd	%xmm10, %xmm7
	movapd	%xmm9, %xmm0
	addsd	%xmm6, %xmm1
	movq	%rdx, -16(%rsp)
	mulpd	%xmm4, %xmm3
	leaq	16(%rdx), %r10
	leaq	16(%rcx), %r11
	addq	$2, %r13
	addsd	%xmm11, %xmm2
	movupd	16(%rdx), %xmm4
	leaq	24(%rdx), %rbx
	addq	$32, %rdx
	leaq	24(%rcx), %rbp
	addq	$32, %rcx
	movapd	%xmm8, %xmm6
	unpckhpd	%xmm8, %xmm8
	addsd	%xmm6, %xmm5
	addsd	%xmm6, %xmm1
	movupd	-24(%rdx), %xmm6
	movapd	%xmm3, %xmm13
	unpckhpd	%xmm3, %xmm3
	addsd	%xmm12, %xmm2
	addsd	%xmm13, %xmm0
	addsd	%xmm13, %xmm7
	movapd	%xmm3, %xmm11
	addsd	%xmm8, %xmm5
	addsd	%xmm8, %xmm1
	addsd	%xmm10, %xmm2
	addsd	%xmm3, %xmm0
	addsd	%xmm3, %xmm7
	movupd	-24(%rcx), %xmm3
	mulpd	%xmm3, %xmm6
	movupd	-16(%rcx), %xmm3
	mulpd	%xmm3, %xmm4
	addsd	%xmm6, %xmm5
	movapd	%xmm6, %xmm8
	unpckhpd	%xmm6, %xmm6
	addsd	%xmm4, %xmm0
	movapd	%xmm4, %xmm12
	unpckhpd	%xmm4, %xmm4
	addsd	%xmm6, %xmm5
	movapd	%xmm4, %xmm10
	addsd	%xmm4, %xmm0
	movapd	%xmm0, %xmm9
	cmpq	-24(%rsp), %r15
	jne	.L26
	movq	-16(%rsp), %r15
.L25:
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L27:
	movupd	(%r12,%r13), %xmm3
	movupd	(%r15,%r13), %xmm8
	addq	$1, %rax
	movupd	(%r9,%r13), %xmm6
	mulpd	%xmm3, %xmm8
	movupd	(%r11,%r13), %xmm3
	addsd	%xmm8, %xmm2
	unpckhpd	%xmm8, %xmm8
	addsd	%xmm8, %xmm2
	movupd	(%r8,%r13), %xmm8
	mulpd	%xmm6, %xmm8
	movupd	(%r10,%r13), %xmm6
	mulpd	%xmm3, %xmm6
	movupd	(%rdx,%r13), %xmm3
	addsd	%xmm8, %xmm1
	unpckhpd	%xmm8, %xmm8
	movapd	%xmm6, %xmm4
	unpckhpd	%xmm6, %xmm6
	addsd	%xmm7, %xmm4
	movapd	%xmm6, %xmm7
	movupd	0(%rbp,%r13), %xmm6
	addsd	%xmm8, %xmm1
	addsd	%xmm4, %xmm7
	movupd	(%rbx,%r13), %xmm4
	mulpd	%xmm6, %xmm4
	movapd	%xmm4, %xmm0
	unpckhpd	%xmm4, %xmm4
	addsd	%xmm5, %xmm0
	movapd	%xmm4, %xmm5
	movupd	(%rcx,%r13), %xmm4
	addq	$16, %r13
	mulpd	%xmm4, %xmm3
	addsd	%xmm0, %xmm5
	addsd	%xmm3, %xmm9
	unpckhpd	%xmm3, %xmm3
	addsd	%xmm3, %xmm9
	cmpq	%rax, %r14
	ja	.L27
	movq	-32(%rsp), %rax
	movq	%rax, %rdx
	andq	$-2, %rdx
	testb	$1, %al
	je	.L28
.L24:
	movsd	(%rsi,%rdx,8), %xmm0
	mulsd	(%rdi,%rdx,8), %xmm0
	leaq	0(,%rdx,8), %rax
	addsd	%xmm0, %xmm2
	movsd	8(%rsi,%rax), %xmm0
	mulsd	8(%rdi,%rax), %xmm0
	addsd	%xmm0, %xmm1
	movsd	16(%rsi,%rax), %xmm0
	mulsd	16(%rdi,%rax), %xmm0
	addsd	%xmm0, %xmm7
	movsd	24(%rsi,%rax), %xmm0
	mulsd	24(%rdi,%rax), %xmm0
	addsd	%xmm0, %xmm5
	movsd	32(%rsi,%rax), %xmm0
	mulsd	32(%rdi,%rax), %xmm0
	addsd	%xmm0, %xmm9
.L28:
	addsd	%xmm2, %xmm1
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
	addsd	%xmm7, %xmm1
	movapd	%xmm1, %xmm6
	addsd	%xmm5, %xmm6
	movapd	%xmm6, %xmm4
	addsd	%xmm9, %xmm4
	movapd	%xmm4, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L29:
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
.L30:
	.cfi_restore_state
	pxor	%xmm9, %xmm9
	xorl	%edx, %edx
	movapd	%xmm9, %xmm5
	movapd	%xmm9, %xmm7
	movapd	%xmm9, %xmm1
	movapd	%xmm9, %xmm2
	jmp	.L24
.L31:
	pxor	%xmm9, %xmm9
	movq	%rsi, %r12
	movq	%rdi, %r15
	xorl	%eax, %eax
	movapd	%xmm9, %xmm5
	movapd	%xmm9, %xmm7
	movapd	%xmm9, %xmm1
	movapd	%xmm9, %xmm2
	jmp	.L25
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
	je	.L41
	leaq	-1(%rdx), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	cmpq	$2, %rax
	jbe	.L42
	movups	(%rsi), %xmm7
	movups	(%rdi), %xmm1
	movq	%rdx, %r8
	pxor	%xmm0, %xmm0
	shrq	$2, %r8
	leaq	16(%rdi), %rcx
	movaps	%xmm0, %xmm9
	movq	%rsi, %rax
	mulps	%xmm7, %xmm1
	salq	$4, %r8
	movaps	%xmm0, %xmm8
	movaps	%xmm0, %xmm5
	addq	%rsi, %r8
	movaps	%xmm0, %xmm7
	movaps	%xmm1, %xmm10
	movaps	%xmm1, %xmm6
	movaps	%xmm1, %xmm4
	unpckhps	%xmm1, %xmm6
	shufps	$85, %xmm1, %xmm10
	shufps	$255, %xmm1, %xmm1
	.p2align 4,,10
	.p2align 3
.L38:
	addss	%xmm4, %xmm7
	movaps	%xmm10, %xmm4
	movups	-8(%rcx), %xmm3
	addq	$16, %rax
	addq	$16, %rcx
	addss	%xmm7, %xmm4
	movaps	%xmm6, %xmm7
	movups	-28(%rcx), %xmm6
	addss	%xmm4, %xmm7
	movups	-12(%rax), %xmm4
	mulps	%xmm6, %xmm4
	movups	-8(%rax), %xmm6
	addss	%xmm1, %xmm7
	mulps	%xmm6, %xmm3
	movups	-4(%rax), %xmm6
	addss	%xmm4, %xmm5
	movaps	%xmm4, %xmm1
	movaps	%xmm4, %xmm2
	shufps	$85, %xmm4, %xmm1
	unpckhps	%xmm4, %xmm2
	shufps	$255, %xmm4, %xmm4
	addss	%xmm3, %xmm8
	addss	%xmm5, %xmm1
	movaps	%xmm2, %xmm5
	movups	-20(%rcx), %xmm2
	mulps	%xmm6, %xmm2
	addss	%xmm1, %xmm5
	movups	-16(%rcx), %xmm1
	addss	%xmm4, %xmm5
	movaps	%xmm3, %xmm4
	shufps	$85, %xmm3, %xmm4
	addss	%xmm4, %xmm8
	movaps	%xmm3, %xmm4
	movaps	%xmm2, %xmm6
	unpckhps	%xmm3, %xmm4
	addss	%xmm9, %xmm6
	shufps	$255, %xmm3, %xmm3
	addss	%xmm4, %xmm8
	addss	%xmm3, %xmm8
	movaps	%xmm2, %xmm3
	shufps	$85, %xmm2, %xmm3
	addss	%xmm3, %xmm6
	movaps	%xmm2, %xmm3
	unpckhps	%xmm2, %xmm3
	shufps	$255, %xmm2, %xmm2
	addss	%xmm3, %xmm6
	addss	%xmm2, %xmm6
	movaps	%xmm6, %xmm9
	movups	(%rax), %xmm6
	mulps	%xmm6, %xmm1
	addss	%xmm1, %xmm0
	movaps	%xmm1, %xmm10
	movaps	%xmm1, %xmm6
	shufps	$85, %xmm1, %xmm10
	unpckhps	%xmm1, %xmm6
	movaps	%xmm1, %xmm4
	shufps	$255, %xmm1, %xmm1
	addss	%xmm10, %xmm0
	addss	%xmm6, %xmm0
	addss	%xmm1, %xmm0
	cmpq	%r8, %rax
	jne	.L38
	movq	%rdx, %r8
	andq	$-4, %r8
	testb	$3, %dl
	je	.L39
.L37:
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
	je	.L43
	cmpq	$1, %rdx
	jbe	.L43
	movss	(%r10), %xmm1
	mulss	(%r9), %xmm1
	leaq	3(%r8), %rcx
	movss	4(%rdi,%rax), %xmm2
	mulss	4(%rsi,%rax), %xmm2
	movss	4(%r10), %xmm4
	mulss	4(%r9), %xmm4
	movss	8(%r10), %xmm3
	mulss	8(%r9), %xmm3
	movss	12(%r10), %xmm6
	mulss	12(%r9), %xmm6
	addss	%xmm1, %xmm7
	movss	16(%rdi,%rax), %xmm10
	mulss	16(%rsi,%rax), %xmm10
	movss	20(%rdi,%rax), %xmm11
	mulss	20(%rsi,%rax), %xmm11
	addss	%xmm5, %xmm4
	addss	%xmm7, %xmm2
	addss	%xmm3, %xmm4
	addss	%xmm10, %xmm0
	movaps	%xmm2, %xmm7
	addss	%xmm3, %xmm7
	addss	%xmm8, %xmm3
	movaps	%xmm4, %xmm5
	addss	%xmm11, %xmm0
	addss	%xmm6, %xmm5
	addss	%xmm6, %xmm3
	addss	%xmm9, %xmm6
	addss	%xmm10, %xmm3
	addss	%xmm10, %xmm6
	movaps	%xmm3, %xmm8
	movss	24(%rdi,%rax), %xmm3
	addss	%xmm11, %xmm6
	mulss	24(%rsi,%rax), %xmm3
	leaq	4(%r8), %rax
	movaps	%xmm6, %xmm9
	addss	%xmm3, %xmm0
	cmpq	%rax, %r11
	ja	.L55
.L40:
	movss	(%rsi,%rcx,4), %xmm1
	mulss	(%rdi,%rcx,4), %xmm1
	leaq	0(,%rcx,4), %rax
	leaq	1(%rcx), %r8
	addss	%xmm1, %xmm7
	movss	4(%rsi,%rax), %xmm1
	mulss	4(%rdi,%rax), %xmm1
	addss	%xmm1, %xmm5
	movss	8(%rdi,%rax), %xmm1
	mulss	8(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm8
	movss	12(%rdi,%rax), %xmm1
	mulss	12(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm9
	movss	16(%rdi,%rax), %xmm1
	mulss	16(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm0
	cmpq	%r8, %rdx
	jbe	.L39
	movss	(%rdi,%r8,4), %xmm1
	mulss	(%rsi,%r8,4), %xmm1
	leaq	0(,%r8,4), %rax
	addq	$2, %rcx
	addss	%xmm1, %xmm7
	movss	4(%rdi,%rax), %xmm1
	mulss	4(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm5
	movss	8(%rdi,%rax), %xmm1
	mulss	8(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm8
	movss	12(%rdi,%rax), %xmm1
	mulss	12(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm9
	movss	16(%rdi,%rax), %xmm1
	mulss	16(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm0
	cmpq	%rcx, %rdx
	jbe	.L39
	movss	(%rdi,%rcx,4), %xmm1
	mulss	(%rsi,%rcx,4), %xmm1
	leaq	0(,%rcx,4), %rax
	addss	%xmm1, %xmm7
	movss	4(%rdi,%rax), %xmm1
	mulss	4(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm5
	movss	8(%rdi,%rax), %xmm1
	mulss	8(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm8
	movss	12(%rdi,%rax), %xmm1
	mulss	12(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm9
	movss	16(%rdi,%rax), %xmm1
	mulss	16(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm0
.L39:
	addss	%xmm7, %xmm5
	popq	%rbx
	.cfi_def_cfa_offset 8
	movaps	%xmm5, %xmm6
	addss	%xmm8, %xmm6
	addss	%xmm9, %xmm6
	addss	%xmm6, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L41:
	.cfi_restore 3
	pxor	%xmm0, %xmm0
	ret
.L42:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	pxor	%xmm0, %xmm0
	xorl	%r8d, %r8d
	movaps	%xmm0, %xmm9
	movaps	%xmm0, %xmm8
	movaps	%xmm0, %xmm5
	movaps	%xmm0, %xmm7
	jmp	.L37
.L43:
	movq	%r8, %rcx
	jmp	.L40
.L55:
	movss	(%rdi,%rcx,4), %xmm1
	mulss	(%rsi,%rcx,4), %xmm1
	movaps	%xmm10, %xmm4
	addss	%xmm3, %xmm6
	leaq	0(,%rcx,4), %rax
	addss	%xmm5, %xmm4
	movss	16(%rdi,%rax), %xmm12
	mulss	16(%rsi,%rax), %xmm12
	addss	%xmm11, %xmm8
	leaq	6(%r8), %rcx
	movss	20(%rdi,%rax), %xmm2
	mulss	20(%rsi,%rax), %xmm2
	addss	%xmm11, %xmm4
	addss	%xmm7, %xmm1
	movss	4(%rdi,%rax), %xmm7
	mulss	4(%rsi,%rax), %xmm7
	addss	%xmm3, %xmm8
	addss	%xmm12, %xmm6
	addss	%xmm12, %xmm0
	movaps	%xmm4, %xmm5
	addss	%xmm3, %xmm5
	movss	24(%rdi,%rax), %xmm3
	mulss	24(%rsi,%rax), %xmm3
	addss	%xmm12, %xmm8
	addss	%xmm7, %xmm1
	movss	8(%rdi,%rax), %xmm7
	mulss	8(%rsi,%rax), %xmm7
	addss	%xmm2, %xmm6
	addss	%xmm2, %xmm0
	leaq	7(%r8), %rax
	movaps	%xmm6, %xmm9
	addss	%xmm3, %xmm0
	addss	%xmm1, %xmm7
	cmpq	%rax, %r11
	jbe	.L40
	movss	(%rsi,%rcx,4), %xmm1
	mulss	(%rdi,%rcx,4), %xmm1
	addss	%xmm3, %xmm6
	leaq	0(,%rcx,4), %rax
	movss	16(%rsi,%rax), %xmm4
	mulss	16(%rdi,%rax), %xmm4
	addss	%xmm12, %xmm5
	addss	%xmm2, %xmm8
	movss	20(%rdi,%rax), %xmm10
	mulss	20(%rsi,%rax), %xmm10
	leaq	9(%r8), %rcx
	addss	%xmm2, %xmm5
	addss	%xmm3, %xmm8
	addss	%xmm7, %xmm1
	movss	4(%rdi,%rax), %xmm7
	mulss	4(%rsi,%rax), %xmm7
	addss	%xmm4, %xmm6
	addss	%xmm4, %xmm0
	addss	%xmm3, %xmm5
	addss	%xmm4, %xmm8
	addss	%xmm10, %xmm6
	addss	%xmm10, %xmm0
	addss	%xmm7, %xmm1
	movss	8(%rdi,%rax), %xmm7
	mulss	8(%rsi,%rax), %xmm7
	movaps	%xmm6, %xmm9
	addss	%xmm1, %xmm7
	movss	24(%rdi,%rax), %xmm1
	mulss	24(%rsi,%rax), %xmm1
	addss	%xmm1, %xmm0
	jmp	.L40
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
	je	.L61
	cmpq	$1, %rdx
	je	.L62
	movq	%rdx, %rcx
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	shrq	%rcx
	salq	$4, %rcx
	.p2align 4,,10
	.p2align 3
.L59:
	movupd	(%rsi,%rax), %xmm1
	movupd	(%rdi,%rax), %xmm3
	addq	$16, %rax
	mulpd	%xmm3, %xmm1
	addsd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	cmpq	%rax, %rcx
	jne	.L59
	movq	%rdx, %rax
	andq	$-2, %rax
	andl	$1, %edx
	je	.L60
.L58:
	movsd	(%rsi,%rax,8), %xmm1
	mulsd	(%rdi,%rax,8), %xmm1
	addsd	%xmm1, %xmm0
.L60:
	movapd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L61:
	pxor	%xmm0, %xmm0
	ret
.L62:
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	jmp	.L58
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
	je	.L67
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L66:
	movups	(%rdi,%rax,4), %xmm1
	movups	(%rsi,%rax,4), %xmm2
	addq	$1, %rax
	mulps	%xmm2, %xmm1
	addps	%xmm1, %xmm0
	cmpq	%rax, %rdx
	jne	.L66
	ret
	.p2align 4,,10
	.p2align 3
.L67:
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
	movsd	.LC4(%rip), %xmm0
	movapd	.LC3(%rip), %xmm1
	leaq	.LC8(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	movapd	.LC2(%rip), %xmm2
	movl	$1, %edi
	movl	$1, %eax
	movsd	%xmm0, 96(%rsp)
	movsd	%xmm0, 144(%rsp)
	movss	.LC6(%rip), %xmm0
	movaps	%xmm1, 80(%rsp)
	movaps	%xmm1, 128(%rsp)
	movaps	.LC5(%rip), %xmm1
	movss	%xmm0, 16(%rsp)
	movss	%xmm0, 48(%rsp)
	movsd	.LC7(%rip), %xmm0
	movaps	%xmm2, 64(%rsp)
	movaps	%xmm2, 112(%rsp)
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
	movaps	32(%rsp), %xmm0
	mulps	(%rsp), %xmm0
	pxor	%xmm3, %xmm3
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	addss	%xmm0, %xmm3
	movaps	%xmm0, %xmm2
	shufps	$85, %xmm0, %xmm2
	addss	%xmm2, %xmm3
	movaps	%xmm0, %xmm2
	unpckhps	%xmm0, %xmm2
	shufps	$255, %xmm0, %xmm0
	movaps	%xmm2, %xmm1
	addss	%xmm3, %xmm1
	addss	%xmm0, %xmm1
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
	movapd	64(%rsp), %xmm2
	mulpd	112(%rsp), %xmm2
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	movl	$1, %eax
	movsd	144(%rsp), %xmm0
	mulsd	96(%rsp), %xmm0
	leaq	.LC12(%rip), %rsi
	addsd	%xmm2, %xmm1
	unpckhpd	%xmm2, %xmm2
	addsd	%xmm1, %xmm2
	movapd	128(%rsp), %xmm1
	mulpd	80(%rsp), %xmm1
	addsd	%xmm1, %xmm2
	unpckhpd	%xmm1, %xmm1
	addsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movaps	(%rsp), %xmm0
	mulps	32(%rsp), %xmm0
	pxor	%xmm1, %xmm1
	movups	36(%rsp), %xmm4
	movups	40(%rsp), %xmm5
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	movups	44(%rsp), %xmm6
	movl	$1, %eax
	addps	%xmm1, %xmm0
	movups	4(%rsp), %xmm1
	mulps	%xmm4, %xmm1
	addps	%xmm1, %xmm0
	movups	8(%rsp), %xmm1
	mulps	%xmm5, %xmm1
	addps	%xmm1, %xmm0
	movups	12(%rsp), %xmm1
	mulps	%xmm6, %xmm1
	addps	%xmm1, %xmm0
	movaps	16(%rsp), %xmm1
	mulps	48(%rsp), %xmm1
	addps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	__printf_chk@PLT
	movq	152(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L72
	xorl	%eax, %eax
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L72:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE562:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	0
	.long	1072693248
	.long	0
	.long	1073741824
	.align 16
.LC3:
	.long	0
	.long	1074266112
	.long	0
	.long	1074790400
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	0
	.long	1075052544
	.section	.rodata.cst16
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
