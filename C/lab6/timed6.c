// 20029214 scyyz2 Yihan ZHANG
#include <stdio.h>

int full_div(int a, int b, int *quotient, int *remainder){
	if (b == 0){
		return 0;
	}
	*quotient = a / b;
	*remainder = a % b;
	return 1;
}

int main(int argc, char const *argv[])
{
	int a = 0;
	int b = 0;
	int q, r;
	while (a != -1){
		printf("Enter a: ");
		scanf("%d", &a);
		if (a == -1) {break;}
		printf("Enter b: ");
		scanf("%d", &b);
		if (full_div(a, b, &q, &r)){
			printf("Quotient %d\n", q);
			printf("Remainder %d\n", r);
		} else {
			printf("Impossible\n");
		}
	}
	return 0;
}