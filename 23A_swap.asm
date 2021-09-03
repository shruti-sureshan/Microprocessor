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

display_output macro bl
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
endm

data segment
    n1 db ?
    n2 db ?
    msg1 db, 10, "Enter Number 1: $"
    msg2 db, 10, "Enter Number 2: $"
    msg3 db, 10, "After Swapping: $"
    msg4 db, 10, "Number 1: $"
    msg5 db, 10, "Number 2: $"
data ends

code segment
assume cs:code, ds:data

start: 
        mov ax, data
        mov ds, ax

        Print msg1

        get_input
        mov n1, al

        Print msg2
        
        get_input
        mov n2, al

        call Swap
        
        Print msg4
        mov bl, n1
        display_output bl
        
        Print msg5
        mov bl, n2
        display_output bl
        
        jmp last

        Swap proc
            mov al, n1
            mov bl, n2
            
            xor cx, cx
            mov cl, al
            
            xor ax, ax
            mov al, bl
            
            xor bx, bx
            mov bl, cl
            
            mov n1, al
            mov n2, bl
            
            ret
        endp

    last: mov ah, 4ch
          int 21h

code ends
end start
    