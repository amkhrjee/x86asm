.model small
.data
str1 db 'hello world$'
str2 db 'Number of characters: $'
.code
mov ax, @data
mov ds, ax
lea bx, str1
mov cx, 11
mov si, 0
disloop:
	mov dl, [bx + si]
	mov ah, 02h
	int 21h
	; carriage return 
	mov dl, 10 
	mov ah, 02h
	int 21h
	; line feed
	mov dl, 13
	mov ah, 02h
	int 21h

	inc si
	loop disloop

;lea dx, str2
;mov ah, 09h
;int 21h

;mov dl, 0bh + 02fh
;mov ah, 02h
;int 21h
terminate:
	mov ah, 04ch
	int 21h
	end
