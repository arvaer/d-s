	.file	"sort_i.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"sort_i.c"
.LC1:
	.string	"source"
	.text
	.p2align 4
	.type	copy_i.part.0, @function
copy_i.part.0:
.LFB42:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	__PRETTY_FUNCTION__.3227(%rip), %rcx
	movl	$83, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__assert_fail@PLT
	.cfi_endproc
.LFE42:
	.size	copy_i.part.0, .-copy_i.part.0
	.section	.rodata.str1.1
.LC2:
	.string	"A"
.LC3:
	.string	"p <= q"
.LC4:
	.string	"(q + 1) <= r"
	.text
	.p2align 4
	.globl	sort_i
	.type	sort_i, @function
sort_i:
.LFB39:
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L24
	movl	%esi, %ebp
	movl	%edx, %ebx
	cmpl	%edx, %esi
	jl	.L25
.L4:
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L26
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
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
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	.cfi_restore_state
	leal	(%rsi,%rdx), %eax
	movq	%rdi, %r12
	movl	%eax, %r15d
	shrl	$31, %r15d
	addl	%eax, %r15d
	sarl	%r15d
	movl	%r15d, %edx
	call	sort_i
	leal	1(%r15), %esi
	movl	%ebx, %edx
	movq	%r12, %rdi
	call	sort_i
	cmpl	%r15d, %ebp
	jg	.L27
	cmpl	%r15d, %ebx
	jle	.L28
	movl	%r15d, %r9d
	leaq	24(%rsp), %r8
	leaq	32(%rsp), %r14
	movl	%ebx, %r13d
	subl	%ebp, %r9d
	movq	%r8, %rdi
	subl	%r15d, %r13d
	movq	%r8, (%rsp)
	leal	2(%r9), %esi
	movl	%r9d, 12(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 32(%rsp)
	call	mem_alloc@PLT
	leal	1(%r13), %esi
	movq	%r14, %rdi
	call	mem_alloc@PLT
	movq	24(%rsp), %rcx
	movq	(%rsp), %r8
	testq	%rcx, %rcx
	je	.L9
	movq	32(%rsp), %rsi
	movl	12(%rsp), %r9d
	testq	%rsi, %rsi
	je	.L9
	movslq	%r9d, %rax
	movslq	%ebp, %rdi
	xorl	%edx, %edx
	leaq	4(,%rax,4), %r11
	leaq	(%r12,%rdi,4), %rax
	.p2align 4,,10
	.p2align 3
.L11:
	movl	(%rax,%rdx), %r10d
	movl	%r10d, (%rcx,%rdx)
	addq	$4, %rdx
	cmpq	%rdx, %r11
	jne	.L11
	movslq	%r15d, %r15
	leal	-1(%r13), %r11d
	xorl	%edx, %edx
	leaq	4(%r12,%r15,4), %r15
	.p2align 4,,10
	.p2align 3
.L12:
	movl	(%r15,%rdx,4), %r10d
	movl	%r10d, (%rsi,%rdx,4)
	movq	%rdx, %r10
	addq	$1, %rdx
	cmpq	%r11, %r10
	jne	.L12
	addl	$1, %r9d
	subl	%ebp, %ebx
	movslq	%r13d, %r13
	xorl	%edx, %edx
	addq	%rdi, %rbx
	movslq	%r9d, %r9
	xorl	%edi, %edi
	movl	$-1, (%rcx,%r9,4)
	leaq	4(%r12,%rbx,4), %r11
	movl	$-1, (%rsi,%r13,4)
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L29:
	movl	%r10d, (%rax)
	addq	$4, %rax
	addl	$1, %edx
	cmpq	%r11, %rax
	je	.L9
.L15:
	movslq	%edx, %r9
	movl	(%rcx,%r9,4), %r10d
	movslq	%edi, %r9
	movl	(%rsi,%r9,4), %r9d
	cmpl	%r9d, %r10d
	jbe	.L29
	movl	%r9d, (%rax)
	addq	$4, %rax
	addl	$1, %edi
	cmpq	%r11, %rax
	jne	.L15
.L9:
	movq	%r8, %rdi
	call	mem_free@PLT
	movq	%r14, %rdi
	call	mem_free@PLT
	jmp	.L4
.L24:
	leaq	__PRETTY_FUNCTION__.3203(%rip), %rcx
	movl	$33, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L26:
	call	__stack_chk_fail@PLT
.L27:
	leaq	__PRETTY_FUNCTION__.3211(%rip), %rcx
	movl	$46, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
.L28:
	leaq	__PRETTY_FUNCTION__.3211(%rip), %rcx
	movl	$47, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE39:
	.size	sort_i, .-sort_i
	.section	.rodata
	.type	__PRETTY_FUNCTION__.3227, @object
	.size	__PRETTY_FUNCTION__.3227, 7
__PRETTY_FUNCTION__.3227:
	.string	"copy_i"
	.align 8
	.type	__PRETTY_FUNCTION__.3211, @object
	.size	__PRETTY_FUNCTION__.3211, 8
__PRETTY_FUNCTION__.3211:
	.string	"merge_i"
	.type	__PRETTY_FUNCTION__.3203, @object
	.size	__PRETTY_FUNCTION__.3203, 7
__PRETTY_FUNCTION__.3203:
	.string	"sort_i"
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
