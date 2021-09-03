#include<stdio.h>
#include<conio.h>
void main(){
 int a, b, c, d, result;
 clrscr();
 printf("Enter a, b, c, d ");
 scanf("%d%d%d%d", &a, &b, &c, &d);
 asm{
   mov ax, b
   mul c
   mov bx, d
   sub bx, ax
   add bx, a
   mov result, bx
 }
 printf("Result = %d", result);
 getch();
}
