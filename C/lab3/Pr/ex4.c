#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
	float sales;
	while (1){
		printf("Enter sales in dollars (-1 to end): ");
		scanf("%f", &sales);
		if (sales == -1){
			exit(0);
		}else{
			printf("Salary is: $%.2f\n", 200 + sales * 0.09);
		}
	}
		return 0;
}