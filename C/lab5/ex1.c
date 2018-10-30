#include <stdio.h>
#include <math.h>

double hypotenuse(double x, double y)
{
	return sqrt((x * x) + (y * y));
}

int main(int argc, char const *argv[])
{
	double x, y, z;
	scanf("%lf %lf", &x, &y);
	z = hypotenuse(x, y);
	printf("%lf\n", z);
	return 0;
}