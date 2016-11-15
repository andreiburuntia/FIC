	.file	"program.c"
	.section	.rodata
.LC0:
	.string	"error opening file1"
.LC1:
	.string	"error opening file2"
.LC2:
	.string	"%d\n"
.LC3:
	.string	"%s/info"
.LC4:
	.string	"\n%s\n\n"
.LC5:
	.string	"return value of creat: %d\n"
	.align 8
.LC6:
	.string	"filename: %s\nsize: %lld\ndate: %lld\n"
.LC7:
	.string	"\nstuff: %s\n"
	.align 8
.LC8:
	.string	"%d bytes printed in info file\n"
.LC9:
	.string	"file1 closing failed"
.LC10:
	.string	"info file closing failed"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open
	movl	%eax, -28(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movl	$1025, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	open
	movl	%eax, -24(%rbp)
	cmpl	$0, -28(%rbp)
	jns	.L2
	movl	$.LC0, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$1, %eax
	jmp	.L3
.L2:
	cmpl	$0, -24(%rbp)
	jns	.L4
	movl	$.LC1, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$1, %eax
	jmp	.L3
.L4:
	movl	$30, %edi
	call	malloc
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rcx
	movl	-28(%rbp), %eax
	movl	$30, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movl	%eax, -20(%rbp)
	movl	$.LC2, %eax
	movl	-20(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-64(%rbp), %rcx
	movl	-24(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -16(%rbp)
	movl	$.LC2, %eax
	movl	-16(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$144, %edi
	call	malloc
	movq	%rax, -56(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	-56(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	stat
	movl	%eax, -12(%rbp)
	movl	$50, %edi
	call	malloc
	movq	%rax, -48(%rbp)
	movq	-80(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rcx
	movl	$.LC3, %edx
	movq	-48(%rbp), %rax
	movl	$50, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
	movl	$.LC4, %eax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	-48(%rbp), %rax
	movl	$448, %esi
	movq	%rax, %rdi
	call	creat
	movl	%eax, -8(%rbp)
	movl	$.LC5, %eax
	movl	-8(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$500, %edi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-56(%rbp), %rax
	movq	104(%rax), %rdi
	movq	-56(%rbp), %rax
	movq	48(%rax), %rsi
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rcx
	movl	$.LC6, %edx
	movq	-40(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$500, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
	movl	$.LC7, %eax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movq	-40(%rbp), %rcx
	movl	-8(%rbp), %eax
	movl	$500, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -4(%rbp)
	movl	$.LC8, %eax
	movl	-4(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	call	close
	cmpl	$-1, %eax
	jne	.L5
	movl	$.LC9, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
.L5:
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	close
	cmpl	$-1, %eax
	jne	.L6
	movl	$.LC9, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
.L6:
	movl	-8(%rbp), %eax
	movl	%eax, %edi
	call	close
	cmpl	$-1, %eax
	jne	.L7
	movl	$.LC10, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
.L7:
	movl	$0, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
