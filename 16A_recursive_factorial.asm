print macro x
    mov dx, offset x
    mov ah, 09h
    int 21h
endm

get_input macro
    mov ah, 01h
    int 21h     ;read first digit
    sub al, 30h
    mov bl, al
    mov ah, 01h
    int 21h     ;read second digit
    sub al,30h
    mov ah, bl  ; bring tens digit in al
    aad
endm

data segment
    Num_bh           DB ?
    Fact_bh       DW ? ; 16 bit
       
    StrEnterNum     DB 10, 'Enter a num:', 10, '$'
    StrFactIs       DB 10, 'Factorial is: ', 10, '$'
data ends
 
code segment
assume cs:code, ds:data
start:
 
    mov ax, data
    mov ds, ax
 
    print StrEnterNum
 
    get_input   
    mov Num_bh, al   ; store in var
 
    print StrFactIs
    
    mov ax, 01h
    xor bx, bx
    mov bl, Num_bh

    CALL ProcFactorial
    xor cx, cx
    ;mov ax, Fact_bh
    mov bx, 0ah
L1:
    xor dx, dx
    div bx
    push dx
    inc cx  ; keep track of how many pushes
    cmp ax, 00h
    JG L1
L2:
    pop dx
    add dl , 30h
    mov ah, 02h
    int 21h
    loop L2
exit:
    mov ah, 4ch
    int 21h
ProcFactorial proc
    cmp bx, 01h
    jz last
    mul bx
    dec bx
    CALL ProcFactorial
last:
    RET
endp
 
code ends
end start
