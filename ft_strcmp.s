section.text:
global _ft_strcmp
; ft_strcmp(s1 = rdi, s2 = rsi)
_ft_strcmp:
	xor rdx, rdx
	xor rcx, rcx
	xor rax, rax

.loop:
	mov al, byte [rdi + rcx]
	mov dl, byte [rsi + rcx]
	cmp al, dl
	jg .grater
	jb .less
	cmp al, 0
	jz .equal
	inc rcx
	jmp .loop

.equal:
	mov rax, 0
	ret

.less:
	mov rax, -1
	ret

.grater:
	mov rax, 1
	ret
