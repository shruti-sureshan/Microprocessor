Print macro msg
    mov ah,09h
    mov dx,offset msg
    int 21h
endm

get_input macro
    mov ah, 01h       ; scan first digit of num1
    int 21h 
    sub al, 30h  
    mov dl, al        ; move it to dl for temporrary purpose
    mov ah, 01h       ; scan second digit of num1
    int 21h 
    sub al, 30h       ; keep second digit of first num in al
    mov ah, dl        ; move first digit of num1 from dl to ah
endm

data segment
    msg  db, 10, "Enter Number $"
    msg1 db, 10, "Number Converted Successfully$"
    num dw 2 dup(?)
data ends

code segment
assume cs:code, ds:data
start:  mov ax, data
        mov ds, ax
        Print msg

        get_input
        
        aad               ; now ah has first digit and al has second digit of num1, pack 16bit digit to 8bit using aad

        Print msg1

        mov num, ax       ; 16bit output of aad is in ax, move ax to our variable num which is of 16bit ding ding ding!
        mov ah, 4ch 
        int 21h
code ends
end start
