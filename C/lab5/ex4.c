#include <stdio.h>

long long power(int base, int exponet)
{
	if (exponet == 1){
		return base;
	} else {
		return power(base, exponet - 1) * base;
	}
}

int main(int argc, char const *argv[])
{
	int base, exponet;
	scanf("%d %d", &base, &exponet);
	printf("%lld\n", power(base, exponet));
	return 0;
}
