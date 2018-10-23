// 20029214 scyyz2 Yihan ZHANG
#include <stdio.h>

int main(int argc, char const *argv[])
{
	int n = -1;
	while (n < 0 || n >= 100){
		printf("Enter number: ");
		scanf("%d", &n);
		if (n >= 100){
			printf("Too high, try again!\n");
		} else if (n < 0){
			printf("Too low, try again!\n");
		} else {
			printf("You entered %d.\n", n);
		}
	}	
}