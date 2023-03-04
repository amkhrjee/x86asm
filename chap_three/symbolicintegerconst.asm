.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
monday equ 0
tuesday equ 1
wednesday equ 2
thursday equ 3
friday equ 4
saturday equ 5
sunday equ 6

weeks byte monday, tuesday, wednesday, thursday, friday, saturday, sunday
weekLength = ($ - weeks) ;

.code
main proc
	mov ebx, $
	; there is  50 bytes under the label week
	; when we divide that by the size of each element that is 8, we get 50/8 = 6
	;mov ecx, weeks
	mov eax, weekLength
	mov cx, 0

	invoke ExitProcess,0
main endp
end main
