#include <stdio.h>
#include <conio.h>

void main(){
	int marks;
	char grade;
	clrscr();
	printf("Enter Marks: ");
	scanf("%d", &marks);
	asm{
		mov ax, marks
		cmp ax, 80
		jg L1
		cmp ax, 60
		jg L2
		cmp ax, 40
		jg L3
		jmp L4
	}
	L1: asm{
		mov grade, 'A'
		jmp exit
	}
	L2: asm{
		mov grade, 'B'
		jmp exit
	}
	L3: asm{
		mov grade, 'C'
		jmp exit
	}
	L4: asm{
		mov grade, 'F'
	}
	exit: asm{

	}
	printf("Grade: %c", grade);
	getch();
}