.model small
.stack 10h
.data
numarr dw 20, 30, 40, 10
.code
mov ax, @data
mov ds, ax

xor dx, dx 
xor ax, ax 

lea bx, [numarr] 

; bubble sort the array 

mov cx, 3
outer_loop:
    mov si, 0
    mov dx, cx
inner_loop:
    mov ax, [bx + si]
    cmp ax, [bx + si + 2]
    jle skip_swap
    
    xchg ax, [bx + si + 2] 
    mov [bx + si], ax

skip_swap:
    add si, 2
    dec dx 
    jnz inner_loop  
    loop outer_loop

mov si, 0 
mov cx, 4
print_arr:
    mov ax, [bx + si] 
    push si 
    push cx
    push bx
    call print_num 
    pop bx
    pop cx 
    pop si
    add si, 2
    
    mov dl, 10 
    mov ah, 02h 
    int 21h 
    mov dl, 13 
    mov ah, 02h 
    int 21h
    loop print_arr 

jmp terminate

print_num proc 
    mov bx, 10 
    xor cx, cx 
count_digits:
    xor dx, dx
    div bx 
    push dx 
    inc cx
    cmp ax, 0 
    jne count_digits 
print_digits: 
    pop dx
    add dl, 30h 
    mov ah, 02h 
    int 21h 
    loop print_digits  
    ret
print_num endp 


terminate:
    mov ah, 04ch
    int 21h 
    end 
