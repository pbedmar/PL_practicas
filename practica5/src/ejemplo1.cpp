#include <stdbool.h>
#include <stdio.h>
#include <math.h>

int n, curr;

int main(int argc, char* argv[])
{
	{
	printf("%s", "introduce numero : ");
	}
	scanf("%i", &n); getchar();

	{
	printf("%s", " ");
	int temp0 = n;
	printf("%i", temp0);
	printf("%s", " == ");
	}
	{
	int temp1 = 2;
	curr = temp1;
	}

etiqueta3: ;
	int temp2 = curr;
	int temp3 = n;
	bool temp4 = temp2 <= temp3;
	if (!temp4) goto etiqueta2;
	{
		int d;
		{
		int temp5 = n;
		int temp6 = curr;
		int temp7 = temp5 / temp6;
		d = temp7;
		}

		int temp8 = d;
		int temp9 = curr;
		int temp10 = temp8 * temp9;
		int temp11 = n;
		bool temp12 = temp10 == temp11;
		if (!temp12) goto etiqueta1;
		{
			{
			printf("%s", " * ");
			int temp13 = curr;
			printf("%i", temp13);
			}
			{
			int temp14 = n;
			int temp15 = curr;
			int temp16 = temp14 / temp15;
			n = temp16;
			}

		}
		goto etiqueta0;
etiqueta1: ;
		{
			{
			int temp17 = curr;
			int temp18 = 1;
			int temp19 = temp17 + temp18;
			curr = temp19;
			}

		}
etiqueta0: ;

	}
	goto etiqueta3;
etiqueta2: ;
	{
	printf("%s", "\n");
	}
}
