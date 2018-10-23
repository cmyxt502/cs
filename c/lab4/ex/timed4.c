// 20029214 scyyz2 Yihan ZHANG
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
	int n, index = 1, x;
	printf("Enter number of values: ");
	scanf("%d", &n);
	if (n <= 0){
		printf("Invalid array length!\n");
		exit(0);
	}
	int a[n];
	for (int i = 0; i < n; ++i)
	{
		x = -1;
		while (x < 0){
			printf("Enter position %d value: ", i);
			scanf("%d", &x);
		}
		a[i] = x;
	}
	while (index != -1){
		printf("Enter value index to print (-1 to quit): ");
		scanf("%d", &index);
		if (index < -1 || index >= n){
			printf("Index out of bounds!\n");
		} else if (index != -1){
			printf("Value %d is in position %d\n", a[index], index);
		}
	}
}