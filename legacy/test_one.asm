.model small
.stack 10h
.data
msg db 0ah, 0dh, 'Enter your name: $'
naam db 50 dup('$')
greeting db 0ah, 0dh, 'Welcome $'
buffer db 50 dup('$')
.code
mov ax, @data
mov ds, ax

start:
lea dx, msg   ; Display prompt message
mov ah, 09H
int 21h

lea DX, naam  ; Read user input
mov AH, 0ah
int 21h

mov si, OFFSET naam + 2  ; Point SI to the start of the name

read_loop:
    lodsb         ; Load a character from SI into AL
    cmp al, '$'   ; Check if the character is '$'
    je display_char    ; If '$' is found, jump to display greeting
    cmp al, 0dh   ; Check if the character is a carriage return
    je display_char  ; If carriage return is found, jump to display greeting

    mov [buffer], al  ; Store the character in a buffer
    inc buffer       ; Move to the next position in the buffer
    jmp read_loop    ; Continue reading characters

display_char:
    lea dx, greeting
    mov ah, 09h
    int 21h

    lea dx, naam + 2
    mov ah, 09h
    int 21h

terminate:
    mov ah, 04CH   ; Terminate the program
    int 21h
    end
