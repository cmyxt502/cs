#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
	int a[10], b, c[10], index = 0;
	for (int i = 0; i < 10; i++){
		scanf("%d", &a[i]);
	}
	for (int i = 0; i < 10; i++){
		scanf("%d", &b);
		for (int j = 0; j < 10; j++){
			if (b == a[j]){
				c[index] = b;
				index++;
				break;
			}
		}
	}

	printf("\n");
	for (int i = 0; i < index; i++){
		printf("%d\n", c[i]);
	}

}
