#include <stdio.h>

int max_array(int *a, int n)
{
	int max = a[0];
	for (int i = 1; i < n; ++i)
	{
		if (a[i] > max){
			max = a[i];
		}
	}
	return max;
}

int main(int argc, char const *argv[])
{
	int a[5] = {4, 3, 2, 5, 9};
	printf("%d\n", max_array(a, 5));
	return 0;
}