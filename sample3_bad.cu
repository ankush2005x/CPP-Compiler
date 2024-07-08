// This Sample Has Erronoeus Code (Line 14 and 17)

int transfer(int n, int from, int to, int through);

int main(){
	transfer(6, 'A', 'C', 'B');

	return 0;
}

int transfer(int n, int from, int to, int through){
	if(n==1){
		printf(("%d: %c -> %c\n", n, from, to);		/* Extra Open Brace In This Line! */
		return;
	}
	transfer(--n, from, through, to);			// -- Operator Not Supported

	printf("%d: %c -> %c\n", n+1, from, to);

	transfer(n, through, to, from);
}