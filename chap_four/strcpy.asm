.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
source byte "hello world", 0
target byte sizeof source dup(0)
.code
main proc
	mov esi, 0
	mov ecx, sizeof source

copyloop:
	mov al, source[esi]
	mov target[esi], al
	inc esi
	loop copyloop
	
	invoke ExitProcess,0
main endp
end main
