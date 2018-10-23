#include <stdio.h>
#include <stdlib.h>
int main(int argc, char const *argv[])
{
	int n, x, y, ans;
	while (1){
		scanf("%d", &n);
		if (n == 1){
			scanf("%d %d", &x, &y);
			ans = x + y;
		}else if (n == 2){
			scanf("%d %d", &x, &y);
			ans = x * y;
		}else if (n == 3){
			scanf("%d %d", &x, &y);
			ans = x % y;
		}else{
			exit(0);
		}
		printf("%d\n", ans);
	}
	return 0;
}