#include <stdio.h>
#include <stdlib.h>
int clamped(int max, int min, int n){
	if (n > max){
		return max;
	} else if (n < min){
		return min;
	} else {
		return n;
	}
}
int main(int argc, char const *argv[])
{
	int max, min;
	printf("Enter max value: ");
	scanf("%d", &max);
	printf("Enter min value: ");
	scanf("%d", &min);
	int n = 0;
	while (n != -9999){
		printf("Enter value: ");
		scanf("%d", &n);
		printf("%d\n", clamped(max, min, n));
	}
	return 0;
}