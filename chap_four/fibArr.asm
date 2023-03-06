.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
fibArr byte 7 dup(0)
.code
main proc
	mov al, 0
	mov bl, 1
	mov edi, 0
	mov ecx, lengthof fibArr
	mov fibArr[edi], al
	inc edi
	mov fibArr[edi], bl
	inc edi

fibloop:
	mov dl, al
	mov al, bl
	add bl, dl
	mov fibArr[edi], bl
	inc edi
	loop fibloop

	invoke ExitProcess,0
main endp
end main
