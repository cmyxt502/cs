#include <stdio.h>

int main(){
	int t;
	int h, min, sec;
	scanf("%d:%d:%d", &h, &min, &sec);
	t = h * 3600 + min * 60 + sec;
	printf("%d\n", t);
}