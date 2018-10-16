#include <stdio.h>

int main(int argc, char const *argv[])
{
	int index = 1;
	for (int i = 0; i < 10; ++i)
	{
		for (int j = 0; j < i; ++j)
		{
			printf("%d ", index);
			index++;
		}
		printf("\n");
	}
	return 0;
}