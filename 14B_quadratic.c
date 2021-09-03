#include <stdio.h>
void main(){
	int a, b, c;
	int four = 4;
	int result;
	clrscr();
	printf("Enter the values of a, b, c : ");
	scanf("%d, %d, %d", &a, &b, &c);
	printf("%d, %d, %d", a, b, c);
	asm{
	    //calculating 4ac
	    mov ax, a
	    mul c
	    mul four
	    mov cx, ax     // storing 4ac in cx

	    //computing b*b
	    mov ax, b
	    mul b            //ax has b*b

	    // b*b - 4ac:
	    sub ax, cx
	    mov result, ax
	}
	printf("Valuse of b*b-4ac : %d", result);
	getch();
}