#include<stdio.h>
#include<conio.h>
void main(){
 int c, result;
 int x = 5;
 int y = 9;
 int z = 32;
 clrscr();
 printf("Enter c ");
 scanf("%d", &c);
 asm{
   mov ax, c
   mul y
   div x
   add ax, z
   mov result, ax
 }
 printf("Result = %d", result);
 getch();
}
