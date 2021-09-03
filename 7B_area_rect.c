#include <stdio.h>
#include <conio.h>

void main(){
	int b, h, result;
	int n = 2;
	clrscr();
	printf("Enter b and h:");
	scanf("%d%d", &b, &h);
	asm{
		mov ax, b
		mul h
		div n
		mov result, ax
	}
	printf("Area: %d", result);
	getch();
}