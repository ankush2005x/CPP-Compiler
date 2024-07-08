/* This File Has Correct Syntax */

int cucu_strlen(char *s);
char *func(int x[]);

int main(int argc, char **argv){
	int i = 2;
	
	char *s; 	/* This is a Comment */
	func(i + 2&3, i == 2+3, s[i+2]);	
	
	if(i==1){
		printf("i is 1\n");
	}else if(i==2){
		printf("i is 2\n");
	}else{
		printf("i is 3\n");
	}
	/* Multiple Commented Lines
	blah
	blahh
	bla
	blaaah
	return i & 34 + 2;
	*/
	
	return i/2;	
}