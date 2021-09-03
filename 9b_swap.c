#include <stdio.h>
#include <conio.h>
void main()
{
    int a = 3;
    int b = 5;
    clrscr();
    printf("Before swapping:\n");
    printf("a: %d, b: %d\n", a, b);
    asm{
	mov ax, a
	mov bx, b
	mov a, bx
	mov b, ax
    }

    printf("After swapping:\n");
    printf("a: %d, b: %d\n", a, b);
    getch();
}