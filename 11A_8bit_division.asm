print_str macro x
    mov dx, offset x
    mov ah, 09h
    int 21h
endm

read_2_digit_bcd macro x
    ; read 2 digits bcd
    ; and store it in x(byte)

    mov ah, 01h
    int 21h
    sub al, 30h
    mov temp, al

    mov ah, 01h
    int 21h
    sub al, 30h

    mov ah, temp
    aad

    mov x, al
endm

print_8bit_hex_to_bcd macro x
    mov al, x
    aam

    mov dl, ah
    add dl, 30h
    mov ah, 02h
    int 21h

    mov al, x
    aam

    mov dl, al
    add dl, 30h
    mov ah, 02h
    int 21h
endm

data segment
    
    temp        DB ?
    num1        DB ?
    num2        DB ?
    quotient    DB ?
    remainder   DB ?

    strInput1   DB 10, 13 ,'Enter num 1: ','$'
    strInput2   DB 10, 13 ,'Enter num 2: ','$'
    strQuot     DB 10, 13 ,'Quotient: ','$'
    strRemain   DB 10, 13 ,'Remainder: ','$'
data ends

code segment
assume cs:code, ds:data
start:
    ; init data segment
    mov ax, data
    mov ds, ax

    print_str strInput1
    read_2_digit_bcd num1

    print_str strInput2
    read_2_digit_bcd num2

    ; start division
    mov ah, 00
    mov al, num1

    div num2
    ; quotient  in al
    ; remainder in ah

    mov quotient, al
    mov remainder, ah

    ; print quotient
    print_str strQuot
    print_8bit_hex_to_bcd quotient

    ; print remainder
    print_str strRemain
    print_8bit_hex_to_bcd remainder

    ; print newline after result
    mov dl, 0ah
    mov ah, 02h
    int 21h

exit:
    mov ah, 4ch
    int 21h
code ends
end start
