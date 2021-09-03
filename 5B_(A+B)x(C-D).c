#include<stdio.h>
#include<conio.h>
void main(){
  int a, b, c, d, result;
  clrscr();
  printf("Enter a, b, c, d: ");
  scanf("%d%d%d%d", &a, &b, &c, &d);
  asm{
    mov ax, a
    add ax, b
    mov bx, c
    sub bx, d
    mul bx
    mov result, ax
  }
  printf("Result = %d", result);
  getch();
}
