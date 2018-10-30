#include <stdio.h>

int isEven(int n)
{
	if (n % 2 == 1){
		return 0;
	} else {
		return 1;
	}
}
int main(int argc, char const *argv[])
{
	int n;
	scanf("%d", &n);
	printf("%d\n", isEven(n));
	return 0;
}
