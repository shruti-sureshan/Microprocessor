Print macro x
    mov dx, offset x
    mov ah, 09
    int 21h
endm

get_input macro
    mov ah, 01
    int 21h
    sub al, 30h
    mov bl, al
    int 21h
    sub al, 30h
    rol bl, 04
    add al, bl
endm

data segment
    n1 db ?
    msg1 db, 10, "Enter Hexadecimal Number: $"
    msg2 db, 10, "Decimal Number: $"
    n2 db ?
data ends

code segment
assume cs:code,ds:data
start:  
        mov ax,data
        mov ds,ax

        Print msg1

        get_input
        mov n1, al
        
        Print msg2

        xor ax,ax
        mov al, n1

        aam           ;unpacks the number and stores it in ah and al.
        
        
        mov bl, al    ; store al into bl
        mov cl, ah    ; store ah into cl.

        and cl, 0fh
        add cl, 30h

        mov dx,cx
        mov ah,02
        int 21h

        and bl,0fh
        add bl,30h

        mov dx,bx
        mov ah,02
        int 21h

        
        mov ah,4ch
        int 21h
code ends
end start
