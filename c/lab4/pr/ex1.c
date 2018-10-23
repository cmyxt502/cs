#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
	int n;
	scanf("%d", &n);
	int a[n];
	for (int i = 0; i < n; i++){
		scanf("%d", &a[i]);
	}
	int t;
	for (int i=0; i < n; i++){
		for (int j=i; j < n; j++){
			if (a[i] < a[j]){
				t = a[i];
				a[i] = a[j];
				a[j] = t;
			}
		}
	}
	printf("\n");
	for (int i=0; i < n; i++){
		printf("%d\n", a[i]);
	}
}
