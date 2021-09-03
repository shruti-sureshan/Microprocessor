print_str macro x
    mov dx, offset x
    mov ah, 09
    int 21h
endm

data segment
    str1 db "bhushan$"
    str2 db 10 dup('$')
data ends

code segment
assume cs:code, ds:data
start : mov ax, data
        mov ds, ax      ; initialising data segment
        mov es, ax      ; initializing extra segment
        
        ; copying str2 addresses of str2 and str1 in ds:si
        lea si, str1    
        lea di, str2
        
        mov cx, 7         ; length of the string.
        repe movsb        ; repeat movsb until cx is 0
        
        print_str str2
        
code ends
end start


; working of movsb : 
; movsb copies sequence of bytes from si to di 
; incrementing si and di everytime
; read more from : https://www.csc.depauw.edu/~bhoward/asmtut/asmtut7.html