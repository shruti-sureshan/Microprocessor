#include <stdio.h>
#include <conio.h>

void main(){
	int b_pay, da, hra, tax, tot;
	int x = 2;
	int y = 5;
	int z = 100;
	int t = 10;
	clrscr();
	printf("Enter Basic Pay: ");
	scanf("%d", &b_pay);
	asm{
		mov ax, b_pay
		div x
		mov da, ax           //da value achieved

		mov ax, b_pay
		mul y
		div z
		mov hra, ax           // hra value achieved

		mov ax, b_pay
		mul t
		div z
		mov tax, ax          // tax value achieved

		mov ax, b_pay
		add ax, da
		adc bx, 00h
		add ax, hra
		adc bx, 00h
		sub ax, tax
		sbb bx, 00h

		mov tot, ax          // total salary


	}

	printf("Total Salary: %d", tot);
	getch();

}