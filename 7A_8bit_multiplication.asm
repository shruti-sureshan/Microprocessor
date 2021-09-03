Print macro x
    mov dx, offset x
    mov ah, 09
    int 21h
endm

get_bit macro
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
    n2 db ?
    msg1 db,10, "Enter number 1 $"
    msg2 db,10, "Enter number 2 $"
    msg3 db,10, "Product = $"
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

        xor bx,bx

        mov bl,n1
        and bl,0f0h
        rol bl,04
        mov ah,bl

        mov bl,n1
        and bl,0fh
        mov al,bl
        aad
        mov bl,al

        mov cl,n2
        and cl,0f0h
        rol cl,04
        mov ah,cl

        mov cl,n2
        and cl,0fh
        mov al,cl
        aad
        mov cl,al

        xor dx,dx
        mul bl
        aam
        mov cl,al
        mov al,ah
        xor ah,ah
        aam
        
        mov dl,ah
        mov bl,al
        add dl,30h
        mov ah,02
        int 21h

        mov dl,bl
        add dl,30h
        mov ah,02
        int 21h

        mov dl,cl
        add dl,30h
        mov ah,02
        int 21h
        jmp last

 
last:   mov ah,4ch
        int 21h

code ends
end start
