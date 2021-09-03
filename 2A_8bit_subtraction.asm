Print macro x
    mov dx, offset x
    mov ah, 09
    int 21h
endm

get_bit macro
    mov ah,01
    int 21h
    sub al,30h
    mov bl,al
    int 21h
    sub al,30h
    rol bl,04
    add al,bl
endm    

data segment
    n1 db ?
    n2 db ?
    msg1 db,10, "Enter number 1 $"
    msg2 db,10, "Enter number 2 $"
    msg3 db,10, "Subtraction S= $"
data ends

code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax

        Print msg1

        get_bit
        mov n1,al

        Print msg2

        get_bit
        mov n2,al
 
        Print msg3

        xor ax,ax

        mov al,n1
        sub al,n2
        das
        mov bx,ax

        mov cl,bl               
        rol cl,04               

        and cl,0fh
        add cl,30h

        mov dx,cx
        mov ah,02
        int 21h

        and bl,0fh
        add bl,30h

        mov dx,bx
        mov ah,02
        int 21h
        jmp last

last:   mov ah,4ch
        int 21h

code ends
end start
