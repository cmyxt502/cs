#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
	float x, y, z;
	scanf("%f %f", &x, &y);
	if (x <= 0 || y <= 0){
		printf("Invalid Number\n");
		exit(0);
	}
	z = sqrt(x * x + y * y);
	printf("%.1f\n", z);
}