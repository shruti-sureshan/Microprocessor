#include<stdio.h>
#include<conio.h>
void main()
{
	int pi=3,r=0,res=0;
	clrscr();
	printf("\nEnter radius of spehere: ");
	scanf("%d",&r);
	asm {
		mov ax,r
		mul ax
		mov bx,pi
		mul bx
		mov bx,04
		mul bx
		mov res,ax
	}
	printf("surface area is  %d",res);
	getch();
}