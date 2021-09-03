print_8 macro x
    
    ; get higher digit into dl
    mov al, x
    and al, 0f0h
    rol al, 04
    mov dl, al
    add dl, 30h  ; convert to ascii

    mov ah, 02h
    int 21h      ; print left digit

    ; get lower digit into dl
    mov al, x
    and al, 0fh
    mov dl, al
    add dl, 30h

    mov ah, 02h
    int 21h     ; print right digit
endm

data segment
    ; only use nums whose addition is <= 9
    num1 DW 1111H
    num2 DW 0801H
    ans  DW ?
data ends

code segment
assume cs:code, ds:data
start:
    ; init data segment
    mov ax, data
    mov ds, ax

    ; do addition of 16bit
    mov ax, num1
    add ax, num2
    mov ans, ax

    ; print high 8bit of result
    mov bx, ans
    and bx, 0ff00h
    print_8 bh

    ; print lower 8bit of result
    mov bx, ans
    and bx, 00ffh
    print_8 bl


exit:
    mov ah, 4ch
    int 21h
code ends
end start
