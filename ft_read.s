section.text:
global _ft_read
; ft_read(fildes = rdi, buf = rsi, nbyte = rdx)
extern ___error

_ft_read:
	push	rbx
	mov 	rax, 0x2000003
	syscall
	jc		.error
	pop		rbx
	jmp		.return

.error:
	mov		rdx, rax
	call	___error
	mov     [rax], rdx
	mov		rax, -1
	pop		rbx
	jmp		.return

.return:
	ret