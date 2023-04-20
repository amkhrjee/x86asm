; Draws lines with star pattern depending on the value in the AX register
; Example: AX = 3
;		*
;	*		*
;*		*		*
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.model small
.stack 10h
.data
.code
mov ax, @data
mov ds, ax

xor ax, ax
mov ax, 05h
call draw_stars
jmp terminate
draw_stars proc
	inc ax
	mov bx, 1
pattern:
	cmp ax, bx
	jle done
	mov cx, ax
	sub cx, bx
	push ax
gaps:
		mov dl, 020h
		mov ah, 02h
		int 21h
		loop gaps
last_line:
		xor cx, cx
		mov cx, bx
stars_line:
		mov dl, 02ah
		mov ah, 02h
		int 21h
		mov dl, 020h
		mov ah, 02h
		int 21h
		loop stars_line
	
		; carriage return 
		mov dl, 10 
		mov ah, 02h
		int 21h

		; line feed
		mov dl, 13
		mov ah, 02h
		int 21h
	pop ax
	inc bx
	jmp pattern
done:
    ret
draw_stars endp

terminate:
    mov ah, 04ch
    int 21h
    end

