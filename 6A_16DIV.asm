data segment
	num1 dw 4444h
	num2 dw 0002h
	qu dd 2 dup(?)
	rem dd 2 dup(?)
data ends

code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        mov ax,num1
        mov bx,num2
        div bx
        mov word ptr qu,ax
        mov word ptr rem,dx   
        mov ah,4ch
        int 21h  
code ends
end start