.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
.data
arr word 10, 20, 30, 40
.code
main proc
		mov eax, lengthof arr
		dec eax
		mov esi, eax ; esi = 3
		mov dx, arr[esi*2]
		dec esi
		mov ecx, 3
		mov ebx, 0
	rloop:
		mov bx, arr[esi*2]
		mov arr[esi*2 + type arr], bx
		dec esi
		loop rloop
	
		;now work on the terminals
		mov arr[0], dx ; A_0 <- A_3

		invoke ExitProcess,0
main endp
end main
