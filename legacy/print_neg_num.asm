.model small
.stack 100h
.data
.code
mov ax, @data
mov ds, ax

mov ax, -100
call printnum
jmp terminate
printnum proc

    ;xor di, di
    mov cx, ax
    shl ax, 1
    jc handle_negative
    mov di, 0
    mov ax, cx
    jmp handle_positive

handle_negative:
    mov di, 1
    mov ax, cx
    neg ax
    jmp handle_positive

handle_positive:
    mov bx, 10
    xor cx, cx

count_digits:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne count_digits
    cmp di, 1
    je print_neg
    jmp print_positive

print_neg:
    mov dl, '-'
    mov ah, 02h
    int 21h

print_positive:
    pop dx
    add dl, 30h
    mov ah, 02h
    int 21h
    loop print_positive

    ret
printnum endp

terminate:
mov ah, 04ch
int 21h
end
