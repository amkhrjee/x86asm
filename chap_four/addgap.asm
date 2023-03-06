.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
arr dword 0, 2, 5, 9, 10
.code
main proc
	mov edi, 0
	mov ecx, lengthof arr
	dec ecx
	mov eax, 0

gaploop:
	mov ebx, arr[edi]
	mov edx, arr[edi + type arr]
	sub edx, ebx
	add eax, edx
	add edi, type arr
	loop  gaploop

	mov edx, eax
	invoke ExitProcess,0
main endp
end main
