	.file	"factorial.cpp"
	.text
	.p2align 4,,15
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB2085:
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	jmp	_ZNSt8ios_base4InitD1Ev
	.seh_endproc
	.p2align 4,,15
	.globl	_Z9factoriali
	.def	_Z9factoriali;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9factoriali
_Z9factoriali:
.LFB1594:
	subq	$56, %rsp
	.seh_stackalloc	56
	movaps	%xmm6, (%rsp)
	.seh_savexmm	%xmm6, 0
	movaps	%xmm7, 16(%rsp)
	.seh_savexmm	%xmm7, 16
	movaps	%xmm8, 32(%rsp)
	.seh_savexmm	%xmm8, 32
	.seh_endprologue
	xorl	%eax, %eax
	testl	%ecx, %ecx
	js	.L3
	je	.L10
	movl	$1, %r8d
	cmovg	%ecx, %r8d
	cmpl	$6, %ecx
	jle	.L11
	movl	%r8d, %edx
	pxor	%xmm7, %xmm7
	movdqa	.LC0(%rip), %xmm4
	movdqa	.LC1(%rip), %xmm3
	shrl	$2, %edx
	movdqa	.LC2(%rip), %xmm8
	.p2align 4,,10
.L7:
	movdqa	%xmm7, %xmm0
	movdqa	%xmm3, %xmm5
	movdqa	%xmm3, %xmm6
	pcmpgtd	%xmm3, %xmm0
	addl	$1, %eax
	paddd	%xmm8, %xmm3
	cmpl	%edx, %eax
	punpckldq	%xmm0, %xmm5
	punpckhdq	%xmm0, %xmm6
	movdqa	%xmm5, %xmm1
	movdqa	%xmm6, %xmm0
	psrlq	$32, %xmm1
	movdqa	%xmm5, %xmm2
	psrlq	$32, %xmm0
	pmuludq	%xmm5, %xmm0
	pmuludq	%xmm6, %xmm1
	pmuludq	%xmm6, %xmm2
	paddq	%xmm0, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm2, %xmm1
	movdqa	%xmm4, %xmm2
	movdqa	%xmm1, %xmm0
	psrlq	$32, %xmm2
	movdqa	%xmm1, %xmm5
	psrlq	$32, %xmm0
	pmuludq	%xmm4, %xmm0
	pmuludq	%xmm2, %xmm1
	pmuludq	%xmm4, %xmm5
	paddq	%xmm1, %xmm0
	psllq	$32, %xmm0
	movdqa	%xmm5, %xmm4
	paddq	%xmm0, %xmm4
	jne	.L7
	movdqa	%xmm4, %xmm3
	movdqa	%xmm4, %xmm1
	movdqa	%xmm4, %xmm2
	psrldq	$8, %xmm3
	movl	%r8d, %r9d
	movdqa	%xmm3, %xmm0
	psrlq	$32, %xmm1
	andl	$-4, %r9d
	psrlq	$32, %xmm0
	leal	1(%r9), %edx
	cmpl	%r9d, %r8d
	pmuludq	%xmm3, %xmm1
	pmuludq	%xmm4, %xmm0
	pmuludq	%xmm3, %xmm2
	paddq	%xmm0, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm2, %xmm1
	movq	%xmm1, %rax
	je	.L3
.L5:
	movslq	%edx, %r8
	imulq	%r8, %rax
	leal	1(%rdx), %r8d
	cmpl	%r8d, %ecx
	jl	.L3
	movslq	%r8d, %r8
	imulq	%r8, %rax
	leal	2(%rdx), %r8d
	cmpl	%r8d, %ecx
	jl	.L3
	movslq	%r8d, %r8
	imulq	%r8, %rax
	leal	3(%rdx), %r8d
	cmpl	%r8d, %ecx
	jl	.L3
	movslq	%r8d, %r8
	imulq	%r8, %rax
	leal	4(%rdx), %r8d
	cmpl	%r8d, %ecx
	jl	.L3
	movslq	%r8d, %r8
	addl	$5, %edx
	imulq	%r8, %rax
	cmpl	%edx, %ecx
	jl	.L3
	movslq	%edx, %rdx
	imulq	%rdx, %rax
.L3:
	movaps	(%rsp), %xmm6
	movaps	16(%rsp), %xmm7
	movaps	32(%rsp), %xmm8
	addq	$56, %rsp
	ret
	.p2align 4,,10
.L10:
	movl	$1, %eax
	jmp	.L3
.L11:
	movl	$1, %eax
	movl	$1, %edx
	jmp	.L5
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC3:
	.ascii "Enter a positive integer: \0"
.LC4:
	.ascii "Factorial of \0"
.LC5:
	.ascii " is \0"
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1595:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$96, %rsp
	.seh_stackalloc	96
	movaps	%xmm6, 48(%rsp)
	.seh_savexmm	%xmm6, 48
	movaps	%xmm7, 64(%rsp)
	.seh_savexmm	%xmm7, 64
	movaps	%xmm8, 80(%rsp)
	.seh_savexmm	%xmm8, 80
	.seh_endprologue
	call	__main
	movq	.refptr._ZSt4cout(%rip), %rcx
	leaq	.LC3(%rip), %rdx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	.refptr._ZSt3cin(%rip), %rcx
	leaq	44(%rsp), %rdx
	call	_ZNSirsERi
	movq	.refptr._ZSt4cout(%rip), %rcx
	movl	$13, %r8d
	leaq	.LC4(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	44(%rsp), %edx
	movq	.refptr._ZSt4cout(%rip), %rcx
	call	_ZNSolsEi
	movl	$4, %r8d
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	44(%rsp), %r8d
	xorl	%edx, %edx
	testl	%r8d, %r8d
	js	.L13
	je	.L19
	movl	$1, %ecx
	cmovg	%r8d, %ecx
	cmpl	$6, %r8d
	jle	.L20
	movl	%ecx, %edx
	xorl	%eax, %eax
	pxor	%xmm7, %xmm7
	movdqa	.LC0(%rip), %xmm2
	movdqa	.LC1(%rip), %xmm3
	shrl	$2, %edx
	movdqa	.LC2(%rip), %xmm8
	.p2align 4,,10
.L16:
	movdqa	%xmm7, %xmm0
	movdqa	%xmm3, %xmm5
	movdqa	%xmm3, %xmm6
	pcmpgtd	%xmm3, %xmm0
	addl	$1, %eax
	paddd	%xmm8, %xmm3
	cmpl	%edx, %eax
	punpckldq	%xmm0, %xmm5
	punpckhdq	%xmm0, %xmm6
	movdqa	%xmm5, %xmm1
	movdqa	%xmm6, %xmm4
	psrlq	$32, %xmm1
	movdqa	%xmm5, %xmm0
	psrlq	$32, %xmm4
	pmuludq	%xmm5, %xmm4
	pmuludq	%xmm6, %xmm1
	pmuludq	%xmm6, %xmm0
	paddq	%xmm4, %xmm1
	movdqa	%xmm2, %xmm4
	psllq	$32, %xmm1
	paddq	%xmm0, %xmm1
	psrlq	$32, %xmm4
	movdqa	%xmm1, %xmm0
	movdqa	%xmm1, %xmm5
	psrlq	$32, %xmm0
	pmuludq	%xmm2, %xmm0
	pmuludq	%xmm4, %xmm1
	pmuludq	%xmm2, %xmm5
	paddq	%xmm1, %xmm0
	psllq	$32, %xmm0
	movdqa	%xmm5, %xmm2
	paddq	%xmm0, %xmm2
	jne	.L16
	movdqa	%xmm2, %xmm4
	movdqa	%xmm2, %xmm1
	movdqa	%xmm2, %xmm3
	psrldq	$8, %xmm4
	movl	%ecx, %r9d
	movdqa	%xmm4, %xmm0
	psrlq	$32, %xmm1
	andl	$-4, %r9d
	psrlq	$32, %xmm0
	leal	1(%r9), %eax
	cmpl	%r9d, %ecx
	pmuludq	%xmm4, %xmm1
	pmuludq	%xmm2, %xmm0
	pmuludq	%xmm4, %xmm3
	paddq	%xmm0, %xmm1
	psllq	$32, %xmm1
	paddq	%xmm3, %xmm1
	movq	%xmm1, %rdx
	je	.L13
.L14:
	movslq	%eax, %rcx
	imulq	%rcx, %rdx
	leal	1(%rax), %ecx
	cmpl	%ecx, %r8d
	jl	.L13
	movslq	%ecx, %rcx
	imulq	%rcx, %rdx
	leal	2(%rax), %ecx
	cmpl	%ecx, %r8d
	jl	.L13
	movslq	%ecx, %rcx
	imulq	%rcx, %rdx
	leal	3(%rax), %ecx
	cmpl	%ecx, %r8d
	jl	.L13
	movslq	%ecx, %rcx
	imulq	%rcx, %rdx
	leal	4(%rax), %ecx
	cmpl	%ecx, %r8d
	jl	.L13
	movslq	%ecx, %rcx
	addl	$5, %eax
	imulq	%rcx, %rdx
	cmpl	%eax, %r8d
	jl	.L13
	cltq
	imulq	%rax, %rdx
.L13:
	movq	%rbx, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	movq	%rax, %rcx
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	nop
	movaps	48(%rsp), %xmm6
	xorl	%eax, %eax
	movaps	64(%rsp), %xmm7
	movaps	80(%rsp), %xmm8
	addq	$96, %rsp
	popq	%rbx
	ret
.L19:
	movl	$1, %edx
	jmp	.L13
.L20:
	movl	$1, %edx
	movl	$1, %eax
	jmp	.L14
	.seh_endproc
	.p2align 4,,15
	.def	_GLOBAL__sub_I__Z9factoriali;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I__Z9factoriali
_GLOBAL__sub_I__Z9factoriali:
.LFB2086:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitC1Ev
	leaq	__tcf_0(%rip), %rcx
	addq	$40, %rsp
	jmp	atexit
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I__Z9factoriali
.lcomm _ZStL8__ioinit,1,1
	.section .rdata,"dr"
	.align 16
.LC0:
	.quad	1
	.quad	1
	.align 16
.LC1:
	.long	1
	.long	2
	.long	3
	.long	4
	.align 16
.LC2:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSirsERi;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIyEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt3cin, "dr"
	.globl	.refptr._ZSt3cin
	.linkonce	discard
.refptr._ZSt3cin:
	.quad	_ZSt3cin
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
