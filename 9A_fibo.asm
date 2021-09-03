data segment
    fibArr  DB 25 DUP(0)
    fibLen  DW 11
data ends

code segment
assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax

    mov cx, fibLen
    lea si, fibArr
    
    mov al, 00            ; intialize first number 0.
    mov [si], al
    inc si

    mov bl, 01            ; intialize second number 1.
    mov [si], bl
    inc si

next:
    add al, bl
    mov [si], al          ;
    mov al, bl            ; <-- after adding change values of al and bl.
    mov bl, [si]          ;
    inc si
    loop next

print_arr:
    xor si, si
    lea si, fibArr
    mov cx, fibLen

    mov ah, 00
back:
    mov al, [si]
    aam
    mov bx, ax
    add bx, 3030h      ; add 30h into bh and bl.
    mov dl, bh
    mov ah, 02h
    int 21h

    mov dl, bl
    mov ah, 02h
    int 21h

    mov dl, ','
    mov ah, 02h
    int 21h

    inc si
    loop back


exit:
    mov ah, 4ch
    int 21h
code ends
end start