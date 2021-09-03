Print macro x
    mov dx, offset x
    mov ah, 09
    int 21h
endm

get_input macro x
    ;  x is an 8 bit register.
    mov ah, 01

    int 21h       ; getting higher byte
    sub al, 30h   ; getting ascii equivalent.

    mov bl, al    ; saving lower nibble temporarily

    int 21h
    sub al, 30h   ; getting lower byte in ascii

    mov ah, bl
    aad           ; bcd in ah and al to hexa in al
    mov x, al
endm

print_bit macro x
    mov dl, x
    add dl, 30h
    mov ah, 02
    int 21h
endm

data segment
    n1 db 0
    array db 10 dup(?)
    msg db, 10, "Enter Number: $"
data ends

code segment
assume cs:code, ds:data
start:
        mov ax, data
        mov ds, ax

        Print msg
        get_input n1
        
        lea bx, array
        xor si, si
        mov cl, n1       ; init start to n1

    L1:     mov bx[si], cl
            inc si

            xor ah, ah
            mov al, cl
            aam

            mov ch, al
            mov dl, ah
            mov ah, 02
            add dl, 30h
            int 21h

            mov dl,ch
            add dl,30h
            int 21h

            ; printing a space:
            mov dl, 20h
            int 21h

            xor ch,ch

            dec cl
            cmp cl, 00
            jnz L1

    last:   mov ah, 4ch
            int 21h
code ends
end start


