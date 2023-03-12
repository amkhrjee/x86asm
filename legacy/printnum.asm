.model small
.data 
num dw 1234
.code
mov ax, @data
mov ds, ax

mov ax, num
mov cx, 10

numloop:
	cmp ax, 0
	je terminate

	xor dx, dx ; clearing the register
	div cx
	mov bx, ax

	add dl, 030h
	mov ah, 02h
	int 21h

	mov ax, bx
	jmp numloop

terminate:
	mov ah, 04ch
	int 21h
	end
