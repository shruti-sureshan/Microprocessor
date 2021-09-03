#include<stdio.h> 
#include<conio.h> 

void main()
{
    int num1=0,num2=0,hcf=0,lcm=0;
    clrscr();
    printf("\nenter num1 and num2 : ");
    scanf("%d%d",&num1,&num2);
    asm {
        MOV AX,num1
        MOV BX,num2
    }
    while1: asm {
        MOV DX,0
        MOV CX,BX
        DIV BX
        MOV BX,DX
        MOV AX,CX
        CMP BX,0
        JNE while1
        jmp endstep
    }

    endstep: asm {
        MOV hcf,AX
        MOV CX,AX
        MOV AX,num1
        MOV BX,num2
        MUL BX
        DIV CX
        MOV lcm,AX
    }

    printf("\nlcm is %d",lcm);
    getch();
}