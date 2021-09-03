#include<stdio.h>
#include<conio.h>
void main(){
            	int a, b, c, d, result;
            	clrscr();
            	printf("Enter a, b, c, d: ");
            	scanf("%d%d%d%d", &a, &b, &c, &d);
            	asm{
                            	mov ax, b
                            	mul c
                            	add ax, a
                            	div d
                            	mov result, ax
            	}
            	printf("Result = %d", result);
            	getch();
}
