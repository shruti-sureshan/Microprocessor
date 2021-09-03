data segment
	num1 dw 68c8h
	num2 dw 8989h
	diff dw 2 dup(?)
data ends


code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        mov ax,num1
        sub ax,num2
        sbb bx,00h
        mov diff,ax
        mov ah,4ch
        int 21h
code ends
end start
