;Count of Even  and odd number in an array.
print macro x
	mov dx, offset x
	mov ah, 09
	int 21h
endm

print_no macro x
	add x, '0'
	mov ah, 02h
	xor dh, dh
	mov dl, x
	int 21h
endm

data segment
	arr db 10 dup(?)
	rb_even db 0
	rb_odd db 0
	prompt_msg db, 10, "Enter 10 elements : $"
	ct_e db, 10, "Even count : $"
	ct_o db, 10, "Odd count : $"
data ends

code segment
assume cs:code, ds:data
start:  mov ax, data	
		mov ds, ax

		lea bx, arr   ; load effective address of arr in base register.
		mov cx, 10   ; cx acts as a counter
		xor si, si    ; si is our loop counter

		print prompt_msg
		mov ah, 01h

		Take_input : int 21h
		             sub al, '0'
		             mov bx[si], al
		             inc si
		             loop Take_input

		; reset the counter and 
		mov cx, 10
		xor si, si

		check : mov al, bx[si]
		        and al, 01

		        jz inc_even
		        inc rb_odd

		        jmp after_check
		        inc_even : inc rb_even

		        after_check : inc si
		                      loop check

		print ct_e
		print_no rb_even

		print ct_o
		print_no rb_odd
		mov ah, 4ch
		int 21h
code ends
end start
