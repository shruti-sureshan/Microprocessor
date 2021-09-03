// Check if a number is prime in MLP.
// Logic :
// number is prime iff it is not divisible by any of (2, 3, 5, 7);
#include <stdio.h>
int main(void) {
    int n = 0;
    int flag;

    // taking a number from user to check for prime.
    printf("Enter a number : ");
    scanf("%d", &n);
    asm{
	mov flag, 1;   // 1 indicates number is prime.

	/*Exceptional check condition if number is 2, 3, 5, 7*/
	mov ax, n;
	cmp ax, 2;
	jz final;
	cmp ax, 3;
	jz final;
	cmp ax, 5;
	jz final;
	cmp ax, 7;
	jz final;


	// checking divisibility with 2;
	mov ax, n;
	mov bl, 2;
	div bl;      // after div, results are stored as
		     ;//	al: quotient, ah: remainder
	cmp ah, 0    ;// if remainder is 0
	jz not_prime ; // number is not prime

	;// Note : division of 16 bitss require 8 bit divisor.


	// checking divisibility with 3;
	mov ax, n;
	mov bl, 3
	div bl;
	cmp ah, 0
	jz not_prime;

	// checking divisibility with 5;
	mov ax, n;
	mov bl, 5;
	div bl;
	cmp ah, 0;
	jz not_prime;

	// checking divisibility with 7;
	mov ax, n;
	mov bl, 7;
	div bl;
	cmp ah, 0
	jz not_prime;

       ;// program came till here means that,
       ;// number is not divisible by any of(2,3,5,7)
       jmp final;
    }
    not_prime:asm{
	mov flag, 0;
    }

    final:asm{}

    if(flag){
	printf("%d is a prime number.", n);
    } else {
	printf("%d is not a prime number.", n);
    }
    getch();
    return 0;
}