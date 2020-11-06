section.text:
global _ft_strdup
; ft_strdup(s1 = rdi)
extern _malloc
extern ___error
extern _ft_strlen

_ft_strdup:
	xor		rdx, rdx
	xor		rcx, rcx
	call	_ft_strlen
	add		rax, 1
	push	rdi
	mov		rdi, rax
	call	_malloc
	jc		.error_mem
	pop		rdi
	jmp		.copy

.copy:
	mov	dl, byte [rdi + rcx]
	mov byte [rax + rcx], dl
	cmp	dl, 0
	jz	.return
	inc	rcx
	jmp	.copy

.error_mem:
	pop		rdi
	push	rbx
	mov		rdx, 12
	call	___error
	mov     [rax], rdx
	mov		rax, 0
	pop		rbx
	ret

.return:
	ret