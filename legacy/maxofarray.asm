.model small
.data
array dw 10, 20, 30, 40
maxstr db 'Max: $'
.stack 10h
.code
mov ax, @data
mov ds, ax

; get the max of the array elements 
xor ax, ax
xor dx, dx

lea bx, array
mov cx, 4
mov si, 0
sumloop:
    mov ax, [bx + si]
    cmp ax, dx
    jge replace
    add si, 2
    loop sumloop
replace:
    mov dx, ax
    add si, 2
    loop sumloop
mov bx, dx

;print "Sum: "
xor dx, dx
lea dx, [maxstr]
mov ah, 09h
int 21h 
mov ax, bx

call print_num
jmp terminate

print_num proc
    mov bx, 10 ;divisor for converting to ASCII
    xor cx, cx
count_digits:
    xor dx, dx
    div bx
    push dx ;push the digit to the stack
    inc cx ; increment digit counter
    cmp ax, 0
    jne count_digits
print_digits:
    pop dx
    add dl, 30h ;convert to ascii
    mov ah, 02h
    int 21h
    loop print_digits
    ret
print_num endp


terminate:
mov ah, 04ch
int 21h
end
