.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
source byte "This is the source string", 0
target byte lengthof source dup('#')
.code
main proc
	mov esi, 0
	mov ecx, lengthof source

revstr:
	mov al, source[esi]
	mov ebx, lengthof source
	sub ebx, esi
	mov target[ebx], al
	add esi, type source
	loop revstr
	
	invoke ExitProcess,0
main endp
end main
