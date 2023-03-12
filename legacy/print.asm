.model small
.data 
str1 db 'Hello$'
str2 db 0dh, 0ah, 'how are you my friend?$'
.code
mov ax, @data
mov ds, ax

lea dx, str1
mov ah, 09h
int 21h

; print a string to the stdout
lea dx, str2
mov ah, 09h
int 21h

; print a single character to the stdout
mov dl, 65
mov ah, 02h
int 21h


mov ah, 04ch
int 21h
end
