.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
arr byte 11h, 22h, 33h, 44h
.code
main proc
	mov edi, 0
	mov ecx, sizeof arr
	dec ecx ; we don't need to go till the end

exchpair:
	mov al, arr[edi]
	xchg al, arr[edi + 1]
	mov arr[edi], al
	add edi, 2
	loop exchpair

	invoke ExitProcess,0
main endp
end main
