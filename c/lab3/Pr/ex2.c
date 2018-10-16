#include <stdio.h>

int main(int argc, char const *argv[])
{
	int n;
	scanf("%d", &n);
	for (int i = 0; i < n; ++i)
	{
		if (i == 0 || i == n-1){
			for (int j = 0; j < n; ++j)
			{
				printf("*");
			}
		} else {
			printf("*");
			for (int j = 0; j < n-2; ++j)
			{
				printf(" ");
			}
			printf("*");
		}
		printf("\n");
	}
	return 0;
}