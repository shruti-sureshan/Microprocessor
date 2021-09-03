Print macro x
    mov dx, offset x
    mov ah, 09
    int 21h
endm 

data segment
    str1 db "bhushan"      
    str2 db 7 dup(0)        
    msg1 db,10, "Enter password: $"
    msg2 db,10, "Valid password$"
    msg3 db,10, "Invalid password$"
data ends
 
code segment
assume cs:code, ds:data
start:  mov ax, data
        mov ds, ax              
        mov es, ax              
 
        Print msg1 

        lea di, str2

        xor cx, cx
        mov ah, 08        ; takes input without print

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This loop is used to take input till the user presses enter.

back1:  int 21h           
        cmp al, 0dh    ; 0dh is used to check if enter key is pressed.
        jz endip       
        stosb
        inc cx
        jmp back1
        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 
endip:  cmp cx, 07         
        jnz inv                 
        lea si, str1            
        lea di, str2
        repe cmpsb 
        jnz inv         
 
        mov dx, offset msg2   
        mov ah, 09
        int 21h     
        jmp last                
 
inv:    mov dx, offset msg3     
        mov ah, 09
        int 21h                 
 
last:   mov ah, 4ch
        int 21h                 
code ends
end start
 