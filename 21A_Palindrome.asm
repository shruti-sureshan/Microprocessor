; 21A
; check if given string is palindrome

data segment
    StrEnter    DB 10,13,'Enter string:',10,13,'$'
    StrInput    DB 25 DUP('$')
    StrRev      DB 25 DUP('$')
    StrBefore   DB 10,13,'Before: ',10,13,'$'
    StrAfter    DB 10,13,'After : ',10,13,'$'
    len_str     DW ?
    StrNotPalin DB 10,13,'Not Palindrome',10,13,'$'
    StrPalin    DB 10,13,'Palindrome',10,13,'$'
data ends

print_str macro x
    mov dx, offset x
    mov ah, 09h
    int 21h
endm

code segment
assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax
    mov es, ax

    print_str StrEnter

    lea di, StrInput
    cld
    xor cx, cx
    mov ah, 01h
input1:
    int 21h
    cmp al, 0dh     ;0dh is ascii for enter
    je input_done

    stosb           ; from al to es:di
    inc cx
    jmp input1

input_done:
    ; string has been read
    ; cx holds length of string
    mov len_str, cx

    lea si, StrInput
    dec cx  ;get index for last char in string

    add si, cx  ;point si to last index


    lea di, StrRev
    inc cx      ;restore cx value
reverse_string:
    std         ;si should dec after operation
    lodsb
    cld         ;di should inc after operation
    stosb
    loop reverse_string

print_ans:

    print_str StrAfter
    print_str StrRev

palindrome_check:
    
    sub al, al  ;set ZF=1
    lea si, StrInput
    lea di, StrRev
    cld
    mov cx, len_str

    REPE cmpsb
    JNZ not_palin   ; repe will stop when zero flag is not set, max iterations = CX

    ; yes palindrome
    print_str StrPalin
    jmp exit

not_palin:
    print_str StrNotPalin

exit:
    mov ah, 4ch
    int 21h
code ends
end start