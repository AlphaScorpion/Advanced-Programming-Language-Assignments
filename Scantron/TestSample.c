#include <stdio.h>
#include <stdlib.h>
const int SCORE_MAXIMUM = 100;


void generateArray(FILE** file, int array[], int size)
{
	int i =0;
	for(i=0; i< size; i++)
	{
	fscanf(*file, "%d", &array[i]);
	}
}

int compareArray(int key[], int answers[], int size)
{
	int misses = 0,i = 0;
	for(i = 0; i < size; i++)
	if(key[i] != answers[i])
	misses++;
	return SCORE_MAXIMUM - (SCORE_MAXIMUM/size) * misses;
}

int main()
{
	
	FILE* fp;
	int key[50], answers[50], num_questions;
	int frequency[101] = {0};
	int studentID, score, numTests=0,i=0;
	double average=0,avg=0;
	char file_name[10];
	char fileText[2],ch;
	
	printf("Enter file name: \n");
	fflush(stdout);
	scanf("%d");
	gets(file_name);
	fp = fopen(file_name, "r");
	fgets (fileText, 3, fp);
	num_questions = atoi(fileText);
	generateArray(&fp, key, num_questions);
	
	printf("Student ID    Score\n");
	printf("===================\n");

	while(EOF!=(ch=fgetc(fp)))
	{
		fscanf(fp, "%d", &studentID);
		generateArray(&fp, answers, num_questions);
		score = compareArray(key, answers,num_questions);
		frequency[score]++;
		average += score;
		printf("%d         %d\n",studentID,score);
		numTests++;
	}
	
	printf("===================\n");
	printf("Tests graded = %d\n",numTests);
	printf("===================\n");
	printf("Score       Frequency\n");
	printf("===================\n");
	
	for(i=100;i>0;i--)
	{
		if(frequency[i]!=0)
			{
				printf("%d       %d\n",i,frequency[i]);
			}
	}
	printf("===================\n");
	avg = average/numTests;
	printf("Class average  = %f\n",avg);
	return 0;
}

