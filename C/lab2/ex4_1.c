#include <stdio.h>

int main(){
	int t;
	scanf("%d", &t);
	int h, min, sec;
	h = t / 3600;
	min = (t % 3600) / 60;
	sec = t % 60;
	printf("%d:%d:%d\n", h, min, sec);
}