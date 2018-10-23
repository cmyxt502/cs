#include <stdio.h>

int main(int argc, char const *argv[])
{
	int n, a, b, c, d;
	scanf("%d", &n);
	a = (n % 10 + 7) % 10;
	b = (n / 10 % 10 + 7) % 10;
	c = (n / 100 % 10 + 7) % 10;
	d = (n / 1000 + 7) % 10;

	printf("%d%d%d%d\n", b, a, d, c);

	return 0;
}