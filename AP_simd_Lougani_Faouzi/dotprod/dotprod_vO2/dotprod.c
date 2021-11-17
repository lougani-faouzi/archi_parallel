#include<stdio.h>
#include <xmmintrin.h>

double dotprod_1(double *restrict a, double *restrict b, unsigned long long n)
{
 double d = 0.0;
 
	for (unsigned long long i = 0; i < n; i++)
	 d += a[i]*b[i];
	 
 return d;
}

float dotprod_11(float *restrict a, float *restrict b, unsigned long long n)
{
 float d = 0.0;
 
	for (unsigned long long i = 0; i < n; i++)
	 d += a[i]*b[i];
	 
 return d;
}

double dotprod_2(double *restrict a, double *restrict b, unsigned long long n)
{
 double d[5] = {0.0};
 
 	for (unsigned long long i = 0; i < n; i++)
        {
	d[0]+=a[i]*b[i];
	d[1]+=a[i+1]*b[i+1];
	d[2]+=a[i+2]*b[i+2];
	d[3]+=a[i+3]*b[i+3];
	d[4]+=a[i+4]*b[i+4];
        }
 
	return (d[0]+d[1]+d[2]+d[3]+d[4]);
}

float dotprod_22(float *restrict a, float *restrict b, unsigned long long n)
{
 float d[5] = {0.0};
 
 	for (unsigned long long i = 0; i < n; i++)
        {
	d[0]+=a[i]*b[i];
	d[1]+=a[i+1]*b[i+1];
	d[2]+=a[i+2]*b[i+2];
	d[3]+=a[i+3]*b[i+3];
	d[4]+=a[i+4]*b[i+4];
        }
 
	return (d[0]+d[1]+d[2]+d[3]+d[4]);
}


double dotprod_3(double *restrict a, double *restrict b, unsigned long long n)
{
  double d0,d1,d2,d3,d4;
  d0=d1=d2=d3=d4=0.0;
  
  for (unsigned long long i = 0; i < n; i++)
        {
	d0+=a[i]*b[i];
	d1+=a[i]*b[i];
	d2+=a[i]*b[i];
	d3+=a[i]*b[i];
	d4+=a[i]*b[i];
        }
     
     return (d0+d1+d2+d3+d4);

}

float dotprod_4(float *restrict a, float *restrict b, unsigned long long n)
{
   float s=0.0;
   __m128 d1,d2,d3,d4;
   d1=d2=d3=d4=_mm_setzero_ps();
   for (unsigned long long i = 0; i < n; i++)
        { 
              d1=_mm_loadu_ps(a+i);     //charge le tableau non aligné a dans d1
              d2=_mm_loadu_ps(b+i);     //charge le tableau non aligné a dans d2
              d3=_mm_mul_ps(d1,d2);     //effectue la multiplication
              d4=_mm_add_ps(d4,d3);     //effectue l'addition verticale
              
        }
          
         _mm_store_ss(&s,d4);

     return s;
}





int main(){

double v1[5]={1.0,2.0,3.0,4.0,5.0},v2[5]={1.0,2.0,3.0,4.0,5.0};
float v11[5]={1.0,2.0,3.0,4.0,5.0},v22[5]={1.0,2.0,3.0,4.0,5.0};

printf("dotprod_1 result :%lf\n",dotprod_1(v1,v2,5));
printf("dotprod_2 result :%lf\n",dotprod_2(v1,v2,5));


printf("dotprod_11 result :%f\n",dotprod_11(v11,v22,5));
printf("dotprod_22 result :%f\n",dotprod_22(v11,v22,5));

printf("dotprod_3 result :%f\n",dotprod_3(v1,v2,5));
printf("dotprod_4 result :%f\n",dotprod_4(v11,v22,5));

return 0;

}
