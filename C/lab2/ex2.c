#include <stdio.h>

int main(){
	int s;
	scanf("%d", &s);
	if (s >= 0 && s <= 33){
		printf("Tropical Depression\n");
	}else if (s > 33 && s <= 63){
		printf("Tropical Storm\n");
	}else if (s > 63 && s <= 129){
		printf("Typhoon\n");
	}else if (s > 129){
		printf("Super Typhoon\n");
	}else if (s < 0){
		printf("Invalid Number\n");
	}
}