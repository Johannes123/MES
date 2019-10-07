#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct student {
	char fname[20];
	char vname[20];
	char gender;
	unsigned int age;
	struct student *pNext;
};

int main(void)
{
	struct student *pHead = NULL;
	struct student *pAct = NULL;
	
	// Einlesen
	pAct = (struct student *)malloc(sizeof(struct student));
	if (pAct == NULL)
	{
		printf("Malloc Error!\n");
		exit(EXIT_FAILURE);
	}
	strncpy(pAct->fname, "Maier", sizeof(pAct->fname));
	strncpy(pAct->vname, "Hubert", sizeof(pAct->vname));
	pAct->gender = 'm';
	pAct->age = 42;
	pAct->pNext = NULL;
	pHead = pAct;
	
	pAct = (struct student *)malloc(sizeof(struct student));
	if (pAct == NULL)
	{
		printf("Malloc Error!\n");
		exit(EXIT_FAILURE);
	}
	strncpy(pAct->fname, "Mueller", sizeof(pAct->fname));
	strncpy(pAct->vname, "Thomas", sizeof(pAct->vname));
	pAct->gender = 'm';
	pAct->age = 43;
	pAct->pNext = pHead;
	pHead = pAct;

	pAct = (struct student *)malloc(sizeof(struct student));
	if (pAct == NULL)
	{
		printf("Malloc Error!\n");
		exit(EXIT_FAILURE);
	}
	strncpy(pAct->fname, "Huber", sizeof(pAct->fname));
	strncpy(pAct->vname, "Helga", sizeof(pAct->vname));
	pAct->gender = 'f';
	pAct->age = 32;
	pAct->pNext = pHead;
	pHead = pAct;
	
	// Ausgeben -> fname
	pAct = pHead;
	while(1)
	{
		printf("Family Name: %s\n", pAct->fname);
		pAct = pAct->pNext;
		if (pAct == NULL)
			break;
	}
    add2ll(struct student *pAct, char *pHead.fname)
	return 0;
}

int add2ll()
{

}