get_str macro str
    mov ah, 0ah
    lea dx, str
    int 21h
endm

Print macro str
    mov ah, 09h
    lea dx, str
    int 21h
endm

data segment

        STR1 DB 80,80 DUP('$')
        STR2 DB 80,80 DUP('$')
        MSG1 DB 10,13,'ENTER THE FIRST STRING :$'
        MSG2 DB 10,13,'ENTER THE SECOND STRING IS :$'
        MSG3 DB 10,13,'THE TWO STRINGS ARE EQUAL$'
        MSG4 DB 10,13,'THE TWO STRINGS ARE NOT EQUAL$'
data ends


code segment

        assume cs:code, ds:data, es:data
        start:

                 mov ax, data
                 mov es, ax
                 mov ds, ax
        
                 Print MSG1
                 get_str STR1

                 Print MSG2
                 get_str STR2
               
                 lea si,STR1+2
                 lea di,STR2+2
               
                 mov cl,STR1+1 ;FOR STORING THE LENGTH OF THE STRING
                 mov ch,00H
        
                 repe cmpsb
                 jne notequal
        
                 Print MSG3
                 jmp last
        
             notequal:
                 Print MSG4
        
             last:      
                 mov ax,4C00H
                 int 21h
        
code ends
end start
