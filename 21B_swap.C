// AIM : swap two numbers.
#include<stdio.h>
void main(){
    int a, b;
    printf("Enter first number : ");
    scanf("%d", &a);
    printf("Enter second number : ");
    scanf("%d", &b);

    asm{
	mov ax, a;
	mov bx, b;

	//using cx as temp register.
	mov cx, ax;
	mov ax, bx;
	mov bx, cx;

	// moving result back to C variables.
	mov a, ax;
	mov b, bx;
    }
    printf("Swapped numbers are : (%d, %d)", a, b);
    getch();
}