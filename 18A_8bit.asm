print_string macro x
	mov dx, offset x
	mov ah, 09
	int 21h
endm

hex_to_bcd_8b macro x
	; assume x has 38                  // 0x38 = 56
	xor ah, ah;         ax <-- 00 xx
	mov al, x;          ax <-- 00 38     // 38 is hex equivaent of 56.
	aam;                ax <-- 05 06

	; what if number entered is >= 100, ah will become 0A.
	mov cx, ax ; temporarily storing before comparision.
	cmp ah, 09
	jg print_1
	mov ax, cx
	jmp normal

	print_1 : mov al, 1
	print_4b al
	mov ax, cx
	; suppose  123 was the number in dec,
	; ax would have ax <-- 0C 03
	; cx <-- 0B 02

	mov al, ah        ; ax <-- 0C 0C
	aam               ; ax <-- 01 02
	mov ah, al        ; ax <-- 02 02
	mov al, cl        ; ax <-- 02 03

	normal :ror ah, 04;   ax <-- 50 06
	add al, ah;           ax <-- 50 56
	mov x, al;             x <-- 56
	exit :
endm;

print_4b macro x
	mov ah, 02
	mov dl, x
	add dl, '0'
	int 21h
endm

print_8b macro x
	; assuming x <-- 56

	; printing higher digit : 
	mov dl, x        ; dl <-- 56
	ror dl, 04       ; dl <-- 65
	and dl, 0fh      ; dl <-- 05
	print_4b dl

	;printing lower digit
	mov dl, x
	and dl, 0fh
	print_4b dl

endm

data segment
    msg1 db 10,  "Enter a 4 digit number : $"
    msg2 db 10,  "Sum of digits : $"
data ends

code segment
assume cs:code, ds:data
start:     mov ax, data
	       mov ds, ax
	       print_string msg1

	       mov cx, 4              ; for getting input of 4 digits

	ip_sum : mov ah, 01h
			 int 21h
			 sub al, '0'
	         add bl, al
	         loop ip_sum

	print_string msg2
	hex_to_bcd_8b bl
	print_8b bl

	mov ah, 4ch
	int 21h
code ends
end start
