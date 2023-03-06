.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
arr byte 1, 2, 3, 4, 5, 6, 7, 8
.code
main proc
	mov edi, 0
	mov ecx, lengthof arr/2

revloop:
	mov al, arr[edi]
	mov ebx, lengthof arr
	sub ebx, edi
	xchg al, arr[ebx]
	mov arr[edi], al
	inc edi
	loop revloop

	invoke ExitProcess,0
main endp
end main
