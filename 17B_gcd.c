#include "stdio.h"
int main(void)
{
	int a, b, temp, result;
	printf("Enter two numbers : ");
	scanf("%d, %d", &a, &b);
	start:asm{
	      mov ax, a
	      mov bx, b
	}

	Compare: asm{
		CMP AX,BX       			 //Compare the two numbers.
        JE EXIT         			 //If equal, go to EXIT label.
        JB EXCG         			 //If first number is below than second,
                       			     //go to EXCG label.
     }
    Body: asm{
    	mov dx, 0h
       	DIV BX         		    //Divide the first number by second number.
       	CMP DX,0        		//Compare remainder is zero or not. (AX=Q ; DX=R)
       	JE EXIT        			//If zero, jump to EXIT label.
       	MOV AX,DX       		//If non-zero, move remainder to AX.
       	JMP Compare         			//Jump to Compare label. 
    }
    EXCG: asm{
    	XCHG AX,BX     		//Exchange the remainder and quotient.
        JMP Body       		 //Jump to Body.
    }

  	EXIT: asm{
  		MOV result, BX     		//Store the result in GCD.
    }
	printf("gcd of %d, %d : %d", a, b, result);
	getch();
	return 0;
}