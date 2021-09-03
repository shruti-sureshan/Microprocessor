print_str macro x
    mov dx, offset x
    mov ah, 09h
    int 21h
endm

assume cs:code, ds:data
data segment
    strEnter10  DB 10,13,"Enter 10 elements",10,13,'$'
    strAns      DB 10,13,"Sum: ",10,13,'$'
    array       DB 10 DUP(?)
    sum         DB 0
data ends

code segment
start:
    mov ax, data
    mov ds, ax

    print_str strEnter10

    lea bx, array
    xor si, si
    mov cx, 0010

    mov ah, 01h
input1:
    int 21h     ;read one num
    sub al, 30h ;remove ascii

    mov [bx+si], al
    inc si
    loop input1
    ; array has been read

    ; start calculating the sum
    lea bx, array
    xor si, si
    mov cx, 0010

sum1:
    mov al, [bx+si]
    add sum, al
    inc si
    loop sum1

    print_str strAns

    ; convert 8bit hex to bcd
    mov al, sum


    aam           ;unpacks the number and converts into bcd and stores it in ah and al.
    
    
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



last:
    mov ah, 4ch
    int 21h
code ends
end start