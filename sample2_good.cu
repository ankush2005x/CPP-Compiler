/* Correct Code For Tower Of Hanoi */

int transfer(int n, int from, int to, int through);

int main(){
	transfer(6, 'A', 'C', 'B');

	return 0;
}

int transfer(int n, int from, int to, int through){
	if(n==1){
		printf("%d: %c -> %c\n", n, from, to);
		return;
	}
	
	transfer(n=n-1, from, through, to);

	printf("%d: %c -> %c\n", n+1, from, to);

	transfer(n, through, to, from);
}