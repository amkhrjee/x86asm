.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
arr word 120, 2, 5, 9, 10
darr dword lengthof arr dup(0)
.code
main proc
	mov edi, 0
	mov ebx, 0
	mov ecx, lengthof arr
	mov eax, 0

cpyloop:
	mov ax, arr[edi]
	mov darr[ebx], eax
	add edi, type arr
	add ebx, type darr
	loop cpyloop

	invoke ExitProcess,0
main endp
end main
