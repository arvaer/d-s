	.file	"sort_i.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"sort_i.c"
.LC1:
	.string	"dest"
	.text
	.p2align 4
	.type	copy_i, @function
copy_i:
.LFB41:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L9
	leal	-1(%rdx), %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rdi,%rax,4), %edx
	movl	%edx, (%rsi,%rax,4)
	movq	%rax, %rdx
	addq	$1, %rax
	cmpq	%rdx, %rcx
	jne	.L3
	ret
.L9:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	__PRETTY_FUNCTION__.3227(%rip), %rcx
	movl	$82, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE41:
	.size	copy_i, .-copy_i
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	testq	%rdi, %rdi
	je	.L26
	movl	%esi, %r15d
	movl	%edx, %ebx
	cmpl	%edx, %esi
	jl	.L27
.L10:
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L28
	addq	$72, %rsp
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
.L27:
	.cfi_restore_state
	leal	(%rsi,%rdx), %edx
	movq	%rdi, %r12
	movl	%edx, %ebp
	shrl	$31, %ebp
	addl	%edx, %ebp
	sarl	%ebp
	movl	%ebp, %edx
	call	sort_i
	leal	1(%rbp), %esi
	movl	%ebx, %edx
	movq	%r12, %rdi
	call	sort_i
	cmpl	%ebp, %r15d
	jg	.L29
	cmpl	%ebp, %ebx
	jle	.L30
	movl	%ebp, %r10d
	leaq	40(%rsp), %r14
	movl	%ebx, %r13d
	movq	$0, 40(%rsp)
	subl	%r15d, %r10d
	movq	%r14, %rdi
	subl	%ebp, %r13d
	movq	$0, 48(%rsp)
	leal	2(%r10), %esi
	movl	%r10d, 8(%rsp)
	call	mem_alloc@PLT
	leaq	48(%rsp), %rax
	leal	1(%r13), %esi
	movq	%rax, %rdi
	movq	%rax, (%rsp)
	call	mem_alloc@PLT
	movq	40(%rsp), %rsi
	testq	%rsi, %rsi
	je	.L15
	cmpq	$0, 48(%rsp)
	movl	8(%rsp), %r10d
	je	.L15
	movslq	%r15d, %rcx
	addl	$1, %r10d
	movslq	%ebp, %rbp
	subl	%r15d, %ebx
	leaq	(%r12,%rcx,4), %r9
	movl	%r10d, %edx
	movq	%rcx, 24(%rsp)
	movq	%r9, %rdi
	movl	%r10d, 20(%rsp)
	movq	%r9, 8(%rsp)
	call	copy_i
	movq	48(%rsp), %rsi
	movl	%r13d, %edx
	leaq	4(%r12,%rbp,4), %rdi
	movslq	%r13d, %r13
	call	copy_i
	movq	24(%rsp), %rcx
	movq	40(%rsp), %r8
	xorl	%edx, %edx
	movslq	20(%rsp), %r10
	movq	48(%rsp), %rdi
	xorl	%eax, %eax
	addq	%rcx, %rbx
	movq	8(%rsp), %r9
	movl	$-1, (%r8,%r10,4)
	leaq	4(%r12,%rbx,4), %r10
	movl	$-1, (%rdi,%r13,4)
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L31:
	movl	%esi, (%r9)
	addq	$4, %r9
	addl	$1, %eax
	cmpq	%r9, %r10
	je	.L15
.L19:
	movslq	%eax, %rcx
	movl	(%r8,%rcx,4), %esi
	movslq	%edx, %rcx
	movl	(%rdi,%rcx,4), %ecx
	cmpl	%ecx, %esi
	jbe	.L31
	movl	%ecx, (%r9)
	addq	$4, %r9
	addl	$1, %edx
	cmpq	%r9, %r10
	jne	.L19
.L15:
	movq	%r14, %rdi
	call	mem_free@PLT
	movq	(%rsp), %rdi
	call	mem_free@PLT
	jmp	.L10
.L26:
	leaq	__PRETTY_FUNCTION__.3203(%rip), %rcx
	movl	$33, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L28:
	call	__stack_chk_fail@PLT
.L29:
	leaq	__PRETTY_FUNCTION__.3211(%rip), %rcx
	movl	$46, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
.L30:
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
