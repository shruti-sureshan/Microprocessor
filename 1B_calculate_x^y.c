#include<stdio.h>
#include<conio.h>
void main(){
	int x,y,ans;
	clrscr();
	printf("Enter value of X:\n");
	scanf("%d",&x);
	printf("Enter value of Y:\n");
	scanf("%d",&y);

	asm{
		mov ax,01
		mov bx,x
		mov cx,y
	}

	l1:asm{
	  mul bx
	  loop l1
	  mov ans,ax
	}
	printf("ANSWER : %d",ans);
	getch();
}
