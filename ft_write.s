section.text:
global _ft_write
; ft_write(fildes = rdi, buf = rsi, nbyte = rdx)
extern ___error

_ft_write:
	push	rbx
	mov		rax, 0x2000004
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
	ret

.return:
	ret



	

