section.text:
global _ft_strlen
; ft_strlen(s = rdi)
_ft_strlen:
	xor rax, rax

.loop:
	cmp byte [rdi + rax], 0
	jz .return
	inc rax
	jmp	.loop

.return:
	ret
