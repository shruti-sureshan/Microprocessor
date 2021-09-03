#include<stdio.h>
int input(char s[]){
    int n;
    puts(s);
    scanf("%d", &n);
    return n;
}
int main(void){
    int a, b, c;
    a = input("Enter first number : ");
    b = input("Enter second number : ");
    c = input("Enter third number : ");
    asm{
	mov ax, a;
	add ax, b;
	add ax, c;

	mov bl, 3;
	div bl;            //dividing sum in ax by 3
	xor ah, ah;        // clearing off the remainder.
	mov a, ax;         // result of average in a;
    }
    printf("average of numbers : %d", a);
    getch();
    return 0;
}