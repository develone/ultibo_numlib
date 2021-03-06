#include <stdio.h>
#include <stdlib.h>


void main() {
/*
 * Input to dsvd is as follows:
 *   a = mxn matrix to be decomposed, gets overwritten with u
 *   m = row dimension of a
 *   n = column dimension of a
 *   w = returns the vector of singular values of a
 *   v = returns the right orthogonal transformation matrix
 * dsvd(float **a, int m, int n, float *w, float **v)
*/	
int m,n,i,j,result;
m=6;
n=5;

float w[m],*pw;
float v[m][n],*pv[m],**ppv;
float a[m][n],*pa[m],**ppa;
	for(i=0;i<m;i++) {	
		pa[i]=&a[i][0];
		pv[i]=&v[i][0];
		//printf("0x%x 0x%x\n",pa[i],pv[i]);
	}
 
pw=&w;
ppv=&pv;
ppa=&pa;
printf("pa 0x%x ppa 0x%x  \n",pa,ppa);

/*
 * a = { {1.0,2.0,1.0.22.0,11.0},{3.0,4.0,2.0,41.0,21.0},{5.0,6.0,3.0,63.0,33.0},{7.0,8.0,4.0,282.0,242.0},{7.0,8.0,4.0,182.0,142.0}};
*/

a[0][0]=1.0;
a[0][1]=2.0;
a[0][2]=1.0;
a[0][3]=22.0;
a[0][4]=11.0;

a[1][0]=3.0;
a[1][1]=4.0;
a[1][2]=2.0;
a[1][3]=41.0;
a[1][4]=21.0;
 

a[2][0]=5.0;
a[2][1]=6.0;
a[2][2]=3.0;
a[2][3]=63.0;
a[2][4]=33.0;
 

a[3][0]=7.0;
a[3][1]=8.0;
a[3][2]=4.0;
a[3][3]=82.0;
a[3][4]=42.0;
 
a[4][0]=7.0;
a[4][1]=8.0;
a[4][2]=4.0;
a[4][3]=282.0;
a[4][4]=242.0; 

a[5][0]=7.0;
a[5][1]=8.0;
a[5][2]=4.0;
a[5][3]=182.0;
a[5][4]=142.0;
for(i=0;i<m;i++)
	{
	for(j=0;j<n;j++)
	{
		printf("%5.2f ",a[i][j]);
	}
	printf("\n");
}
/*
for(i=0;i<m;i++)
	{
	for(j=0;j<n;j++)
	{
		printf("0x%x 0x%x 0x%x %5.2f %5.2f\n",ppa,pa,&a[i][j],a[i][j],*pa);
		pa++;
	}
	
}
ppa=&pa;
pa=&a;
*/
 

//printf("pa 0x%x ppa 0x%x  \n",pa,ppa);
result = dsvd(ppa,m,n,pw,ppv);
printf("U\n");
result = disp(ppa,m,n);
printf("Singular Values\n");
for(i=0;i<m;i++) printf("%5.2f \n",w[i]);
printf("V\n");
result = disp(ppv,m,n);
}
