#include<stdio.h>
#include<conio.h>
void main(){
	int a, b, c, max;
	clrscr();
	printf("Enter a, b, c:  ");
	scanf("%d%d%d", &a, &b, &c);
	asm{
		mov ax, a
		mov bx, b
		mov cx, c
		cmp ax, bx
		jg L1
		cmp bx, cx
		jg L3
		mov max, cx
		jmp L4
	}
	L1: asm{
		cmp ax, cx
		jg L2
		mov max, cx
		jmp L4 
	}
	L2: asm{
		mov max, ax
		jmp L4
	}
	L3: asm{
		mov max, bx
	}
	L4: asm{
		
	}
	
	printf("Max = %d", max);
	getch();
}
