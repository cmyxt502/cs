#include <stdio.h>

int main(int argc, char const *argv[])
{
	int n, k = 1, ans;
	scanf("%d", &n);
	while (n != 0){
		ans += n % 10 * k;
		n = n / 10;
		k = k * 2;
	}
	printf("%d\n", ans);
	return 0;
}