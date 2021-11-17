#include<stdio.h>

double dotprod_1(double *restrict a, double *restrict b, unsigned long long n)
{
 double d = 0.0;
 for (unsigned long long i = 0; i < n; i++)
	 d += a[i]*b[i];
   return d;
}


double dotprod_2(double *restrict a, double *restrict b, unsigned long long n)
{
 double D=0;
 double d[3] = {0.0};
 
 	for (unsigned long long i = 0; i < n; i++)
        {
	d[0]+=a[i]*b[i];
	d[1]+=a[i+1]*b[i+1];
	d[2]+=a[i+2]*b[i+2];
	}
       double D=d[0]+d[1]+d[2];
	return D;
}


int main(){

double A[3]={1.0,2.0,3.0};
double B[3]={2.0,3.0,4.0};

double a=dotprod_1(A,B,3);
double b=dotprod_2(A,B,3);

printf("dotprod1 =%lf",a);
printf("dotprod2 =%lf",b);

return 0;
}

return 0;

}
