//address translation from logical to physical in 80386

/*
my comments are for your understanding, not for printing
you may use file size as 1024
page size will be your class no. followed by 2 digit roll no. 
for example 
roll no 2 from TE CMPN A, then your page size will be 102
roll no 65 from TE CMPN B, then your page size will be 265
everyone need to show output with your numbers only
*/

#include<stdio.h>
#include<conio.h>

struct Main_Memory {		//main memory is divided into many segments, and each segment has many pages
	int start_address;	//each page will have a unique start address
	int pn;			//page number
};

int main() {
	int seg_size, page_size, no_of_pages, phy_address;
	int i, r, page_no, offset;
	int array[200], sno[200];
	struct Main_Memory mm[100];
	clrscr();

	printf("Logical Address to Physical Address\n");
	printf("Enter the size of segment: ");
	scanf("%d", &seg_size);
	printf("Enter page size: ");
	scanf("%d", &page_size);

	no_of_pages = seg_size/ page_size;

	for(i=0; i< no_of_pages; i++) {
		r = rand() % no_of_pages;	//pages need not be sequential
		if( array[r] == 1) {
			i--;
			continue;
		}
		array[r] = 1;
		mm[i].pn = r;
		mm[i].start_address = i * page_size;
		sno[r] = i;
	}

	printf("\nThe Structure of Main Memory\n\n");
	printf("Segment No. \t Page No.\n");
	for(i=0; i < no_of_pages; i++)
		printf("%d \t\t %d \n",i, mm[i].pn);

	printf("Enter the Logical Address\n");
	printf("Page Number: ");
	scanf("%d", &page_no);
	printf("Offset: ");
	scanf("%d", &offset);
	if( page_no >= no_of_pages || offset > page_size) {
		printf("Invalid Logical Address\n");
		return 0;
	}

	phy_address = mm[sno[page_no]].start_address + offset;

	printf("Physical Address: %d\n", phy_address);
	getch();
	return 0;
}

