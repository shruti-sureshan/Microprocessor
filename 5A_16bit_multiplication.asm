data segment
	num1 dw 1234h
	num2 dw 5678h
	m dw 2 dup(?)
data ends

code segment
assume cs:code, ds:data
start:
		mov ax, data
		mov ds, ax

		mov ax, num1
		mov bx, num2
		mul bx
		mov word ptr m, ax
		mov word ptr m+2, dx
		mov ah,4ch
		int 21h
code ends
end start