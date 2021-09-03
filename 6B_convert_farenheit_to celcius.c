#include<stdio.h>
#include<conio.h>
void main(){
 int f, result;
 int x = 5;
 int y = 9;
 int z = 32;
 clrscr();
 printf("Enter f ");
 scanf("%d", &f);
 asm{
   mov ax, f
   sub ax, z
   mul x
   div y
   mov result, ax
 }
 printf("Result = %d", result);
 getch();
}
