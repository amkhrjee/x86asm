.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
arr DWORD 100, 200, 300, 400, 500
.code
main proc

	mov edi, offset arr
	mov ecx, lengthof arr
	mov eax, 0

l1:
	add eax, [edi]
	add edi, type arr
	loop l1

	mov ebx, eax

	invoke ExitProcess,0
main endp
end main
