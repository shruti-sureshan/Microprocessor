#include<stdio.h>
void main(void){
    int a, b;
    int smallest;
    printf("Enter first number : ");
    scanf("%d", &a);
    printf("Enter second number : ");
    scanf("%d", &b);
    asm{
	mov ax, a;
	mov bx, b;
	cmp ax, b;
	jg a_greater      // if a > b move to label a_greater
	mov smallest, ax;  // if a < b  ; a is smallest
	jmp final;
    }
    a_greater:asm{
	mov smallest, bx;
    }
    final:asm{}
    printf("Smallest number is : %d", smallest);
    getch();
}