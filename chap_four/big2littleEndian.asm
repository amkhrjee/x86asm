.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
bigEndian byte 12h, 34h, 56h, 78h
littleEndian dword ?
.code
main proc
	mov ecx, sizeof bigEndian
	mov ebx, 0
	mov edi, offset littleEndian

revcpy:
	mov al, bigEndian[ebx]
	mov [edi + ebx], al
	inc ebx
	loop revcpy

	mov edx, littleEndian

	invoke ExitProcess,0
main endp
end main
