section.text:
global _ft_strcpy
; ft_strcmp(dst = rdi, src = rsi)
_ft_strcpy:
	xor rcx, rcx
	xor rdx, rdx
	cmp rsi, 0
	jz 	.return

.copy:
	mov	dl, byte [rsi + rcx]
	mov byte [rdi + rcx], dl
	cmp	dl, 0
	jz	.return
	inc	rcx
	jmp	.copy

.return:
	mov rax, rdi
	ret