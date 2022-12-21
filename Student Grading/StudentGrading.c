#include <stdio.h>
#include <stdlib.h>

int main(){
	
	char c;
	int m = 0;
	int i,j,k,test_count = 0;
	int question_count;
	char filename[100];
	char ans_key[100];
	char student_id[100];
	int roll_no;
	char ques_no[100];
	char choice_set[100];
	int len = 0;
	int marks_set[100];
	int marks_per_ques, total_marks = 0;
	//scanning the file
	printf("Enter file name:");
	scanf("%s",filename);
	FILE *fp,*fp1;
	fp = fopen(filename,"r");
	fp1 = fopen("output.txt","r+");
	//Check whether the file is empty or not
	if(fp == NULL){
		printf("Could not open file %s\n",filename);
		return 0;
	}
	
	//Get the total number of questions
	if(fgets(ques_no,3,fp))
		puts(ques_no);
	question_count = atoi(ques_no);
	marks_per_ques = 100/question_count;
	len = ftell(fp);
	printf("The value of fp pointer is %d\n", len);
	
	//get the count of students graded
	c = getc(fp);
	while(c != EOF){
		if(c == '\n')
			test_count = test_count+1;
		c = getc(fp);
	}
	/*len = ftell(fp);
	printf("The value of fp after calculating the no of lines is %d\n",len);*/
	
	//get the total count of questions
	fseek(fp,0,SEEK_SET);
	
	while(fgets(ques_no,255,fp)){
		i++;
		if(i == 2){
			for(j = 0,k = 0;ques_no[j] != '\0';j++,k++)
				if(ques_no[j] != ' ')
					ans_key[k] = ques_no[j];
				else
					k--;
		}
		if(i >= 3){
			puts(ques_no);
			/*for(j = 0;ques_no[j] != '\0';j++){
				if(ques_no[j] != ' '){
					student_id[m] = ques_no[j];
					m++;
				}
				roll_no = atoi(student_id);
				printf("Roll no of %d student is %d\n",i-2,roll_no);
				/*m = 0;
				if(ques_no[j] != ' '){
					choice_set[m] = ques_no[j];
					m++;
				}*/
			}*/
			/*for(j = 0;ans_key[j] != '\0';j++){
				if(ans_key[j] == choice_set[j])
					total_marks = total_marks + marks_per_ques;
					printf("Total marks of %d student is %d\n\n",i-2,total_marks);
			}*/
			//fprintf(fp1,roll_no,"\t",total_marks);
		}
	}
	for(j = 0;ans_key[j] != '\0';j++){
		printf("%c",ans_key[j]);
	}
	printf("%d\n",i);
	printf("Student ID       Score\n");
	printf("======================\n");
	for(j = 0;j < test_count - 2;j++)
		printf("%d\n",student_id[j]); 
	
	printf("======================\n");
	printf("Tests Graded = %d\n",test_count-2);
	printf("Total number of questions = %d\n", question_count);
	fclose(fp);
	fclose(fp1);
	return 0;
}


